Matter.RendexPixi = require './matter.coffee'
Composite = Matter.Composite
Body = Matter.Body
Vector = Matter.Vector
window = require './window.coffee'
utils = require './utils.coffee'
engine = require './engine.coffee'
resources = require './resources.coffee'
tick = require './tick.coffee'
Player = require './player.coffee'
Background = require './background.coffee'
Sin = require './sin/sin.coffee'
sinManager = require './sin/manager.coffee'
MULT = 0.75
SIN = 'normal'
time = 0
sins = []

sinsList = ['anger', 'envy', 'gloom', 'gluttony', 'greed', 'pride', 'sloth']
colors = ['']

# start

window.onkeydown = (e) =>
  document.getElementById('title').className = 'animated fadeOut'
  player = new Player window.w / 2, window.h / 2, 'player/normal.png', 0.75

  Matter.Engine.run engine

  for sin in sinsList
    sins.push new Sin sin, utils.random(-1024, 1024), utils.random(-1024, 1024)

  window.onkeydown = (e) =>
    switch e.keyCode
      when 82 # r          
        Composite.clear engine.world
        sins = []

        setTimeout ->
          for sin in sinsList
            sins.push new Sin sin, utils.random(-1024, 1024), utils.random(-1024, 1024)

          player = new Player window.w / 2, window.h / 2, "player/#{SIN}.png"
        , 250
      when 87, 38 # up
        Body.applyForce player.body, { x: 0, y: 0 }, Vector.mult(utils.vectorFromAngle(player.body.angle), MULT)
      when 83, 40 # down
        Body.applyForce player.body, { x: 0, y: 0 }, Vector.neg(Vector.mult(utils.vectorFromAngle(player.body.angle), MULT))

  # collisions
  Matter.Events.on engine, 'collisionActive', (e) ->
    for pair in e.pairs
      label = null

      if pair.bodyA.isStatic
        label = pair.bodyA.label
      
      if pair.bodyB.isStatic
        label = pair.bodyB.label

      switch label
        when 'anger'
          console.log 'anger'
          SIN = 'anger'

          sinsList.splice sinsList.indexOf('anger'), 1
          
          Composite.clear engine.world
          sins = []

          setTimeout ->
            for sin in sinsList
              sins.push new Sin sin, utils.random(-1024, 1024), utils.random(-1024, 1024)

            MULT = 1.5

            player = new Player window.w / 2, window.h / 2, 'player/anger.png'
          , 500

          engine.render.spriteContainer.filters = []

          rgb = new PIXI.filters.RGBSplitFilter
          blur = new PIXI.filters.BlurFilter
          blur.blur = 10

          engine.render.spriteContainer.filters = [rgb, blur]

          utils.changeText 'are you angry, my strange friend??'
        when 'envy'
          console.log 'envy'
          SIN = 'envy'

          sinsList.splice sinsList.indexOf('envy'), 1
          
          Composite.clear engine.world
          sins = []

          setTimeout ->
            for sin in sinsList
              sins.push new Sin sin, utils.random(-1024, 1024), utils.random(-1024, 1024)

            MULT = 1

            player = new Player window.w / 2, window.h / 2, 'player/envy.png'
          , 500

          engine.render.spriteContainer.filters = []

          blur = new PIXI.filters.BlurFilter
          blur.blur = 25

          engine.render.spriteContainer.filters = [blur]

          utils.changeText 'you envy her, isn\'t it?'
        when 'gloom'
          console.log 'gloom'
          SIN = 'gloom'

          sinsList.splice sinsList.indexOf('gloom'), 1
          
          Composite.clear engine.world
          sins = []

          setTimeout ->
            for sin in sinsList
              sins.push new Sin sin, utils.random(-1024, 1024), utils.random(-1024, 1024)

            MULT = 0.75

            player = new Player window.w / 2, window.h / 2, 'player/gloom.png'
          , 500

          engine.render.spriteContainer.filters = []

          noise = new PIXI.filters.NoiseFilter
          noise.noise = 1
          gray = new PIXI.filters.GrayFilter
          gray.gray = 1

          engine.render.spriteContainer.filters = [noise, gray]

          utils.changeText 'gloom pierced her heart with a speart of mercy'
        when 'gluttony'
          console.log 'gluttony'
          SIN = 'gluttony'

          sinsList.splice sinsList.indexOf('gluttony'), 1
          
          Composite.clear engine.world
          sins = []

          setTimeout ->
            for sin in sinsList
              sins.push new Sin sin, utils.random(-1024, 1024), utils.random(-1024, 1024)

            MULT = 0.5

            player = new Player window.w / 2, window.h / 2, 'player/gluttony.png'
          , 500

          engine.render.spriteContainer.filters = []

          twist = new PIXI.filters.TwistFilter
          twist.angle = 360
          twist.radius = 100

          engine.render.spriteContainer.filters = [twist]

          utils.changeText 'stomach pleasing we sometimes'
        when 'greed'
          console.log 'greed'
          SIN = 'greed'

          sinsList.splice sinsList.indexOf('greed'), 1
          
          Composite.clear engine.world
          sins = []

          setTimeout ->
            for sin in sinsList
              sins.push new Sin sin, utils.random(-1024, 1024), utils.random(-1024, 1024)

            MULT = 0.75

            player = new Player window.w / 2, window.h / 2, 'player/greed.png'
          , 500

          engine.render.spriteContainer.filters = []

          sepia = new PIXI.filters.SepiaFilter
          sepia.sepia = 1

          engine.render.spriteContainer.filters = [sepia]

          utils.changeText 'greed has drowned it with gold pockets'
        when 'lust'
          console.log 'lust'
          SIN = 'lust'

          sinsList.splice sinsList.indexOf('lust'), 1
          
          Composite.clear engine.world
          sins = []

          setTimeout ->
            for sin in sinsList
              sins.push new Sin sin, utils.random(-1024, 1024), utils.random(-1024, 1024)

            MULT = 1.5

            player = new Player window.w / 2, window.h / 2, 'player/lust.png'
          , 500

          engine.render.spriteContainer.filters = []

          pixel = new PIXI.filters.PixelateFilter
          pixel.size = 10

          engine.render.spriteContainer.filters = [pixel]

          utils.changeText 'lust was boundless and the end was terrible'
        when 'pride'
          console.log 'pride'
          SIN = 'pride'

          sinsList.splice sinsList.indexOf('pride'), 1
          
          Composite.clear engine.world
          sins = []

          setTimeout ->
            for sin in sinsList
              sins.push new Sin sin, utils.random(-1024, 1024), utils.random(-1024, 1024)

            MULT = 1

            player = new Player window.w / 2, window.h / 2, 'player/pride.png'
          , 500

          engine.render.spriteContainer.filters = []

          cross = new PIXI.filters.CrossHatchFilter

          engine.render.spriteContainer.filters = [cross]

          utils.changeText 'pride replaced him air'
        when 'sloth'
          console.log 'sloth'
          SIN = 'sloth'

          sinsList.splice sinsList.indexOf('sloth'), 1
          
          Composite.clear engine.world
          sins = []

          setTimeout ->
            for sin in sinsList
              sins.push new Sin sin, utils.random(-1024, 1024), utils.random(-1024, 1024)

            MULT = 0.5

            player = new Player window.w / 2, window.h / 2, 'player/sloth.png'
          , 500

          engine.render.spriteContainer.filters = []

          invert = new PIXI.filters.InvertFilter

          engine.render.spriteContainer.filters = [invert]

          utils.changeText 'in sloth has dissolved'
        when 'player'
          console.log 'player'

      document.getElementById('count').textContent = (8 - sinsList.length) + ' / 8'

      if sinsList.length is 0
        document.getElementById('end').className = 'animated fadeIn'

  setInterval ->
    a = utils.random(0, 75)
    engine.render.context.backgroundColor = utils.rgbToHex(a, a, 10)
  , 75

  # tick
  Matter.Events.on engine, 'tick', (e) ->
    time += 0.01

    # Camera
    Matter.Bounds.shift engine.render.bounds, { x: player.body.position.x - window.w / 2, y: player.body.position.y - window.h / 2 }