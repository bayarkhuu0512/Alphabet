local aspectRatio = display.pixelHeight / display.pixelWidth

application = {
	content = {
    	width = aspectRatio > 1.5 and 640 or math.floor( 960 / aspectRatio ),
        height = aspectRatio < 1.5 and 960 or math.floor( 640 * aspectRatio ),
		scale = "letterBox",
		xAlign = "center",
		yAlign = "center"
	}
}