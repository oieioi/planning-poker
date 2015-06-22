_      = require 'lodash'
React  = require 'react'
jade   = require 'react-jade'
#PlanStore = require '../../stores/plan-store'

template = jade.compile '''
.js-plan-detail
  div
    | here\'s plans
'''

getStateFromStore = ->

module.exports = React.createClass

  getInitialState: ->
    id: @props.params.roomId
    name: null
    administrator: null
    comment: null

  componentDidMount: ->
    #PlanStore.addChangeListener @_onChange

  componentWillUnmount: ->
    #PlanStore.removeChangeListener @_onChange

  _onChange: ->
    @setState getStateFromStore()

  render: ->
    template _.extend {}, @

