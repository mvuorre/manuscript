ARG R_VERSION
FROM rocker/verse:${R_VERSION}

## RENV
## Restore packages and install cmdstanr
ARG RENV_VERSION
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"
WORKDIR /project
COPY renv.lock renv.lock
ENV RENV_PATHS_LIBRARY renv/library
RUN R -e 'renv::restore()'