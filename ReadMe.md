# ICA0002 Infrastructure services
Current repository belongs to TalTech course ICA0002 Infrastructure services. The repository contains Ansible project.

## Lab 1
Initializing Ansible repository.

### Added
- `ansible.cfg` - Ansible configuration
- `hosts` - Ansible inventory
- `infra.yaml` - main project playbook
- `roles/test_connection/tasks/main.yaml` - test connection role main playbook.

---

## Lab 2
Nginx-based web servers implementation.

### Added
- `roles/`
  - `nginx/` - Nginx web server role
    - `files/index.html` - index page
    - `tasks/main.yaml` - main role playbook
  - `users/` - required users role
    - `tasks/main.yaml` - main role playbook
    - `vars/main.yaml` - main variables file.

### Changed
- `infra.yaml` - removed **become** parameter
- `hosts`
  - renamed **host_one** to **host-1**
  - added host group **web_servers**
  - added **host-1** to **web_servers** group.

### Removed
- `roles/test_connection` - not needed.

---

## Lab 3
AGAMA web application implementation based on uWSGI and Nginx.

### Added
- `roles/`
  - `agama/` - AGAMA application role
    - `tasks/main.yaml` - main role playbook
  - `uwsgi/` - uWSGI service role
    - `files/agama.ini` - uWSGI configuration for AMAGA
    - `handlers/main.yaml` - main handlers file
    - `tasks/main.yaml` - main role playbook
  - `nginx/`
    - `files/default` - default Nginx configuration
    - `handlers/main.yaml` - main handlers file

### Changed
 - `infra.yaml`
   - removed **users** role
   - added **agama** and **uwsgi** roles
 - `roles/nginx/tasks/main.yaml`
   - removed **Index page** task
   - added **Add uWSGI configuration for Nginx** task

### Removed
- `roles/nginx/files/index.html` - not needed.

---

## Lab 4
MySQL-based database implementation.

### Added
- `group_vars/all.yaml` - variables file
- `roles/`
  - `init/` - initial setup role
    - tasks/main.yaml` - main role playbook
  - `mysql/` - MySQL database role
    - `files/override.cnf` - MySQL daemon configuration
    - `handlers/main.yaml` - main handlers file
    - `tasks/main.yaml` - main role playbook
  - `uwsgi/templates/agama.ini` - added uWSGI configuration template for AGAMA application

### Changed
- `ansible.cfg` - added vault password file parameter
- `infra.yaml`
  - added **init** role play
  - added database servers play
- `roles/`
  - `agama/tasks/main.yaml` - added PyMySQL package installation
  - `nginx/tasks` - renamed tasks names

### Removed
- `roles/uwsgi/files/agama.ini` - reworked to template and moved under `../templates/`.

---

## Lab 5
BIND 9-based DNS server implementation.

### Added
- `roles/`
  - `bind/` - BIND 9 DNS service role
    - `handlers/main.yaml` - main handlers file
    - `tasks/main.yaml` - main role playbook
    - `templates/`
      - `db.vilur.io` - vilur.io zone configuration template
      - `named.conf` - BIND 9 configuration template
  - `resolv/` - resolver configuration role
    - `tasks/main.yaml` - main role playbook
    - `templates/resolv.conf` - resolver configuration template
  - `setup/` - facts collector role
    - `tasks/main.yaml` - main role playbook

### Changed
- `infra.yaml`
  - added **setup** and **resolv** roles for initial play role
- `group_vars/all.yaml`
  - changed **mysql_host** variable IP address value to DNS name
  - added variables **allow_query**, **forwarders** and **startup_name**.

---

## Lab 6

### Added

### Changed

### Removed
