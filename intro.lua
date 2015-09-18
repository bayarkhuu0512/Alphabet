local composer = require( "composer" )
local scene = composer.newScene()

local onComplete = function( event )
   print( "video session ended" )
   composer.gotoScene( "menu" )
end

local function tapListener( event )
    --code executed when the button is tapped
    print( "object tapped = "..tostring(event.target) )  --'event.target' is the tapped object
    composer.gotoScene( "menu" )
    return true
end

function scene:create( event )
    local sceneGroup = self.view
    media.playVideo( "videos/intro.m4v", false, onComplete )
    media:addEventListener( "tap", tapListener )
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

return scene