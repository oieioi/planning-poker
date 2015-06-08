React                       = require 'react'
Router                      = require 'react-router'
{Route, RouteHandler, Link} = Router
Rooms                       = require './rooms'
RoomDetail                  = require './room-detail'
Hoge                        = require './hoge'



App = React.createClass
  render: ->
    React.createElement 'div', null, 'here\'s content',
      React.createElement 'ul', null,
        React.createElement 'li', null,
          React.createElement Link, {to: 'rooms'}, 'rooms'
        React.createElement 'li', null,
          React.createElement Link, {to: 'room-detail', params: {roomId: 1}}, 'detail'
        React.createElement 'li', null,
          React.createElement Link, {to: 'hoge'}, 'hoge'
      React.createElement 'div', null,
        React.createElement RouteHandler, null,

module.exports =
  React.createElement Route, {handler: App},
    React.createElement Route, {name: 'rooms', path: 'rooms', handler: Rooms},
      React.createElement Route, {name: 'room-detail', path: ':roomId', handler: RoomDetail},
    React.createElement Route, {name: 'hoge', path: 'hoge', handler: Hoge},

