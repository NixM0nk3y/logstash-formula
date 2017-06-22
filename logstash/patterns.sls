{% from 'logstash/map.jinja' import ls with context %}

{% if ls.patterns is defined %}
    {% for name, patterns in ls.patterns.items() %}
/etc/logstash/patterns/{{ name }}:
    file.managed:
        - makedirs: True
        - mode: 0644
        - user: root
        - group: root
        {% if patterns %}
        - contents:
            {% for pattern in patterns %}
            - {{ pattern }}
            {% endfor %}
        {% endif %}
    {% endfor %}
{% endif %}
