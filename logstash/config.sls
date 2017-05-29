{% from 'logstash/map.jinja' import ls with context %}

/etc/logstash/logstash.yml:
    file.serialize:
        - dataset: {{ ls.config }}
        - formatter: yaml
        - user: root
        - group: root
        - mode: 0644

{% for name, src in ls.input.iteritems() %}
{{ ls.config.get('path.config') }}/00-input-{{ name }}.conf:
    file.managed:
        - source: {{ src }}
        - mode: 0644
        - user: root
        - group: root
{% endfor %}

{% for name, src in ls.filter.iteritems() %}
{{ ls.config.get('path.config') }}/01-filter-{{ name }}.conf:
    file.managed:
        - source: {{ src }}
        - mode: 0644
        - user: root
        - group: root
{% endfor %}

{% for name, src in ls.output.iteritems() %}
{{ ls.config.get('path.config') }}/02-output-{{ name }}.conf:
    file.managed:
        - source: {{ src }}
        - mode: 0644
        - user: root
        - group: root
{% endfor %}
