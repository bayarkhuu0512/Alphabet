local composer = require( "composer" )
local dataword = require( "scripts.dataword" )
local dataletter = require( "scripts.dataletter" )
local widget = require( "widget" )

local scene = composer.newScene( )
local backgroundMusic = audio.loadStream( "sounds/bg_music2.mp3" )
system.activate( "multitouch" )


local function fitImage( displayObject, fitWidth, fitHeight, enlarge )
    --
    -- first determine which edge is out of bounds
    --
    local scaleFactor = fitHeight / displayObject.height 
    local newWidth = displayObject.width * scaleFactor
    if newWidth > fitWidth then
        scaleFactor = fitWidth / displayObject.width 
    end
    if not enlarge and scaleFactor > 1 then
        return
    end
    displayObject:scale( scaleFactor, scaleFactor )
end

function scene:create( event )
    local sceneGroup = self.view
    local wordId = tonumber(dataword.settings.selectedWord)
    local word = dataword.settings.levels[wordId]
    local wordImage = word.image
    local wordDefSound = audio.loadSound( word.wordDef )

	print( 'Chosen word ID: ',dataword.settings.selectedWord )
    local actualHeight =  display.contentHeight
    local actualWidth =  display.contentWidth
    local displayMidY = display.contentHeight/2
	local displayMidX = display.contentWidth/2
	local background = display.newImage("images/BG.jpg",true)
    local replayButton 
    background.x = displayMidX
    background.y = displayMidY

    local header= display.newImage("images/BG_Header.png", true)
    header.contentWidth = actualWidth
    header.x = display.contentWidth/2
    header.y = 80

    local footer= display.newImage("images/BG_Footer.png", true)
    footer.contentWidth = actualWidth
    footer.x = display.contentWidth/2
    footer.y = display.contentHeight-53

    local selectedWordImage =  display.newImage(wordImage)
    selectedWordImage.x = displayMidX
    selectedWordImage.y = displayMidY
    fitImage(selectedWordImage, actualWidth, 400, false)


-- Completion listener function
    local function defFinished( event )
        print( "Narration Finished on channel", event.channel )
        if ( event.completed ) then
            print( "Narration completed playback naturally" )
            replayButton.isVisible = true
        else
            print( "Narration was stopped before completion" )
        end
    end

    local function handleBackButtonEvent( event )
		if ( "ended" == event.phase ) then
		    composer.removeScene( "scripts.defineword", false )
            composer.gotoScene( "scripts.menu", { effect="crossFade", time=333 } )
		end
    end
    local function handleWordDefButtonEvent( event )
        if ( "ended" == event.phase ) then
          audio.stop()
          audio.play( wordDefSound)
        end
    end

    local function handleReplayButtonEvent( event )
        if ( "ended" == event.phase ) then
            print("Go to this word")        
            dataword.settings.selectedWord = wordId
            composer.removeScene( "scripts.defineword", false )
            composer.gotoScene( "scripts.game", { effect="slideRight", time=600 } )
        end
    end


    local function handleNextButtonEvent( event )
		if ( "ended" == event.phase ) then
           if(dataword.allWords > wordId) then

                dataword.settings.selectedWord = wordId +1

                print ("All letters matched!")        
            	print ("end animation: ",matchedLettersCount)
            	print ("All words : ",dataword.allWords)
            	print ("SelectedWord : ",dataword.settings.selectedWord)

	            print("Go to Next word")        
	            composer.removeScene( "scripts.defineword", false )
	            composer.gotoScene( "scripts.game", { effect="slideLeft", time=600 } )
	        else
	            print("All words completed")        
	        end
	    end
    end


    replayButton = widget.newButton({
        id = "button4",
        defaultFile  = "images/btn_refresh.png",
        overFile = "images/btn_refresh_focused.png",
        x = display.contentCenterX,
        y = display.contentHeight - 70,
        width = 100,
        height = 100,
        onEvent = handleReplayButtonEvent
    })
    replayButton.isVisible = false


    local backButton = widget.newButton({
        id = "button1",
        defaultFile  = "images/btn_home.png",
        overFile = "images/btn_home_focused.png",
        x = 60,
        y = 60,
        width = 80,
        height = 80,
        onEvent = handleBackButtonEvent
    })

    local wordDefListenButton = widget.newButton({
        id = "button3",
        defaultFile  = "images/btn_music.png",
        overFile = "images/btn_music_focused.png",
        x = display.contentCenterX,
        y = 60,
        width = 80,
       height = 80,
        onEvent = handleWordDefButtonEvent
    })

    audio.stop()
    audio.play( wordDefSound, { onComplete=defFinished})

    sceneGroup:insert( background )
    sceneGroup:insert( header )
    sceneGroup:insert( footer )
    sceneGroup:insert (selectedWordImage)
    sceneGroup:insert( backButton )
    sceneGroup:insert( wordDefListenButton )
    sceneGroup:insert( replayButton )

    
    if(dataword.allWords > wordId) then
        local nextButton = widget.newButton({
            id = "button2",
            defaultFile  = "images/btn_next.png",
            overFile = "images/btn_next_focused.png",
            x = actualWidth  - 60,
            y = 60,
            width = 90,
            height = 80,
            onEvent = handleNextButtonEvent
        })
        sceneGroup:insert( nextButton )
    end

end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase
     audio.play( backgroundMusic,{ loops=-1 }  )
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