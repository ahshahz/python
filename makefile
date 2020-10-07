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

sort:
	sort -u -o requirements_apt.txt requirements_apt.txt
	sort -u -o requirements_pip.txt requirements_pip.txt

pep8:
	find . -name '*.py' -exec autopep8 --in-place '{}' \;
