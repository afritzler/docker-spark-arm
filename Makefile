all: spark zeppelin
push: push-spark push-zeppelin
.PHONY: push push-spark push-zeppelin spark zeppelin zeppelin-build

TAG = 1.6.2

spark:
	docker build -t afritzler/spark-arm .
	docker tag afritzler/spark-arm afritzler/spark-arm:$(TAG)

push-spark: spark
	gcloud docker push afritzler/spark-arm
	gcloud docker push afritzler/spark-arm:$(TAG)

clean:
	docker rmi afritzler/spark-arm:$(TAG) || :
	docker rmi afritzler/spark-arm || :