# Docker


look at docker's running container
```
docker ps
```

get bash of docker container
```
docker exec -i -t 8a59eed4da82 /bin/bash
```

copy file between docker container and host
```
docker cp foo.txt mycontainer:/foo.txt
docker cp mycontainer:/foo.txt foo.txt
```

stop a container
```
docker stop foo
```

kill a container
```
docker kill foo
```

remove a container
```
docker rm ----force foo
```

