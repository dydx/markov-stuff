class Markov
  attr_accessor :words

  def initialize
    @words = []
  end

  def ingest(str)
    @words += str.split(" ")
  end

  def train
    trained_set = Hash[@words.zip(@words.collect { Array.new })]
    @words.each_with_index do |word, index|
      trained_set[word] << "#{@words[index + 1]}"
    end
    trained_set
  end

  def generate(length)
    # this is running into problems on the last word.... how to handle?
    trained_set = self.train
    current_word = trained_set.keys.sample
    generated_string = ""
    length.times do
      generated_string += "#{current_word} "
      current_word = trained_set[current_word].sample
    end
    generated_string
  end

end
