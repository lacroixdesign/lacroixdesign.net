require 'net/http'

module ComponentHelper

  # Render component
  def component(name, data = {})
    render(:partial, "components/_#{name}", locals: data) { yield if block_given? }
  end

  # Static image
  def static_image_component(src: nil, **options)
    classes = options[:class] || ""
    options[:class] = classes + " image-fullwidth"
    image_tag src, options
  end

  def block_component(name, options = {})
    opts = {
      image: nil,
      color: nil,
      background: nil,
      fixed: nil,
      callout: nil,
      text_side: 'left',
      title: current_page.title
    }
    component(name, opts.merge(options)) { yield if block_given? }
  end

  # Full text block
  def text_block(**options, &block)
    block_component('text-block', options, &block)
  end

  # Split text/image block
  def split_block(**options, &block)
    block_component('split-block', options, &block)
  end

  # Full-width image block
  def image_block(**options)
    block_component('image-block', options)
  end

  # Live website preview block
  def live_preview_block(**options)
    unless options[:url]
      raise "A URL is required for `live_preview_block`"
    end
    block_component('live-preview-block', options)
  end

  # Vimeo
  def vimeo(id, caption=nil)
    src  = "//player.vimeo.com/video/#{id}"
    src += "?title=0&amp;byline=0&amp;portrait=0&amp;color=f27390&amp;badge=0"
    content_tag(:figure, class: "video") do
      content_tag(:iframe, nil, {
        src: src,
        width: "500",
        height: "281",
        frameborder: "0",
        webkitallowfullscreen: true,
        mozallowfullscreen: true,
        allowfullscreen: true
      }) +
      build_figcaption(caption)
    end
  end

  # YouTube
  def youtube(id, caption=nil)
    src  = "//www.youtube.com/embed/#{id}"
    src += "?showinfo=0&amp;color=white&amp;theme=light&amp;controls=2&amp;rel=0"
    # src += "?showinfo=0&amp;modestbranding=1&amp;theme=light&amp;controls=2&amp;rel=0"
    content_tag(:figure, class: "video") do
      content_tag(:iframe, nil, {
        src: src,
        width: "560",
        height: "315",
        frameborder: "0",
        webkitallowfullscreen: true,
        mozallowfullscreen: true,
        allowfullscreen: true
      }) +
      build_figcaption(caption)
    end
  end

  # Stretch image
  def stretch_image(path, alt=nil, caption=nil)
    content_tag(:figure, class: "image-stretch-wrap") do
      image_tag(path, alt: alt, class: "image-fullwidth") +
      build_figcaption(caption)
    end
  end

  # Pull quotes
  def pullquote(text, author=nil)
    figcaption = if author
      content_tag(:figcaption, "&mdash; " + author)
    else
      nil
    end
    leftquote  = "&ldquo;"
    rightquote = "&rdquo;"
    content_tag(:figure, class: 'pullquote') do
      content_tag(:p, leftquote + text + rightquote) +
      figcaption
    end
  end

  # Gist
  def gist(id)
    options = {
      :class => 'gist-embed-wrapper',
      :style => 'display:none;',
      'data-gist-id' => id,
      'data-gist-hide-footer' => true
    }
    content_tag(:figure, nil, options)
  end

  # Embedded tweets
  def tweet(id)
    url = "https://api.twitter.com/1/statuses/oembed.json?id=#{id}&omit_script=true&align=center&maxwidth=450"
    uri = URI.parse(url)
    res = Net::HTTP.get_response(uri)
    tweet_json = JSON.parse(res.body)
    content_tag(:figure, tweet_json['html'], :class => "tweet")
  end

private

  def build_figcaption(caption)
    if caption
      content_tag(:figcaption, caption)
    else
      nil
    end
  end

end
