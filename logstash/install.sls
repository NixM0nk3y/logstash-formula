include:
    - logstash.repository

logstash_install:
    pkg.installed:
        - name: logstash
        - require:
            - sls: logstash.repository

logstash_enable:
    service.enabled:
        - name: logstash
        - require:
            - pkg: logstash_install
