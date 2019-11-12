# Your TextAnalyzer model code will go here.
class TextAnalyzer
    attr_reader :text

    def initialize(text)
        @text = text.downcase
    end

    def count_of_words
        words = text.split(" ")
        words.count
    end

    def count_of_vowels
        text.scan(/[aeiou]/).count
    end

    def count_of_consonants
        text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
    end

    def most_used_letter
        removed_spaces = text.gsub(/[^a-z]/, '')
        each_letter = removed_spaces.split('')
        unique_letters = each_letter.uniq
        letter_counts = {}

        unique_letters.map do |character|
            letter_counts[character] = each_letter.count(character)
        end

        biggest = {letter_counts.keys.first => letter_counts.values.first}

        letter_counts.each do |letter, amount|
            if amount > biggest.values.first
                biggest = {}
                biggest[letter] = amount
            end
        end

        biggest
    end
end