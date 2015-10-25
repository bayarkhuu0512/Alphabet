local M = {}
M.allWords = 20
M.settings = {}
M.settings.selectedWord = 1
M.settings.unlockedLevels = 20
M.settings.levels = {} 

M.settings.levels[1] = {}
M.settings.levels[1].name = 'УНАГА'
M.settings.levels[1].count = 5
M.settings.levels[1].seq = '22,15,1,4,1'
M.settings.levels[1].wordListen = 'bundles/01_unaga/unaga.mp3'
M.settings.levels[1].wordDef = 'bundles/01_unaga/unaga_worddef.mp3'
M.settings.levels[1].thumb = 'bundles/01_unaga/unaga_icon.png'
M.settings.levels[1].focused = 'bundles/01_unaga/unaga_focused.png'
M.settings.levels[1].image = 'bundles/01_unaga/unaga_worddef.png'
M.settings.levels[1].letter = 'bundles/01_unaga/u.png'

M.settings.levels[2] = {}
M.settings.levels[2].name = 'ТУГАЛ'
M.settings.levels[2].count = 5
M.settings.levels[2].seq = '21,22,4,1,13'
M.settings.levels[2].wordListen = 'bundles/02_tugal/tugal.mp3'
M.settings.levels[2].wordDef = 'bundles/02_tugal/tugal_worddef.mp3'
M.settings.levels[2].thumb = 'bundles/02_tugal/tugal_icon.png'
M.settings.levels[2].focused = 'bundles/02_tugal/tugal_focused.png'
M.settings.levels[2].image = 'bundles/02_tugal/tugal_worddef.png'
M.settings.levels[2].letter = 'bundles/02_tugal/t.png'

M.settings.levels[3] = {}
M.settings.levels[3].name = 'БОТГО'
M.settings.levels[3].count = 5
M.settings.levels[3].seq = '2,16,21,4,16'
M.settings.levels[3].wordListen = 'bundles/03_botgo/botgo.mp3'
M.settings.levels[3].wordDef = 'bundles/03_botgo/botgo_worddef.mp3'
M.settings.levels[3].thumb = 'bundles/03_botgo/botgo_icon.png'
M.settings.levels[3].focused = 'bundles/03_botgo/botgo_focused.png'
M.settings.levels[3].image = 'bundles/03_botgo/botgo_worddef.png'
M.settings.levels[3].letter = 'bundles/03_botgo/b.png'

M.settings.levels[4] = {}
M.settings.levels[4].name = 'ХУРГА'
M.settings.levels[4].count = 5
M.settings.levels[4].seq = '25,22,19,4,1'
M.settings.levels[4].wordListen = 'bundles/04_hurga/hurga.mp3'
M.settings.levels[4].wordDef = 'bundles/04_hurga/hurga_worddef.mp3'
M.settings.levels[4].thumb = 'bundles/04_hurga/hurga_icon.png'
M.settings.levels[4].focused = 'bundles/04_hurga/hurga_focused.png'
M.settings.levels[4].image = 'bundles/04_hurga/hurga_worddef.png'
M.settings.levels[4].letter = 'bundles/04_hurga/h.png'

M.settings.levels[5] = {}
M.settings.levels[5].name = 'ИШИГ'
M.settings.levels[5].count = 4
M.settings.levels[5].seq = '10,28,10,4'
M.settings.levels[5].wordListen = 'bundles/05_ishig/ishig.mp3'
M.settings.levels[5].wordDef = 'bundles/05_ishig/ishig_worddef.mp3'
M.settings.levels[5].thumb = 'bundles/05_ishig/ishig_icon.png'
M.settings.levels[5].focused = 'bundles/05_ishig/ishig_focused.png'
M.settings.levels[5].image = 'bundles/05_ishig/ishig_worddef.png'
M.settings.levels[5].letter = 'bundles/05_ishig/i.png'

M.settings.levels[6] = {}
M.settings.levels[6].name = 'ГӨЛӨГ'
M.settings.levels[6].count = 5
M.settings.levels[6].seq = '4,17,13,17,4'
M.settings.levels[6].wordListen = 'bundles/06_golog/golog.mp3'
M.settings.levels[6].wordDef = 'bundles/06_golog/golog_worddef.mp3'
M.settings.levels[6].thumb = 'bundles/06_golog/golog_icon.png'
M.settings.levels[6].focused = 'bundles/06_golog/golog_focused.png'
M.settings.levels[6].image = 'bundles/06_golog/golog_worddef.png'
M.settings.levels[6].letter = 'bundles/06_golog/g.png'

M.settings.levels[7] = {}
M.settings.levels[7].name = 'ТООРОЙ'
M.settings.levels[7].count = 6
M.settings.levels[7].seq = '21,16,16,19,16,11'
M.settings.levels[7].wordListen = 'bundles/07_tooroi/tooroi.mp3'
M.settings.levels[7].wordDef = 'bundles/07_tooroi/tooroi_worddef.mp3'
M.settings.levels[7].thumb = 'bundles/07_tooroi/tooroi_icon.png'
M.settings.levels[7].focused = 'bundles/07_tooroi/tooroi_focused.png'
M.settings.levels[7].image = 'bundles/07_tooroi/tooroi_worddef.png'
M.settings.levels[7].letter = 'bundles/07_tooroi/t.png'

