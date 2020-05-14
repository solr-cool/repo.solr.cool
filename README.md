# repo.solr.cool

> ⚠️ This is a draft of a draft of a ... you get the idea. I'm working on it ;-)

This repository holds the sources for the [repo.solr.cool](https://repo.solr.cool)
[Solr](https://lucene.apache.org/solr/) plugin repository. You find a human 
readable representation at [solr.cool](https://solr.cool).

To use this repository, add it to your Solr installation:

```bash
solr package add-repo solr.cool https://repo.solr.cool
solr package list-available
solr package install AWESOME_PLUGIN
```

## Plugins

This repository acts as a proxy repository. We do not build or maintain the 
plugins ourselves. We distribute them via this repository to provide a easy,
unified access to these awesome Solr plugins.

* Sematext Test Plugin ;-)

## Contributing

Add plugin descriptors in the `plugins/` directory, a single file per plugin.