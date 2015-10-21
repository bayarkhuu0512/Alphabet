composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )

local dataword = require( "dataword" )

local displayHeight = display.contentHeight/2
local displayWidth = display.contentWidth/2

local menuSound = audio.loadSound( "sounds/menu_touch.mp3" )
local backgroundMusic = audio.loadStream( "sounds/nav_music.mp3" )

local dialog
local smsoptions = {to = { "1234567890"},body = "asdabfa3e23asdas#23312ds"}

local defaultField 
local levelSelectGroup

local function textListener( event )

    if ( event.phase == "began" ) then
        -- user begins editing defaultField
        print( event.text )

    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- do something with defaultField text
        print( event.target.text )

    elseif ( event.phase == "editing" ) then
        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )
    end
end

-- Button handler to go to the selected level
local function handleLevelSelect( event )
    if ( "ended" == event.phase ) then
        -- 'event.target' is the button and '.id' is a number indicating which level to go to.  
        -- The 'game' scene will use this setting to determine which level to load.
        -- This could be done via passed parameters as well.
        if(tonumber(event.target.id) <= dataword.settings.unlockedLevels) then
        audio.stop()
        audio.play( menuSound)
        dataword.settings.selectedWord = event.target.id

        -- Purge the game scene so we have a fresh start
        composer.removeScene( "game", false )

        -- Go to the game scene
        composer.gotoScene( "game", { effect="crossFade", time=333 } )
    else
        native.showPopup( "sms", smsoptions )
        print("Buy new word")

    end
    end
    if ( "moved" == event.phase ) then
        local dy = math.abs( ( event.y - event.yStart ) )
        -- If the touch on the button has moved more than 10 pixels,
        -- pass focus back to the scroll view so it can continue scrolling
        if ( dy > 10 ) then
            levelSelectGroup:takeFocus( event )
        end
    end 
end

-- Declare the Composer event handlers
-- On scene create...
function scene:create( event )
    local sceneGroup = self.view

    -- Create background
    local background = display.newImage("images/BG.jpg",true)
    background.x = displayWidth
    background.y = displayHeight
    sceneGroup:insert( background )

    -- Use a scrollView to contain the level buttons (for support of more than one full screen).
    -- Since this will only scroll vertically, lock horizontal scrolling.
    levelSelectGroup = widget.newScrollView({     
        left = 0,   
        width = display.contentWidth,
        height = display.contentHeight,
        scrollWidth = display.contentWidth,
        scrollHeight = display.contentHeight,
        verticalScrollDisabled = true,
        hideBackground = true,
        isHitTestable = true
    })

    -- 'xOffset', 'yOffset' and 'cellCount' are used to position the buttons in the grid.
    local xOffset = 100
    local yOffset = display.contentCenterY

    -- Define the array to hold the buttons
    local buttons = {}

    -- Read 'maxLevels' from the 'data' table. Loop over them and generating one button for each.
    for i = 1, dataword.allWords do
        -- Create a button
        buttons[i] = widget.newButton({
            id = tostring( i ),
            onEvent = handleLevelSelect,
            defaultFile = dataword.settings.levels[i].thumb,
            overFile =  dataword.settings.levels[i].thumb,
            width = 230,
            height = 230,
            emboss = true,
--[[            

font = native.systemFontBold,
            cornerRadius = 8,
            labelYOffset = -6, 
            fillColor = { default={ 0, 0.5, 1, 1 }, over={ 0.5, 0.75, 1, 1 } },
            strokeColor = { default={ 0, 0, 1, 1 }, over={ 0.333, 0.667, 1, 1 } },
            strokeWidth = 5]]
        })
        -- Position the button in the grid and add it to the scrollView
        buttons[i].x = xOffset
        buttons[i].y = yOffset
        levelSelectGroup:insert( buttons[i] )

        -- Check to see if the player has achieved (completed) this level.
        -- The '.unlockedLevels' value tracks the maximum unlocked level.
        -- First, however, check to make sure that this value has been set.
        -- If not set (new user), this value should be 1.

        -- If the level is locked, disable the button and fade it out.
        if ( dataword.settings.unlockedLevels == nil ) then
            dataword.settings.unlockedLevels = 1
        end
        if ( i <= dataword.settings.unlockedLevels ) then
         --   buttons[i]:setEnabled( true )
            buttons[i].alpha = 1.0
        else 
          --  buttons[i]:setEnabled( false ) 
            buttons[i].alpha = 0.5 
        end 


        xOffset = xOffset + 230
--[[        if ( cellCount > 5 ) then
            cellCount = 1
            xOffset = xOffset
            yOffset = yOffset + 100
        end ]]
    end

    -- Place the scrollView into the scene and center it.
    sceneGroup:insert( levelSelectGroup )
    levelSelectGroup.x = display.contentCenterX
    levelSelectGroup.y = display.contentCenterY

local function handleInfoButtonEvent( event )
    if ( "ended" == event.phase ) then
    print("Info window is here")
--    dialog = display.newRoundedRect(display.contentCenterX, display.contentCenterY, 380, 220, 12)
 --   dialog:setFillColor( 96 )
  --  -- dialog.strokeWidth = 3
    -- dialog:setStrokeColor(180, 180, 180)
   -- dialog.alpha = 0.9
    end
end
    local infoButton = widget.newButton({
        id = "buttonInfo",
        label = "Info",
        left = 0,
        top = 0,
        width = 100,
        height = 50,
        onEvent = handleInfoButtonEvent
})
    sceneGroup:insert( infoButton )

end

-- On scene show...
function scene:show( event )
    local sceneGroup = self.view
     audio.play( backgroundMusic,{ loops=-1 }  )
    if ( event.phase == "did" ) then
    end
end

-- On scene hide...
function scene:hide( event )
    local sceneGroup = self.view
    if ( event.phase == "will" ) then
    end
end

-- On scene destroy...
function scene:destroy( event )
    local sceneGroup = self.view   
end

-- Composer scene listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene