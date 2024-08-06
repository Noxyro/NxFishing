AddCSLuaFile() ENT.PrintName = "#xdefm.Bucket"  ENT.Category = "#xdefm.Category"  ENT.Author = "LemonCola3424"
ENT.Spawnable = true  ENT.AdminOnly = true  ENT.Base = "base_gmodentity"  ENT.xdefm_Cool = 0  ENT.xdefm_Table = {}
function ENT:SetupDataTables() self:NetworkVar( "Entity", 0, "FMod_OW" ) self:NetworkVar( "String", 0, "FMod_OI" ) self:NetworkVar( "Int", 1, "FMod_CT" ) end
function ENT:SpawnFunction( ply, tr, ClassName ) if !tr.Hit then return end
	local ent = ents.Create( ClassName ) ent:SetPos( tr.HitPos ) ent:SetAngles( Angle( 0, ply:EyeAngles().yaw +180, 0 ) )
	ent:Spawn() ent:Activate() ent:SetFMod_OW( ply ) ent:SetFMod_OI( ply:SteamID() ) return ent end
function ENT:Initialize() if CLIENT then return end self:SetModel( "models/props_junk/MetalBucket01a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS ) self:SetMoveType( MOVETYPE_VPHYSICS ) self:SetFMod_CT( 0 )
	self:SetSolid( SOLID_VPHYSICS ) self:SetUseType( SIMPLE_USE ) self:SetTrigger( true ) end
function ENT:GetOverlayText() local ni = ( self:GetFMod_OW():IsPlayer() and self:GetFMod_OW():Nick() or self:GetFMod_OI() )
return self.PrintName.."\n"..language.GetPhrase( "xdefm.Bucket2" ).."\n"..language.GetPhrase( "xdefm.Owner" )..": "..ni end
function ENT:OnDuplicated() SafeRemoveEntity( self ) end function ENT:OnRestore() if SERVER then SafeRemoveEntity( self ) end end
function ENT:Use( act ) if !act:IsPlayer() or !act:Alive() or ( !xdefm_FriendAllow( act, self:GetFMod_OI() ) and !xdefm_NadAllow( act, self ) ) then return end
	if act:KeyDown( IN_SPEED ) and ( self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() ) then return end
	if act:KeyDown( IN_SPEED ) then act:PickupObject( self ) return elseif self:GetFMod_CT() > 0 then
	local ite = self.xdefm_Table[ #self.xdefm_Table ]  local giv = xdefm_ItemGive( act, ite ) if !giv then return end
	table.remove( self.xdefm_Table, #self.xdefm_Table ) self:EmitSound( "EpicMetal.ImpactSoft" )
	self:SetFMod_CT( self:GetFMod_CT() -1 ) self.xdefm_Cool = CurTime() +0.5 end end
function ENT:Touch( ent ) if ent:GetClass() != "xdefm_base" or self.xdefm_Cool > CurTime() or self:GetFMod_CT() >= 16 or ent.xdefm_Trashed then return end self.xdefm_Cool = CurTime() +1
	local aa, bb = xdefm_ItemGet( ent ) if !istable( bb ) or !isnumber( bb.Price ) or !bb.Carryable or !ent:IsPlayerHolding() then return end local ow = ent:GetFMod_OW()
	if !ow:IsPlayer() or ( !xdefm_FriendAllow( self:GetFMod_OW(), ent:GetFMod_OI() ) and !xdefm_NadAllow( self:GetFMod_OW(), ent ) ) then return end
	self:SetFMod_CT( self:GetFMod_CT() +1 ) table.insert( self.xdefm_Table, ent:GetFMod_DT() )
	self:EmitSound( "SolidMetal.ImpactSoft" ) ent.xdefm_Trashed = true ent:Remove() end
function ENT:Think() if SERVER then if IsValid( self.xdefm_Dummy ) then self.xdefm_Dummy:SetAngles( self:LocalToWorldAngles( Angle( 0, CurTime()*10, 0 ) ) ) end
	self:NextThink( CurTime() +0.01 ) return true end local text = self:GetOverlayText() local ply, tag = LocalPlayer(), GetConVar( "xdefmod_tagdist" ):GetInt()
	if !IsValid( ply ) or tag == 0 or ply:GetPos():DistToSqr( self:GetPos() ) > tag^2 then return end local red = self:GetFMod_CT()/16
	local col = Color( 255, 255 -255*red, 255 -255*red )
	if self:BeingLookedAtByLocalPlayer() then halo.Add( { self }, col, 1, 1, 1 )
	if text != "" then AddWorldTip( self:EntIndex(), text, 0.5, self:GetPos(), self ) end end end
function ENT:OnTakeDamage( dmg ) self:TakePhysicsDamage( dmg ) end
function ENT:PhysicsCollide( dat, phy ) if dat.Speed >= 60 and dat.DeltaTime > 0.2 then self:EmitSound( "SolidMetal.ImpactSoft" ) end end
function ENT:Draw() self:DrawModel()  local red = self:GetFMod_CT()/16  local col = Color( 255, 255 -255*red, 255 -255*red )  local txt = self:GetFMod_CT().." / 16"
	surface.SetFont( "xdefm_Font3" ) local xx, yy = surface.GetTextSize( txt )
	cam.IgnoreZ( true ) local aaa = ( LocalPlayer():GetPos() -self:GetPos() ):Angle()
	cam.Start3D2D( self:GetPos(), Angle( 0, 90 +aaa.yaw, 90 ), 0.1 )
		draw.RoundedBox( 8, -xx/2 -8, -yy/2 -128 -8, xx +16, yy +16, Color( 0, 0, 0, 155 ) )
		draw.TextShadow( { text = txt, pos = { 0, -128 }, font = "xdefm_Font3",
		xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = col }, 1, 255 ) cam.End3D2D() cam.IgnoreZ( false ) end