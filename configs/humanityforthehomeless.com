server {
	listen 443 ssl;
  
	ssl_certificate /etc/letsencrypt/live/humanityforthehomeless.com/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/humanityforthehomeless.com/privkey.pem;


	server_name humanityforthehomeless.com www.humanityforthehomeless.com;

	add_header Cache-Control public;
	  location / {
	    proxy_pass http://127.0.0.1:8080; # change this
	    proxy_buffering on;
	    proxy_buffers 12 12k;
	    proxy_redirect off;
	
	    proxy_set_header X-Real-IP $remote_addr;
	    proxy_set_header X-Forwarded-For $remote_addr;
	    proxy_set_header Host $host;
	    proxy_set_header X-Forwarded-Proto $scheme;
	  }
	#location /wp {
	#    proxy_pass http://127.0.0.1:8080/wp/wp-content; # change this
	#    proxy_buffering on;
	#    proxy_buffers 12 12k;
	#    proxy_redirect off;
	#
	#    proxy_set_header X-Real-IP $remote_addr;
	#    proxy_set_header X-Forwarded-For $remote_addr;
	#    proxy_set_header Host $host;
	#	}
		
	#  location ~ \.php$ {
	#      fastcgi_pass unix:/run/php/php7.0-fpm.sock;
	#      include snippets/fastcgi-php.conf;
	#  }
}
