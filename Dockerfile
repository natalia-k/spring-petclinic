FROM adoptopenjdk/openjdk11:alpine as builder
RUN mkdir -p /app/source
COPY . /app/source
WORKDIR /app/source
RUN ./mvnw  package 
#RUN ./mvnw install -DskipTests=true -Dmaven.javadoc.skip=true -B -V

FROM adoptopenjdk/openjdk11:alpine as run
COPY --from=builder /app/source/target/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
