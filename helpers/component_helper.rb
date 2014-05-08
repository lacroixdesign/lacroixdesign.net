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

  # Full text block
  def text_block_component(image: nil, color: nil, background: nil, fixed: nil)
    component('text-block', {
      image: image,
      color: color,
      background: background,
      fixed: fixed
    }) { yield if block_given? }
  end

end
