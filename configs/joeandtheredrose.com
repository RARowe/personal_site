server {
	listen 80 default_server;
	listen [::]:80 default_server;

	root /var/www/joeandtheredrose.com;

	index index.html index.htm index.nginx-debian.html;

	server_name joeandtheredrose.com www.joeandtheredrose.com;

	location / {
		try_files $uri $uri/ =404;
	}
}