# Questions for Applications to be hosted on OpenShift

When discussing application requirements with the developerr.

Use this form as a guideline to modify certain sections of the manifest files to facilitate how the application will run.


* Does the application need to be internet facing?
If the answer is yes then modify and include : `ocp-sample-route.yml`
Edit  `ocp-sample-route.yml` to suit the requirements of the application

* Does the application require dynamic scaling based on CPU utilization?
If the answer is yes then modify and include : `ocp-sample-hpa.yml`
Edit `ocp-sample-hpa.yml` to suit the requirements of the application
Ensure the application is stateless or multiple copies could cause locking conflicts

* Does the application require environmental configuration data?
If the answer is yes then modify : `ocp-sample-configmap.yml`
Edit `ocp-sample-configmap.yml` to suit the requirements of the application

* Does the application require secrets?
If the answer is yes then modify : `ocp-sample-secret.yml`
Edit `ocp-sample-secret.yml` to suit the requirements of the application

## Application specific requirements the involve modifying : `ocp-sample-deployment-config.yaml`

* Do you wish to pull a new image from an external repository anytime the tag changes?
```
      ########################################
      ## Watch external Registry (jFrog)    ##
      ## for Image Tag Changes : latest-dev ##
      ########################################
      #importPolicy:
        #scheduled: true
      #name: "latest-dev"
      #referencePolicy:
        #type: Source
```

* Do you wish to ensure that only one pod will be scheduled on one Node?
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
```
          ########################################
          ## Pod Security Context               ##
          ## Container cannot run as root       ##
          ########################################
        securityContext:
          runAsNonRoot: true
```

* Do you want an amount of time for graceful shutdown?
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


