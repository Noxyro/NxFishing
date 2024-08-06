if CLIENT then local langs = {}
	langs[ "zh-CN" ] = {
		[ "ba_junk" ] = "海之唾弃", [ "dba_junk" ] = "一背包垃圾对你而言还不够吗.",
		[ "ba_money" ] = "钞票", [ "dba_money" ] = "钓起金钱,一张票子钓起一把票子.",
		[ "ba_skull" ] = "头骨", [ "dba_skull" ] = "钓起死物与猎头蟹.",
		[ "ba_pan" ] = "铁锅", [ "dba_pan" ] = "钓起锅炉.",
		[ "ba_hook" ] = "大钩子", [ "dba_hook" ] = "钓起材料和一些图纸.",
		[ "ba_wrench" ] = "扳手", [ "dba_wrench" ] = "钓起各种家具.",
		[ "ba_seed" ] = "种子", [ "dba_seed" ] = "钓起各种水果,因为我找不到蔬菜的模型.",
		[ "ba_fish" ] = "小肉丸", [ "dba_fish" ] = "钓起普通的鱼类,能出啥叉子呢?",
		[ "ba_bomb" ] = "炸弹片", [ "dba_bomb" ] = "钓起各种炸弹.",
		[ "ba_pickaxe" ] = "矿镐", [ "dba_pickaxe" ] = "钓起金属矿锭和宝石.",
		[ "ba_lamp" ] = "台灯", [ "dba_lamp" ] = "钓起各种机械.",
		[ "ba_box" ] = "纸箱", [ "dba_box" ] = "钓起杂物.",
		[ "ba_teddy" ] = "泰迪熊", [ "dba_teddy" ] = "钓起奇异物品.",
		[ "ba_meat" ] = "肉块", [ "dba_meat" ] = "钓起各种生物,包括鱼龙.",
		[ "ba_c4" ] = "C4", [ "dba_c4" ] = "钓起各种武器,不要跟游戏讲科学.",
		[ "ba_bread" ] = "午餐袋", [ "dba_bread" ] = "来猜猜看水下有没有面包房.",
		[ "ba_drill" ] = "钻头", [ "dba_drill" ] = "钓起更好的矿锭和宝石.",
		[ "ba_combine" ] = "奇异零件", [ "dba_combine" ] = "钓起联合军物品.",
		[ "ba_portal" ] = "球", [ "dba_portal" ] = "钓起光圈科技物品.",
		[ "ba_magnet" ] = "磁铁", [ "dba_magnet" ] = "提升钓起箱子的几率.",
		[ "ba_gmod" ] = "娃娃", [ "dba_gmod" ] = "通用鱼饵,可以钓起任何物品.",
	}
	langs[ "en" ] = {
		[ "ba_junk" ] = "Basket", [ "dba_junk" ] = "A full inventory of junks isn't enough for you?",
		[ "ba_money" ] = "Bank Note", [ "dba_money" ] = "Catch more notes with a note.",
		[ "ba_skull" ] = "Skull", [ "dba_skull" ] = "Catch dead things and headcrabs.",
		[ "ba_pan" ] = "Pan", [ "dba_pan" ] = "Catch stoves.",
		[ "ba_hook" ] = "Giant Hook", [ "dba_hook" ] = "Catch crafting materials and some recipes.",
		[ "ba_wrench" ] = "Wrench", [ "dba_wrench" ] = "Catch furnitures.",
		[ "ba_seed" ] = "Seed Bag", [ "dba_seed" ] = "Catch fruits, because I can't find any vegetable models.",
		[ "ba_fish" ] = "Meatball", [ "dba_fish" ] = "Catch regular fishes, what could be wrong?",
		[ "ba_bomb" ] = "Bomb Shard", [ "dba_bomb" ] = "Catch all kinds of explosives.",
		[ "ba_pickaxe" ] = "Pickaxe", [ "dba_pickaxe" ] = "Catch gems and metal ingots.",
		[ "ba_lamp" ] = "Desk Lamp", [ "dba_lamp" ] = "Catch random machines.",
		[ "ba_box" ] = "Box", [ "dba_box" ] = "Catch random stuffs.",
		[ "ba_teddy" ] = "Teddy Bear", [ "dba_teddy" ] = "Catch strange things.",
		[ "ba_meat" ] = "Meat Chunk", [ "dba_meat" ] = "Catch all kinds of creatures, including ichthyosaurs.",
		[ "ba_c4" ] = "C4", [ "dba_c4" ] = "Catch ammo and firearms. It's a game so it's OK.",
		[ "ba_bread" ] = "Lunch Bag", [ "dba_bread" ] = "Check if there's a bakery underwater.",
		[ "ba_drill" ] = "Drill", [ "dba_drill" ] = "Catch better gems and ingots.",
		[ "ba_combine" ] = "Power Core", [ "dba_combine" ] = "Catch Combine objects.",
		[ "ba_portal" ] = "Ball", [ "dba_portal" ] = "Catch Aperture Science objects.",
		[ "ba_magnet" ] = "Magnet", [ "dba_magnet" ] = "Increase the chance to catch crates.",
		[ "ba_gmod" ] = "Companion Doll", [ "dba_gmod" ] = "Universal bait that catches everything.",
	}
	local ln = GetConVar( "gmod_language" ):GetString()  local lg = "en"
	if ln != nil and istable( langs[ ln ] ) then lg = GetConVar( "gmod_language" ):GetString() end
	for holder, text in pairs( langs[ lg ] ) do language.Add( "xdefm."..holder, text ) end
