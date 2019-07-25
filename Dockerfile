# base image
FROM node:alpine as builder

# Set the working directory to /app
WORKDIR '/app/'

COPY package.json .


# Install any needed packages specified in requirements.txt
RUN npm install

COPY . .

# Make port 80 available to the world outside this container
#EXPOSE 80

# Define environment variable
#ENV NAME World

# Run npm start  when the container launches
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html