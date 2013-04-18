module Lappy
    class Curler
        def self.get subject="Computer"
            url = "http://en.wikipedia.org/w/api.php?action=parse&format=json&page="
            json = JSON.parse(Curl.get(url + subject).body_str)
            if json["error"]
                puts "ERROR: #{json["error"]["info"]}"
                return false
            else
                json["parse"]["text"]["*"]
            end
        end
    end
end
