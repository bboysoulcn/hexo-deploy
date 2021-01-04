# Container image that runs your code
FROM node:14.15.3-alpine

LABEL "com.github.actions.name"="Hexo deploy"
LABEL "com.github.actions.description"="Auto deploy hexo to github"
LABEL "com.github.actions.icon"="git-commit"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="https://github.com/bboysoulcn/hexo-deploy"
LABEL "homepage"="https://github.com/bboysoulcn/hexo-deploy"
LABEL "maintainer"="bboysoul"

RUN apk -U --no-cache add git

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]
