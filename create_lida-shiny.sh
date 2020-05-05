#Start with
#conda create -n lida-shiny2 r-base=3.6.3 r-essentials

conda install --quiet r-flexdashboard=0.5.1.1
conda install --quiet r-sf=0.9-0
#conda install r-tmap=2.3
conda install --quiet -c conda-forge/label/cf202003 r-tmap

conda install --quiet r-rJava #what versio of java have I got
conda install --quiet -c conda-forge/label/main r-dt
conda install --quiet r-genalg

# Install R packages
#R -e "install.packages('OpenStreetMap', dependencies = TRUE, repo='http://cran.r-project.org')"

R -e "install.packages('GISTools', dependencies = TRUE, repo='http://cran.r-project.org')"

#More updates
conda update --quiet r-sf
conda install --quiet r-rgdal
conda install --quiet r-rgeos

R -e "install.packages('OpenStreetMap', dependencies = TRUE, repo='http://cran.r-project.org')"

#Finally:
#R -e "rmarkdown::run('LRFReportDash_v6.Rmd', shiny_args = list(port = 3838, host = '0.0.0.0'))"