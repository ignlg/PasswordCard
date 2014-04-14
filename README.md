PasswordCard
============

Flexible Password Card Generator.

Library and tools to generate password cards with custom columns, rows, cell-length, etc. CoffeeScript and Javascript for Node.js and browsers.

## Pattern
String to define the structure of each code/cell.

| Symbol | Description                                    |
| ------ | ---------------------------------------------- |
| __a__  | lower case ascii alphabetic characters `[a-z]` |
| __A__  | upper case ascii alphabetic characters `[A-Z]` |
| __1__  | numeric characters `0123456789`                |
| __!__  | symbols `!?@#$%&()[]+-*/=<>_.,;"'`             |

### Examples:
| Type          | Pattern |
| ------------- | ------- |
| Default       | aA1!    |
| Only numberic | 1111    |
| Only alphabetic | aAaA  |