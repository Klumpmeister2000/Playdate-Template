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
    local actualX, ActualY, collisions, length = self:moveWithCollisions(self.x + self.speed, self.y)
    if length > 0 then
        for index, collision in pairs(collisions) do
            local collidedObject = collision['other']
            if collidedObject:isa(Enemy) then
                collidedObject:remove()
            end
        end
        self:remove()
    end    
end