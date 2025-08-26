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
    *   Optionally, specify a `newIP` for each host if you want to change the IP address of the target host. The playbook will automatically wait for the host to become available on the new IP after applying the network configuration.

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

## How It Works

The playbook dynamically adds hosts based on the configuration file and then applies network settings using Netplan. If a `newIP` is specified for a host, the playbook will:

1. Configure the host with the new IP address
2. Apply the Netplan configuration
3. Wait for the host to become available on the new IP address
4. Continue with the configuration process using the new IP