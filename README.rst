Zerqu
=====

Zerqu is a forum library that provides APIs to create topics, comments and etc.

.. image:: https://travis-ci.org/johndeng/zerqu.svg?branch=coverage-improvement
    :target: https://travis-ci.org/johndeng/zerqu


.. image:: https://coveralls.io/repos/johndeng/zerqu/badge.svg?branch=master&service=github
  :target: https://coveralls.io/github/johndeng/zerqu?branch=master


Development
-----------

Prerequests:

1. VirtualBox
2. Vagrant: https://www.vagrantup.com/downloads.html
3. Ansible: ``pip install ansible``


Install ansible roles::

    $ make install-ansible-roles

Setup vagrant development::

    $ vagrant up
    $ vagrant ssh

Install python requirements in vagrant and create database::

    $ cd /vagrant
    $ make install
    $ make database

Run app server in vagrant ``/vagrant`` directory::

    $ make run

Visit: `http://192.168.30.10:5000/`