end
if true then local it = "ba_junk"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/props_junk/PlasticCrate01a.mdl", Helper = "#xdefm.d"..it, Rarity = 1, Consume = 20,
	PhysSound = "Plastic_Box.ImpactSoft", Level = 0 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_junk", 0, 0 )
end
if true then local it = "ba_money"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/props/cs_assault/dollar.mdl", Helper = "#xdefm.d"..it, Rarity = 1, Consume = 20,
	PhysSound = "Cardboard.ImpactSoft", Level = 0, Price = 150 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_money", 0, 300 )
end
if true then local it = "ba_seed"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/props_lab/box01a.mdl", Helper = "#xdefm.d"..it, Rarity = 1, Consume = 20,
	PhysSound = "Sand.BulletImpact", Level = 0, Price = 300 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_seed", 0, 600 )
end
if true then local it = "ba_wrench"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/props_c17/tools_wrench01a.mdl", Helper = "#xdefm.d"..it, Rarity = 1, Carryable = true, Consume = 20,
	PhysSound = "Weapon_Crowbar.Melee_HitWorld", Level = 0, Price = 325 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_wrench", 0, 750 )
end
if true then local it = "ba_pan"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/props_c17/metalPot002a.mdl", Helper = "#xdefm.d"..it, Rarity = 1, Consume = 20,
	PhysSound = "MetalGrate.BulletImpact", Level = 5, Price = 500 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_pan", 5, 1000 )
end
if true then local it = "ba_hook"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/props_junk/meathook001a.mdl", Helper = "#xdefm.d"..it, Rarity = 1, Consume = 10,
	PhysSound = "Metal.BulletImpact", Level = 0, Price = 500 }
	function ITEM:OnCollide( self, dat )
		if dat.Speed >= 120 and dat.DeltaTime > 0.25 and self:IsPlayerHolding() then local ent = dat.HitEntity
			if IsValid( ent ) and !ent:IsWorld() and util.IsValidModel( ent:GetModel() ) and ent != self:GetFMod_LU() then
				local dmg = DamageInfo()  dmg:SetDamagePosition( dat.HitPos ) dmg:SetDamageForce( dat.HitNormal*1000 )
				dmg:SetDamageType( DMG_SLASH ) dmg:SetAttacker( self:GetFMod_OW() ) dmg:SetInflictor( self )
				dmg:SetDamage( 30 ) ent:TakeDamageInfo( dmg ) self:EmitSound( "physics/metal/sawblade_stick"..math.random( 1, 3 )..".wav" )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_hook", 0, 1000 )
end
if true then local it = "ba_skull"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/Gibs/HGIBS.mdl", Helper = "#xdefm.d"..it, Rarity = 2, Consume = 20,
	PhysSound = "Flesh.ImpactSoft", Level = 8, Price = 750 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_skull", 8, 1500 )
end
if true then local it = "ba_bread"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/props_2fort/lunchbag.mdl", Price = 1000,
	Helper = "#xdefm.d"..it, Rarity = 2, Consume = 20, PhysSound = "Cardboard.ImpactSoft", Level = 6 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_bread", 6, 2000 )
end
if true then local it = "ba_box"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/props/cs_office/cardboard_box02.mdl", Helper = "#xdefm.d"..it, Rarity = 2, Consume = 20,
	PhysSound = "Cardboard.ImpactSoft", Level = 10, Price = 1500 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_box", 10, 3000 )
