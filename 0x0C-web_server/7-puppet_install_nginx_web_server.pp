#Install Nginx web server

#install nginx
package {'nginx':
  ensure   => 'installed',
  provider => apt,
}

file {'/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
}

file {'/etc/nginx/sites-available/default':
  ensure  => file,
  content => '
server {
	listen 80 ;
	listen [::]:80;
	root /var/www/html;
	index index.html;
	server_name _;
	location / {
		try_files $uri $uri/ =404;
	}
	location /redirect_me {
		return 301 /;
	}
}',
}
