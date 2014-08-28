# Workflow

Development server

```
bin/middleman
```

Deploy

```
bin/rake deploy
```

# Frontmatter Options

## Header

Use the *cover header* for pages that have a cover image:

```
cover_header: true
```

An *above header* is just like a *cover header*, but ditches the subtle gradient:

```
above_header: true
```

Set a background color for the header. **Not recommended** to combine with *cover header* or *above header* since it will cover up content:

```
header_background: "#fafaf7"
```

Use the light version of the logo. Useful when using a darker background color:

```
light_logo: true
```

# Blog Helpers

## Videos

Use the `vimeo` or `youtube` helpers to embed videos. Each helper takes a video ID as the first argument, and an optional caption as the second.

```ruby
vimeo(id, caption)

youtube(id, caption)
```

Examples:

```erb
<%= vimeo "13336009" %>

<%= youtube "G4-Wo8lWngc", "An optional caption." %>
```

## Images

To include a full-width image which stretches past the edge of the page gutters, use the `stretch_image` helper.

The helper takes a path to the image, an optional alt tag, and an optional caption:

```ruby
stretch_image(path, alt, caption)
```

Example:

```erb
<%= stretch_image "blog/blog-title/image-name.jpg", "An Alt for the Image", "A caption with #{link_to 'a link', '/blog'}." %>
```

## Pull Quotes

This helper takes a quote (plain text) and an optional author:

```ruby
pullquote(text, author)
```

Examples:

```erb
<%= pullquote "Some text to quote" %>

<%= pullquote "Some text to quote", "Barack Obama" %>
```

## Gists / Code

Embed a GitHub Gist by passing the `gist` helper a Gist ID:

```ruby
gist(id)
```

Example:

```erb
<%= gist "f3be83a2cabf9e1061fc" %>
```

## Tweets

Embed a tweet by passing the `tweet` helper a tweet/status ID:

```ruby
tweet(id)
```

Example:

```erb
<%= tweet "504323875963170817" %>
```
