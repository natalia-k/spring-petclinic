FROM adoptopenjdk/openjdk11:alpine as builder
RUN mkdir -p /app/source
COPY . /app/source
WORKDIR /app/source
RUN  ./mvnw clean package -B -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn

FROM builder as run
COPY --from=builder /app/source/target/*.jar /app/
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/*.jar"]
