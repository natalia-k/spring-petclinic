FROM adoptopenjdk/openjdk11:alpine AS build
WORKDIR '/spring-petclinic'
COPY . .
RUN ./mvnw package

FROM adoptopenjdk/openjdk11:alpine AS run
WORKDIR '/spring-petclinic'
COPY --from=builder  /spring-petclinic/* .

EXPOSE 8080

CMD ["java", "-jar", "target/*.jar"]
