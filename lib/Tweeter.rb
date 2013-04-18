module Lappy
    class Tweeter
        def self.auth
            auth = YAML.load_file 'auth.yml'
            Twitter.configure do |config|
                config.consumer_key       = auth[:consumer_key]
                config.consumer_secret    = auth[:consumer_secret] 
                config.oauth_token        = auth[:oauth_token]
                config.oauth_token_secret = auth[:oauth_token_secret] 
            end
        end

        def self.confirm_tweet text
            puts text
            puts "Tweet it? "
            choice = $stdin.gets.chomp.downcase
            if choice == "yes"
                self.tweet text
            end
        end

        def self.tweet text
            self.auth
            puts "TWEEEEET: \"#{text}\""
            Twitter.update(text)
        end
    end
end
