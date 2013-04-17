module Lappy
    class Main
        def initialize
            puts 'Hello, I\'m Lappy.'
        end

        def process args
            if args.size === 0
                puts "Goodbye."
                exit
            end

            command = args.shift
            case command
                when "vocab"
                    puts "alrignt, vocab"
                    unless args.empty?
                        puts args
                    end
                else
                    puts "Sorry, I don't understand what \"#{command}\" means."
            end
        end
    end
end
