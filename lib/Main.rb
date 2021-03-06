module Lappy
    class Main
        def initialize
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
                when "speak"
                    puts Wordler.new.speak
                when "tweet"
                    tweet = Wordler.new.speak
                    if args[0] == "--force"
                        Tweeter.tweet tweet
                    else
                        Tweeter.confirm_tweet tweet
                    end
                else
                    puts "Sorry, I don't understand what \"#{command}\" means."
            end
        end
    end
end
