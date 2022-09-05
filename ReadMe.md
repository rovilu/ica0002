# ICA0002 Infrastructure services
Current repository belongs to TalTech course ICA0002 Infrastructure services. The repository contains Ansible project.

## Lab 1
### Added
- `ansible.cfg` - Ansible configuration
- `hosts` - Ansible inventory
- `infra.yaml` - main project playbook
- `roles/test_connection/tasks/main.yaml` - test connection role main playbook

## Lab 2
### Added
- `roles/`
  - `nginx/`
    - `files/`
      - `index.html` - default web page
    - `tasks/`
      - `main.yaml` - main role playbook
  - `users/`
    - `tasks/`
      - `main.yaml` - main role playbook

### Changed
- `hosts`
  - added host group **web_servers**
  - added **host_one** to **web_servers** group

### Removed
- `role/test_connection` - not needed.
