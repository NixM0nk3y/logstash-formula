{% from "logstash/map.jinja" import ls with context %}

/etc/logstash/jvm.options:
    file.managed:
        - mode: 0644
        - user: logstash
        - group: logstash
        - contents: {{ ls.jvm_opts }}
