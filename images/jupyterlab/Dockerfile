FROM jupyter/pyspark-notebook:spark-3.2.0

USER root

RUN (cd /usr/local/spark/jars && wget https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.1/hadoop-aws-3.3.1.jar)
RUN (cd /usr/local/spark/jars && wget https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.950/aws-java-sdk-bundle-1.11.950.jar)
RUN (cd /usr/local/spark/jars && wget https://repo1.maven.org/maven2/net/java/dev/jets3t/jets3t/0.9.4/jets3t-0.9.4.jar)

ENV PYSPARK_SUBMIT_ARGS '--packages com.amazonaws:aws-java-sdk:1.11.950,org.apache.hadoop:hadoop-aws:3.3.1,net.java.dev.jets3t:jets3t:0.9.4 pyspark-shell'

USER $NB_UID