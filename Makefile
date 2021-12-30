all: rails/all laravel/all mariadb/image generic/image


rails/all: rails/ruby2.4/image rails/ruby2.5/image rails/ruby2.6/image rails/ruby2.7/image rails/ruby3.0/image rails/ruby3.1/image

laravel/all: laravel/php7.2/image laravel/php7.3/image laravel/php7.4/image laravel/php8.0/image

%/image: % %/Dockerfile
	@./build-image.sh $^
	@./push-image.sh $^
