-- Meta class
local Letter = {x = 0, y=0, holder=nil, rotatePoint=0, audio=nil, number=0, name = ""}
local Letter_mt = { __index = Letter }  

-- Base class method new
function Letter.new (xz,yz,holderz, rotationz, audioFilez, audioLetters, numberz, namezz, realImagez)

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
  }
  

  return setmetatable( newLetter, Letter_mt )
end

-- Base class method printArea
function Letter:printArea ()
  print("The area is ",x, y, holder, rotatePoint, audioFile, number, name)
end

return Letter
