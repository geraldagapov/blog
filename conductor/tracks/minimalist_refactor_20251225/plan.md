# Plan: Minimalist Blog Refactor

## Phase 1: Configuration & Cleanup
- [ ] Task: Remove Plugins and Theme from Config
    - [ ] Subtask: Edit `_config.yml` to remove `theme: jekyll-theme-primer`.
    - [ ] Subtask: Edit `_config.yml` to remove `plugins` section (`jekyll-feed`, `jekyll-seo-tag`).
- [ ] Task: Conductor - User Manual Verification 'Configuration & Cleanup' (Protocol in workflow.md)

## Phase 2: Layout & Asset Refactoring
- [ ] Task: Update Default Layout
    - [ ] Subtask: Edit `_layouts/default.html` to remove any theme-specific classes or links.
    - [ ] Subtask: Add manual meta tags for `title` and `description` to `head`.
    - [ ] Subtask: Ensure link to `assets/css/style.css` is present and correct.
- [ ] Task: Simplify Content Layouts
    - [ ] Subtask: Review and simplify `_layouts/post.html`.
    - [ ] Subtask: Review and simplify `_layouts/page.html` (if exists, or verify usage in `about.md`).
- [ ] Task: Refine Custom CSS
    - [ ] Subtask: Verify `assets/css/style.css` provides all necessary styling for the stripped-down layouts.
- [ ] Task: Conductor - User Manual Verification 'Layout & Asset Refactoring' (Protocol in workflow.md)

## Phase 3: Verification
- [ ] Task: Clean Build Verification
    - [ ] Subtask: Run a build/test cycle to ensure the site renders correctly without the removed dependencies.
- [ ] Task: Conductor - User Manual Verification 'Verification' (Protocol in workflow.md)
