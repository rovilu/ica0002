# Disaster recovery

In order to recover infrastructure and service from disaster, operations described below must be performed.

*NB!* Project playbooks are run using privilege escalation. Make sure you have root access to infrastructure hosts
before disaster recovery can be performed.

## Infrastructure recovery

In order to perform infrastructure installation, run main playbook from project directory
```
ansible-playbook infra.yaml
```

*NB!* If any errors are given during installation, make sure to troubleshoot them.
Otherwise, next step of recovery should not be executed.

## Databases backup restoration

In order to perform MySQL database restoration, run MySQL restoration playbook from project directory:
```
ansible-playbook restore-mysql.yaml
```

In order to perform InfluxDB database restoration, run InfluxDB restoration playbook from project directory:
```
ansible-playbook restore-influxdb.yaml
```
