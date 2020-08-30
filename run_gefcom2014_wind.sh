#!/bin/bash

# Select params.json file
PARMS="./params/params_competition_gefcom2014_wind_competition.json"

# Extract gefcom2014 data
python -W ignore ./preprocess/extract_gefcom2014_wind_solar_load.py wind

# Preprocess gefcom2014 data
python -W ignore ./preprocess/preprocess_gefcom2014_wind_example.py $PARMS

# Train model
python -W ignore ./main.py $PARMS

# Generate plots
python -W ignore ./plots/generate_plots_wind.py