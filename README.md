# Sample OpenShift Template/Mainfest Files

** ocp-sample-application**

This intent is to provide a fully documented working set of OpenShift manifest files for Levvel Consultants.

This example deploys a Wildfly server and exposes it via a route.

By having working template files it will be easier to deploy workloads for clients using commonaly requested features.

Currently included features are :
* [Deployment Configuration](https://docs.openshift.com/container-platform/3.9/dev_guide/deployments/how_deployments_work.html)
* [Service](https://kubernetes.io/docs/concepts/services-networking/service)
* [Route](https://docs.openshift.com/container-platform/3.9/architecture/networking/routes.html)
* [Configuration Map(https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap)
* [Secrets](https://kubernetes.io/docs/concepts/configuration/secret)
* [Limits](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container)
* [Health Check](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes)
* [Readiness Check](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes)
* [Horizontal Pod Autoscaler](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale)

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
