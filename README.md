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
1. Build the repository locally
   ```
   $ ./build.sh
   ```
1. Use [bats](https://github.com/bats-core/bats-core) to execute 
   the tests:
   ```
   $ bats -t test
   ```