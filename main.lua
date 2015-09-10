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

local animation = display.newSprite( mySheet, sequenceData )
animation.x = display.contentWidth/2
animation.y = display.contentHeight/2

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
	elseif event.phase == "ended" or event.phase == "cancelled" then
		self:setFrame(0)
		self:pause()	
		audio.stop()
	end
	return true
end

animation:addEventListener( "touch", animation )