AddCSLuaFile() ENT.PrintName = "#xdefm.QuestBoard"  ENT.Category = "#xdefm.Category"  ENT.Author = "LemonCola3424"
ENT.Spawnable = true  ENT.Base = "base_gmodentity"  ENT.xdefm_Cool = 0
function ENT:SetupDataTables() self:NetworkVar( "Entity", 0, "FMod_OW" ) self:NetworkVar( "String", 0, "FMod_OI" ) end
function ENT:SpawnFunction( ply, tr, ClassName ) if !tr.Hit then return end
	local ent = ents.Create( ClassName ) ent:SetPos( tr.HitPos ) ent:SetAngles( Angle( 0, ply:EyeAngles().yaw +90, 0 ) )
	ent:Spawn() ent:Activate() ent:SetFMod_OW( ply ) ent:SetFMod_OI( ply:SteamID() ) return ent end
function ENT:Initialize() if CLIENT then return end self:SetModel( "models/props/cs_office/offcorkboarda.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS ) self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS ) self:SetUseType( SIMPLE_USE ) end
function ENT:OnDuplicated() SafeRemoveEntity( self ) end function ENT:OnRestore() if SERVER then SafeRemoveEntity( self ) end end
function ENT:GetOverlayText() local txt, num = language.GetPhrase( "xdefm.State" )..": ", 2
if LocalPlayer():GetNWBool( "XDEFM_QD" ) then num = 3 elseif !table.IsEmpty( xdefm.quest ) then num = 1 end
txt = txt..language.GetPhrase( "xdefm.State"..num )  return self.PrintName.."\n"..language.GetPhrase( "xdefm.Quest2" ).."\n"..txt end
function ENT:Use( act ) if !act:IsPlayer() or self.xdefm_Cool > CurTime() or !act:Alive() then return end self.xdefm_Cool = CurTime() +0.5
	if act:KeyDown( IN_SPEED ) and ( self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() ) then return end
	if act:KeyDown( IN_SPEED ) then act:PickupObject( self ) return end
	if act:GetNWBool( "XDEFM_QD" ) then xdefm_AddNote( act, "xdefm.Failed", "resource/warning.wav", "cross", 5 ) return end local lvl = ( act.xdefm_Profile.Level or 0 )
	if !istable( act.xdefm_Quest ) or table.IsEmpty( act.xdefm_Quest ) then local qst = xdefm_QuestPick( lvl, act )
	if qst then xdefm_AddNote( act, "xdefm.QuestSt", "friends/friend_online.wav", "page_add", 5 ) end
	end xdefm_OpenMenu( act, 1, act.xdefm_Quest or {} ) xdefm_UpdateMenu( act, 0, act.xdefm_Profile ) end
function ENT:Think() if SERVER then return end local text = self:GetOverlayText() local ply, tag = LocalPlayer(), GetConVar( "xdefmod_tagdist" ):GetInt()
	if !IsValid( ply ) or tag == 0 or ply:GetPos():DistToSqr( self:GetPos() ) > tag^2 then return end if self:BeingLookedAtByLocalPlayer() then
	local col = table.IsEmpty( xdefm.quest ) and Color( 0, 255, 0 ) or Color( 255, 255, 0 )
	if LocalPlayer():GetNWBool( "XDEFM_QD" ) then col = Color( 255, 0, 0 ) end halo.Add( { self }, col, 1, 1, 1 )
	if text != "" then AddWorldTip( self:EntIndex(), text, 0.5, self:GetPos(), self ) end end end
function ENT:OnTakeDamage( dmg ) self:TakePhysicsDamage( dmg ) end
function ENT:PhysicsCollide( dat, phy ) if dat.Speed >= 60 and dat.DeltaTime > 0.2 then self:EmitSound( "Default.ImpactSoft" ) end end
function ENT:Draw() self:DrawModel() surface.SetFont( "xdefm_Font3" )
	local txt = table.IsEmpty( xdefm.quest ) and "!" or "..."
	local col = table.IsEmpty( xdefm.quest ) and Color( 0, 255, 0 ) or Color( 255, 255, 0 )
	if LocalPlayer():GetNWBool( "XDEFM_QD" ) then txt = "X"  col = Color( 255, 0, 0 ) end
	local xx, yy = surface.GetTextSize( txt )
	cam.Start3D2D( self:GetPos() -self:GetUp()*( 20 -2*math.sin( CurTime()*4 ) ) -self:GetRight()*1, self:LocalToWorldAngles( Angle( 0, 180, 90 ) ), 0.25 )
		draw.TextShadow( { text = txt, pos = { 0, -85 }, font = "xdefm_Font3",
		xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = col }, 1, 255 )
	cam.End3D2D() end