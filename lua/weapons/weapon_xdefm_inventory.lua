AddCSLuaFile() -- 背包
SWEP.PrintName		= "#xdefm.Weapon_Inventory"
SWEP.Author 		= "LemonCola3424"
SWEP.Purpose 		= "#xdefm.Purpose"
SWEP.Instructions 	= "#xdefm.Instruct3"
SWEP.Category 		= "#xdefm.Category"
SWEP.ViewModelFOV	= 54
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/c_arms.mdl"
SWEP.WorldModel		= "models/weapons/w_package.mdl"
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
	SWEP.FMod_CModel 		= nil
	SWEP.FMod_Name 			= nil
	SWEP.FMod_Cost 			= nil
	SWEP.FMod_Level		 	= nil
	SWEP.FMod_Reason 		= nil
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
	function SWEP:DrawWorldModel() self:DrawModel() end
	function SWEP:DrawHUD() local pro = LocalPlayer().xdefm_Profile  if !IsValid( LocalPlayer() ) or !LocalPlayer():Alive() or
		vgui.CursorVisible() or !istable( pro ) then return end local ply = LocalPlayer()
		if GetConVar( "cl_drawhud" ):GetInt() <= 0 then return end
		local txt = language.GetPhrase( self.PrintName )  surface.SetFont( "xdefm_Font6" )  local ww, hh = surface.GetTextSize( txt )
		draw.RoundedBox( 8, ScrW()/2 -ww/2 -12, ScrH()*0.95 -hh/2 -12, ww +24, hh +24, Color( 0, 0, 0, 128 ) )
		for i=1, 1 do draw.Text( {
			text = txt, pos = { ScrW()/2, ScrH()*0.95 },
			font = "xdefm_Font6", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 55, 255, 255 )
		} ) end
	end
end

function SWEP:Initialize() self:SetHoldType( "slam" ) end
function SWEP:Deploy() local own = self.Owner  if SERVER then self.ReloadOnce = false end
	if SERVER and ( !IsValid( own ) or !own:IsPlayer() ) then self:Remove() return end
	local speed = GetConVarNumber( "sv_defaultdeployspeed" ) local vm = own:GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( "seq_admire" ) ) vm:SetPlaybackRate( speed )
	return true
end
function SWEP:PrimaryAttack() local own = self.Owner
	if SERVER and ( !IsValid( own ) or !own:IsPlayer() ) then self:Remove() return end
	if CLIENT or self:GetNextPrimaryFire() > CurTime() or self:GetNextSecondaryFire() > CurTime() then return end
	if !istable( own.xdefm_Profile ) or !isnumber( own.xdefm_Profile.UpdA ) then return end
	if !own:KeyDown( IN_USE ) then
		xdefm_OpenMenu( own, 0, own.xdefm_Profile ) xdefm_OpenMenu( own, 5, own.xdefm_Profile ) xdefm_SendSnd( own, "buttons/lightswitch2.wav" )
	else
		xdefm_OpenMenu( own, 8, own.xdefm_Profile ) xdefm_SendSnd( own, "buttons/lightswitch2.wav" )
	end
	self:SetNextPrimaryFire( CurTime() + 0.5 )
end
function SWEP:SecondaryAttack() local own = self.Owner
	if SERVER and ( !IsValid( own ) or !own:IsPlayer() ) then self:Remove() return end
	if CLIENT or self:GetNextPrimaryFire() > CurTime() or self:GetNextSecondaryFire() > CurTime() then return end
	if !istable( own.xdefm_Profile ) or !isnumber( own.xdefm_Profile.UpdA ) then return end
	if !own:KeyDown( IN_USE ) then
		xdefm_OpenMenu( own, 0, own.xdefm_Profile ) xdefm_OpenMenu( own, 9, { own.xdefm_Recipe or "_" } ) xdefm_SendSnd( own, "buttons/lightswitch2.wav" )
	else
		if !istable( own.xdefm_Friends ) then xdefm_SetupFriends( own ) end
		xdefm_OpenMenu( own, 6, own.xdefm_Friends ) xdefm_SendSnd( own, "buttons/lightswitch2.wav" )
	end
	self:SetNextPrimaryFire( CurTime() + 0.5 )
end
function SWEP:Reload() end