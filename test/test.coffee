testling = require '../bin/testling'

M = {}
M.make = (what) ->
    console.log "I did #{what}!"

mocks = 
    Meteor: M

t = testling.load '../tobetested.coffee', mocks, this

describe 'Suite', ->
    describe 'it should make', ->
        it 'impossible', ->
            t.someFun 'do this'
        
    