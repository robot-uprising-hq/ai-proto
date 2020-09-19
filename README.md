# AI Proto

Read the summary of Micro Invaders from [here](https://github.com/robot-uprising-hq/ai-guide).

# Installation

## Prequisites

- python3 (3.6.1 or higher)

## Downloading the files

Download and install this repo and its Python dependencies using the installation scripts in [AI Guide repo](https://github.com/robot-uprising-hq/ai-guide)


# Using this repo
The scripts of this repo generate the protobuf and gRPC code for the different sub projects from the `.proto` file in the `proto`-folder.

## AI Backend Connector
Run `./gen-backend.sh` to generate and place the generated code to the AI Backend Connector.

## AI Robot
Run `./gen-robot.sh` to generate and place the generated code to the AI Robot.

## AI Simulation and AI Remote Brain
Run `./gen-aisimulation-and-airemotebrain.sh` to generate and place the generated code to the AI Simulation and the AI Remote Brain.