end
if true then local it = "ba_fish"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/weapons/w_bugbait.mdl", Helper = "#xdefm.d"..it, Rarity = 2, Carryable = true, Consume = 20,
	PhysSound = "Flesh_Bloody.ImpactHard", Level = 14, Price = 2000 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_fish", 14, 4000 )
end
if true then local it = "ba_lamp"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/props_lab/desklamp01.mdl", Helper = "#xdefm.d"..it, Rarity = 2, Consume = 25,
	PhysSound = "SolidMetal.ImpactSoft", Level = 16, Price = 3250 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_lamp", 16, 7500 )
end
if true then local it = "ba_pickaxe"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/props_mining/pickaxe01.mdl", Helper = "#xdefm.d"..it, Rarity = 2, Consume = 25,
	PhysSound = "PhxMetal.ImpactSoft", Level = 20, Price = 3250 }
	function ITEM:OnCollide( self, dat )
		if dat.Speed >= 120 and dat.DeltaTime > 0.25 and self:IsPlayerHolding() then local ent = dat.HitEntity
			if IsValid( ent ) and !ent:IsWorld() and util.IsValidModel( ent:GetModel() ) and ent != self:GetFMod_LU() then
				local dmg = DamageInfo()  dmg:SetDamagePosition( dat.HitPos ) dmg:SetDamageForce( dat.HitNormal*1500 )
				dmg:SetDamageType( DMG_SLASH ) dmg:SetAttacker( self:GetFMod_OW() ) dmg:SetInflictor( self )
				dmg:SetDamage( 50 ) ent:TakeDamageInfo( dmg ) self:EmitSound( "ambient/machines/slicer"..math.random( 1, 4 )..".wav" )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_pickaxe", 20, 6500 )
end
if true then local it = "ba_teddy"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/props_interiors/teddy_bear.mdl", Helper = "#xdefm.d"..it, Rarity = 3, Consume = 25,
	PhysSound = "Doll.Squeak", Level = 25, Price = 4000 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_teddy", 25, 8000 )
end
if true then local it = "ba_bomb"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = { "models/combine_helicopter/bomb_debris_3.mdl", "models/combine_helicopter/bomb_debris_1.mdl",
	"models/combine_helicopter/bomb_debris_2.mdl" }, Helper = "#xdefm.d"..it, Rarity = 3, Consume = 25,
	PhysSound = "PhxMetal.ImpactSoft", Level = 30, Price = 6000 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_bomb", 30, 12000 )
end
if true then local it = "ba_meat"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = { "models/Gibs/Antlion_gib_Large_2.mdl", "models/gibs/antlion_gib_large_1.mdl", "models/gibs/antlion_gib_large_3.mdl" }
	, Helper = "#xdefm.d"..it, Rarity = 3, Consume = 25, PhysSound = "Flesh.ImpactSoft", Level = 30, Price = 7500 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_meat", 30, 15000 )
end
if true then local it = "ba_c4"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/weapons/w_c4_planted.mdl", Price = 10000,
	Helper = "#xdefm.d"..it, Rarity = 3, Consume = 25, PhysSound = "weapon.ImpactSoft", Level = 35 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_c4", 35, 20000 )
end
if true then local it = "ba_drill"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/props_lab/tpplug.mdl", Price = 12500,
	Helper = "#xdefm.d"..it, Rarity = 3, Consume = 25, PhysSound = "PhxMetal.ImpactSoft", Level = 35 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_drill", 35, 25000 )
end
if true then local it = "ba_combine"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/Items/combine_rifle_ammo01.mdl", Helper = "#xdefm.d"..it, Rarity = 4, Consume = 25,
	PhysSound = "weapon.ImpactSoft", Level = 50, Price = 15000 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_combine", 60, 30000 )
end
if true then local it = "ba_portal"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/props/futbol.mdl", Helper = "#xdefm.d"..it, Rarity = 4, Consume = 25,
	PhysSound = "Rubber_Tire.ImpactHard", Level = 50, Price = 15000 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_portal", 60, 30000 )
