module MacroHelper

  # Hero
  def macro_hero(**data, &block)
    required = [:image, :replace, :classes]
    opts = {
      replace: false,
      classes: ""
    }.merge(data)
    macro("hero", opts, required, &block)
  end

private

  # Render macro
  def macro(name, data = {}, required_keys = [])
    required_keys.each do |key|
      unless data.has_key?(key)
        raise ArgumentError, "Argument `#{key}` is required for `macro_#{name}`"
      end
    end

    render(:partial, "macros/_#{name}", locals: data) { yield if block_given? }
  end

end
