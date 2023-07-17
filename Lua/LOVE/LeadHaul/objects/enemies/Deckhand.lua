local file = { priority = 0 }


local enemy = {
	filePath = "assets/enemies/deckhand/",
	
	w = .55,
	h = .65 * 2,
	
	health = 30,
	speed = .8,
	
	state = "wander",
	timer = 0,
	
	wanderTime = 1.5,
	fireWindup = .3,
	fireTime = .2,
	fireCooldown = .2,
	
	projectileOffset = .15
}

function enemy.update( self )
	self.timer = self.timer + hdt
	
	self.projectileX = self.x + cos( -Sprite.dir + rad(180) ) * self.projectileOffset
	self.projectileZ = self.z + sin( -Sprite.dir + rad(180) ) * self.projectileOffset
	
	if self.state == "idle" then
		self.sprite:applyAnimation( self.idleAnim )
	end
	
	if self.state == "wander" then
		if self.timer < self.wanderTime then
			self.sprite:applyAnimation( self.runAnim )
			self:wander( )
		else
			self.timer = 0
			self.state = "fireAnticipation"
		end
	end
	
	if self.state == "fireAnticipation" then
		if self.timer < self.fireWindup then
			self.sprite:applyAnimation( self.fireAnticipationAnim )
		else
			local ang = math.angle( self.projectileX,self.projectileZ, Player.x,Player.z )
			Projectile:new(
			projectile_deckhand,
			
			self.projectileX,
			-.22,
			self.projectileZ,
			
			cos( ang ),
			0,
			sin( ang )
			)

			self.shotSound:play()
		
			self.timer = 0
			self.state = "fire"
		end
	end
	
	if self.state == "fire" then
		if self.timer < self.fireTime then
			self.sprite:applyAnimation( self.fireAnim )
		else
			self.timer = 0
			self.state = "fireCooldown"
		end
	end
	
	if self.state == "fireCooldown" then
		if self.timer < self.fireCooldown then
			self.sprite:applyAnimation( self.fireAnticipationAnim )
		else
			self.timer = 0
			self.state = "wander"
		end
	end
end

enemy_deckhand = enemy


return file