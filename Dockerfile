FROM solr:9.2

ARG CONFIGSET vivocore
ENV CONFIGSET $CONFIGSET

USER root

COPY configsets/$CONFIGSET/conf /opt/solr/server/solr/configsets/$CONFIGSET/conf
COPY setup.sh /opt/solr/docker/scripts/setup.sh

RUN chown -R solr:solr /opt/solr/server/solr/configsets/$CONFIGSET
RUN chmod -R 755 /opt/solr/server/solr/configsets/$CONFIGSET
RUN chmod -R ugo+rx /opt/solr/docker/scripts/setup.sh

USER solr

CMD ["/bin/bash", "/opt/solr/docker/scripts/setup.sh"]
