_ = require 'underscore'
Shred = require('shred')
xml2js = require 'xml2js'
contract = {}
parser = new xml2js.Parser()

contract.excecute = ({callback}) ->
  new Shred().get
    url: "http://localhost/helloXML"
    headers:
      "Content-Type": "application/xml; charset=UTF-8"
      "Accept": "*/*"
    on:
      200: (response) ->
        callback(response)

describe "glossary details", ->
  it "should return glossary details", (done) ->
    contract.excecute
      callback: (rootElement) ->
        console.log(parser.parseString(rootElement.content.body))
        expect(rootElement.glossary.title).toEqual("example glossary")
        done()