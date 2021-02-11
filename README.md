# postresql-driver-jboss-module
Docker image providing PostgreSQL JDBC Driver in a JBoss Module

This image can be used to inject a PostgreSQL JDBC Driver in a application image built with WildFly S2I

```
build:
  mode: s2i
  uri: https://github.com/jmesnil/quickstart.git
  ref: kitchensink_postgresql
  images:
    - from:
        kind: DockerImage
        name: quay.io/jmesnil/postgresql-driver-jboss-module:latest
      paths:
        - sourcePath: /extensions/.
          destinationDir: ./extensions/extras
  env:
  - name: ARTIFACT_DIR
    value: kitchensink/target
  - name: MAVEN_ARGS_APPEND
    value: -am -pl kitchensink -Dversion.server.bom=22.0.0.Final -Dversion.microprofile.bom=22.0.0.Final
  - name: MAVEN_OPTS
    value: '-XX:MetaspaceSize=96m -XX:MaxMetaspaceSize=256m'
  - name: SCRIPT_DEBUG
    value: "true"
deploy:
  replicas: 2
```