if CLIENT then local langs = {}
	langs[ "zh-CN" ] = {
		[ "it_wood3" ] = "精木板", [ "dit_wood3" ] = "",
		[ "it_metal3" ] = "合金板", [ "dit_metal3" ] = "",
		[ "it_plastic2" ] = "高级塑料板", [ "dit_plastic2" ] = "",
        [ "it_part" ] = "金属部件", [ "dit_part" ] = "",
        [ "it_part2" ] = "高级金属部件", [ "dit_part2" ] = "",
        [ "it_coffee" ] = "咖啡机", [ "dit_coffee" ] = "放入一瓶水,一包种子和一节电池制作一杯咖啡(图纸).",
        [ "it_meat" ] = "肉", [ "dit_meat" ] = "吃吃吃吃.",
        [ "it_bone" ] = "骨头", [ "dit_bone" ] = "哈人.",
		[ "it_rainbow" ] = "彩虹石", [ "dit_rainbow" ] = "<color=0,0,255>★</color><color=255,0,255>★</color><color=0,255,0>★</color><color=255,255,0>★</color><color=255,0,0>★</color><color=255,255,255>★</color>.",
		[ "it_crafting1" ] = "工作台", [ "dit_crafting1" ] = "用于制作基础物品.",
		[ "it_crafting2" ] = "机械台", [ "dit_crafting2" ] = "用于制作高级物品.",
		[ "it_storage1" ] = "储藏箱", [ "dit_storage1" ] = "可以存放6个物品.",
		[ "it_storage2" ] = "大储藏箱", [ "dit_storage2" ] = "可以存放30个物品.",
		[ "it_error" ] = "被删除物品", [ "dit_error" ] = "拿点鱼币做补偿吧.",
		[ "it_furnace2" ] = "金属熔炉", [ "dit_furnace2" ] = "高级矿石冶炼.",
		[ "it_cquest" ] = "联合军终端", [ "dit_cquest" ] = "上交珍贵物品以获得奖励.",
		[ "it_pshop" ] = "未知传送门", [ "dit_pshop" ] = "可以购买一些稀有物品.",
		[ "it_bouncy" ] = "弹力球", [ "dit_bouncy" ] = "弹性超好的球.",
	}
	langs[ "en" ] = {
		[ "it_wood3" ] = "Wooden Plate", [ "dit_wood3" ] = "",
		[ "it_metal3" ] = "Metal Plate", [ "dit_metal3" ] = "",
		[ "it_plastic2" ] = "Advanced Plastic Plate", [ "dit_plastic2" ] = "",
        [ "it_part" ] = "Metal Part", [ "dit_part" ] = "",
        [ "it_part2" ] = "Advanced Metal Part", [ "dit_part2" ] = "",
		[ "it_coffee" ] = "Coffee Machine", [ "dit_coffee" ] = "Insert water, a seed bag and 1 battery to make coffee(recipe).",
        [ "it_meat" ] = "Meat", [ "dit_meat" ] = "Meaty meat.",
        [ "it_bone" ] = "Bone", [ "dit_bone" ] = "Creepy.",
		[ "it_rainbow" ] = "Rainbow Gem", [ "dit_rainbow" ] = "<color=0,0,255>★</color><color=255,0,255>★</color><color=0,255,0>★</color><color=255,255,0>★</color><color=255,0,0>★</color><color=255,255,255>★</color>.",
		[ "it_crafting1" ] = "Inventor's Table", [ "dit_crafting1" ] = "Craft basic items.",
		[ "it_crafting2" ] = "Machining's Table", [ "dit_crafting2" ] = "Craft advanced items.",
		[ "it_storage1" ] = "Storage Crate", [ "dit_storage1" ] = "Can hold 6 items.",
		[ "it_storage2" ] = "Big Storage Crate", [ "dit_storage2" ] = "Can hold 30 items.",
		[ "it_error" ] = "Deleted Item", [ "dit_error" ] = "Take some money as compensation.",
		[ "it_furnace2" ] = "Metal Furnace", [ "dit_furnace2" ] = "Advanced ore smelting.",
		[ "it_cquest" ] = "Combine Terminal", [ "dit_cquest" ] = "Turn in valuable items for rewards.",
		[ "it_pshop" ] = "Mysterious Portal", [ "dit_pshop" ] = "Buy some rare stuffs.",
		[ "it_bouncy" ] = "Bouncy Ball", [ "dit_bouncy" ] = "It's super bouncy.",
    }
	local ln = GetConVar( "gmod_language" ):GetString()  local lg = "en"
	if ln != nil and istable( langs[ ln ] ) then lg = GetConVar( "gmod_language" ):GetString() end
	for holder, text in pairs( langs[ lg ] ) do language.Add( "xdefm."..holder, text ) end
