FROM node:16 AS ui-build
WORKDIR /usr/src/app
COPY UX/Angular ./my-app/
RUN cd my-app && npm install @angular/cli && npm install && npm run build

FROM node:16 AS server-build
WORKDIR /root/
COPY --from=ui-build /usr/src/app/my-app/dist/angular .
COPY Common/Nodejs/package*.json ./
RUN ls
RUN npm install
COPY Common/Nodejs/app.js .

EXPOSE 3080

CMD ["node", "app.js"]