_ = require 'underscore'
Shred = require('shred')
contract = {}

contract.excecute = ({callback}) ->
  new Shred().get
    url: "http://localhost/helloService"
    headers:
      "Content-Type": "application/json"
      "Accept": "*/*"
    on:
      200: (response) ->
        callback(response.content.data)

describe "glossary details", ->
  it "should return glossary details", (done) ->
    contract.excecute
      callback: (rootElement) ->
        expect(rootElement.glossary.title).toEqual("example glossary")
        done()