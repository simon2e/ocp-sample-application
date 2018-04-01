**Sample OpenShift Template/Mainfest Files**

# ocp-sample-application

This intent is to provide a fully documented working set of OpenShift manifest files for Levvel Consultants.

This example deploys a Wildfly server and exposes it via a route.

By having working template files it will be easier to deploy workloads for clients using commonaly requested features.

Currently included features are :
* Deployment Configuration
* Service
* Route
* Configuration Map
* Secrets
* Resource Management
* Health Check
* Readiness Check
* Horizontal Pod Autoscaler

Please feel free to contribute and re-use.

If you contribute please try to fully document to asssit consultants in understanding the features being added.

To deploy on minishift just:

1. Clone the project
2. minishift start
3. oc login -u developer
4. oc new-project pr-sample-application --description="Sample Application Project" --display-name="Sample Application Project"
5. chmod +x ocp-sample-install.sh
6. ./ocp-sample-install.sh
7. oc get all
