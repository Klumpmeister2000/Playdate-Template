import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"


class("Ball").extends(playdate.graphics.sprite)


function Ball:init()

  Ball.super.init(self)
  radius = 5
  local ballImage = playdate.graphics.image.new(2 * radius, 2 * radius)
  playdate.graphics.pushContext(ballImage)
  playdate.graphics.fillCircleAtPoint(radius, radius, radius)
  playdate.graphics.popContext()
  self:setImage(ballImage)
  self:moveTo(200, 120)
end

ball = Ball()
ball:add()
function playdate.update()
    playdate.graphics.sprite.update()
end