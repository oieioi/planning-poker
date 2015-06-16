_ = require 'lodash'
React = require 'react'
Router = require 'react-router'
routes = require './routes'

document.addEventListener 'DOMContentLoaded', ->
  Router.run routes, (Handler) ->
    React.render React.createElement(Handler, null), document.body
