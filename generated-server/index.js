const http = require('http');
const express = require("express");
const { initialize } = require('@oas-tools/core');


const serverPort = 8080;
const app = express();
app.use(express.json({limit: '50mb'}));

const config = {
    middleware: {
        security: {
            auth: {
            }
        }
    }
}


initialize(app, config).then(() => {
    http.createServer(app).listen(serverPort, () => {
    console.log("\nApp running at http://localhost:" + serverPort);
    console.log("________________________________________________________________");
    if (config.middleware.swagger?.disable !== false) {
        console.log('API docs (Swagger UI) available on http://localhost:' + serverPort + '/docs');
        console.log("________________________________________________________________");
    }
    });
});
