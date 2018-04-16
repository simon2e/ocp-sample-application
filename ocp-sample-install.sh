###########################################################
## Sample Application Main Install Sequence              ##
###########################################################

#!/bash/bin

# If the project does not exist create it with:
# oc login -u developer
# oc new-project pr-sample-application --description="Sample Application Project" --display-name="Sample Application Project"

# Change to the correct project environment

oc project pr-sample-application

# Clean up everything
oc delete all --all
oc delete cm --all
oc delete secrets scr-env-sample-app-secret

sleep 10

###########################################################
# Create Route                                           ##
###########################################################

oc apply -f ocp-sample-route.yml

###########################################################
# Create Persistent Volumes                               #
###########################################################

# TBD

###########################################################
# Create ConfigMaps                                      ##
###########################################################

oc apply -f ocp-sample-configmap.yml

###########################################################
# Create Secrets                                         ##
###########################################################

oc apply -f ocp-sample-secret.yml

###########################################################
# Create Service                                         ##
###########################################################

oc apply -f ocp-sample-service.yml

###########################################################
## Create Deployment Configuration                       ##
###########################################################

# oc apply -f ocp-sample-deployment-config.yaml

oc apply -f ocp-sample-deployment-config.yaml --record

# You can append --record to this command to record the current command in the annotations of the created or updated resource.
# This is useful for future review, such as investigating which commands were executed in each Deployment revision.
# oc rollout history deploymentconfigs dc-sample-app

###########################################################
## End of Script                                         ##
###########################################################

