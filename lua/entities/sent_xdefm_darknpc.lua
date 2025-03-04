--[[
Custom Non-Commercial License v1.0 - 06.08.2024

Part of the "NxFishing" project on GitHub: https://github.com/Noxyro/NxFishing
© 2024 Noxyro; Original work by LemonCola3424

BASIC LICENSE TERMS: NON-COMMERCIAL USE ONLY; CREDITS TO ORIGINAL AUTHOR REQUIRED; MODIFY AND DISTRIBUTE FREELY UNDER LICENSE TERMS
See "LICENSE.md" and "README.md" in project folder or on GitHub for full license and contact details.
--]]

sound.Add( { name = "xdefm.NPCHey", channel = CHAN_VOICE, volume = 0.5, level = 60, pitch = 100,
sound = { "*lostcoast/vo/fisherman/fish_hey.wav", "*lostcoast/vo/fisherman/fish_youthere.wav", "*lostcoast/vo/fisherman/fish_wait01.wav",
"*lostcoast/vo/fisherman/fish_wait02.wav", "*lostcoast/vo/fisherman/fish_wait03.wav", "*lostcoast/vo/fisherman/fish_wait04.wav" } } )
sound.Add( { name = "xdefm.NPCIdle", channel = CHAN_VOICE, volume = 0.5, level = 60, pitch = 100,
sound = { "*lostcoast/vo/fisherman/fish_whistling01.wav", "*lostcoast/vo/fisherman/fish_whistling02.wav", "*lostcoast/vo/fisherman/fish_whistling03.wav",
"*lostcoast/vo/fisherman/fish_whistling04.wav", "*lostcoast/vo/fisherman/fish_whistling05.wav", "*lostcoast/vo/fisherman/fish_whistling06.wav" } } )

AddCSLuaFile() ENT.PrintName = "#xdefm.DarkNPC"  ENT.Category = "#xdefm.Category"  ENT.Author = "LemonCola3424"
ENT.Spawnable = true  ENT.AdminOnly = true  ENT.Base = "base_ai"  ENT.NextIdle = 0  ENT.AutomaticFrameAdvance = true
function ENT:SpawnFunction( ply, tr, ClassName ) if !tr.Hit then return end
	local ent = ents.Create( ClassName ) ent:SetPos( tr.HitPos ) ent:SetAngles( Angle( 0, ply:EyeAngles().yaw +180, 0 ) )
	ent:Spawn() ent:Activate() return ent end
function ENT:Initialize() if CLIENT then return end self:SetModel( "models/lostcoast/fisherman/fisherman.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS ) self:SetMoveType( MOVETYPE_NONE )
	self:SetSolid( SOLID_VPHYSICS ) self:SetUseType( SIMPLE_USE )
	self:DrawShadow( true )  self:SetRenderMode( RENDERMODE_TRANSCOLOR )
	self:SetSolid( SOLID_BBOX )  self:SetCollisionGroup( COLLISION_GROUP_NPC )  self:SetHullType( HULL_HUMAN )
	self:SetMaxHealth( 1 ) self:SetHealth( 1 ) self:SetBloodColor( BLOOD_COLOR_RED ) self:SetNPCClass( CLASS_PLAYER_ALLY )
	self:SetKeyValue( "SpawnFlags", 512 + 1024 + 4194304 ) self:SetMaxYawSpeed( 30 )
	self:CapabilitiesAdd( CAP_TURN_HEAD ) self:CapabilitiesAdd( CAP_ANIMATEDFACE ) self:SetSchedule( SCHED_IDLE_STAND )
end
function ENT:Use( act ) if !act:IsPlayer() or !act:Alive() then return end
	if !istable( act.xdefm_Profile ) then return end self.NextIdle = CurTime() +math.random( 8, 16 )
	xdefm_OpenMenu( act, 3, act.xdefm_Profile ) self:StopSound( "xdefm.NPCIdle" ) self:EmitSound( "xdefm.NPCHey" )
end
function ENT:Think() if SERVER then self:NextThink( CurTime() +0.1 )
	if self.NextIdle <= CurTime() then self.NextIdle = CurTime() +math.random( 8, 16 )  self:EmitSound( "xdefm.NPCIdle" ) end
	return true end local ply, tag = LocalPlayer(), GetConVar( "xdefmod_tagdist" ):GetInt()
	if !IsValid( ply ) or tag == 0 or ply:GetPos():DistToSqr( self:GetPos() ) > tag^2 then return end local tak = false
	if self:BeingLookedAtByLocalPlayer() then halo.Add( { self }, Color( 0, 255, 255 ), 1, 1, 1 ) end end
function ENT:OnTakeDamage( dmg ) self:TakePhysicsDamage( dmg ) end
function ENT:PhysicsCollide( dat, phy ) if dat.Speed >= 60 and dat.DeltaTime > 0.2 then self:EmitSound( "Computer.ImpactSoft" ) end end
function ENT:Draw() self:DrawModel() surface.SetFont( "xdefm_Font3" )
	local txt = language.GetPhrase( "xdefm.DarkNPC" )  local xx, yy = surface.GetTextSize( txt )
	cam.Start3D2D( self:GetPos() +self:GetUp()*68, self:LocalToWorldAngles( Angle( 0, 90, 90 ) ), 0.1 )
		local col = Color( 0, 161, 255 )
		draw.RoundedBox( 8, -xx/2 -4, -yy*2, xx +8, yy +16, Color( 0, 0, 0, 128 ) )
		draw.SimpleTextOutlined( txt, "xdefm_Font3", 0, -65, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
	cam.End3D2D() end
if SERVER then return end
function ENT:BeingLookedAtByLocalPlayer() local ply = LocalPlayer() if !IsValid( ply ) or !ply:Alive() then return false end
	local view = ply:GetViewEntity()  local dist = math.Clamp( math.ceil( GetConVar( "xdefmod_tagdist" ):GetInt() )^2, -1, 2147483647 )
	if view:IsPlayer() then return ( ( view:EyePos():DistToSqr( self:GetPos() ) <= dist or dist == -1 ) and view:GetEyeTrace().Entity == self ) end return false
end