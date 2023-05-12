FROM jefferyb/shibboleth-sp

RUN a2enmod proxy_ajp 

CMD \
  ansible-playbook /opt/playbooks/shibboleth-playbook.yaml --diff && \
  sed -i 's$ProxyPass / http$ProxyPass / ajp$' /etc/apache2/sites-enabled/000-default.conf && \
  sed -i '/ProxyPassReverse/d' /etc/apache2/sites-enabled/000-default.conf && \
  sed -i '/ProxyPreserveHost /a ProxyPass /Shibboleth.sso !' /etc/apache2/sites-enabled/000-default.conf && \
  sed -i '/<\/Location/a <Location /Shibboleth.sso>\nShibRequestSetting requireSession 0\nrequire all granted\n</Location>' /etc/apache2/sites-enabled/000-default.conf && \
  sed -i 's/handlerSSL="true"/handlerSSL="false"/' /etc/shibboleth/shibboleth2.xml && \
  sed -i 's/https/http/' /etc/shibboleth/shibboleth2.xml && \
  sed -i 's|signing="false"/>|signing="false"><EndpointBase>http://localhost:8080/Shibboleth.sso</EndpointBase></Handler>|' /etc/shibboleth/shibboleth2.xml && \    
  apache2ctl restart && \
  /etc/init.d/shibd restart && \  
  tail -f /var/log/apache2/*.log /var/log/shibboleth/*.log 


