#!/usr/bin/env bash

# Create symlinks for configs
ln -s $CONFIG_PATH/config.yml $SERVER_PATH/config.yml
ln -s $CONFIG_PATH/locations.yml $SERVER_PATH/locations.yml
ln -s $CONFIG_PATH/waterfall.yml $SERVER_PATH/waterfall.yml

java -jar -DIReallyKnowWhatIAmDoingISwear waterfall.jar
