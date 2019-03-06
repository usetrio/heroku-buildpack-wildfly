#!/usr/bin/env bash

set -e

export WILDFLY_VERSION=${WILDFLY_VERSION:-"12.0.0.Final"}
export WILDFLY_SHA1=${WILDFLY_SHA1:-"b2039cc4979c7e50a0b6ee0e5153d13d537d492f"}
export POSTGRES_DRIVER_VERSION=${POSTGRES_DRIVER_VERSION:-"42.2.5"}
export POSTGRES_DRIVER_SHA1=${POSTGRES_DRIVER_SHA1:-"951b7eda125f3137538a94e2cbdcf744088ad4c2"}

export JBOSS_FOLDER=".jboss"
export JBOSS_BUILD_DIR="${JBOSS_FOLDER}/wildfly-${WILDFLY_VERSION}"
export JBOSS_HOME="${HOME}/${JBOSS_BUILD_DIR}"

export JBOSS_LOG_MANAGER_LIB="$(echo $JBOSS_HOME/modules/system/layers/base/org/jboss/logmanager/main/jboss-logmanager-*.jar)" # resolve logmanager jar
export JAVA_OPT+=" -Xbootclasspath/p:$JBOSS_LOG_MANAGER_LIB  -Djboss.modules.system.pkgs=org.jboss.byteman,org.jboss.logmanager  -Djava.util.logging.manager=org.jboss.logmanager.LogManager" # register jboss logmanager at jvm early startup