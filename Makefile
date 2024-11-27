include ansible/.env

web:
	@cd ansible && \
	ansible-playbook \
	--inventory ${WEB_HOSTS} \
	--extra-vars @.enc playbooks/web-deployment.yaml

cloudinit:
	@cd ansible && \
	ansible-playbook \
	--inventory ${PROXMOX_HOSTS} \
	--extra-vars @.enc \
	playbooks/cloudinit.yaml

.PHONY: web cloudinit
