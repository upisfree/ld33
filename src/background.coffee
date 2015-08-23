window = require './window.coffee'
engine = require './engine.coffee'

class Background
  constructor: (dirt) ->
    @container = new PIXI.Container

    dirt.width = window.w
    dirt.height = window.h
    dirt.position.x = 0
    dirt.position.y = 0

    @container.addChild dirt

    engine.render.spriteContainer.addChild @container

    return @

module.exports = Background