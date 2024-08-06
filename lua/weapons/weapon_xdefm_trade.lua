AddCSLuaFile() -- 交易,极度赘余警告
SWEP.PrintName		= "#xdefm.Weapon_Trade"
SWEP.Author 		= "LemonCola3424"
SWEP.Purpose 		= "#xdefm.Purpose"
SWEP.Instructions 	= "#xdefm.Instruct4"
SWEP.Category 		= "#xdefm.Category"
SWEP.ViewModelFOV	= 54
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/c_arms.mdl"
SWEP.WorldModel		= "models/weapons/w_suitcase_passenger.mdl"
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
SWEP.Weight					= 0
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
if CLIENT then
	SWEP.Slot				= 0
	SWEP.SlotPos			= 10
	SWEP.DrawAmmo			= false
	SWEP.DrawCrosshair		= false
	SWEP.UseHands           = true
	SWEP.SwayScale			= 1
	SWEP.BobScale			= 1
	SWEP.BounceWeaponIcon	= false
	SWEP.FMod_CTarget 		= nil
	function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )
		surface.SetDrawColor( 100, 100, 255, alpha )  surface.SetTexture( self.WepSelectIcon )
		y = y+10  x = x+10  wide = wide-20
		surface.DrawTexturedRect( x, y, wide, ( wide / 2 ) )
		self:PrintWeaponInfo( x + wide + 20, y + tall * 0.95, alpha )
	end local Mat = Material( "gui/gradient_up" )
	function SWEP:PrintWeaponInfo( x, y, alpha )
		if self.InfoMarkup == nil then
			local str = ""  local title_color = "<color=255,255,255,255>"
			local text_color = "<color=155,155,255,255>"  str = "<font=TargetID>"
			if ( self.Author != "" ) then str = str..title_color..language.GetPhrase( "#xdefm.Author" )..": </color>"..text_color..self.Author.."</color>\n" end
			if ( self.Purpose != "" ) then str = str..title_color..language.GetPhrase( "#xdefm.Purpos" )..": </color>"..text_color..language.GetPhrase( self.Purpose ).."</color>\n" end
			str = str.."\n"..title_color..language.GetPhrase( self.PrintName ).."</color>"
			if ( self.Instructions != "" ) then str = str..title_color.."\n</color>"..text_color..language.GetPhrase( self.Instructions ).."</color>\n" end
			if IsValid( LocalPlayer() ) then local blk = LocalPlayer():GetNWBool( "XDEFMod_BTD" )
				local col = "<color="..( blk and "255,0,0" or "0,255,0" )..">"
				str = str..language.GetPhrase( "xdefm.TradeStat" )..": "..col..language.GetPhrase( "xdefm."..( blk and "Disallow" or "Allow" ) ).."</color>"
			end
			str = str .. "</font>"  self.InfoMarkup = markup.Parse( str, 350 )
		end
		local xx, yy, ww, hh = x - 6, y - 6, 362, self.InfoMarkup:GetHeight() +24
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
	function SWEP:DrawWorldModel() self:DrawModel() end
	function SWEP:DrawHUD() local pro = LocalPlayer().xdefm_Profile  if !IsValid( LocalPlayer() ) or !LocalPlayer():Alive() or
		vgui.CursorVisible() or !istable( pro ) then return end local own = LocalPlayer()  if GetConVar( "cl_drawhud" ):GetInt() <= 0 then return end
		local txt = language.GetPhrase( self.PrintName )  surface.SetFont( "xdefm_Font6" )  local ww, hh = surface.GetTextSize( txt )
		draw.RoundedBox( 8, ScrW()/2 -ww/2 -12, ScrH()*0.95 -hh/2 -12, ww +24, hh +24, Color( 0, 0, 0, 128 ) )
		for i=1, 1 do draw.Text( {
			text = txt, pos = { ScrW()/2, ScrH()*0.95 },
			font = "xdefm_Font6", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 55, 255, 255 )
		} ) end local blk = own:GetNWBool( "XDEFMod_BTD" )
		local tr = util.TraceLine( { start = own:EyePos(), endpos = own:EyePos() +own:EyeAngles():Forward()*128,
		filter = own, mask = MASK_SHOT } )  local ent = tr.Entity  local col = Color( 255, 255, 255 )
		if IsValid( ent ) and ent:IsPlayer() and ent:WorldSpaceCenter():DistToSqr( own:WorldSpaceCenter() ) > 65536 then ent = Entity( 0 ) end
		local scr = ( tr.HitPos +tr.HitNormal ):ToScreen()  scr.x = math.Round( scr.x )  scr.y = math.Round( scr.y )
		if !own:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() then draw.TextShadow( {
			text = language.GetPhrase( "xdefm.TradeStat" )..": "..language.GetPhrase( "xdefm."..( blk and "Disallow" or "Allow" ) ), pos = { scr.x, scr.y +50 },
			font = "xdefm_Font1", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = blk and Color( 255, 55, 55 ) or Color( 55, 255, 55 )
		}, 1, 255 ) end if own:GetNWBool( "XDEFMod_BTD" ) then return end local ply = own:GetNWEntity( "XDEFMod_TPL" )
		if ply:IsPlayer() and ply:Alive() then plo = ply:GetNWEntity( "XDEFMod_TPL" )
			if plo == own then local k1 = input.LookupBinding( "+attack2", true ) if isstring( k1 ) then
				local kk1 = string.Explode( "", k1 ) if !istable( kk1 ) then k1 = string.upper( k1 )
				else kk1[ 1 ] = string.upper( kk1[ 1 ] )  k1 = table.concat( kk1, "" ) end
				draw.TextShadow( {
					text = language.GetPhrase( "xdefm.Trade13" ).." "..k1.." "..language.GetPhrase( "xdefm.Trade14" ), pos = { scr.x, scr.y +25 },
					font = "xdefm_Font1", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 55, 255, 255 )
				}, 1, 255 )
			end end
			local co2 = ( plo == own and Color( 55, 255, 255 ) or Color( 255, 255, 0 ) )
			local bol = language.GetPhrase( "xdefm."..( plo == own and "Trade11" or "Trade12" ) )
			local sc2 = ply:WorldSpaceCenter():ToScreen()  sc2.x = math.Round( sc2.x )  sc2.y = math.Round( sc2.y )
			draw.TextShadow( {
				text = ply:Nick(), pos = { sc2.x, sc2.y },
				font = "xdefm_Font5", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = co2
			}, 1, 255 )
			draw.TextShadow( {
				text = bol, pos = { sc2.x, sc2.y +20 },
				font = "xdefm_Font1", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = co2
			}, 1, 255 )
			cam.Start3D()
			render.DrawBeam( own:WorldSpaceCenter(), ply:WorldSpaceCenter(), 0.5, 1, 1, co2 )
			cam.End3D()
			return true
		end
		if !IsValid( ent ) or ent:IsWorld() or !util.IsValidModel( ent:GetModel() ) then col = Color( 255, 255, 255 ) end
		col = ( ent:IsPlayer() and !ent:IsBot() and util.IsValidModel( ent:GetModel() ) and ent:HasWeapon( "weapon_xdefm_trade" ) and !ent:GetNWBool( "XDEFMod_BTD" )
		and ( !ent:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() or ent:GetNWEntity( "XDEFMod_TPL" ) == own ) ) and Color( 0, 255, 0 ) or col
		local function MakeItNice( x, y, w, h )
			draw.RoundedBox( 0, x, y, w, h, col ) surface.DrawOutlinedRect( x, y, w, h, 1 )
			surface.SetDrawColor( 0, 0, 0, 255 ) surface.DrawOutlinedRect( x, y, w, h, 1 )
		end
		if !own:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() then
			MakeItNice( scr.x -3, scr.y -3, 6, 6 )
		end if IsValid( ent ) and util.IsValidModel( ent:GetModel() ) and ent:IsPlayer() then halo.Add( { ent }, col, 1, 1, 1, true, true )
		self.FMod_CTarget = ent else self.FMod_CTarget = nil end local tar = self.FMod_CTarget
		local tx2 = language.GetPhrase( "xdefm.Trade1" )  if IsValid( tar ) and tar:IsPlayer() and !tar:IsBot() and util.IsValidModel( tar:GetModel() ) then
			if !tar:HasWeapon( "weapon_xdefm_trade" ) then tx2 = tar:Nick().." "..language.GetPhrase( "xdefm.Trade6" )
			elseif tar:GetNWBool( "XDEFMod_BTD" ) then tx2 = tar:Nick().." "..language.GetPhrase( "xdefm.Trade7" )
			elseif tar:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() and tar:GetNWEntity( "XDEFMod_TPL" ) != own then tx2 = tar:Nick().." "..language.GetPhrase( "xdefm.AlTrade" )
			else tx2 = language.GetPhrase( "xdefm."..( tar:GetNWEntity( "XDEFMod_TPL" ) == own and "Trade4" or "Trade3" ) ).." - "..tar:Nick() end
		elseif IsValid( tar ) and tar:IsPlayer() then tx2 = language.GetPhrase( "xdefm.Trade5" ) end
		draw.TextShadow( {
			text = tx2, pos = { scr.x, scr.y +25 },
			font = "xdefm_Font1", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = col
		}, 1, 255 )
	end
