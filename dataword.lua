local M = {}
M.allWords = 21
M.settings = {}
M.settings.selectedWord = 1
M.settings.unlockedLevels = 20
M.settings.levels = {} 

M.settings.levels[1] = {}
M.settings.levels[1].name = 'ААВ'
M.settings.levels[1].count = 3
M.settings.levels[1].seq = '1,1,3'
M.settings.levels[1].chorus = 'bundles/01_unaga/chorus.mp3'
M.settings.levels[1].wordListen = 'bundles/01_unaga/word.mp3'
M.settings.levels[1].wordDef = 'bundles/01_unaga/wordDef.mp3'
M.settings.levels[1].thumb = 'bundles/01_unaga/thumb.jpg'

M.settings.levels[2] = {}
M.settings.levels[2].name = 'ВААР'
M.settings.levels[2].count = 4
M.settings.levels[2].seq = '3,1,1,19'
M.settings.levels[2].chorus = 'bundles/02_tugal/chorus.mp3'
M.settings.levels[2].wordListen = 'bundles/02_tugal/word.mp3'
M.settings.levels[2].wordDef = 'bundles/02_tugal/wordDef.mp3'
M.settings.levels[2].thumb = 'bundles/02_tugal/thumb.jpg'

M.settings.levels[3] = {}
M.settings.levels[3].name = 'САВ'
M.settings.levels[3].count = 3
M.settings.levels[3].seq = '20,1,3'
M.settings.levels[3].chorus = 'bundles/03_botgo/chorus.mp3'
M.settings.levels[3].wordListen = 'bundles/03_botgo/word.mp3'
M.settings.levels[3].wordDef = 'bundles/03_botgo/wordDef.mp3'
M.settings.levels[3].thumb = 'bundles/03_botgo/thumb.jpg'

M.settings.levels[4] = {}
M.settings.levels[4].name = 'НАМАР'
M.settings.levels[4].count = 5
M.settings.levels[4].seq = '15,1,14,1,19'
M.settings.levels[4].chorus = 'bundles/04_hurga/chorus.mp3'
M.settings.levels[4].wordListen = 'bundles/04_hurga/word_namar.mp3'
M.settings.levels[4].wordDef = 'bundles/04_hurga/wordDef.mp3'
M.settings.levels[4].thumb = 'bundles/04_hurga/thumb.jpg'

M.settings.levels[5] = {}
M.settings.levels[5].name = 'ХАВАР'
M.settings.levels[5].count = 5
M.settings.levels[5].seq = '25,1,3,1,19'
M.settings.levels[5].chorus = 'bundles/05_ishig/chorus.mp3'
M.settings.levels[5].wordListen = 'bundles/05_ishig/word.mp3'
M.settings.levels[5].wordDef = 'bundles/05_ishig/wordDef.mp3'
M.settings.levels[5].thumb = 'bundles/05_ishig/thumb.jpg'

M.settings.levels[6] = {}
M.settings.levels[6].name = 'ТАРВАС'
M.settings.levels[6].count = 6
M.settings.levels[6].seq = '21,1,19,3,1,20'
M.settings.levels[6].chorus = 'bundles/06_golog/chorus.mp3'
M.settings.levels[6].wordListen = 'bundles/06_golog/word.mp3'
M.settings.levels[6].wordDef = 'bundles/06_golog/wordDef.mp3'
M.settings.levels[6].thumb = 'bundles/06_golog/thumb.jpg'

M.settings.levels[7] = {}
M.settings.levels[7].name = 'САНСАРТ'
M.settings.levels[7].count = 7
M.settings.levels[7].seq = '20,1,15,20,1,19,21'
M.settings.levels[7].chorus = 'bundles/07_tooroi/chorus.mp3'
M.settings.levels[7].wordListen = 'bundles/07_tooroi/word.mp3'
M.settings.levels[7].wordDef = 'bundles/07_tooroi/wordDef.mp3'
M.settings.levels[7].thumb = 'bundles/07_tooroi/thumb.jpg'

