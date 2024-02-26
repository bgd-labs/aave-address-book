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
      name: "removeAttrs",
      params: {
        attrs: "(x|y)",
      },
    },
    {
      name: "rewrite width & height so it's consistent",
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
