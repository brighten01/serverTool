
#nodebb upstream配置 文档
```
upstream {
  ip_hash;
  server 50.112.67.125;
  server 52.40.180.6;
}

server {
        listen 80;
        server_name  forum.supersu.com ;

        location / {
         proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Host $http_host;
        proxy_set_header X-NginX-Proxy true;
        proxy_pass http://io_nodes;
              #  proxy_pass http://127.0.0.1:4567;
        proxy_http_version 1.1;
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection "upgrade";
        }
}
server {
        listen 80;
        server_name  www.supersu.com supersu.com supersu.phyer.click;

        location / {
                proxy_pass http://127.0.0.1:3000;
        }
}
```