Engine = Matter.Engine
RenderPixi = require './matter.coffee'
window = require './window.coffee'

module.exports = Engine.create document.body,
  world:
    gravity:
      x: 0
      y: 0
  enableSleeping: true
  render:
    controller: RenderPixi
    options:
      width: window.w
      height: window.h
      wireframes: false
      background: '#ccc'
      hasBounds: true