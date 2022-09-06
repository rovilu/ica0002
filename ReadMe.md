# ICA0002 Infrastructure services
Current repository belongs to TalTech course ICA0002 Infrastructure services. The repository contains Ansible project.

## Lab 1
### Added
- `ansible.cfg` - Ansible configuration
- `hosts` - Ansible inventory
- `infra.yaml` - main project playbook
- `roles/test_connection/tasks/main.yaml` - test connection role main playbook.

## Lab 2
### Added
- `roles/`
  - `nginx/` - Nginx web server role
    - `files/`
      - `index.html` - index page
    - `tasks/`
      - `main.yaml` - main role playbook
  - `users/` - required users role
    - `tasks/`
      - `main.yaml` - main role playbook
    - `vars/`
      - `main.yaml` - main variables file.

### Changed
- `hosts`
  - renamed **host_one** to **host-1**
  - added host group **web_servers**
  - added **host-1** to **web_servers** group.

### Removed
- `roles/test_connection` - not needed.
