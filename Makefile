all: src/main/java/io/jetstack/cassandra/*.java
	mvn package

clean:
	mvn clean
