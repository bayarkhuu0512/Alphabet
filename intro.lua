local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )

local displayHeight = display.contentHeight/2
local displayWidth = display.contentWidth/2

--[[
local video = native.newVideo( 0, 0, display.contentWidth, display.contentHeight)
video.x = displayWidth
video.y = displayHeight

local onComplete = function( event )
   print( "video session ended" )
   composer.removeScene( "intro", false )
   composer.gotoScene( "menu" )
end
]]

local function tapListener( event )
    --code executed when the button is tapped
    print( "object tapped = "..tostring(event.target) )  --'event.target' is the tapped object
 --   video:pause()
 --   video:removeSelf()
 --   video = nil
    composer.removeScene( "intro", false )
    composer.gotoScene( "menu", { effect="crossFade", time=333 } )
    return true
end


local function leaveScreen()
    composer.removeScene( "intro", false )
    composer.gotoScene( "menu", { effect="crossFade", time=333 } )
end

function scene:create( event )    
    local sceneGroup = self.view
        local sceneGroup = self.view

    -- Create background
    local background = display.newImage("images/Splashscreen.jpg",true)
    background.x=displayWidth
    background.y=displayHeight
--    local background =  display.newRect( 0, 0, display.pixelWidth, display.pixelHeight )
  --  background:setFillColor( 0.5 )
    background.isHitTestable = true
  --  background.x = display.contentCenterX
 --   background.y = display.contentCenterY-50

   background:addEventListener( "tap", tapListener )        
   sceneGroup:insert( background )
   timer.performWithDelay(1500, leaveScreen)

  --  media.playVideo( "videos/intro.m4v", false, onComplete )
  --  video:load( "videos/intro.m4v", system.DocumentsDirectory )
  --  video:play()
  --  sceneGroup:insert( video )



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