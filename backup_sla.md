# Backup SLA

## Purpose
Guarantee critical data saving in case of
- Host failures
- Service failures
- Maintenance errors
- Disasters.


## Backup coverage
Backup procedure is prescribed only for critical data containing files,
mainly databases. Stateless services, such as BIND 9, Nginx, etc. are not
to be covered with backup.

See table below to get more information about backup coverage.

| Service type            | Service                      | Backup-covered | Description                                                                             |
|-------------------------|------------------------------|----------------|-----------------------------------------------------------------------------------------|
| Web Application         | AGAMA                        | No             | Stateless application which stores its data in MySQL database                           |
| DNS Server              | BIND 9                       | No             | Stateless service and does not store critical data                                      |
| Monitoring Agent        | Prometheus BIND Exporter     | No             | Service exports collected data to Prometheus server and does not store it internally    |
| Data Visualization Tool | Grafana                      | No             | Application visualize data from datasources and does not store it internally            |
| Database                | InfluxDB                     | Yes            | Database stores critical data that cannot be lost. All database files must be backed up |
| Monitoring Agent        | Prometheus InfluxDB Exporter | No             | Service exports collected data to Prometheus server and does not store it internally    |
| Database                | MySQL                        | Yes            | Database stores critical data that cannot be lost. All database files must be backed up |
| Monitoring Agent        | Prometheus MySQL Exporter    | No             | Service exports collected data to Prometheus server and does not store it internally    |
| Web Server              | Nginx                        | No             | Stateless service and does not store critical data                                      |
| Monitoring Agent        | Prometheus Nginx Exporter    | No             | Service exports collected data to Prometheus server and does not store it internally    |
| Monitoring Agent        | Prometheus Node Exporter     | No             | Service exports collected data to Prometheus server and does not store it internally    |
| Monitoring Tool         | Pinger                       | No             | Stateless service which stores its data in MySQL database                               |
| Monitoring Tool         | Prometheus                   | No             | Service does not store any critical data needed for a long time.                        |
| Application Server      | uWSGI                        | No             | Stateless service and does not store critical data                                      |


## Recovery Point Objective (RPO)
Due to infrastructure hosts the only application for now and the application is 
not actively in use, the acceptable value of data loss threshold is **24 hours**.


## Recovery Time Objective (RTO)
In case of disaster, normal services must be restored in normal state within **6 hours**.


## Versioning and retention
A specific backup is valuable within 7 days since the first version.
Full backup is conducted every week on Sunday 00:00 UTC.

Incremental backup is conducted on Monday to Saturday 00:00 UTC.

According to retention and backup intervals there are 7 versions of single backup: 1 full and 6 incremental ones.
The next full backup makes the previous one with its incremental versions invaluable.


## Backup usability check
In order to verify usability of backup, the following checks must be conducted:
1) Backup created in time predefined to its version
2) Backup is readable and ready to be used. Use test server to conduct test recovery
3) Backup is compatible with infrastructure services and applications.
Use test server to check if data from backup can be used by services and applications.


## Restoration criteria
Backup restoration must be conducted in case of loss of critical data caused by cyberattacks,
physical infrastructure damage, etc.