M.settings.levels[8] = {}
M.settings.levels[8].name = 'МММММMMCAММММММО'
M.settings.levels[8].count = 16
M.settings.levels[8].seq = '14,14,14,14,14,14,14, 20,1,14,14,14,14,14,14,16'
M.settings.levels[8].chorus = 'bundles/08_degdeehii/chorus.mp3'
M.settings.levels[8].wordListen = 'bundles/08_degdeehii/word_namar.mp3'
M.settings.levels[8].wordDef = 'bundles/08_degdeehii/wordDef.mp3'
M.settings.levels[8].thumb = 'bundles/08_degdeehii/thumb.jpg'

M.settings.levels[9] = {}
M.settings.levels[9].name = 'ТООР'
M.settings.levels[9].count = 4
M.settings.levels[9].seq = '21,16,16,19'
M.settings.levels[9].chorus = 'bundles/09_dudran/chorus.mp3'
M.settings.levels[9].wordListen = 'bundles/09_dudran/word_namar.mp3'
M.settings.levels[9].wordDef = 'bundles/09_dudran/wordDef.mp3'
M.settings.levels[9].thumb = 'bundles/09_dudran/thumb.jpg'

M.settings.levels[10] = {}
M.settings.levels[10].name = 'ҮҮР'
M.settings.levels[10].count = 3
M.settings.levels[10].seq = '23,23,19'
M.settings.levels[10].chorus = 'bundles/10_angaahai/chorus.mp3'
M.settings.levels[10].wordListen = 'bundles/10_angaahai/word_namar.mp3'
M.settings.levels[10].wordDef = 'bundles/10_angaahai/wordDef.mp3'
M.settings.levels[10].thumb = 'bundles/10_angaahai/thumb.jpg'

M.settings.levels[11] = {}
M.settings.levels[11].name = 'ТАВ'
M.settings.levels[11].count = 3
M.settings.levels[11].seq = '21,1,3'
M.settings.levels[11].chorus = 'bundles/11_bujin/chorus.mp3'
M.settings.levels[11].wordListen = 'bundles/11_bujin/word_namar.mp3'
M.settings.levels[11].wordDef = 'bundles/11_bujin/wordDef.mp3'
M.settings.levels[11].thumb = 'bundles/11_bujin/thumb.jpg'

M.settings.levels[12] = {}
M.settings.levels[12].name = 'ТАВ'
M.settings.levels[12].count = 3
M.settings.levels[12].seq = '21,1,3'
M.settings.levels[12].chorus = 'bundles/12_huvdai/chorus.mp3'
M.settings.levels[12].wordListen = 'bundles/12_huvdai/word_namar.mp3'
M.settings.levels[12].wordDef = 'bundles/12_huvdai/wordDef.mp3'
M.settings.levels[12].thumb = 'bundles/12_huvdai/thumb.jpg'

M.settings.levels[13] = {}
M.settings.levels[13].name = 'ТАВ'
M.settings.levels[13].count = 3
M.settings.levels[13].seq = '21,1,3'
M.settings.levels[13].chorus = 'bundles/13_boodii/chorus.mp3'
M.settings.levels[13].wordListen = 'bundles/13_boodii/word_namar.mp3'
M.settings.levels[13].wordDef = 'bundles/13_boodii/wordDef.mp3'
M.settings.levels[13].thumb = 'bundles/13_boodii/thumb.jpg'

M.settings.levels[14] = {}
M.settings.levels[14].name = 'ТАВ'
M.settings.levels[14].count = 3
M.settings.levels[14].seq = '21,1,3'
M.settings.levels[14].chorus = 'bundles/14_mondol/chorus.mp3'
M.settings.levels[14].wordListen = 'bundles/14_mondol/word_namar.mp3'
M.settings.levels[14].wordDef = 'bundles/14_mondol/wordDef.mp3'
M.settings.levels[14].thumb = 'bundles/14_mondol/thumb.jpg'

