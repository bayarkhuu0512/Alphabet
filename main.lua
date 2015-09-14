--[[
Play intro video.. it'll be moved
local onComplete = function( event )
   print( "video session ended" )
end
media.playVideo( "intro.m4v", true, onComplete )
--]]

local background = display.newImage("BG.jpg",true)
background.x = display.contentWidth / 2
background.y = display.contentHeight / 2

local scalePoint = 1.3

local soundTable = {
    aShortSound = audio.loadSound( "A-short.mp3" ), 
    bShortSound = audio.loadSound( "B-long.mp3"),
}


local sheetData = {
	width = 191,
	height = 206,
	numFrames = 7,
	sheetContentWidth = 1337,
	sheetContentHeight = 206
}

local aSheet = graphics.newImageSheet( "sprite_sheet.png", sheetData )
local bSheet = graphics.newImageSheet( "b_sprite_sheet.png", sheetData )

local sequenceData ={
	{
		name = "seq1",
		sheet = aSheet,
		start = 1,
		count = 7,
		time = 700
	},
	{
		name = "seq2",
		sheet = bSheet,
		start = 1,
		count = 7,
		time = 700
	}

}

local holdersTable = {}

local sHolder = display.newImage('A_grey.png', 60, 130)
holdersTable[0]  = sHolder
local bHolder = display.newImage('B_grey.png', 250, 130)
holdersTable[1] = bHolder



local animation = display.newSprite( aSheet, sequenceData )
animation.x = display.contentWidth/2
animation.y = display.contentHeight/2
animation.isVisible = false
animation.xScale = scalePoint
animation.yScale = scalePoint
animation.name = "animation"

local aRealImage = display.newImage('A.png')
aRealImage.x = display.contentWidth/2
aRealImage.y = display.contentHeight/2
aRealImage.name = "A_anim"

local bRealImage = display.newImage('B.png')
bRealImage.x = display.contentWidth/2 + 200
bRealImage.y = display.contentHeight/2
bRealImage.name = "B_anim"


function hitTestObjects(obj1, obj2)
        local left = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
        local right = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
        local up = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
        local down = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax
        return (left or right) and (up or down)
end

local target 
local targetAnim 
local targetHolder
local sound
local b = 0


function dragLetters( event )
	if (b == 0) then
		target = event.target
		targetAnim = animation
		if (target.name == "A_anim") then
			targetHolder = sHolder
			sound  = soundTable["aShortSound"]
			targetAnim:setSequence( "seq1" )
		elseif (target.name == "B_anim") then
			targetHolder = holdersTable[1]
			sound  = soundTable["bShortSound"]
			targetAnim:setSequence( "seq2" )			
		end	
		b = 1
	end

	if (event.phase == "began") then
		if (target.name ~= "animation") then
			function complete ()
				targetAnim.x, targetAnim.y = target.x,target.y
				targetAnim.markX = target.x
				targetAnim.markY = target.y
				target.isVisible = false
				targetAnim.isVisible = true
				-- targetAnim.name = target.name		
				targetAnim:play()
				audio.play( sound,{ loops=-1 } )
			end
			targetAnim.markX = target.x
			targetAnim.markY = target.y
			transition.scaleTo( target, {time=100, xScale = scalePoint, yScale = scalePoint, onComplete = complete} )
		end
	elseif event.phase == "moved" then
		local x = (event.x - event.xStart) +  targetAnim.markX
		local y = (event.y - event.yStart) + targetAnim.markY
		targetAnim.x, targetAnim.y = x,y
		target.x, target.y = x, y

	elseif(event.phase == 'ended' and hitTestObjects(targetAnim, targetHolder)) then
		targetAnim:setFrame(1)	
		targetAnim.isVisible = false	
		target.isVisible = true
     	targetAnim:pause()	

		audio.stop()
        -- event.target.x = 60.5
        -- event.target.y = 175
        -- target:removeEventListener('touch', dragShape)
        function transitionComplete()
			endAnimation(target)
			target:removeEventListener("touch", dragLetters)
	        b = 0
        end
		transition.to( target, {time=500, x=targetHolder.x , y = targetHolder.y, onComplete = transitionComplete} )

        -- correct = correct + 1
        -- audio.play(correctSnd)
	elseif event.phase == "ended" or event.phase == "cancelled" then


		targetAnim:pause()	
		targetAnim:setFrame(1)	
		targetAnim.isVisible = false	
		target.isVisible = true
		audio.stop()
		function noEqualizerCompleted()
			endAnimation(target)
		end

		local notChanging = false
		for k, v in pairs(holdersTable) do
			if (targetHolder ~= v) then
				if (hitTestObjects(targetAnim, v)) then
					transition.to( target, {time=500, x=target.x  + 30, y = targetHolder.y + 150, onComplete = noEqualizerCompleted} )
					notChanging = true
				end
			end
		end
		if (notChanging == false) then
			endAnimation(target)	
		end
		b = 0
	end
	return true
end


function endAnimation( realImage )
	function secondComplete()
		transition.scaleTo( realImage, {time=100, xScale = 1.0, yScale = 1.0 } )

	end
	function firstComplete()
		transition.scaleTo( realImage, {time=100, xScale = 1.07, yScale = 1.07, onComplete = secondComplete} )

	end
	transition.scaleTo( realImage, {time=100, xScale = 1.0, yScale = 1.0, onComplete = firstComplete} )

end

function setDefaultImage( targetAnim )
	
end

aRealImage:addEventListener("touch", dragLetters)
bRealImage:addEventListener("touch", dragLetters)
animation:addEventListener( "touch", dragLetters )
-- bAnimation:addEventListener( "touch", dragLetters )


