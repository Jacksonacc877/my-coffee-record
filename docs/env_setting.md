# Env Building

## **Refer:** [Develop Jekyll in container](https://github.com/BillRaymond/my-jekyll-docker-website)

Thanks the help of this repo and the step by step video.

## Installation Step

### Requirements
- [Jekyll](https://jekyllrb.com/docs/installation/#requirements)
- [Github Pages](https://pages.github.com/versions/)

### Create docker file
```
# Create a Jekyll container from Ruby Alpine image

# Ruby 2.7 with Apline
FROM ruby:2.7-alpine3.16

# Add Jekyll dependencies to Alpine
RUN apk update
RUN apk add --no-cache build-base gcc cmake git

# Update Ruby bundler, install jekyll
RUN gem update bundler
# RUN gem install bundler jekyll 
# comment for this issue
# https://github.com/BillRaymond/my-jekyll-docker-website/issues/4
```

### Copy Gemfile from the repo
Add the following code in Gemfile to specify jekyll version fitting github page
```
gem "jekyll", "~> 3.9.3"
```

### Build Jekyll Website
Execute following command
> Future: execute code automation when dev container build up
```
bundle install
bundle update
bundle exec jekyll new --force --skip-bundle .
bundle exec jekyll serve --livereload
```

## Error enconutered
### Error
Following the steps form the reference repo, I encounter this
[issue](https://github.com/sass/dart-sass-embedded/issues/106#issuecomment-1374950950)
when container is building up from dockerfile.
> jekyll-sass-converter package is updated, and github pages still use version 1.x, besides deploy repo from Github Action ([package info](https://github.com/jekyll/jekyll-sass-converter/blob/4e12e80391b664c354a58d12a4e4fde90a427047/README.md#migrate-from-2x-to-3x))

### Solution
Through this
[temp solution](https://github.com/BillRaymond/my-jekyll-docker-website/issues/4)
, I solve the package conflict problem and make the website run.
