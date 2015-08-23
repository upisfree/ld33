assets = 'assets/'
textures = assets + 'textures/'

loader = PIXI.loader
             .add 'dirt', textures + 'dirt.png'
             .add 'player', textures + 'player.png'

module.exports = loader