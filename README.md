# Docker compose file to deploy GoCD server with x2 auto-registered GoCD agents

## Requirements
* Docker
* Docker compose

## Tested using the following deployment environments
* macOS Sequoia version 15.4.1 using Docker version 27.1.1-rd, build cdc3063

## Usage Instructions

1. Clone the repo
2. From inside the repo run `docker-compose up` or `docker-compose up -d` to run in daemon mode
3. Wait for a few minutes
   - The server will take a few minutes to start up and register the agents
   - The agents will take a few minutes to register with the server
4. Access the GoCD server at `http://<hostname>:8153`
5. To stop the stack use `docker-compose down`  

**Notes**

- To change the auto-reg key edit `/godata/config/cruise-config.xml`
- The file `/godata/config/cruise-config.xml` will be populated/overwritten when the stack is launched (i.e with agent reg details).
- To add or delete a pipeline edit `/godata/config/cruise-config.xml`
- To add or delete users edit `/godata/users/password.properties`
- First login must be with an admin, set an user in `/godata/users/password.properties` (test@test.com / test1234) by default. 
