{% from 'logstash/map.jinja' import ls with context %}

/etc/logstash/logstash.yml:
    file.serialize:
        - dataset: {{ ls.config }}
        - formatter: yaml
        - user: root
        - group: root
        - mode: 0644
        - require:
          - pkg: logstash_install
        - watch_in:
          - service: logstash_running

{% for name, src in ls.input.items() %}
{{ ls.config.get('path.config') }}/1000-input-{{ name }}.conf:
    file.managed:
        - source: {{ src }}
        - mode: 0640
        - user: root
        - group: logstash
        - template: jinja
        - require:
          - pkg: logstash_install
        - watch_in:
          - service: logstash_running
{% endfor %}

{% for name, src in ls.filter.items() %}
{{ ls.config.get('path.config') }}/5000-filter-{{ name }}.conf:
    file.managed:
        - source: {{ src }}
        - mode: 0640
        - user: root
        - group: logstash
        - template: jinja
        - require:
          - pkg: logstash_install
        - watch_in:
          - service: logstash_running

{% endfor %}

{% for name, src in ls.output.items() %}
{{ ls.config.get('path.config') }}/8000-output-{{ name }}.conf:
    file.managed:
        - source: {{ src }}
        - mode: 0640
        - user: root
        - group: logstash
        - template: jinja
        - require:
          - pkg: logstash_install
        - watch_in:
          - service: logstash_running
{% endfor %}
