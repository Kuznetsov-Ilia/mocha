FROM node:alpine 
ENV NPM_CONFIG_LOGLEVEL warn
ENV PATH $PATH:/node_modules/.bin
WORKDIR /
RUN npm init -y && \
    npm i @babel/core @babel/preset-env mocha should supertest && \
    apk --update add --no-cache postgresql-client
WORKDIR /test
VOLUME [ "/test" ]
CMD ["mocha", "--compilers", "js:babel-core/register", "/test"]
