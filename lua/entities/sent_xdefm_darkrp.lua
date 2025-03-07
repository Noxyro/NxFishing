--[[
Custom Non-Commercial License v1.0 - 06.08.2024

Part of the "NxFishing" project on GitHub: https://github.com/Noxyro/NxFishing
© 2024 Noxyro; Original work by LemonCola3424

BASIC LICENSE TERMS: NON-COMMERCIAL USE ONLY; CREDITS TO ORIGINAL AUTHOR REQUIRED; MODIFY AND DISTRIBUTE FREELY UNDER LICENSE TERMS
See "LICENSE.md" and "README.md" in project folder or on GitHub for full license and contact details.
--]]

AddCSLuaFile() ENT.PrintName = "#xdefm.DarkRP"  ENT.Category = "#xdefm.Category"  ENT.Author = "LemonCola3424"
ENT.Spawnable = ( istable( DarkRP ) and true )  ENT.Base = "base_gmodentity"
function ENT:SetupDataTables() self:NetworkVar( "Entity", 0, "FMod_OW" ) self:NetworkVar( "String", 0, "FMod_OI" ) end
function ENT:SpawnFunction( ply, tr, ClassName ) if !tr.Hit then return end
	if !DarkRP then xdefm_AddNote( ply, "xdefm.NotRP", "resource/warning.wav", "cross", 5 ) return end
	local ent = ents.Create( ClassName ) ent:SetPos( tr.HitPos ) ent:SetAngles( Angle( 0, ply:EyeAngles().yaw +180, 0 ) )
	ent:Spawn() ent:Activate() ent:SetFMod_OW( ply ) ent:SetFMod_OI( ply:SteamID() ) return ent end
function ENT:Initialize() if CLIENT then return end self:SetModel( "models/props_lab/monitor01a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS ) self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS ) self:SetUseType( SIMPLE_USE ) end
function ENT:OnDuplicated() SafeRemoveEntity( self ) end function ENT:OnRestore() if SERVER then SafeRemoveEntity( self ) end end
function ENT:GetOverlayText() return self.PrintName.."\n"..language.GetPhrase( "xdefm.DarkRP2" ) end
function ENT:Use( act ) if !act:IsPlayer() or !act:Alive() then return end
	if act:KeyDown( IN_SPEED ) and ( self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() ) then return end
	if act:KeyDown( IN_SPEED ) then act:PickupObject( self ) return end xdefm_OpenMenu( act, 2, act.xdefm_Profile )
end
function ENT:Think() if SERVER then return end local text = self:GetOverlayText() local ply, tag = LocalPlayer(), GetConVar( "xdefmod_tagdist" ):GetInt()
	if !IsValid( ply ) or tag == 0 or ply:GetPos():DistToSqr( self:GetPos() ) > tag^2 then return end local tak = false
	if self:BeingLookedAtByLocalPlayer() then halo.Add( { self }, Color( 0, 255, 255 ), 1, 1, 1 )
	if text != "" then AddWorldTip( self:EntIndex(), text, 0.5, self:GetPos(), self ) end end end
function ENT:OnTakeDamage( dmg ) self:TakePhysicsDamage( dmg ) end
function ENT:PhysicsCollide( dat, phy ) if dat.Speed >= 60 and dat.DeltaTime > 0.2 then self:EmitSound( "Computer.ImpactSoft" ) end end
function ENT:Draw() self:DrawModel() surface.SetFont( "xdefm_Font2" )
	local txt = language.GetPhrase( "xdefm.DarkRP" )  local xx, yy = surface.GetTextSize( txt )
	local tx2 = GAMEMODE.Name  local x2, y2 = surface.GetTextSize( tx2 )
	cam.Start3D2D( self:GetPos() -self:GetUp()*10 +self:GetForward()*13, self:LocalToWorldAngles( Angle( 0, 90, 90 ) ), 0.2 )
		local col = Color( 140, 0, 0 )
		draw.SimpleTextOutlined( txt, "xdefm_Font2", 0, -65, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
		draw.SimpleTextOutlined( tx2, "xdefm_Font2", 0, -80, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
	cam.End3D2D() end