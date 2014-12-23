#!/bin/sh

JAVA_HOME="$(update-java-alternatives -l | cut -d ' ' -f 3)" JAVA_OPTS="-Xmx1024m -Dc3.home=/opt/c3/config -Dc3.data=/opt/c3/data" /opt/virgo/bin/startup.sh

