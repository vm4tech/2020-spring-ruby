class MyComplex
    def initialize(real,imaginary)
        @real = real
        @imaginary = imaginary   
    end
    
    def add (other) #метод создания объекта из сумм 2-з других объектов
        new_real = other.real + @real
        new_imaginary = other.imaginary + @imaginary
        return MyComplex.new(new_real,new_imaginary)
    end

    def to_s
        "#{@real} + i#{@imaginary}"
    end
    def real #атрибут чтения real
        @real
    end
    def imaginary #атрибут чтения imiginary
        @imaginary
    end

    # В РАЗРАБОТКЕ
    # def multiply (other)
    #     new_real = other.real * @real 
    #     new_imaginary = other.imaginary + @imaginary
    #     return MyComplex.new(new_real,new_imaginary)
    # end
    
    # def sub
    # end
    
    # def divide
    # end

end

