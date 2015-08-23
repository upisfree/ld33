utils = require '../utils.coffee'
Bodies = Matter.Bodies

class Sin
  constructor: (@name, x, y) ->
    @body = Bodies.rectangle x, y, 250, 250,
      isStatic: true
      label: @name
      render:
        sprite:
          texture: 'assets/textures/sin.png'

    utils.addToWorld @body

module.exports = Sin