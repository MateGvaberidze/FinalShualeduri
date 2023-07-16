Player = Class{}

PLAYER_SPEED = 550

function Player:init()
	self.image = love.graphics.newImage('libs/gp/icons/PlayerIcon.png')
	self.width = self.image:getWidth()
	self.height = self.image:getHeight()
	
	self.x = VIRTUAL_WIDTH / 2 - self.width / 2
	self.y = VIRTUAL_HEIGHT - 89
	
	self.dx = 0
  
  
end

function Player:update(dt)
	if love.keyboard.isDown('a') then
		self.dx = -PLAYER_SPEED
	elseif love.keyboard.isDown('d') then
		self.dx = PLAYER_SPEED
	else
		self.dx = 0
	end
	
	
	
	
	if self.dx < 0 then
        	self.x = math.max(0, self.x + self.dx * dt)
        else
        	self.x = math.min(VIRTUAL_WIDTH - self.width, self.x + self.dx * dt)
    end
end

function Player:collides(target)
	if (self.x + 2) + (self.width - 4) >= target.x and self.x + 2 <= target.x + target.width then
		if (self.y + 2) + (self.height - 4) >= target.y and self.y + 2 <= target.y + target.height then      
		    return true
		end
  end
  return false
end

function Player:render()
    love.graphics.draw(self.image, self.x, self.y)
end
