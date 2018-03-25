server {
	listen 443 ssl;
  
  ssl_certificate /etc/letsencrypt/live/blendwakanda.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/blendwakanda.com/privkey.pem;

	root /var/www/blendwakanda.com;

	index index.html index.htm index.nginx-debian.html;

	server_name blendwakanda.com www.blendwakanda.com;

	location / {
		try_files $uri $uri/ =404;
	}
}
