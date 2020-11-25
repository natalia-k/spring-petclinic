FROM adoptopenjdk/openjdk11:alpine as builder
RUN mkdir -p /app/source
COPY . /app/source
WORKDIR /app/source
RUN  ./mvnw clean package

FROM builder
COPY --from=builder /app/source/target/*.jar /app/
EXPOSE 8080
CMD ["java", "-jar", "/app/*.jar"]
