express = require 'express'
_ = require 'lodash'
router = express.Router()
db = require '../db'


router.get '/', (req, res, next) ->
  db.all 'select *, rowid as id from room', (err, rows)->
    res.send rows

router.post '/', (req, res, next) ->
  name = req.body.name
  db.run 'insert into room values (?, ?)', [name, 'test'], (err)->

    if err
      res.sendStatus 500
      return

    res.send 
      id: @lastID
      name: name
      administrator: 'test'

router.get '/:roomId', (req, res, next) ->
  roomId = req.params.roomId
  db.get 'select *, rowid as id from room where id = ?', [roomId], (err, row)->

    if not row?
      res.sendStatus 404
      return

    res.send row

router.get '/:roomId/plans', (req, res, next) ->
  roomId = req.params.roomId
  db.all "select *, rowid as id from plan where planid = ?", [roomId], (err, rows)->
    if err
      console.log err
      res.sendStatus 500
      return
    if not rows?
      res.sendStatus 404
      return

    res.send rows

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
