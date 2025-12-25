---
layout: default
title: Home
---

<h1>Welcome to {{ site.title }}</h1>
<p>{{ site.description }}</p>

<h2>Latest Posts</h2>
<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      - {{ post.date | date_to_string }}
    </li>
  {% endfor %}
</ul>
