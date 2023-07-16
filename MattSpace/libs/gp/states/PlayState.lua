PlayState = Class{__includes = BaseState}

ENEMY_SCROLL = 60

function PlayState:init()
	self.player = Player()
  self.enemy = Enemy()
	self.timer = 0
  self.scoreTimer = 0
	self.score = 0
end

function PlayState:update(dt)
	self.timer = self.timer + dt
  self.scoreTimer = self.scoreTimer + dt
	self.player:update(dt)
  
  --Enemy Movement
  if self.timer > 2 then
    self.enemy:update(dt)
    if self.enemy.y > VIRTUAL_HEIGHT then
      self.score = self.score + 1
      self.enemy.y = 0 - self.enemy.height
      self.timer = 0
    end
  end

  if self.player:collides(self.enemy) == true then
    stateMachine:change('time', {
      score = self.score,
      scoreTimer = self.scoreTimer
    })
  end
  
end
  



function PlayState:render()
	love.graphics.setFont(bigFont)
	love.graphics.print('Score: ' .. tostring(self.score), 10, 10)
  love.graphics.print('Time: ' .. self.scoreTimer, 10, 50)
  love.graphics.print('Press R to restart', 10, 90)
  
	self.player:render()
  self.enemy:render()
end