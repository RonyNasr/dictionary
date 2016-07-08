class Definition
  attr_accessor(:definition, :id)

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
    @id = nil
  end


end
