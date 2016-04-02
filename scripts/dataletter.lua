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
З = 9
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
Ы = 32
Э = 33
Ю = 34
Я = 35
- = 36

]]
L.allLetters = 24
L.letters = {}

L.letters[1] = {}
L.letters[1].name = 'А'
L.letters[1].seq = '1'
L.letters[1].width = 110
L.letters[1].imgNormal = 'images/A.png'
L.letters[1].imgWhite = 'images/A_white.png'
L.letters[1].imgSprite = 'images/A_sprite.png'
L.letters[1].soundSelected = 'letters_voice/phonic_A.mp3'
L.letters[1].soundLetter = 'letters_voice/letter_A.mp3'

L.letters[2] = {}
L.letters[2].name = 'Б'
L.letters[2].seq = '2'
L.letters[2].width = 110
L.letters[2].imgNormal = 'images/B.png'
L.letters[2].imgWhite = 'images/B_white.png'
L.letters[2].imgSprite = 'images/B_sprite.png'
L.letters[2].soundSelected = 'letters_voice/phonic_B.mp3'
L.letters[2].soundLetter = 'letters_voice/letter_B_f.mp3'

L.letters[3] = {}
L.letters[3].name = 'В'
L.letters[3].seq = '3'
L.letters[3].width = 83
L.letters[3].imgNormal = 'images/Ve.png'
L.letters[3].imgWhite = 'images/Ve_white.png'
L.letters[3].imgSprite = 'images/Ve_sprite.png'
L.letters[3].soundSelected = 'letters_voice/phonic_V.mp3'
L.letters[3].soundLetter = 'letters_voice/letter_V_f.mp3'

L.letters[4] = {}
L.letters[4].name = 'Г'
L.letters[4].seq = '4'
L.letters[4].width = 100
L.letters[4].imgNormal = 'images/Ge.png'
L.letters[4].imgWhite = 'images/Ge_white.png'
L.letters[4].imgSprite = 'images/Ge_sprite.png'
L.letters[4].soundSelected = 'letters_voice/phonic_G.mp3'
L.letters[4].soundLetter = 'letters_voice/letter_G_f.mp3'

L.letters[5] = {}
L.letters[5].name = 'Д'
L.letters[5].seq = '5'
L.letters[5].width = 160
L.letters[5].imgNormal = 'images/D.png'
L.letters[5].imgWhite = 'images/D_white.png'
L.letters[5].imgSprite = 'images/D_sprite.png'
L.letters[5].soundSelected = 'letters_voice/phonic_D.mp3'
L.letters[5].soundLetter = 'letters_voice/letter_D_f.mp3'

L.letters[6] = {}
L.letters[6].name = 'Е'
L.letters[6].seq = '6'
L.letters[6].width = 104
L.letters[6].imgNormal = 'images/Ye.png'
L.letters[6].imgWhite = 'images/Ye_white.png'
L.letters[6].imgSprite = 'images/Ye_sprite.png'
L.letters[6].soundSelected = 'letters_voice/phonic_Ye.mp3'
L.letters[6].soundLetter = 'letters_voice/letter_Ye_f.mp3'

L.letters[8] = {}
L.letters[8].name = 'Ж'
L.letters[8].seq = '8'
L.letters[8].width = 101
L.letters[8].imgNormal = 'images/Je.png'
L.letters[8].imgWhite = 'images/Je_white.png'
L.letters[8].imgSprite = 'images/Je_Sprite.png'
L.letters[8].soundSelected = 'letters_voice/phonic_J.mp3'
L.letters[8].soundLetter = 'letters_voice/letter_J_f.mp3'

L.letters[9] = {}
L.letters[9].name = 'З'
L.letters[9].seq = '9'
L.letters[9].width = 101
L.letters[9].imgNormal = 'images/Z.png'
L.letters[9].imgWhite = 'images/Z_white.png'
L.letters[9].imgSprite = 'images/Z_sprite.png'
L.letters[9].soundSelected = 'letters_voice/phonic_Z.mp3'
L.letters[9].soundLetter = 'letters_voice/letter_Z_f.mp3'

