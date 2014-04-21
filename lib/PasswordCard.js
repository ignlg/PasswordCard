
/*
PasswordCard

Flexible Password Card Generator.

https://github.com/ignlg/PasswordCard

Version: 0.5
Author: @ignlg
 */

(function() {
  var PasswordCard, crypto;

  crypto = require("crypto");

  PasswordCard = (function() {
    function PasswordCard(seed, columns, rows, pattern) {
      this.seed = seed;
      this.columns = columns != null ? columns : 13;
      this.rows = rows != null ? rows : 13;
      this.pattern = pattern != null ? pattern : "####";
    }

    PasswordCard.prototype.dictionaries = {
      "a": "abcdefghijklmnopqrstuvwxyz",
      "A": "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
      "1": "0123456789",
      "!": "!?@#$%&()[]+-*/=<>_.,;\"'",
      "i": "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
      "n": "0123456789abcdefghijklmnopqrstuvwxyz",
      "N": "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ",
      "9": "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
      "*": "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!?@#$%&()[]+-*/=<>_.,;\"'"
    };

    PasswordCard.prototype._securePattern = "aA1!";

    PasswordCard.prototype._seedInc = 0;

    PasswordCard.prototype.setSeed = function(seed) {
      this.seed = seed;
    };

    PasswordCard.prototype._getPass = function() {
      var inc, pass, seed;
      seed = this.seed;
      inc = ++this._seedInc;
      pass = seed.substr(Math.floor(seed.length / 2)) + seed[inc % seed.length] + seed[(inc * 2) % seed.length] + seed[((inc + Math.floor(seed.length / 2)) * 3) % seed.length] + seed.substr(0, Math.floor(seed.length / 2)) + inc;
      return pass;
    };

    PasswordCard.prototype._getKey = function(pass) {
      var sha;
      sha = crypto.createHash("sha256");
      sha.update(pass, "utf-8");
      return sha.digest("hex");
    };

    PasswordCard.prototype._getSecureChars = function(numchars) {
      var copyDictionary, dict, dictionaries, getNumber, idx, isSecure, key, keyIdx, n, nextSecurePattern, originalDictionaries, patt, pattern, patternIndex, phrase, secure, securePattern, _i;
      phrase = '';
      dictionaries = {};
      originalDictionaries = this.dictionaries;
      patternIndex = 0;
      pattern = this.pattern;
      secure = '';
      securePattern = this._securePattern;
      nextSecurePattern = function(number) {
        var idx, patt;
        if (secure.length === 0) {
          secure = securePattern;
        }
        idx = number % secure.length;
        patt = secure.substr(idx, 1);
        secure = secure.slice(0, idx) + secure.slice(idx + 1);
        return patt;
      };
      copyDictionary = function(patt) {
        dictionaries[patt] = originalDictionaries[patt];
        return null;
      };
      key = this._getKey(this._getPass());
      keyIdx = 0;
      getNumber = (function(_this) {
        return function(n) {
          if (n < 0 || n > 31) {
            key = _this._getKey(_this._getPass());
            keyIdx = n = 0;
          }
          return parseInt(key.slice(n * 2, +(n * 2 + 1) + 1 || 9e9), 16);
        };
      })(this);
      for (n = _i = 0; 0 <= numchars ? _i < numchars : _i > numchars; n = 0 <= numchars ? ++_i : --_i) {
        patt = pattern[patternIndex];
        if (patt === '#') {
          isSecure = true;
          patt = nextSecurePattern(getNumber(keyIdx));
          keyIdx++;
        } else {
          isSecure = false;
        }
        if (!dictionaries.hasOwnProperty(patt)) {
          dictionaries[patt] = '';
        }
        if (dictionaries[patt].length === 0) {
          copyDictionary(patt);
        }
        dict = dictionaries[patt];
        idx = getNumber(keyIdx) % dict.length;
        phrase += dict.substr(idx, 1);
        dictionaries[patt] = dict.slice(0, idx) + dict.slice(idx + 1);
        patternIndex = (patternIndex + 1) % pattern.length;
        keyIdx++;
      }
      return phrase;
    };

    PasswordCard.prototype.getCard = function(seed) {
      var card, char, chars, column, k, n, phrase, word, _i, _j, _k, _ref, _ref1, _ref2, _seed;
      if (seed) {
        _seed = this.seed;
        this.seed = seed;
      }
      if (!this.seed) {
        return false;
      }
      card = [];
      chars = this._getSecureChars(this.rows * this.columns * this.pattern.length, this.pattern);
      k = 0;
      for (n = _i = 0, _ref = this.rows; 0 <= _ref ? _i < _ref : _i > _ref; n = 0 <= _ref ? ++_i : --_i) {
        phrase = [];
        for (column = _j = 0, _ref1 = this.columns; 0 <= _ref1 ? _j < _ref1 : _j > _ref1; column = 0 <= _ref1 ? ++_j : --_j) {
          word = "";
          for (char = _k = 0, _ref2 = this.pattern.length; 0 <= _ref2 ? _k < _ref2 : _k > _ref2; char = 0 <= _ref2 ? ++_k : --_k) {
            word += chars[k++];
          }
          phrase.push(word);
        }
        card.push(phrase);
      }
      if (seed) {
        this.seed = _seed;
      }
      return card;
    };

    return PasswordCard;

  })();

  module.exports = PasswordCard;

}).call(this);
