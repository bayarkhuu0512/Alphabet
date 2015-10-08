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
    local displayMidY = displayHeight
    local isPreparing = true

    -- Background Image
    local background = display.newImage("images/BG.jpg",true)
    background.x = displayWidth
    background.y = displayHeight

    --Үндсэн letter.lua object-г агуулах array(үсэгний бүх мэдэээлэл scale, rotation, holder, audio etc)
    local splitedLetter = {}
    --үсэг болгоны spriteSheet-г агуулах array
    local sequenceData = {}
    --dataletters.lua-н үсэгнүүдийн обектийг агуулах array
    local letters = {}

    local formerSplitedLetters = {}

    mainWordHeight = (actualHeight - navigationHeight)/3 - 20
    topMargin = (actualHeight - mainWordHeight)/2
    leftMargin = 20
    mainWordWidth = actualWidth - leftMargin * 2
    print ("mainWordHeight ", mainWordWidth)
    wordCount = tonumber(word.count)
    letterMargin = 25



    local tempWidth = 0
    --Орж ирсэн үгийн үсгүүдийг dataletters.lua-с нэг array-д хийж, мөн үсгүүдийн бодит уртыг олох loop
    function getTempWidth( scaleSize )
        -- body
        local counter = 1
        local tempValue = 0
        for word in string.gmatch(wordSequences, '([^,]+)')  do
            local selectedLetter = dataletter.letters[tonumber(word)]
            letters[counter] = selectedLetter
            tempValue = tempValue + tonumber(selectedLetter.width) * scaleSize
            counter = counter + 1
        end
        tempValue = tempValue + letterMargin *(wordCount - 1)
        return tempValue 
    end

    tempWidth = getTempWidth(1)


    local manyLettersScale  = 1
    if (tempWidth  < mainWordWidth) then
        local dif = actualWidth - tempWidth
        leftMargin = dif/2
        mainWordWidth = tempWidth
        x = leftMargin

    else 
        local nonMarginedSize = mainWordWidth - letterMargin*(wordCount - 1)
        local resizedLetterWidth = nonMarginedSize / wordCount
        percentageDif = resizedLetterWidth *100/letterWidth
        manyLettersScale = percentageDif /100
        tempWidth = getTempWidth (manyLettersScale)

        local dif = actualWidth - tempWidth
        leftMargin = dif/2
        mainWordWidth = tempWidth
        x = leftMargin
    end

    scalePoint = manyLettersScale + 0.2


    -- local myRectangle = display.newRect(leftMargin + mainWordWidth/2, topMargin + mainWordHeight/2, mainWordWidth, mainWordHeight)
    -- myRectangle.strokeWidth = 3
    -- myRectangle.alpha = 0.3
    -- myRectangle:setFillColor(0.5 )
    -- myRectangle:setStrokeColor( 1, 0, 0 )

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

    --letter object-г үүсгэж зурагнуудыг байршуулах loop
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
        holder.isVisible = false
        audioFile = audio.loadSound( v.soundSelected)
        audioLetter = audio.loadSound( v.soundLetter)
        realImage = display.newImage(v.imgNormal,  holder.x, holder.y, true)

        if (manyLettersScale ~= 1) then

            realImage.xScale = manyLettersScale
            realImage.yScale = manyLettersScale
            holder.xScale = manyLettersScale
            holder.yScale = manyLettersScale
        end
        holder.x = holder.x + holder.contentWidth/2
        realImage.x = holder.x
        print(holder.contentWidth, realImage.contentWidth)
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
        splitedLetter[number] =  letter.new(letterX, letterY, holder, rotation, audioFile, audioLetter, number, name , realImage , manyLettersScale)
        formerSplitedLetters [number] = letter.new(letterX, letterY, holder, rotation, audioFile, audioLetter, number, name , realImage , manyLettersScale)
        -- realImage:addEventListener("touch", dragLetters)

        x = x + holder.contentWidth + letterMargin
    end  -- repeat untill the for loop end

    -- formerSplitedLetters = splitedLetter


    animation = display.newSprite( globalSheet, sequenceData )
    animation.x = display.contentWidth/2
    animation.y = display.contentHeight/2
    animation.isVisible = false
    animation.xScale = scalePoint
    animation.yScale = scalePoint
    animation.name = "animation"
    function fadeOut(  )
        -- body
        for  k, v in pairs(splitedLetter) do
            transition.to( v.realImage, {time=300, alpha = 1})
        end
        isPreparing = false
    end


    function preDestinationLetters( ... )
        -- body
        local isUptime = true
        local tempX = 0
        local tempLeftMargin = leftMargin
        local tempLetterMargin = letterMargin
        if (mainWordWidth < (display.contentWidth - 20*2)) then
            tempLeftMargin = (display.contentWidth - mainWordWidth) / 4
            print ("tempLeftMargin", tempLeftMargin )
            tempWidth = getTempWidth(manyLettersScale)
            if (manyLettersScale == 1) then
                tempLetterMargin = (actualWidth  - tempWidth  - tempLeftMargin*2) / wordCount
            end
            print (tempLetterMargin)
        end 
        tempX = tempLeftMargin
        print (mainWordWidth)
        local tempIndexArray = {}
        for i=1,wordCount do
            table.insert(tempIndexArray, i)
        end

        local randomYMin = 10
        local randomYMax = 20
        if (manyLettersScale < 1) then
            tempMarginPercent =  letterHeight * manyLettersScale
            randomYMin = 20
            randomYMax = letterHeight - tempMarginPercent
        end
        print (randomYMax, manyLettersScale)
        for  i = 1, wordCount do
            local randomIndex = math.random (#tempIndexArray)
            -- print ("real randomIndex",randomIndex)   
            -- randomIndex = tempIndexArray[randomIndex]
            print ("randomIndex",tempIndexArray[randomIndex], "x = ", tempX)   
            local v = splitedLetter[ tempIndexArray[randomIndex]]
            v.realImage.x = tempX + v.realImage.contentWidth/2
            local randomY = math.random( randomYMin, randomYMax )

            if (isUptime == true) then
                v.realImage.y =  randomY + v.realImage.contentHeight/2
                isUptime = false
            else
                v.realImage.y =  randomY + v.holder.y  + v.realImage.contentHeight
                isUptime = true
            end
            tempX = tempX  + tempLetterMargin + v.realImage.contentWidth
            table.remove(tempIndexArray, randomIndex)
            print("--------------------------")
        end
        timer.performWithDelay( 1000, fadeOut)
    end

    function randomStructing( )
        -- body
        print ("Please random coordinate me", wordCount)
        local nothingCount = 1
        function preFadeCompleted()
                if (nothingCount == wordCount) then
                    preDestinationLetters()
                end
                nothingCount = nothingCount + 1
        end
        for k, v in pairs(splitedLetter) do
            function preDestinationComplete()
                transition.to( v.realImage, {time=500, xScale = v.scalePoint, yScale = v.scalePoint, alpha = 0, onComplete = preFadeCompleted})
                transition.to( v.holder, {time=500, xScale = v.scalePoint, yScale = v.scalePoint}) 
                v.holder.isVisible = true

            end
            local rotate = math.random( -15, 15 )
            transition.to( v.holder, { time=300, rotation=rotate, xScale = scalePoint, yScale = scalePoint})
            transition.to( v.realImage, { time=300, rotation=rotate, xScale = scalePoint, yScale = scalePoint, onComplete = preDestinationComplete})
            v.rotatePoint = rotate
        end
    end

    function getContainingLetterTable (letterObj)
        local tempContainerTable = {}
        for k, v in pairs(formerSplitedLetters) do
            -- print ("formerSplitedLetters name = ",v.name, "targetLetter =",letterObj, "targetKey", k)
            if (v.name == letterObj) then
                tempContainerTable [k] = v
            end
        end
        return tempContainerTable
    end

    local chosenHolder

    function hitObjects(obj1, sLetter)
            local containerArray =  getContainingLetterTable(sLetter)
            local left, right, up, down
            for k,v in pairs(containerArray) do
                local obj2 = v.holder
                left = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
                right = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
                up = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
                down = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax
                if ((left or right) and (up or down)) then
                    chosenHolder = obj2
                    print("remove", v.number, "------ Letter ---", v.name, "-----k = ", k)
                    table.remove( formerSplitedLetters, k )
                    break
                end
            end
      
            return (left or right) and (up or down)
    end

    function singleHiObject(obj1, obj2)
        local left = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
        local right = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
        local up = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
        local down = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax
        return (left or right) and (up or down)

    end

    local target 
    local targetAnim 
    local targetLetter
    local targetHolder
    local sound
    local soundLetter
    local chosenLetter 
    local b = 0
    local matchedLettersCount = 0
    local isFirstAnimationCompleted = false

    function dragLetters( event )
        if (isPreparing) then
            return
        end
        if (b == 0 and event.target.name ~= "animation") then
            target = event.target
            targetAnim = animation
            targetAnim.x = target.x
            targetAnim.y = target.y
            print ("targetName ",target.name )

            chosenLetter = splitedLetter[target.name]
            targetLetter = chosenLetter.name
            print ("target",targetLetter )

            targetHolder = chosenLetter.holder
            sound = chosenLetter.audioFile
            soundLetter = chosenLetter.audioLetter
            targetAnim:setSequence( chosenLetter.number)
            b = 1
        end

        if (event.phase == "began") then
            display.getCurrentStage():setFocus( target )
            if (target.name ~= "animation") then
                function complete ()
                    print ("prepare animation compeleted")
                    isFirstAnimationCompleted = true
                    targetAnim.x, targetAnim.y = target.x,target.y
                    targetAnim.markX = target.x
                    targetAnim.markY = target.y
                    targetAnim.contentWidth = target.contentWidth
                    targetAnim.contentHeight = target.contentHeight
                    target.isVisible = false
                    targetAnim.isVisible = true
                    -- targetAnim.name = target.name        
                    targetAnim:play()
                    sound = audio.play( sound,{ loops=-1 } )
                end
                targetAnim.markX = target.x
                targetAnim.markY = target.y
                transition.scaleTo( target, {time=1, xScale = scalePoint, yScale = scalePoint, onComplete = complete} )
            end
        elseif event.phase == "moved" then
            if (target.name ~= "animation" and isFirstAnimationCompleted == true) then
                local x = (event.x - event.xStart) +  targetAnim.markX
                local y = (event.y - event.yStart) + targetAnim.markY
                print ("x ",x, " y ",y)

                if (x - targetAnim.contentWidth/2 < 0)then 
                    x = targetAnim.contentWidth / 2
                end
                if (y - targetAnim.contentHeight/2 < 0)then
                    y = targetAnim.contentHeight/2
                end
                if (y + targetAnim.contentHeight/2 > actualHeight)then
                    y = actualHeight - targetAnim.contentHeight/2 
                end
                if (x + targetAnim.contentWidth/2 > actualWidth)then
                    x = actualWidth - targetAnim.contentWidth/2 
                end
                targetAnim.x, targetAnim.y = x,y
                target.x, target.y = x, y
            end
        elseif(event.phase == 'ended'  and hitObjects(targetAnim, targetLetter)) then
            print ("animation ended andd hitObjects")
            isPreparing = true
            isFirstAnimationCompleted = false
            matchedLettersCount = matchedLettersCount+1;
            targetAnim:setFrame(1)  
            targetAnim.isVisible = false    
            target.isVisible = true
            targetAnim:pause()  
            target:toFront( )

            audio.stop(sound)
            display.getCurrentStage():setFocus( nil )

            function transitionComplete()
                b = 0
                endAnimation(target)
                target:removeEventListener("touch", dragLetters)
                chosenHolder  = nil
                audio.play( soundLetter )
                if(wordCount == matchedLettersCount) then    
                    audio.play(chorusAudio)
                    timer.performWithDelay( 1500, allWordsCompleted)
                end
            end
            transition.to( target, {time=500, x=chosenHolder.x , y = chosenHolder.y, rotation = chosenHolder.rotation, onComplete = transitionComplete} )
            -- correct = correct + 1
            -- audio.play(correctSnd)
        elseif event.phase == "ended" or event.phase == "cancelled" then
            print ("animation ended or cancelled")
            isPreparing = true
            targetAnim:pause()  
            targetAnim:setFrame(1)  
            targetAnim.isVisible = false    
            target.isVisible = true
            audio.stop(sound)
            display.getCurrentStage():setFocus( nil )

            function noEqualizerCompleted()
                endAnimation(target)
            end

            local notChanging = false
            for k, v in pairs(splitedLetter) do
                if (v ~= nil) then
                    if (singleHiObject(targetAnim, v.holder)) then

                        local targetMidY = target.y
                        local moveDistance = 0
                        if (displayMidY > targetMidY) then
                            local midDif = displayMidY - targetMidY
                            moveDistance = (target.contentHeight - midDif)* (-1)
                        else
                            local midDif =  targetMidY - displayMidY
                            moveDistance = target.contentHeight - midDif
                        end

                        transition.to( target, {time=500, y = target.y + moveDistance, onComplete = noEqualizerCompleted} )
                        notChanging = true
                        break
                    end
                end
            end
            if (notChanging == false) then
                endAnimation(target)    
            end
            b = 0
        else
            print ("b")
        end
        return true
    end

    function endAnimation( realImage )
        function secondComplete()
            isPreparing = false
            isFirstAnimationCompleted = false
            transition.scaleTo( realImage, {time=100, xScale = chosenLetter.scalePoint, yScale = chosenLetter.scalePoint } )

        end
        function firstComplete()
            transition.scaleTo( realImage, {time=100, xScale = chosenLetter.scalePoint + 0.07, yScale = chosenLetter.scalePoint + 0.07, onComplete = secondComplete} )

        end
        transition.scaleTo( realImage, {time=100, xScale = chosenLetter.scalePoint, yScale = chosenLetter.scalePoint, onComplete = firstComplete} )

    end

    function allWordsCompleted()
        dataword.settings.selectedWord = wordId +1
        print ("All letters matched!")        
        print ("end animation: ",matchedLettersCount)
        print ("All words : ",dataword.allWords)
        print ("SelectedWord : ",dataword.settings.selectedWord)

        if(dataword.allWords>=dataword.settings.selectedWord) then
            print("Go to Next word")        
            composer.removeScene( "game", false )
            composer.gotoScene( "game", { effect="crossFade", time=333 } )
        else
            print("All words completed")        
        end
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
