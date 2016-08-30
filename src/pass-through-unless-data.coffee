_ = require 'lodash'
ReturnValue = require 'nanocyte-component-return-value'

class PassThroughUnlessData extends ReturnValue
  onEnvelope: (envelope) =>
    { data, message } = envelope
    return message if _.isEmpty data
    return null

module.exports = PassThroughUnlessData
