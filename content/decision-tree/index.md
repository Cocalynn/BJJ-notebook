---
title: "Decision Tree"
layout: base.njk
---

<div class="mermaid">
graph TD
  A[Guard Posture] --> B[Establish Grips]
  A --> C[Break Posture]
  B --> D[Pass to Full Mount]
  C --> E[Escape to Sweep]
  D --> F["<a href='/positions/full-mount/' style='color:#3182ce;text-decoration:underline;'>Armbar Attempt</a>"]
  D --> G[Cross Collar Choke]
  D --> H[Maintain Mount]
</div>

<p class="mt-4 text-sm text-gray-500">
<b>Tip:</b> Click on any technique node in the tree to view related videos and notes from your personal BJJ notebook.
</p>

<script src="https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.min.js"></script>
<script>
  mermaid.initialize({
    startOnLoad: true,
    flowchart: {
      htmlLabels: true
    }
  });
</script>