else SWEP.ReloadOnce 		= false end
function SWEP:Initialize() self:SetHoldType( "pistol" ) end
function SWEP:Deploy() local own = self.Owner  if SERVER then self.ReloadOnce = false end
	if SERVER and ( !IsValid( own ) or !own:IsPlayer() ) then self:Remove() return end
	local speed = GetConVarNumber( "sv_defaultdeployspeed" ) local vm = own:GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( "seq_admire" ) ) vm:SetPlaybackRate( speed )
	if own:GetNWFloat( "XDEFMod_RTT" ) == 1 then xdefm_Command( own, "TradeToggle", "_" ) end
	return true
end
function SWEP:PrimaryAttack() local own = self.Owner
	if SERVER and ( !IsValid( own ) or !own:IsPlayer() ) then self:Remove() return end
	if CLIENT or self:GetNextPrimaryFire() > CurTime() or self:GetNextSecondaryFire() > CurTime() then return end
	if own:GetNWBool( "XDEFMod_BTD" ) then xdefm_AddNote( own, "xdefm.Trade9", "resource/warning.wav", "cross", 5 ) return false end
	if !istable( own.xdefm_Profile ) or !isnumber( own.xdefm_Profile.UpdA ) then return end
	self:SetNextPrimaryFire( CurTime() +0.25 ) if own:GetNWFloat( "XDEFMod_RTT" ) == 1 then xdefm_Command( own, "TradeToggle", "_" ) end
	if own:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() then own:SetNWEntity( "XDEFMod_TPL", Entity( 0 ) )
		xdefm_SendSnd( own, "buttons/button18.wav" ) return end
	local tr = util.TraceLine( { start = own:EyePos(), endpos = own:EyePos() +own:EyeAngles():Forward()*128, filter = own, mask = MASK_SHOT } )
	local ent = tr.Entity  if !IsValid( ent ) or !ent:IsPlayer() or !ent:Alive() or !util.IsValidModel( ent:GetModel() ) or !ent:HasWeapon( "weapon_xdefm_trade" ) or
	!istable( ent.xdefm_Profile ) or ent:GetNWBool( "XDEFMod_BTD" ) or ent:IsBot() or ( ent:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() and ent:GetNWEntity( "XDEFMod_TPL" ) != own )
	or ent:WorldSpaceCenter():DistToSqr( own:WorldSpaceCenter() ) > 65536 then xdefm_SendSnd( own, "weapons/ar2/ar2_empty.wav" )
	else own:SetNWEntity( "XDEFMod_TPL", ent ) xdefm_SendSnd( own, "buttons/button18.wav" ) end
