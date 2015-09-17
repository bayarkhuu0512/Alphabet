local sceneName = ...

local composer = require( "composer" )

-- Load scene with same root filename as this file
local scene = composer.newScene( sceneName )
local Letter = require ("Letter")
local widget = require( "widget" )

function scene:create( event )
    local sceneGroup = self.view

    -- Called when the scene's view does not exist
    -- 
    -- INSERT code here to initialize the scene
    -- e.g. add display objects to 'sceneGroup', add touch listeners, etc

local requiredWord = "AAB"

-- Background Image
local background = display.newImage("images/BG.jpg",true)
background.x = display.contentWidth / 2
background.y = display.contentHeight / 2


local scalePoint = 1.3


local splitedLetter = {}
local sequenceData = {}


local x = 65
local y = 130
local dif = 200
local maxCount = 0

local sheetData = {
    width = 191,
    height = 206,
    numFrames = 7,
    sheetContentWidth = 1337,
    sheetContentHeight = 206
}

local aSheet = graphics.newImageSheet( "images/sprite_sheet.png", sheetData )
local bSheet = graphics.newImageSheet( "images/b_sprite_sheet.png", sheetData )

for a = 1, string.len(requiredWord)+1 do  -- for 1 to the number of letters in our text + 1
    print (string.sub(requiredWord, a,a)) -- split the string with the start and end at "a"
    local letterX = 0
    local letterY = 0
    local holder = nil
    local rotation = 0
    local audioFile = nil
    local number = 0
    local name = nil
    local realImage = nil
    local eachSheetData = nil

    letterX = x 
    letterY = y
    rotation = 0
    name = string.sub(requiredWord, a,a)
    number = a
    print( number )
    if (string.sub(requiredWord, a,a) == "A") then
        holder = display.newImage('images/A_grey.png', letterX, letterY)
        audioFile = audio.loadSound( "sounds/A-short.mp3" )
        realImage = display.newImage('images/A.png',  display.contentWidth/2 + (a-1)*dif, display.contentHeight/2)
        realImage.name = number
        eachSheetData =  graphics.newImageSheet( "images/sprite_sheet.png", sheetData )
       sequenceData[number] = {
            name = number,
            sheet = eachSheetData,
            start = 1,
            count = 7,
            time = 700
        }
        splitedLetter[number] =  Letter.new(letterX, letterY, holder, rotation, audioFile, number, name , realImage )
    elseif (string.sub(requiredWord, a,a) == "B") then
        print ("bbbbbbb")
        holder = display.newImage('images/B_grey.png', letterX, letterY)
        audioFile = audio.loadSound( "sounds/B-long.mp3" )
        realImage = display.newImage('images/B.png',  display.contentWidth/2 + (a-1)*dif, display.contentHeight/2)
        realImage.name = number
        eachSheetData =  graphics.newImageSheet( "images/b_sprite_sheet.png", sheetData )
        sequenceData[number] = {
            name = number,
            sheet = eachSheetData,
            start = 1,
            count = 7,
            time = 700
        }
        splitedLetter[number] =  Letter.new( letterX, letterY, holder, rotation, audioFile, number, name , realImage )
    end
    -- realImage:addEventListener("touch", dragLetters)


    x = x + dif
    maxCount = a
end  -- repeat untill the for loop end

for k, v in pairs(sequenceData) do
    print(v.sheet)
end

local soundTable = {
    -- aShortSound = audio.loadSound( "sounds/A-short.mp3" ), 
    -- bShortSound = audio.loadSound( "sounds/B-long.mp3"),
    -- Background Music
    backgroundMusic = audio.loadStream( "sounds/bg_music1.mp3" )
}

audio.play( soundTable["backgroundMusic"],{ loops=-1 }  )


-- local sequenceData ={
--     {
--         name = "seq1",
--         sheet = aSheet,
--         start = 1,
--         count = 7,
--         time = 700
--     },
--     {
--         name = "seq2",
--         sheet = bSheet,
--         start = 1,
--         count = 7,
--         time = 700
--     }

-- }

