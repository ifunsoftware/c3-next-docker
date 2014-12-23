FROM ifunsoftware/c3-base:latest

# Install ssh and supervisor
RUN apt-get -q -y install openssh-server supervisor
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

# Add services configuration for supervisor
COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Configure 'c3-next' service startup in supervisor
COPY conf/start_c3.sh /usr/bin/start_c3.sh
RUN chmod +x /usr/bin/start_c3.sh

# Setup root credentials for ssh
RUN echo 'root:password' > /root/passwdfile
RUN cat /root/passwdfile | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN wget -O /opt/c3.jar 'http://repository.ifunsoftware.com/service/local/artifact/maven/redirect?r=snapshots&g=org.aphreet.c3&a=c3-deploy&v=LATEST' --content-disposition

RUN mkdir -p /opt/c3-app && unzip /opt/c3.jar -d /opt/c3-app && rm /opt/c3.jar

RUN rm -rf /opt/virgo/repository/usr/* && rm -rf /opt/virgo/pickup/*

RUN cp /opt/c3-app/server/lib/* /opt/virgo/repository/usr/

RUN cp /opt/c3-app/server/pickup/c3.plan /opt/virgo/pickup/

RUN rm -rf /opt/c3-app 

EXPOSE 22 8080 8443 7375

ENTRYPOINT ["/usr/bin/supervisord"]
