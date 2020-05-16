require 'roda'

class App < Roda
    route do |r|
        # GET / request
        r.root do
          r.redirect "/hello"
        end

        r.on "hello" do 
            @massage = "Hello...ssssssssssssssssssssss. test"

            r.get "hello" do
                "#{@massage}"
            end

            r.is do
                r.get do
                    "#{@massage}2 33"
                end
            end
        end

       
    end
    
end