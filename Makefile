all: spark
push: push-spark
.PHONY: push push-spark spark

TAG = 1.6.2

spark:
	docker build -t afritzler/spark-arm .
	docker tag afritzler/spark-arm afritzler/spark-arm:$(TAG)

push-spark: spark
	docker push afritzler/spark-arm
	docker push afritzler/spark-arm:$(TAG)

clean:
	docker rmi afritzler/spark-arm:$(TAG) || :
	docker rmi afritzler/spark-arm || :