end
if true then local it = "ba_magnet"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/props_phx/wheels/magnetic_med_base.mdl", Helper = "#xdefm.d"..it, Rarity = 4, Consume = 25,
	PhysSound = "EpicMetal.ImpactSoft", Level = 75, Price = 20000 }
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_magnet", 75, 40000 )
end
if true then local it = "ba_gmod"
	local ITEM = { Name = "#xdefm."..it, Type = "Bait", Model = "models/maxofs2d/companion_doll.mdl", Helper = "#xdefm.d"..it, Rarity = 4, Consume = 100,
	PhysSound = "Doll.Squeak", Level = 100, TickRate = 0.01, Price = 20000 }
	function ITEM:OnThink( self ) self:SetColor( HSVToColor( ( CurTime()*50 ), 1, 1 ) ) end
	xdefm_ItemRegister( it, ITEM ) xdefm_AddShop( "ba_gmod", 100, 40000 )
end

if SERVER then local ba = "*"
    xdefm_PoolAdd( { Items = { "it_wood", "it_stone", "it_metal", "it_glass", "it_junk" }, Exp = 5, Chances = { [ba] = 100 } } )
    xdefm_PoolAdd( { Items = { "it_wood", "it_stone", "it_metal", "it_glass", "it_junk" }, Exp = 5, Chances = { [ba] = 100 } } )
    xdefm_PoolAdd( { Items = { "it_wood", "it_stone", "it_metal", "it_glass", "it_junk", "it_water" }, Exp = 5, Chances = { [ba] = 100 } } )
    xdefm_PoolAdd( { Items = { "it_water", "it_junks", "it_shoe", "it_mine1", "it_hula", "it_cactus", "it_combine", "it_brick", "it_health", "it_armor", "it_bugs", "it_monitor", "it_bouncy", "it_propane" }, Exp = 10, Chances = { [ba] = 300 } } )
    xdefm_PoolAdd( { Items = "it_present", Exp = 15, Chances = { [ba] = 600 } } )
	xdefm_PoolAdd( { Items = { "it_rock", "it_crate1", "it_bait1", "it_exp1", "it_refill", "it_recipe1", "re_toolbox" }, Exp = 20, Chances = { [ba] = 800 } } )
	xdefm_PoolAdd( { Items = { "it_car", "it_crate2", "it_crate3", "it_recipe2" }, Exp = 30, Chances = { [ba] = 1000 }, DepthMin = 5 } )
	xdefm_PoolAdd( { Items = { "it_bait2", "it_bait2", "it_crate3", "it_exp2" }, Exp = 30, Chances = { [ba] = 1200 }, DepthMin = 3, Level = 15 } )
	xdefm_PoolAdd( { Items = { "it_bait3", "it_bait3", "it_bait3", "it_exp3", "it_treasure", "it_recipe3" }, Exp = 45, Chances = { [ba] = 2000 }, DepthMin = 5, Level = 40 } )
	xdefm_PoolAdd( { Items = "re_luck|1", Exp = 200, Chances = { [ba] = 20000 } } )
end
if SERVER then local ba = "ba_money"
    xdefm_PoolAdd( { Items = { "it_dollar", "it_dollar", "it_paper" }, Exp = 5, Chances = { [ba] = 100 } } )
    xdefm_PoolAdd( { Items = "it_coin", Exp = 15, Chances = { [ba] = 300 } } )
    xdefm_PoolAdd( { Items = { "it_register", "cr_dollar", "it_present" }, Exp = 15, Chances = { [ba] = 450 } } )
    xdefm_PoolAdd( { Items = "it_register", Exp = 15, Chances = { [ba] = 400 }, DepthMin = 3 } )
    xdefm_PoolAdd( { Items = { "it_pallet", "it_coin2" }, Exp = 40, Chances = { [ba] = 1600 }, DepthMin = 5 } )
	xdefm_PoolAdd( { Items = { "it_atm", "it_vault" }, Exp = 45, Chances = { [ba] = 3000 }, DepthMin = 10 } )
end
if SERVER then local ba = "ba_seed"
	xdefm_PoolAdd( { Items = { "it_apple", "it_orange", "it_melo", "it_apple" }, Exp = 5, Chances = { [ba] = 200 } } )
    xdefm_PoolAdd( { Items = { "it_melon", "it_banana" }, Exp = 15, Chances = { [ba] = 400 } } )
	xdefm_PoolAdd( { Items = "cr_melon", Exp = 20, Chances = { [ba] = 600 } } )
    xdefm_PoolAdd( { Items = { "it_orangebox", "it_flower" }, Exp = 25, Chances = { [ba] = 1000 }, DepthMin = 3 } )
