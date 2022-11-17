require "./enigma"

def main
    plug_board = PlugBoard.new("BADC")
    p plug_board.forward_map
    p plug_board.backward_map
end

main()