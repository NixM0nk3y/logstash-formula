{% from "logstash/map.jinja" import ls with context %}

/etc/logstash/jvm.options:
    file.managed:
        - mode: 0644
        - user: root
        - group: root
        - contents: {{ ls.jvm_opts }}
