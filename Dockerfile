FROM adoptopenjdk/openjdk11:alpine as builder

WORKDIR '/spring-petclinic'

COPY . .
RUN ./mvnw package > /dev/null

# FROM alpine as run
# COPY --from=builder /app/source/target/*.jar /app/app.jar
EXPOSE 8080
CMD ["java", "-jar", "target/*.jar"]
