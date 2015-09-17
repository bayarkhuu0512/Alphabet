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
L.letters[1].imgNormal = 'images/A.png'
L.letters[1].imgGrey = 'images/A_grey.png'
L.letters[1].imgSprite = 'images/A_sprite.png'
L.letters[1].soundSelected = 'sounds/A-short.mp3'

L.letters[2] = {}
L.letters[2].name = 'В'
L.letters[2].seq = '3'
L.letters[2].imgNormal = 'images/B.png'
L.letters[2].imgGrey = 'images/B_grey.png'
L.letters[2].imgSprite = 'images/B_sprite.png'
L.letters[2].soundSelected = 'sounds/B-long.mp3'

L.letters[3] = {}
L.letters[3].name = 'Е'
L.letters[3].seq = '6'
L.letters[3].imgNormal = 'images/E.png'
L.letters[3].imgGrey = 'images/E_grey.png'
L.letters[3].imgSprite = 'images/B_sprite.png'
L.letters[3].soundSelected = 'sounds/E-short.mp3'

L.letters[4] = {}
L.letters[4].name = 'К'
L.letters[4].seq = '12'
L.letters[4].imgNormal = 'images/K.png'
L.letters[4].imgGrey = 'images/K_grey.png'
L.letters[4].imgSprite = 'images/B_sprite.png'
L.letters[4].soundSelected = 'sounds/K-long.mp3'

L.letters[5] = {}
L.letters[5].name = 'М'
L.letters[5].seq = '14'
L.letters[5].imgNormal = 'images/M.png'
L.letters[5].imgGrey = 'images/M_grey.png'
L.letters[5].imgSprite = 'images/B_sprite.png'
L.letters[5].soundSelected = 'sounds/M-long.mp3'

L.letters[6] = {}
L.letters[6].name = 'Н'
L.letters[6].seq = '15'
L.letters[6].imgNormal = 'images/H.png'
L.letters[6].imgGrey = 'images/H_grey.png'
L.letters[6].imgSprite = 'images/B_sprite.png'
L.letters[6].soundSelected = 'sounds/H-long.mp3'

L.letters[7] = {}
L.letters[7].name = 'О'
L.letters[7].seq = '16'
L.letters[7].imgNormal = 'images/O.png'
L.letters[7].imgGrey = 'images/O_grey.png'
L.letters[7].imgSprite = 'images/B_sprite.png'
L.letters[7].soundSelected = 'sounds/O-short.mp3'

L.letters[8] = {}
L.letters[8].name = 'Р'
L.letters[8].seq = '19'
L.letters[8].imgNormal = 'images/P.png'
L.letters[8].imgGrey = 'images/P_grey.png'
L.letters[8].imgSprite = 'images/B_sprite.png'
L.letters[8].soundSelected = 'sounds/E-short.mp3'

L.letters[9] = {}
L.letters[9].name = 'С'
L.letters[9].seq = '20'
L.letters[9].imgNormal = 'images/C.png'
L.letters[9].imgGrey = 'images/C_grey.png'
L.letters[9].imgSprite = 'images/B_sprite.png'
L.letters[9].soundSelected = 'sounds/C-short.mp3'

L.letters[10] = {}
L.letters[10].name = 'Т'
L.letters[10].seq = '21'
L.letters[10].imgNormal = 'images/T.png'
L.letters[10].imgGrey = 'images/T_grey.png'
L.letters[10].imgSprite = 'images/B_sprite.png'
L.letters[10].soundSelected = 'sounds/T-long.mp3'

L.letters[11] = {}
L.letters[11].name = 'Ү'
L.letters[11].seq = '23'
L.letters[11].imgNormal = 'images/Y.png'
L.letters[11].imgGrey = 'images/Y_grey.png'
L.letters[11].imgSprite = 'images/B_sprite.png'
L.letters[11].soundSelected = 'sounds/Y-long.mp3'

L.letters[12] = {}
L.letters[12].name = 'Х'
L.letters[12].seq = '25'
L.letters[12].imgNormal = 'images/X.png'
L.letters[12].imgGrey = 'images/X_grey.png'
L.letters[12].imgSprite = 'images/B_sprite.png'
L.letters[12].soundSelected = 'sounds/X-long.mp3'

return L