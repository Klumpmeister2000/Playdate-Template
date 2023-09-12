import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "Corelibs/timer"

import "player"
import "enemySpawner"

local pd <const> = playdate
local gfx <const> = playdate.graphics

Player(30, 120)
startSpawner()

function pd.update()
  gfx.sprite.update()
  pd.timer.updateTimers()
end

