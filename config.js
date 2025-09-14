const Store = require('electron-store');
const packagejson = require("./package.json")
const store = new Store();
module.exports = {
  newsfeed: (gitRemote) => {
    return `https://speedyhawke.com/home/item?uri=${gitRemote}&display=feed`
  },
  profile: (gitRemote) => {
    return `https://speedyhawke.com/home/item?uri=${gitRemote}&display=profile`
  },
  site: "https://speedyhawke.com/home",
  discover_dark: "https://speedyhawke.com/home/app?theme=dark",
  discover_light: "https://speedyhawke.com/home/app",
  portal: "https://speedyhawke.com/home/portal",
  docs: "https://speedyhawke.com/program.speedyhawke.computer",
  install: "https://speedyhawke.com/program.speedyhawke.computer/#/?id=install",
  agent: "electron",
  version: packagejson.version,
  store
}
