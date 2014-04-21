/*
Console log output
*/
var PasswordCard = require("../lib/PasswordCard.js");
var PCard = new PasswordCard("ThisIsMyCardCode", 13, 13, 'aA1!');

var card = PCard.getCard(null);

for (var i = 0, l = card.length; i < l; i++) {
  console.log(card[i].join("\t"));
}