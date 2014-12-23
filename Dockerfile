FROM ifunsoftware/c3-base:latest

RUN wget -O /opt/c3.jar 'http://repository.ifunsoftware.com/service/local/artifact/maven/redirect?r=snapshots&g=org.aphreet.c3&a=c3-deploy&v=LATEST' --content-disposition

RUN mkdir -p /opt/c3-app && unzip /opt/c3.jar -d /opt/c3-app && rm /opt/c3.jar

RUN rm -rf /opt/virgo/repository/usr/* && rm -rf /opt/virgo/pickup/*

RUN cp /opt/c3-app/server/lib/* /opt/virgo/repository/usr/

RUN cp /opt/c3-app/server/pickup/c3.plan /opt/virgo/pickup/

RUN rm -rf /opt/c3-app 

EXPOSE 22 8080 8443 7375

ENTRYPOINT ["/usr/bin/supervisord"]
