
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# Authentication Failure on Kafka Cluster.
---

This incident type refers to the detection of repeated authentication failures on a Kafka cluster, which could lead to a CPU spike. This issue may be caused by a variety of factors, such as incorrect credentials, network issues, or security breaches. If left unresolved, it can cause significant disruptions to the system's performance and availability. As a result, it is critical to identify and resolve any authentication failures promptly to prevent further damage to the system.

### Parameters
```shell
export KAFKA_LOGS="PLACEHOLDER"

export KAFKA_BROKER_PID="PLACEHOLDER"

export KAFKA_BROKER_PORT="PLACEHOLDER"

export KAFKA_BROKER_IP="PLACEHOLDER"

export KAFKA_CONFIG_FILE="PLACEHOLDER"

export KAFKA_BROKER_METRICS_URL="PLACEHOLDER"

export ZOOKEEPER_LOGS="PLACEHOLDER"
```

## Debug

### Check the Kafka logs for authentication failure messages
```shell
grep -i "authentication failed" ${KAFKA_LOGS}
```

### Check the CPU usage of the Kafka broker
```shell
top -bn1 | grep ${KAFKA_BROKER_PID}
```

### Check the network connectivity to the Kafka cluster
```shell
nc -vz ${KAFKA_BROKER_IP} ${KAFKA_BROKER_PORT}
```

### Check the Kafka configuration files for any misconfigurations
```shell
cat ${KAFKA_CONFIG_FILE}
```

### Check the Kafka broker metrics for any anomalies
```shell
curl -X GET ${KAFKA_BROKER_METRICS_URL}
```

### Check the Kafka ZooKeeper logs for any issues
```shell
grep -i "error" ${ZOOKEEPER_LOGS}
```