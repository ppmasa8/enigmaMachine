require "./error"

class Reflector
    attr_accessor :map

    def initialize(map_alphabet)
        @map = Hash[ALPHABET.zip(map_alphabet.chars)].compact
        self.map.each do |k, v|
            raise ValueError.new(k, v) if k != self.map[v]
        end
    end

    def reflect(idx)
        reflected_char = self.map[ALPHABET[idx]]
        ALPHABET.index(reflected_char)
    end
end