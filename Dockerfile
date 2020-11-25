FROM adoptopenjdk/openjdk11:centos

WORKDIR '/spring-petclinic'

COPY . .
RUN ./mvnw package

EXPOSE 8080
CMD ["java", "-jar", "target/*.jar"]
