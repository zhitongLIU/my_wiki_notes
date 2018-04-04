# Advanced Deployment Strategies
https://medium.com/@nithinmallya4/blue-green-deployments-for-a-rails-app-in-google-container-engine-gke-49ddcc1b002

## Blue-Green Deployment
Use a blue-green deployment when you want to test a new version of your application in a production environment before moving traffic to it.

you will need to have an application that supports N-1 compatibility if you share a database, or implement a live data migration between your database, store, or disk if you choose to create two copies of your data layer.


## A/B Deployment

A/B deployments generally imply running two (or more) versions of the application code or application configuration at the same time for testing or experimentation purposes.

```
user
|
v
proxy -> /service/B
|
V
/service/A
```
proxy redirect certain users from A -> B
A is old version, B is new version

## A/B/C Deployment

A/B/C

active beta complete
A is old service
B contains old and new service
C is only new service
