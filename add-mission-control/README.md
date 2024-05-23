To add mission-control to any multi-container environment, add the following information:

To `docker-compose.yaml`:

```
  mission-control:
    image: datastax/mission-control:${MCTAG}
    depends_on:
      - backend-1
    networks:
      - backend
```

To the `start_***.sh` at the top with the other exported variables:

```
export MCTAG=latest
```

and after the last line in `start_***.sh`:

```
# Bring up mission-control

docker-compose up -d mission-control
```
