local M = {}
M.allWords = 7
M.settings = {}
M.settings.selectedWord = 1
M.settings.unlockedLevels = 2
M.settings.levels = {} 

-- These lines are just here to pre-populate the table.
-- In reality, your app would likely create a level entry when each level is unlocked and the score/stars are saved.
-- Perhaps this happens at the end of your game level, or in a scene between game levels.
M.settings.levels[1] = {}
M.settings.levels[1].name = 'ААВ'
M.settings.levels[1].seq = '113'

M.settings.levels[2] = {}
M.settings.levels[2].name = 'ВАА'
M.settings.levels[2].seq = '311'

M.settings.levels[3] = {}
M.settings.levels[3].name = 'НАС'
M.settings.levels[3].seq = '113'

M.settings.levels[4] = {}
M.settings.levels[4].name = 'НОМ'
M.settings.levels[4].seq = '113'

M.settings.levels[5] = {}
M.settings.levels[5].name = 'НАР'
M.settings.levels[5].seq = '113'

M.settings.levels[6] = {}
M.settings.levels[6].name = 'ХАР'
M.settings.levels[6].seq = '113'

M.settings.levels[7] = {}
M.settings.levels[7].name = 'САНСАР'
M.settings.levels[7].seq = '113'


-- levels data members:
--      .stars -- Stars earned per level
--      .score -- Score for the level
return M