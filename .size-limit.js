const { readdirSync } = require("fs");

const files = readdirSync("dist");

module.exports = files
  .filter((file) => file.endsWith(".js"))
  .map((file) => ({ path: `dist/${file}` }));
