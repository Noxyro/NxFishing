AddCSLuaFile() ENT.PrintName = "#xdefm.Radar"  ENT.Category = "#xdefm.Category"  ENT.Author = "LemonCola3424"
ENT.Spawnable = true  ENT.Base = "base_gmodentity"  ENT.xdefm_Cool = 0  ENT.xdefm_Snd = nil
function ENT:SetupDataTables() self:NetworkVar( "Entity", 0, "FMod_OW" ) self:NetworkVar( "String", 0, "FMod_OI" ) self:NetworkVar( "Float", 0, "FMod_RA" ) end
function ENT:SpawnFunction( ply, tr, ClassName ) if !tr.Hit then return end
	local ent = ents.Create( ClassName ) ent:SetPos( tr.HitPos ) ent:SetAngles( Angle( 0, ply:EyeAngles().yaw +180, 0 ) )
	ent:Spawn() ent:Activate() ent:SetFMod_OW( ply ) ent:SetFMod_OI( ply:SteamID() ) return ent end
function ENT:Initialize() if CLIENT then return end self:SetModel( "models/props_lab/reciever01b.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS ) self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS ) self:SetUseType( SIMPLE_USE ) self:SetTrigger( true ) end
function ENT:OnDuplicated() SafeRemoveEntity( self ) end function ENT:OnRestore() if SERVER then SafeRemoveEntity( self ) end end
function ENT:GetOverlayText() local ni = ( self:GetFMod_OW():IsPlayer() and self:GetFMod_OW():Nick() or self:GetFMod_OI() )
return self.PrintName.."\n"..language.GetPhrase( "xdefm.Radar2" ).."\n"..language.GetPhrase( "xdefm.Owner" )..": "..ni end
function ENT:Use( act ) if !act:IsPlayer() or !act:Alive() then return end if act:KeyDown( IN_SPEED ) then
		if self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() then return end
	act:PickupObject( self ) return end
	if ( self:GetFMod_OW() != act and self:GetFMod_OI() != act:SteamID() ) or self:GetFMod_RA() > 0
	or ( IsValid( act:GetNWEntity( "XDEFM_IR" ) ) and act:GetNWEntity( "XDEFM_IR" ):GetClass() == self:GetClass() ) then return end
	self:SetFMod_RA( CurTime() +5 ) act:SetNWEntity( "XDEFM_IR", self ) self:EmitSound( "Trainyard.sodamachine_dispense" )
	if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end
	if !self.xdefm_Snd then self.xdefm_Snd = CreateSound( self, Sound( "ambient/machines/combine_shield_loop3.wav" ) ) self.xdefm_Snd:Play()
		self.xdefm_Snd:ChangeVolume( 1, 0 ) self.xdefm_Snd:ChangePitch( 100, 0 ) self.xdefm_Snd:ChangeVolume( 0, 2 ) self.xdefm_Snd:ChangePitch( 150, 2 ) end end
function ENT:Think() if SERVER then if self:GetFMod_RA() > 0 and self:GetFMod_RA() <= CurTime() then
	self:SetFMod_RA( 0 ) if self:GetFMod_OW():IsPlayer() then self:GetFMod_OW():SetNWEntity( "XDEFM_IR", Entity( 0 ) ) end end
	return end local text = self:GetOverlayText() local ply, tag = LocalPlayer(), GetConVar( "xdefmod_tagdist" ):GetInt()
	if !IsValid( ply ) or tag == 0 or ply:GetPos():DistToSqr( self:GetPos() ) > tag^2 then return end local tak = false
	if self:BeingLookedAtByLocalPlayer() then local col = Color( 0, 255, 255 )
		if ply != self:GetFMod_OW() and ply:SteamID() != self:GetFMod_OI() then col = Color( 255, 0, 0 )
		elseif self:GetFMod_RA() > 0 or IsValid( ply:GetNWEntity( "XDEFM_IR" ) ) and ply:GetNWEntity( "XDEFM_IR" ):GetClass() == "sent_xdefm_radar" then
		col = Color( 255, 0, 0 ) end halo.Add( { self }, col, 1, 1, 1 )
	if text != "" then AddWorldTip( self:EntIndex(), text, 0.5, self:GetPos(), self ) end end end
function ENT:OnTakeDamage( dmg ) self:TakePhysicsDamage( dmg ) end
function ENT:PhysicsCollide( dat, phy ) if dat.Speed >= 60 and dat.DeltaTime > 0.2 then self:EmitSound( "SolidMetal.ImpactSoft" ) end end
function ENT:OnRemove() if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end end if SERVER then return end
hook.Add( "PostDrawEffects", "xdefm_Radar", function() local ply = LocalPlayer()
	local ent = ply:GetNWEntity( "XDEFM_IR" )
	if IsValid( ent ) and ent:GetClass() == "sent_xdefm_radar" then
		local per = math.Clamp( 1 -( ent:GetFMod_RA() -CurTime() )/5, 0, 1 )
		cam.Start3D()
		render.SetColorMaterial()
		render.DrawSphere( ent:GetPos(), per*8192, 24, 24, Color( 0, 255, 255*per, 128*( 1-per ) ), true )
		render.DrawSphere( ent:GetPos(), -per*8192, 24, 24, Color( 0, 255, 255*per, 128*( 1-per ) ), true )
		cam.End3D()
	end
end )
XDEFM_RADARENTS = {}
XDEFM_RADARCOUNT = 0
XDEFM_RADAREND = 0
hook.Add( "HUDPaint", "xdefm_Radar", function() local ply = LocalPlayer()
	local ent = ply:GetNWEntity( "XDEFM_IR" )
	if IsValid( ent ) and ent:GetClass() == "sent_xdefm_radar" then
		local per = math.Clamp( 1 -( ent:GetFMod_RA() -CurTime() )/5, 0, 1 )
		for k, v in pairs( ents.FindInSphere( ent:GetPos(), per*8192 ) ) do
			if !IsValid( v ) or v:GetClass() != "xdefm_base" then continue end
			if v:GetFMod_OW() != ply and v:GetFMod_OI() != ply:SteamID() then continue end
			local aa, bb = xdefm_ItemGet( v ) if !istable( bb ) then continue end
			if !IsEntity( XDEFM_RADARENTS[ v:EntIndex() ] ) then
				XDEFM_RADARENTS[ v:EntIndex() ] = v
				XDEFM_RADAREND = CurTime() +30
				XDEFM_RADARCOUNT = XDEFM_RADARCOUNT+1
			else XDEFM_RADAREND = CurTime() +30 end
		end
	end
	if XDEFM_RADARCOUNT > 0 and XDEFM_RADAREND > CurTime() then
		for k, v in pairs( XDEFM_RADARENTS ) do local ent = Entity( k )
			if !IsValid( ent ) or !IsValid( v ) or v != ent or v:GetClass() != "xdefm_base" then
				continue
			end
			local aa, bb = xdefm_ItemGet( v ) if !istable( bb ) then continue end
			local ico = xdefm.miscs.Icons[ bb.Type ]  if !ico then continue end
			local scr = v:GetPos():ToScreen()  local xx, yy = math.Round( scr.x ), math.Round( scr.y )
			local col = xdefm.miscs.Rarity[ bb.Rarity +1 ]
			surface.SetDrawColor( col )
			surface.SetMaterial( ico )
			surface.DrawTexturedRectRotated( xx, yy, 16, 16, 0 )
			draw.Text( {
				text = xdefm_ItemMark( v:GetFMod_DT(), true ),
				pos = { xx, yy+16 },
				font = "TargetIDSmall",
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER,
				color = col
			} )
		end
	elseif XDEFM_RADAREND > 0 then
		XDEFM_RADAREND = 0
		XDEFM_RADARCOUNT = 0
		XDEFM_RADARENTS = {}
	end
end )