end
if SERVER then local ba = "ba_wrench"
	xdefm_PoolAdd( { Items = { "it_furniture1", "it_pottery" }, Exp = 5, Chances = { [ba] = 200 } } )
    xdefm_PoolAdd( { Items = { "it_furniture2", "it_potter1" }, Exp = 15, Chances = { [ba] = 400 } } )
    xdefm_PoolAdd( { Items = { "it_radio", "it_jumppad", "it_chealth", "it_carmor", "it_potter2", "it_potter3", "it_furnace1", "it_cooler" }, Exp = 20, Chances = { [ba] = 800 }, DepthMin = 3 } )
	xdefm_PoolAdd( { Items = { "it_crafting1", "it_vending" }, Exp = 50, Chances = { [ba] = 1600 }, DepthMin = 8 } )
	xdefm_PoolAdd( { Items = "it_slot", Exp = 75, Chances = { [ba] = 2800 }, DepthMin = 8 } )
end
if SERVER then local ba = "ba_pan"
	xdefm_PoolAdd( { Items = "it_coal", Exp = 5, Chances = { [ba] = 200 } } )
	xdefm_PoolAdd( { Items = "it_campfire", Exp = 10, Chances = { [ba] = 400 } } )
    xdefm_PoolAdd( { Items = { "it_campfire", "it_stove1" }, Exp = 10, Chances = { [ba] = 500 } } )
	xdefm_PoolAdd( { Items = { "it_stove1", "it_stove2", "it_furnace1" }, Exp = 15, Chances = { [ba] = 600 } } )
    xdefm_PoolAdd( { Items = "it_stove3", Exp = 20, Chances = { [ba] = 1000 }, DepthMin = 3 } )
	xdefm_PoolAdd( { Items = "it_stove4", Exp = 45, Chances = { [ba] = 2000 }, DepthMin = 6 } )
	xdefm_PoolAdd( { Items = { "it_stove5", "it_microwave", "it_furnace2" }, Exp = 100, Chances = { [ba] = 4500 }, DepthMin = 10 } )
end
if SERVER then local ba = "ba_skull"
    xdefm_PoolAdd( { Items = { "it_junk", "it_rottenmeat", "it_bone" }, Exp = 5, Chances = { [ba] = 150 } } )
    xdefm_PoolAdd( { Items = "cr_crab", Exp = 10, Chances = { [ba] = 400 } } )
    xdefm_PoolAdd( { Items = { "cr_crab2", "cr_crab3" }, Exp = 15, Chances = { [ba] = 500, ["ba_fish"] = 800 } } )
    xdefm_PoolAdd( { Items = { "it_corpse", "it_gravestone", "cr_gnome", "it_egg" }, Exp = 20, Chances = { [ba] = 450 } } )
end
if SERVER then local ba = "ba_fish"
    xdefm_PoolAdd( { Items = "cr_gold", Exp = 10, Chances = { [ba] = 300 } } )
	xdefm_PoolAdd( { Items = { "cr_fish", "cr_gold" }, Exp = 10, Chances = { [ba] = 400 }, DepthMin = 3 } )
	xdefm_PoolAdd( { Items = "cr_perch", Exp = 20, Chances = { [ba] = 800 }, DepthMin = 3 } )
	xdefm_PoolAdd( { Items = { "cr_cute", "cr_golden" }, Exp = 45, Chances = { [ba] = 2600 }, DepthMin = 8 } )
end
if SERVER then local ba = "ba_bomb"
	xdefm_PoolAdd( { Items = { "it_pipebomb", "it_mine1", "it_barre1", "it_combine", "it_propane" }, Exp = 10, Chances = { [ba] = 200 } } )
	xdefm_PoolAdd( { Items = { "it_barre2", "it_mine2", "it_bomb1", "it_combine", "it_grenade", "it_rpg" }, Exp = 15, Chances = { [ba] = 400 }, DepthMin = 3 } )
	xdefm_PoolAdd( { Items = { "it_bomb2", "it_mine2" }, Exp = 20, Chances = { [ba] = 1000 }, DepthMin = 3 } )
