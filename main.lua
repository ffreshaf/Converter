local input = ""
local result = ""
local selectedConversion = 1

local conversions = {
    { name = "Celsius to Fahrenheit", func = function(c) return c * 9/5 + 32 end },
    { name = "Fahrenheit to Celsius", func = function(f) return (f - 32) * 5/9 end },
    { name = "Kilometers to Miles", func = function(km) return km * 0.621371 end },
    { name = "Miles to Kilometers", func = function(mi) return mi / 0.621371 end }
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
            result = conversions[selectedConversion].func(number)
        else
            result = "Invalid input"
        end
    elseif key == "up" then
        selectedConversion = selectedConversion - 1
        if selectedConversion < 1 then selectedConversion = #conversions end
    elseif key == "down" then
        selectedConversion = selectedConversion + 1
        if selectedConversion > #conversions then selectedConversion = 1 end
    end
end

function love.draw()
    love.graphics.print("Unit Converter", 150, 50)
    love.graphics.setBackgroundColor(0.5, 0.7, 1.0) -- Set background color to a light blue
    love.graphics.setColor(0, 0, 0) -- Set text color to black
    love.graphics.setFont(love.graphics.newFont(20)) -- Set font size to

    love.graphics.print("Enter value:", 50, 100)
    love.graphics.rectangle("line", 200, 95, 150, 30)
    love.graphics.print(input, 210, 100)

    love.graphics.print("Conversion Type:", 50, 150)
    love.graphics.print("Use ↑ ↓ to change", 400, 150)
    
    for i, conv in ipairs(conversions) do
        if i == selectedConversion then
            love.graphics.setColor(0.8, 0.9, 1) -- Highlight selected conversion in red
        else
            love.graphics.setColor(0.6, 0.6, 0.6) -- Normal text color
        end
        love.graphics.print(conv.name, 70, 170 + (i - 1) * 25)
    end

   love.graphics.setColor(1, 1, 1)
   love.graphics.print("Result:", 50, 300)
   love.graphics.print(tostring(result), 200, 300)

end


