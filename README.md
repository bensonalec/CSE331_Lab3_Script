docker run -it khaledhassan/simplescalar bash

From directory with script.sh you unzipped this in:
docker cp script.sh dockerID:/simplescalar/

Inside the docker container:

chmod u+x script.sh
./script.sh