end
if SERVER then local ba = "ba_pickaxe"
	xdefm_PoolAdd( { Items = { "it_stone", "it_stone", "it_coal", "it_ore" }, Exp = 5, Chances = { [ba] = 150 } } )
	xdefm_PoolAdd( { Items = { "it_copperbar", "it_leadbar", "it_steelbar", "it_barre1", "it_barre2" }, Exp = 15, Chances = { [ba] = 400 } } )
	xdefm_PoolAdd( { Items = { "it_oreblue", "it_orepurple", "it_tungstenbar" }, Exp = 20, Chances = { [ba] = 600 }, DepthMin = 3 } )
    xdefm_PoolAdd( { Items = { "it_oregreen", "it_orered", "it_silverbar" }, Exp = 25, Chances = { [ba] = 1000 }, DepthMin = 5 } )
    xdefm_PoolAdd( { Items = { "it_gemblue", "it_gempurple" }, Exp = 30, Chances = { [ba] = 1600 }, DepthMin = 8 } )
    xdefm_PoolAdd( { Items = { "it_orewhite", "it_goldbar" }, Exp = 40, Chances = { [ba] = 2000 }, DepthMin = 8 } )
end
if SERVER then local ba = "ba_box"
	xdefm_PoolAdd( { Items = { "it_shoe", "it_mine1", "it_hula", "it_cactus", "it_brick", "it_bugs", "it_monitor", "it_bouncy", "it_gnome" }, Exp = 5, Chances = { [ba] = 200 } } )
	xdefm_PoolAdd( { Items = { "it_gballoon" }, Exp = 10, Chances = { [ba] = 300 } } )
	xdefm_PoolAdd( { Items = { "it_crowbar", "it_hatchet", "it_stunstick", "it_shovel", "it_refill", "re_meat" }, Exp = 15, Chances = { [ba] = 450 } } )
	xdefm_PoolAdd( { Items = { "it_guitar", "it_grinder", "it_camera", "it_balloox", "it_jumppad" }, Exp = 20, Chances = { [ba] = 1000 } } )
	xdefm_PoolAdd( { Items = { "it_gballoom", "it_defib" }, Exp = 20, Chances = { [ba] = 2000 }, DepthMin = 3 } )
end
if SERVER then local ba = "ba_teddy"
	xdefm_PoolAdd( { Items = { "cr_baby", "cr_saw", "cr_gnome", "it_hula" }, Exp = 10, Chances = { [ba] = 300 } } )
	xdefm_PoolAdd( { Items = { "it_figurine", "it_torch" }, Exp = 15, Chances = { [ba] = 600 } } )
	xdefm_PoolAdd( { Items = { "it_cosmogram", "cr_knight" }, Exp = 25, Chances = { [ba] = 2000 }, DepthMin = 5 } )
	xdefm_PoolAdd( { Items = "it_bust", Exp = 40, Chances = { [ba] = 3000 }, DepthMin = 8 } )
	xdefm_PoolAdd( { Items = "it_pot", Exp = 50, Chances = { [ba] = 2000 }, DepthMin = 8 } )
end
if SERVER then local ba = "ba_meat"
	xdefm_PoolAdd( { Items = { "cr_crab", "cr_crab2", "cr_crab3", "cr_melon", "cr_dollar" }, Exp = 10, Chances = { [ba] = 300 } } )
	xdefm_PoolAdd( { Items = { "cr_fish", "cr_gold", "cr_perch" }, Exp = 15, Chances = { [ba] = 450 } } )
	xdefm_PoolAdd( { Items = { "cr_baby", "cr_saw", "cr_gnome" }, Exp = 15, Chances = { [ba] = 600 } } )
	xdefm_PoolAdd( { Items = "cr_cute", Exp = 45, Chances = { [ba] = 800 }, DepthMin = 5 } )
	xdefm_PoolAdd( { Items = { "cr_pigeon", "cr_crow", "cr_seagull", "cr_golden" }, Exp = 20, Chances = { [ba] = 1000 } } )
end
if SERVER then local ba = "ba_junk"
	xdefm_PoolAdd( { Items = "it_junk", Exp = 0, Chances = { [ba] = 10 } } )
	xdefm_PoolAdd( { Items = "it_junks", Exp = 0, Chances = { [ba] = 100 } } )
	xdefm_PoolAdd( { Items = "it_junkx", Exp = 0, Chances = { [ba] = 200 } } )
	xdefm_PoolAdd( { Items = { "re_recycle", "it_junku" }, Exp = 10, Chances = { [ba] = 400 } } )
