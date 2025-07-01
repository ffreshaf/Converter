local input = ""
local result = ""
local selectedConversion = 1

local conversions = {
   -- Temperature
    { name = "--- Temperature ---", isHeader = true },
    { name = "Celsius to Fahrenheit", func = function(c) return c * 9/5 + 32, "°F" end },
    { name = "Fahrenheit to Celsius", func = function(f) return (f - 32) * 5/9, "°C" end },

    -- Length
    { name = "--- Length ---", isHeader = true },
    { name = "Kilometers to Miles", func = function(km) return km * 0.621371, "mi" end },
    { name = "Miles to Kilometers", func = function(mi) return mi / 0.621371, "km" end },
    { name = "Meters to Feet", func = function(m) return m * 3.28084, "ft" end },
    { name = "Feet to Meters", func = function(ft) return ft / 3.28084, "m" end },
    { name = "Centimeters to Inches", func = function(cm) return cm / 2.54, "inch" end },
    { name = "Inches to Centimeters", func = function(inch) return inch * 2.54, "cm" end },

    -- Weight
    { name = "--- Weight ---", isHeader = true },
    { name = "Kilograms to Pounds", func = function(kg) return kg * 2.20462, "lb" end },
    { name = "Pounds to Kilograms", func = function(lb) return lb / 2.20462, "kg" end },
    { name = "Grams to Ounces", func = function(g) return g / 28.3495, "oz" end },
    { name = "Ounces to Grams", func = function(oz) return oz * 28.3495, "g" end },

    -- Time
    { name = "--- Time ---", isHeader = true },
    { name = "Seconds to Minutes", func = function(s) return s / 60, "min" end },
    { name = "Minutes to Seconds", func = function(m) return m * 60, "sec" end },
    { name = "Hours to Minutes", func = function(h) return h * 60, "min" end },
    { name = "Minutes to Hours", func = function(m) return m / 60, "hr" end },

    -- Volume
    { name = "--- Volume ---", isHeader = true },
    { name = "Liters to Milliliters", func = function(l) return l * 1000, "ml" end },
    { name = "Milliliters to Liters", func = function(ml) return ml / 1000, "l" end },
    { name = "Cups to Milliliters", func = function(c) return c * 236.588, "ml" end },
    { name = "Milliliters to Cups", func = function(ml) return ml / 236.588, "cups" end },
    { name = "Liters to Gallons", func = function(l) return l * 0.264172, "g" end },
    { name = "Gallons to Liters", func = function(g) return g / 0.264172, "l" end }
    
}

function love.textinput(t)
    if tonumber(t) or t == "." then
        input = input .. t
    end
end

function love.keypressed(key)
    if key == "backspace" then
        input = input:sub(1, -2)
    elseif key == "return" then
        local number = tonumber(input)
        if number then
            local conv = conversions[selectedConversion]
            if not conv.isHeader then
                -- Perform conversion
                local value, unit = conv.func(number)
                result = string.format("%.2f %s", value, unit or "")
            else
                -- If it's a header, just reset the result
                result = "Select a conversion"
            end
        else
            result = "Invalid input"
        end
    elseif key == "up" then
        repeat
            selectedConversion = selectedConversion - 1
            if selectedConversion < 1 then selectedConversion = #conversions end
        until not conversions[selectedConversion].isHeader
        
    elseif key == "down" then
        repeat
            selectedConversion = selectedConversion + 1
            if selectedConversion > #conversions then selectedConversion = 1 end
        until not conversions[selectedConversion].isHeader
    end
end

function love.draw()
    love.graphics.setBackgroundColor(0.5, 0.7, 1.0) -- Set background color to a light blue
    love.graphics.setColor(0, 0, 0) -- Set text color to black
    love.graphics.setFont(love.graphics.newFont(20)) -- Set font size to
    love.graphics.print("Unit Converter", 175, 50)

    love.graphics.print("Enter value:", 50, 100)
    love.graphics.rectangle("line", 200, 95, 150, 30)
    love.graphics.print(input, 210, 100)

    love.graphics.print("Conversion Type:", 50, 140)
    
    love.graphics.setFont(love.graphics.newFont(17)) -- Set font size to
    for i, conv in ipairs(conversions) do
        if conv.isHeader then
            love.graphics.setColor(1, 0.8, 0.8) -- Header color   

        elseif i == selectedConversion then
            love.graphics.setColor(0.6, 0.9, 1) -- Highlight selected conversion in red
        else
            love.graphics.setColor(1, 1, 1) -- Normal text color
        end
        love.graphics.print(conv.name, 70, 170 + (i - 1) * 25)
    end

   love.graphics.setFont(love.graphics.newFont(20)) -- Set font size to
   love.graphics.setColor(0, 0, 0)
   love.graphics.print("Result:", 50, 860)
   love.graphics.rectangle("line", 200, 855, 150, 30)
   love.graphics.print(tostring(result), 210, 860)

end


