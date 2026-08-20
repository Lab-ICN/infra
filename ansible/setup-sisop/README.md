# setup_sisop

## Prerequisite
- Ansible
- python3-passlib
- SSH access to VM(s)
- If using SSH password: install sshpass (macOS: `brew install sshpass`)

## Quickstart (template inventory)
1) Copy the classX template folder under inventories/, then rename it to the corresponding class (e.g., classA).
2) Set the target VM(s) in hosts.ini. Then add all student NIMs to nims.txt(one per line).
3) Test connection (**replace `classX` with your class name**, e.g. **`classA`**):
    ```bash
    ansible -i inventories/classX/hosts.ini praktikum -m ping -u member --ask-pass
    ```
4) Run(**replace `classX` with your class name**, e.g. **`classA`**):
    ```
   ansible-playbook -i inventories/`{classX}`/hosts.ini playbooks/setup_students.yml -u member --ask-pass -K
   ```

## Verify inside VM
- `id student_<NIM>`
- `sudo -l -U student_<NIM>`
- `gcc --version`, `make --version`
- `docker run hello-world`