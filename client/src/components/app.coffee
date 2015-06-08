_ = require 'lodash'
React = require 'react'
Router = require 'react-router'
routes = require './routes'
$ = require 'jquery'

$ ->
  Router.run routes, (Handler) ->
    React.render React.createElement(Handler, null), document.body