-- local holdersTable = {}

-- local sHolder = display.newImage('images/A_grey.png', 60, 130)
-- holdersTable[0]  = sHolder
-- local s2Holder = display.newImage('images/A_grey.png', 250, 130)
-- holdersTable[1]  = s2Holder
-- local bHolder = display.newImage('images/B_grey.png', 440, 130)
-- holdersTable[2] = bHolder



local animation = display.newSprite( aSheet, sequenceData )
animation.x = display.contentWidth/2
animation.y = display.contentHeight/2
animation.isVisible = false
animation.xScale = scalePoint
animation.yScale = scalePoint
animation.name = "animation"

-- local aRealImage = display.newImage('images/A.png')
-- aRealImage.x = display.contentWidth/2
-- aRealImage.y = display.contentHeight/2
-- aRealImage.name = "A_anim"


-- local aRealImage2 = display.newImage('images/A.png')
-- aRealImage2.x = display.contentWidth/2 + 200
-- aRealImage2.y = display.contentHeight/2
-- aRealImage2.name = "A_anim2"

-- local bRealImage = display.newImage('images/B.png')
-- bRealImage.x = display.contentWidth/2 + 400
-- bRealImage.y = display.contentHeight/2
-- bRealImage.name = "B_anim"


function hitTestObjects(obj1, obj2)
        local left = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
        local right = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
        local up = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
        local down = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax
        return (left or right) and (up or down)
end

local target 
local targetAnim 
local targetHolder
local sound
local b = 0


function dragLetters( event )
    if (b == 0) then
        target = event.target
        targetAnim = animation
        print (target.name)
        local chosenLetter = splitedLetter[target.name]
        targetHolder = chosenLetter.holder
        sound = chosenLetter.audioFile
        print (sequenceData)
        targetAnim:setSequence( sequenceData[target.name])
        -- if (target.name == "A_anim") then
        --     targetHolder = sHolder
        --     sound  = soundTable["aShortSound"]
        --     targetAnim:setSequence( "seq1" )
        -- elseif (target.name == "A_anim2") then
        --     targetHolder = holdersTable[1]
        --     sound  = soundTable["aShortSound"]
        --     targetAnim:setSequence( "seq1" )
        -- elseif (target.name == "B_anim") then
        --     targetHolder = holdersTable[2]
        --     sound  = soundTable["bShortSound"]
        --     targetAnim:setSequence( "seq2" )            
        -- end 
        b = 1
    end

    if (event.phase == "began") then
        if (target.name ~= "animation") then
            function complete ()
                targetAnim.x, targetAnim.y = target.x,target.y
                targetAnim.markX = target.x
                targetAnim.markY = target.y
                target.isVisible = false
                targetAnim.isVisible = true
                -- targetAnim.name = target.name        
                targetAnim:play()
                sound = audio.play( sound,{ loops=-1 } )
            end
            targetAnim.markX = target.x
            targetAnim.markY = target.y
            transition.scaleTo( target, {time=100, xScale = scalePoint, yScale = scalePoint, onComplete = complete} )
        end
    elseif event.phase == "moved" then
        local x = (event.x - event.xStart) +  targetAnim.markX
        local y = (event.y - event.yStart) + targetAnim.markY
        targetAnim.x, targetAnim.y = x,y
        target.x, target.y = x, y

    elseif(event.phase == 'ended' and hitTestObjects(targetAnim, targetHolder)) then
        targetAnim:setFrame(1)  
        targetAnim.isVisible = false    
        target.isVisible = true
        targetAnim:pause()  

        audio.stop(sound)
        -- event.target.x = 60.5
        -- event.target.y = 175
        -- target:removeEventListener('touch', dragShape)
        function transitionComplete()
            endAnimation(target)
            target:removeEventListener("touch", dragLetters)
            b = 0
        end
        transition.to( target, {time=500, x=targetHolder.x , y = targetHolder.y, onComplete = transitionComplete} )

        -- correct = correct + 1
        -- audio.play(correctSnd)
    elseif event.phase == "ended" or event.phase == "cancelled" then


        targetAnim:pause()  
        targetAnim:setFrame(1)  
        targetAnim.isVisible = false    
        target.isVisible = true
        audio.stop(sound)
        function noEqualizerCompleted()
            endAnimation(target)
        end

        local notChanging = false
        for k, v in pairs(splitedLetter) do
            if (v ~= nil) then
                print(v.name)
                if (targetHolder ~= v.holder) then
                    if (hitTestObjects(targetAnim, v.holder)) then
                        transition.to( target, {time=500, x=target.x  + 30, y = targetHolder.y + 150, onComplete = noEqualizerCompleted} )
                        notChanging = true
                    end
                end
            end
        end
        if (notChanging == false) then
            endAnimation(target)    
        end
        b = 0
    end
    return true