M.settings.levels[8] = {}
M.settings.levels[8].name = 'ДЭГДЭЭХИЙ'
M.settings.levels[8].count = 9
M.settings.levels[8].seq = '5,33,4,5,33,33,25,10,11'
M.settings.levels[8].wordListen = 'bundles/08_degdeehii/degdeehii.mp3'
M.settings.levels[8].wordDef = 'bundles/08_degdeehii/degdeehii_worddef.mp3'
M.settings.levels[8].thumb = 'bundles/08_degdeehii/degdeehii_icon.png'
M.settings.levels[8].focused = 'bundles/08_degdeehii/degdeehii_focused.png'
M.settings.levels[8].image = 'bundles/08_degdeehii/degdeehii_worddef.png'
M.settings.levels[8].letter = 'bundles/08_degdeehii/d.png'

M.settings.levels[9] = {}
M.settings.levels[9].name = 'ДУДРАН'
M.settings.levels[9].count = 6
M.settings.levels[9].seq = '5,22,5,19,1,15'
M.settings.levels[9].wordListen = 'bundles/09_dudran/dudran.mp3'
M.settings.levels[9].wordDef = 'bundles/09_dudran/dudran_worddef.mp3'
M.settings.levels[9].thumb = 'bundles/09_dudran/dudran_icon.png'
M.settings.levels[9].focused = 'bundles/09_dudran/dudran_focused.png'
M.settings.levels[9].image = 'bundles/09_dudran/dudran_worddef.png'
M.settings.levels[9].letter = 'bundles/09_dudran/d.png'

M.settings.levels[10] = {}
M.settings.levels[10].name = 'АНГААХАЙ'
M.settings.levels[10].count = 8
M.settings.levels[10].seq = '1,15,4,1,1,25,1,11'
M.settings.levels[10].wordListen = 'bundles/10_angaahai/angaahai.mp3'
M.settings.levels[10].wordDef = 'bundles/10_angaahai/angaahai_worddef.mp3'
M.settings.levels[10].thumb = 'bundles/10_angaahai/angaahai_icon.png'
M.settings.levels[10].focused = 'bundles/10_angaahai/angaahai_focused.png'
M.settings.levels[10].image = 'bundles/10_angaahai/angaahai_worddef.png'
M.settings.levels[10].letter = 'bundles/10_angaahai/a.png'

M.settings.levels[11] = {}
M.settings.levels[11].name = 'БҮЖИН'
M.settings.levels[11].count = 5
M.settings.levels[11].seq = '2,23,8,10,15'
M.settings.levels[11].wordListen = 'bundles/11_bujin/bujin.mp3'
M.settings.levels[11].wordDef = 'bundles/11_bujin/bujin_worddef.mp3'
M.settings.levels[11].thumb = 'bundles/11_bujin/bujin_icon.png'
M.settings.levels[11].focused = 'bundles/11_bujin/bujin_focused.png'
M.settings.levels[11].image = 'bundles/11_bujin/bujin_worddef.png'
M.settings.levels[11].letter = 'bundles/11_bujin/b.png'

M.settings.levels[12] = {}
M.settings.levels[12].name = 'ХУВДАЙ'
M.settings.levels[12].count = 6
M.settings.levels[12].seq = '25,22,3,5,1,11'
M.settings.levels[12].wordListen = 'bundles/12_huvdai/huvdai.mp3'
M.settings.levels[12].wordDef = 'bundles/12_huvdai/huvdai_worddef.mp3'
M.settings.levels[12].thumb = 'bundles/12_huvdai/huvdai_icon.png'
M.settings.levels[12].focused = 'bundles/12_huvdai/huvdai_focused.png'
M.settings.levels[12].image = 'bundles/12_huvdai/huvdai_worddef.png'
M.settings.levels[12].letter = 'bundles/12_huvdai/h.png'

M.settings.levels[13] = {}
M.settings.levels[13].name = 'БӨӨДИЙ'
M.settings.levels[13].count = 6
M.settings.levels[13].seq = '2,17,17,5,10,11'
M.settings.levels[13].wordListen = 'bundles/13_boodii/boodii.mp3'
M.settings.levels[13].wordDef = 'bundles/13_boodii/boodii_worddef.mp3'
M.settings.levels[13].thumb = 'bundles/13_boodii/boodii_icon.png'
M.settings.levels[13].focused = 'bundles/13_boodii/boodii_focused.png'
M.settings.levels[13].image = 'bundles/13_boodii/boodii_worddef.png'
M.settings.levels[13].letter = 'bundles/13_boodii/b.png'

