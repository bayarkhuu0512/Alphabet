local sceneName = ...

local composer = require( "composer" )

-- Load scene with same root filename as this file
local scene = composer.newScene( sceneName )
local dataword = require( "dataword" )
local dataletter = require( "dataletter" )
local letter = require ("letter")
local widget = require( "widget" )
local wordId
function scene:create( event )
    local sceneGroup = self.view

    print( 'Chosen word ID: ',dataword.settings.selectedWord )

wordId = tonumber(dataword.settings.selectedWord)
local word = dataword.settings.levels[wordId]
local wordSequences = tostring(word.seq)
local wordDefAudio =  audio.loadSound(word.wordDef)
local chorusAudio =  audio.loadSound(word.chorus)
  
  print('Chosen word Name: ',wordSequences)

local scalePoint = 1.3
local displayHeight = display.contentHeight/2
local displayWidth = display.contentWidth/2
local actualHeight =  display.contentHeight
local actualWidth =  display.contentWidth
local navigationHeight = 50
local mainWordHeight
local topMargin
local leftMargin
local mainWordWidth
local letterWidth = 185
local letterHeight = 182
local defaultHeight = 182
local x, y
local wordCount
local letterMargin
local animation

-- Background Image
local background = display.newImage("images/BG.jpg",true)
background.x = displayWidth
background.y = displayHeight

--Үндсэн Letter.lua object-г агуулах array(үсэгний бүх мэдэээлэл scale, rotation, holder, audio etc)
local splitedLetter = {}
--үсэг болгоны spriteSheet-г агуулах array
local sequenceData = {}
--dataletters.lua-н үсэгнүүдийн обектийг агуулах array
local letters = {}

mainWordHeight = (actualHeight - navigationHeight)/3 - 20
topMargin = (actualHeight - mainWordHeight)/2
leftMargin = 20
mainWordWidth = actualWidth - leftMargin * 2
print ("mainWordHeight ", mainWordWidth)
wordCount = tonumber(word.count)
letterMargin = 25



local tempWidth = 0
local counter = 1
--Орж ирсэн үгийн үсгүүдийг dataletters.lua-с нэг array-д хийж, мөн үсгүүдийн бодит уртыг олох loop
for word in string.gmatch(wordSequences, '([^,]+)')  do
    local selectedLetter = dataletter.letters[tonumber(word)]
    letters[counter] = selectedLetter
    tempWidth = tempWidth + tonumber(selectedLetter.width)
    counter = counter + 1
end
tempWidth = tempWidth + letterMargin *(wordCount - 1)


local percentageDif  = 0
if (tempWidth  < mainWordWidth) then
    local dif = mainWordWidth - tempWidth
    leftMargin = dif/2
    mainWordWidth = tempWidth
    x = leftMargin

else 
    local dif = tempWidth - mainWordWidth
    percentageDif = dif * tempWidth / 100
    x =   leftMargin + dif 
end

-- local myRectangle = display.newRect(leftMargin + mainWordWidth/2, topMargin + mainWordHeight/2, mainWordWidth, mainWordHeight)
-- myRectangle.strokeWidth = 3
-- myRectangle.alpha = 0.3
-- myRectangle:setFillColor(0.5 )
-- myRectangle:setStrokeColor( 1, 0, 0 )

print("x", topMargin)
y =  topMargin + mainWordHeight/2

--SheetImage-н мэдээлэл
local sheetData = {
    width = 191,
    height = 206,
    numFrames = 7,
    sheetContentWidth = 1337,
    sheetContentHeight = 206
}

local globalSheet

--Letter object-г үүсгэж зурагнуудыг байршуулах loop
for k, v in pairs(letters) do
    local letterX = 0
    local letterY = 0
    local holder = nil
    local rotation = 0
    local audioFile = nil
    local audioLetter = nil    
    local number = 0
    local name = nil
    local realImage = nil
    local eachSheetData = nil

    letterX = x 
    letterY = y
    rotation = 0
    name = v.name
    number = k


    holder = display.newImage(v.imgGrey, letterX, letterY, true)
    holder.x = holder.x + holder.contentWidth/2
    holder.isVisible = false
    audioFile = audio.loadSound( v.soundSelected)
    audioLetter = audio.loadSound( v.soundLetter)
    realImage = display.newImage(v.imgNormal,  holder.x, holder.y, true)

    -- print(holder.contentWidth, holder.contentHeight)
    -- if (percentageDif ~= 0) then

    --     realImage.contentWidth = realImage.contentWidth*100/percentageDif
    --     realImage.contentHeight = realImage.contentHeight*100/percentageDif
    -- end
    realImage.name = number

    eachSheetData =  graphics.newImageSheet( v.imgSprite, sheetData )
    if (number == 1) then
        globalSheet = eachSheetData
    end
    sequenceData[number] = {
        name = number,
        sheet = eachSheetData,
        start = 1,
        count = 7,
        time = 700
    }
    splitedLetter[number] =  letter.new(letterX, letterY, holder, rotation, audioFile, audioLetter, number, name , realImage )

    -- realImage:addEventListener("touch", dragLetters)

    x = x + v.width + letterMargin
