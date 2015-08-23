utils = require './utils.coffee'
Bodies = Matter.Bodies
Body = Matter.Body
Vector = Matter.Vector

class Player
  constructor: (x = 0, y = 0, texture) ->
    @body = Bodies.rectangle x, y, 100, 100,
      mass: 100
      frictionAir: 0.25
      label: 'player'
      render:
        sprite:
          texture: "assets/textures/#{texture}"
  
    utils.addToWorld @body

    window.onmousemove = (e) =>
      @body.angle = utils.vectorToAngle e.x, e.y

# export
module.exports = Player