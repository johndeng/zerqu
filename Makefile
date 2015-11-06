clean-pyc:
	@find . -name '*.pyc' -exec rm -f {} +
	@find . -name '*.pyo' -exec rm -f {} +
	@find . -name '*~' -exec rm -f {} +
	@find . -name '__pycache__' -exec rm -fr {} +

coverage:
	@coverage run --branch --source=zerqu -m py.test tests
	@coverage html


babel-update:
	@pybabel extract -F babel.cfg -k lazy_gettext -o messages.pot .
	@pybabel update -i messages.pot -d zerqu/translations && find zerqu/translations -name "*.swp" -delete


babel-compile:
	@pybabel compile -d zerqu/translations


install-ansible-roles:
	@ansible-galaxy install -r playbooks/requirements.yml -p playbooks/roles


install:
	@sudo /var/venv/bin/pip install -r deps/develop.txt


database:
	@ZERQU_CONF=/vagrant/local_config.py /var/venv/bin/alembic upgrade head


run:
	@ZERQU_CONF=/vagrant/local_config.py /var/venv/bin/python app.py
