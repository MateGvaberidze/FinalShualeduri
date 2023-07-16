Enemy = Class{}
 
ENEMY_SCROLL = 700

function Enemy:init()
	self.image = love.graphics.newImage('libs/gp/icons/enemy.png')	
  self.width = self.image:getWidth()
	self.height = self.image:getHeight()
  
	self.x = math.random(VIRTUAL_WIDTH /5, VIRTUAL_WIDTH - 350)
	self.y = 0 - self.height	
end

function Enemy:update(dt)
  
    self.y = self.y + ENEMY_SCROLL * dt
  
end

function Enemy:render()
	love.graphics.draw(self.image, self.x, self.y)
end