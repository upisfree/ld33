engine = require './engine.coffee'

utils =
  random: (min, max) ->
    Math.floor Math.random() * (max - min + 1) + min
  rgbToHex: (r, g, b) ->
    return "0x" + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1)
  changeText: (text) ->
    document.getElementById('text').textContent = text
  vectorFromAngle: (a) ->
    a -= Math.PI / 2 # ???
    { x: Math.cos(a), y: Math.sin(a) }
  vectorToAngle: (x, y) ->
    Math.atan2(window.h / 2 - y, window.w / 2 - x) - Math.PI / 2
  addToWorld: (body) ->
    Matter.Composite.add engine.world, body
  removeFromWorld: (body) ->
    Matter.Composite.remove engine.world, body

# export
module.exports = utils