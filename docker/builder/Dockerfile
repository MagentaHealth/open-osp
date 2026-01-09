FROM maven:3.9.6-eclipse-temurin-21

# This container builds oscar, and runs mvn tests.
# Install the mariadb-client so we can run tests.
RUN apt-get update \
    && apt-get install -y --no-install-recommends mariadb-client git \
    && apt-get clean
