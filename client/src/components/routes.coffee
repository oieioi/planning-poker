React                       = require 'react'
jade                        = require 'react-jade'
Router                      = require 'react-router'
{Route, RouteHandler, Link, DefaultRoute} = Router
Rooms                       = require './rooms'
RoomDetail                  = require './room-detail'
RoomPlans                   = require './room-plans'
Hoge                        = require './hoge'



App = React.createClass
  render: ->
    jade.compile("""
      div hogehoge
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
    Route(handler=App, path='/')
      DefaultRoute(handler=Rooms)
      Route(name='rooms',       path='rooms',                       handler=Rooms)
      Route(name='room-detail', path='rooms/:roomId',               handler=RoomDetail)
      Route(name='plans',       path='rooms/:roomId/plans',         handler=RoomPlans)
      Route(name='plan-detail', path='rooms/:roomId/plans/:planId', handler=Hoge)
  """)()
