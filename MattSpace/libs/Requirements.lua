--Use libs/ because lua get confused without it (Probably because its getting ran from the folder of main.lua)

require 'libs/gp/StateMachine'
require 'libs/gp/states/BaseState'
require 'libs/gp/states/StartState'
require 'libs/gp/states/PlayState'
require 'libs/gp/states/TimeState'

require 'libs/gp/Player'
require 'libs/gp/Enemy'