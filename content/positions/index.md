---
title: "All Positions"
layout: base.njk
tag: []
---

<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
{% for pos in collections.positions -%}
  <a href="{{ pos.url }}" class="block bg-white rounded-2xl shadow-luxe overflow-hidden transform hover:scale-105 transition duration-300">
    <div class="aspect-video overflow-hidden">
      <img src="{{ pos.data.gif }}" alt="{{ pos.data.title }}" class="w-full h-full object-cover" />
    </div>
    <h2 class="p-6 text-2xl font-serif text-primary">{{ pos.data.title }}</h2>
    <div class="border-t border-muted px-6 py-4 flex justify-between text-sm text-primary">
      <span>{% if pos.data.tags %}{{ pos.data.tags | join(', ') }}{% endif %}</span>
    </div>
  </a>
{%- endfor %}
</div>
