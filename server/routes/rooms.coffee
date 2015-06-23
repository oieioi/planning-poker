express = require 'express'
_ = require 'lodash'
router = express.Router()


router.get '/', (req, res, next) ->
  res.send [
    {id: 1, name: 'name1', administrator: 'a1'}
    {id: 2, name: 'name2', administrator: 'a2'}
    {id: 3, name: 'name3', administrator: 'a3'}
    {id: 4, name: 'name4', administrator: 'a4'}
    {id: 5, name: 'name5', administrator: 'a5'}
  ]
router.post '/', (req, res, next) ->
  name = req.body.name
  res.send {
    id: _.random(1000) + 100
    name: name
    administrator: 'test'
  }

router.get '/:roomId', (req, res, next) ->
  roomId = req.params.roomId
  res.send
    id: roomId
    name: "#{roomId}'s room <3"
    administrator: "admin #{roomId}"
    comment: 'hoge'

router.get '/:roomId/plans', (req, res, next) ->
  roomId = req.params.roomId
  res.send [
    {id: 1, name: 'plan-1', max: 10, min: 1, state: 'done', roomId: roomId}
    {id: 2, name: 'plan-2', max: 10, min: 1, state: 'open', roomId: roomId}
    {id: 3, name: 'plan-3', max: 10, min: 1, state: 'open', roomId: roomId}
    {id: 4, name: 'plan-4', max: 10, min: 1, state: 'open', roomId: roomId}
  ]

router.get '/:roomId/plans/:planId', (req, res, next) ->
  roomId = req.params.roomId
  planId = req.params.planId
  res.send
    id: planId
    name: "plan-#{planId}",
    max: 10,
    min: 1,
    state: 'open',
    roomId: roomId

router.post '/:roomId/plans', (req, res, next) ->
  roomId = req.params.roomId
  res.send {id: _.random(1000), roomId: roomId}

router.put '/:roomId/plans/:planId/cards', (req, res, next) ->
  res.send []

router.put '/:roomId/plans/:planId/state', (req, res, next) ->
  res.send {}

module.exports = router
