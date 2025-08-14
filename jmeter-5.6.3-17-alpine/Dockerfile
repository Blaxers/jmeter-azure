#FROM openjdk:17-alpine
FROM openjdk:17-alpine3.14

ENV JMETER_VERSION=5.6.3 \
    CMDRUNNER_VERSION=2.2 \
    PLUGINMGR_VERSION=1.3

ENV JMETER_HOME=/opt/apache-jmeter-${JMETER_VERSION} \
    PATH="/opt/apache-jmeter-${JMETER_VERSION}/bin:${PATH}"

RUN apk add --no-cache curl bash \
 && curl -fsSL https://downloads.apache.org/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz \
    | tar -xvz -C /opt \
 && ls -l /opt \
 && echo "JMETER_HOME is ${JMETER_HOME}" \
 && mkdir -p ${JMETER_HOME}/lib/ext \
 && curl -o ${JMETER_HOME}/lib/cmdrunner-${CMDRUNNER_VERSION}.jar https://repo1.maven.org/maven2/kg/apc/cmdrunner/${CMDRUNNER_VERSION}/cmdrunner-${CMDRUNNER_VERSION}.jar \
 && curl -o ${JMETER_HOME}/lib/ext/jmeter-plugins-manager-${PLUGINMGR_VERSION}.jar https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/${PLUGINMGR_VERSION}/jmeter-plugins-manager-${PLUGINMGR_VERSION}.jar \
 && java -cp ${JMETER_HOME}/lib/ext/jmeter-plugins-manager-${PLUGINMGR_VERSION}.jar org.jmeterplugins.repository.PluginManagerCMDInstaller \
 && cd ${JMETER_HOME}/bin \
 && sh PluginsManagerCMD.sh available  \
 && sh PluginsManagerCMD.sh status  \
 && sh PluginsManagerCMD.sh install jpgc-casutg \
 && sh PluginsManagerCMD.sh status  \
# && sh PluginsManagerCMD.sh install-all-except jpgc-hadoop,jpgc-oauth \
 && sleep 2 \
 && sh PluginsManagerCMD.sh status \
 && rm -rf ${JMETER_HOME}/docs ${JMETER_HOME}/printable_docs \
 && apk del curl

WORKDIR ${JMETER_HOME}

COPY config/user.properties bin/user.properties
COPY scripts/docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

EXPOSE 1099 50000

ENTRYPOINT ["/docker-entrypoint.sh"]