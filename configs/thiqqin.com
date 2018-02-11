server {
	listen 80;
	listen [::]:80;

	root /var/www/sites/thiqqin.com;

	index index.html index.htm index.nginx-debian.html;

	server_name thiqqin.com www.thiqqin.com;

	location / {
		try_files $uri $uri/ =404;
	}
}