engine = require '../engine.coffee'
Composite = Matter.Composite

sinManager = (name, player) ->
  switch name
    when 'anger'
      console.log 'anger'
      Matter.Composite.remove engine.world, player.body
    when 'envy'
      console.log 'envy'
    when 'gloom'
      console.log 'gloom'
    when 'gluttony'
      console.log 'gluttony'
    when 'greed'
      console.log 'greed'
    when 'lust'
      console.log 'lust'
    when 'pride'
      console.log 'pride'
    when 'sloth'
      console.log 'sloth'    
    when 'player'
      console.log 'player'

module.exports = sinManager