# OscarEMR DevOps

Deployment Tooling for [OSCAR EMR/EHR](https://oscar-emr.com/), an open-source Electronic Medical Record (EMR) for the Canadian family physicians.

This repo was originally based on [scoophealth (UVIC)](https://github.com/scoophealth/oscar-latest-docker), which was forked from [Bell Eapen's](http://nuchange.ca)'s [Oscar in a Box](https://github.com/dermatologist/oscar-latest-docker).

## Purpose
The goal of this repo is to provide a toolkit for automated Oscar EMR deployment. We want to centralize Oscar configurations for modern DevOps tools. This may help Service Providers who need to automate deployments, Oscar integrators/vendors who need to do testing, and self-hosted users. At this time, we recommend using OscarEMR DevOps to run Oscar quckly and easily for:

* Training
* Continuous integration of Oscar integrations
* Testing

We're not aware of anyone using this system for production usage at this time, and don't recommend it until it's more fully tested and supports some features geared towards production usage.

## Prerequisites
* GIT
* Docker
* docker-compose

## To start a new oscar deployment.

```
git clone git@github.com:countable/oscaremr-devops.git
cd oscaremr-devops
```

This process is only for new deployments. It will not work if you have a run it before in the same folder, because you may have EMR data we don't want to overwrite. For a 2nd deployment, just copy the folder again with a new name. If you want to purge the database and start from scratch, do `docker volume rm oscaremr-devops_mariadb-files` first.

```
./deploy.sh
```

In the future, to bring up Oscar you can just do
```
docker-compose up -d
```

Visit `http://localhost/oscar` in your browser.

## Steps
* Builds the lastest Oscar from source (no development environment setup needed).
* Create Docker containers for Tomcat and MariaDB.
* Bootstraps the database using default BC fixtures (easy to change to ON).

To update
```
docker cp oscar-14.0.0-SNAPSHOT.war tomcat_oscar:/usr/local/tomcat/webapps
```

To shell into the tomcat container
```
docker-compose exec tomcat_oscar bash
```

## Thanks (References)
* [Bell Eapen (McMaster U)](http://nuchange.ca) for [Oscar in a Box](https://github.com/dermatologist/oscar-latest-docker)

