require_relative '../lib/markov.rb'

describe Markov do

  before(:each) do
    @markov = Markov.new
  end

  context "#ingest" do
    it "accepts a string of words" do
      example_string = "this is a test of this system"
      expect(@markov).to receive(:ingest).with(example_string)
      @markov.ingest(example_string)
    end
  end

  context "#train" do
    it "pairs words with ones that come after them" do
      example_string = "this is a test of this system"
      @markov.ingest(example_string)
      trained_set = @markov.train
      expect(trained_set).to eql({
        "this" => ["is", "system"],
        "is" => ["a"],
        "a" => ["test"],
        "test" => ["of"],
        "of" => ["this"],
        "system" => [""]
      })
    end
  end

  context "#generate" do
    it "handles longer strings of input and creates better strings" do
      example_string = "this is a test of this system and its various bits and pieces"
      @markov.ingest(example_string)
      generated_string = @markov.generate(3)
      # I'd like to possibly mock this out so I can actually test for a real string
      # currently I'm just making sure its not empty
      expect(generated_string.size).to_not eql(0)
      # expected output looks like: "test of this" or "systeme and its" for the given text
    end
  end
end
