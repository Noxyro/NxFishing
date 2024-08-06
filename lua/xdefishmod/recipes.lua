if CLIENT then local langs = {}
	langs[ "zh-CN" ] = {
		[ "re_basic" ] = "材料图纸", [ "dre_basic" ] = "用垃圾制作材料.",
		[ "re_tool1" ] = "基础物品图纸", [ "dre_tool1" ] = "制作基础工具.",
		[ "re_tool2" ] = "进阶物品图纸", [ "dre_tool2" ] = "制作进阶工具.",
		[ "re_tool3" ] = "高级物品图纸", [ "dre_tool3" ] = "制作高级工具.",
		[ "re_bait1" ] = "基础鱼饵图纸", [ "dre_bait1" ] = "制作普通和罕见鱼饵.",
		[ "re_bait2" ] = "进阶鱼饵图纸", [ "dre_bait2" ] = "制作稀有鱼饵.",
		[ "re_bait3" ] = "高级鱼饵图纸", [ "dre_bait3" ] = "制作史诗鱼饵.",
		[ "re_furn1" ] = "迷你熔炉", [ "dre_furn1" ] = "熔炼矿石.",
		[ "re_spec" ] = "特殊物品图纸", [ "dre_spec" ] = "制作联合军和传送门的物品.",
		[ "re_crate" ] = "箱子图纸", [ "dre_crate" ] = "制作能打碎的箱子.",
		[ "re_luck" ] = "幸运", [ "dre_luck" ] = "<color=255,255,0>你撞上了两万分之一的几率!</color>",
		[ "re_advance" ] = "进阶材料图纸", [ "dre_advance" ] = "制作稀有材料.",
		[ "re_exp" ] = "咖啡", [ "dre_exp" ] = "给你熬夜写作的动力.",
		[ "re_meat" ] = "刀", [ "dre_meat" ] = "拿着它让你觉得啥都能做得出来...吗?",
		[ "re_misc" ] = "小物件图纸", [ "dre_misc" ] = "制作罕见小物件.",
		[ "re_recycle" ] = "垃圾回收桶", [ "dre_recycle" ] = "变废为宝.",
		[ "re_toolbox" ] = "工具箱", [ "dre_toolbox" ] = "制作一些设施.",
	}
	langs[ "en" ] = {
		[ "re_basic" ] = "Material Recipe", [ "dre_basic" ] = "Craft materials with junks.",
		[ "re_tool1" ] = "Basic Item Recipe", [ "dre_tool1" ] = "Craft basic tools.",
		[ "re_tool2" ] = "Improved Item Recipe", [ "dre_tool2" ] = "Craft improved tools.",
		[ "re_tool3" ] = "Advanced Item Recipe", [ "dre_tool3" ] = "Craft advanced tools.",
		[ "re_bait1" ] = "Basic Bait Recipe", [ "dre_bait1" ] = "Craft common and uncommon baits.",
		[ "re_bait2" ] = "Improved Bait Recipe", [ "dre_bait2" ] = "Craft rare baits.",
		[ "re_bait3" ] = "Advanced Bait Recipe", [ "dre_bait3" ] = "Craft epic baits.",
		[ "re_furn1" ] = "Mini Furnace", [ "dre_furn1" ] = "Smelt ores.",
		[ "re_spec" ] = "Special Item Recipe", [ "dre_spec" ] = "Craft Combine and Portal Items.",
		[ "re_crate" ] = "Crate Recipe", [ "dre_crate" ] = "Craft smashable crates.",
		[ "re_luck" ] = "Luck", [ "dre_luck" ] = "<color=255,255,0>There's a 1 in 20,000 chance you've got it!</color>",
		[ "re_advance" ] = "Advanced Material Recipe", [ "dre_advance" ] = "Craft rare materials.",
		[ "re_exp" ] = "Coffee", [ "dre_exp" ] = "Gives you motivation to stay up late writing.",
		[ "re_meat" ] = "Knife", [ "dre_meat" ] = "Holding it makes you feel like you can do anything?",
		[ "re_misc" ] = "Misc Item Recipe", [ "dre_misc" ] = "Craft uncommon misc items.",
		[ "re_recycle" ] = "Junk Recycler", [ "dre_recycle" ] = "Turns junks into materials.",
		[ "re_toolbox" ] = "Tool Box", [ "dre_toolbox" ] = "Craft some structures.",
	}
	local ln = GetConVar( "gmod_language" ):GetString()  local lg = "en"
	if ln != nil and istable( langs[ ln ] ) then lg = GetConVar( "gmod_language" ):GetString() end
	for holder, text in pairs( langs[ lg ] ) do language.Add( "xdefm."..holder, text ) end
