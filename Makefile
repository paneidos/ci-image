all: rails/all laravel/all mariadb/image generic/image serverless/all

rails/all: rails/ruby2.6/image rails/ruby2.7/image rails/ruby3.0/image rails/ruby3.1/image

laravel/all: laravel/php7.2/image laravel/php7.3/image laravel/php7.4/image laravel/php8.0/image laravel/php8.1/image

serverless/all: serverless/python3.8/image serverless/python3.9/image serverless/python3.10/image

%/image: % %/Dockerfile
	@./build-image.sh $^
	@./push-image.sh $^