L.letters[10] = {}
L.letters[10].name = 'И'
L.letters[10].seq = '10'
L.letters[10].width = 114
L.letters[10].imgNormal = 'images/I.png'
L.letters[10].imgWhite = 'images/I_white.png'
L.letters[10].imgSprite = 'images/I_sprite.png'
L.letters[10].soundSelected = 'letters_voice/phonic_I.mp3'
L.letters[10].soundLetter = 'letters_voice/letter_I_f.mp3'

L.letters[11] = {}
L.letters[11].name = 'Й'
L.letters[11].seq = '11'
L.letters[11].width = 114
L.letters[11].imgNormal = 'images/Ii.png'
L.letters[11].imgWhite = 'images/Ii_white.png'
L.letters[11].imgSprite = 'images/Ii_sprite.png'
L.letters[11].soundSelected = 'letters_voice/phonic_I.mp3'
L.letters[11].soundLetter = 'letters_voice/letter_Ii_f.mp3'

--[[
L.letters[12] = {}
L.letters[12].name = 'К'
L.letters[12].seq = '12'
L.letters[12].width = 128
L.letters[12].imgNormal = 'images/K.png'
L.letters[12].imgWhite = 'images/K_white.png'
L.letters[12].imgSprite = 'images/K_sprite.png'
L.letters[12].soundSelected = 'letters_voice/phonic_K.mp3'
L.letters[12].soundLetter = 'letters_voice/letter_K.mp3'
]]

L.letters[13] = {}
L.letters[13].name = 'Л'
L.letters[13].seq = '13'
L.letters[13].width = 96
L.letters[13].imgNormal = 'images/L.png'
L.letters[13].imgWhite = 'images/L_white.png'
L.letters[13].imgSprite = 'images/L_sprite.png'
L.letters[13].soundSelected = 'letters_voice/phonic_L.mp3'
L.letters[13].soundLetter = 'letters_voice/letter_L_f.mp3'

L.letters[14] = {}
L.letters[14].name = 'М'
L.letters[14].seq = '14'
L.letters[14].width = 185
L.letters[14].imgNormal = 'images/M.png'
L.letters[14].imgWhite = 'images/M_white.png'
L.letters[14].imgSprite = 'images/M_sprite.png'
L.letters[14].soundSelected = 'letters_voice/phonic_M.mp3'
L.letters[14].soundLetter = 'letters_voice/letter_M_f.mp3'

L.letters[15] = {}
L.letters[15].name = 'Н'
L.letters[15].seq = '15'
L.letters[15].width = 122
L.letters[15].imgNormal = 'images/N.png'
L.letters[15].imgWhite = 'images/N_white.png'
L.letters[15].imgSprite = 'images/N_sprite.png'
L.letters[15].soundSelected = 'letters_voice/phonic_N.mp3'
L.letters[15].soundLetter = 'letters_voice/letter_N_f.mp3'

L.letters[16] = {}
L.letters[16].name = 'О'
L.letters[16].seq = '16'
L.letters[16].width = 112
L.letters[16].imgNormal = 'images/O.png'
L.letters[16].imgWhite = 'images/O_white.png'
L.letters[16].imgSprite = 'images/O_sprite.png'
L.letters[16].soundSelected = 'letters_voice/phonic_O.mp3'
L.letters[16].soundLetter = 'letters_voice/letter_O_f.mp3'

L.letters[17] = {}
L.letters[17].name = 'Ө'
L.letters[17].seq = '17'
L.letters[17].width = 112
L.letters[17].imgNormal = 'images/Ou.png'
L.letters[17].imgWhite = 'images/Ou_white.png'
L.letters[17].imgSprite = 'images/Ou_sprite.png'
L.letters[17].soundSelected = 'letters_voice/phonic_Uo.mp3'
L.letters[17].soundLetter = 'letters_voice/letter_Uo_f.mp3'


L.letters[19] = {}
L.letters[19].name = 'Р'
L.letters[19].seq = '19'
L.letters[19].width = 97
L.letters[19].imgNormal = 'images/R.png'
L.letters[19].imgWhite = 'images/R_white.png'
L.letters[19].imgSprite = 'images/R_sprite.png'
L.letters[19].soundSelected = 'letters_voice/phonic_R.mp3'
L.letters[19].soundLetter = 'letters_voice/letter_R_f.mp3'

