include ansible/.env

ansible/web.up:
	@cd ansible && \
	ansible-playbook --inventory ${WEB_HOSTS} \
	-e @.enc playbooks/web-deployment.yaml