end

if true then local it = "re_toolbox"
	local ITEM = { Name = "#xdefm."..it, Type = "Recipe", Model = "models/static/nmrih_tool_box_01.mdl", Helper = "#xdefm.d"..it, Rarity = 2, Durability = 10,
    PhysSound = "SolidMetal.ImpactSoft", Price = 1000 }
    ITEM.Crafts = {
		"it_part&it_stone2&it_stone2&it_stone2&it_furnace1",
		"it_part&it_propane&it_steelbar&it_stove3",
		"it_part&it_wood2&it_wood2&it_wood2&it_crafting1",
		"it_crate1&it_metal2&it_wood2&it_wood2&it_storage1",
		"it_part2&it_metal3&it_metal3&it_metal3&it_furnace2",
		"it_propane&it_part2&it_metal3&it_stove4",
		"it_part2&it_metal3&it_metal3&it_metal3&it_crafting2",
		"it_crate2&it_wood3&it_wood3&it_wood3&it_storage2",
    }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "re_basic"
	local ITEM = { Name = "#xdefm."..it, Type = "Recipe", Model = "models/props_c17/paper01.mdl", Helper = "#xdefm.d"..it, Rarity = 1, Durability = 25,
    PhysSound = "Cardboard.ImpactSoft", Price = 100 }
    ITEM.Crafts = {
		"it_wood&it_wood&it_wood&it_wood2",
		"it_metal&it_metal&it_metal&it_metal2",
		"it_glass&it_glass&it_glass&it_glass2",
        "it_stone&it_stone&it_stone&it_brick",
		"it_junk&it_junk&it_junk&it_plastic",
		"it_metal&it_copperbar&it_steelbar&it_part",
		"it_wood&it_stone&it_ore&it_chemical",
    }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "re_tool1"
	local ITEM = { Name = "#xdefm."..it, Type = "Recipe", Model = "models/props_c17/paper01.mdl", Helper = "#xdefm.d"..it, Rarity = 1, Durability = 10,
    PhysSound = "Cardboard.ImpactSoft", Price = 150 }
    ITEM.Crafts = {
		"it_metal2&it_coal&it_propane",
		"it_wood&it_stone&it_stone&it_campfire",
		"it_metal2&it_armor&it_stove1",
		"it_wood2&it_furniture1",
		"it_metal2&it_furniture2",
		"it_coal&it_metal&it_pipebomb",
		"it_copperbar&it_glass2&it_armor",
		"it_melon&it_plastic&it_health",
		"it_metal2&it_metal2&it_cage",
		"it_copperbar&it_brick&it_brick&it_furnace",
    }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "re_bait1"
	local ITEM = { Name = "#xdefm."..it, Type = "Recipe", Model = "models/props_c17/paper01.mdl", Helper = "#xdefm.d"..it, Rarity = 1, Durability = 20,
    PhysSound = "Cardboard.ImpactSoft", Price = 100 }
    ITEM.Crafts = {
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
if true then local it = "re_furn1"
	local ITEM = { Name = "#xdefm."..it, Type = "Recipe", Model = "models/props_lab/powerbox02a.mdl", Helper = "#xdefm.d"..it, Rarity = 2, Durability = 20,
    PhysSound = "Cardboard.ImpactSoft", Price = 600 }
    ITEM.Crafts = {
		"it_wood&it_wood&it_wood&it_coal",
		"it_pottery&it_pottery&it_potter1",
		"it_ore&it_ore&it_coal&it_copperbar",
		"it_scrap&it_scrap&it_coal&it_steelbar",
		"it_ejunk&it_ejunk&it_coal&it_tungstenbar",
		"it_coin&it_coin&it_coal&it_silverbar",
   }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "re_luck"
	local ITEM = { Name = "#xdefm."..it, Type = "Recipe", Model = "models/props_c17/playgroundTick-tack-toe_block01a.mdl", Helper = "#xdefm.d"..it, Rarity = 5, Durability = 1,
    PhysSound = "Cardboard.ImpactSoft", Price = 2500 }
    ITEM.Crafts = {
		"it_junk&it_recipe3",
		"it_junk&it_cturret",
		"it_junk&it_exp3",
		"it_junk&it_vault",
		"it_junk&it_microwave",
   }
	local Mat = Material( "sprites/light_glow02_add" ) Mat:SetInt( "$ignorez", 1 )
	function ITEM:OnDraw( self )
		render.SetMaterial( Mat ) local siz = 40 +math.sin( CurTime()*5 )*5
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( 255, 255, 55 ) )
		if !self.Emitter then self.Emitter = ParticleEmitter( self:WorldSpaceCenter() )
			self:CallOnRemove( "XDEEmitter", function( self ) if self.Emitter then self.Emitter:Finish() end end )
		end
		if !isnumber( self.xdefm_Ptc ) or self.xdefm_Ptc <= CurTime() then self.xdefm_Ptc = CurTime() +0.1
			local particle = self.Emitter:Add( "sprites/glow04_noz", self:WorldSpaceCenter() +VectorRand():GetNormalized()*10 )
			particle:SetVelocity( Vector( 0, 0, 0 ) )
			particle:SetLifeTime( 0 )
			particle:SetDieTime( math.Rand( 1, 2 ) )
			particle:SetStartAlpha( 255 )
			particle:SetEndAlpha( 0 )
			local Size = math.Rand( 2, 4 )
			particle:SetStartSize( Size )
			particle:SetEndSize( 0 )		
			particle:SetRoll( math.random( 0, 360 ) )
			particle:SetAirResistance( 200 )
			particle:SetGravity( VectorRand():GetNormalized()*32 )
			particle:SetColor( 255, 255, 55 )
			particle:SetCollide( false )
			particle:SetBounce( 0 )
			particle:SetLighting( false )
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "re_tool2"
	local ITEM = { Name = "#xdefm."..it, Type = "Recipe", Model = "models/props_c17/paper01.mdl", Helper = "#xdefm.d"..it, Rarity = 2, Durability = 10,
    PhysSound = "Cardboard.ImpactSoft", Price = 250 }
    ITEM.Crafts = {
		"it_part&it_propane&it_steelbar&it_stove3",
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
		"it_part&it_metal3&it_printer",
		"it_part&it_propane&it_copperbar&re_furn1|20",
    }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "re_bait2"
	local ITEM = { Name = "#xdefm."..it, Type = "Recipe", Model = "models/props_c17/paper01.mdl", Helper = "#xdefm.d"..it, Rarity = 2, Durability = 20,
    PhysSound = "Cardboard.ImpactSoft", Price = 350 }
    ITEM.Crafts = {
		"it_rottenmeat&it_rottenmeat&it_hula&it_bugs&ba_teddy",
		"it_leadbar&it_metal2&ba_bomb",
		"ba_fish&ba_fish&ba_fish&ba_fish&ba_meat",
		"it_steelbar&it_glass3&ba_c4",
		"it_armor&it_steelbar&it_metal3&ba_drill",
    }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "re_tool3"
	local ITEM = { Name = "#xdefm."..it, Type = "Recipe", Model = "models/props_c17/paper01.mdl", Helper = "#xdefm.d"..it, Rarity = 3, Durability = 10,
    PhysSound = "Cardboard.ImpactSoft", Price = 800 }
    ITEM.Crafts = {
		"it_propane&it_part2&it_metal3&it_stove4",
		"it_metal3&it_part2&it_refill&it_coffee",
		"it_metal3&it_ammocan1&it_ammocan1&it_ammocan1&it_supply",
		"it_metal3&it_water&it_tungstenbar&it_refill&it_vending",
		"it_metal3&it_carmor&it_tungstenbar&it_server",
		"it_metal3&it_chealth&it_tungstenbar&it_miner",
		"it_propane&it_plastic2&it_part2&it_stove5",
		"it_copperbar&it_metal3&it_part2&it_tesla",
		"it_metal3&it_gemgreen&it_gemred&it_gemwhite&it_pot",
		"it_rainbowbar&it_gemwhite&it_part2&it_metal3&it_auto",
    }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "re_bait3"
	local ITEM = { Name = "#xdefm."..it, Type = "Recipe", Model = "models/props_c17/paper01.mdl", Helper = "#xdefm.d"..it, Rarity = 3, Durability = 20,
    PhysSound = "Cardboard.ImpactSoft", Price = 1000 }
    ITEM.Crafts = {
		"it_csuper&it_metal3&it_goldbar&ba_combine",
		"it_glass3&it_plastic2&it_platinumbar&ba_portal",
		"it_steelbar&it_metal3&it_part2&ba_magnet",
    }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "re_spec"
	local ITEM = { Name = "#xdefm."..it, Type = "Recipe", Model = "models/props_c17/paper01.mdl", Helper = "#xdefm.d"..it, Rarity = 3, Durability = 5,
    PhysSound = "Cardboard.ImpactSoft", Price = 850 }
    ITEM.Crafts = {
		"it_cmetal&it_cmetal&it_part2&it_ccore",
		"it_cmetal&it_cmetal&it_leadbar&it_chopper",
		"it_cmetal&it_refill&it_radio&it_cscanner",
		"it_cmetal&it_cmetal&it_csuper&it_firearm2&it_cutrret",
		"it_cmetal&it_cmetal&it_csuper&it_part2&it_cthumper",
		"it_pmetal&it_pmetal&it_plastic2&it_pcube",
		"it_pmetal&it_firearm1&it_pturre2",
		"it_pmetal&it_pmetal&it_pcube&it_firearm2&it_pturre1",
		"it_pmetal&it_pmetal&it_platinumbar&it_plastic2&it_pcore",
    }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "re_crate"
	local ITEM = { Name = "#xdefm."..it, Type = "Recipe", Model = "models/props_c17/paper01.mdl", Helper = "#xdefm.d"..it, Rarity = 2, Durability = 10,
    PhysSound = "Cardboard.ImpactSoft", Price = 500 }
    ITEM.Crafts = {
		"it_brick&it_ore&it_ore&it_ore&it_rock",
		"it_coin&it_coin&it_metal2&it_register",
		"it_wood2&it_wood2&it_steelbar&it_crate1",
		"it_crate1&it_crate1&it_crate2",
		"it_wood2&it_coal&it_leadbar&it_crate3",
		"it_metal2&it_part&it_fridge",
    }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "re_advance"
	local ITEM = { Name = "#xdefm."..it, Type = "Recipe", Model = "models/props_c17/paper01.mdl", Helper = "#xdefm.d"..it, Rarity = 2, Durability = 20,
    PhysSound = "Cardboard.ImpactSoft", Price = 400 }
    ITEM.Crafts = {
		"it_wood2&it_wood2&it_wood2&it_wood3",
		"it_brick&it_brick&it_brick&it_brick&it_stone2",
		"it_metal2&it_metal2&it_copperbar&it_metal3",
		"it_plastic&it_glass2&it_plastic&it_barre1&it_plastic2",
		"it_metal2&it_metal2&it_glass2&it_glass3",
		"it_metal2&it_silverbar&it_tungstenbar&it_part2",
		"it_tungstenbar&it_metal2&it_plastic&it_pmetal",
		"it_steelbar&it_metal2&it_glass3&it_cmetal",
    }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "re_exp"
	local ITEM = { Name = "#xdefm."..it, Type = "Recipe", Model = "models/props_junk/garbage_coffeemug001a_fullsheet.mdl", Helper = "#xdefm.d"..it, Rarity = 3, Durability = 5,
    PhysSound = "GlassBottle.ImpactSoft", Price = 250 }
    ITEM.Crafts = {
		"it_paper&it_paper&it_expr",
		"it_expr&it_expr&it_expr&it_expr&it_exps",
		"it_expr&it_expr&it_expr&it_exp1",
		"it_exp1&it_exp1&it_exp1&it_exp1&it_exp2",
		"it_exp2&it_exp2&it_exp3",
		"it_exp3&it_exp3&it_exp4",
   }
	function ITEM:OnDraw( self )
		if !self.Emitter then self.Emitter = ParticleEmitter( self:WorldSpaceCenter() )
			self:CallOnRemove( "XDEEmitter", function( self ) if self.Emitter then self.Emitter:Finish() end end )
		end
		if !isnumber( self.xdefm_Ptc ) or self.xdefm_Ptc <= CurTime() then self.xdefm_Ptc = CurTime() +0.1
			local particle = self.Emitter:Add( "particle/particle_smokegrenade", self:GetPos() +self:GetUp()*2 -self:GetRight()*1 )
			particle:SetVelocity( Vector( 0, 0, 16 ) +VectorRand():GetNormalized()*2 )
			particle:SetLifeTime( 0 )
			particle:SetDieTime( math.Rand( 1, 2 ) )
			particle:SetStartAlpha( 155 )
			particle:SetEndAlpha( 0 )
			local Size = math.Rand( 2, 4 )
			particle:SetStartSize( Size )
			particle:SetEndSize( 0 )		
			particle:SetRoll( math.random( 0, 360 ) )
			particle:SetRollDelta( math.Rand( -1, 1 ) )
			particle:SetAirResistance( 200 )
			particle:SetGravity( VectorRand():GetNormalized()*16 )
			particle:SetColor( 200, 200, 200 )
			particle:SetCollide( false )
			particle:SetBounce( 0 )
			particle:SetLighting( false )
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "re_meat"
	local ITEM = { Name = "#xdefm."..it, Type = "Recipe", Model = "models/weapons/w_knife_ct.mdl", Helper = "#xdefm.d"..it, Rarity = 3, Durability = 10,
    PhysSound = "SolidMetal.ImpactSoft", Price = 500 }
    ITEM.Crafts = {
		"cr_seagull&it_meat",
		"cr_crow&it_meat",
		"cr_pigeon&it_meat",
		"it_meat&it_rottenmeat&it_bone&it_corpse",
		"it_meat&cr_fish|1",
		"it_meat&cr_gold|1",
		"it_meat&it_meat&cr_perch|1",
		"it_meat&it_meat&ba_meat&cr_cute|1",
		"it_meat&it_meat&it_bone&cr_seagull|1",
		"it_meat&it_meat&it_meat&cr_crow|1",
    }
	function ITEM:OnCollide( self, dat )
		if dat.Speed >= 120 and dat.DeltaTime > 0.25 and self:IsPlayerHolding() then local ent = dat.HitEntity
			if IsValid( ent ) and !ent:IsWorld() and util.IsValidModel( ent:GetModel() ) and ent != self:GetFMod_LU() then
				local dmg = DamageInfo()  dmg:SetDamagePosition( dat.HitPos ) dmg:SetDamageForce( dat.HitNormal*1000 )
				dmg:SetDamageType( DMG_SLASH ) dmg:SetAttacker( self:GetFMod_OW() ) dmg:SetInflictor( self )
				dmg:SetDamage( 15 ) ent:TakeDamageInfo( dmg ) self:EmitSound( "weapons/knife/knife_hit"..math.random( 1, 4 )..".wav" )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "re_misc"
	local ITEM = { Name = "#xdefm."..it, Type = "Recipe", Model = "models/props_c17/paper01.mdl", Helper = "#xdefm.d"..it, Rarity = 2, Durability = 20,
    PhysSound = "Cardboard.ImpactSoft", Price = 300 }
    ITEM.Crafts = {
		"it_junk&it_junk&it_junk&it_shoe",
		"it_metal2&it_coal&it_mine1",
		"it_wood2&it_hula",
		"it_wood&it_stone&it_water&it_cactus",
		"it_metal2&it_grenade&it_combine",
		"ba_fish&it_wood2&it_bugs",
		"it_tungstenbar&it_monitor",
		"it_plastic&it_metal&it_bouncy",
    }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "re_recycle" --17
	local ITEM = { Name = "#xdefm."..it, Type = "Recipe", Model = "models/props_junk/plasticbucket001a.mdl", Helper = "#xdefm.d"..it, Rarity = 3, Durability = 40,
    PhysSound = "Plastic_Barrel.ImpactSoft", Price = 500 }
    ITEM.Crafts = {
		"it_wood&it_junk",
		"it_glass&it_junk",
		"it_stone&it_junk",
		"it_metal&it_junk",
		"it_junk&it_junk&it_junk&it_wood",
		"it_junk&it_junk&it_junk&it_glass",
		"it_junk&it_junk&it_junk&it_stone",
		"it_junk&it_junk&it_junk&it_metal",
    }
	xdefm_ItemRegister( it, ITEM )
end