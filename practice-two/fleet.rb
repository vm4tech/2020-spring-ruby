class Fleet
    def initialize()
        @cars = []
    end
    
    def add(car)
        @cars.push(car)
        puts @cars
    end

    def load_from_file()
    end
end