end


function endAnimation( realImage )
    function secondComplete()
        transition.scaleTo( realImage, {time=100, xScale = 1.0, yScale = 1.0 } )

    end
    function firstComplete()
        transition.scaleTo( realImage, {time=100, xScale = 1.07, yScale = 1.07, onComplete = secondComplete} )

    end
    transition.scaleTo( realImage, {time=100, xScale = 1.0, yScale = 1.0, onComplete = firstComplete} )

end

function setDefaultImage( targetAnim )
    
end


-- aRealImage:addEventListener("touch", dragLetters)
-- aRealImage2:addEventListener("touch", dragLetters)
-- bRealImage:addEventListener("touch", dragLetters)
animation:addEventListener( "touch", dragLetters )
-- bAnimation:addEventListener( "touch", dragLetters )

-- Button handler to cancel the level selection and return to the menu
local function handleBackButtonEvent( event )
    if ( "ended" == event.phase ) then
        composer.removeScene( "game", false )
        composer.gotoScene( "menu", { effect="crossFade", time=333 } )
        print( "Button was pressed and released" )
    end
end


    -- Create a cancel button for return to the menu scene.
local backButton = widget.newButton({
        id = "button1",
        label = "Буцах",
        left = 0,
        top = 0,
        width = 100,
        height = 50,
        onEvent = handleBackButtonEvent
})

sceneGroup:insert( background )
sceneGroup:insert( backButton )

for a = 1, maxCount - 1, 1 do
    local eachLetter = splitedLetter[a]
    print (eachLetter:printArea())
    eachLetter.realImage:addEventListener( "touch", dragLetters )
    sceneGroup:insert( eachLetter.holder )
    sceneGroup:insert( eachLetter.realImage )

end


-- sceneGroup:insert( aRealImage )
-- sceneGroup:insert( aRealImage2 )
-- sceneGroup:insert( bRealImage )
-- sceneGroup:insert( sHolder )
-- sceneGroup:insert( s2Holder )
-- sceneGroup:insert( bHolder )


end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Called when the scene is off screen and is about to move on screen
    elseif phase == "did" then
        -- Called when the scene is now on screen
        -- 
        -- INSERT code here to make the scene come alive
        -- e.g. start timers, begin animation, play audio, etc


    end 
end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then
        -- Called when the scene is on screen and is about to move off screen
        --
        -- INSERT code here to pause the scene
        -- e.g. stop timers, stop animation, unload sounds, etc.)
        audio.stop()
    elseif phase == "did" then
        -- Called when the scene is now off screen
    end 
end


function scene:destroy( event )
    local sceneGroup = self.view
        audio.stop()

    -- Called prior to the removal of scene's "view" (sceneGroup)
    -- 
    -- INSERT code here to cleanup the scene
    -- e.g. remove display objects, remove touch listeners, save state, etc
end

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-------------------------------------------------------------------------------

return scene
