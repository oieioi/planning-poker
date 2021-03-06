Dispatcher     = require '../dispatcher/app-dispatcher'
{ActionTypes}  = require '../constants/room-constants'
{EventEmitter} = require 'events'
assign         = require 'object-assign'

_rooms = []
_currentId = null

RoomStore = assign {}, EventEmitter.prototype,

  getAll: -> _rooms

  get: (id) -> _rooms[id]

  getCurrent: ->
    if not _rooms[_currentId]?
      _rooms[_currentId] = {}
    _rooms[_currentId]


  emitChange: -> @emit 'change'

  addChangeListener: (cb)-> @on 'change', cb

  removeChangeListener: (cb)-> @removeListener 'change', cb


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

    when ActionTypes.RECEIVE_ROOM_FAILURE
      console.log '失敗'

    when ActionTypes.RECEIVE_ROOM_SUCCESS
      _currentId = action.roomId
      _rooms[_currentId] = action.room
      RoomStore.emitChange()

    when ActionTypes.CREATE_ROOM_FAILURE
      console.log '失敗', action

    when ActionTypes.CREATE_ROOM_SUCCESS
      console.log '成功', action
      _rooms.push action.room
      RoomStore.emitChange()

    else
      console.warn "定義されていないイベント", action

module.exports = RoomStore
