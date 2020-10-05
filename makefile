#!/bin/bash
SHELL := /bin/bash

release:
	mkdir -p logs
	python3 -m pytest -v

dependencies:
	sudo apt install -y python3 python3-pip virtualenv tree xsel xclip python-autopep8
	sudo -H pip3 install pytest sphinx pep8 flake8 arrow

clean:
	py3clean . && pyclean .
	find . | grep -E "(__pycache__|\.pyc|\.pyo|logs|\.log)" | xargs rm -rf

python-pep8-formatted:
	find . -name '*.py' -exec autopep8 --in-place '{}' \;
