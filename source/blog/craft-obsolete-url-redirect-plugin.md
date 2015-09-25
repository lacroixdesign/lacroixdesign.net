---
title: "A Craft Redirect Plugin for Obsolete URLs"
tagline: "A plugin to automatically redirect to an entry’s new URL if its slug has been revised."
date: "2015-03-11 8:00"
author: "Michael LaCroix"
image: "craft-obsolete-url-redirect-plugin.jpg"
inline_header: true
light_logo: true
short_url: "http://lcrx.co/1AeiFro"
dn_url: "https://www.designernews.co/stories/45826-a-craft-redirect-plugin-for-obsolete-urls"
published: true
---

During a recent buildout of a [Craft](http://buildwithcraft.com/) website, a client wanted the ability to automatically redirect to an entry’s new URL if (1) its slug has been revised and (2) a visitor landed on the old URL. For example, if an entry started with the URL:

```
http://example.com/first
```

...but its slug was later changed to make it:

```
http://example.com/second
```

...then visiting `/first` will redirect the user to `/second`. To do this, we developed a plugin which, on a request that is about to return a 404, will:

- Query for the most recent revision with the same path prefix and that now defunct slug.
- Fetch the current, live revision of that entry.
- Redirect (302) to that entry’s new URL.

One thing to note is that the query is intentionally isolated to the same prefix. In the above example, it would not redirect to an entry in a section that has a different URL prefix, such as `/blog/`.

### Installation

Download the plugin from [https://github.com/lacroixdesign/craft-obsolete-url-redirect](https://github.com/lacroixdesign/craft-obsolete-url-redirect), unzip, then move the `obsoleteredirect` folder to your Craft plugins folder. Install it via the Craft Control Panel as you would for any plugin. Finally, add the following snippet to your 404 template file:

```language-twig
{% do craft.obsoleteRedirect.check() %}
```

That's it!

### Caveats

Obviously you will need either Craft Client or Pro, as the Personal edition does not have revision functionality. Additionally, this plugin does not track URL changes at a structural level; e.g. changing your blog section’s prefix from `/blog/` to `/news/`.

It has not been tested on localized websites, so any testing and feedback in that realm would be greatly appreciated.

### Open Source

The plugin is free and open source, and available on [GitHub](https://github.com/lacroixdesign/craft-obsolete-url-redirect). Feel free to open issues, pull requests, or <a href="https://twitter.com/intent/tweet?text=@iamlacroix" target="_blank">send me a tweet</a> with any feedback or suggestions.
