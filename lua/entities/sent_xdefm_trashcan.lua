AddCSLuaFile() ENT.PrintName = "#xdefm.TrashCan"  ENT.Category = "#xdefm.Category"  ENT.Author = "LemonCola3424"
ENT.Spawnable = true  ENT.Base = "base_gmodentity"  ENT.xdefm_Cool = 0
function ENT:SetupDataTables() self:NetworkVar( "Entity", 0, "FMod_OW" ) self:NetworkVar( "String", 0, "FMod_OI" ) end
function ENT:SpawnFunction( ply, tr, ClassName ) if !tr.Hit then return end
	local ent = ents.Create( ClassName ) ent:SetPos( tr.HitPos ) ent:SetAngles( Angle( 0, ply:EyeAngles().yaw +180, 0 ) )
	ent:Spawn() ent:Activate() ent:SetFMod_OW( ply ) ent:SetFMod_OI( ply:SteamID() ) return ent end
function ENT:Initialize() if CLIENT then return end self:SetModel( "models/props_trainstation/trashcan_indoor001a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS ) self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS ) self:SetUseType( SIMPLE_USE ) self:UseTriggerBounds( true, 4 ) end
function ENT:OnDuplicated() SafeRemoveEntity( self ) end function ENT:OnRestore() if SERVER then SafeRemoveEntity( self ) end end
function ENT:GetOverlayText() local ni = ( self:GetFMod_OW():IsPlayer() and self:GetFMod_OW():Nick() or self:GetFMod_OI() )
return self.PrintName.."\n"..language.GetPhrase( "xdefm.TrashCan2" ).."\n"..language.GetPhrase( "xdefm.Owner" )..": "..ni end
function ENT:Use( act ) if !act:IsPlayer() or !act:Alive() then return end if act:KeyDown( IN_SPEED ) then
		if self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() then return end
	act:PickupObject( self ) return end end
function ENT:Touch( ent ) if ent:GetClass() != "xdefm_base" or self.xdefm_Cool > CurTime() or ent.xdefm_Trashed then return end
	if ent:WaterLevel() > 0 and constraint.FindConstraint( ent, "Weld" ) then return end self.xdefm_Cool = CurTime() +0.1
	local aa, bb = xdefm_ItemGet( ent:GetFMod_DT() ) if !istable( bb ) or !isnumber( bb.Price ) then return end local ow = ent:GetFMod_OW()
	if !ow:IsPlayer() or ( !xdefm_FriendAllow( ow, self:GetFMod_OI() ) and !xdefm_NadAllow( ow, ent ) ) then return end self:EmitSound( "Doors.FullClose1" ) local prc = xdefm_GetPrice( ent )
	net.Start( "NET_xdefm_BestiaryRecord" ) net.WriteString( xdefm_GetClass( ent ) ) net.Send( ow )
	ent.xdefm_Trashed = true  xdefm_AddNote( ow, "xdefm.GetMoney&: "..prc, "!V", "coins", 5 ) xdefm_GiveMoney( ow, prc ) ent:Remove() end
function ENT:Think() if SERVER then return end local text = self:GetOverlayText() local ply, tag = LocalPlayer(), GetConVar( "xdefmod_tagdist" ):GetInt()
	if !IsValid( ply ) or tag == 0 or ply:GetPos():DistToSqr( self:GetPos() ) > tag^2 then return end local tak = false
	if self:BeingLookedAtByLocalPlayer() then halo.Add( { self }, Color( 0, 255, 255 ), 1, 1, 1 )
	if text != "" then AddWorldTip( self:EntIndex(), text, 0.5, self:GetPos(), self ) end end end
function ENT:OnTakeDamage( dmg ) self:TakePhysicsDamage( dmg ) end
function ENT:PhysicsCollide( dat, phy ) if dat.Speed >= 60 and dat.DeltaTime > 0.2 then self:EmitSound( "Metal_Barrel.ImpactSoft" ) end end