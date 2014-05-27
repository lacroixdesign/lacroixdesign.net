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
