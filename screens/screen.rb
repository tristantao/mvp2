class Screen
    attr_accessor :do
    def initialize()
        raise "Can't instantiate abstract class!"
    end

    def do
        raise "do() must be overwritten!"
    end 
end 
