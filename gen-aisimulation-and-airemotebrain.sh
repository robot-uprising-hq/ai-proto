#!/usr/bin/env bash
# This script expects to be run in the root dir of ai-proto repository, and 
# that the other repos are cloned beside it with the default names.

# This script downloads the needed plugins to generate C# protobuf and gRPC code.

LINUX_PLUGINS_FILE=grpc-protoc_linux_x64-1.15.0-dev.tar.gz
MAC_PLUGINS_FILE=grpc-protoc_macos_x64-1.15.0-dev.tar.gz
LINUX_DOWNLOAD_URL=https://packages.grpc.io/archive/2018/07/c01ec499125fab39cd1ec755bbdfdb042e08ac37-d96839c3-557e-4938-91a3-ebc24f49aaf5/protoc/$LINUX_PLUGINS_FILE
MAC_DOWNLOAD_URL=https://packages.grpc.io/archive/2018/07/c01ec499125fab39cd1ec755bbdfdb042e08ac37-d96839c3-557e-4938-91a3-ebc24f49aaf5/protoc/$MAC_PLUGINS_FILE
PLUGINS_FOLDER=plugins
AI_SIMULATOR_CODE_PATH=$PWD/../ai-simulator/Assets/Scripts/Proto/GeneratedCode/
AI_REMOTE_BRAIN_CODE_PATH=$PWD/../ai-remote-brain/Assets/Scripts/Proto/GeneratedCode/

if [ ! -f "./$PLUGINS_FOLDER/protoc" ]; then
    mkdir $PLUGINS_FOLDER
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        URL=$LINUX_DOWNLOAD_URL
        FILE=$LINUX_PLUGINS_FILE
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        URL=$MAC_DOWNLOAD_URL
        FILE=$MAC_PLUGINS_FILE
    fi
    wget $URL
    tar -xzf $FILE --directory $PLUGINS_FOLDER
    mv $FILE $PLUGINS_FOLDER
fi

$PWD/plugins/protoc \
    -I $PWD \
    --plugin=protoc-gen-grpc=$PWD/plugins/grpc_csharp_plugin \
    --csharp_out=$AI_SIMULATOR_CODE_PATH \
    --grpc_out=$AI_SIMULATOR_CODE_PATH \
    $PWD/proto/RobotSystemCommunication.proto

$PWD/plugins/protoc \
    -I $PWD \
    --plugin=protoc-gen-grpc=$PWD/plugins/grpc_csharp_plugin \
    --csharp_out=$AI_REMOTE_BRAIN_CODE_PATH \
    --grpc_out=$AI_REMOTE_BRAIN_CODE_PATH \
    $PWD/proto/RobotSystemCommunication.proto
