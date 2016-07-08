require("rspec")
require("word")
require("definition")


describe("Word") do
  before do
    Word.clear()
  end

  describe ("#initialize")do
    it ("returns a new word") do
      my_word = Word.new({:word => "Fish"})
      expect(my_word.id()).to(eq(1))
      expect(my_word.word()).to(eq("Fish"))
      expect(my_word.definitions()).to(eq([]))
    end
  end

  describe(".all") do
    it ("returns all the words") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#save') do
    it ("saves a word to the dictionary") do
      my_word = Word.new({:word => "Fish"})
      my_word.save()
      expect(Word.all()).to(eq([my_word]))
    end
  end

  describe(".clear") do
    it ("clears the dictionary") do
      my_word = Word.new({:word => "Fish"})
      my_word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a word by its id number") do
      my_word = Word.new({:word => "Fish"})
      my_word.save()
      my_word_1 = Word.new({:word => "Tank"})
      my_word_1.save()
      expect(Word.find(my_word_1.id())).to(eq(my_word_1))
    end

  end

  describe('#add_definition') do
    it("adds a definition to the list of definitions") do
      my_word = Word.new({:word => "Fish"})
      my_definition = Definition.new({:definition => "sea creature"})
      my_word.add_definition(my_definition)
      expect(my_word.definitions).to(eq([my_definition]))
    end
  end
end

describe("Definition") do
  describe('#initialize') do
    it ("creates a new definition" )do
      my_definition = Definition.new({:definition => "sea creature"})
      expect(my_definition.definition()).to(eq("sea creature"))
      expect(my_definition.id()).to(eq(nil))
    end
  end



end
