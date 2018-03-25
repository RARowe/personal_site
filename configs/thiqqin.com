server {
	listen 443 ssl;
  
  ssl_certificate /etc/letsencrypt/live/thiqqin.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/thiqqin.com/privkey.pem;

	root /var/www/thiqqin.com;

	index index.html index.htm index.nginx-debian.html;

	server_name thiqqin.com www.thiqqin.com;

	location / {
		try_files $uri $uri/ =404;
	}
}