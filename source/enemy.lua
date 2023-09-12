local pd <const> = playdate
local gfx <const> = playdate.graphics

class('Enemy').extends(gfx.sprite)

function Enemy:init(x, y, moveSpeed)
    local enemyImage = gfx.image.new("images/goblin")
    self:setImage(enemyImage)
    self:moveTo(x, y)
    self:add()

    self.moveSpeed = moveSpeed
end

function Enemy:update()
    self:moveBy(-self.moveSpeed, 0)
end