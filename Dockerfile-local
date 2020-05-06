FROM continuumio/miniconda

MAINTAINER Martin Callaghan "m.callaghan@leeds.ac.uk"

RUN conda config --add channels r
RUN conda config --add channels conda-forge

RUN conda install -y r-base=3.6.3
RUN conda install -y r-essentials

RUN conda install -y openjdk=8.0.192=h14c3975_1003
RUN conda install -y --quiet r-rJava
ENV JAVA_HOME=/opt/conda/bin/java

RUN conda install -c r -y r-rgdal
RUN conda install -c r -y r-rgeos
RUN conda install -c conda-forge r-units

RUN R -e "install.packages(c('tidyverse', 'd3heatmap', 'flexdashboard', 'knitr', 'plotly', 'shiny', 'DT', 'scales', 'datasets', 'genalg', 'leaflet','GISTools','sf', 'ggplot2', 'OpenStreetMap'), dependencies = TRUE, repo='http://cran.r-project.org')"
RUN conda install -y --quiet -c conda-forge/label/cf202003 r-tmap

# make directory and copy Rmarkdown flexdashboard file in it
RUN mkdir -p /bin
COPY LRFReportDash_v6.Rmd    /bin/LRFReportDash_v6.Rmd
COPY data/ bin/data/

# make all app files readable (solves issue when dev in Windows, but building in Ubuntu)
RUN chmod -R 755 /bin

# expose port on Docker container
EXPOSE 3838

# run flexdashboard as localhost and on exposed port in Docker container
CMD ["R", "-e", "rmarkdown::run('/bin/LRFReportDash_v6.Rmd', shiny_args = list(port = 3838, host = '0.0.0.0'))"]

# docker build -t lida-covid-miniconda .
