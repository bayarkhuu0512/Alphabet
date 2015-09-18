local composer = require( "composer" )
local scene = composer.newScene()


local onComplete = function( event )
   print( "video session ended" )
   composer.removeScene( "intro", false )
   composer.gotoScene( "menu" )
end

local function tapListener( event )
    --code executed when the button is tapped
    print( "object tapped = "..tostring(event.target) )  --'event.target' is the tapped object
    composer.removeScene( "intro", false )
    composer.gotoScene( "menu" )
    return true
end

function scene:create( event )
    local sceneGroup = self.view
        local sceneGroup = self.view
    media.playVideo( "videos/intro.m4v", false, onComplete )

    -- Create background
    local background = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
    background.alpha = 0
    background.isHitTestable = true
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    background:addEventListener( "tap", tapListener )
    sceneGroup:insert( background )
end

-- On scene show...
function scene:show( event )
    local sceneGroup = self.view

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