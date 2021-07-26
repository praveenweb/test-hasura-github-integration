# Hasura Github Integration Starter Kit

Hasura's github integration automatically deploys your github projects using Hasura Cloud, providing automatic updates of your metadata and database migrations from your repo.

## Moving from local dev to staging

## Moving from staging to prod

## Moving from Hasura Cloud to local dev

Let's say you started developing your app by using a Hasura Cloud project. Now you want to move the current database schema and metadata on the Cloud to a local development setup.

The first step is to initialise a hasura project locally.

```bash
hasura init
```

We have successfully synced our state from Cloud to a local dev environment. As you make changes to the schema and metadata and push it to a dev branch, you should be able to sync those changes to the Cloud project again.

### Configure git deployment


