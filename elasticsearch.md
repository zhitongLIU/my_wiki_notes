# ElasticSearch
Ref: https://www.youtube.com/watch?v=UPkqFvjN-yI

Ref: https://www.youtube.com/watch?v=gzzaVPIxHJ4&index=4&list=PL1hZ8hQV4q1HHQsgbtFP7Cbm2jH7-KaPO

## Index
- [Query](#query)
- [DSL - Domain Specific Language](#dsl)
- [Relevent](#relevent)
- [Compare to relation database](#compare-to-relation-database)

## Query

- [create index](#create-index)
- [create document](#create-document)
- [search](#search)
- [mget](#mget)
- [delete](#delete)
- [version](#version)

####create index
put http://localhost:9200/{index_name}

####create document
```
post localhost:9200/{index_name}/{document_name}/1
```
body
```json
{
	"first_name": "toto",
	"last_name": "titi",
	"age": 30,
	"about": "blabla",
	"intressts": ["video games", "sports"]
}
```
results
```
{
    "_index": "zt-test",
    "_type": "employee",
    "_id": "1",
    "_version": 1,
    "result": "created",
    "_shards": {
        "total": 2, # first is create document, second is create document
        "successful": 1,
        "failed": 0
    },
    "created": true
}
```
use put to create or update
```
put localhost:9200/{index_name}/{document_name}/2?_create
put localhost:9200/{index_name}/{document_name}/2?os_type=create
```

####search
pretty return with headers
```
get localhost:9200/{index_name}/{document_name}/2?pretty
```
only return some of attributes
```
get localhost:9200/{index_name}/{document_name}/2?_source=first_name,last_name&pretty
```
get all(defaults return top 10)
```
get localhost:9200/{index_name}/{document_name}/_search
get localhost:9200/{index_name}/{document_name}/_search?q=age:30
```

searching in domain
```
get localhost:9200/_all/_query?q=a:b
```

####mget: multiple get
```
post localhost:9200/_mget
```
body
```
{
	"docs": [
		{"_index": "{index_name}", "_type": "{document_name1}", "_id": 1},
		{"_index": "{index_name}", "_type": "{document_name2}", "_id": 1}
		]
}
```

####delete
*when elastic-search update/delete document, it does not drop old document directely, it will mark as Obsolete
and clean when usage is low. like java-vm*

```
delete localhost:9200/{index_name}/{document_name}/1
delete localhost:9200/{index_name}/{document_name}/_search
{
 "query": {
   "term": {
     "name": "blabla"
   }
 }
}
```

####version
we could add `?version=n` after all requete to search/create document in a specific version
```
get localhost:9200/{index_name}/{document_name}/1?version=3
put localhost:9200/{index_name}/{document_name}/2?version=3
```

## DSL
- [term](#term)
- [match](#match)
- [match_phrase](#match_phrase)
- [bool query](#bool-query)

####term

exact match of word
```
document
{
  "city": "Paris"
}
```
match
```
"query": {
  "term": {
    "city": "Paris"
  }
}
```

#### match

match a word in phrase
```
document
{
  "city": "i love Paris in France"
}
```
match
```
"query": {
  "match": {
    "city": "Paris"
  }
}
```

#### match_phrase

match a phrase in phrase, does not match word order, but spells, and can add slop
```
document
{
  "city": "i love Paris in France"
}
```
match
```
"query": {
  "match_phrase": {
    "city": "Paris France"
  }
}
```
fail
```
"query": {
  "match_phrase": {
    "city": "France Paris"
  }
}
```
match
```
"query": {
  "match_phrase": {
    "city": "Paris France", "slop": 1
  }
}
```

#### Bool Query
- must => and
- should => or
- must_not => not
```
document
{
  {
    "city": "Paris",
    "comment": "i love Paris in France"
  }
}
```
match
```
"query": {
  "bool": {
     "must": [{
        "term": {
          "city": "Paris"
      }],
      "should": [{
        "match_phrase": {
          "comment": {
            "query": "love france",
            "slop": 1,
            "boost": 2
          }
        }
      }]
    }
}
```

--------

### Relevent

TF*IDF
- TF:
Term Frequency

- IDF: => 1/DF:
Inverse Document Frequency

the searching word appear time in entire set of documents

example:
- query: `the diddle`
- document:
```
hey diddle diddle the cat and the fiddle
```
Score = TF(the) * IDF(the) + TF(diddle) * ITF(diddle)

```
TF(the) = 2
IDF(the) = 0ish # as the is so comment

TF(diddle) = 2
IDF(diddle) = 1/7 # 7 time only in all document recorded
```

Score = 0.28

--------

## Step analysis take by search engine
* Getting Data in Analysis

1. Tokenization(english word sperated by space)
2. lower casing
3. stop wording(remove common word)
4. stemming(remove conjugrasion, take word root)

* Getting Data in Indexing

"token" is in document 1, 34, 88
```
{
'token': [1, 34, 88]
'kento': [2, 34, 78]
}
```

* Getting Data in Boolean Query

`token` and `kento` : [34]
`token` or `kento` : [1, 34, 78, 88]


* Getting Data out: Sorting by relevance

- Initialize Priority Queue
- for each matching doc
  - calculate TF*IDF score
  - add to Priority Queue
  - pop off lowest scoring doc
- Return contents of Priority

* Getting Data out: Aggregation

- Initialize Aggregatior(sum, average, count, etc)
- for each matching doc
  - Retrieve "intresting" information (ex.price)
  - add to Aggregator
- Return Results from Aggregator

--------

## Compare to relation database
| Relation Database | ElasticSearch   |
| :-------------:   | :-------------: |
| database          | index           |
| table             | type            |
| row               | document        |
| column            | field           |
