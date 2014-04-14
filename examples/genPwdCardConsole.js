/*
Console log output
*/
var PasswordCard = require("../lib/PasswordCard.js");
var PCard = new PasswordCard("salt&pepper");

var card = PCard.getCard();

for (var i = 0, l = card.length; i < l; i++) {
  console.log(card[i].join("\t"));
}