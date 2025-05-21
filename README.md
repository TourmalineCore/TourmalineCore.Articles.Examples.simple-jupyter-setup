# TourmalineCore.Articles.Examples.simple-jupyter-setup
An example of a simple Jupyter setup in Docker and poetry-environment.

- [TourmalineCore.Articles.Examples.simple-jupyter-setup](#tourmalinecorearticlesexamplessimple-jupyter-setup)
    + [JupyterLab in Docker](#jupyterlab-in-docker)
      - [Prerequisites](#prerequisites)
      - [Launch](#launch)
      - [Resources limits](#resources-limits)
    + [Jupyter in Poetry Env](#jupyter-in-poetry-env)
      - [Prerequisites](#prerequisites-1)
      - [Launch](#launch-1)

### JupyterLab in Docker

#### Prerequisites
1. Installed [Docker](https://www.docker.com/)

#### Launch

To launch the JupyterLab in Docker:

1. Execute in the project terminal:
    ```bash
    docker compose up --build -d project-name-notebooks
    ```
    > If there is no GPU on the device, then the container will not be able to start. In this case, remove the `reservations` block from docker-compose.yml.

2. Go to the following url in the browser: http://localhost:4321/lab

All files created in JupyterLab in Docker are mounted to this repository and will be available in this project.

#### Resources limits
The limits on the resources consumed by the container are defined in `docker-compose.yml` with:

```yml
deploy:
    resources:
    limits:
        cpus: '7'
        memory: 12G
```

### Jupyter in Poetry Env
>Note: if you want to use Apple-Silicon chip's MPS, only this option is available 
(you can't use the MPS from Docker, most popular [issue](https://github.com/pytorch/pytorch/issues/81224) on this).

#### Prerequisites
1. Installed [Poetry](https://python-poetry.org/)
2. Installed Python required version

#### Launch
You can run both JupyterLab and Jupyter Notebook.

1. Generate poetry environment using the command in the project terminal:
    ```bash
    poetry install
    ```

2. To start Jupyter Lab, execute in the project terminal:
    ```bash
    poetry run jupyter lab
    ```

    To start Jupyter Notebook, execute in the project terminal:
    ```bash
    poetry run jupyter notebook
    ```

3. You will either be automatically redirected to the Jupyter development environment in your browser, 
   or you can use the URL that will be offered in the terminal in a format like this:
    ```bash
    Or copy and paste one of these URLs:
            http://localhost:8891/lab?token=a79552ed77fb7001e181e977d4f4c4f1bd12afb8f58b1742
            http://127.0.0.1:8891/lab?token=a79552ed77fb7001e181e977d4f4c4f1bd12afb8f58b1742
    ```
