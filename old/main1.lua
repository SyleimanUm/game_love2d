local function Pet(name) 
    return {
        name = name or "Charlie",
        speak = function()
            print("Meaw")
        end,

        feed = function (self) 
            print("eating", self.name)
            self:speak()
        end
        }
end 

local function Dog(name)
    local dog = Pet(name)

    dog.breed = "doberman"
    dog.loyalty = 0

    dog.speak = function () 
        print("Woof")
    end
    return dog
end

local doggy = Dog("Jack")

doggy.speak()