#!/usr/bin/make -f


play:
	@ansible-playbook ./$(filter-out $@,$(MAKECMDGOALS)).yml -v

check:
	@ANSIBLE_DISPLAY_OK_HOSTS=false ANSIBLE_DISPLAY_SKIPPED_HOSTS=false ansible-playbook ./$(filter-out $@,$(MAKECMDGOALS)).yml -v --check --diff
