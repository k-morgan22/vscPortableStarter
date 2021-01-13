const createProxyMiddleware = require('http-proxy-middleware');
process.env.NODE_CONFIG_DIR = "../config/"
const config = require("config");


module.exports = function(app) {
  app.use(
    '/api',
    createProxyMiddleware({
      target: config.get('proxy'),
      changeOrigin: true,
    })
  );
};