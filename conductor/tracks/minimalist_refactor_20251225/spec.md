# Specification: Minimalist Blog Refactor

## Overview
Refactor the existing Jekyll blog to remove external dependencies, specifically themes (like `jekyll-theme-primer`) and plugins (`jekyll-feed`, `jekyll-seo-tag`) from the configuration. The goal is to achieve a self-contained, lightweight, and extremely minimal setup using only standard Jekyll features, HTML, and a single custom CSS file.

## Functional Requirements
1.  **Configuration Cleanup:**
    -   Update `_config.yml` to remove `theme` and `plugins` entries.
2.  **Asset Management:**
    -   Ensure `assets/css/style.css` contains all necessary styling.
    -   Remove any references to external stylesheets or scripts.
3.  **Layout Simplification:**
    -   Retain `_layouts/default.html`, `_layouts/post.html`, and `_layouts/page.html` but strip them down to bare semantic HTML.
    -   Manually add essential meta tags (title, description) to `_layouts/default.html` to replace `jekyll-seo-tag`.
4.  **Feature Removal:**
    -   Remove RSS feed generation.
    -   Remove any auto-generated SEO tags provided by plugins.

## Non-Functional Requirements
-   **Zero External Dependencies:** No requests to CDNs or third-party services.
-   **Maintainability:** Code should be readable and use standard Jekyll conventions.

## Out of Scope
-   Modifications to the `Gemfile`.
-   Complex SEO optimizations.
-   Analytics integration.
-   Advanced CSS frameworks or preprocessors.
