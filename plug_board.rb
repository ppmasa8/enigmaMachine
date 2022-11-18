ALPHABET = "abcdefghijklmnoppqrstuvwxyz".upcase.split("")

class PlugBoard
    attr_accessor :alphabet, :forward_map, :backward_map

    def initialize(map_alphabet)
        @alphabet = ALPHABET
        @forward_map = {}
        @backward_map = {}
        mapping(map_alphabet.split(""))
    end

    def mapping(map_alphabet)
        self.forward_map = Hash[alphabet.zip(map_alphabet)].compact
        self.backward_map = forward_map.invert
    end

    def forward(idx)
        char = self.alphabet[idx]
        char = self.forward_map[char]
        self.alphabet.index(char)
    end

    def backward(idx)
        char = self.alphabet[idx]
        char = self.backward_map[char]
        self.alphabet.index(char)
    end
end