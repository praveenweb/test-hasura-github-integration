# Hasura Github Integration Starter Kit

Hasura's github integration automatically deploys your github projects using Hasura Cloud, providing automatic updates of your metadata and database migrations from your repo.

## Moving from local dev to Hasura Cloud

## Moving from Hasura Cloud to local dev

Let's say you started developing your app by using a Hasura Cloud project. Now you want to move the current database schema and metadata on the Cloud to a local development setup.

The first step is to initialise a hasura project locally.

```bash
hasura init <project-name>
```

Once a project directory is created, we need to initialise the migration files, pulling the database schema from the cloud project.

```bash
hasura migrate create init --sql-from-server --endpoint <hasura-project-url> --admin-secret <admin-secret> --skip-execution
```

It is important to add the `skip-execution` flag since that marks the migration as applied. This is to ensure that the schema that is already created on Hasura Cloud project is not getting applied again, which would end in an error.

Finally, we need to export metadata:

```bash
hasura metadata export --endpoint <hasura-project-url> --admin-secret <admin-secret> 
```

We have successfully synced our state from Cloud to a local dev environment. As you make changes to the schema and metadata and push it to a dev branch, you should be able to sync those changes to the Cloud project again.

Start local development of the project using the Hasura CLI

```bash
hasura console
```

This will use the default localhost endpoint in `config.yaml`. You can now use the console to modify schema and metadata.

### Configure git deployment

The next step is to configure git deployment on the Cloud project.

Head to [https://cloud.hasura.io](https://cloud.hasura.io), select the cloud project and go to `Git Deployment` tab on the navigation menu.

![Git Deployment](./assets/setup-git-deployment.png)

Now Sign in with Github to configure the repo for this project.

![Sign in with Github](./assets/sign-in-with-github.png)

After selecting the repo/branch, choose the deployment mode. There are two modes possible:

- Automatic: Deployment is triggered automatically when git push happens to the configured repo/branch.
- Manual: Deployment can only be manually triggered from the dashboard.

![Git Deployment Configured](./assets/git-deployment-final.png)

Now, go back to your git repo directory. Assuming you have made some schema or metadata changes via the Console, you can now just git push to trigger a deployment.

```bash
git add .
git commit -m "added tables"
git push origin <configured-branch>
```

Thats it! The migrations and metadata changes will be applied automatically. In case you have selected a manual deployment, you can head to Cloud dashboard and choose to manually trigger a deployment.
