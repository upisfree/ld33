window = require './window.coffee'
utils = require './utils.coffee'
engine = require './engine.coffee'

tick = (player) ->
  console.log player.body.position.x
  # Camera
  Matter.Bounds.shift engine.render.bounds, { x: player.body.position.x - window.w / 2, y: player.body.position.y - window.h / 2 }

# export
module.exports = tick