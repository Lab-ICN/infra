resource "proxmox_vm_qemu" "cloudinit-test" {
  depends_on = [
    null_resource.cloud_init_config_files,
  ]

  name        = "tftest1.xyz.com"
  desc        = "tf description"
  target_node = "proxmox1-xx"

  clone = "ci-ubuntu-template"

  # The destination resource pool for the new VM
  pool = "pool0"

  storage = "local"
  cores   = 3
  sockets = 1
  memory  = 2560
  disk_gb = 4
  nic     = "virtio"
  bridge  = "vmbr0"

  ssh_user        = "root"
  ssh_private_key = <<EOF
-----BEGIN RSA PRIVATE KEY-----
private ssh key root
-----END RSA PRIVATE KEY-----
EOF

  os_type   = "cloud-init"
  ipconfig0 = "ip=10.0.2.99/16,gw=10.0.2.2"

  /*
    sshkeys and other User-Data parameters are specified with a custom config file.
    In this example each VM has its own config file, previously generated and uploaded to
    the snippets folder in the local storage in the Proxmox VE server.
  */
  cicustom = "user=local:snippets/user_data_vm-${count.index}.yml"
  /* Create the Cloud-Init drive on the "local-lvm" storage */
  disks {
    ide {
      ide3 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
  }

  provisioner "remote-exec" {
    inline = [
      "ip a"
    ]
  }
}

