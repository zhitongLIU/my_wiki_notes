# Mongo

Create User
```
db.createUser({
  user: "test_user",
  pwd: "test_user",
  roles: [ "readWrite", "dbAdmin" ]
});
```

switch db
```
use db_name
```

# Collection
creagte collection
```
db.createCollection('customers');
```

list all collections
```
show collections
```

insert record
```
db.customers.insert({first_name: "John", last_name: "Doe"});
```

find all records of this collection
```
db.customers.find();
```

update(replace) record
```
db.customers.update({first_name: "John", last_name: "Doe", gender: "male"}})
```

update(enhance) record
```
db.customers.update({first_name: "John"}, {$set:{gender: "male"}})
```

increment args
```
db.customers.update({first_name: "John"}, {$set:{age: 10}})
db.customers.update({first_name: "John"}, {$inc:{age: 5}})
```

unset field
```
db.customers.update({first_name: "John"}, { $unset:{age:1} } )
```
> due to JSON/BSON syntax. There has to be a value, but it doesn't matter what the value is. In the MondoDB documentation they typically use 1.

