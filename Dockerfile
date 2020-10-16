FROM ubuntu

RUN apt update && apt install -y gpsbabel maven
RUN mvn -version

COPY pom.xml .
COPY src/checkstyle src/checkstyle

# Install the dependencies.
RUN mvn verify

# Build the code and run tests.
COPY src src
RUN mvn verify

FROM openjdk:11-jre-slim
RUN addgroup --gid 3000 --system biking2 && adduser --uid 100000 --system --gid 3000 --no-create-home --disabled-password biking2
USER 100000
COPY --from=0 --chown=biking2:biking2 /target/biking2-3.0.7-SNAPSHOT.jar /target/biking2-3.0.7-SNAPSHOT.jar

WORKDIR /target
# Use the "exec" shell built-in here, to make
# sure that the program executes as PID 1 and
# therefore receives signals correctly.
CMD exec java -Xmx64m -Xms64m -jar biking2-3.0.7-SNAPSHOT.jar
EXPOSE 8080
