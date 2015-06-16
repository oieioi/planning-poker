React = require 'react'
jade  = require 'react-jade'
ListItem    = require './list-item'
RoomStore   = require '../../stores/room-store'
getAllRooms = require '../../actions/get-all-rooms'

template = jade.compile("""
  ul
    = items
""")

itemTemplate = jade.compile("""
  li(key=item.id)
    ListItem(id=item.id, name=item.name, administrator=item.administrator)
""")

getStateFromStore = ->
  list: RoomStore.getAll()

module.exports = React.createClass
  getInitialState: ->
    list: [
    ]

  componentDidMount: ->
    RoomStore.addChangeListener @_onChange
    getAllRooms()

  componentWillUnmount: ->
    RoomStore.removeChangeListener @_onChange

  _onChange: ->
    @setState getStateFromStore()

  render: ->
    items = this.state.list.map (item, i) ->
      itemTemplate ListItem: ListItem, item: item

    template items: items
