local composer = require( "composer" )
local dataword = require( "dataword" )
local dataletter = require( "dataletter" )
local widget = require( "widget" )

local scene = composer.newScene( )

function scene:create( event )
    local sceneGroup = self.view
    local wordId = tonumber(dataword.settings.selectedWord)
    local word = dataword.settings.levels[wordId]

	print( 'Chosen word ID: ',dataword.settings.selectedWord )
    local actualHeight =  display.contentHeight
    local actualWidth =  display.contentWidth
    local displayHeight = display.contentHeight/2
	local displayWidth = display.contentWidth/2
	local background = display.newImage("images/BG.jpg",true)
    background.x = displayWidth
    background.y = displayHeight

    local function handleBackButtonEvent( event )
		if ( "ended" == event.phase ) then
		    composer.removeScene( "defineword", false )
		    composer.gotoScene( "game", { effect="slideRight", time=333 } )
		end
    end
    local function handleNextButtonEvent( event )
		if ( "ended" == event.phase ) then
            dataword.settings.selectedWord = wordId +1

            print ("All letters matched!")        
        	print ("end animation: ",matchedLettersCount)
        	print ("All words : ",dataword.allWords)
        	print ("SelectedWord : ",dataword.settings.selectedWord)

           if(dataword.allWords>=dataword.settings.selectedWord) then
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
        left = 0,
        top = 0,
        width = 100,
        height = 50,
        onEvent = handleBackButtonEvent
    })
    local nextButton = widget.newButton({
        id = "button1",
        label = "Дараагийн үг",
        left = actualWidth - 180,
        top = 0,
        width = 150,
        height = 50,
        onEvent = handleNextButtonEvent
    })


    sceneGroup:insert( background )
    sceneGroup:insert( backButton )
    sceneGroup:insert( nextButton )

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