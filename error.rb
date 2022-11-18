class ValueError < StandardError
    def initialize(key, value)
        super(key: key, value: value)
    end
end