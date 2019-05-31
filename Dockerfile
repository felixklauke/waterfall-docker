################################
### We use a java base image ###
################################
FROM openjdk:11

#####################################
### Maintained by Felix Klauke    ###
### Contact: info@felix-klauke.de ###
#####################################
LABEL maintainer="Felix Klauke <info@felix-klauke.de>"

#################
### Arguments ###
#################
ENV WATERFALL_PATH=/opt/waterfall
ENV WATERFALL_CI_BUILD=lastSuccessfulBuild
ENV WATERFALL_CI_URL=https://papermc.io/ci/job/Waterfall/${WATERFALL_CI_BUILD}/artifact/Waterfall-Proxy/bootstrap/target/Waterfall.jar

##########################
### Download waterfall ###
##########################
ADD ${WATERFALL_CI_URL} $WATERFALL_PATH/server/waterfall.jar

#########################
### Working directory ###
#########################
WORKDIR $WATERFALL_PATH/server

########################
### Obtain starth.sh ###
########################
ADD start.sh .

############
### User ###
############
RUN useradd -ms /bin/bash waterfall && \
    chown waterfall $WATERFALL_PATH -R

USER waterfall

###############
### Volumes ###
###############
VOLUME "${DATA_PATH}"

#############################
### Expose minecraft port ###
#############################
EXPOSE 25565

######################################
### Entrypoint is the start script ###
######################################
ENTRYPOINT bash start.sh