end
if SERVER then local ba = "ba_bread"
	xdefm_PoolAdd( { Items = { "it_apple", "it_orange", "it_apple", "it_pumpkin1", "it_soda", "it_potato", "it_water" }, Exp = 5, Chances = { [ba] = 100 } } )
	xdefm_PoolAdd( { Items = { "it_mush1", "it_mush2", "it_bread1", "it_bread1", "it_bread1", "it_egg" }, Exp = 10, Chances = { [ba] = 150 } } )
	xdefm_PoolAdd( { Items = { "it_gfood", "it_bread2" }, Exp = 15, Chances = { [ba] = 300 } } )
	xdefm_PoolAdd( { Items = { "it_pumpkin2", "cr_bread", "cr_bread", "cr_bread", "re_exp" }, Exp = 20, Chances = { [ba] = 600 }, DepthMin = 3 } )
	xdefm_PoolAdd( { Items = { "it_fridge", "it_coffee" }, Exp = 20, Chances = { [ba] = 1000 }, DepthMin = 3 } )
end
if SERVER then local ba = "ba_c4"
	xdefm_PoolAdd( { Items = { "it_ammo", "it_rpg", "it_grenade", "it_flashbang" }, Exp = 10, Chances = { [ba] = 300 } } )
	xdefm_PoolAdd( { Items = "it_firearm1", Exp = 15, Chances = { [ba] = 450 } } )
	xdefm_PoolAdd( { Items = { "it_firearm2", "it_ammocan1" }, Exp = 20, Chances = { [ba] = 600 } } )
	xdefm_PoolAdd( { Items = { "it_crate3", "it_ammocan2" }, Exp = 40, Chances = { [ba] = 1000 }, DepthMin = 3 } )
	xdefm_PoolAdd( { Items = "it_supply", Exp = 40, Chances = { [ba] = 1600 }, DepthMin = 5 } )
	xdefm_PoolAdd( { Items = "it_launcher", Exp = 50, Chances = { [ba] = 3000 }, DepthMin = 8 } )
end
if SERVER then local ba = "ba_drill"
	xdefm_PoolAdd( { Items = { "it_coal", "it_pottery", "it_ore" }, Exp = 5, Chances = { [ba] = 100 } } )
	xdefm_PoolAdd( { Items = { "it_copperbar", "it_leadbar", "it_steelbar", "it_barre1", "it_barre2" }, Exp = 10, Chances = { [ba] = 200 } } )
	xdefm_PoolAdd( { Items = { "it_oreblue", "it_orepurple", "it_oregreen", "it_orered" }, Exp = 15, Chances = { [ba] = 450 }, DepthMin = 3 } )
    xdefm_PoolAdd( { Items = { "it_gemblue", "it_gempurple", "it_silverbar", "it_tungstenbar" }, Exp = 25, Chances = { [ba] = 600 }, DepthMin = 5 } )
    xdefm_PoolAdd( { Items = { "it_gemgreen", "it_gemred", "it_orewhite", "it_goldbar" }, Exp = 30, Chances = { [ba] = 800 }, DepthMin = 8 } )
    xdefm_PoolAdd( { Items = "it_platinumbar", Exp = 40, Chances = { [ba] = 1000 }, DepthMin = 10 } )
	xdefm_PoolAdd( { Items = { "it_treasure", "it_gemwhite" }, Exp = 50, Chances = { [ba] = 2000 }, DepthMin = 10 } )
	xdefm_PoolAdd( { Items = "it_rainbowbar", Exp = 80, Chances = { [ba] = 4000 }, DepthMin = 10 } )
end
if SERVER then local ba = "ba_combine"
	xdefm_PoolAdd( { Items = "it_cmetal", Exp = 10, Chances = { [ba] = 200 } } )
	xdefm_PoolAdd( { Items = { "it_chopper", "it_bomb1", "it_clocked" }, Exp = 15, Chances = { [ba] = 250 } } )
	xdefm_PoolAdd( { Items = { "it_csuper", "it_chealth", "it_carmor" }, Exp = 20, Chances = { [ba] = 600 }, DepthMin = 3 } )
	xdefm_PoolAdd( { Items = { "it_cscanner", "it_cturret", "it_cheli" }, Exp = 30, Chances = { [ba] = 1600 }, DepthMin = 5 } )
	xdefm_PoolAdd( { Items = "it_cthumper", Exp = 50, Chances = { [ba] = 3500 }, DepthMin = 8 } )
	xdefm_PoolAdd( { Items = "it_cquest", Exp = 80, Chances = { [ba] = 5000 }, DepthMin = 10 } )
