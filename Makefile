all: rails/all laravel/all django/all

rails/all: rails/ruby2.6/image rails/ruby2.7/image rails/ruby3.0/image rails/ruby3.1/image rails/ruby3.2/image

laravel/all: laravel/php7.4/image laravel/php8.0/image laravel/php8.1/image laravel/php8.2/image

django/all: django/python3.8/image django/python3.9/image django/python3.10/image django/python3.11/image

%/image:
	@./build-image.sh $@
