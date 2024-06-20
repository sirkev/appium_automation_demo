import * as os from "os";

export const config = {
  // ...
  reporters: [
    "spec",
    [
      "allure",
      {
        outputDir: "allure-results",
        reportedEnvironmentVars: {
          os_platform: os.platform(),
          os_release: os.release(),
          os_version: os.version(),
          node_version: process.version,
        },
      },
    ],
  ],
};