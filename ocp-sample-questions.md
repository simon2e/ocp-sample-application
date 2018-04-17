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

* Application specific requirements the involve modifying : `ocp-sample-deployment-config.yaml`

** Do you wish to pull a new image from an external repository anytime the tag changes?
