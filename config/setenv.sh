#!/bin/sh

JAVA_OPTS="$JAVA_OPTS"

# JVM Debug
#JAVA_OPTS="$JAVA_OPTS -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=51081"

# JVM Memory
JAVA_OPTS="$JAVA_OPTS -Xms256M -Xmx1G -XX:+HeapDumpOnOutOfMemoryError"
JAVA_OPTS="$JAVA_OPTS -XX:ParallelGCThreads=2"
JAVA_OPTS="$JAVA_OPTS -XX:+PrintGC -XX:+PrintGCDetails"
JAVA_OPTS="$JAVA_OPTS -XX:+PrintClassHistogram"

# Application properties
JAVA_OPTS="$JAVA_OPTS -Dspring.profiles.active=postgres"

# Hibernate trace
JAVA_OPTS="$JAVA_OPTS -Dhibernate.showSql=false"
JAVA_OPTS="$JAVA_OPTS -Dhibernate.formatSql=true"

# Set default locale for internal usage
JAVA_OPTS="$JAVA_OPTS -Duser.region=RU"
JAVA_OPTS="$JAVA_OPTS -Duser.language=ru"

export JAVA_OPTS