M.settings.levels[14] = {}
M.settings.levels[14].name = 'МӨНДӨЛ'
M.settings.levels[14].count = 6
M.settings.levels[14].seq = '14,17,15,5,17,13'
M.settings.levels[14].wordListen = 'bundles/14_mondol/mondol.mp3'
M.settings.levels[14].wordDef = 'bundles/14_mondol/mondol_worddef.mp3'
M.settings.levels[14].thumb = 'bundles/14_mondol/mondol_icon.png'
M.settings.levels[14].focused = 'bundles/14_mondol/mondol_focused.png'
M.settings.levels[14].image = 'bundles/14_mondol/mondol_worddef.png'
M.settings.levels[14].letter = 'bundles/14_mondol/m.png'

M.settings.levels[15] = {}
M.settings.levels[15].name = 'ЯНЗАГА'
M.settings.levels[15].count = 6
M.settings.levels[15].seq = '35,15,9,1,4,1'
M.settings.levels[15].wordListen = 'bundles/15_yanzaga/yanzaga.mp3'
M.settings.levels[15].wordDef = 'bundles/15_yanzaga/yanzaga_worddef.mp3'
M.settings.levels[15].thumb = 'bundles/15_yanzaga/yanzaga_icon.png'
M.settings.levels[15].focused = 'bundles/15_yanzaga/yanzaga_focused.png'
M.settings.levels[15].image = 'bundles/15_yanzaga/yanzaga_worddef.png'
M.settings.levels[15].letter = 'bundles/15_yanzaga/ya.png'

M.settings.levels[16] = {}
M.settings.levels[16].name = 'ХУГАШ'
M.settings.levels[16].count = 5
M.settings.levels[16].seq = '25,22,4,1,28'
M.settings.levels[16].wordListen = 'bundles/16_hugash/hugash.mp3'
M.settings.levels[16].wordDef = 'bundles/16_hugash/hugash_worddef.mp3'
M.settings.levels[16].thumb = 'bundles/16_hugash/hugash_icon.png'
M.settings.levels[16].focused = 'bundles/16_hugash/hugash_focused.png'
M.settings.levels[16].image = 'bundles/16_hugash/hugash_worddef.png'
M.settings.levels[16].letter = 'bundles/16_hugash/h.png'

M.settings.levels[17] = {}
M.settings.levels[17].name = 'АЛМАНЦАГ'
M.settings.levels[17].count = 8
M.settings.levels[17].seq = '1,13,14,1,15,26,1,4'
M.settings.levels[17].wordListen = 'bundles/17_almantsag/almantsag.mp3'
M.settings.levels[17].wordDef = 'bundles/17_almantsag/almantsag_worddef.mp3'
M.settings.levels[17].thumb = 'bundles/17_almantsag/almantsag_icon.png'
M.settings.levels[17].focused = 'bundles/17_almantsag/almantsag_focused.png'
M.settings.levels[17].image = 'bundles/17_almantsag/almantsag_worddef.png'
M.settings.levels[17].letter = 'bundles/17_almantsag/a.png'

M.settings.levels[18] = {}
M.settings.levels[18].name = 'ГАВАР'
M.settings.levels[18].count = 5
M.settings.levels[18].seq = '4,1,3,1,19'
M.settings.levels[18].wordListen = 'bundles/18_gavar/gavar.mp3'
M.settings.levels[18].wordDef = 'bundles/18_gavar/gavar_worddef.mp3'
M.settings.levels[18].thumb = 'bundles/18_gavar/gavar_icon.png'
M.settings.levels[18].focused = 'bundles/18_gavar/gavar_focused.png'
M.settings.levels[18].image = 'bundles/18_gavar/gavar_worddef.png'
M.settings.levels[18].letter = 'bundles/18_gavar/g.png'

M.settings.levels[19] = {}
M.settings.levels[19].name = 'БЭЛТРЭГ'
M.settings.levels[19].count = 7
M.settings.levels[19].seq = '2,33,13,21,19,33,4'
M.settings.levels[19].wordListen = 'bundles/19_beltreg/beltreg.mp3'
M.settings.levels[19].wordDef = 'bundles/19_beltreg/beltreg_worddef.mp3'
M.settings.levels[19].thumb = 'bundles/19_beltreg/thumb.jpg'
M.settings.levels[19].focused = 'bundles/19_beltreg/thumb.jpg'
M.settings.levels[19].image = 'bundles/19_beltreg/thumb.jpg'
M.settings.levels[19].letter = 'bundles/19_beltreg/b.png'

M.settings.levels[20] = {}
M.settings.levels[20].name = 'ГҮЕН'
M.settings.levels[20].count = 4
M.settings.levels[20].seq = '4,23,6,15'
M.settings.levels[20].wordListen = 'bundles/20_guyen/guyen.mp3'
M.settings.levels[20].wordDef = 'bundles/20_guyen/guyen_worddef.mp3'
M.settings.levels[20].thumb = 'bundles/20_guyen/thumb.jpg'
M.settings.levels[20].focused = 'bundles/20_guyen/thumb.jpg'
M.settings.levels[20].image = 'bundles/20_guyen/thumb.jpg'
M.settings.levels[20].letter = 'bundles/20_guyen/g.png'

return M