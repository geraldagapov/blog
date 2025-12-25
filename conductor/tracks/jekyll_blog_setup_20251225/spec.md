# Specification: Basic Jekyll Blog Setup

## Goal
Establish the foundational structure for a Jekyll-based blog hosted on GitHub Pages, including a home page for listing posts and an "About" page.

## Core Features
1.  **Jekyll Configuration:**
    -   `_config.yml` configured for GitHub Pages (setting `baseurl`, `url`, and `theme` if applicable).
    -   Exclusion of `node_modules` and other non-essential files if present.
2.  **Home Page (`index.md` or `index.html`):**
    -   Displays a list of recent posts.
    -   Includes a welcome message.
3.  **About Page (`about.md`):**
    -   Static page describing the author and the blog's purpose.
4.  **Layouts (`_layouts/`):**
    -   `default.html`: The base template containing the `<head>`, header, footer, and content injection.
    -   `post.html`: Template for individual blog posts.
    -   `page.html`: Template for static pages like "About".
5.  **Includes (`_includes/`):**
    -   `header.html`: Navigation menu.
    -   `footer.html`: Copyright and social links.
6.  **Styling (`assets/css/`):**
    -   Basic CSS file (or SCSS) linked in the default layout.
    -   Minimalist styling as per Product Guidelines.

## Technical Requirements
-   **Static Site Generator:** Jekyll (GitHub Pages flavor).
-   **Hosting:** GitHub Pages.
-   **Structure:** Standard Jekyll directory structure.
-   **Language:** HTML, CSS, Markdown, Liquid.

## Design Guidelines
-   **Visual Identity:** Minimalist and clean.
-   **Navigation:** Simple links to Home and About.
