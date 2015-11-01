local sceneName = ...

local composer = require( "composer" )

system.activate( "multitouch" )

-- Load scene with same root filename as this file
local scene = composer.newScene( sceneName )
local dataword = require( "dataword" )
local dataletter = require( "dataletter" )
local letter = require ("letter")
local widget = require( "widget" )
local wordId
    -- Background Music
local backgroundMusic = audio.loadStream( "sounds/bg_music2.mp3" )

function scene:create( event )
    local sceneGroup = self.view

    print( 'Chosen word ID: ',dataword.settings.selectedWord )

    wordId = tonumber(dataword.settings.selectedWord)
    local word = dataword.settings.levels[wordId]
    local wordSequences = tostring(word.seq)
    local wordListenAudio =  audio.loadSound(word.wordListen)
    local wordDefAudio =  audio.loadSound(word.wordDef)
    local playWordListen
    local applauseAudio =  audio.loadSound("sounds/piano.mp3")
   --local stampedeAudio = audio.loadSound("sounds/stampede.mp3")
      local stampedeAudio = audio.loadSound("sounds/letters_fadein.mp3")
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

    audio.play( backgroundMusic,{ loops=-1 }  )

    -- Background Image
    local background = display.newImage("images/BG.jpg")
    background.x = displayWidth
    background.y = displayHeight

    local header= display.newImage("images/BG_Header.png", true)
    header.contentWidth = actualWidth
    header.x = displayWidth
    header.y = 80

    local footer= display.newImage("images/BG_Footer.png", true)
    footer.contentWidth = actualWidth
    footer.x = displayWidth
    footer.y = display.contentHeight-53


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
    local maxSizedLetter = 0
    local minSizedLetter = 110
    --Орж ирсэн үгийн үсгүүдийг dataletters.lua-с нэг array-д хийж, мөн үсгүүдийн бодит уртыг олох loop
    function getTempWidth( scaleSize )
        -- body
        local counter = 1
        local tempValue = 0
        for word in string.gmatch(wordSequences, '([^,]+)')  do
            local selectedLetter = dataletter.letters[tonumber(word)]
            letters[counter] = selectedLetter
            print ()
            if (maxSizedLetter < tonumber(selectedLetter.width)) then
                maxSizedLetter = tonumber(selectedLetter.width)
            end
            if (minSizedLetter > tonumber(selectedLetter.width)) then
                minSizedLetter = tonumber(selectedLetter.width)
            end
            tempValue = tempValue + tonumber(selectedLetter.width) * scaleSize
            counter = counter + 1
        end
        tempValue = tempValue + letterMargin *(wordCount - 1)
        return tempValue 
    end

    tempWidth = getTempWidth(1)


    local manyLettersScale  = 1
    local averageLetterSize = (maxSizedLetter + minSizedLetter) /2
    print ("prewidth=", tempWidth, maxSizedLetter, minSizedLetter)
    if (tempWidth  < mainWordWidth) then
        local dif = actualWidth - tempWidth
        leftMargin = dif/2
        mainWordWidth = tempWidth
        x = leftMargin

    else 
        local nonMarginedSize = mainWordWidth - letterMargin*(wordCount - 1)
        local eachResizedLetterWidth = nonMarginedSize / wordCount
     
        print ("eachResizedLetterWidth=", eachResizedLetterWidth)

        percentageDif = eachResizedLetterWidth *100 / averageLetterSize
        manyLettersScale = percentageDif / 100
        print ("manyLettersScale", manyLettersScale)
        tempWidth = getTempWidth (manyLettersScale)

        local dif = actualWidth - tempWidth
        leftMargin = dif/2
        mainWordWidth = tempWidth
        x = leftMargin
    end

    scalePoint = manyLettersScale + 0.2


    local myRectangle = display.newRect(leftMargin + mainWordWidth/2, topMargin + mainWordHeight/2, mainWordWidth, mainWordHeight)
    myRectangle.strokeWidth = 3
    myRectangle.alpha = 0.3
    myRectangle:setFillColor(0.5 )
    myRectangle:setStrokeColor( 1, 0, 0 )

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


        holder = display.newImage(v.imgWhite, letterX, letterY, true)
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
        splitedLetter[number] =  letter.new(letterX, letterY, holder, rotation, audioFile, audioLetter, number, name , realImage , manyLettersScale, v.width)
        formerSplitedLetters [number] = letter.new(letterX, letterY, holder, rotation, audioFile, audioLetter, number, name , realImage , manyLettersScale,  v.width)
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
        audio.play(stampedeAudio)

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
        audio.play(wordListenAudio)
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


    local function spawnRibbonDown()

        local falling 
        local randomColor = math.random(20)
        local function removefalling(target)
            target:removeSelf()
            target = nil
        end
        if randomColor == 1 then
            falling =  display.newImage("images/ribbon1.png")
        elseif(randomColor == 2) then
            falling =  display.newImage("images/ribbon2.png")
        elseif(randomColor == 3) then
            falling =  display.newImage("images/ribbon3.png")
        elseif(randomColor == 4) then
            falling =  display.newImage("images/ribbon4.png")
        elseif(randomColor == 5) then
            falling =  display.newImage("images/ribbon5.png")
        elseif(randomColor == 6) then
            falling =  display.newImage("images/ribbon6.png")
        elseif(randomColor == 7) then
            falling =  display.newImage("images/ribbon7.png")
        elseif(randomColor == 8) then
            falling =  display.newImage("images/ribbon8.png")
        elseif(randomColor == 9) then
            falling =  display.newImage("images/ribbon9.png")
        elseif(randomColor == 10) then
            falling =  display.newImage("images/ribbon10.png")
        elseif(randomColor == 11) then
            falling =  display.newImage("images/ribbon11.png")
        elseif(randomColor == 12) then
            falling =  display.newImage("images/ribbon12.png")
        elseif(randomColor == 13) then
            falling =  display.newImage("images/ribbon13.png")
        elseif(randomColor == 14) then
            falling =  display.newImage("images/ribbon14.png")
        elseif(randomColor == 15) then
            falling =  display.newImage("images/ribbon15.png")
        elseif(randomColor == 16) then
            falling =  display.newImage("images/ribbon16.png")
        elseif(randomColor == 17) then
            falling =  display.newImage("images/ribbon17.png")
        elseif(randomColor == 18) then
            falling =  display.newImage("images/ribbon18.png")
        elseif(randomColor == 19) then
            falling =  display.newImage("images/ribbon19.png")
        else 
            falling =  display.newImage("images/ribbon20.png")
         end

        falling.x = math.random(display.contentWidth)
        falling.y = -2
        local wind = math.random(80) - 40
        transition.to(falling,{time=math.random(500) + 1000, y = display.contentHeight + 2, x = falling.x + wind, onComplete=removefalling})
    end

    local function makeRibbon(event)
   --   if math.random(2) == 1 then
        print("animation enter")
        spawnRibbonDown()
    --  end
        return true
    end

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
    local soundPhonic
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
                    
                    if(soundPhonic~=nil) then
                        audio.stop(soundPhonic)
                     end   
                    soundPhonic = audio.play( sound,{ loops=-1 } )
                    isFirstAnimationCompleted = true
                    targetAnim.x, targetAnim.y = target.x,target.y
                    targetAnim.markX = target.x
                    targetAnim.markY = target.y
                    targetAnim.contentWidth = target.contentWidth
                    targetAnim.contentHeight = target.contentHeight
                    target.isVisible = false
                    targetAnim.isVisible = true
                    -- targetAnim.name = target.name    
                    target:toFront( )  
                    targetAnim:toFront ()  
                    targetAnim:play()
                end
                targetAnim.markX = target.x
                targetAnim.markY = target.y
                transition.scaleTo( target, {time=1, xScale = scalePoint, yScale = scalePoint, onComplete = complete} )
            end
        elseif event.phase == "moved" then
            if (target.name ~= "animation" and isFirstAnimationCompleted == true) then
                local x = (event.x - event.xStart) +  targetAnim.markX
                local y = (event.y - event.yStart) + targetAnim.markY
                -- print ("x ",x, " y ",y)

                local targetWidth = chosenLetter.width * scalePoint 
                local targetHeight = chosenLetter.width * scalePoint

                local dif = targetAnim.contentWidth - targetWidth


                if (x - targetWidth/2  + dif< 0)then 
                    x = targetWidth/ 2 - dif
                end
                if (y - targetHeight/2 < 0)then
                    y = targetHeight/2
                end
                if (y + targetWidth/2 > actualHeight)then
                    y = actualHeight - targetHeight/2 
                end
                if (x + targetWidth/2  - dif > actualWidth)then
                    x = actualWidth - targetWidth/2 + dif
                end
                print (targetWidth, targetAnim.contentWidth, x, dif)

                targetAnim.x, targetAnim.y = x,y
                target.x, target.y = x, y
            end
        elseif(event.phase == 'ended'  and hitObjects(targetAnim, targetLetter)) then
            print ("animation ended and hitObjects")
            isPreparing = true
            isFirstAnimationCompleted = false
            matchedLettersCount = matchedLettersCount+1;
            targetAnim:setFrame(1)  
            targetAnim.isVisible = false    
            target.isVisible = true
            targetAnim:pause()  
            target:toFront( )

            audio.stop(soundPhonic)
            display.getCurrentStage():setFocus( nil )

            function transitionComplete()
                b = 0
                endAnimation(target)
                target:removeEventListener("touch", dragLetters)
                chosenHolder  = nil
                audio.play( soundLetter )
                if(wordCount == matchedLettersCount) then  
                    function  lastAnimation(  )
                        -- body
                        for k, v in pairs(splitedLetter) do
                            function preDestinationComplete()
                                transition.to( v.realImage, {time=500, xScale = v.scalePoint, yScale = v.scalePoint, onComplete = preFadeCompleted})
                                transition.to( v.holder, {time=500, xScale = v.scalePoint, yScale = v.scalePoint}) 
                                if (k == wordCount) then
                                    Runtime:addEventListener("enterFrame",makeRibbon) 
                                    audio.play(applauseAudio)
                                    timer.performWithDelay( 2500, allWordsCompleted)
                                end
                            end
                            transition.to( v.holder, { time=300,  xScale = scalePoint, yScale = scalePoint})
                            transition.to( v.realImage, { time=300,  xScale = scalePoint, yScale = scalePoint, onComplete = preDestinationComplete})
                        end
                    end
                    timer.performWithDelay(300, lastAnimation) 
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

            audio.stop(soundPhonic)
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

    local k = 0

    function allWordsCompleted()
        if (k == 0) then
            Runtime:removeEventListener( "enterFrame", makeRibbon )
            k = 1
            timer.performWithDelay( 1000, allWordsCompleted)
        else
            print("Go to Next word")        
            composer.removeScene( "game", false )
            composer.gotoScene( "defineword", { effect="crossFade", time=333 } )
        end
    end

    function setDefaultImage( targetAnim )
        
    end

    animation:addEventListener( "touch", dragLetters )

    -- Button handler to cancel the level selection and return to the menu
    local function handleBackButtonEvent( event )
        if ( "ended" == event.phase and isPreparing == false) then
            composer.removeScene( "game", false )
            composer.gotoScene( "menu", { effect="crossFade", time=333 } )
        end
    end

    local function handleWordButtonEvent( event )
        if ( "ended" == event.phase and isPreparing == false) then
         audio.stop( playWordListen )
         playWordDef = audio.play( wordListenAudio )

        end
    end


        -- Create a cancel button for return to the menu scene.
    local backButton = widget.newButton({
            id = "button1",
            defaultFile  = "images/btn_home.png",
            overFile = "images/btn_home_focused.png",
            x = 0,
            y = 60,
            width = 80,
            height = 80,
            onEvent = handleBackButtonEvent
    })

        -- Create a cancel button for return to the menu scene.
    local wordButton = widget.newButton({
            id = "buttonWord",
            defaultFile  = "images/btn_music.png",
            overFile = "images/btn_music_focused.png",
            x = actualWidth,
            y = 60,
            width = 80,
            height = 80,
            onEvent = handleWordButtonEvent
    })

    sceneGroup:insert( background )
    sceneGroup:insert( header )
    sceneGroup:insert( footer )    
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

   -- Called when a key event has been received
local function onKeyEvent( event )
    -- Print which key was pressed down/up
    local message = "Key '" .. event.keyName .. "' was pressed " .. event.phase
    print( message )

    -- If the "back" key was pressed on Android or Windows Phone, prevent it from backing out of the app
    if ( event.keyName == "back" ) then
        local platformName = system.getInfo( "platformName" )
        if ( platformName == "Android" ) or ( platformName == "WinPhone" ) then
            return true
        end
    end

    -- IMPORTANT! Return false to indicate that this app is NOT overriding the received key
    -- This lets the operating system execute its default handling of the key
    return false
end

-- Add the key event listener
Runtime:addEventListener( "key", onKeyEvent )

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
