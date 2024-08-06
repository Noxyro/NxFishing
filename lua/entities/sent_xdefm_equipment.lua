local weps = { "inventory", "rod", "trade" }
AddCSLuaFile() ENT.PrintName = "#xdefm.Equipment"  ENT.Category = "#xdefm.Category"  ENT.Author = "LemonCola3424"
ENT.Spawnable = true  ENT.Base = "base_gmodentity"  ENT.xdefm_Cool = 0
function ENT:SetupDataTables() self:NetworkVar( "Entity", 0, "FMod_OW" ) self:NetworkVar( "String", 0, "FMod_OI" ) end
function ENT:SpawnFunction( ply, tr, ClassName ) if !tr.Hit then return end
	local ent = ents.Create( ClassName ) ent:SetPos( tr.HitPos ) ent:SetAngles( Angle( 0, ply:EyeAngles().yaw +90, 0 ) )
	ent:Spawn() ent:Activate() ent:SetFMod_OW( ply ) ent:SetFMod_OI( ply:SteamID() ) return ent end
function ENT:Initialize() if CLIENT then return end self:SetModel( "models/props_c17/BriefCase001a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS ) self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS ) self:SetUseType( SIMPLE_USE ) end
function ENT:OnDuplicated() SafeRemoveEntity( self ) end function ENT:OnRestore() if SERVER then SafeRemoveEntity( self ) end end
function ENT:GetOverlayText() return self.PrintName.."\n"..language.GetPhrase( "xdefm.Equipment2" ) end
function ENT:Use( act ) if !act:IsPlayer() or self.xdefm_Cool > CurTime() or !act:Alive() then return end self.xdefm_Cool = CurTime() +1
	if act:KeyDown( IN_SPEED ) and ( self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() ) then return end
	if act:KeyDown( IN_SPEED ) then act:PickupObject( self ) return end
	self:GetPhysicsObject():AddVelocity( VectorRand():GetNormalized()*20 ) local tak = false
	for k, v in pairs( weps ) do local www = ( "weapon_xdefm_"..v )
		if !act:HasWeapon( www ) then act:Give( www, true ) tak = true end end
	if tak then act:EmitSound( "AmmoCrate.Open" ) return else
	for k, v in pairs( weps ) do local www = ( "weapon_xdefm_"..v )
		if act:HasWeapon( www ) then act:StripWeapon( www ) end end act:EmitSound( "AmmoCrate.Close" ) end end
function ENT:Think() if SERVER then return end local text = self:GetOverlayText() local ply, tag = LocalPlayer(), GetConVar( "xdefmod_tagdist" ):GetInt()
	if !IsValid( ply ) or tag == 0 or ply:GetPos():DistToSqr( self:GetPos() ) > tag^2 then return end local tak = false
	if self:BeingLookedAtByLocalPlayer() then for k, v in pairs( weps ) do local www = ( "weapon_xdefm_"..v ) if !ply:HasWeapon( www ) then tak = true break end end
	halo.Add( { self }, tak and Color( 0, 255, 255 ) or Color( 255, 255, 0 ), 1, 1, 1 )
	if text != "" then AddWorldTip( self:EntIndex(), text, 0.5, self:GetPos(), self ) end end end
function ENT:OnTakeDamage( dmg ) self:TakePhysicsDamage( dmg ) end
function ENT:PhysicsCollide( dat, phy ) if dat.Speed >= 60 and dat.DeltaTime > 0.2 then self:EmitSound( "Default.ImpactSoft" ) end end