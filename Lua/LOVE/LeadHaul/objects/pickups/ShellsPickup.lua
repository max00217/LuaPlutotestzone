local file = { priority = .1 }

local pickup = {
	img = lg.newImage( "assets/pickups/shells.png" ),
}

function pickup.init( self )
	self.sound = sound_ammopickup
end

function pickup.pickup( self )
	local amount = 6
	local index = 2
	
	if Player.ammo[ index ].count < Player.ammo[ index ].maxCount then
		Player.ammo[ index ].count = min( Player.ammo[ index ].maxCount, Player.ammo[ index ].count + amount )
		
		self:destroy()
	end
end


pickup_shells = pickup

return file