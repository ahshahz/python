#!/bin/bash
SHELL := /bin/bash

all: requirements_apt run

run:
	mkdir -p logs
	python3.8 -m venv build; \
	source ./build/bin/activate; \
	./build/bin/pip install -r requirements_pip.txt; \
	./build/bin/python -m pytest -v -s; \

requirements_apt:
	cat requirements_apt.txt | xargs sudo apt install -y;

clean:
	rm -rf build logs
	find . | grep -E "(__pycache__|\.pyc|\.pyo|logs|\.log)" | xargs rm -rf

pep8:
	find . -name '*.py' -exec autopep8 --in-place '{}' \;
