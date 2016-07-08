class Word
  attr_accessor(:word, :id, :definitions)
  @@dictionary = []

  define_method (:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @id = @@dictionary.length+1
    @definitions = []
  end

  define_singleton_method (:all) do
    @@dictionary
  end

  define_method(:save) do
    @@dictionary.push(self)
  end

  define_singleton_method(:clear) do
    @@dictionary = []
  end

  define_singleton_method(:find) do |id|
    word_found = nil
    @@dictionary.each do |word|
      if(word.id() == id)
        word_found = word
      end
    end
    word_found
  end

  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end

end
