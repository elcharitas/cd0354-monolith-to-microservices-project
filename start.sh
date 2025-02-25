# run env setup script
export $(cat .env | xargs) && \
# Make sure the Docker services are running in your local machine
# Run this command from the directory where you have the "docker-compose-build.yml" file present
docker-compose -f docker-compose-build.yaml build --parallel && \

# Run this command from the directory where you have the "docker-compose.yml" file present
docker-compose up;