end
if SERVER then local ba = "ba_portal"
	xdefm_PoolAdd( { Items = "it_pmetal", Exp = 10, Chances = { [ba] = 200 } } )
	xdefm_PoolAdd( { Items = "it_pcube", Exp = 15, Chances = { [ba] = 300 } } )
	xdefm_PoolAdd( { Items = "it_pradio", Exp = 20, Chances = { [ba] = 400 } } )
	xdefm_PoolAdd( { Items = "it_pturre1", Exp = 20, Chances = { [ba] = 1250 }, DepthMin = 3 } )
	xdefm_PoolAdd( { Items = "it_pturre2", Exp = 30, Chances = { [ba] = 2000 }, DepthMin = 5 } )
	xdefm_PoolAdd( { Items = "it_pcore", Exp = 50, Chances = { [ba] = 3500 }, DepthMin = 8 } )
	xdefm_PoolAdd( { Items = "it_pshop", Exp = 80, Chances = { [ba] = 5000 }, DepthMin = 10 } )
end
if SERVER then local ba = "ba_lamp"
	xdefm_PoolAdd( { Items = "it_expr", Exp = 10, Chances = { [ba] = 450 } } )
	xdefm_PoolAdd( { Items = "it_exps", Exp = 20, Chances = { [ba] = 1500 }, DepthMin = 5 } )
	xdefm_PoolAdd( { Items = "it_exp1", Exp = 20, Chances = { [ba] = 800 } } )
	xdefm_PoolAdd( { Items = { "it_exps", "it_exp2" }, Exp = 30, Chances = { [ba] = 1200 }, DepthMin = 3, Level = 15 } )
	xdefm_PoolAdd( { Items = { "it_exps", "it_exp3" }, Exp = 45, Chances = { [ba] = 2000 }, DepthMin = 5, Level = 40 } )
	xdefm_PoolAdd( { Items = { "it_chemical", "it_paper", "it_ejunk" }, Exp = 5, Chances = { [ba] = 100 } } )
	xdefm_PoolAdd( { Items = { "it_printer", "it_chealth", "it_carmor", "it_cooler" }, Exp = 10, Chances = { [ba] = 600 } } )
	xdefm_PoolAdd( { Items = { "it_vending" }, Exp = 15, Chances = { [ba] = 1200 }, DepthMin = 3 } )
	xdefm_PoolAdd( { Items = { "it_antibird", "it_server", "it_miner" }, Exp = 20, Chances = { [ba] = 1600 }, DepthMin = 3 } )
	xdefm_PoolAdd( { Items = { "it_crafting2", "it_tesla" }, Exp = 50, Chances = { [ba] = 3000 }, DepthMin = 8 } )
end
if SERVER then local ba = "ba_hook"
	xdefm_PoolAdd( { Items = { "it_wood", "it_stone", "it_metal", "it_glass", "it_scrap", "it_paper" }, Exp = 10, Chances = { [ba] = 50 } } )
	xdefm_PoolAdd( { Items = { "it_wood2", "it_brick", "it_metal2", "it_glass2", "it_part", "it_plastic", "it_ejunk", "it_pottery" }, Exp = 15, Chances = { [ba] = 250 } } )
	xdefm_PoolAdd( { Items = { "re_toolbox", "it_recipe1", "it_recipe2" }, Exp = 15, Chances = { [ba] = 600 } } )
	xdefm_PoolAdd( { Items = { "it_wood3", "it_stone2", "it_metal3", "it_glass3", "it_part", "re_recycle", "re_meat" }, Exp = 25, Chances = { [ba] = 800 }, DepthMin = 3 } )
	xdefm_PoolAdd( { Items = "it_recipe2", Exp = 30, Chances = { [ba] = 1000 } } )
	xdefm_PoolAdd( { Items = "it_part2", Exp = 40, Chances = { [ba] = 1000 }, DepthMin = 5 } )
	xdefm_PoolAdd( { Items = "it_recipe3", Exp = 50, Chances = { [ba] = 2000 } } )
end
if SERVER then local ba = "ba_magnet"
	xdefm_PoolAdd( { Items = { "it_rock", "it_crate1", "it_bait1", "it_register", "it_ammocan1" }, Exp = 0, Chances = { [ba] = 300 } } )
	xdefm_PoolAdd( { Items = { "it_crate2", "it_crate3", "it_ammocan2" }, Exp = 0, Chances = { [ba] = 500 } } )
	xdefm_PoolAdd( { Items = { "it_bait2", "it_bait2", "it_crate3", "it_treasure" }, Exp = 0, Chances = { [ba] = 700 } } )
	xdefm_PoolAdd( { Items = "it_vault", Exp = 0, Chances = { [ba] = 900 } } )
end