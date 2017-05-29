include:
    - logstash.repository

logstash_install:
    pkg.installed:
        - name: logstash
        - require:
            - sls: logstash.repository
