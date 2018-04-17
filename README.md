cassandra-kubernetes-seed-provider
==================================

A custom seed provider for cassandra on kubernetes.

Within any deployment of Cassandra a Seed Provider is used for node discovery and communication.
When a Cassandra node first starts it must discover which nodes, or seeds, for the information about the Cassandra nodes in the ring / rack / datacenter.

This Java project provides a custom Seed Provider which communicates with the Kubernetes API to discover the required information.

Navigator
---------

This seed provider was forked from [kubernetes/examples](https://github.com/kubernetes/examples/tree/master/cassandra),
for use with [Navigator](https://github.com/jetstack/navigator/).

Building
--------

First install Maven, then run

    make

Configuring the Seed Provider
-----------------------------

The following environment variables may be used to override the default configurations:

| ENV VAR       | DEFAULT VALUE  | NOTES |
| ------------- |:-------------: |:-------------:|
| KUBERNETES_PORT_443_TCP_ADDR   | kubernetes.default.svc.cluster.local  | The hostname of the API server   |
| KUBERNETES_PORT_443_TCP_PORT   | 443                                   | API port number                  |
| CASSANDRA_SERVICE              | cassandra                             | Default service name for lookup  |
| POD_NAMESPACE                  | default                               | Default pod service namespace    |
| K8S_ACCOUNT_TOKEN 		 | /var/run/secrets/kubernetes.io/serviceaccount/token | Default path to service token |

Using
-----

If no endpoints are discovered from the API the seeds configured in the cassandra.yaml file are used.
