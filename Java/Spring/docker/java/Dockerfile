ARG JAVA_VERSION
FROM gradle:jdk${JAVA_VERSION}-alpine
WORKDIR /app
COPY run.sh /scripts

RUN chmod +x /scripts/run.sh
