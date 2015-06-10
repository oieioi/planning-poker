React = require 'react'
jade  = require 'react-jade'
superagent = require 'superagent'
ListItem = require './list-item'

template = jade.compile("""
  ul
    = items
""")

itemTemplate = jade.compile("""
  li(key=item.id)
    ListItem(id=item.id, name=item.name, administrator=item.administrator)
""")

module.exports = React.createClass
  getInitialState: ->
    list: [
    ]

  componentDidMount: ->
    superagent
      .get '/api/rooms'
      .end (err, res)=>
        list = try
          JSON.parse res.text
        catch e
          []
        @setState list: list


  render: ->
    items = this.state.list.map (item, i) ->
      itemTemplate ListItem: ListItem, item: item

    template items: items
