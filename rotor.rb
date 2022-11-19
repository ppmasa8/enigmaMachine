class Rotor < PlugBoard
    attr_accessor :offset, :rotations

    def initialize(map_alphabet, offset=0)
        super(map_alphabet)
        @offset = offset
        @rotations = 0
    end

    def rotate(offset=nil)
        offset = self.offset if !offset
        self.alphabet = self.alphabet[offset..] + self.alphabet[..offset]
        self.rotations += offset
        self.rotations
    end

    def reset
        self.rotations = 0
        self.alphabet = ALPHABET
    end
end
