-- Meta class
local letter = {x = 0, y=0, holder=nil, rotatePoint=0, audio=nil, number=0, name = "", scalePoint = 1, widht = 0}
local letter_mt = { __index = letter }  

-- Base class method new
function letter.new (xz,yz,holderz, rotationz, audioFilez, audioLetters, numberz, namezz, realImagez, scalez, widthz)

  local newLetter  = {
    x  = xz,
    y = yz,
    holder = holderz,
    rotatePoint = rotationz,
    audioFile = audioFilez, 
    audioLetter = audioLetters,
    number = numberz,
    name = namezz,
    realImage = realImagez,
    scalePoint =  scalez,
    width = widthz
  }
  

  return setmetatable( newLetter, letter_mt )
end

-- Base class method printArea
function letter:printArea ()
  print("The area is ",x, y, holder, rotatePoint, audioFile, number, name)
end

return letter
