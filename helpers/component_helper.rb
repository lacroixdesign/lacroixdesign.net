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
    component(name, {
      image: options[:image],
      color: options[:color],
      background: options[:background],
      fixed: options[:fixed],
      text_side: options[:text_side] || 'left'
    }) { yield if block_given? }
  end

  # Full text block
  def text_block(**options, &block)
    block_component('text-block', options, &block)
  end

  # Split text/image block
  def split_block(**options, &block)
    block_component('split-block', options, &block)
  end

end
