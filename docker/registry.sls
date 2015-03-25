include:
  - docker

dockerio-pip-dependencies:
  pkg.installed:
    - name: python-pip
  pip.installed:
    - name: docker-py
    - require:
      - pkg: python-pip
    - require_in:
      - docker: registry
    - reload_modules: true # doesn't reload the modules?

dockerio-registry-image-pull:
  docker.pulled:
    - name: registry
    - tag: latest
    - require:
      - sls: docker
      - pkg: python-pip
      - pip: docker-py

#service-registry:
#  docker.run:
#    - name: registry
#    - container: registry
