const { environment } = require('@rails/webpacker')
const typescript =  require('./loaders/typescript')
const erb =  require('./loaders/erb')
const path = require('path')
const PurgecssPlugin = require('purgecss-webpack-plugin')
const glob = require('glob-all')

environment.loaders.prepend('erb', erb)
environment.loaders.prepend('typescript', typescript)

environment.plugins.append('PurgecssPlugin', new PurgecssPlugin({
  paths: glob.sync([
    path.join(__dirname, '../../app/controllers/**/*.rb'),
    path.join(__dirname, '../../app/helpers/**/*.rb'),
    path.join(__dirname, '../../app/webpacker/**/*.js'),
    path.join(__dirname, '../../app/views/**/*.slim')
  ])
}))

module.exports = environment
