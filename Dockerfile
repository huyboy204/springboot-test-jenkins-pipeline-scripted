# FROM openjdk:17-alpine
FROM alpine:3.18

RUN apk add --no-cache openjdk17

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH=$PATH:$JAVA_HOME/bin

WORKDIR /app

COPY target/spring-petclinic-3.1.0-SNAPSHOT.jar /app/spring-petclinic-3.1.0-SNAPSHOT.jar
RUN chown nobody:nogroup /app/spring-petclinic-3.1.0-SNAPSHOT.jar
RUN mkdir -p logs
RUN chown nobody:nogroup /app/logs/

EXPOSE 8080

USER nobody

CMD ["sh", "-c", "java -jar spring-petclinic-3.1.0-SNAPSHOT.jar | tee /app/logs/logs.txt"]
# RUN java -jar spring-petclinic-3.1.0-SNAPSHOT.jar | tee /app/logs/logs.txt