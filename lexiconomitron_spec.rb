require_relative 'lexiconomitron.rb'

RSpec.describe Lexiconomitron do

  before :each do
    @lexi = Lexiconomitron.new
  end

  describe "eat_t" do
    it "removes every letter t from the input" do
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
    it "returns false if input isnt string" do
      expect(@lexi.eat_t(1)).to eq (false)
    end
  end

  describe "shazam" do
    it "reverses input" do
      expect(@lexi.shazam(["abc", "def"])).to eq(["cba", "fed"])
    end
    it "return first and last word" do
      expect(@lexi.shazam(["abc", "is","a", "def"])).to eq(["cba", "fed"])
    end
    it "should use eat_t to remove 'T's" do
      expect(@lexi.shazam(["this", "is", "a", "string"])).to eq(["sih", "gnirs"])
    end
  end

  describe "oompa_loompa" do
    it "should only return words composed by 3 or less characters" do
      expect(@lexi.oompa_loompa(["if", "you", "wanna", "be", "my", "lover"])).to eq(["if", "you", "be", "my"])
    end
    it "should omit non strings in the array" do
      expect(@lexi.oompa_loompa(["if", 1, [1,2], "you", :be])).to eq(["if", "you"])
    end
  end
end
