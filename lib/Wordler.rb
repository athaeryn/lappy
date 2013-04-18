module Lappy
    class Wordler
        def initialize

        end

        def links page="Computer"
            html = Curler.get page
            if html.include? 'REDIRECT'
                links
            end
            regex = /href="\/wiki\/(.+?)"/
            linked_pages = html.to_enum(:scan, regex).map { Regexp.last_match }
            linked_pages.map! { |x| x[1] }
            linked_pages.delete_if { |x| 
                x.include?(':') || x.include?('disambiguation')
            }
        end

        def chop s, max
            if s.size > max
                s = s.split(" ")
                s.pop
                s = s.join(" ")
                chop s, max
            else
                s
            end
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
            page = links(links(links.sample).sample).sample
            puts page
            words = process_html(Curler.get(page))
            sentence = []

            (1..30).to_a.sample.times do
                sentence << words.sample
            end

            sentence = sentence.join(" ")
            sentence = sentence.slice(0,1).capitalize + sentence.slice(1..-1)

            puts chop(sentence, 139) + '.'
        end
    end
end
