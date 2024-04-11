function love.draw()
    love.graphics.setBackgroundColor(96/255, 96/255, 96/255)
    love.graphics.setColor(1, 1, 1)
    if retour then
        love.graphics.setColor(1, 0, 0)
    end
    love.graphics.circle("fill", love.mouse.getX(), love.mouse.getY(), number)

end

function love.load()
    retour = false
    number = 0
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    
end

function love.update(dt)
    mouseX, mouseY = love.mouse.getPosition()

    if number > height/2 then
        retour = true
    elseif number == 0 then
        retour = false
    end
    if not retour then
        number = number + 1
    else
        number = number - 1
    end
    
end
