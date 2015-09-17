local L = {}
L.allLetters = 2
L.letters = {}

L.letters[1] = {}
L.letters[1].nameCyrillic = 'А'
L.letters[1].nameLatin = 'A'
L.letters[1].imgNormal = '/images/A.png'
L.letters[1].imgWon = '/images/A_01.png'
L.letters[1].imgGrey = '/images/A_grey.png'
L.letters[1].imgSprite = '/images/sprite_sheet.png'
L.letters[1].soundSelected = '/sounds/A-short.mp3'


L.letters[2] = {}
L.letters[2].nameCyrillic = 'В'
L.letters[2].nameLatin = 'Ve'
L.letters[2].imgNormal = '/images/B.png'
L.letters[2].imgWon = '/images/A_01.png'
L.letters[2].imgGrey = '/images/B_grey.png'
L.letters[2].imgSprite = '/images/b_sprite_sheet.png'
L.letters[2].soundSelected = '/sounds/B-long.mp3'



--[[L.maxLevels = 5
L.settings = {}
M.settings.currentLevel = 1
M.settings.unlockedLevels = 1
M.settings.soundOn = true
M.settings.musicOn = true
M.settings.levels = {} 


-- These lines are just here to pre-populate the table.
-- In reality, your app would likely create a level entry when each level is unlocked and the score/stars are saved.
-- Perhaps this happens at the end of your game level, or in a scene between game levels.
M.settings.levels[1] = {}
M.settings.levels[1].stars = 3
M.settings.levels[1].name = 'Aав'

M.settings.levels[2] = {}
M.settings.levels[2].stars = 0
M.settings.levels[2].name = 'Баавгай'

M.settings.levels[3] = {}
M.settings.levels[3].stars = 0
M.settings.levels[3].name = 'Ваар'

M.settings.levels[4] = {}
M.settings.levels[4].stars = 0
M.settings.levels[4].name = 'Галуу'

M.settings.levels[5] = {}
M.settings.levels[5].stars = 0
M.settings.levels[5].name = 'Даам'
--]]




-- levels data members:
--      .stars -- Stars earned per level
--      .score -- Score for the level
return L