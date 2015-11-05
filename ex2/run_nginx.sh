sudo docker run -d --name redis -p 6379:6379 exam2/redis

sudo docker run -d --name node1 -p 8080 --link redis:redis exam2/node
sudo docker run -d --name node2 -p 8080 --link redis:redis exam2/node
sudo docker run -d --name node3 -p 8080 --link redis:redis exam2/node

sudo docker run -d --name nginx -p 8011:80 --link node1:node1 --link node2:node2 --link node3:node3 exam2/nginx
