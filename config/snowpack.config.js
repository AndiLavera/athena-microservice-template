/**
 * Snowpack Configuration File
 *
 * See all supported options: https://www.snowpack.dev/reference/configuration
 */

/** The folders that will be exluded from being watched. */
const exclude = ["**/node_modules/**/*", "**/lib/**/*"];

/**
 * The paths that will be mounted.
 *
 * Any `asset` folders in a microservice will be added to this automatcally. The code
 * for this
 */
const mount = {
  "../public": { url: "/" },
};

/**
 * Snowpack plugins for adding functionality.
 *
 * List of available plugins: https://www.snowpack.dev/plugins
 */
const plugins = [
  /** Sass support */
  [
    "@snowpack/plugin-sass",
    {
      /** Minify CSS */
      style: "compressed",
      /** Generate source maps */
      sourceMap: true,
    },
  ],
];

const packageOptions = {};

const devOptions = {
  /** Stream logs instead of clearing the terminal */
  output: "stream",
  /** Don't open a web page when the server turns on */
  open: "none",
  /** Enables hot module reloading */
  hmr: true,
};

const buildOptions = {
  /** The folder assets will be written to after building. */
  out: "../public/dist",
};

const { join } = require("path");
const { readdirSync, lstatSync } = require("fs");

/**
 * Returns true if path is a directory.
 * @param {string} pathname
 */
const isDirectory = (pathname) => lstatSync(pathname).isDirectory();

/**
 * Returns an array of directories found in a particular directory.
 * @param {string} source
 */
const getDirectories = (source) =>
  readdirSync(source, { withFileTypes: true })
    .filter((dirent) => dirent.isDirectory())
    .map((dirent) => dirent.name);

const folders = getDirectories("./src");

/**
 * Iterates through all the folders found in `src`. If an assets folder exists
 * add it to the mount paths.
 *
 * An `assets` folder in `src/about` will generate a mount path like:
 *
 * `"../src/about/assets": { url: "/about" }`
 *
 * The key is a relative path from this config file to the asset dir.
 */
folders.forEach((folder) => {
  if (!isDirectory(join("./src", folder, "assets"))) return;

  mount[join("../src", folder, "assets")] = {
    url: join("/", folder),
  };
});

/** @type {import("snowpack").SnowpackUserConfig } */
module.exports = {
  exclude,
  mount,
  plugins,
  packageOptions,
  devOptions,
  buildOptions,
};
