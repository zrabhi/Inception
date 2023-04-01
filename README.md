 
# WHAT is DOCKER? 📝
Docker is an open source platform that enables developers to build, deploy, 
run, update and manage containers—standardized, executable components that combine application source code with
the operating system (OS) libraries and dependencies required to run that code in any environment.

# WHAT is DOCKERFILE ?

Docker builds images automatically by reading the instructions from a Dockerfile. It is a text file without any .txt extensions that contains all commands in order, needed to build a given image. It is always named Dockerfile.

Docker image consists of read-only layers each of which represents a Dockerfile instruction. The layers are stacked and each one is a delta of the changes from the previous layer. 

Containers are read-write layers that are created by docker images.

In simple words, a Dockerfile is a set of instructions that creates a stacked-layer for each instruction that collectively makes an image(which is a prototype or template for containers )

## DOCKERFILE COMMADS:
    
~~~bash
    FROM: Defines a base image, it can be pulled from docker hub (for example- if we want to 
            create a javascript application with node as backend then we need to have node as a base image, so it can run node application). 
    RUN: Executes command in a new image layer( we can have multiple run commands).
    CMD: Command to be executed when running a container( It is asked to have one CMD command, 
            If a Dockerfile has multiple CMDs, it only applies the instructions from the last one.
    EXPOSE: Documents which ports are exposed (It is only used for documentation).
    ENV: Sets environment variables inside the image.
    COPY: Copies files/directories into the image.
    ADD: A more feature-rich version of the COPY instruction. COPY is preferred over ADD.
    ENTRYPOINT: Define a container's executable (You cannot override and ENTRYPOINT when 
                starting a container unless you add the --entrypoint flag.).
    VOLUME: Defines which directory in an image should be treated as a volume. The volume will be given a random name 
            which can be found using docker inspect command.
~~~

## Run Locally  

Clone the project  

~~~bash  
  git clone https://github.com/zrabhi/Inception.git
~~~

Go to the project directory  

~~~bash  
  cd srcs
~~~

run docker-compose

~~~bash
  docker-compose up
~~~
