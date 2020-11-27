FROM adoptopenjdk/openjdk11:alpine as builder
WORKDIR '/spring-petclinic'
COPY . .
RUN ./mvnw package > /dev/null

COPY /spring-petclinic/target/*.jar /app.jar
# FROM adoptopenjdk/openjdk11:alpine as run
# COPY --from=0 /spring-petclinic/target/*.jar /app.jar
EXPOSE 8080
CMD ["java","-jar","/app.jar"]
