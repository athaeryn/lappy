module Lappy
    class Curler
        def initialize
            @url = "http://en.wikipedia.org/w/api.php?action=parse&format=json&page="
        end

        def get subject="Computer"
            json = JSON.parse(Curl.get(@url + subject).body_str)
            if json["error"]
                puts "ERROR: #{json["error"]["info"]}"
                return false
            else
                json["parse"]["text"]["*"]
            end
        end
    end
end
