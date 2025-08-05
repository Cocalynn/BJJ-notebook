// .eleventy.js
module.exports = function(eleventyConfig) {
  // pass-through for static assets
  eleventyConfig.addPassthroughCopy({ "static/media": "media" });
  eleventyConfig.addPassthroughCopy({ "static/css": "css" });

  // define two collections
  eleventyConfig.addCollection("positions", (collection) => {
    return collection.getFilteredByGlob("content/positions/**/index.md").filter(
      item => item.inputPath !== "./content/positions/index.md"
    );
  });
  eleventyConfig.addCollection("competitions", coll =>
    coll.getFilteredByGlob("content/competitions/**/index.md")
  );

  return {
    dir: {
      input: "content",
      includes: "../_includes",
      layouts: "../_layouts",
      output: "public"
    },
    markdownTemplateEngine: "njk",
    htmlTemplateEngine: "njk",
  };
};
