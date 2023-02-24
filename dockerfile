# Create a Jekyll container from Ruby Alpine image

# Ruby 2.5 or later
FROM ruby:2.7-alpine3.16

# Add Jekyll dependencies to Alpine
RUN apk update
RUN apk add --no-cache build-base gcc cmake git

# Update Ruby bundler, install jekyll
RUN gem update bundler && gem install bundler jekyll