
# setup to run r-base docker

BUILDID="build-$RANDOM"
INSTANCE="r-base"
docker pull r-base

# run docker
docker run --name $BUILDID -dit $INSTANCE
docker exec -it $BUILDID bash -l

# Go into sudo
#su

# Run a lot of commands
apt-get update
apt-get install git

cd /home/docker
git clone https://github.com/Helseatlas/shinymap.git
cd shinymap

# Install packages from DESCRIPTION file
Rscript -e "install.packages(c('shiny', 'shinythemes', 'rsconnect', 'ggplot2', 'leaflet', 'dplyr', 'ggthemes', 'tibble', 'maps'))"
Rscript -e "install.packages('testthat')"

# Build and test package
R CMD build .
R CMD check *tar.gz
