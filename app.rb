require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @num_words = @analyzed_text.count_of_words
    @vowels = @analyzed_text.count_of_vowels
    @consonants = @analyzed_text.count_of_consonants
    @most_common_hash = @analyzed_text.most_used_letter
    @most_common_hash.each do |key, value| 
      @most_common_letter = key.upcase
      @num_common_letter = value
    end
    erb :results
  end
end
