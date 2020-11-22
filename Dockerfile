FROM adoptopenjdk/openjdk11:centos
#RUN yum install -y git
#RUN git clone https://github.com/spring-projects/spring-petclinic.git
#RUN cd spring-petclinic; ./mvnw package
RUN ./mvnw package
WORKDIR /spring-petclinic/
EXPOSE 8080
CMD java -jar target/*.jar
