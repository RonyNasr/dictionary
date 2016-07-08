class Definition
  attr_accessor(:text, :id)

  define_method(:initialize) do |attributes|
    @text = attributes.fetch(:text)
    @id = nil
  end


end
