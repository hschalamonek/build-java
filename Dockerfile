FROM hschalamonek/java

# Download and install maven

ENV MAVEN_VERSION_MAJOR=3 \
    MAVEN_VERSION_MINOR=3 \
    MAVEN_VERSION_BUILD=3 \
    M2_HOME=/opt/maven \
    MAVEN_OPTS="-Xmx512m -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true"

ENV PATH=${PATH}:${M2_HOME}/bin

RUN echo "Downloading maven..." && \
    wget -qO- --no-check-certificate http://www.eu.apache.org/dist/maven/maven-${MAVEN_VERSION_MAJOR}/${MAVEN_VERSION_MAJOR}.${MAVEN_VERSION_MINOR}.${MAVEN_VERSION_BUILD}/binaries/apache-maven-${MAVEN_VERSION_MAJOR}.${MAVEN_VERSION_MINOR}.${MAVEN_VERSION_BUILD}-bin.tar.gz \
        | tar xz -C /tmp && \
    mv /tmp/apache-maven-${MAVEN_VERSION_MAJOR}.${MAVEN_VERSION_MINOR}.${MAVEN_VERSION_BUILD} ${M2_HOME}

# Remove junk

RUN rm -rf /tmp/*
