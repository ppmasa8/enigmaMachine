require "./enigma"

def main
    plug_board = PlugBoard.new("BADC")
    encrypted_idx = plug_board.forward(ALPHABET.index("A"))
    p ALPHABET[encrypted_idx]
    decrepted = ALPHABET[plug_board.backward(encrypted_idx)]
    p decrepted
end

main()