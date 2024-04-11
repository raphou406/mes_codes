
function love.load()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    x, y = width/2, height/2
    dirX = 1
    dirY = 1
    randomColor()
end
function love.draw()
    local radius = 50
    love.graphics.setBackgroundColor(91/255 ,91/255,91/255)
    love.graphics.ellipse("fill", x, y, radius, radius)
    if x > width - radius or x < radius then
        dirX = dirX * -1
        randomColor()
        love.graphics.setColor(randomColor())
    end
    if y > height - radius or y < radius then
        dirY = dirY * -1
        randomColor()
        love.graphics.setColor(randomColor())
    end
end
function love.update(dt)
    local v = 2
    x = x + dirX *v
    y = y + dirY *v
end
function randomColor()
    local r, g, b = love.math.random(), love.math.random(), love.math.random()
    return r, g, b
end