# Ansible Network Configuration

This project uses Ansible to configure static IP addresses on target hosts. It dynamically adds hosts based on a configuration file and applies network settings using Netplan.

## How to Use

1.  **Clone the repository:**
    ```bash
    git clone <repository_url>
    cd ansible2
    ```

2.  **Install Ansible:**
    Make sure you have Ansible installed on your control machine.
    ```bash
    pip install ansible
    ```

3.  **Configure:**
    *   Copy `config.yaml.example` to `config.yaml`.
    *   Edit `config.yaml` to specify the target hosts, IP addresses, gateway, nameservers, and the path to the Netplan configuration file.

4.  **Run the playbook:**
    You can run the playbook using the provided Makefile:
    ```bash
    make ansible
    ```
    This command will execute `ansible-playbook` with the necessary options.

    Alternatively, you can run the playbook directly:
    ```bash
    ansible-playbook playbook.yaml
    ```

    This will configure the network settings on the specified hosts.