end

if true then local it = "it_wood3"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_phx/construct/wood/wood_panel1x1.mdl", Helper = "#xdefm.d"..it,
	Rarity = 3, Price = 750, PhysSound = "Wood.ImpactHard" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_metal3"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_phx/construct/metal_plate1.mdl", Helper = "#xdefm.d"..it,
	Rarity = 3, Price = 820, PhysSound = "EpicMetal.ImpactHard" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_plastic2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/hunter/plates/plate1x1.mdl", Helper = "#xdefm.d"..it,
	Rarity = 3, Price = 500, PhysSound = "Plastic_Barrel.ImpactHard" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_part"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_c17/utilityconnecter006.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 500, PhysSound = "SolidMetal.ImpactSoft" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_part2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_c17/utilityconducter001.mdl", Helper = "#xdefm.d"..it,
	Rarity = 3, Price = 3000, PhysSound = "SolidMetal.ImpactHard" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_coffee"
	local ITEM = { Name = "#xdefm."..it, Type = "Struct", Model = "models/props_unique/coffeemachine01.mdl", Helper = "#xdefm.d"..it,
	Rarity = 4, Price = 2650, Carryable = false, TickRate = 1, PhysSound = "Computer.ImpactHard", HelperUse = "xdefm.U3", SType = 2, StartSound = "Buttons.snd4", ExitSound = "NPC.ButtonLatchUnlocked2" }
    ITEM.Crafts = {
		"it_water&ba_seed&it_armor&re_exp",
 		"it_water&ba_seed&it_refill&re_exp",
   }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_meat"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/tysn/tysn_birdmeat_1.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 500, PhysSound = "Watermelon.Impact", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Killed = false end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Health() >= ent:GetMaxHealth() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end local met = xdefm_CookMeter( self:GetFMod_DT() )
		if met >= 0 then ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() +math.ceil( 20*( 1 +met*9 ) ) ) ) end
		ent:EmitSound( "NPC_Barnacle.FinalBite" ) self:Remove() self.xdefm_Used = true return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_bone"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/gibs/hgibs_spine.mdl", "models/gibs/hgibs_rib.mdl", "models/gibs/hgibs_scapula.mdl" }, Helper = "#xdefm.d"..it,
	Rarity = 1, Price = 10, PhysSound = "Body.ImpactSoft" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_rainbow"
	local Mat = Material( "effects/blueflare1" )
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/oc_diving/diamond.mdl",
	Helper = "#xdefm.d"..it, Rarity = 5, Price = 100000, PhysSound = "Weapon_StunStick.Melee_HitWorld", TickRate = 0.01 }
	function ITEM:OnThink( self ) self:SetColor( HSVToColor( ( CurTime()*100 ), 1, 1 ) ) end
	function ITEM:OnDraw( self ) render.SetMaterial( Mat ) local siz, col = 36 +math.sin( CurTime()*2 )*8, self:GetColor()
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, col )
        if ( !isnumber( self.xdefm_Pa1 ) or self.xdefm_Pa1 <= CurTime() ) then self.xdefm_Pa1 = CurTime() +0.05
			if !self.Emit or !IsValid( self.Emit ) then self.Emit = ParticleEmitter( self:WorldSpaceCenter() )
				self:CallOnRemove( "XDEEmitter", function( self ) if self.Emit then self.Emit:Finish() end end )
			else
				local particle = self.Emit:Add( "particle/particle_glow_03_additive", self:WorldSpaceCenter() +VectorRand():GetNormalized()*math.random( 0, 4 ) )
				particle:SetVelocity( VectorRand():GetNormalized()*32 +Vector( 0, 0, 48 ) )
				particle:SetColor( col.r, col.g, col.b )
				particle:SetDieTime( math.Rand( 1, 2 ) )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( 2 )
				particle:SetStartLength( 4 )
				particle:SetEndLength( 4 )
				particle:SetEndSize( 0 )
				particle:SetGravity( Vector( 0, 0, -128 ) )
				particle:SetCollide( true )
				particle:SetBounce( 1 )
			end
			if !isnumber( self.xdefm_Pa2 ) or self.xdefm_Pa2 <= CurTime() then self.xdefm_Pa2 = CurTime() +1
				if !self.xdefm_Emi2 or !IsValid( self.xdefm_Emi2 ) then
					self.xdefm_Emi2 = ParticleEmitter( self:WorldSpaceCenter(), true )
					self:CallOnRemove( "XDEEmitter2", function( self ) if self.Emi2 then self.Emi2:Finish() end end )
				else
					local particle = self.xdefm_Emi2:Add( "particle/particle_ring_wave_addnofog", self:WorldSpaceCenter() )
					particle:SetAngles( Angle( 90, 0, 0 ) )
					particle:SetColor( col.r, col.g, col.b )
					particle:SetDieTime( 2 )
					particle:SetStartAlpha( 192 )
					particle:SetEndAlpha( 0 )
					particle:SetStartSize( 0 )
					particle:SetEndSize( 16 )
					particle:SetPos( self:WorldSpaceCenter() -self:GetUp()*12 )
					particle:SetThinkFunction( function( particle )
						if IsValid( self ) then particle:SetPos( self:WorldSpaceCenter() ) end
						particle:SetNextThink( CurTime() )
					end ) particle:SetNextThink( CurTime() )
				end
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_error"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/hunter/blocks/cube025x025x025.mdl",
	Helper = "#xdefm.d"..it, Rarity = 1, Price = 20000, PhysSound = "citadel.br_no", Carryable = true, CantCook = true }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_crafting1"
	local ITEM = { Name = "#xdefm."..it, Type = "Struct", Model = "models/props_forest/table_shed.mdl", StartSound = "DoorHandles.Locked2", ExitSound = "DoorSound.DefaultLocked",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 1000, PhysSound = "Wood.ImpactHard", Carryable = false, SType = 2, HelperUse = "xdefm.U3" }
    ITEM.Crafts = {
		"it_wood&it_wood&it_wood&it_wood2",
		"it_metal&it_metal&it_metal&it_metal2",
		"it_glass&it_glass&it_glass&it_glass2",
        "it_stone&it_stone&it_stone&it_brick",
		"it_junk&it_junk&it_junk&it_plastic",
		"it_metal&it_copperbar&it_steelbar&it_part",
		"it_wood&it_stone&it_ore&it_chemical",
		"it_metal2&it_coal&it_propane",
		"it_wood&it_stone&it_stone&it_campfire",
		"it_metal2&it_armor&it_stove1",
		"it_wood2&it_furniture1",
		"it_metal2&it_furniture2",
		"it_coal&it_metal&it_pipebomb",
		"it_copperbar&it_glass2&it_armor",
		"it_melon&it_plastic&it_health",
		"it_metal2&it_metal2&it_cage",
		"it_copperbar&it_brick&it_brick&st_furnace",
		"it_paper&it_coal&ba_money",
		"it_stone&it_wood&it_melon&ba_seed",
		"it_metal&it_metal&it_metal&ba_wrench",
		"it_metal2&ba_hook",
		"it_metal2&ba_pan",
		"it_wood2&it_plastic&ba_bread",
		"it_brick&it_brick&ba_skull",
		"it_plastic&it_plastic&ba_box",
		"it_rottenmeat&it_rottenmeat&it_rottenmeat&ba_fish",
		"it_glass2&it_glass2&it_copperbar&ba_lamp",
		"it_metal2&it_steelbar&ba_pickaxe",
    }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_crafting2"
	local ITEM = { Name = "#xdefm."..it, Type = "Struct", Model = "models/props_waterfront/tattoo_table.mdl", StartSound = "DoorHandles.Unlocked2", ExitSound = "Doors.FullClose1",
	Helper = "#xdefm.d"..it, Rarity = 4, Price = 2500, PhysSound = "Metal_Box.ImpactHard", Carryable = false, SType = 2, HelperUse = "xdefm.U3" }
    ITEM.Crafts = {
		"it_wood2&it_wood2&it_wood2&it_wood3",
		"it_brick&it_brick&it_brick&it_brick&it_stone2",
		"it_metal2&it_metal2&it_copperbar&it_metal3",
		"it_plastic&it_glass2&it_plastic&it_barre1&it_plastic2",
		"it_metal2&it_metal2&it_glass2&it_glass3",
		"it_metal2&it_silverbar&it_tungstenbar&it_part2",
		"it_tungstenbar&it_metal2&it_plastic&it_pmetal",
		"it_steelbar&it_metal2&it_glass3&it_cmetal",
		"it_propane&it_steelbar&it_stove3",
		"it_health&it_metal2&it_chealth",
		"it_armor&it_metal2&it_carmor",
		"it_coal&it_leadbar&it_grenade",
		"it_coal&it_tungstenbar&it_flashbang",
		"it_health&it_armor&it_refill",
		"it_chealth&it_carmor&it_csuper",
		"it_glass3&it_copperbar&it_antibird",
		"it_mine1&it_metal2&it_coal&it_mine2",
		"it_leadbar&it_firearm1&it_metal2&it_firearm2",
		"it_leadbar&it_steelbar&it_metal2&it_grinder",
		"it_part&it_metal3&st_printer",
		"it_part&it_propane&it_copperbar&re_furn1|20",
		"it_rottenmeat&it_rottenmeat&it_hula&it_bugs&ba_teddy",
		"it_leadbar&it_metal2&ba_bomb",
		"ba_fish&ba_fish&ba_fish&ba_fish&ba_meat",
		"it_steelbar&it_glass3&ba_c4",
		"it_armor&it_steelbar&it_metal3&ba_drill",
    }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_storage1"
	local ITEM = { Name = "#xdefm."..it, Type = "Struct", Model = "models/props_junk/wood_crate001a.mdl", Amount = 6, StartSound = "AmmoCrate.Open", ExitSound = "AmmoCrate.Close",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 1000, PhysSound = "Wood.ImpactHard", Carryable = false, SType = 1, HelperUse = "xdefm.U3" }
	function ITEM:OnInit( self ) self:SetSkin( 1 ) end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_storage2"
	local ITEM = { Name = "#xdefm."..it, Type = "Struct", Model = "models/props_junk/wood_crate002a.mdl", Amount = 30, StartSound = "AmmoCrate.Open", ExitSound = "AmmoCrate.Close",
	Helper = "#xdefm.d"..it, Rarity = 4, Price = 4500, PhysSound = "Wood.ImpactHard", Carryable = false, SType = 1, HelperUse = "xdefm.U3" }
	function ITEM:OnInit( self ) self:SetSkin( 1 ) end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_furnace2"
	local ITEM = { Name = "#xdefm."..it, Type = "Struct", Model = "models/props/cs_militia/furnace01.mdl", Helper = "#xdefm.d"..it, StartSound = "Metal_Barrel.ImpactSoft", ExitSound = "Metal_Barrel.ImpactHard",
	Rarity = 4, Price = 3000, Carryable = false, PhysSound = "EpicMetal.ImpactSoft", HelperUse = "xdefm.U3", SType = 2 }
	ITEM.Crafts = {
		"it_wood&it_wood&it_wood&it_coal",
		"it_ore&it_ore&it_coal&it_copperbar",
		"it_metal&it_metal&it_coal&it_metal2",
		"it_scrap&it_scrap&it_coal&it_steelbar",
		"it_ejunk&it_ejunk&it_coal&it_tungstenbar",
		"it_coin&it_coin&it_coal&it_silverbar",
		"it_pottery&it_pottery&it_coal&it_potter1",
		"it_potter1&it_potter1&it_coal&it_potter2",
		"it_potter2&it_potter2&it_coal&it_potter3",
		"it_oreblue&it_oreblue&it_coal&it_gemblue",
		"it_orepurple&it_orepurple&it_coal&it_gempurple",
 		"it_oregreen&it_oregreen&it_coal&it_gemgreen",
		"it_orered&it_orered&it_coal&it_gemred",
		"it_orewhite&it_orewhite&it_coal&it_gemwhite",
		"it_copperbar&it_steelbar&it_tungstenbar&it_silverbar&it_goldbar&it_platinumbar&it_rainbowbar",
		"it_gemblue&it_gempurple&it_gemgreen&it_gemred&it_gemwhite&it_rainbow",
	}
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_cquest"
	local ITEM = { Name = "#xdefm."..it, Type = "Struct", Model = "models/props_combine/breenconsole.mdl", Helper = "#xdefm.d"..it,
	Rarity = 5, Price = 5000, Carryable = false, PhysSound = "Computer.ImpactHard", HelperUse = "xdefm.U3", SType = 2, StartSound = "Weapon_AR2.Reload_Rotate", ExitSound = "Weapon_AR2.Reload_Push" }
	ITEM.Crafts = {
		"it_bait3&it_bait3&it_exp3&it_bag4",
		"it_coin2&it_coin2&it_coin2&it_coin2&it_bag4",
		"it_goldbar&it_orewhite&it_goldbar&it_bag4",
		"it_pturre2&it_cturret&it_pturre1&it_bag4",
		"it_gemblue&it_gempurple&it_gemgreen&it_gemred&it_bag4",
		"it_gballoom&it_defib&it_bag4",
		"it_torch&it_figurine&it_cosmogram&it_bag4",
		"cr_pigeon&cr_pigeon&cr_pigeon&cr_pigeon&it_bag4",
		"it_treasure&it_treasure&it_coin2&it_bag4",
		"it_ammocan1&it_ammocan1&it_ammocan1&it_crate3&it_bag4",
	}
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_plate"
	local ITEM = { Name = "#xdefm.Plate", Type = "Struct", Model = "models/props_collectables/piepan.mdl", Amount = 1, StartSound = "GlassBottle.ImpactSoft", ExitSound = "GlassBottle.ImpactHard",
	Helper = "#xdefm.Plate2", Rarity = 2, Price = 100, PhysSound = "GlassBottle.ImpactHard", SType = 1, HelperUse = "xdefm.U3", TickRate = 0.1 }
	function ITEM:OnInit( self ) self.xdefm_Dummy = nil end
	function ITEM:OnInteract( self, ent, typ )
		if typ == -1 then local cls = self.xdefm_T3[ 1 ]
			if isstring( cls ) and cls != "_" then
			if IsValid( self.xdefm_Dummy ) then self.xdefm_Dummy:Remove() end
			local ite = xdefm_DummySpawn( cls, self:GetPos(), self:GetAngles(), self:GetFMod_OW() )
			if IsValid( ite ) then ite:SetPos( self:WorldSpaceCenter() +self:GetUp()*8 ) ite:SetParent( self ) self.xdefm_Dummy = ite end end
		end
	end
	function ITEM:OnThink( self ) if IsValid( self.xdefm_Dummy ) then self.xdefm_Dummy:SetAngles( self:LocalToWorldAngles( Angle( 0, CurTime()*10, 0 ) ) ) end end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_pshop"
	local Ma2 = Material( "effects/exit1" )
	local ITEM = { Name = "#xdefm."..it, Type = "Struct", Model = "models/props_lab/teleplatform.mdl", Helper = "#xdefm.d"..it,
	Rarity = 5, Price = 7500, Carryable = false, PhysSound = "EpicMetal_Heavy.ImpactHard", HelperUse = "xdefm.U3", SType = 3, StartSound = "Weapon_PhysCannon.Charge", ExitSound = "Weapon_PhysCannon.Drop" }
	ITEM.Shop = { [ "it_recipe1" ] = { 1500, 25 }, [ "it_recipe2" ] = { 3750, 25 }, [ "it_stove3" ] = { 3750, 25 },
	[ "re_toolbox|10" ] = { 1000, 25 }, [ "it_antibird" ] = { 2500, 25 }, [ "it_part2" ] = { 15000, 25 }, [ "it_flower" ] = { 2000, 25 },
	[ "it_recipe3" ] = { 6000, 25 }, [ "it_pturre1" ] = { 11250, 25 }, [ "it_cturret" ] = { 9000, 25 }, [ "it_bust" ] = { 18000, 25 }, [ "it_tesla" ] = { 20000, 25 } }
	if CLIENT then -- xdefm_beam
	local EFFECT = {}
		function EFFECT:Init( data )
			self.StartPos = data:GetStart()
			self.EndPos = data:GetOrigin()
			self.Parts = {}  self.Part2 = {}
			self.Size = math.Rand( 8, 16 )
			local par = math.random( 8, 12 )
			for i=0, par-1 do
				table.insert( self.Parts, self.StartPos +( self.EndPos -self.StartPos )*( i/par ) +VectorRand():GetNormalized() )
			end
			self:SetRenderBoundsWS( self.StartPos, self.EndPos )
			self.MaxLife = math.Rand( 0.5, 1 )
			self.Life = SysTime() +self.MaxLife
		end
		function EFFECT:Think() return self.Life > SysTime() end
		local Mat = Material( "sprites/rollermine_shock" )
		function EFFECT:Render()
			local per = math.Clamp( ( self.Life -SysTime() )/self.MaxLife, 0, 1 )
			render.SetMaterial( Mat )
			render.StartBeam( #self.Parts )
				for i=1, #self.Parts do
					self.Parts[ i ] = self.Parts[ i ] +( i == 1 and Vector( 0, 0, 0 ) or ( Vector( 0, 0, 0.1 ) +VectorRand():GetNormalized() ) )
					render.AddBeam( self.Parts[ i ], self.Size*per*( 1 -i/#self.Parts )*per, 2, Color( 255*per, 255*per, 0*per ) )
				end
			render.EndBeam()
		end
		effects.Register( EFFECT, "xdefm_beam" )
	end
	function ITEM:OnDraw( self ) render.SetMaterial( Ma2 ) local siz, col = 72 +math.sin( CurTime()*2 )*8, self:GetColor()
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, col )
        if ( !isnumber( self.xdefm_Pa1 ) or self.xdefm_Pa1 <= CurTime() ) then self.xdefm_Pa1 = CurTime() +math.Rand( 0.1, 0.3 )
			local ef = EffectData()  ef:SetStart( self:WorldSpaceCenter() )
			ef:SetOrigin( util.QuickTrace( self:WorldSpaceCenter(), VectorRand():GetNormalized()*128, self ).HitPos )
			util.Effect( "xdefm_beam", ef )
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_bouncy"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/maxofs2d/hover_classic.mdl",
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 180, PhysSound = "Rubber_Tire.ImpactHard" }
	function ITEM:OnInit( self ) end function ITEM:OnReady( self ) self:GetPhysicsObject():SetMaterial( "metal_bouncy" ) end
	function ITEM:OnCollide( self, dat ) local phy = self:GetPhysicsObject()
		local LastSpeed = math.max( dat.OurOldVelocity:Length(), dat.Speed )
		local NewVelocity = phy:GetVelocity():GetNormalized()
		LastSpeed = math.max( NewVelocity:Length(), LastSpeed ) phy:SetVelocity( NewVelocity*LastSpeed )
		local ent = dat.HitEntity  if IsValid( ent ) and dat.Speed >= 120 and dat.DeltaTime > 0.2 and ( ent:IsPlayer() or ent:IsNPC() ) then
			local dmg = DamageInfo()  local vel = ( ent:GetPos() -self:GetPos() ):GetNormalized()*100
			dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( vel*100 ) dmg:SetAttacker( self:GetFMod_OW() )
			dmg:SetInflictor( self ) dmg:SetDamage( 2 ) ent:TakeDamageInfo( dmg ) ent:EmitSound( "Flesh.ImpactHard" ) ent:SetVelocity( vel*10 )
			local ef = EffectData() ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetEntity( self ) ef:SetRadius( 1 )
			ef:SetScale( 1 ) ef:SetMagnitude( 1 ) util.Effect( "GlassImpact", ef )
		end
	end
	xdefm_ItemRegister( it, ITEM )
end