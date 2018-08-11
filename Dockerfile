FROM node:alpine 
ENV NPM_CONFIG_LOGLEVEL warn
WORKDIR /
COPY package.json .
RUN npm i --ignore-scripts --unsafe-perm
WORKDIR /test
VOLUME [ "/test" ]
CMD ["mocha --compilers js:babel-core/register ."]
