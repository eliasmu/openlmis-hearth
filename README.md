# OpenLMIS-hearth

EXPERIMENTAL (Not intended for production use)

This repository contains code that creates a docker container image that runs the latest version of jembi/hearth server as an OpenLMIS v3 servcie. 

## Usage

### Building the customized container image
Clone this repository, 
```
git clone https://github.com/eliasmu/openlmis-hearth
cd openlmis-hearth
./build.sh 
```
#### What customizations does openlmis-hearth apply?
- It registers `/fhir/*` URLs in OpenLMIS v3 consule to be served by this service (base image from `jembi/hearth`)
- Disables authentication in hearth (NOT SUITABLE FOR PRODUCTION USE)
- Uses OpenLMIS v3 environment variable to inject / configure hearth with the right base URL.

### Running openlmis-hearth as a microservice

After building the openlmis/openlmis-hearth image, it is possible to run it as a microservice by adding the following lines in your OpenLMIS v3 docker-compose.yml file. 
```
mongo:
    image: mongo
    depends_on: [consul]

  hearth:
    image: openlmis/openlmis-hearth
    depends_on: [consul, mongo]
    env_file: settings.env
    volumes:
      - 'service-config:/config'
```

#### How do I know it is working? 

After following the steps above, start OpenLMIS v3. In console, `docker ps` can be run to verify that the mongo and openlmis-hearth containers are running. Once the containers are verified running, visiting `OPENLMIS_BASE_URL/fhir/Location` in the browser will return valid response.




