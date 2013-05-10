#Testling

Testling is a very basic tool to help in unit tesing. 

It was created to allow "mock" implementations being injected into the files under test.
I use it in a Meteor project to stub out the Meteor object.

I tested it with Mocha.

It is still in very early stages and I don't know if it really works as planned.

##Installation

As soon as it is on NPM, it will be as simple as:
    npm install testling

##Usage

A Should/Mocha/Meteor example:


```coffee-script
should = require 'should'
testling = require 'testling'

mocks = 
    Meteor: {}

test = testling.load 'tobetestedfile.coffee', mocks

describe 'This is a test suite', ->
    describe 'This is a test case', ->
        it 'should work', ->
            test.doSomething().should.equal 'YEAH'
```

You might use Sinon or similar to inject some sophisticated test objects, to
prove that the Meteor object is called in the way you expect.

##Disclaimer and License

There is no guarantee that any of this might work in any way.
And if it causes any hazard, for example the hell to freeze, I'm not to blame. YOU ARE.


DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
Version 2, December 2004 

Copyright (C) 2004 Sam Hocevar <sam@hocevar.net> 

Everyone is permitted to copy and distribute verbatim or modified 
copies of this license document, and changing it is allowed as long 
as the name is changed. 

DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION 

\0. You just DO WHAT THE FUCK YOU WANT TO.
