AddCSLuaFile() -- 鱼竿
SWEP.PrintName		= "#xdefm.Weapon_Rod"
SWEP.Author 		= "LemonCola3424"
SWEP.Purpose 		= "#xdefm.Purpose"
SWEP.Instructions 	= "#xdefm.Instruct"
SWEP.Category 		= "#xdefm.Category"
SWEP.ViewModelFOV	= 54
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/c_arms.mdl"
SWEP.WorldModel		= "models/oc_diving/rod.mdl"
SWEP.Spawnable		= true
SWEP.AdminOnly		= false
SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "None"
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "None"
SWEP.Weight			= 0
SWEP.AutoSwitchTo	= false
SWEP.AutoSwitchFrom	= false
SWEP.FMod_Loop = nil  SWEP.FMod_Rod = nil  SWEP.FMod_Hook = {}  SWEP.FMod_Bobber = {}
SWEP.FMod_Reel = false  SWEP.FMod_OnSpeed = false

if CLIENT then
	SWEP.Slot				= 0
	SWEP.SlotPos			= 10
	SWEP.DrawAmmo			= false
	SWEP.DrawCrosshair		= false
	SWEP.UseHands           = false
	SWEP.SwayScale			= 1
	SWEP.BobScale			= 1
	SWEP.BounceWeaponIcon	= false
	local Mat = Material( "gui/gradient_up" )
	function SWEP:PrintWeaponInfo( x, y, alpha )
		if self.InfoMarkup == nil then
			local str = ""  local title_color = "<color=255,255,255,255>"
			local text_color = "<color=155,155,255,255>"  str = "<font=TargetID>"
			if ( self.Author != "" ) then str = str..title_color..language.GetPhrase( "#xdefm.Author" )..": </color>"..text_color..self.Author.."</color>\n" end
			if ( self.Purpose != "" ) then str = str..title_color..language.GetPhrase( "#xdefm.Purpos" )..": </color>"..text_color..language.GetPhrase( self.Purpose ).."</color>\n" end
			str = str.."\n"..title_color..language.GetPhrase( self.PrintName ).."</color>"
			if ( self.Instructions != "" ) then str = str..title_color.."\n</color>"..text_color..language.GetPhrase( self.Instructions ).."</color>\n" end
			str = str .. "</font>"  self.InfoMarkup = markup.Parse( str, 350 )
		end
		local xx, yy, ww, hh = x - 6, y - 6, 362, self.InfoMarkup:GetHeight() + 24
		draw.RoundedBox( 0, xx, yy, ww, hh, Color( 0, 115*0.5, 180, 255, alpha ) )
		surface.SetDrawColor( 5, 5, 100, 255 ) surface.SetMaterial( Mat ) surface.DrawTexturedRect( xx, yy, ww, hh )
		surface.SetDrawColor( 0, 0, 255, 255 ) surface.DrawOutlinedRect( xx, yy, ww, hh, 2 )
		surface.SetDrawColor( 0, 255, 255, 255 ) surface.DrawOutlinedRect( xx, yy, ww, hh, 1 )
		self.InfoMarkup:Draw( x + 5, y + 5, nil, nil, alpha )
		draw.TextShadow( {
			text = language.GetPhrase( "xdefm.Version" )..": "..xdefm.miscs.Version, pos = { xx, yy + hh + 16 },
			font = "xdefm_Font1", xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 )
		}, 1, 255 ) self.InfoMarkup = nil
	end
	function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )
		surface.SetDrawColor( 100, 100, 255, alpha )  surface.SetTexture( self.WepSelectIcon )
		y = y+10  x = x+10  wide = wide-20
		surface.DrawTexturedRect( x, y, wide, ( wide / 2 ) )
		self:PrintWeaponInfo( x + wide + 20, y + tall * 0.95, alpha )
	end
	function SWEP:DrawWorldModel() if IsValid( self.Owner ) then self:DrawShadow( false ) return end self:DrawModel() self:DrawShadow( true ) end
	function SWEP:DrawHUD() if GetConVar( "cl_drawhud" ):GetInt() <= 0 then return end
		local ply = LocalPlayer()  local wep = self  local sl = self:GetFMod_SL()  local st = self:GetFMod_ST()  if !istable( ply.xdefm_Profile ) then return end
		local col = LocalPlayer():WaterLevel() < 2 and Color( 255, 255, 255 ) or Color( 255, 255, 0 )
		local pro = ply.xdefm_Profile  local str = xdefm_GetUpValue( pro.UpdB, "B" )
		local txt = language.GetPhrase( self.PrintName )  surface.SetFont( "xdefm_Font6" )  local ww, hh = surface.GetTextSize( txt )
		draw.RoundedBox( 8, ScrW()/2 -ww/2 -12, ScrH()*0.95 -hh/2 -12, ww +24, hh +24, Color( 0, 0, 0, 128 ) )
		draw.Text( {
			text = txt, pos = { ScrW()/2, ScrH()*0.95 },
			font = "xdefm_Font6", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 55, 255, 255 )
		} )
		local function MakeItNice( x, y, w, h )
			draw.RoundedBox( 0, x, y, w, h, col ) surface.DrawOutlinedRect( x, y, w, h, 1 )
			surface.SetDrawColor( 0, 0, 0, 255 ) surface.DrawOutlinedRect( x, y, w, h, 1 )
		end local LAng = ( xdefm.miscs.CamAng != nil and xdefm.miscs.CamAng or ply:EyeAngles() )
		local tr = util.TraceLine( {
			start = ply:EyePos(), endpos = ply:EyePos() +ply:EyeAngles():Forward()*128,
			filter = ply, mask = MASK_SHOT_HULL
		} ) local hps = ( tr.HitPos + tr.HitNormal )
		if !xdefm.miscs.CrsPos then xdefm.miscs.CrsPos = hps else xdefm.miscs.CrsPos = LerpVector( 0.1, xdefm.miscs.CrsPos, hps ) end
		scr = xdefm.miscs.CrsPos:ToScreen()  scr.x = math.Round( scr.x )  scr.y = math.Round( scr.y )
		if sl >= 0 then local per = 0
			if st == 1 then per = math.Clamp( sl/100, 0, 1 ) elseif st == 2 then
			per = math.Clamp( self:GetFMod_RL()/xdefm_GetUpValue( pro.UpdB, "B" ), 0, 1 ) end
			MakeItNice( scr.x -29 -48*per, scr.y -2, 24, 4 ) MakeItNice( scr.x +5 +48*per, scr.y -2, 24, 4 )
		end MakeItNice( scr.x -3, scr.y -3, 6, 6 )
		if LocalPlayer():WaterLevel() < 2 then
			if sl > 0 and st == 1 then local ll = str*self:GetFMod_SL()/100
				draw.TextShadow( {
					text = language.GetPhrase( "xdefm.Length" )..": "..math.Round( ll*0.01905, 1 ), pos = { scr.x, scr.y + 25 },
					font = "xdefm_Font1", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = col
				}, 1, 255 )
			elseif st == 2 then
				draw.TextShadow( {
					text = language.GetPhrase( "xdefm.Length" )..": "..math.Round( self:GetFMod_RL()*0.01905, 1 ), pos = { scr.x, scr.y + 25 },
					font = "xdefm_Font1", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = col
				}, 1, 255 )
			end
			if GetConVar( "xdefmod_showhook" ):GetInt() > 0 then
				for k, v in pairs( ents.FindByClass( "xdefm_bobber" ) ) do
					if IsValid( v ) and v:GetFMod_OW() == LocalPlayer() then
						col = ( v:WaterLevel() <= 1 and v:GetNWBool( "xdefm_InWater" ) ) and Color( 0, 255, 255 ) or Color( 255, 255, 0 )
						if hi and v:WaterLevel() > 0 then col = Color( 0, 255, 255 ) end
						scr = v:WorldSpaceCenter():ToScreen() scr.x = math.Clamp( math.Round( scr.x ), 16, ScrW()-16 ) scr.y = math.Clamp( math.Round( scr.y ), 16, ScrH()-16 )
						local function MakeItNice( x, y, w, h )
							draw.RoundedBox( 0, x, y, w, h, col ) surface.DrawOutlinedRect( x, y, w, h, 1 )
							surface.SetDrawColor( 0, 0, 0, 255 ) surface.DrawOutlinedRect( x, y, w, h, 1 )
						end MakeItNice( scr.x -5, scr.y -5, 10, 10 )
						local rea, lee, hh = v:GetFMod_RS(), v:GetFMod_DP(), 0
						if rea < 1 or ( IsValid( v:GetFMod_HK() ) and IsValid( v:GetFMod_HK():GetFMod_FS() ) ) then
							draw.TextShadow( {
								text = math.Round( rea*100 ).."%", pos = { scr.x, scr.y -16 },
								font = "xdefm_Font2", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = col
							}, 1, 255 )
						end
						if lee > 0 then
							draw.TextShadow( {
								text = language.GetPhrase( "xdefm.Depth" )..": "..math.Round( lee*0.01905, 1 ), pos = { scr.x, scr.y +16 },
								font = "xdefm_Font2", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = col
							}, 1, 255 ) hh = hh +16
						end
						if GetConVar( "xdefmod_sonar" ):GetInt() > 0 and IsValid( v:GetFMod_HK() ) and IsValid( v:GetFMod_HK():GetFMod_FS() ) then
							local aa, bb = xdefm_ItemGet( v:GetFMod_HK():GetFMod_FS() )
							if istable( bb ) then
								draw.TextShadow( { text = language.GetPhrase( "xdefm.Caught" )..": "..language.GetPhrase( bb.Name ), pos = { scr.x, scr.y +16 +hh }, font = "xdefm_Font2",
								xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = xdefm.miscs.Rarity[ bb.Rarity +1 ] }, 1, 255 )
							end
						end
					end
				end
			end
		end
	end
