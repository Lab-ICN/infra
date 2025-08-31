run:
	ANSIBLE_HOST_KEY_CHECKING=False \
		ansible-playbook -i host.ini playbook.yaml -K  | tee -a logs/run-$(date +%F-%H%M).log