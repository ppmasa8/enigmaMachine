class EnigmaMachine
    attr_accessor :plug_board, :rotors, :reflector

    def initialize(plug_board, rotors, reflector)
        @plug_board = plug_board
        @rotors = rotors
        @reflector = reflector
    end

    def encrypt(text)
        text.chars.each.map{|c| self.go_through(c)}.join("")
    end

    def decrept(text)
        self.rotors.each do |rotor|
            rotor.reset
        end
        text.chars.each.map{|c| self.go_through(c)}.join("")
    end

    def go_through(char)
        char = char.upcase
        char.chars.each do |a|
            return char unless ALPHABET.include?(a)
        end

        idx = ALPHABET.index(char)
        idx = self.plug_board.forward(idx)

        p "プラグボードを通った IDX: #{idx}"

        self.rotors.each do |rotor|
            idx = rotor.forward(idx)
        end

        p "forwardを通った IDX: #{idx}"

        idx = self.reflector.reflect(idx)

        p "reflectされた IDX: #{idx}"

        self.rotors.reverse.each do |rotor|
            idx = rotor.backward(idx)
        end

        p "backwardを通った IDX: #{idx}"

        idx = self.plug_board.backward(idx)

        p "プラグボードを通った IDX: #{idx}"
        char = ALPHABET[idx]

        self.rotors.reverse.each do |rotor|
            break if rotor.rotate() % ALPHABET.size != 0
        end

        char
    end
end