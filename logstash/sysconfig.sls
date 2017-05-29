{% from 'logstash/map.jinja' import ls with context %}

{{ ls.sysconfig_file }}:
    file.managed:
        - source: salt://logstash/templates/sysconfig.jinja
        - user: root
        - group: root
        - mode: 0644
        - template: jinja
        - context:
            sysconfig: {{ ls.sysconfig }}