end
function SWEP:SecondaryAttack() local own = self.Owner
	if SERVER and ( !IsValid( own ) or !own:IsPlayer() ) then self:Remove() return end
	if CLIENT or self:GetNextPrimaryFire() > CurTime() or self:GetNextSecondaryFire() > CurTime() then return end
	if !istable( own.xdefm_Profile ) or !isnumber( own.xdefm_Profile.UpdA ) then return end
	xdefm_SendSnd( own, "buttons/button9.wav" ) xdefm_OpenMenu( own, 0, own.xdefm_Profile )
	if !istable( own.xdefm_Trade ) then own.xdefm_Trade = { "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", 0 } end
	xdefm_OpenMenu( own, 7, own.xdefm_Trade ) self:SetNextPrimaryFire( CurTime() +1 )
	local tdr = own:GetNWEntity( "XDEFMod_TPL" )  if tdr:IsPlayer() and tdr:HasWeapon( self:GetClass() ) and tdr:GetNWEntity( "XDEFMod_TPL" ) == own then
		if !istable( tdr.xdefm_Trade ) then tdr.xdefm_Trade = { "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", 0 } end
		xdefm_UpdateMenu( own, 5, tdr.xdefm_Trade ) xdefm_UpdateMenu( own, 6, { tdr:Nick(), tdr:SteamID64(), tdr:GetNWFloat( "XDEFMod_RTT" ) } )
	end