end
function SWEP:FMod_DoGest( act ) local own = self.Owner  if !IsValid( own ) or !isnumber( act ) then return end act = math.Round( act )
	if CLIENT then own:AnimRestartGesture( GESTURE_SLOT_ATTACK_AND_RELOAD, act, true )
	else net.Start( "NET_xdefm_Anim" ) net.WriteEntity( own ) net.WriteFloat( act ) net.Broadcast() end
end
function SWEP:SetupDataTables()
	self:NetworkVar( "Float", 0, "FMod_SL" ) --String Power
	self:NetworkVar( "Int", 0, "FMod_ST" ) --Rod State
	self:NetworkVar( "Float", 2, "FMod_RL" ) --Reel Length
end
function SWEP:Initialize() self:SetHoldType( "passive" ) if CLIENT then xdefm.miscs.CrsPos = nil end end
function SWEP:Deploy() local own = self.Owner
	if SERVER and ( !IsValid( own ) or !own:IsPlayer() ) then self:Remove() return end
	self:SetFMod_SL( 0 ) self:SetFMod_ST( 0 ) self:SetHoldType( "passive" ) local phy = self:GetPhysicsObject()
	if IsValid( phy ) then phy:AddGameFlag( FVPHYSICS_NO_PLAYER_PICKUP ) phy:AddGameFlag( FVPHYSICS_NO_IMPACT_DMG ) phy:AddGameFlag( FVPHYSICS_NO_NPC_IMPACT_DMG ) end
	return true
