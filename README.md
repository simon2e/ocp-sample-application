# Sample OpenShift Template/Mainfest Files

## Summary

This intent is to provide a fully documented and working set of OpenShift manifest files for Levvel Consultants.

This example deploys a Wildfly server and exposes it via a route on minishift.

By having a set of working template files it will be easier to deploy workloads for clients using common requested features.

## Useful Links

[Why Kubernetes](https://cloud.google.com/kubernetes-engine/kubernetes-comic)

[Kubernetes Features](https://deis.com/blog/2016/kubernetes-illustrated-guide)

[Minishift](https://docs.openshift.org/latest/minishift/getting-started/installing.html)

## Features Included

Currently included features are:
* [Deployment Configuration](https://docs.openshift.com/container-platform/3.9/dev_guide/deployments/how_deployments_work.html)
* [Service](https://kubernetes.io/docs/concepts/services-networking/service)
* [Route](https://docs.openshift.com/container-platform/3.9/architecture/networking/routes.html)
* [Configuration Map](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap)
* [Secrets](https://kubernetes.io/docs/concepts/configuration/secret)
* [Limits](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container)
* [Health Check](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes)
* [Readiness Check](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes)
* [Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context)
* [Empty Directory](https://kubernetes.io/docs/concepts/storage/volumes/#emptydir)

## Features not included

Samples documented but not included in the deployment due to missing support are:
* [Horizontal Pod Autoscaler](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale) - Horizontal Pod Autoscaler requires Heapster
* [Pod Security Policies](https://kubernetes.io/docs/concepts/policy/pod-security-policy) - Pod Security Policies requires the controller-manager to have PodSecurityPolicy
* [Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies) - Network Policies requires of Container Network Provider

## Contribution

Please feel free to contribute and re-use.

If you contribute please try to fully document to asssit consultants in understanding the features being added.

## Deployment

To deploy on minishift just:

1. `git clone https://github.com/GetLevvel/ocp-sample-application.git`
2. `minishift start`
3. `oc login -u developer`
4. `oc new-project pr-sample-application --description="Sample Application Project" --display-name="Sample Application Project"`
5. `chmod +x ocp-sample-install.sh`
6. `./ocp-sample-install.sh`
7. `oc get all`

Sample output of successful deployment.

```
jamesb@Surface:~/ocp-sample-application$ oc get all
NAME                         DOCKER REPO                               TAGS      UPDATED
imagestreams/dc-sample-app   172.30.1.1:5000/myproject/dc-sample-app   latest    40 seconds ago

NAME                              REVISION   DESIRED   CURRENT   TRIGGERED BY
deploymentconfigs/dc-sample-app   1          1         1         config,image(dc-sample-app:latest)

NAME                   HOST/PORT            PATH      SERVICES         PORT       TERMINATION   WILDCARD
routes/rt-sample-app   HostAlreadyClaimed             svc-sample-app   8080-tcp   edge          None

NAME                       READY     STATUS    RESTARTS   AGE
po/dc-sample-app-1-jm7w8   1/1       Running   0          39s

NAME                 DESIRED   CURRENT   READY     AGE
rc/dc-sample-app-1   1         1         1         40s

NAME                 CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
svc/svc-sample-app   172.30.67.174   <none>        8080/TCP   47s
```
## Author
james.buckett@levvel.io


# End of Section
