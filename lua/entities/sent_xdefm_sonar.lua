AddCSLuaFile() ENT.PrintName = "#xdefm.Sonar"  ENT.Category = "#xdefm.Category"  ENT.Author = "LemonCola3424"
ENT.Spawnable = true  ENT.Base = "base_gmodentity"  ENT.xdefm_Cool = 0
function ENT:SetupDataTables() self:NetworkVar( "Entity", 0, "FMod_OW" ) self:NetworkVar( "String", 0, "FMod_OI" ) self:NetworkVar( "String", 1, "FMod_DT" ) end
function ENT:SpawnFunction( ply, tr, ClassName ) if !tr.Hit then return end
	local ent = ents.Create( ClassName ) ent:SetPos( tr.HitPos ) ent:SetAngles( Angle( 0, ply:EyeAngles().yaw +180, 0 ) )
	ent:Spawn() ent:Activate() ent:SetFMod_OW( ply ) ent:SetFMod_OI( ply:SteamID() ) return ent end
function ENT:Initialize() if CLIENT then return end self:SetModel( "models/props_lab/reciever01a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS ) self:SetMoveType( MOVETYPE_VPHYSICS ) self:SetFMod_DT( "_" )
	self:SetSolid( SOLID_VPHYSICS ) self:SetUseType( SIMPLE_USE ) self:SetTrigger( true ) end
function ENT:OnDuplicated() SafeRemoveEntity( self ) end function ENT:OnRestore() if SERVER then SafeRemoveEntity( self ) end end
function ENT:GetOverlayText() local ni = ( self:GetFMod_OW():IsPlayer() and self:GetFMod_OW():Nick() or self:GetFMod_OI() )
return self.PrintName.."\n"..language.GetPhrase( "xdefm.Sonar2" ).."\n"..language.GetPhrase( "xdefm.Owner" )..": "..ni end
function ENT:Use( act ) if !act:IsPlayer() or !act:Alive() then return end if act:KeyDown( IN_SPEED ) then
		if self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() then return end
	act:PickupObject( self ) return end end
function ENT:Think() if SERVER then local ow = self:GetFMod_OW()
	if IsValid( ow ) and ow:IsPlayer() and IsValid( ow:GetActiveWeapon() ) and ow:GetActiveWeapon():GetClass() == "weapon_xdefm_rod"
	and IsValid( ow:GetActiveWeapon().FMod_Hook ) and IsValid( ow:GetActiveWeapon().FMod_Hook:GetFMod_FS() ) then
		local dt = ow:GetActiveWeapon().FMod_Hook:GetFMod_FS() if self:GetFMod_DT() == "_" and IsValid( dt ) and isstring( dt:GetFMod_DT() ) and dt:GetFMod_DT() != "_" then
		self:EmitSound( "npc/turret_floor/click1.wav" ) self:SetFMod_DT( dt:GetFMod_DT() ) end
	elseif self:GetFMod_DT() != "_" then self:EmitSound( "npc/turret_floor/retract.wav" ) self:SetFMod_DT( "_" ) end
	self:NextThink( CurTime() +1 ) return true end local text = self:GetOverlayText() local ply, tag = LocalPlayer(), GetConVar( "xdefmod_tagdist" ):GetInt()
	if !IsValid( ply ) or tag == 0 or ply:GetPos():DistToSqr( self:GetPos() ) > tag^2 then return end local tak = false
	if self:BeingLookedAtByLocalPlayer() then local aa, bb = xdefm_ItemGet( self:GetFMod_DT() )  local col = Color( 0, 255, 255 )
	if istable( bb ) then col = xdefm.miscs.Rarity[ bb.Rarity +1 ] end halo.Add( { self }, col, 1, 1, 1 )
	if text != "" then AddWorldTip( self:EntIndex(), text, 0.5, self:GetPos(), self ) end end end
function ENT:OnTakeDamage( dmg ) self:TakePhysicsDamage( dmg ) end
function ENT:PhysicsCollide( dat, phy ) if dat.Speed >= 60 and dat.DeltaTime > 0.2 then self:EmitSound( "SolidMetal.ImpactSoft" ) end end
function ENT:Draw() local txt = self:GetFMod_DT()  local aa, bb = xdefm_ItemGet( txt )  self:DrawModel()
	surface.SetFont( "xdefm_Font3" ) if txt == "" or txt == "_" or !istable( bb ) then return end
	local col = xdefm.miscs.Rarity[ bb.Rarity +1 ]  txt = language.GetPhrase( bb.Name )  local xx, yy = surface.GetTextSize( txt )
	cam.IgnoreZ( true ) cam.Start3D2D( self:GetPos(), self:LocalToWorldAngles( Angle( 0, 90, 90 ) ), 0.1 )
		draw.RoundedBox( 8, -xx/2 -8, -yy/2 -100 -8, xx +16, yy +16, Color( 0, 0, 0, 155 ) )
		draw.TextShadow( { text = txt, pos = { 0, -100 }, font = "xdefm_Font3",
		xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = col }, 1, 255 ) cam.End3D2D() cam.IgnoreZ( false ) end