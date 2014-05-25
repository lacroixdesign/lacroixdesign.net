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

end
