Dispatcher     = require '../dispatcher/app-dispatcher'
{ActionTypes}  = require '../constants/room-constants'
{EventEmitter} = require 'events'
assign         = require 'object-assign'

_rooms = []
_currentId = null

RoomStore = assign {}, EventEmitter.prototype,

  getAll: -> _rooms

  get: (id) -> _rooms[id]

  getCurrent: -> _rooms[_currentId]

  emitChange: -> @emit 'change'

  addChangeListener: (cb)-> @on 'change', cb


RoomStore.dispatchToken = Dispatcher.register (action) ->

  switch action.type

    when ActionTypes.RECEIVE_ALL_ROOMS_SUCCESS
      _rooms = action.rooms
      RoomStore.emitChange()

    when ActionTypes.RECEIVE_ALL_ROOMS_FAILURE
      console.log '失敗'

    when ActionTypes.RECEIVE_ALL_ROOMS_START
      console.log 'かいし'

    when ActionTypes.CLICK_ROOM
      _currentId = action.roomId
      RoomStore.emitChange()

    else
      console.error "定義されていないイベント #{action.type}"


console.log RoomStore

module.exports = RoomStore
