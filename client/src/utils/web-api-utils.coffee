superagent    = require 'superagent'
Dispatcher    = require '../dispatcher/app-dispatcher'
{ActionTypes} = require '../constants/room-constants'

module.exports =

  getAllRooms: ->
    superagent
      .get '/api/rooms'
      .end (err, res)->

        if err
          Dispatcher.dispatch
            type: ActionTypes.RECEIVE_ALL_ROOMS_FAILURE
          return

        Dispatcher.dispatch
          type: ActionTypes.RECEIVE_ALL_ROOMS_SUCCESS
          rooms: JSON.parse res.text

  getRoom: (roomId)->
    superagent
      .get "/api/rooms/#{roomId}"
      .end (err, res)->

        if err
          Dispatcher.dispatch
            type: ActionTypes.RECEIVE_ROOM_FAILURE
            roomId: roomId
          return

        Dispatcher.dispatch
          type: ActionTypes.RECEIVE_ROOM_SUCCESS
          roomId: roomId
          room: JSON.parse res.text

  getAllPlans: (roomId)->
    superagent
      .get "/api/rooms/#{roomId}/plans"
      .end (err, res)->

        if err
          Dispatcher.dispatch
            type: ActionTypes.RECEIVE_ROOM_ALL_PLANS_FAILURE
            roomId: roomId
          return

        Dispatcher.dispatch
          type: ActionTypes.RECEIVE_ROOM_ALL_PLANS_SUCCESS
          roomId: roomId
          plans: JSON.parse res.text

  getPlan: (roomId, planId)->
    superagent
      .get "/api/rooms/#{roomId}/plans/#{planId}"
      .end (err, res)->

        if err
          Dispatcher.dispatch
            type: ActionTypes.RECEIVE_ROOM_PLAN_FAILURE
            roomId: roomId
          return

        Dispatcher.dispatch
          type: ActionTypes.RECEIVE_ROOM_PLAN_SUCCESS
          roomId: roomId
          plans: JSON.parse res.text

