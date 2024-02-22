module.exports = {
  plugins: [
    {
      name: "preset-default",
      params: {
        overrides: {
          removeViewBox: false,
        },
      },
    },
    {
      name: "rewrite width & height",
      params: {
        width: "48",
        height: "48",
      },
      fn: () => {
        return {
          element: {
            enter: (node, parentNode) => {
              if (node.name === "svg") {
                node.attributes.height = "48";
                node.attributes.width = "48";
                return;
              }
            },
          },
        };
      },
    },
  ],
};
