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

| Service type            | Service                      | Backup-covered | Description                                                                                                       |
|-------------------------|------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------|
| Web Application         | AGAMA                        | No             | Stateless application which stores its data in MySQL database                                                     |
| DNS Server              | BIND 9                       | No             | Stateless service and does not store critical data                                                                |
| Monitoring Agent        | Prometheus BIND Exporter     | No             | Service exports collected data to Prometheus server and does not store it internally                              |
| Data Visualization Tool | Grafana                      | No             | Application visualize data from datasources and does not store it internally                                      |
| Database                | InfluxDB                     | Yes            | Database stores critical data that cannot be lost. All database files must be backed up                           |
| Monitoring Agent        | Prometheus InfluxDB Exporter | No             | Service exports collected data to Prometheus server and does not store it internally                              |
| Database                | MySQL                        | Yes            | Database stores critical data that cannot be lost. All database files must be backed up                           |
| Monitoring Agent        | Prometheus MySQL Exporter    | No             | Service exports collected data to Prometheus server and does not store it internally                              |
| Web Server              | Nginx                        | No             | Stateless service and does not store critical data                                                                |
| Monitoring Agent        | Prometheus Nginx Exporter    | No             | Service exports collected data to Prometheus server and does not store it internally                              |
| Monitoring Agent        | Prometheus Node Exporter     | No             | Service exports collected data to Prometheus server and does not store it internally                              |
| Monitoring Tool         | Pinger                       | No             | Stateless service which stores its data in MySQL database                                                         |
| Monitoring Server       | Prometheus                   | Yes            | Service has internal database that contains metric data that cannot be lost. All database files must be backed up |
| Application Server      | uWSGI                        | No             | Stateless service and does not store critical data                                                                |


## RPO and RTO
Due to infrastructure hosts the only application for now and the application is not actively in use,
it is acceptable to prepare for recovery within an hour since disruption occurred.

The access to service and data must be able to be regained within 2 hours since disruption occurred.


## Versioning and retention
Backup is valuable within 28 days since the first version. Backup is conducted every week on Wednesday.
According to retention and backup intervals there are 4 versions of single backup.


## Backup usability check
In order to verify usability of backup, the following checks must be conducted:
1) Backup created in time predefined to its version
   1) Version 1 - 1st day of backup retention cycle
   2) Version 2 - 8th day
   3) Version 3 - 15th day
   4) Version 4 - 22nd day
2) Backup is readable and ready to be used. Use test server to conduct test recovery
3) Backup is compatible with infrastructure services and applications.
Use test server to check if data from backup can be used by serviced and applications.


## Restoration criteria
Backup restoration must be conducted in case of loss of critical data caused by cyberattacks,
physical infrastructure damage, etc.
