module Lappy
    class Wordler
        def initialize
            
        end
        
        def process_html html
            html.gsub!(/<\/?[^>]*>/, "")
            html.gsub!(/&.+;/, "")
            html.gsub!(/\[[0-9]+\]/, "")
            html.gsub!(/\[\[|\]\]|\{\{|\}\}/, "")
            words = html.split(/\s/).uniq
            words.delete_if { |w|
                w.empty? || w =~ /,|\.\*/
            }
        end

        def speak 
            words = process_html(Curler.new.get)
            sentence = []

            (6..12).to_a.sample.times do
                sentence << words.sample
            end

            sentence = sentence.join(" ") + ".\n"
            sentence = sentence.slice(0,1).capitalize + sentence.slice(1..-1)

            puts sentence
        end
    end
end
