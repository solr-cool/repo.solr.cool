# solr.cool plugin repository

This is a draft of a draft of a ... you get the idea. I'm working on it ;-)

## Testing

Fire up the docker compose and exec into the Solr instance.

```bash
$ solr package add-repo solr.cool http://repo:8080

Found 1 Solr nodes:

Solr process 10 running on port 8983
Added repository: solr.cool
$ solr package list-available

Found 1 Solr nodes:

Solr process 10 running on port 8983
Available packages:
-----
sematext-example 		Example plugin created for blog post
	Version: 1.0.0

$ solr package install sematext-example:1.0.0

Found 1 Solr nodes:

Solr process 10 running on port 8983
Posting manifest...
Posting artifacts...
Executing Package API to register this package...
Response: {"responseHeader":{
    "status":0,
    "QTime":87}}
sematext-example installed.
```