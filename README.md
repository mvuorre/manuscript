APA manuscript template repo.

- papaja::apa6_pdf
  - Default YAML front matter
- docker
  - tidyverse


## Docker

todo

Build image
Change `manuscript` to whatever you want the image to be called. Specify versions for R and renv.

```bash
docker build \
    --build-arg R_VERSION=4.2.2 \
    --build-arg RENV_VERSION=0.16.0 \
    -t manuscript .
```

Compile manuscript in container.
Change `NAME` and adjust `MAX_CORES` for your machine.

```bash
docker run \
    --rm \
    -v "$(pwd):/home/" \
    -v "/home/renv/library" \
    -e MAX_CORES=1 \
    manuscript \
    R -e 'setwd("/home"); renv::restore(prompt = FALSE); rmarkdown::render("ms.Rmd", "all")'
```