end
function SWEP:PrimaryAttack()
	if self:GetNextPrimaryFire() > CurTime() or self:GetNextSecondaryFire() > CurTime() or CLIENT or !IsValid( self.FMod_Rod ) then return end local own = self.Owner
	if SERVER and ( !IsValid( own ) or !own:IsPlayer() ) then self:Remove() return end
	if !istable( own.xdefm_Profile ) or !isnumber( own.xdefm_Profile.UpdA ) then return end
	local bone = own:LookupBone( "ValveBiped.Bip01_R_Hand" ) if !bone then own:PrintMessage( HUD_PRINTCENTER, "#xdefm.NoBone" ) return end
	if self:GetFMod_ST() == 2 then
		if self:GetFMod_RL() < xdefm_GetUpValue( own.xdefm_Profile[ "UpdB" ], "B" ) and !self.FMod_Reel then
			self.FMod_Loop = CreateSound( self, Sound( "xdefm.Reel" ) ) self.FMod_Loop:Play() self.FMod_Reel = true
		end return
	elseif self:GetFMod_ST() != 0 then return end
	if !own:CheckLimit( "xdefmod_items" ) or ( URS and URS.Check( own, "xdefmod_item", "_" ) == false ) then return end
	self.FMod_Loop = CreateSound( self, Sound( "xdefm.Reel" ) ) self.FMod_Loop:Play()
	self.FMod_Loop:ChangePitch( 100, 0 )  self:SetFMod_ST( 1 )  self:SetHoldType( "grenade" ) self:SetFMod_SL( 10 )
	self:SetNextPrimaryFire( CurTime() + 0.2 )
end
function SWEP:SecondaryAttack()
	if self:GetNextPrimaryFire() > CurTime() or self:GetNextSecondaryFire() > CurTime() or CLIENT or !IsValid( self.FMod_Rod ) then return end local own = self.Owner
	if SERVER and ( !IsValid( own ) or !own:IsPlayer() ) then self:Remove() return end
	if !istable( own.xdefm_Profile ) or !isnumber( own.xdefm_Profile.UpdA ) then return end
	if self:GetFMod_ST() == 2 and self:GetFMod_RL() > 0 and !self.FMod_Reel then
		self.FMod_Loop = CreateSound( self, Sound( "xdefm.Reel" ) ) self.FMod_Loop:Play() self.FMod_Reel = true
		return
	end
	self:SetNextPrimaryFire( CurTime() + 0.2 )
end
function SWEP:Reload() 
	if self:GetNextPrimaryFire() > CurTime() or self:GetNextSecondaryFire() > CurTime() or CLIENT then return end local own = self.Owner
	if SERVER and ( !IsValid( own ) or !own:IsPlayer() ) then self:Remove() return end
	if !istable( own.xdefm_Profile ) or !isnumber( own.xdefm_Profile.UpdA ) then return end
	if self:GetFMod_ST() == 2 then
		if self.FMod_Loop then self.FMod_Loop:Stop() end own:EmitSound( "xdefm.UnReel" )
		for k, v in pairs( self.FMod_Bobber ) do if IsValid( v ) then v:Remove() end end
		self:SetHoldType( "passive" ) self:SetFMod_ST( 0 ) self:SetFMod_SL( 0 )
	end self:SetNextSecondaryFire( CurTime() + 0.2 )
end
function SWEP:Holster()
	if self.FMod_Loop then self.FMod_Loop:Stop() end if IsValid( self.FMod_Rod ) then self.FMod_Rod:Remove() end
	return true
end
function SWEP:OnFastReel()
	local own = self.Owner  if !IsValid( own ) or !own:IsPlayer() then return false end
	local inv = ( own:GetInfoNum( "xdefmod_fastreel", 0 ) > 0 )
	return ( inv and !own:KeyDown( IN_SPEED ) ) or ( !inv and own:KeyDown( IN_SPEED ) )
