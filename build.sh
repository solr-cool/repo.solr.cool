#!/bin/bash
# clean build
rm -rf target
mkdir -p target

# iterate plugin definitions
for plugin in ./plugins/*.json; do
  echo "---"
  echo "Processing ${plugin}"
  file=$(basename $plugin)
  name=${file%.json}

  # prepare plugin descriptor
  cp ${plugin} target/${name}.json

  # find jars to sign
  jars=$(cat ${plugin} | jq -r '.versions[].artifacts[].url')

  # iterate jars
  for jar in ${jars}; do

    # download
    echo "Downloading ${jar}"
    curl -sfLo target/${name}.jar ${jar}

    # TODO verify download
    #curl -sfLo target/plugin.jar.sha1 ${jar}.sha1

    # sign jars
    echo -n "Signing ... "
    signature=$(openssl dgst -sha1 -sign solr.cool.pem target/${name}.jar | openssl enc -base64 | tr -d \\n | sed)
    echo ${signature}

    # append signature in plugin descriptor
    jq "(.versions[].artifacts[]|select(.url==\"${jar}\")) += {sig: \"${signature}\"}" target/${name}.json | sponge target/${name}.json
  done
done

# publish repository definition
jq -s '.' target/*.json > docs/repository.json