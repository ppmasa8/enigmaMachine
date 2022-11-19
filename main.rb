require "./plug_board"
require "./rotor"
require "./reflector"
require "./enigma_machine"

def main
    n = ALPHABET.size - 1
    get_random_alphabet = (n+1).times.map{ ALPHABET[rand(n)] }.join("")
    pl = PlugBoard.new(get_random_alphabet)
    r1 = Rotor.new(get_random_alphabet, 3)
    r2 = Rotor.new(get_random_alphabet, 2)
    r3 = Rotor.new(get_random_alphabet, 1)

    r = ALPHABET
    p indexes = Array.new(n+1){|i| i }
    p indexes.size
    (0...indexes.size/2).each do |_|
        x = indexes.slice!(rand(indexes.size - 1))
        y = indexes.slice!(rand(indexes.size - 1))
        r[x], r[y] = r[y], r[x]
    end
    reflector = Reflector.new(r.join(""))

    machine = EnigmaMachine.new(
        pl, [r1, r2, r3], reflector
    )
    s = 'ATTACK SILICON VALLEY'
    e = machine.encrypt(s)
    puts e
end

main()