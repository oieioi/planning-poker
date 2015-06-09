React                       = require 'react'
jade                        = require 'react-jade'
Router                      = require 'react-router'
{Route, RouteHandler, Link} = Router
Rooms                       = require './rooms'
RoomDetail                  = require './room-detail'
Hoge                        = require './hoge'



App = React.createClass
  render: ->
    jade.compile("""
    div
      ul
        li
          Link(to='rooms') rooms
        li
          Link(to='room-detail', params={roomId: 1}) rooms/1
        li
          Link(to='plans',params={roomId: 1}) plans
        li
          Link(to='plan-detail',params={roomId: 1, planId: 2}) plans/2
      div
        RouteHandler
    """)()

module.exports =
  jade.compile("""
  Route(handler=App)
    Route(name='rooms', path='rooms', handler: Rooms)
      Route(name='room-detail', path=':roomId', handler: RoomDetail)
        Route(name='plans', path='plans', handler: Hoge)
          Route(name='plan-detail', path=':planId', handler: Hoge)
   """)()
