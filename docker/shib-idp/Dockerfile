FROM i2incommon/shib-idp:4.3.1_20230330

CMD touch /tmp/toto.txt && \
sed	-i 's/<Service name="Catalina">/<Service name="Catalina"><Connector protocol="org.apache.coyote.http11.Http11NioProtocol" port="80" maxThreads="200"\/>/' /usr/local/tomcat/conf/server.xml && \
cp /opt/shibboleth-idp/conf/examples/attribute-resolver-ldap.xml /opt/shibboleth-idp/conf/attribute-resolver.xml && \
sed -i 's|ldap://localhost:10389|ldap://esup-sgc-openldap:389|' /opt/shibboleth-idp/conf/ldap.properties && \
sed -i 's|dc=example,dc=org|dc=univ-ville,dc=fr|' /opt/shibboleth-idp/conf/ldap.properties && \
sed -i '/idp\.authn\.LDAP\.ldapURL=/aidp.authn.LDAP.useStartTLS=false' /opt/shibboleth-idp/conf/ldap.properties && \
sed -i 's/idp\.attribute\.resolver\.LDAP\.bindDN=.*/idp.attribute.resolver.LDAP.bindDN=cn=admin,dc=univ-ville,dc=fr/' /opt/shibboleth-idp/conf/ldap.properties && \
sed -i '/idp\.attribute\.resolver\.LDAP\.bindDN=.*/aidp.attribute.resolver.LDAP.bindDNCredential=esup' /opt/shibboleth-idp/conf/ldap.properties && \
sed -i '/trustFile=/d' /opt/shibboleth-idp/conf/attribute-resolver.xml && \
sed -i 's|https://idp\.example\.org|http://localhost:8082|' /opt/shibboleth-idp/conf/idp.properties /opt/shibboleth-idp/metadata/idp-metadata.xml && \
sed -i 's|example\.org|univ-ville.fr|' /opt/shibboleth-idp/conf/idp.properties /opt/shibboleth-idp/metadata/idp-metadata.xml && \
sed -i 's/2023-03/2123-03/' /opt/shibboleth-idp/metadata/idp-metadata.xml && \
sed -i '/<\/MetadataProvider>/i <MetadataProvider id="LocalMetadata"  xsi:type="FileBackedHTTPMetadataProvider" backingFile="/tmp/esup-sgc.xml" metadataURL="http://esup-sgc-front/Shibboleth.sso/Metadata"/>' /opt/shibboleth-idp/conf/metadata-providers.xml && \
/usr/bin/startup.sh 

