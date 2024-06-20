export const config = {
  reporters: [
    "spec",
    [
      "allure",
      {
        outputDir: "allure-results",
      },
    ],
  ],
};