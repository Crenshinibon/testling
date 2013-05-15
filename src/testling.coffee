###
Inspired by this post:
http://howtonode.org/testing-private-state-and-mocking-deps

and the Node sources:
https://github.com/joyent/node/blob/master/lib/module.js#L374

as well as the answer given here:
http://stackoverflow.com/questions/13227489/how-can-one-get-the-file-path-of-the-caller-function-in-node-js
###

fs = require 'fs'
path = require 'path'
Script = process.binding('evals').NodeScript
runInNewContext = Script.runInNewContext

coffee = require 'coffee-script'

exports.load = (filePath, mocks) ->
    caller = getCallingFile()
    baseDir = path.dirname caller
    baseFile = path.join baseDir, filePath
    
    fileName = path.basename filePath
    
    context = {}
    
    for k of global
        context[k] = global[k]
    
    context.require = require
    context.exports = exports
    context.__filename = fileName
    context.__dirname = baseDir
    context.module = this
    
    for k of mocks
        context[k] = mocks[k]
    
    context.global = context
    context.root = root
    
    buf = fs.readFileSync baseFile, 'UTF-8'
    if path.extname(baseFile) is '.coffee' then buf = coffee.compile buf
    
    runInNewContext buf, context, baseFile, 0, true
    context
    
    
getCallingFile = () ->
    stack = getStack()
    
    stack.shift()
    stack.shift()
    
    stack[2].receiver.filename


getStack = () -> 
    origPrepareStackTrace = Error.prepareStackTrace
    Error.prepareStackTrace = (_, stack) -> 
        stack
    err = new Error()
    stack = err.stack
    
    Error.prepareStackTrace = origPrepareStackTrace
    
    stack.shift()
    
    stack