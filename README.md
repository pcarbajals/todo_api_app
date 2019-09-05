# README

## This Project
A simple TODO application that allows to:
- Add new task
- Edit existing task
- List all tasks
- Tag a task
- Delete existing task

### Database initialization
It is recommended to seed the database (`run db:seed`) before running the Postman collection. seeding the database will ensure the necessary records
and indexes are in place.

## Test Coverage
After running `rspec`, then open `coverage/index.html` in the browser 
TODO with simplecov

## Companion Postman Collection
This project has a companion Postman Collection (not included in the repo). This collection is purely for verification of correct implementation of the requirements of this project. The Postman collection provides API examples, the expected endpoints, payloads and their responses. However, the Rspec in this project is the actual test suite.

Having said the above, the Postman Collection had a bug in its test script. Specifically, the request _Update Task with Tag (Expect Tags)_ comes with the following test script:

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
This project follows the versioning design described in https://chriskottom.com/blog/2017/04/versioning-a-rails-api/
