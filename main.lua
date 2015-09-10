local background = display.newImage("BG.jpg",true)
background.x = display.contentWidth / 2
background.y = display.contentHeight / 2

local physics = require( "physics")
physics.start( )

local soundTable = {
    aShortSound = audio.loadSound( "A-short.mp3" ),
}


local sheetData = {
	width = 191,
	height = 206,
	numFrames = 7,
	sheetContentWidth = 1337,
	sheetContentHeight = 206
}

local mySheet = graphics.newImageSheet( "sprite_sheet.png", sheetData )

local sequenceData ={
	{
		name = "normalRun",
		start = 1,
		count = 7,
		time = 700
	},
	{
		name = "fastRun",
		frames = {1,2,3},
		time = 250,
		loopCount = 0
	}

}

local sHolder = display.newImage('A_grey.png', 60, 130)

local animation = display.newSprite( mySheet, sequenceData )
animation.x = display.contentWidth/2
animation.y = display.contentHeight/2
animation.name = "A_anim"

function hitTestObjects(obj1, obj2)
        local left = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
        local right = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
        local up = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
        local down = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax
        return (left or right) and (up or down)
end

function animation:touch( event )
	if (event.phase == "began") then
		self.markX = self.x
		self.markY = self.y
		self:play()
		audio.play( soundTable["aShortSound"],{ loops=-1 } )
	elseif event.phase == "moved" then
		local x = (event.x - event.xStart) +  self.markX
		local y = (event.y - event.yStart) + self.markY
		self.x, self.y = x,y

	elseif(event.target.name == 'A_anim' and event.phase == 'ended' and hitTestObjects(event.target, sHolder)) then
        print("bla")
        self:setFrame(0)
		self:pause()	
		audio.stop()
		transition.to( event.target, {time=500, x=60, y = 130} )
        -- event.target.x = 60.5
        -- event.target.y = 175
        event.target:removeEventListener('touch', dragShape)
        -- correct = correct + 1
        -- audio.play(correctSnd)
	elseif event.phase == "ended" or event.phase == "cancelled" then
		self:setFrame(0)
		self:pause()	
		audio.stop()
	end
	return true
end

animation:addEventListener( "touch", animation )

