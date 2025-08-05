---
title: "Competitions"
layout: base.njk
---
<table class="w-full text-left">
  <thead>
    <tr class="border-b">
      <th class="px-4 py-2">Date</th>
      <th class="px-4 py-2">Event</th>
      <th class="px-4 py-2">Result</th>
    </tr>
  </thead>
  <tbody>
  {% for comp in collections.competitions %}
    <tr class="border-t">
      <td class="px-4 py-2">{{ comp.data.date }}</td>
      <td class="px-4 py-2"><a href="{{ comp.url }}" class="text-blue-600 hover:underline">{{ comp.data.title }}</a></td>
      <td class="px-4 py-2">{{ comp.data.result }}</td>
    </tr>
  {% endfor %}
  </tbody>
</table>