end
function SWEP:Think() local own = self.Owner  if CLIENT or !IsValid( own ) or !own:IsPlayer() or !own:Alive() or !istable( own.xdefm_Profile ) then return end
	local pro = own.xdefm_Profile  local st = self:GetFMod_ST()  local sl = self:GetFMod_SL()  if !istable( pro ) then return end if !IsValid( self.FMod_Rod ) then
		local rod = ents.Create( "xdefm_rod" ) rod:Spawn() rod:SetFMod_OW( own ) self.FMod_Rod = rod
		local sss = xdefm_GetUpValue( pro[ "UpdA" ], "A" )  if !isnumber( sss ) then sss = 0.5 end
		self:SetHoldType( "passive" ) self:SetFMod_ST( 0 ) self:SetFMod_SL( 0 ) rod:SetModelScale( sss, 0 )
	end self:NextThink( CurTime() +0.1 )
	if self:GetNextPrimaryFire() >= CurTime() or self:GetNextSecondaryFire() >= CurTime() then return true end
	if st == 1 then
		if own:KeyDown( IN_ATTACK ) then local str = xdefm_GetUpValue( pro[ "UpdB" ], "B" )
			local spd = xdefm_GetUpValue( pro[ "UpdC" ], "C" )
			if sl < 100 then self:SetFMod_SL( sl +( self:OnFastReel() and spd*2 or spd )/str*100 )
			if self:GetFMod_SL() >= 100 then own:EmitSound( "xdefm.ChargeMax" ) if self.FMod_Loop then self.FMod_Loop:Stop() end end
			if self.FMod_Loop then self.FMod_Loop:ChangePitch( 100 +sl/2, 0 ) end end
		else if self.FMod_Loop then self.FMod_Loop:Stop() end own:EmitSound( "xdefm.Throw" )
			self:SetFMod_ST( 2 ) self:SetHoldType( "pistol" ) self:FMod_DoGest( ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE )
			if IsValid( self.FMod_Rod ) then local rod = self.FMod_Rod
				local CPos, CAng = rod:GetPos(), rod:GetAngles() if !CPos or !CAng then return end local shp = xdefm_GetUpValue( pro[ "UpdD" ], "D" )
				local num = xdefm_GetUpValue( pro[ "UpdG" ], "G" )  if !isnumber( num ) then num = 1 end local las = nil
				for i=1, GetConVar( "xdefmod_nomorehook" ):GetInt() >= 1 and 1 or num do
					local LVec = Vector( 0, 0, 105 )  local LAng = Angle( 90, 360/i*math.pi, 0 ) local siz = self.FMod_Rod:GetModelScale()
					local NPos, NAng = LocalToWorld( LVec*siz, LAng, CPos, CAng )  local vel = Angle( 0, own:EyeAngles().yaw, 0 ):Forward() +Vector( 0, 0, 16 )
					local bob = ents.Create( "xdefm_bobber" ) bob:SetPos( NPos ) bob:SetAngles( NAng ) bob:SetOwner( own )
					bob:SetFMod_OW( own ) bob:SetFMod_RD( rod ) bob:Spawn() bob:Activate() rod:DeleteOnRemove( bob )
					local upd = xdefm_GetUpValue( own.xdefm_Profile.UpdA, "A" )  local str = xdefm_GetUpValue( own.xdefm_Profile.UpdB, "B" )
					local con, rop = constraint.Elastic( rod, bob, 0, 0, Vector( 0, 0, 105*rod:GetModelScale() ),
					Vector( 0, 0, 0 ), 2500, 50, 50, "cable/rope", 0, true ) bob:SetFMod_SW( 0.1 +pro[ "UpdD" ]/100*0.9 )
					local hok = ents.Create( "xdefm_hook" ) hok:SetPos( NPos ) hok:SetAngles( NAng ) hok:SetOwner( own )
					hok:SetFMod_OW( own ) hok:SetFMod_RD( rod ) hok:Spawn() hok:Activate() rod:DeleteOnRemove( hok ) bob:DeleteOnRemove( hok )
					local co2, rop = constraint.Elastic( hok, bob, 0, 0, Vector( 0, 4, 12 ), Vector( 0, 0, 0 ), 2500, 50, 50, "cable/rope", 0, true )
					bob.FMod_S1 = con  bob.FMod_S2 = co2  local ll = str*self:GetFMod_SL()/100
					bob:SetFMod_HK( hok ) hok:SetFMod_BB( bob ) self:SetFMod_RL( ll ) local le = self:GetFMod_RL()/3
					con:Fire( "SetSpringLength", le*2 )  co2:Fire( "SetSpringLength", le )
					bob:SetFMod_RS( 1 ) bob.FMod_RS = shp  bob.FMod_MaxRS = shp
					bob:GetPhysicsObject():SetVelocity( own:EyeAngles():Forward()*ll*2 )
					hok:GetPhysicsObject():SetVelocity( own:EyeAngles():Forward()*ll*2 )
					local ite = pro.Items[ 21 ]  if isstring( ite ) and ite != "_" then
						local aa, bb = xdefm_ItemGet( ite )  if bb and istable( bb ) and bb.Type == "Bait" then
							local cc = ents.Create( "base_anim" )  cc:SetModel( bb.Model[ math.random( #bb.Model ) ] )  cc:SetAngles( hok:GetAngles() )
							cc:SetPos( hok:WorldSpaceCenter() -cc:WorldSpaceCenter() +cc:GetPos() ) cc:SetOwner( own ) hok:DeleteOnRemove( cc )
							cc:SetParent( hok ) cc:Spawn() cc:Activate() hok.xdefm_BaitEnt = cc  hok.xdefm_Bait = ite
						end
					end
					for k, v in pairs( self.FMod_Hook ) do if !IsValid( v ) then continue end constraint.NoCollide( hok, v, 0, 0 ) end
					table.insert( self.FMod_Bobber, bob ) table.insert( self.FMod_Hook, hok )
				end
			end self:SetNextPrimaryFire( CurTime() +0.2 )
		end
	end st = self:GetFMod_ST()
	if st == 2 then
		for k, v in pairs( self.FMod_Bobber ) do if !IsValid( v ) then table.remove( self.FMod_Bobber, k ) end end
		for k, v in pairs( self.FMod_Hook ) do if !IsValid( v ) then table.remove( self.FMod_Hook, k ) end end
		if table.IsEmpty( self.FMod_Bobber ) or !IsValid( self.FMod_Rod ) then if self.FMod_Loop then self.FMod_Loop:Stop() end
			for k, v in pairs( self.FMod_Bobber ) do if IsValid( v ) then v:Remove() end end
			self:SetHoldType( "passive" ) self:SetFMod_ST( 0 ) self:SetFMod_SL( 0 ) return true
		end
		if self.FMod_Reel then local le, lm = self:GetFMod_RL(), xdefm_GetUpValue( own.xdefm_Profile[ "UpdB" ], "B" )
			if ( !own:KeyDown( IN_ATTACK2 ) and !own:KeyDown( IN_ATTACK ) )
			or ( own:KeyDown( IN_ATTACK2 ) and le <= 0 ) or ( own:KeyDown( IN_ATTACK ) and le >= lm )
			or table.IsEmpty( self.FMod_Bobber ) then self.FMod_Reel = false
				if self.FMod_Loop then self.FMod_Loop:Stop() end
				if ( own:KeyDown( IN_ATTACK2 ) and le <= 0 ) or ( own:KeyDown( IN_ATTACK ) and le >= lm ) then own:EmitSound( "xdefm.ChargeMax" ) end
			else local spd = ( own:KeyDown( IN_ATTACK2 ) and 1 or 0 )  if own:KeyDown( IN_ATTACK ) then spd = spd - 1.5 end
				spd = ( self:OnFastReel() and spd*2 or spd )  spd = spd * xdefm_GetUpValue( own.xdefm_Profile[ "UpdC" ], "C" )
				if self.FMod_Loop then if self:OnFastReel() then self.FMod_Loop:ChangePitch( 120, 0 ) else self.FMod_Loop:ChangePitch( 100, 0 ) end end
				self:SetFMod_RL( math.Clamp( le - spd, 0, lm ) )  local ll = self:GetFMod_RL()/3
				self:SetFMod_SL( math.Clamp( self:GetFMod_RL() / 100 * 100, 0, 100 ) )
				local s1 = self.FMod_Bobber.FMod_S1  local s2 = self.FMod_Bobber.FMod_S2
				for k, v in pairs( self.FMod_Bobber ) do if !IsValid( v ) then continue end local s1, s2 = v.FMod_S1, v.FMod_S2
					if IsValid( s1 ) then s1:Fire( "SetSpringLength", math.max( 5, ll*2 ) ) end
					if IsValid( s2 ) then s2:Fire( "SetSpringLength", math.max( 5, ll ) ) end
					v.FMod_RL = math.max( 5, ll )
				end
			end
		end
	end
	return true
end
function SWEP:OnRemove() self:Holster() end function SWEP:OnDrop() self:Holster() end

if true then // xdefm_rod
	local ENT = {}
	ENT.Base = "base_anim"  ENT.PrintName = ""  ENT.Spawnable = false
	ENT.RenderGroup = RENDERGROUP_BOTH  ENT.Owner = nil  ENT.ShadowParams = {}
	function ENT:SetupDataTables() self:NetworkVar( "Entity", 0, "FMod_OW" ) end
	function ENT:Initialize()
		self:DrawShadow( false ) if !SERVER then return end
		self:SetModel( "models/oc_diving/rod.mdl" ) xdefm_NoTool( self )
		self:PhysicsInit( SOLID_VPHYSICS ) self:SetMoveType( MOVETYPE_VPHYSICS ) self:SetRenderMode( RENDERMODE_TRANSCOLOR )
		self:SetCollisionGroup( COLLISION_GROUP_DEBRIS_TRIGGER )
		self:SetSolid( SOLID_NONE ) self:GetPhysicsObject():SetMass( 10000 )
		self:GetPhysicsObject():Wake() self:GetPhysicsObject():EnableGravity( false )
		self:GetPhysicsObject():AddGameFlag( FVPHYSICS_NO_PLAYER_PICKUP )
		self:GetPhysicsObject():AddGameFlag( FVPHYSICS_NO_IMPACT_DMG )
		self:GetPhysicsObject():AddGameFlag( FVPHYSICS_NO_NPC_IMPACT_DMG )
		self:StartMotionController()
	end
	function ENT:Think() if CLIENT then return end local own = self:GetFMod_OW()
		if !IsValid( own ) or !own:IsPlayer() or !istable( own.xdefm_Profile )
		or ( !IsValid( own:GetActiveWeapon() ) or own:GetActiveWeapon():GetClass() != "weapon_xdefm_rod" ) then self:Remove() return end
		if !IsValid( self.Owner ) or !self.Owner:IsPlayer() or self.Owner != own
		or ( !IsValid( own:GetActiveWeapon() ) or own:GetActiveWeapon():GetClass() != "weapon_xdefm_rod" ) then
			self.Owner = own  own:DeleteOnRemove( self )
		end
	end
	function ENT:PhysicsSimulate( phys, delt ) phys:Wake() local own = self:GetFMod_OW()
		if !IsValid( own ) or !own:IsPlayer() then return end
		local bone = own:LookupBone( "ValveBiped.Bip01_R_Hand" ) if !bone then return end
		local CPos, CAng = own:GetBonePosition( bone ) if !CPos or !CAng then return end
		local LVec = xdefm.miscs.RodPos  local LAng = xdefm.miscs.RodAng  local siz = self:GetModelScale()
		local NPos, NAng = LocalToWorld( LVec*siz +Vector(-1,2,-2)*siz -Vector(-1,1,0), LAng, CPos, CAng )
		self.ShadowParams.secondstoarrive = 0.0001  self.ShadowParams.pos = NPos
		self.ShadowParams.angle = NAng  self.ShadowParams.maxangular = 0
		self.ShadowParams.maxangulardamp = 1  self.ShadowParams.maxspeed = 1
		self.ShadowParams.maxspeeddamp = 1  self.ShadowParams.dampfactor = 0.999
		self.ShadowParams.teleportdistance = 1  self.ShadowParams.deltatime = delt
		phys:ComputeShadowControl( self.ShadowParams )
	end
	if CLIENT then
		function ENT:Draw() self:DrawModel() end
		function ENT:xdefm_Move() local own = self:GetFMod_OW()
			if !IsValid( own ) or !own:IsPlayer() then return end
			local bone = own:LookupBone( "ValveBiped.Bip01_R_Hand" ) if !bone then return end
			local CPos, CAng = own:GetBonePosition( bone ) if !CPos or !CAng then return end
			local LVec = xdefm.miscs.RodPos  local LAng = xdefm.miscs.RodAng  local siz = self:GetModelScale()
			local NPos, NAng = LocalToWorld( LVec*siz +Vector(-1,2,-2)*siz -Vector(-1,1,0), LAng, CPos, CAng )
			self:SetPos( NPos ) self:SetAngles( NAng )
			self:SetRenderBounds( Vector( -1024, -1024, -1024 ), Vector( 1024, 1024, 1024 ) )
		end
	end
	scripted_ents.Register( ENT, "xdefm_rod" )
end
if true then // xdefm_bobber
	local ENT = {}
	ENT.Base = "base_anim"  ENT.PrintName = ""  ENT.Spawnable = false
	ENT.RenderGroup = RENDERGROUP_BOTH  ENT.Owner = nil  ENT.FMod_InWater = false  ENT.FMod_NextWave = 0
	ENT.FMod_S1 = nil  ENT.FMod_S2 = nil  ENT.FMod_Next = 0  ENT.FMod_MaxRS = 0  ENT.FMod_RS = 0  ENT.FMod_RL = 0
	function ENT:SetupDataTables()
		self:NetworkVar( "Entity", 0, "FMod_OW" ) --主
		self:NetworkVar( "Entity", 1, "FMod_RD" ) --杆
		self:NetworkVar( "Entity", 2, "FMod_HK" ) --钩
		self:NetworkVar( "Float", 0, "FMod_DP" ) --深度
		self:NetworkVar( "Float", 2, "FMod_SW" ) -- 弦宽
		self:NetworkVar( "Float", 3, "FMod_RS" ) --绳韧
	end
	function ENT:Initialize()
		self:DrawShadow( false ) if !SERVER then self:SetRenderBounds( Vector( -8192, -8192, -8192 ), Vector( 8192, 8192, 8192 ) ) return end
		self:SetModel( "models/props_c17/lamp001a.mdl" ) xdefm_NoTool( self )
		self:PhysicsInit( SOLID_VPHYSICS ) self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetCollisionGroup( COLLISION_GROUP_DEBRIS_TRIGGER )
		self:SetRenderMode( RENDERMODE_TRANSCOLOR ) self:SetModelScale( 0.5 )
		self:GetPhysicsObject():SetMass( 5 ) self:GetPhysicsObject():Wake()
		self:GetPhysicsObject():AddGameFlag( FVPHYSICS_NO_PLAYER_PICKUP )
		self:GetPhysicsObject():AddGameFlag( FVPHYSICS_NO_IMPACT_DMG )
		self:GetPhysicsObject():AddGameFlag( FVPHYSICS_NO_NPC_IMPACT_DMG )
		self:GetPhysicsObject():SetMaterial( "wood" ) self:SetFMod_SW( 0.1 )
		timer.Simple( 0.1, function()
			if IsValid( self ) then
				self:GetPhysicsObject():SetBuoyancyRatio( 50 )
				self:GetPhysicsObject():SetDamping( 0, 1000 )
			end
		end )
	end
	function ENT:Think() if CLIENT then return end local own = self:GetFMod_OW()
		if !IsValid( own ) or !own:IsPlayer() or !istable( own.xdefm_Profile )
		or ( !IsValid( own:GetActiveWeapon() ) or own:GetActiveWeapon():GetClass() != "weapon_xdefm_rod" ) then self:Remove() return end
		if !IsValid( self.Owner ) or !self.Owner:IsPlayer() or self.Owner != own then
			self.Owner = own  own:DeleteOnRemove( self )
		end local hh = self:GetFMod_HK()
		if IsValid( hh ) and self:WaterLevel() <= 1 and hh:WaterLevel() >= 3 and own:WaterLevel() < 2 and self.FMod_InWater then
			self:SetFMod_DP( math.Round( math.abs( ( self:WorldSpaceCenter() - hh:WorldSpaceCenter() ).z ), 1 ) )
		else self:SetFMod_DP( 0 ) end
		if IsValid( hh ) and IsValid( self:GetFMod_RD() ) and self.FMod_RS > 0 then local rod = self:GetFMod_RD()
			local CPos, CAng = rod:GetPos(), rod:GetAngles()
			local LVec = xdefm.miscs.RodPos  local LAng = xdefm.miscs.RodAng  local siz = rod:GetModelScale()
			local NPos, NAng = LocalToWorld( LVec*siz +Vector(-1,2,-2)*siz -Vector(-1,1,0), LAng, CPos, CAng )
			local p1, p2 = self.FMod_RL, NPos:Distance( hh:GetPos() )
			local p3 = self:GetPos():Distance( hh:GetPos() )*3
			if ( p1*2 < p2 or p3 > p1*2 ) and p2 > 64 and IsValid( hh:GetFMod_FS() ) then
				local vel = math.Round( hh:GetPhysicsObject():GetVelocity():Length()/128, 1 )
				self.FMod_RS = math.max( 0, self.FMod_RS -math.Clamp( vel, 0, 10 ) )
				if self.FMod_RS <= 0 then self:Remove() rod:EmitSound( "xdefm.Break" )
				xdefm_BroadEffect( "MetalSpark", { Origin = rod:LocalToWorld( Vector( 0, 0, 105*rod:GetModelScale() ) ), rod:GetUp(), Scale = 2, Magnitude = 2, Radius = 2 } )
				return true end
			end
			self:SetFMod_RS( math.Clamp( self.FMod_RS/self.FMod_MaxRS, 0, 1 ) )
		end
		local tr = util.TraceLine( {
			start = self:WorldSpaceCenter(),
			endpos = self:WorldSpaceCenter() -Vector( 0, 0, 6 ),
			filter = self, mask = MASK_WATER
		} )
		if tr.Hit then self:SetAngles( Angle( 0, 0, 0 ) )
			if !self.FMod_InWater and self.FMod_Next < CurTime() then self.FMod_InWater = true
				local data = EffectData()
				data:SetOrigin( tr.HitPos +tr.HitNormal )
				data:SetScale( 3 ) data:SetFlags( 0 )
				util.Effect( "watersplash", data )
				self.FMod_NextWave = CurTime() + 2
				self:SetNWBool( "xdefm_InWater", true )
				if math.random( 1, 5 ) == 1 then
					sound.Play( "ambient/water/drip"..math.random( 1, 4 )..".wav", self:GetPos(), 75, math.random( 95, 105 ), 0.5 )
				end
			end
			if self:WaterLevel() <= 1 and self.FMod_NextWave <= CurTime() then
				self.FMod_NextWave = CurTime() + math.Rand( 1, 2 )
				local data = EffectData() data:SetFlags( 0 )
				data:SetOrigin( tr.HitPos + tr.HitNormal )
				data:SetScale( math.Rand( 1, 2 ) )
				util.Effect( "WaterRipple", data )
			end
		elseif self.FMod_InWater then self.FMod_InWater = false  self:SetNWBool( "xdefm_InWater", false ) end
		if self.FMod_Next < CurTime() then self.FMod_Next = CurTime() + 0.25 end self:NextThink( CurTime() ) return true
	end
	function ENT:PhysicsCollide( data, phys )
		if data.Speed > 60 and data.DeltaTime > 0.2 then self:EmitSound( "Popcan.ImpactHard" ) end
		local LastSpeed = math.max( data.OurOldVelocity:Length(), data.Speed ) local NewVelocity = phys:GetVelocity() NewVelocity:Normalize()
		LastSpeed = math.max( NewVelocity:Length(), LastSpeed ) local TargetVelocity = NewVelocity*LastSpeed*0.75  phys:SetVelocity( TargetVelocity )
	end
	if CLIENT then local Mat = Material( "cable/rope" )
		function ENT:Draw() self:DrawModel() local ll = self:GetFMod_SW()
			local rd = self:GetFMod_RD() if IsValid( rd ) then
				render.SetMaterial( Mat )
				local CPos, CAng = rd:GetPos(), rd:GetAngles() if !CPos or !CAng then return end
				local LVec = Vector( 0, 0, 105 )  local LAng = Angle( 90, 0, 0 ) local siz = rd:GetModelScale()
				local NPos, NAng = LocalToWorld( LVec*siz, LAng, CPos, CAng )
				render.DrawBeam( self:WorldSpaceCenter(), NPos, ll, 0, 0, Color( 25, 25, 25, 255 ) )
			end
			local hk = self:GetFMod_HK() if IsValid( rd ) and IsValid( hk ) then
				render.SetMaterial( Mat )
				local CPos, CAng = hk:GetPos(), hk:GetAngles() if !CPos or !CAng then return end
				local LVec = Vector( 0, 2, 6 )  local LAng = Angle( 0, 0, 0 ) local siz = rd:GetModelScale()
				local NPos, NAng = LocalToWorld( LVec, LAng, CPos, CAng )
				render.DrawBeam( self:WorldSpaceCenter(), NPos, ll, 0, 0, Color( 25, 25, 25, 255 ) )
			end
		end
	end
	scripted_ents.Register( ENT, "xdefm_bobber" )
end
if true then // xdefm_hook
	local ENT = {}
	ENT.Base = "base_anim"  ENT.PrintName = ""  ENT.Spawnable = false
	ENT.RenderGroup = RENDERGROUP_BOTH  ENT.Owner = nil  ENT.xdefm_Exp = 0
	ENT.xdefm_Depth = 0  ENT.xdefm_Bait = "_"  ENT.xdefm_BaitEnt = nil  ENT.xdefm_Weld = false
	function ENT:SetupDataTables()
		self:NetworkVar( "Entity", 0, "FMod_OW" ) --主
		self:NetworkVar( "Entity", 1, "FMod_RD" ) --杆
		self:NetworkVar( "Entity", 2, "FMod_BB" ) --浮
		self:NetworkVar( "Entity", 3, "FMod_FS" ) --鱼
	end
	function ENT:Initialize()
		self:DrawShadow( false ) if !SERVER then return end
		self:SetModel( "models/props_junk/meathook001a.mdl" ) xdefm_NoTool( self )
		self:PhysicsInit( SOLID_VPHYSICS ) self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetRenderMode( RENDERMODE_TRANSCOLOR ) self:SetModelScale( 0.5 )
		self:GetPhysicsObject():SetMass( 100 ) self:GetPhysicsObject():Wake()
		self:GetPhysicsObject():AddGameFlag( FVPHYSICS_NO_PLAYER_PICKUP )
		timer.Simple( 0, function()
			if IsValid( self ) then
				self:GetPhysicsObject():SetBuoyancyRatio( 0 )
				self:GetPhysicsObject():SetDamping( 0, 1000 )
			end
		end )
		if GetConVar( "xdefmod_hurtrod" ):GetInt() <= 0 then
			self:GetPhysicsObject():AddGameFlag( FVPHYSICS_NO_IMPACT_DMG )
			self:GetPhysicsObject():AddGameFlag( FVPHYSICS_NO_NPC_IMPACT_DMG )
			self:SetCollisionGroup( COLLISION_GROUP_DEBRIS )
		else
			self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
		end
	end
	function ENT:Think() if CLIENT then return end local own = self:GetFMod_OW()  self:NextThink( CurTime() +0.1 )
		if !IsValid( own ) or !own:IsPlayer() or !istable( own.xdefm_Profile )
		or ( !IsValid( own:GetActiveWeapon() ) or own:GetActiveWeapon():GetClass() != "weapon_xdefm_rod" ) then self:Remove() return end
		if !IsValid( self.Owner ) or !self.Owner:IsPlayer() or self.Owner != own
		or ( !IsValid( own:GetActiveWeapon() ) or own:GetActiveWeapon():GetClass() != "weapon_xdefm_rod" ) then
			self.Owner = own  own:DeleteOnRemove( self )  self:SetOwner( own )
		end if !IsValid( self:GetFMod_RD() ) or !IsValid( self:GetFMod_BB() ) then self:Remove() return end
		if self:WaterLevel() >= 3 then
			self.xdefm_Depth = ( math.Round( math.abs( ( self:GetFMod_BB():WorldSpaceCenter() - self:WorldSpaceCenter() ).z ), 1 ) )
		elseif self.xdefm_Depth > 0 then self.xdefm_Depth = 0 end local dep = math.Round( self.xdefm_Depth*0.01905, 1 )  local pro = own.xdefm_Profile
		if dep > 0 and own:WaterLevel() < 2 and !IsValid( self:GetFMod_FS() )then
			local grd = util.TraceLine( {
				start = self:WorldSpaceCenter(),
				endpos = self:WorldSpaceCenter() -Vector( 0, 0, 1/0.01905 ),
				mask = MASK_SOLID_BRUSHONLY
			} ).Entity == Entity( 0 )
			local sel, exp = xdefm_PoolGet( dep, pro.Level, IsValid( self.xdefm_BaitEnt ) and self.xdefm_Bait or "_", xdefm_GetUpValue( pro.UpdE, "E" ), grd )
			if isstring( sel ) and isnumber( exp ) then local aa, bb = xdefm_ItemGet( sel )  if !istable( aa ) or !istable( bb ) then return true end
				local ite = xdefm_ItemSpawn( sel, self:WorldSpaceCenter(), AngleRand(), own )
				if IsValid( ite ) then self:SetFMod_FS( ite ) ite:SetNotSolid( true )
					constraint.Weld( ite, self, 0, 0, 0, 0, false )  self.xdefm_Weld = true
					if self.xdefm_Bait != "_" and IsValid( self.xdefm_BaitEnt ) then local ite = own.xdefm_Profile.Items[ 21 ]
						local aa, bb = xdefm_ItemGet( ite )  if istable( bb ) and bb.Type == "Bait" and bb.Consume >= 0 and math.random( 1, bb.Consume ) == 1 then
							own.xdefm_Profile.Items[ 21 ] = "_"  xdefm_ProfileUpdate( own )
							xdefm_AddNote( own, "xdefm.CBait", "ambient/water/water_spray1.wav", "bug_delete", 5 )
						end
					end self.xdefm_Bait = "_"
					self:DeleteOnRemove( ite ) if IsValid( self:GetFMod_RD() ) then self:GetFMod_RD():EmitSound( "xdefm.Bite" ) end
					if IsValid( self:GetFMod_BB() ) then self.xdefm_Exp = exp
						local data = EffectData() data:SetOrigin( self:GetFMod_BB():WorldSpaceCenter() ) data:SetScale( 5 ) data:SetFlags( 0 )
						util.Effect( "watersplash", data ) self:GetFMod_BB():GetPhysicsObject():SetVelocity( Vector( 0, 0, -200 ) )
						self:GetFMod_BB():GetPhysicsObject():SetBuoyancyRatio( 0 ) constraint.NoCollide( ite, self:GetFMod_BB(), 0, 0 )
					end if IsValid( self.xdefm_BaitEnt ) then self.xdefm_BaitEnt:Remove() end
				end
			end
		end
		if self:WaterLevel() <= 0 then local own = self.Owner
			if IsValid( self:GetFMod_FS() ) and self.xdefm_Weld then self:DontDeleteOnRemove( self:GetFMod_FS() )
				self:GetFMod_FS():SetNotSolid( false ) self.xdefm_Weld = false
				if self.xdefm_Exp > 0 then local exp = self.xdefm_Exp  xdefm_GiveExp( own, exp ) self.xdefm_Exp = 0 end
				own.xdefm_Profile[ "TCatch" ] = own.xdefm_Profile[ "TCatch" ] +1  xdefm_ProfileUpdate( own )
				if !istable( self:GetFMod_FS().xdefm_T2 ) then return end self:GetFMod_FS().xdefm_T2:OnCaught( self:GetFMod_FS(), own )
				own:AddCount( "xdefmod_items", self:GetFMod_FS() )  local fs = self:GetFMod_FS()
				net.Start( "NET_xdefm_BestiaryRecord" ) net.WriteString( xdefm_GetClass( fs ) ) net.Send( own )
				if IsValid( own.xdefm_Thief ) and own.xdefm_Thief.xdefm_Killed then own.xdefm_Thief = nil end
				if !IsValid( own.xdefm_Thief ) and math.random( 1, 100 ) <= math.Clamp( GetConVar( "xdefmod_thief" ):GetInt(), 0, 100 ) then
					local ver = VectorRand():GetNormalized()*math.random( 500, 1000 )  ver.z = math.abs( ver.z )
					local tr = util.TraceLine( { start = own:WorldSpaceCenter(), mask = MASK_SHOT,
						endpos = own:WorldSpaceCenter() +ver, filter = { self, own } } )
					local t2 = util.TraceHull( { start = tr.HitPos +tr.HitNormal*4, mask = MASK_SHOT,
						endpos = fs:WorldSpaceCenter(), filter = { self, own },
						mins = -Vector( 4, 4, 4 ), maxs = Vector( 4, 4, 4 ) } )
					if !tr.Hit and tr.HitPos:Distance( fs:WorldSpaceCenter() ) > 50 then  local clx = "cr_seagull"
						local cls = xdefm_GetClass( fs )
						if cls == "cr_pigeon" or cls == "cr_crow" or cls == "cr_seagull" or cls == "cr_crow" or cls == "cr_seagull2" then return end
						if ( fs.xdefm_T2.Rarity >= 3 and math.random( 1, 3 ) == 1 ) then
							clx = math.random( 1, 50 ) == 1 and "cr_seagull2" or "cr_crow"
						end
						local ite = xdefm_ItemSpawn( clx, tr.HitPos +tr.HitNormal*4, Angle( 0, math.random( 0, 360 ), 0 ), Entity( 0 ) )
						if IsValid( ite ) then own.xdefm_Thief = ite  ite.xdefm_Target = fs  own:AddCount( "xdefmod_items", ite ) end
					end
				end
			end
		end
		return true
	end
	function ENT:PhysicsCollide( data, phys ) if IsValid( self:GetFMod_OW() ) then self:SetPhysicsAttacker( self:GetFMod_OW() ) end
		if data.Speed > 60 and data.DeltaTime > 0.2 then self:EmitSound( "Grenade.ImpactHard" ) end
		local LastSpeed = math.max( data.OurOldVelocity:Length(), data.Speed ) local NewVelocity = phys:GetVelocity() NewVelocity:Normalize()
		LastSpeed = math.max( NewVelocity:Length(), LastSpeed ) local TargetVelocity = NewVelocity * LastSpeed * 0.5  phys:SetVelocity( TargetVelocity )
	end
	if CLIENT then function ENT:Draw() self:SetRenderBounds( Vector( -1024, -1024, -1024 ), Vector( 1024, 1024, 1024 ) ) self:DrawModel() end end
	scripted_ents.Register( ENT, "xdefm_hook" )
end