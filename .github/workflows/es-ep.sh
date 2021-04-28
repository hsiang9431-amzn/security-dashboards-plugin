if [ ! -z "$ES_PLUGIN_ZIP" ]; then
	yes | elasticsearch-plugin install file:///docker-host/plugins/es/${ES_PLUGIN_ZIP}
else
	yes | elasticsearch-plugin install ${ES_PLUGIN_URL}
fi

chmod +x plugins/opendistro_security/tools/install_demo_configuration.sh
yes | plugins/opendistro_security/tools/install_demo_configuration.sh

# allow changing config over api
# This is needed for Kibana integratoin tests
echo "opendistro_security.unsupported.restapi.allow_securityconfig_modification: true" >> /usr/share/elasticsearch/config/elasticsearch.yml

# ES_CONF_DIR=/usr/share/elasticsearch/config
# ES_PLUGINS_DIR=/usr/share/elasticsearch/plugins

# cat > change-config.sh <<EOF
# sleep 15

# cp /docker-host/config.yml /usr/share/elasticsearch/plugins/opendistro_security/securityconfig/config.yml

# export JAVA_HOME=/usr/share/elasticsearch/jdk

# $ES_PLUGINS_DIR/opendistro_security/tools/securityadmin.sh \
# 	-cd "$ES_PLUGINS_DIR/opendistro_security/securityconfig" \
# 	-icl \
# 	-key "$ES_CONF_DIR/kirk-key.pem" \
# 	-cert "$ES_CONF_DIR/kirk.pem" \
# 	-cacert "$ES_CONF_DIR/root-ca.pem" \
# 	-nhnv
# EOF

# chmod +x change-config.sh
# ./change-config.sh &

su -c "elasticsearch" -s /bin/bash elasticsearch
