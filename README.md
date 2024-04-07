# Methodology

Key concepts of this repository
- Maintained according to Github Flow
- Each research is a separate notebook
- Each research in a different branch

# Docker

Build docker
```bash
docker-compose build <name>
```

Run docker
```bash
docker run <name>
```

Lock packages for prod
```bash
pdm lock --prod -L pdm.prod.lock
```
Lock packages for dev
```bash
pdm lock
```
Lock packages for test
```bash
pdm lock -G "test,dev" -L pdm.test.lock
```

Lock packages for jupyter notebooks
```bash
pdm lock -G "jupyter,dev" -L pdm.jupyter.lock
```

<name>:
- app
run docker
- app-dev
run docker for developer, we go inside the docker image
- jupyter
run docker to use jupyter in it
- test
run tests
