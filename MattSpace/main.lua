--Requirements

push = require 'libs/setupLibs/push'
Class = require 'libs/setupLibs/class'

require 'libs/Requirements'

--Initiation

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 616
VIRTUAL_HEIGHT = 313

yPosPlace = 0 -- love.draw

local LOOPING_POINT = 313

local background = love.graphics.newImage('libs/gp/icons/background.png')
local background_scroll = 0

local BACKGROUND_SCROLL_SPEED = 30

function love.load()
  math.randomseed(os.time())
  
	love.graphics.setDefaultFilter('nearest', 'nearest')
	love.window.setTitle('MattSpace')
  
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    fullscreen = false,
    resizable = true,
    vsync = true
	})

	mediumFont = love.graphics.newFont('libs/fonts/font.ttf', 12)
	bigFont = love.graphics.newFont('libs/fonts/font.ttf', 10)

  sounds = {
    ['ambientLowAud'] = love.audio.newSource('libs/sfx/ambient1LowAud.mp3', 'static'),
    ['bg-music'] = love.audio.newSource('libs/sfx/Mattspace-music.mp3', 'static'),
		['hit'] = love.audio.newSource('libs/sfx/hit.wav', 'static'),
		['hurt'] = love.audio.newSource('libs/sfx/hurt.wav', 'static')
	}

	stateMachine = StateMachine {
		['start'] = function() return StartState() end,
		['play'] = function() return PlayState() end,
		['time'] = function() return TimeState() end,
	}

	stateMachine:change('start')
  	
  enemy = Enemy()
  
  love.keyboard.keysPressed = {}

end

function love.resize(width, height)
	push:resize(width, height)
end

function love.update(dt) 
  background_scroll = (background_scroll + BACKGROUND_SCROLL_SPEED * dt) % LOOPING_POINT
  
  --Lil Monitor Effect
  
  sounds['ambientLowAud']:play()
  sounds['bg-music']:play()

  
  yPosPlace = yPosPlace + VIRTUAL_HEIGHT/60
	if yPosPlace > VIRTUAL_HEIGHT then
		yPosPlace = 0
	end
		
  
  stateMachine:update(dt)
end



function love.keypressed(key)
	love.keyboard.keysPressed[key] = true
	
	if key == 'escape' then
		love.event.quit()
	end
  
  if key == 'r' then
    stateMachine:change('play')
  end
end

function love.keyboard.wasPressed(key)
	if love.keyboard.keysPressed[key] then
		return true
	else
		return false
	end
end

function love.draw()
  push:start()

  love.graphics.setColor(255/255, 255/255, 255/255)
  
  love.graphics.draw(background, 0, background_scroll - 616)
    
  --1980s effect :V      (127	255	212)
  love.graphics.setColor(127/255, 255/255, 212/255, 75/255)

  love.graphics.rectangle('line', 1, yPosPlace, VIRTUAL_WIDTH, 1)	
  
  love.graphics.setColor(255/255, 255/255, 255/255)
  
  stateMachine:render()

  push:finish()
end