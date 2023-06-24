FROM bellsoft/liberica-openjdk-alpine AS builder

# Copy the source code to the container
COPY ./src /usr/src/app/src

# Set the working directory
WORKDIR /usr/src/app

# Compile the source code
RUN javac -sourcepath src/main/java -d out src/main/java/org/example/Main.java

# Generate Javadoc
RUN javadoc -d docs -sourcepath src/main/java -subpackages org

# Build stage
FROM nginx:alpine

# Copy the generated Javadoc documentation
COPY --from=builder /usr/src/app/docs /usr/share/nginx/html

# Expose the documentation port
EXPOSE 80

# Start the web server to serve the Javadoc documentation
CMD ["nginx", "-g", "daemon off;"]
