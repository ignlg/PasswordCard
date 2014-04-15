PasswordCard
============

Flexible Password Card Generator.

Library and tools to generate password cards with custom columns, rows, cell-length, etc. CoffeeScript and Javascript for Node.js and browsers.

### Pattern
String to define the structure of each code/cell.

| Symbol | Description                                    |
| ------ | ---------------------------------------------- |
| __a__  | lower case ascii alphabetic characters `[a-z]` |
| __A__  | upper case ascii alphabetic characters `[A-Z]` |
| __1__  | numeric characters `0123456789`                |
| __!__  | symbols `!?@#$%&()[]+-*/=<>_.,;"'`             |
| __i__  | `[a-zA-Z]`                                     |
| __n__  | `[0-9a-z]`                                     |
| __N__  | `[0-9A-Z]`                                     |
| __9__  | `[0-9a-zA-Z]`                                  |
| __*__  | `[0-9a-zA-Z]` + symbols                        |

_Examples:_

| Type                  | Pattern |
| --------------------- | ------- |
| Default               | `aA1!`  |
| Numbers only          | `1111`  |
| Alpha characters only | `aAaA`  |

### Live website

[Custom Password Card](http://ignlg.github.io/passwordcard/)

### Password Card Examples

#### Console output

Output of the `genPwdCardConsole.js` example. Passphrase: `ThisIsMyCardCode`, size: 13x13, pattern: `aA1!`.

	qX1?	mV9_	fF4]	eM2/	nD0&	pP6-	sW8#	wQ7,	cC3%	bZ5[	oO8"	vJ0)	lS5!
	fA2(	aM1;	mT7)	eY0?	gD9[	nZ4!	dO6*	uP5@	pL3_	vU8,	lQ2.	kK4%	wE1$
	rS1#	wC5'	nJ6?	gQ0&	vN7*	hX4%	qY3,	mV9;	dG2=	pD8<	iU4+	aZ2(	jM7"
	sO2$	gZ3[	yP6%	dM4_	iA7(	jG8]	wR0-	hU9<	aC5,	fJ1!	bI6=	nF4.	vW7'
	qC2?	jA3"	wI8<	iY5!	zF9%	oX6+	xQ0&	hU1=	sE4[	uJ7'	cG0*	rH7/	mP1@
	lL3%	hB1[	xS2!	tK4(	nA5>	sH7)	rJ9,	wF8-	dG0/	qO6<	uN4]	gV0"	cC7$
	vX2*	iW5]	tB1?	uV4!	dN6<	rH3+	bC9@	wU0(	sK8&	cF7;	mD8"	qQ7%	hR1)
	uU9,	cO8%	kR3&	dD7_	bT6.	hX2>	iF1]	wH5$	aK4+	eE0/	gJ5;	yY4@	jP6-
	nD9<	jT4*	mZ0;	aO8]	bF6+	vG1_	dS2&	fY7$	eM3%	gB5)	oW9[	wJ3.	sC7'
	eR2;	xD3=	hA6>	zK7"	iW8)	rN0?	bT5#	gV4!	cJ9%	mC1@	uB0-	wS3]	lX2(
	jL6[	aZ8#	eJ0(	xA2]	gU5-	uO1!	lY7'	cB3,	kW9"	zM4_	wT4;	nS5%	pC9=
	wL7=	zO1<	sH8(	qR3.	gM0>	pB5%	vW2,	nC6'	jQ4;	cS9-	hJ6]	uF5_	yI7)
	rN8#	qE1!	eI9<	vU3)	iL6.	aO0(	jV7-	yR5=	pF4"	kM2[	fJ4'	tS9>	sK7*
