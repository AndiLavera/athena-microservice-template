// Snowpack Configuration File
// See all supported options: https://www.snowpack.dev/reference/configuration

/** @type {import("snowpack").SnowpackUserConfig } */
module.exports = {
  // Files that will be exluded from loading & watching.
  exclude: ["**/node_modules/**/*", "**/lib/**/*"],
  /**
   * Files that will be mounted to Snowpacks dev server. Change the key to the folder(s)
   * that contain your static assets.
   */
  mount: {
    public: { url: "/" },
    "src/shared/assets": { url: "/shared" },
    "src/root/assets": { url: "/root" },
    "src/about/assets": { url: "/about" },
  },
  plugins: ["@snowpack/plugin-typescript"],
  packageOptions: {
    /* ... */
  },
  devOptions: {
    output: "stream", // Dont clear terminal
    open: "none", // Dont open a web page when the server turns on
    hmr: true, // Enables hot module reloading
  },
  buildOptions: {
    out: "public/dist", // The folder assets will be written to after building
  },
};
