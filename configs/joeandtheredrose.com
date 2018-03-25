server {
	listen 443 ssl;
  
  ssl_certificate /etc/letsencrypt/live/joeandtheredrose.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/joeandtheredrose.com/privkey.pem;

	root /var/www/joeandtheredrose.com;

	index index.html index.htm index.nginx-debian.html;

	server_name joeandtheredrose.com www.joeandtheredrose.com;

	location / {
		try_files $uri $uri/ =404;
	}
}