#!/bin/bash
set -e
gcloud compute instances create reddit-vm \
--zone=europe-north1-a \
--machine-type=f1-micro \
--image-family reddit-full \
--tags reddit-app
