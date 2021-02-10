FROM registry.access.redhat.com/ubi8/ubi-minimal

ARG PGSQL_DRIVER_VERSION

# Environment variables
ENV PGSQL_DRIVER_VERSION="${PGSQL_DRIVER_VERSION}"

# Labels
LABEL \
      description="Docker image with PostgreSQL JDBC Driver in a JBoss Module"

COPY extensions /extensions
RUN curl -o postgresql.jar https://jdbc.postgresql.org/download/postgresql-${PGSQL_DRIVER_VERSION}.jar
RUN cp postgresql.jar /extensions/modules/org/postgresql/main


