local M = {}
M.allWords = 7
M.settings = {}
M.settings.selectedWord = 1
M.settings.unlockedLevels = 7
M.settings.levels = {} 

-- These lines are just here to pre-populate the table.
-- In reality, your app would likely create a level entry when each level is unlocked and the score/stars are saved.
-- Perhaps this happens at the end of your game level, or in a scene between game levels.
M.settings.levels[1] = {}
M.settings.levels[1].name = 'ААВ'
M.settings.levels[1].count = 3
M.settings.levels[1].seq = '1,1,3'
M.settings.levels[1].chorus = 'bundles/001_aav/chorus.mp3'

M.settings.levels[2] = {}
M.settings.levels[2].name = 'ВААР'
M.settings.levels[2].count = 4
M.settings.levels[2].seq = '3,1,1,19'
M.settings.levels[2].chorus = 'bundles/002_vaar/chorus.mp3'

M.settings.levels[3] = {}
M.settings.levels[3].name = 'САВ'
M.settings.levels[3].count = 3
M.settings.levels[3].seq = '20,1,3'
M.settings.levels[3].chorus = 'bundles/003_sav/chorus.mp3'

M.settings.levels[4] = {}
M.settings.levels[4].name = 'НАМАР'
M.settings.levels[4].count = 5
M.settings.levels[4].seq = '15,1,14,1,19'
M.settings.levels[4].chorus = 'bundles/004_namar/chorus.mp3'

M.settings.levels[5] = {}
M.settings.levels[5].name = 'ХАВАР'
M.settings.levels[5].count = 5
M.settings.levels[5].seq = '25,1,3,1,19'
M.settings.levels[5].chorus = 'bundles/005_havar/chorus.mp3'

M.settings.levels[6] = {}
M.settings.levels[6].name = 'ТАРВАС'
M.settings.levels[6].count = 6
M.settings.levels[6].seq = '21,1,19,3,1,20'
M.settings.levels[6].chorus = 'bundles/006_tarvas/chorus.mp3'

M.settings.levels[7] = {}
M.settings.levels[7].name = 'САНСАР'
M.settings.levels[7].count = 6
M.settings.levels[7].seq = '20,1,15,20,1,19'
M.settings.levels[7].chorus = 'bundles/007_sansar/chorus.mp3'

return M