--[[
L.letters[20] = {}
L.letters[20].name = 'С'
L.letters[20].seq = '20'
L.letters[20].width = 104
L.letters[20].imgNormal = 'images/C.png'
L.letters[20].imgWhite = 'images/C_white.png'
L.letters[20].imgSprite = 'images/C_sprite.png'
L.letters[20].soundSelected = 'letters_voice/phonic_C.mp3'
L.letters[20].soundLetter = 'letters_voice/letter_C.mp3'
]]

L.letters[21] = {}
L.letters[21].name = 'Т'
L.letters[21].seq = '21'
L.letters[21].width = 102
L.letters[21].imgNormal = 'images/T.png'
L.letters[21].imgWhite = 'images/T_white.png'
L.letters[21].imgSprite = 'images/T_sprite.png'
L.letters[21].soundSelected = 'letters_voice/phonic_T.mp3'
L.letters[21].soundLetter = 'letters_voice/letter_T_f.mp3'


L.letters[22] = {}
L.letters[22].name = 'У'
L.letters[22].seq = '22'
L.letters[22].width = 102
L.letters[22].imgNormal = 'images/U.png'
L.letters[22].imgWhite = 'images/U_white.png'
L.letters[22].imgSprite = 'images/U_sprite.png'
L.letters[22].soundSelected = 'letters_voice/phonic_U.mp3'
L.letters[22].soundLetter = 'letters_voice/letter_U_f.mp3'


L.letters[23] = {}
L.letters[23].name = 'Ү'
L.letters[23].seq = '23'
L.letters[23].width = 118
L.letters[23].imgNormal = 'images/Y.png'
L.letters[23].imgWhite = 'images/Y_white.png'
L.letters[23].imgSprite = 'images/Y_sprite.png'
L.letters[23].soundSelected = 'letters_voice/phonic_Yy.mp3'
L.letters[23].soundLetter = 'letters_voice/letter_Yy_f.mp3'

L.letters[25] = {}
L.letters[25].name = 'Х'
L.letters[25].seq = '25'
L.letters[25].width = 133
L.letters[25].imgNormal = 'images/He.png'
L.letters[25].imgWhite = 'images/He_white.png'
L.letters[25].imgSprite = 'images/He_sprite.png'
L.letters[25].soundSelected = 'letters_voice/phonic_H.mp3'
L.letters[25].soundLetter = 'letters_voice/letter_H_f.mp3'

L.letters[26] = {}
L.letters[26].name = 'Ц'
L.letters[26].seq = '28'
L.letters[26].width = 132
L.letters[26].imgNormal = 'images/Ts.png'
L.letters[26].imgWhite = 'images/Ts_white.png'
L.letters[26].imgSprite = 'images/Ts_sprite.png'
L.letters[26].soundSelected = 'letters_voice/phonic_Ts.mp3'
L.letters[26].soundLetter = 'letters_voice/letter_Ts.mp3'

L.letters[28] = {}
L.letters[28].name = 'Ш'
L.letters[28].seq = '28'
L.letters[28].width = 132
L.letters[28].imgNormal = 'images/Sh.png'
L.letters[28].imgWhite = 'images/Sh_white.png'
L.letters[28].imgSprite = 'images/Sh_sprite.png'
L.letters[28].soundSelected = 'letters_voice/phonic_Sh.mp3'
L.letters[28].soundLetter = 'letters_voice/letter_Sh_f.mp3'

L.letters[33] = {}
L.letters[33].name = 'Э'
L.letters[33].seq = '33'
L.letters[33].width = 132
L.letters[33].imgNormal = 'images/E.png'
L.letters[33].imgWhite = 'images/E_white.png'
L.letters[33].imgSprite = 'images/E_sprite.png'
L.letters[33].soundSelected = 'letters_voice/phonic_E.mp3'
L.letters[33].soundLetter = 'letters_voice/letter_E_f.mp3'

L.letters[35] = {}
L.letters[35].name = 'Я'
L.letters[35].seq = '35'
L.letters[35].width = 132
L.letters[35].imgNormal = 'images/Ya.png'
L.letters[35].imgWhite = 'images/Ya_white.png'
L.letters[35].imgSprite = 'images/Ya_sprite.png'
L.letters[35].soundSelected = 'letters_voice/phonic_Ya.mp3'
L.letters[35].soundLetter = 'letters_voice/letter_Ya_f.mp3'
return L