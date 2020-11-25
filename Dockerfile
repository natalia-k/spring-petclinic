FROM adoptopenjdk/openjdk11:alpine AS build
WORKDIR '/spring-petclinic'
COPY . .

CMD ["mvnw", "package"]
