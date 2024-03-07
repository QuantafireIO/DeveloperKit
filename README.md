# DeveloperKit

## Radiograph VM Console

The RVM Console is a tool that can be used as a friendly way to explore the Schemas and Behaviors that are available on an RVM.

The pattern for selecting an RVM, and a Schema to use with the console is as follows,

```
https://console.quantafire.io/{RVM Id}/{Vendor}/{Schema}
```

So if I wanted to access an RVM with an Id of `065e9de5-d9e1-79bf-8000-6c020c141317`, and I wanted to explore the Abacus Schema (Application) the URL would be

```
https://console.quantafire.io/065e9de5-d9e1-79bf-8000-6c020c141317/Quantafire/Abacus
```

The Console is built using [graphiql](https://github.com/graphql/graphiql) and has Documentation and Explorer views.
![Th RVM Console Documentation view](Images/Console1.png)
![Th RVM Console Explorer view](Images/Console2.png)

## Product Site

The Product site has additional documentation and context about the various Behaviors in each Schema, as well as more detailed information about the RVM, but it is not necessary to get started.

The Product Site can be reached at

```
https://www.quantafire.io/
```

Your username is your first name (lower case) and your password is your phone number (as a string of numbers without any other characters).

## Insomnia Collection

The Insomnia Collection is a collection of RadioGraphQL Behavior examples to help you get going.

They can be found [here](Insomnia_2024-03-07.json)
