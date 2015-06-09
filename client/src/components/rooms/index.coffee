React = require 'react'
jade  = require 'react-jade'

ListItem = require './list-item'

template = jade.compile("""
  ul
    = items
""")

itemTemplate = jade.compile("""
  ListItem(id=item.id, name=item.name, administrator=item.administrator)
""")

module.exports = React.createClass
  getInitialState: ->
    data: [
      {id:1,name:'n1',administrator:'a1'}
      {id:2,name:'n2',administrator:'a2'}
      {id:3,name:'n3',administrator:'a3'}
      {id:4,name:'n4',administrator:'a4'}
      {id:5,name:'n5',administrator:'a5'}
      {id:6,name:'n6',administrator:'a6'}
      {id:7,name:'n7',administrator:'a7'}
      {id:8,name:'n8',administrator:'a8'}
    ]


  render: ->
    a = jade.compile """
      div= test
    """
    items = this.state.data.map (item, i) -> 
      itemTemplate ListItem: ListItem, item:item

    template items: items
