#!/usr/bin/env bash
# This script expects to be run in the root dir of ai-proto repository, and 
# that the other repos are cloned beside it with the default names.
python -m grpc_tools.protoc -I $PWD --nanopb_out $PWD/../ai-robot/components/udpcomm $PWD/proto/RobotSystemCommunication.proto