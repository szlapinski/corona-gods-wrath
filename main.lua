-- main app file
local physics = require('physics')

physics.setDrawMode( "hybrid" ) 

local myRectangle = display.newRect( display.contentCenterX, display.contentHeight, display.contentWidth, display.contentHeight/5 )
myRectangle.strokeWidth = 3
myRectangle:setFillColor( 0, 0, 1 )
myRectangle:setStrokeColor( 1, 1, 1 )


local block01 = display.newRect( display.contentCenterX + 50, display.contentHeight - myRectangle.contentHeight + 60, 50, 100 )
local block02 = display.newRect( display.contentCenterX - 50, display.contentHeight - myRectangle.contentHeight + 60, 50, 100 )
local block03 = display.newRect( display.contentCenterX, display.contentHeight - myRectangle.contentHeight - 15, 150, 50 )
physics.start( )
physics.addBody( myRectangle, 'static', { density=1.0, friction=0.3, bounce=0.4})
physics.addBody( block01, 'dynamic', { density=1.0, friction=0.3, bounce=0.2})
physics.addBody( block02, 'dynamic', { density=1.0, friction=0.3, bounce=0.2})
physics.addBody( block03, 'dynamic', { density=1.0, friction=0.3, bounce=0.2})


local function onLocalCollision( self, event )
	print('collision!!')
    if ( event.phase == "began" ) then
	    display.remove( self )
    end
end

local function myTapListener( event )

	local myCircle = display.newCircle( event.x, 0, 30)
	myCircle:setFillColor(1, 0, 0)

	physics.addBody( myCircle, "dynamic", { radius=30, density=1, friction=0.3, bounce=0.6} )
	myCircle:applyLinearImpulse( 0, 80, myCircle.contentCenterX, myCircle.contentCenterY )
	myCircle.collision = onLocalCollision
	myCircle:addEventListener( "collision", myCircle )
    return true
end




Runtime:addEventListener( "tap", myTapListener )

print('done')