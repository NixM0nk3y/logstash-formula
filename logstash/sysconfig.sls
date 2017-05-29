{% from 'logstash/map.jinja' import ls with context %}

{{ ls.sysconfig_file }}:
    file.managed:
        - source: salt://logstash/templates/sysconfig.jinja
        - user: logstash
        - group: logstash
        - mode: 0600
        - template: jinja
        - context:
            sysconfig: {{ ls.sysconfig }}
