# Questions for Applications to be hosted on OpenShift

When discussing application requirements with the developer.

Use this form as a guideline to modify certain sections of the manifest files to facilitate how the application will run.

## General Questions

* Does the application need to be internet facing?
If the answer is yes then modify and include : `ocp-sample-route.yml`.

Edit  `ocp-sample-route.yml` to suit the requirements of the application.

* Does the application require dynamic scaling based on CPU utilization?
If the answer is yes then modify and include : `ocp-sample-hpa.yml`.

Edit `ocp-sample-hpa.yml` to suit the requirements of the application.

Ensure the application is stateless or multiple copies could cause locking conflicts, heapster must be enabled.

* Does the application require environmental configuration data?
If the answer is yes then modify : `ocp-sample-configmap.yml`.

Edit `ocp-sample-configmap.yml` and `ocp-sample-deployment-config.yaml` to suit the requirements of the application.

You will normally have one `ocp-sample-configmap.yml` per environment and one `ocp-sample-deployment-config.yaml`.

* Does the application require secrets?
If the answer is yes then modify : `ocp-sample-secret.yml`.

Edit `ocp-sample-secret.yml` and `ocp-sample-deployment-config.yaml` to suit the requirements of the application.

You will normally have one `ocp-sample-secret.yml` per environment and one `ocp-sample-deployment-config.yaml`.

## Deployment Questions

These sections are all in the `ocp-sample-deployment-config.yaml`.

* Run the application with a unique identity in order to control access to resources on a fine grain.

This is security best practice.

```
    ################################################
    ## Provide an application with a unique       ##
    ## identity in order to control access to     ##
    ## resources on a fine grain                  ##
    ################################################
        serviceAccountName: sa-ocp-sample-app
```

* Do you wish to pull a new image from an external repository anytime the tag changes?

```
   ########################################
   ## Watch external Registry (jFrog)    ##
   ## for Image Tag Changes : latest-dev ##
   ########################################
      importPolicy:
        scheduled: true
      name: "latest-dev"
      referencePolicy:
        type: Source
```

* Do you wish to ensure that only one pod will be scheduled on one Node?

This is typically to ensure higher resiliency in case of node failure a second pod will not be running on the same node.

```
    ################################################
    ## podAntiAffinity Rule                       ##
    ## Only one Pod will be scheduled on one Node ##
    ################################################
    affinity:
      podAntiAffinity:
        requiredDuringSchedulingIgnoredDuringExecution:
        - labelSelector:
            matchExpressions:
            - key: app
              operator: In
              values:
              - dc-sample-app
          topologyKey: kubernetes.io/hostname
```

* Do you want to run this pod not as root?

This is best practice not to run the container as root.

```
    ########################################
    ## Pod Security Context               ##
    ## Container cannot run as root       ##
    ########################################
    securityContext:
      runAsNonRoot: true
```

* Do you want an amount of time for graceful shutdown?

Java application could require some time to gracefully shut down.

```
    ########################################
    ## Graceful shutdown of Pods          ##
    ## 15 Seconds to terminate            ##
    ## Amount of time to wait for a       ##
    ## SIGTERM to run until a SIGKILL     ##
    ## is used                            ##
    ########################################
    terminationGracePeriodSeconds: 15
```

* Do you have any Resource Specific Requirements that you wish to enforce?

Java applications could consume all available memory on a node if not constrained.

Be very careful of this setting, watch for OOM messages in logs if pod terminates this indicates Out of Memory and the pod will be killed and restarted.

```
    ######################################################
    ## Resource Management                              ##
    ## CPU Initial Request    = 0.5 cores               ##
    ## Memory Initial Request = 512 MB                  ##
    ## CPU Upper Limit        = 1.0 cores               ##
    ## Memory Upper Limit     = 2048 MB                 ##
    ######################################################
       requests:
         cpu: "500m"
         memory: "512Mi"
       limits:
         cpu: "1000m"
         memory: "2048Mi"
```

* Do you wish to use a temporary directory for the application?

```
    ########################################
    ## Empty Directory used for cache     ##
    ## temporary directory destroyed      ##
    ## when pod terminates                ##
    ########################################
      volumeMounts:
       - name: cache-directory
          mountPath: "/cache"
          readOnly: false
    volumes:
     - name: cache-directory
       emptyDir: {}
```

# End of Section
