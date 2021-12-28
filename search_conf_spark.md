conf.set("spark.kubernetes.namespace", "anonymous")
conf.set("spark.kubernetes.authenticate.driver.serviceAccountName", "default-editor")
conf.set("spark.kubernetes.authenticate.driver.oauthToken", "ABCXYZ...")
conf.set("spark.kubernetes.container.image", "docker.io/stevenzinck/spark:2.4.4-hadop_3.2.1")
conf.set("spark.kubernetes.allocation.batch.size", "5")
conf.set("spark.kubernetes.executor.instances", "1")
conf.set("spark.driver.bindAddress", "0.0.0.0")
conf.set("spark.driver.host", "jupyter")
conf.set("spark.driver.port", "37371")
conf.set("spark.blockManager.port", "6060")

!pip install pyspark
from pyspark.sql import SparkSession
spark = SparkSession.builder\
        .appName('testspark')\
        .getOrCreate()

sc._jsc.hadoopConfiguration().set("fs.s3a.access.key", "minio")
sc._jsc.hadoopConfiguration().set("fs.s3a.secret.key", "minio123")
sc._jsc.hadoopConfiguration().set("fs.s3a.endpoint", "minio-hl-svc.default.svc.cluster.local:9000")
sc._jsc.hadoopConfiguration().set("fs.s3a.path.style.access", "true")
sc._jsc.hadoopConfiguration().set("fs.s3a.connection.ssl.enabled", "false")
sc._jsc.hadoopConfiguration().set("fs.s3a.impl", "org.apache.hadoop.fs.s3a.S3AFileSystem")
sc._jsc.hadoopConfiguration().set("fs.s3a.connection.ssl.enabled", "false")

sc.parallelize([1,2,3,4,5]).count()

https://www.sspaeti.com/blog/data-engineering-project-in-twenty-minutes/


from pyspark.sql import SparkSession, SQLContext

spark = SparkSession.builder \
        .appName('testspark') \
        .master('spark://spark-master-svc.spark.svc.cluster.local:7077') \
        .config("spark.driver.host", "max001-lab.jupyterhub.svc.cluster.local") \
        .config('spark.driver.port', 2020) \
        .config("spark.driver.bindAddress", "0.0.0.0") \
        .config("spark.blockManager.port", "6060") \
        .getOrCreate()

spark.range(1,9).collect()