end
function SWEP:Reload() local own = self.Owner
	if SERVER and ( !IsValid( own ) or !own:IsPlayer() ) then self:Remove() return end if own:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() then return end
	if CLIENT or self:GetNextPrimaryFire() > CurTime() or self:GetNextSecondaryFire() > CurTime() or self.ReloadOnce then return end
	if !istable( own.xdefm_Profile ) or !isnumber( own.xdefm_Profile.UpdA ) then return end local bb = own:GetNWBool( "XDEFMod_BTD" )
	own:SetNWBool( "XDEFMod_BTD", !bb ) xdefm_SendSnd( own, bb and "buttons/button14.wav" or "buttons/button10.wav" )
	self:SetNextPrimaryFire( CurTime() +1 ) self.ReloadOnce = true
	if own:GetNWFloat( "XDEFMod_RTT" ) == 1 then xdefm_Command( own, "TradeToggle", "_" ) end
end
function SWEP:Think() local own = self.Owner  if !IsValid( own ) or !own:IsPlayer() then return end
	self:NextThink( CurTime() +0.1 ) if self.ReloadOnce and !own:KeyDown( IN_RELOAD ) then self.ReloadOnce = false end
	if CLIENT then return true end local tar = own:GetNWEntity( "XDEFMod_TPL" )
	if ( tar:IsPlayer() and ( !tar:Alive() or tar:WorldSpaceCenter():DistToSqr( own:WorldSpaceCenter() ) > 70000 or !tar:HasWeapon( "weapon_xdefm_trade" ) ) )
	or ( !tar:IsPlayer() and tar != Entity( 0 ) ) then
		own:SetNWEntity( "XDEFMod_TPL", Entity( 0 ) )  xdefm_UpdateMenu( own, 6, { "_", nil, false } )
	elseif tar:GetNWFloat( "XDEFMod_RTT" ) == 1 and own:GetNWFloat( "XDEFMod_RTT" ) == 1 and
	( !isnumber( tar.xdefm_Cool ) or tar.xdefm_Cool < CurTime() ) and ( !isnumber( own.xdefm_Cool ) or own.xdefm_Cool < CurTime() ) then
		if !istable( tar.xdefm_Trade ) or !istable( own.xdefm_Trade ) then return true end local aa, bb = tar.xdefm_Trade, own.xdefm_Trade
		tar.xdefm_Trade = bb  own.xdefm_Trade = aa  tar:SetNWInt( "XDEFMod_RTT", 2 )  own:SetNWInt( "XDEFMod_RTT", 2 )
		xdefm_UpdateMenu( own, 5, tar.xdefm_Trade ) xdefm_UpdateMenu( tar, 5, own.xdefm_Trade )
		xdefm_UpdateMenu( own, 4, own.xdefm_Trade ) xdefm_UpdateMenu( tar, 4, tar.xdefm_Trade )
		xdefm_UpdateMenu( tar, 6, { own:Nick(), own:SteamID64(), 2 } ) xdefm_UpdateMenu( own, 6, { tar:Nick(), tar:SteamID64(), 2 } )
		xdefm_AddNote( own, "xdefm.Trade18", "garrysmod/save_load"..math.random( 1, 4 )..".wav", "arrow_refresh", 5 )
		xdefm_AddNote( tar, "xdefm.Trade18", "garrysmod/save_load"..math.random( 1, 4 )..".wav", "arrow_refresh", 5 )
	end return true
end
function SWEP:Holster() local own = self.Owner
	if IsValid( own ) and own:IsPlayer() then own:SetNWEntity( "XDEFMod_TPL", Entity( 0 ) )
	if SERVER then xdefm_UpdateMenu( own, 6, { "_", nil, false } )
	if own:GetNWFloat( "XDEFMod_RTT" ) == 1 then xdefm_Command( own, "TradeToggle", "_" ) end end end return true
end