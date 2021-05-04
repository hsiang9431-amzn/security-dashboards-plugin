# allow changing config over api
# This is needed for Kibana integratoin tests
echo "opendistro_security.unsupported.restapi.allow_securityconfig_modification: true" >> config/opensearch.yml
echo "discovery.type: single-node" >> config/opensearch.yml

bin/opensearch