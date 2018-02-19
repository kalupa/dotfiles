const os = require("os");
const fs = require("fs");
const path = require("path");
const ini = require("ini");

const awsCreds = ini.parse(
  fs.readFileSync(`${os.homedir}/.aws/credentials`, "utf-8")
);

console.log(`
export AWS_ACCESS_KEY_ID="${awsCreds.default.aws_access_key_id}"
export AWS_SECRET_ACCESS_KEY="${awsCreds.default.aws_secret_access_key}"
`);
