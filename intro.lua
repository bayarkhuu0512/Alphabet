--[[
Play intro video.. it'll be moved
local onComplete = function( event )
   print( "video session ended" )
end
media.playVideo( "intro.m4v", true, onComplete )
--]]