end  -- repeat untill the for loop end



animation = display.newSprite( globalSheet, sequenceData )
animation.x = display.contentWidth/2
animation.y = display.contentHeight/2
animation.isVisible = false
animation.xScale = scalePoint
animation.yScale = scalePoint
animation.name = "animation"


function preDestinationLetters( ... )
    -- body

    for k, v in pairs(splitedLetter) do
        function preDestinationComplete()
            transition.to( v.realImage, {time=300, xScale = 1, yScale = 1})
            transition.to( v.holder, {time=300, xScale = 1, yScale = 1}) 
            v.holder.isVisible = true
        end
        local rotate = math.random( -15, 15 )
        transition.to( v.holder, { time=300, rotation=rotate, xScale = scalePoint, yScale = scalePoint, onComplete = preDestinationComplete})
        transition.to( v.realImage, { time=300, rotation=rotate, xScale = scalePoint, yScale = scalePoint, onComplete = preDestinationComplete})
        v.rotatePoint = rotate
    end
end

function randomStructing( )
    -- body
    print ("Please random coordinate me")
    preDestinationLetters()
end


function hitObjects(obj1, obj2)
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
local soundLetter
local b = 0
local matchedLettersCount = 0;


function dragLetters( event )
    if (b == 0) then
        target = event.target
        targetAnim = animation
        local chosenLetter = splitedLetter[target.name]
        print ("target",target.name )

        targetHolder = chosenLetter.holder
        sound = chosenLetter.audioFile
        soundLetter = chosenLetter.audioLetter
        targetAnim:setSequence( chosenLetter.number)
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
            transition.scaleTo( target, {time=10, xScale = scalePoint, yScale = scalePoint, onComplete = complete} )
        end
    elseif event.phase == "moved" then
        local x = (event.x - event.xStart) +  targetAnim.markX
        local y = (event.y - event.yStart) + targetAnim.markY
        targetAnim.x, targetAnim.y = x,y
        target.x, target.y = x, y

    elseif(event.phase == 'ended' and hitObjects(targetAnim, targetHolder)) then
        matchedLettersCount = matchedLettersCount+1;

        if(wordCount==matchedLettersCount) then            
        dataword.settings.selectedWord = wordId +1
        print ("All letters matched!")        
        print ("end animation: ",matchedLettersCount)
        print ("All words : ",dataword.allWords)
        print ("SelectedWord : ",dataword.settings.selectedWord)
        audio.play(chorusAudio)

        if(dataword.allWords>=dataword.settings.selectedWord) then
        print("Go to Next word")        
        composer.removeScene( "game", false )
        composer.gotoScene( "game", { effect="crossFade", time=333 } )
        else
        print("All words completed")        
        end
        else
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
            audio.play( soundLetter )
        end
        transition.to( target, {time=500, x=targetHolder.x , y = targetHolder.y, onComplete = transitionComplete} )
    end
        -- correct = correct + 1
        -- audio.play(correctSnd)
    elseif event.phase == "ended" or event.phase == "cancelled" then
        print ("end animation")
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
                    if (hitObjects(targetAnim, v.holder)) then
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

animation:addEventListener( "touch", dragLetters )

-- Button handler to cancel the level selection and return to the menu
local function handleBackButtonEvent( event )
    if ( "ended" == event.phase ) then
        composer.removeScene( "game", false )
        composer.gotoScene( "menu", { effect="crossFade", time=333 } )
    end
end

local function handleWordButtonEvent( event )
    if ( "ended" == event.phase ) then
    audio.play( wordDefAudio )
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

    -- Create a cancel button for return to the menu scene.
local wordButton = widget.newButton({
        id = "buttonWord",
        label = "Үг сонсох",
        left = 200,
        top = 0,
        width = 100,
        height = 50,
        onEvent = handleWordButtonEvent
})

sceneGroup:insert( background )
sceneGroup:insert( backButton )
sceneGroup:insert( wordButton )

for k, v in pairs(splitedLetter) do
    if (v ~= nil) then
        v.realImage:addEventListener( "touch", dragLetters )
        print (v.holder.x)
        sceneGroup:insert( v.holder )
        sceneGroup:insert( v.realImage )
    end
end
sceneGroup:insert( animation )

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
        timer.performWithDelay(1000, randomStructing)

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
