React = require 'react'
jade  = require 'react-jade'

ListItem = require './list-item'

module.exports = React.createClass
  render: ->
    jade.compile("""
      ul
        ListItem
    """)()
