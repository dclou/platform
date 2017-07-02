# https://github.com/elastic/elasticsearch-docker
FROM docker.elastic.co/elasticsearch/elasticsearch:5.4.2

# Add your elasticsearch plugins setup here
# Example: RUN elasticsearch-plugin install analysis-icu

# export metrics to grafana
RUN elasticsearch-plugin install -b https://github.com/vvanholl/elasticsearch-prometheus-exporter/releases/download/5.4.2.0/elasticsearch-prometheus-exporter-5.4.2.0.zip
