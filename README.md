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

### Password Card Example

Output of the `genPwdCardConsole.js` example. Passphrase: `ThisIsMyCardCode`, size: 13x13, pattern: `aA1!`.

	qS1+	rH6_	kR3[	jB4>	iQ2!	eJ8$	hO5?	pL9(	wX0.	mD7=	gI2#	lP1&	oF9;
	aT0[	yR6@	vK1)	pY2,	nE9;	iB4?	lG3!	uJ5(	wP8]	cC7#	dI5&	bF2<	qH7-
	eE7)	iR4@	rV1,	dH3_	lP8<	mC5+	zW2(	uJ9$	qS6]	xT0-	jI4%	oK8;	vX3=
	rR4_	sE8@	eW9<	fL7(	hM3'	yI6+	nD1,	gG5>	wB2&	dF0]	iA1!	lS2)	xV3[
	dN3>	nK8&	kA0?	aL5$	pT6"	zO1[	hB7<	oZ4.	eR2#	uM9)	rC2+	gS3-	lV0!
	jW5_	gB3)	eF1-	dV0@	oO7.	bT2'	nA6=	tQ4#	wG9]	uR8>	lI2+	fK3;	cH7%
	yS6@	jP4>	sI0*	iX8$	rZ5<	cV1-	zA2"	qQ3.	wE9#	aG7)	oN8'	lU1&	vW6(
	bY7"	dB9.	rC8,	oG0(	aH1_	pJ4!	nU6<	qI3@	uP2#	lA5;	fO3'	zD9>	tE2/
	dA4=	mX7$	nI2!	hN8#	zP5?	iL9<	vT3)	pQ0;	eR1&	yH6@	rG3'	tC1/	fF2[
	bX7<	eY2_	hE4>	uV5&	pK0*	fJ9#	sR1/	dT3,	nB6)	jL8"	yM6(	wF4@	aP1]
	eC7(	vB8<	nE1#	iP6_	zM3+	rO2%	fS0;	oK4&	mR5-	wG9*	bV0)	aH9@	uZ8'
	sF2@	eM4%	lL0(	qD3-	dO6#	iK5*	fE8/	gQ1$	cU9_	mP7&	nZ2=	vG0!	tY6]
	xP4'	lT1,	yQ0?	hW7>	zY2;	dN8[	mS9/	nZ6-	wJ3)	fA5<	jK6!	bX8#	iB7+
