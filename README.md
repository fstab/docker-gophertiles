docker-gophertiles
==================

This is a copy of the demo on [https://http2.golang.org](https://http2.golang.org).
It can be used for showing the demo without a network connection.

*WARNING:* _The docker host's IP address is hard-coded: [192.168.99.100](https://192.168.99.100:4430). If your docker host has another address, change it in the `Dockerfile` and re-build the image._

Run from Docker Hub
-------------------

```bash
docker run -p 4430:4430 -p 8080:8080 fstab/gophertiles
```

Then point your web browser to [https://192.168.99.100:4430](https://192.168.99.100:4430). The address is hard-coded in the Dockerfile, see the warning above.

Build from Source
-----------------

1. Clone [fstab/docker-gophertiles](https://github.com/fstab/docker-gophertiles) from GitHub.

   ```bash
   git clone https://github.com/fstab/docker-gophertiles.git
   ```
2. Build the docker image

   ```bash
   cd docker-gophertiles
   docker build -t="fstab/gophertiles" .
   ```

3. Run with the same command as described above.

   ```bash
   docker run -p 4430:4430 -p 8080:8080 fstab/gophertiles
   ```
