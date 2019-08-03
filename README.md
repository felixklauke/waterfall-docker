# waterfall-docker
Docker image for the popular bungee cord fork called Waterfall that aims to improve performance and stability.

# Docker compose
If you prefer docker-compose / stack checkout `docker-compose.yml` or the following example:
```yaml
version: '3.7'

services:

  waterfall:
    image: felixklauke/waterfall:1.14
    container_name: waterfall
    restart: always
    stdin_open: true
    tty: true
    networks:
      - minecraft
    ports:
      - 25565:25565
    volumes:
      - waterfall-logs:/opt/waterfall/server/logs
      - waterfall-plugins:/opt/waterfall/server/plugins

volumes:
  waterfall-logs: {}
  waterfall-plugins: {}

networks:
  minecraft: {}

```
