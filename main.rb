require "./plug_board"
require "./rotor"

def main
    # CHECK PlugBoard class
    #
    # plug_board = PlugBoard.new("BADC")
    # encrypted_idx = plug_board.forward(ALPHABET.index("A"))
    # p ALPHABET[encrypted_idx]
    # decrepted = ALPHABET[plug_board.backward(encrypted_idx)]
    # p decrepted

    # CHECK Rotor class
    rotor = Rotor.new("BADC", 1)
    encrypted_idx = rotor.forward(ALPHABET.index("A"))
    p ALPHABET[encrypted_idx]
    decrepted = ALPHABET[rotor.backward(encrypted_idx)]
    p decrepted

    rotor.rotate()

    encrypted_idx = rotor.forward(ALPHABET.index("A"))
    p ALPHABET[encrypted_idx]
    decrepted = ALPHABET[rotor.backward(encrypted_idx)]
    p decrepted
end

main()