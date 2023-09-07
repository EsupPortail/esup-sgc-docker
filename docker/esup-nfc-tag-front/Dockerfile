FROM jefferyb/shibboleth-sp

RUN a2enmod proxy_ajp 

CMD \
    cp -R /docker-config/000-default.conf /etc/apache2/sites-enabled/ && \
    cp -R /docker-config/shibboleth2.xml /etc/shibboleth/ && \
    ansible-playbook /opt/playbooks/shibboleth-playbook.yaml --diff && \
    cp -R /docker-config/000-default.conf /etc/apache2/sites-enabled/ && \
    cp -R /docker-config/shibboleth2.xml /etc/shibboleth/ && \
    apache2ctl restart && \
    /etc/init.d/shibd restart && \
    # IDP demande les metadata -> il est ok -> on recharge les metadata cote SP
    bash -c "fgrep -m 1 'GET /Shibboleth.sso/Metadata' <(tail -n 0 -f /var/log/apache2/access.log) && /etc/init.d/shibd restart" && \
    tail -f /var/log/apache2/*.log /var/log/shibboleth/*.log