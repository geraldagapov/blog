## Instructions for local deployment

1.  Install ruby

```bash
sudo apt-get install ruby-full build-essential zlib1g-dev
```

2.  Configure paths for ruby packages aka gems

```bash
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
```

3.  Install bundler, do not install jekyll via gems

```bash
gem install bundler
```

4.  Set bundler to install packages locally

```bash
bundle config set --local path 'vendor/bundle'
```

5.  Install jekyll and run it

```bash
bundle install
bundle exec jekyll serve
```
