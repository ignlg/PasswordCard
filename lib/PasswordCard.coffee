###
PasswordCard

Flexible Password Card Generator.

https://github.com/ignlg/PasswordCard

Version: 0.5
Author: @ignlg
###

crypto = require "crypto"

class PasswordCard

  constructor: (@seed, @columns = 13, @rows = 13, @pattern = "####") ->

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

  _securePattern: "aA1!"

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

  # Generates an hex hash from a passphrase
  _getKey: (pass) ->
    sha = crypto.createHash("sha256")
    sha.update(pass, "utf-8")
    return sha.digest("hex")

  # Gets a string of characters
  _getSecureChars: (numchars) ->
    # Variable initialize
    phrase = ''
    dictionaries = {}
    originalDictionaries = @dictionaries
    patternIndex = 0
    pattern = @pattern

    secure = ''
    securePattern = @_securePattern

    # Loop secure pattern
    nextSecurePattern = (number) ->
      if secure.length is 0
        secure = securePattern

      idx = number % secure.length
      patt = secure.substr idx, 1
      secure = secure.slice(0, idx) + secure.slice(idx + 1)
      return patt

    # Copy secure dictionaries
    copyDictionary = (patt) ->
      dictionaries[patt] = originalDictionaries[patt]
      return null

    # Key
    key = @_getKey @_getPass()
    keyIdx = 0

    getNumber = (n) =>
      # New key every 32 hex pairs
      if n < 0 or n > 31
        key = @_getKey @_getPass()
        keyIdx = n = 0
      return parseInt key[(n * 2)..(n * 2 + 1)], 16

    for n in [0...numchars]
      # Next pattern character
      patt = pattern[patternIndex]

      # Secure pattern
      if patt is '#'
        isSecure = true
        patt = nextSecurePattern getNumber keyIdx
        keyIdx++
      else
        isSecure = false

      # Fill dictionaries as needed
      if not dictionaries.hasOwnProperty patt
        dictionaries[patt] = ''

      if dictionaries[patt].length is 0
        copyDictionary patt

      dict = dictionaries[patt]

      # Get char index
      idx = getNumber(keyIdx) % dict.length
      # Get char
      phrase += dict.substr idx , 1
      # Remove char from dictionary
      dictionaries[patt] = dict.slice(0, idx) + dict.slice(idx + 1)

      # pattern looper
      patternIndex = (patternIndex + 1) % pattern.length

      # keyIdx goes
      keyIdx++

    return phrase

  # Get card
  getCard: (seed) ->
    if seed
      _seed = @seed
      @seed = seed

    return false if !@seed

    card = []
    chars = @_getSecureChars(@rows * @columns * @pattern.length, @pattern)
    k = 0

    for n in [0...@rows]
      phrase = []
      for column in [0...@columns]
        word = ""
        for char in [0...@pattern.length]
          word += chars[k++]

        phrase.push word

      card.push phrase

    #Restore original seed
    @seed = _seed if seed

    return card

module.exports = PasswordCard