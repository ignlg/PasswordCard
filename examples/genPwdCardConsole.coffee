PasswordCard = require "../lib/PasswordCard.coffee"
PCard = new PasswordCard "ThisIsMyCardCode"

card = PCard.getCard(null)

for row in card
  console.log row.join "\t"
