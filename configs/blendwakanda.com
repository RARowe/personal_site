server {
	listen 80;
	listen [::]:80;

	root /var/www/blendwakanda.com;

	index index.html index.htm index.nginx-debian.html;

	server_name blendwakanda.com www.blendwakanda.com;

	location / {
		try_files $uri $uri/ =404;
	}
}
