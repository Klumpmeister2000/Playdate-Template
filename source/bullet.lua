local pd <const> = playdate
local gfx <const> = playdate.graphics

class('Bullet').extends(gfx.sprite)

function Bullet:init(x, y, speed)
    local bulletSize = 4
    local bulletImage = gfx.image.new(bulletSize * 2, bulletSize * 2)
    gfx.pushContext(bulletImage)
        gfx.drawCircleAtPoint(bulletSize, bulletSize, bulletSize)
    gfx.popContext()
    self:setImage(bulletImage)

    self:setCollideRect(0, 0, self:getSize())
    self.speed = speed
    self:moveTo(x, y)
    self:add()
end

function Bullet:update()
    self:moveWithCollisions(self.x + self.speed, self.y)
end