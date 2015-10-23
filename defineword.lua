local composer = require( "composer" )
local dataword = require( "dataword" )
local dataletter = require( "dataletter" )
local widget = require( "widget" )

local scene = composer.newScene( )

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
    local wordImage = word.thumb

	print( 'Chosen word ID: ',dataword.settings.selectedWord )
    local actualHeight =  display.contentHeight
    local actualWidth =  display.contentWidth
    local displayMidY = display.contentHeight/2
	local displayMidX = display.contentWidth/2
	local background = display.newImage("images/BG.jpg",true)
    background.x = displayMidX
    background.y = displayMidY


    local selectedWordImage =  display.newImage(wordImage)
    selectedWordImage.x = displayMidX
    selectedWordImage.y = displayMidY
    fitImage(selectedWordImage, actualWidth, 400, false)


    local function handleBackButtonEvent( event )
		if ( "ended" == event.phase ) then
		    composer.removeScene( "defineword", false )
		    composer.gotoScene( "game", { effect="slideRight", time=333 } )
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
	            composer.removeScene( "defineword", false )
	            composer.gotoScene( "game", { effect="slideLeft", time=600 } )
	        else
	            print("All words completed")        
	        end
	    end
    end


    local backButton = widget.newButton({
        id = "button1",
        label = "Буцах",
        x = 0,
        y = 45,
        width = 100,
        height = 50,
        onEvent = handleBackButtonEvent
    })

    local wordDefListenButton = widget.newButton({
        id = "button3",
        label = "Тайлбар",
        x = 0,
        y = 45,
        width = 100,
        height = 50,
        onEvent = handleBackButtonEvent
    })




    sceneGroup:insert( background )
    sceneGroup:insert (selectedWordImage)
    sceneGroup:insert( backButton )
    if(dataword.allWords > wordId) then
        local nextButton = widget.newButton({
            id = "button2",
            label = "Дараагийн үг",
            x = actualWidth ,
            y = 45,
            width = 150,
            height = 50,
            onEvent = handleNextButtonEvent
        })
        sceneGroup:insert( nextButton )
    end

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
    elseif phase == "did" then
        -- Called when the scene is now off screen
    end 
end


function scene:destroy( event )
    local sceneGroup = self.view

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