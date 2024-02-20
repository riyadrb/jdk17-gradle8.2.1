FROM openjdk:17-jdk-slim

WORKDIR /app

ENV GRADLE_HOME /opt/gradle
ENV GRADLE_VERSION 8.2.1

# Install dependencies and Gradle
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget -q --no-check-certificate --no-cookies https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    mkdir -p $GRADLE_HOME && \
    unzip -d $GRADLE_HOME gradle-${GRADLE_VERSION}-bin.zip && \
    rm gradle-${GRADLE_VERSION}-bin.zip

# Verify installation by path
RUN ${GRADLE_HOME}/gradle-${GRADLE_VERSION}/bin/gradle --version

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["bash"]
