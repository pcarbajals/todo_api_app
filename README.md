# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

## Testing
* Uses `rspec`
* Uses [`database_cleaner`](https://github.com/DatabaseCleaner/database_cleaner) for ensuring a clean state for testing.
* Uses [`factory_bot`](https://github.com/thoughtbot/factory_bot) for replacing fixtures.

### Bug in Postman Collection
One of the requests in the provided Postman Collection had a bug in its test script.

Specifically, the request _Update Task with Tag (Expect Tags)_ comes with the following test script:

```javascript
 var jsonData = JSON.parse(responseBody);
 tests["Created Title check"] = jsonData.data.attributes.title === "Updated Task Title";
 tests["ID exists check"] = jsonData.data.id  === "2";
 tests["Added Tags check"] = jsonData.data[0].relationships.tags.data[0].id === "2";
 tests["Added Tags check"] = jsonData.data[0].relationships.tags.data[1].id === "3";
```

Its example response has the following structure:

```json
{
     "data": {
         "id": "2",
         "type": "tasks",
         "attributes": {
             "title": "Updated Task Title"
         },
         "relationships": {
             "tags": {
                 "data": [
                     {
                         "id": "2",
                         "type": "tags"
                     },
                     {
                         "id": "3",
                         "type": "tags"
                     }
                 ]
             }
         }
     },
     "included": [
         {
             "id": "2",
             "type": "tags",
             "attributes": {
                 "title": "Urgent"
             },
             "relationships": {
                 "tasks": {
                     "data": [
                         {
                             "id": "2",
                             "type": "tasks"
                         }
                     ]
                 }
             }
         },
         {
             "id": "3",
             "type": "tags",
             "attributes": {
                 "title": "Home"
             },
             "relationships": {
                 "tasks": {
                     "data": [
                         {
                             "id": "2",
                             "type": "tasks"
                         }
                     ]
                 }
             }
         }
     ]
 }
```

The element `data` in the example response is a hash, however the test script uses the same element as an array.

Since this example response is consistent with the example responses from other requests, removing the array indexing from the element `data` in the test script will fix the bug in the collection:

```javascript
 var jsonData = JSON.parse(responseBody);
 tests["Created Title check"] = jsonData.data.attributes.title === "Updated Task Title";
 tests["ID exists check"] = jsonData.data.id  === "2";
 tests["Added Tags check"] = jsonData.data.relationships.tags.data[0].id === "2";
 tests["Added Tags check"] = jsonData.data.relationships.tags.data[1].id === "3";
```

## Versioning
The versioning design followed by this assignment is described in https://chriskottom.com/blog/2017/04/versioning-a-rails-api/
