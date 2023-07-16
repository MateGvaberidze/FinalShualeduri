TimeState = Class{__includes = BaseState}

function TimeState:enter(params)
    self.score = params.score
    self.scoreTimer = params.scoreTimer
end

function TimeState:update(dt)
end

function TimeState:render()
    love.graphics.setFont(mediumFont)
    love.graphics.printf('You Lost! Press ESCAPE to quit. Press R to Restart', 0, 80, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 150, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Time Survived: ' .. self.scoreTimer, 0, 200, VIRTUAL_WIDTH, 'center')
end