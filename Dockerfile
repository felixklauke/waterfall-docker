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
ARG WATERFALL_VERSION=1.14
ARG WATERFALL_DOWNLOAD_URL=https://papermc.io/api/v1/waterfall/${WATERFALL_VERSION}/latest/download

###################
### Environment ###
###################
ENV WATERFALL_PATH=/opt/waterfall

ENV SERVER_PATH=${WATERFALL_PATH}/server
ENV CONFIG_PATH=${WATERFALL_PATH}/config

ENV JAVA_ARGS="-DIReallyKnowWhatIAmDoingISwear"

##########################
### Download waterfall ###
##########################
ADD ${WATERFALL_DOWNLOAD_URL} ${SERVER_PATH}/waterfall.jar

#########################
### Working directory ###
#########################
WORKDIR ${SERVER_PATH}

########################
### Obtain starth.sh ###
########################
ADD scripts/docker-entrypoint.sh .

############
### User ###
############
RUN addgroup waterfall && \
    useradd -ms /bin/bash waterfall -g waterfall -d ${SERVER_PATH} && \
    mkdir ${CONFIG_PATH} ${SERVER_PATH}/logs ${SERVER_PATH}/plugins && \
    chown waterfall $WATERFALL_PATH -R

USER waterfall

###################
### Preparation ###
###################
# Create symlinks for configs
RUN ln -s $CONFIG_PATH/config.yml $SERVER_PATH/config.yml && \
  ln -s $CONFIG_PATH/locations.yml $SERVER_PATH/locations.yml && \
  ln -s $CONFIG_PATH/waterfall.yml $SERVER_PATH/waterfall.yml

###############
### Volumes ###
###############
VOLUME "${SERVER_PATH}/logs"
VOLUME "${SERVER_PATH}/plugins"
VOLUME "${CONFIG_PATH}"

#############################
### Expose minecraft port ###
#############################
EXPOSE 25565

######################################
### Entrypoint is the start script ###
######################################
ENTRYPOINT [ "./docker-entrypoint.sh" ]

CMD [ "serve" ]
