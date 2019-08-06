## logdna-rsyslog

### Overview

logdna-rsyslog receives syslog logs via rsyslog and forwards them to LogDNA's https endpoint. It is currently only intended for use on a Kubernetes cluster, and not other container-based frameworks, such as Docker, but can be adapted fairly easily. This project is currently in beta.

### Installation steps

You can install logdna-rsyslog with 3 kubectl commands:
```
kubectl create secret generic logdna-agent-key --from-literal=logdna-agent-key=REPLACE-WITH-LOGDNA-INGESTION-KEY
kubectl apply -f https://raw.githubusercontent.com/logdna/logdna-rsyslog/master/logdna-rsyslog-config.yml
kubectl apply -f https://raw.githubusercontent.com/logdna/logdna-rsyslog/master/logdna-rsyslog-deployment.yml
```

### Usage and modification

After applying the above commands, you should begin to see logs in the LogDNA web UI. You can also modify the following in `logdna-rsyslog-config.yml` to adjust logdna-rsyslog to your liking
* The`logdna-url` is set to `logs.logdna.com`, but can be changed to send to other LogDNA deployment sites.
* The `logdna-rsyslog` rsyslog template can be customized to pre-parse problematic / non-compliant rsyslog lines (e.g. router or motherboard firmware logs)
* The `logdna-rsyslog` service endpoint can be configured to be an external LoadBalancer or NodePort if you wish to expose the service publicly

For reference, the Docker image is available on [Docker Hub](https://hub.docker.com/r/logdna/logdna-rsyslog)

### Future improvements

While this application is functional and has been tested in Kubernetes, there are a number of future improvements we have in mind:
* Allow receiving rsyslog lines over TCP+TLS instead of plain TCP
* Configure batching of lines for better ingestion performance
* Add Kubernetes RBAC and don't run the image as the root user (better security)
