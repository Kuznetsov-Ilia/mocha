FROM node:alpine 
ENV NPM_CONFIG_LOGLEVEL warn
WORKDIR /
COPY package.json .
RUN npm init -y && \
    npm i babel-core babel-preset-env dotenv mocha should supertest
WORKDIR /test
VOLUME [ "/test" ]
CMD ["/node_modules/.bin/mocha", "--compilers", "js:babel-core/register", "/test"]