M.settings.levels[15] = {}
M.settings.levels[15].name = 'ТАВ'
M.settings.levels[15].count = 3
M.settings.levels[15].seq = '21,1,3'
M.settings.levels[15].chorus = 'bundles/15_yanzaga/chorus.mp3'
M.settings.levels[15].wordListen = 'bundles/15_yanzaga/word_namar.mp3'
M.settings.levels[15].wordDef = 'bundles/15_yanzaga/wordDef.mp3'
M.settings.levels[15].thumb = 'bundles/15_yanzaga/thumb.jpg'

M.settings.levels[16] = {}
M.settings.levels[16].name = 'ТАВ'
M.settings.levels[16].count = 3
M.settings.levels[16].seq = '21,1,3'
M.settings.levels[16].chorus = 'bundles/16_hugash/chorus.mp3'
M.settings.levels[16].wordListen = 'bundles/16_hugash/word_namar.mp3'
M.settings.levels[16].wordDef = 'bundles/16_hugash/wordDef.mp3'
M.settings.levels[16].thumb = 'bundles/16_hugash/thumb.jpg'

M.settings.levels[17] = {}
M.settings.levels[17].name = 'ТАВ'
M.settings.levels[17].count = 3
M.settings.levels[17].seq = '21,1,3'
M.settings.levels[17].chorus = 'bundles/17_mazaahai/chorus.mp3'
M.settings.levels[17].wordListen = 'bundles/17_mazaahai/word_namar.mp3'
M.settings.levels[17].wordDef = 'bundles/17_mazaahai/wordDef.mp3'
M.settings.levels[17].thumb = 'bundles/17_mazaahai/thumb.jpg'

M.settings.levels[18] = {}
M.settings.levels[18].name = 'ТАВ'
M.settings.levels[18].count = 3
M.settings.levels[18].seq = '21,1,3'
M.settings.levels[18].chorus = 'bundles/18_gavar/chorus.mp3'
M.settings.levels[18].wordListen = 'bundles/18_gavar/word_namar.mp3'
M.settings.levels[18].wordDef = 'bundles/18_gavar/wordDef.mp3'
M.settings.levels[18].thumb = 'bundles/18_gavar/thumb.jpg'

M.settings.levels[19] = {}
M.settings.levels[19].name = 'ТАВ'
M.settings.levels[19].count = 3
M.settings.levels[19].seq = '21,1,3'
M.settings.levels[19].chorus = 'bundles/19_beltreg/chorus.mp3'
M.settings.levels[19].wordListen = 'bundles/19_beltreg/word_namar.mp3'
M.settings.levels[19].wordDef = 'bundles/19_beltreg/wordDef.mp3'
M.settings.levels[19].thumb = 'bundles/19_beltreg/thumb.jpg'

M.settings.levels[20] = {}
M.settings.levels[20].name = 'ТАВ'
M.settings.levels[20].count = 3
M.settings.levels[20].seq = '21,1,3'
M.settings.levels[20].chorus = 'bundles/20_guyen/chorus.mp3'
M.settings.levels[20].wordListen = 'bundles/20_guyen/word_namar.mp3'
M.settings.levels[20].wordDef = 'bundles/20_guyen/wordDef.mp3'
M.settings.levels[20].thumb = 'bundles/20_guyen/thumb.jpg'

M.settings.levels[21] = {}
M.settings.levels[21].name = 'А'
M.settings.levels[21].count = 1
M.settings.levels[21].seq = '1'
M.settings.levels[21].chorus = 'bundles/21_blank/chorus.mp3'
M.settings.levels[21].wordListen = 'bundles/21_blank/word_namar.mp3'
M.settings.levels[21].wordDef = 'bundles/21_blank/wordDef.mp3'
M.settings.levels[21].thumb = 'bundles/21_blank/thumb.png'


return M