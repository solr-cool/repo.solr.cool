# repo.solr.cool

[![Travis Build Status](https://travis-ci.org/solr-extensions/repo.solr.cool.svg?branch=master)](https://travis-ci.org/github/solr-extensions/repo.solr.cool)

This repository holds the sources for the [repo.solr.cool](https://repo.solr.cool)
[Solr](https://lucene.apache.org/solr/) plugin repository. You find a human 
readable representation at [solr.cool](https://solr.cool).

To use this repository, add it to your Solr installation:

```bash
solr package add-repo solr.cool https://repo.solr.cool
solr package list-available
solr package install AWESOME_PLUGIN_NAME
```

## Plugins

This repository acts as a proxy repository. We do not build or maintain the 
plugins ourselves. We distribute them via this repository to provide a easy,
unified access to these awesome Solr plugins.

* Sematext Test Plugin ;-)

## Contributing

1. [File a issue in this repository](https://github.com/solr-extensions/repo.solr.cool/issues). 
   This helps us to keep track of new and cool Solr plugins
1. Add the plugin descriptor in the `plugins/` directory, 
   a single file per plugin. If you have multiple versions
   and/or Solr target versions, add them to the file as well.

### Testing your contribution

This is a guide to test your contribution.

> There is a [bats](https://github.com/bats-core/bats-core) test suite
> in place that checks availability of all available plugins and installs
> and deploys them into a Solr test instance.

Build the repository locally and launch a Solr/Zookeeper/
Repository ensemble in Docker. You can access the Solr admin
interface on [localhost:8983](http://localhost:8983/solr). The
local repository is available at `repo:8080` from inside the Docker
network.

```
$ ./build.sh
$ docker-compose -f test/docker-compose.yaml up -d
```

Add the local repository to the Solr test instance.
```
$ docker exec -it solr solr package add-repo solr.cool http://repo:8080
```

Install your plugin (we use the `thymeleaf` plugin in this case)

```
$ docker exec -it solr solr package install thymeleaf
```

To verify we can deploy the plugin into a existing collection, we
create the example _films_ collection and index some data.

```
$ docker exec -it solr solr create -c films
$ docker exec -it solr post -c films example/films/films.json 
```

Afterwards we deploy the `thymeleaf` plugin into the created
_films_ collection

```
$ docker exec -it solr solr package deploy thymeleaf -collections films
```