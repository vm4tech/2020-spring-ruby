class Auto
    def initialize(brand,model,manufacture_year,gasoline_consumption)
        @brand = brand
        @model = model
        @manufacture_year = manufacture_year
        @gasoline_consumption = gasoline_consumption
    end
    
    def getBrand()
        return @brand
    end

    def getModel()
        return @model
    end

    def getManufacture_year()
        return @manufacture_year
    end
    
    def getGasoline_consumption()
        return @gasoline_consumption
    end
    
    def to_s
        "\n\t Марка: #{@brand}
         Модель: #{@model}
         Год выпуска: #{@manufacture_year}
         Расход бензина на 100км: #{@gasoline_consumption}"
    end
end

