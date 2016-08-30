ReturnValue = require 'nanocyte-component-return-value'
PassThroughUnlessData = require '../'

describe 'PassThroughUnlessData', ->
  beforeEach ->
    @sut = new PassThroughUnlessData

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when data is null', ->
      beforeEach ->
        envelope =
          config: {}
          data: {}
          message: 'anything'

        @message = @sut.onEnvelope envelope

      it 'should return the message', ->
        expect(@message).to.deep.equal 'anything'

    describe 'when data', ->
      beforeEach ->
        envelope =
          data:
            blocked: 'i-am-a-nonce'
          message: 'anything'

        @message = @sut.onEnvelope envelope

      it 'should not return the message', ->
        expect(@message).not.to.exist
