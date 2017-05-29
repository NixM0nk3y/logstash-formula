include:
    - logstash.install

logstash_running:
    service.running:
        - name: logstash
        - enable: True
        - require:
            - sls: logstash.install
