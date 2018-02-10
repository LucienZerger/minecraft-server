FROM ubuntu:16.04

WORKDIR /minecraft
COPY server.properties ./
COPY eula.txt ./

RUN apt-get update && apt-get install -y openjdk-8-jdk wget screen nano && java -version
RUN wget -O minecraft_server.jar https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar

EXPOSE 25565
#EXPOSE 19132 25565

CMD ["java", "-Xmx1G", "-Xms1G", "-jar", "minecraft_server.jar", "nogui"]

