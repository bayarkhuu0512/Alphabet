local L = {}
--[[
Letters Seq
А = 1 //A
Б = 2 
В = 3 //B
Г = 4
Д = 5
Е = 6 //E
Ё = 7
Ж = 8
Ъ = 9
И = 10
Й = 11
К = 12 //K
Л = 13
М = 14 //M
Н = 15 //H
О = 16 //O
Ө = 17
П = 18
Р = 19 //P
С = 20 //C
Т = 21 //T
У = 22
Ү = 23 //Y
Ф = 24
Х = 25 //X
Ц = 26
Ч = 27
Ш = 28
Щ = 29
Ъ = 30
Ь = 31
В = 32
Ы = 33
Э = 34
Ю = 35
Я = 36
- = 37

]]
L.allLetters = 12
L.letters = {}

L.letters[1] = {}
L.letters[1].name = 'А'
L.letters[1].seq = '1'
L.letters[1].width = 110
L.letters[1].imgNormal = 'images/A.png'
L.letters[1].imgGrey = 'images/A_grey.png'
L.letters[1].imgSprite = 'images/A_sprite.png'
L.letters[1].soundSelected = 'sounds/A-short.mp3'
L.letters[1].soundLetter = 'sounds/letter_A.mp3'


L.letters[3] = {}
L.letters[3].name = 'В'
L.letters[3].seq = '3'
L.letters[3].width = 83
L.letters[3].imgNormal = 'images/B.png'
L.letters[3].imgGrey = 'images/B_grey.png'
L.letters[3].imgSprite = 'images/B_sprite.png'
L.letters[3].soundSelected = 'sounds/B-long.mp3'
L.letters[3].soundLetter = 'sounds/letter_B.mp3'

L.letters[6] = {}
L.letters[6].name = 'Е'
L.letters[6].seq = '6'
L.letters[6].width = 101
L.letters[6].imgNormal = 'images/E.png'
L.letters[6].imgGrey = 'images/E_grey.png'
L.letters[6].imgSprite = 'images/E_sprite.png'
L.letters[6].soundSelected = 'sounds/E-short.mp3'
L.letters[6].soundLetter = 'sounds/letter_E.mp3'

L.letters[12] = {}
L.letters[12].name = 'К'
L.letters[12].seq = '12'
L.letters[12].width = 128
L.letters[12].imgNormal = 'images/K.png'
L.letters[12].imgGrey = 'images/K_grey.png'
L.letters[12].imgSprite = 'images/K_sprite.png'
L.letters[12].soundSelected = 'sounds/K-long.mp3'
L.letters[12].soundLetter = 'sounds/letter_K.mp3'

L.letters[14] = {}
L.letters[14].name = 'М'
L.letters[14].seq = '14'
L.letters[14].width = 185
L.letters[14].imgNormal = 'images/M.png'
L.letters[14].imgGrey = 'images/M_grey.png'
L.letters[14].imgSprite = 'images/M_sprite.png'
L.letters[14].soundSelected = 'sounds/M-long.mp3'
L.letters[14].soundLetter = 'sounds/letter_M.mp3'

L.letters[15] = {}
L.letters[15].name = 'Н'
L.letters[15].seq = '15'
L.letters[15].width = 122
L.letters[15].imgNormal = 'images/H.png'
L.letters[15].imgGrey = 'images/H_grey.png'
L.letters[15].imgSprite = 'images/H_sprite.png'
L.letters[15].soundSelected = 'sounds/H-long.mp3'
L.letters[15].soundLetter = 'sounds/letter_H.mp3'

L.letters[16] = {}
L.letters[16].name = 'О'
L.letters[16].seq = '16'
L.letters[16].width = 112
L.letters[16].imgNormal = 'images/O.png'
L.letters[16].imgGrey = 'images/O_grey.png'
L.letters[16].imgSprite = 'images/O_sprite.png'
L.letters[16].soundSelected = 'sounds/O-short.mp3'
L.letters[16].soundLetter = 'sounds/letter_O.mp3'

L.letters[19] = {}
L.letters[19].name = 'Р'
L.letters[19].seq = '19'
L.letters[19].width = 97
L.letters[19].imgNormal = 'images/P.png'
L.letters[19].imgGrey = 'images/P_grey.png'
L.letters[19].imgSprite = 'images/P_sprite.png'
L.letters[19].soundSelected = 'sounds/P-long.mp3'
L.letters[19].soundLetter = 'sounds/letter_P.mp3'

L.letters[20] = {}
L.letters[20].name = 'С'
L.letters[20].seq = '20'
L.letters[20].width = 104
L.letters[20].imgNormal = 'images/C.png'
L.letters[20].imgGrey = 'images/C_grey.png'
L.letters[20].imgSprite = 'images/C_sprite.png'
L.letters[20].soundSelected = 'sounds/C-short.mp3'
L.letters[20].soundLetter = 'sounds/letter_C.mp3'

L.letters[21] = {}
L.letters[21].name = 'Т'
L.letters[21].seq = '21'
L.letters[21].width = 102
L.letters[21].imgNormal = 'images/T.png'
L.letters[21].imgGrey = 'images/T_grey.png'
L.letters[21].imgSprite = 'images/T_sprite.png'
L.letters[21].soundSelected = 'sounds/T-long.mp3'
L.letters[21].soundLetter = 'sounds/letter_T.mp3'

L.letters[23] = {}
L.letters[23].name = 'Ү'
L.letters[23].seq = '23'
L.letters[23].width = 118
L.letters[23].imgNormal = 'images/Y.png'
L.letters[23].imgGrey = 'images/Y_grey.png'
L.letters[23].imgSprite = 'images/Y_sprite.png'
L.letters[23].soundSelected = 'sounds/Y-long.mp3'
L.letters[23].soundLetter = 'sounds/letter_Y.mp3'

L.letters[25] = {}
L.letters[25].name = 'Х'
L.letters[25].seq = '25'
L.letters[25].width = 132
L.letters[25].imgNormal = 'images/X.png'
L.letters[25].imgGrey = 'images/X_grey.png'
L.letters[25].imgSprite = 'images/X_sprite.png'
L.letters[25].soundSelected = 'sounds/X-long.mp3'
L.letters[25].soundLetter = 'sounds/letter_X.mp3'

return L