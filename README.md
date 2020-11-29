# rails-graphql-sample

## Example

You can try them on `localhost:3000/graphiql`.

### Query
- posts

```graphql
{
  posts(first: 5) {
    edges {
      cursor
      node {
        id
        title
        comments {
          id
          content
        }
      }
    }
    pageInfo {
      endCursor
      hasNextPage
      startCursor
      hasPreviousPage
    }
  }
}
```

```
=> { "data": {
      "posts": {
        "edges": [
          {
            "cursor": "MTQ",
            "node": {
              "id": "209",
              "title": "eveniet totam molestias",
              "comments": [
                {
                  "id": "38",
                  "content": "Odit aut amet aspernatur."
                },
                {
                  "id": "39",
                  "content": "Sapiente fugiat laboriosam eos."
                },
                {
                  "id": "43",
                  "content": "Sed quae est optio."
                }
              ]
            }
          },
          {
            "cursor": "MTU",
            "node": {
              "id": "208",
              "title": "dolorem doloremque ea",
              "comments": [
                {
                  "id": "17",
                  "content": "Quasi debitis recusandae sed."
                },
                {
                  "id": "22",
                  "content": "Quam culpa ut sit."
                }
              ]
            }
          },
          {
            "cursor": "MTY",
            "node": {
              "id": "207",
              "title": "inventore expedita eum",
              "comments": [
                {
                  "id": "3",
                  "content": "Incidunt numquam eius accusantium."
                },
                {
                  "id": "13",
                  "content": "Sapiente consectetur sed iusto."
                },
                {
                  "id": "34",
                  "content": "Perspiciatis dolorem nam odio."
                },
                {
                  "id": "40",
                  "content": "Nihil qui nam ullam."
                },
                {
                  "id": "42",
                  "content": "Ipsa amet dignissimos odio."
                },
                {
                  "id": "46",
                  "content": "Laboriosam et dolorem vel."
                }
              ]
            }
          },
          {
            "cursor": "MTc",
            "node": {
              "id": "206",
              "title": "hic quasi et",
              "comments": [
                {
                  "id": "18",
                  "content": "Omnis consequatur architecto eligendi."
                },
                {
                  "id": "31",
                  "content": "Deleniti voluptate ab a."
                },
                {
                  "id": "41",
                  "content": "Rerum vel laborum quia."
                },
                {
                  "id": "48",
                  "content": "Non dolor doloribus autem."
                },
                {
                  "id": "49",
                  "content": "Temporibus saepe provident ut."
                },
                {
                  "id": "50",
                  "content": "Ducimus error perspiciatis recusandae."
                }
              ]
            }
          },
          {
            "cursor": "MTg",
            "node": {
              "id": "205",
              "title": "laborum enim voluptate",
              "comments": [
                {
                  "id": "1",
                  "content": "Eum veniam natus molestiae."
                },
                {
                  "id": "5",
                  "content": "Est id aliquam voluptates."
                },
                {
                  "id": "19",
                  "content": "Eos explicabo ipsa deserunt."
                },
                {
                  "id": "30",
                  "content": "Quod voluptatem saepe temporibus."
                }
              ]
            }
          }
        ],
        "pageInfo": {
          "endCursor": "MTg",
          "hasNextPage": true,
          "startCursor": "MTQ",
          "hasPreviousPage": true
        }
      }
    }
  }
```

then you can obtain the next page via `posts(first: 5, after: "MTg") { ... }`.

The actual query is like this:

```
  Post Load (5.1ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" DESC LIMIT $1 OFFSET $2  [["LIMIT", 5], ["OFFSET", 13]]
  ↳ app/controllers/graphql_controller.rb:15:in `execute'
   (4.9ms)  SELECT COUNT(*) FROM (SELECT 1 AS one FROM "posts" LIMIT $1 OFFSET $2) subquery_for_count  [["LIMIT", 6], ["OFFSET", 13]]
  ↳ app/controllers/graphql_controller.rb:15:in `execute'
  Comment Load (3.6ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" IN ($1, $2, $3, $4, $5)  [["post_id", 209], ["post_id", 208], ["post_id", 207], ["post_id", 206], ["post_id", 205]]
  ↳ app/graphql/loaders/association_loader.rb:39:in `preload_association'
Completed 200 OK in 122ms (Views: 2.1ms | ActiveRecord: 51.3ms | Allocations: 17148)
```


- post

```
{
  post(id: 205) {
    id
    comments {
      id
      content
    }
  }
}
```

### Mutation
- createPost

```graphql
{
  mutation {
   createPost(
     input:{
       title: "title1"
       description: "description1"
     }
   ){
     post {
       id
       title
       description
     }
   }
 }
}
```

