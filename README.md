**Prerequisite**
* Docker Desktop installed - [Docker Desktop](https://www.docker.com/products/docker-desktop)

**Setup**
* `docker-compose build`
* `docker-compose run web bundle exec rails db:create db:setup`
* `docker-compose run web yarn`
* `docker-compose up`

**Optional development setup using Visual Studio Code**

1. Open project directory in VS Code
1. Press F1, and select `Remote-Containers: Reopen in Container...`
1. Wait a few minutes as it pulls image down and builds Dev Container Docker image (this should only need to happen once unless you modify the Dockerfile)
    1. You can see progress of the build by clicking `Starting Dev Container (show log): Building image` that appears in bottom right corner
1. Once complete VS Code will connect your running Dev Container and will feel like your doing local development
1. If you would like more information about VS Code Dev Containers check out the [dev container documentation](https://code.visualstudio.com/docs/remote/create-dev-container/?WT.mc_id=AZ-MVP-5003399)

**Activity**

You can create new questions at `http://localhost:3000`.

You can see question and response activity at `http://localhost:3000/dashboard`

You can also view the React version of the dashboard at `http://localhost:3000/react-dashboard`

**Helpful Docker things**
* `docker-compose run web <command>` to run an arbitrary command in the running container named `web`
* `docker ps` to see a list of running containers
* `docker exec -it <container ID> /bin/bash` to get a command prompt in a running container (use `docker ps` to see container IDs)

**A note on testing views**

In an effort to keep this repo simple to set up and run, we have not added any tools for integration testing, such as Capybara. If you do want to make assertions about what is rendered, it may be helpful to use [Rspec's `render_views` macro](https://relishapp.com/rspec/rspec-rails/v/3-9/docs/controller-specs/render-views#render-views-on-and-off-in-nested-groups).
