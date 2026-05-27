# homelab
Homelab playground for learning DevOps with a Raspberry Pi

## Setup

### Install Ansible on WSL

You can use the install_ansible.sh script to install ansible on your WSL.

```bash
sudo bash ./ansible-pi-docker/install_ansible.sh
```

### Ansible Vault – Creating secrets.pass

The `secrets.pass` file is **not** stored in this repository (see `.gitignore`).
It must be created locally once:

```bash
echo "yourSecureVaultPassword" > ./ansible-pi-docker/secrets.pass
```

This file acts as the key to decrypt `vault.yml`, which contains the SSH
credentials for the Raspberry Pi.

The encrypted `vault.yml` is then created like this:

```bash
ansible-vault create ./ansible-pi-docker/group_vars/myhosts/vault.yml --vault-password-file=./ansible-pi-docker/secrets.pass
```

Enter the following content in the editor and save:

```yaml
vault_ansible_ssh_pass: "yourRaspberryPiSSHPassword"
```

> **Note:** Never commit `secrets.pass`. The `vault.yml` on the other hand is
> encrypted and can safely be checked into the repository.

## Git Commit Message Conventions

This project follows a simple and consistent commit message style.

### Common Types

- **feat**: Introduces a new feature
  *Example:* `feat: add user authentication`

- **fix**: Fixes a bug or incorrect behavior
  *Example:* `fix: resolve crash on startup`

- **chore**: Maintenance tasks that do not affect production code
  (e.g. dependencies, tooling, configs)
  *Example:* `chore: update npm dependencies`

- **format**: Code formatting only (no logic changes)
  *Example:* `format: apply prettier formatting`

- **docs**: Documentation changes only
  *Example:* `docs: update README with setup instructions`

- **refactor**: Code changes that neither fix a bug nor add a feature
  *Example:* `refactor: simplify validation logic`

- **test**: Adding or updating tests
  *Example:* `test: add unit tests for auth service`

- **perf**: Performance improvements
  *Example:* `perf: optimize database queries`

- **ci**: Changes to CI/CD configuration
  *Example:* `ci: add GitHub Actions workflow`

- **build**: Changes that affect the build system or external dependencies
  *Example:* `build: configure webpack for production`