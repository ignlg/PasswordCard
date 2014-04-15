###
PasswordCard

Flexible Password Card Generator.

https://github.com/ignlg/PasswordCard

Version: 0.5
Author: @ignlg
###

crypto = require "crypto"

class PasswordCard

  constructor: (@seed, @columns = 13, @rows = 13, @pattern = "aA1!") ->

  dictionaries:
    "a": "abcdefghijklmnopqrstuvwxyz"
    "A": "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    "1": "0123456789"
    "!": "!?@#$%&()[]+-*/=<>_.,;\"'"
    "i": "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    "n": "0123456789abcdefghijklmnopqrstuvwxyz"
    "N": "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    "9": "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    "*": "0123456789abcdefghijklmnopqrstuvwxyz\
ABCDEFGHIJKLMNOPQRSTUVWXYZ!?@#$%&()[]+-*/=<>_.,;\"'"

  _seedInc: 0

  setSeed: (@seed) ->

  # A different passphrase from seed each call just changing seedInc
  _getPass: ->
    seed = @seed
    inc = ++@_seedInc
    pass = seed.substr(Math.floor(seed.length / 2)) +
           seed[inc % seed.length] +
           seed[(inc * 2) % seed.length] +
           seed[((inc + Math.floor(seed.length / 2)) * 3) % seed.length] +
           seed.substr(0, Math.floor(seed.length / 2)) +
           inc
    return pass

  # Generate a base-64 hash from a passphrase
  _getKey: (pass) ->
    sha = crypto.createHash("sha256")
    sha.update(pass, "utf-8")
    return sha.digest("hex")

  # Gets a string of characters from a dictionary for a given key.
  _getChars: (key, dict, numchars) ->
    d = dict.split ""
    keyn = ""
    for j in [0...numchars]
      n = parseInt key[(j * 2)..(j * 2 + 1)], 16
      # Splice to avoid character repetition, refill if empty
      d = dict.split "" if d.length is 0
      keyn += d.splice n % d.length, 1

    return keyn

  # Gets all the chars needed to fullfill the pattern for a row.
  _getPatternChars: ->
    phrases = []
    for patt in @pattern
      phrases.push @_getChars @_getKey(@_getPass()), @dictionaries[patt]
      , @columns

    return phrases

  getCard: (seed) ->
    if seed
      _seed = @seed
      @seed = seed

    return false if !@seed

    # Convert the pattern string to array
    pattern = pattern.split "" if "string" is typeof pattern

    card = []
    for n in [0...@rows]
      chars = @_getPatternChars()
      phrase = []
      for column in [0...@columns]
        word = ""
        for char in [0...@pattern.length]
          word += chars[char][column]

        phrase.push word

      card.push phrase

    @seed = _seed if seed
    return card

module.exports = PasswordCard