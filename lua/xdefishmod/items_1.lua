if CLIENT then local langs = {}
	langs[ "zh-CN" ] = {
		[ "it_wood" ] = "木片", [ "dit_wood" ] = "",
		[ "it_stone" ] = "石头", [ "dit_stone" ] = "",
		[ "it_metal" ] = "铁片", [ "dit_metal" ] = "",
		[ "it_glass" ] = "碎玻璃", [ "dit_glass" ] = "",
		[ "it_junks" ] = "垃圾袋", [ "dit_junks" ] = "也算是为海洋生态做奉献了.",
		[ "it_shoe" ] = "旧鞋子", [ "dit_shoe" ] = "它被遗弃的原因显而易见.",
		[ "it_mine1" ] = "废弃的水雷", [ "dit_mine1" ] = "看上去很危险,不确定是否还有用.",
		[ "it_hula" ] = "跳舞娃娃", [ "dit_hula" ] = "能跳舞的娃娃,没了.",
		[ "it_cactus" ] = "仙人球", [ "dit_cactus" ] = "恶作剧常见工具之一.",
        [ "it_combine" ] = "联合军僵尸?", [ "dit_combine" ] = "懂的都懂,不懂可以按Y扣问号.",
        [ "it_brick" ] = "板砖", [ "dit_brick" ] = "",
		[ "it_health" ] = "医疗包", [ "dit_health" ] = "回满你的血量. 可以复活生物.",
		[ "it_armor" ] = "护甲包", [ "dit_armor" ] = "回满你的护甲.",
        [ "it_paper" ] = "卷纸", [ "dit_paper" ] = "",
        [ "it_dollar" ] = "一沓钱", [ "dit_dollar" ] = "刀乐,油艾斯刀乐.",
        [ "it_coin" ] = "银币", [ "dit_coin" ] = "叮当响.",
        [ "it_register" ] = "收银机", [ "dit_register" ] = "看上去在水里泡了很久了.",
        [ "it_pallet" ] = "一箱钱", [ "dit_pallet" ] = "芜湖中大奖!",
        [ "cr_dollar" ] = "被诅咒的钱", [ "dcr_dollar" ] = "他想要你的钱,更要你的命.",
		[ "it_present" ] = "礼盒", [ "dit_present" ] = "装有随机数目的钱,考验运气的时候到了.",
        [ "it_rottenmeat" ] = "腐肉", [ "dit_rottenmeat" ] = "肮脏到不想捡起的地步.",
		[ "it_corpse" ] = "尸体", [ "dit_corpse" ] = "被水泡得稀烂的尸体.",
		[ "it_gravestone" ] = "墓碑", [ "dit_gravestone" ] = "墓碑上的字迹已经模糊不清了.",
        [ "cr_crab" ] = "猎头蟹", [ "dcr_crab" ] = "十分普通的蟹.",
		[ "cr_crab2" ] = "快速猎头蟹", [ "dcr_crab2" ] = "更加活跃的蟹.",
		[ "cr_crab3" ] = "剧毒猎头蟹", [ "dcr_crab3" ] = "剧毒无比的蟹.",
		[ "cr_gnome" ] = "侏儒", [ "dcr_gnome" ] = "花园侏儒,但是地面技术很好.",
        [ "it_campfire" ] = "营火", [ "dit_campfire" ] = "加入木头,煤炭或者垃圾来生火, 按下 Shift+E 来灭火.",
        [ "it_stove1" ] = "简易炉灶", [ "dit_stove1" ] = "用汽车电池驱动的炉灶,火焰很不稳定.",
        [ "it_stove2" ] = "破损炉灶", [ "dit_stove2" ] = "炉灶烘烤过的物品可以增值,会自动关闭.",
        [ "it_stove3" ] = "炉灶", [ "dit_stove3" ] = "炉灶烘烤过的物品可以增值.",
		[ "it_furniture1" ] = "木质家具", [ "dit_furniture1" ] = "",
		[ "it_furniture2" ] = "铁质家具", [ "dit_furniture2" ] = "",
		[ "it_radio" ] = "坏掉的收音机", [ "dit_radio" ] = "关不掉的收音机,可能是泡水里泡坏了.",
		[ "it_orange" ] = "橙子", [ "dit_orange" ] = "",
		[ "it_melon" ] = "西瓜", [ "dit_melon" ] = "",
		[ "it_melo" ] = "一片西瓜", [ "dit_melo" ] = "",
		[ "it_apple" ] = "苹果", [ "dit_apple" ] = "",
		[ "it_banana" ] = "香蕉", [ "dit_banana" ] = "",
		[ "it_orangebox" ] = "橙 盒", [ "dit_orangebox" ] = "每隔两分钟生成一个橙子.",
		[ "cr_fish" ] = "鱼", [ "dcr_fish" ] = "",
		[ "cr_fish2" ] = "热带鱼", [ "dcr_fish2" ] = "",
		[ "cr_gold" ] = "金鱼", [ "dcr_gold" ] = "",
		[ "cr_perch" ] = "鲈鱼", [ "dcr_perch" ] = "不是鱼露,是鲈鱼哦.",
		[ "cr_perch2" ] = "黄金鱼", [ "dcr_perch2" ] = "",
		[ "cr_cute" ] = "鱼龙", [ "dcr_cute" ] = "深海巨兽养着玩算是给你学会了.",
		[ "it_barre1" ] = "油桶", [ "dit_barre1" ] = "装有一点油的旧铁桶,可击碎.",
		[ "it_barre2" ] = "不稳定油桶", [ "dit_barre2" ] = "满载油的旧铁桶,严禁烟火!",
		[ "it_bomb1" ] = "联合军炸弹", [ "dit_bomb1" ] = "轻拿轻放. 撞击后爆炸.",
		[ "it_bomb2" ] = "炸弹", [ "dit_bomb2" ] = "轻拿轻放. 按Shift+E来打开关闭.",
	}
	langs[ "en" ] = {
		[ "it_wood" ] = "Wood", [ "dit_wood" ] = "",
		[ "it_stone" ] = "Stone", [ "dit_stone" ] = "",
		[ "it_metal" ] = "Metal", [ "dit_metal" ] = "",
		[ "it_glass" ] = "Glass", [ "dit_glass" ] = "",
		[ "it_junks" ] = "Junk Pile", [ "dit_junks" ] = "Tons of junk, break to open.",
		[ "it_shoe" ] = "Old Shoe", [ "dit_shoe" ] = "The reason for its abandonment is obvious.",
		[ "it_mine1" ] = "Old Naval Mine", [ "dit_mine1" ] = "Seems dangerous, not sure if it still works.",
		[ "it_hula" ] = "Hula Doll", [ "dit_hula" ] = "A doll that can dance, nothing else.",
		[ "it_cactus" ] = "Cactus", [ "dit_cactus" ] = "Aggressive.",
        [ "it_combine" ] = "Zombine Soldier?", [ "dit_combine" ] = "???",
        [ "it_brick" ] = "Brick", [ "dit_brick" ] = "",
		[ "it_health" ] = "Health Kit", [ "dit_health" ] = "Refill your health. Can also revive creatures.",
		[ "it_armor" ] = "Armor Kit", [ "dit_armor" ] = "Refill your armor.",
        [ "it_paper" ] = "Paper Roll", [ "dit_paper" ] = "",
        [ "it_dollar" ] = "Money", [ "dit_dollar" ] = "Loads of money.",
        [ "it_coin" ] = "Coin", [ "dit_coin" ] = "Valuable silver coin.",
        [ "it_register" ] = "Cash Register", [ "dit_register" ] = "It seems remained underwater for a long time.",
        [ "it_pallet" ] = "Money Pallet", [ "dit_pallet" ] = "Jackpot.",
        [ "cr_dollar" ] = "Cursed Money", [ "dcr_dollar" ] = "Yer your money AND your life.",
		[ "it_present" ] = "Present", [ "dit_present" ] = "Contains random amount of money, time to test your luck.",
        [ "it_rottenmeat" ] = "Rotten Meat", [ "dit_rottenmeat" ] = "Too dirty to pick up.",
		[ "it_corpse" ] = "Corpse", [ "dit_corpse" ] = "Dead human body.",
		[ "it_gravestone" ] = "Gravestone", [ "dit_gravestone" ] = "The text on the stone is blurred.",
		[ "cr_crab" ] = "Headcrab", [ "dcr_crab" ] = "Common crab.",
		[ "cr_crab2" ] = "Fast Headcrab", [ "dcr_crab2" ] = "Energetic crab.",
		[ "cr_crab3" ] = "Poison Headcrab", [ "dcr_crab3" ] = "Poisonous crab.",
		[ "cr_gnome" ] = "Gnome", [ "dcr_gnome" ] = "Garden gnome, but with parkour skills.",
        [ "it_campfire" ] = "Campfire", [ "dit_campfire" ] = "Insert woods, coals or junks to make fire. Press Shift+E to extinguish.",
        [ "it_stove1" ] = "Simple Stove", [ "dit_stove1" ] = "A makeshift stove powered by a car battery. Quite unstable.",
        [ "it_stove2" ] = "Broken Stove", [ "dit_stove2" ] = "Cooked items can increase in value, may sometimes shutdown itself.",
        [ "it_stove3" ] = "Stove", [ "dit_stove3" ] = "Cooked items can increase in value.",
		[ "it_furniture1" ] = "Wooden Furniture", [ "dit_furniture1" ] = "",
		[ "it_furniture2" ] = "Metal Furniture", [ "dit_furniture2" ] = "",
		[ "it_radio" ] = "Broken Radio", [ "dit_radio" ] = "Radio that never stops playing random music.",
		[ "it_orange" ] = "Orange", [ "dit_orange" ] = "",
		[ "it_melon" ] = "Melon", [ "dit_melon" ] = "",
		[ "it_melo" ] = "Melon Slice", [ "dit_melo" ] = "",
		[ "it_apple" ] = "Apple", [ "dit_apple" ] = "",
		[ "it_banana" ] = "Banana", [ "dit_banana" ] = "",
		[ "it_orangebox" ] = "Orange Box", [ "dit_orangebox" ] = "Spawn an orange every 2 minutes.",
		[ "cr_fish" ] = "Fish", [ "dcr_fish" ] = "",
		[ "cr_fish2" ] = "Fish", [ "dcr_fish2" ] = "",
		[ "cr_gold" ] = "Goldfish", [ "dcr_gold" ] = "",
		[ "cr_perch" ] = "Perch", [ "dcr_perch" ] = "",
		[ "cr_perch2" ] = "Golden Fish", [ "dcr_perch2" ] = "",
		[ "cr_cute" ] = "Ichthyosaur", [ "dcr_cute" ] = "Rare and dangerous creature living in deep water.",
		[ "it_barre1" ] = "Oil Barrel", [ "dit_barre1" ] = "Metal barrel with some oil inside. May explode.",
		[ "it_barre2" ] = "Unstable Oil Barrel", [ "dit_barre2" ] = "Metal barrel full of oil. No smoking!",
		[ "it_bomb1" ] = "Combine Bomb", [ "dit_bomb1" ] = "Handle in care. Detonate on touch.",
		[ "it_bomb2" ] = "Bomb", [ "dit_bomb2" ] = "Handle in care. Shift+E to arm/disarm.",
    }
	local ln = GetConVar( "gmod_language" ):GetString()  local lg = "en"
	if ln != nil and istable( langs[ ln ] ) then lg = GetConVar( "gmod_language" ):GetString() end
	for holder, text in pairs( langs[ lg ] ) do language.Add( "xdefm."..holder, text ) end
end local Mat = Material( "sprites/light_glow02_add" ) Mat:SetInt( "$ignorez", 1 ) 

if true then local it = "it_wood"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/gibs/wood_gib01a.mdl", "models/gibs/wood_gib01b.mdl", "models/Gibs/wood_gib01c.mdl", "models/gibs/wood_gib01d.mdl" },
	Helper = "#xdefm.d"..it, Rarity = 1, Price = 6, KillInWater = true, PhysSound = "Wood.ImpactSoft" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_stone"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/rock001a.mdl", Helper = "#xdefm.d"..it,
	Rarity = 1, Price = 8, KillInWater = true, PhysSound = "Concrete.ImpactSoft" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_metal"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/gibs/metal_gib1.mdl", "models/gibs/metal_gib2.mdl",
	"models/gibs/metal_gib3.mdl", "models/gibs/metal_gib4.mdl", "models/gibs/metal_gib5.mdl" }, Helper = "#xdefm.d"..it,
	Rarity = 1, Price = 15, KillInWater = true, PhysSound = "SolidMetal.ImpactSoft" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_glass"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = {
	"models/props_junk/garbage_glassbottle001a_chunk04.mdl", "models/props_junk/garbage_glassbottle001a_chunk02.mdl", "models/props_junk/garbage_glassbottle001a_chunk03.mdl", "models/props_junk/garbage_glassbottle001a_chunk01.mdl",
	"models/props_junk/garbage_glassbottle003a_chunk01.mdl", "models/props_junk/garbage_glassbottle003a_chunk02.mdl", "models/props_junk/garbage_glassbottle003a_chunk03.mdl",
	"models/props_junk/glassjug01_chunk01.mdl", "models/props_junk/glassjug01_chunk02.mdl", "models/props_junk/glassjug01_chunk03.mdl" }
	, Helper = "#xdefm.d"..it, Rarity = 1, Price = 10, KillInWater = true, PhysSound = "GlassBottle.ImpactHard" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_junks"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/trashcluster01a_corner.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 1, Price = 60, Carryable = false, PhysSound = "Sand.BulletImpact", KillInWater = true }
	function ITEM:OnInit( self ) self:SetMaxHealth( 10 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:StopSound( "Cardboard.Break" ) self:EmitSound( "Cardboard.Break" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local lt = {["it_junk"]=250,["it_metal"]=50,["it_glass"]=50,["it_stone"]=50,["it_wood"]=50}
        for i=1, math.random( 4, 8 ) do xdefm_LootDrop( lt, self ) end
		self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_shoe"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/shoe001a.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 30, TickRate = 1 }
	function ITEM:OnInit( self ) self:NextThink( CurTime() +2 ) end
	function ITEM:OnThink( self )
		for k, v in pairs( ents.FindInSphere( self:WorldSpaceCenter(), 50 ) ) do
			if ( !v:IsPlayer() and !v:IsNPC() ) or v == self then continue end
			if ( v:IsPlayer() and !v:Alive() ) or ( v:IsNPC() and v:GetNPCState() == NPC_STATE_DEAD ) then continue end
			local dmg = DamageInfo()
			dmg:SetDamage( 1 )
			dmg:SetAttacker( self:GetFMod_OW() )
			dmg:SetInflictor( self )
			dmg:SetDamageType( DMG_POISON )
			dmg:SetDamageForce( ( v:WorldSpaceCenter() -self:WorldSpaceCenter() ):GetNormalized()*10000 )
			dmg:SetDamagePosition( v:WorldSpaceCenter() )
			v:TakeDamageInfo( dmg ) v:StopSound( "Player.SonicDamage" ) v:EmitSound( "Player.SonicDamage" )
		end
	end
	function ITEM:OnCollide( self, dat )
		if dat.Speed >= 60 and dat.DeltaTime > 0.2 then local ent = dat.HitEntity
		if ent:IsPlayer() or ent:IsNPC() then
			self:StopSound( "GrenadeBugBait.Splat" ) self:EmitSound( "GrenadeBugBait.Splat" )
			util.Decal( "BeerSplash", dat.HitPos +dat.HitNormal, dat.HitPos -dat.HitNormal, self )
		else
			self:StopSound( "Weapon_Bugbait.Splat" ) self:EmitSound( "Weapon_Bugbait.Splat" )
		end end
	end
	function ITEM:OnDraw( self )
		if !self.xdefm_EF then self.xdefm_EF = true
			local eff = EffectData() eff:SetEntity( self ) util.Effect( "xdefm_shoestink", eff )
		end
	end
	if CLIENT then
		local EFFECT = {}
		function EFFECT:Init( data ) 	
			local ent = data:GetEntity() if !IsValid( ent ) then return end  self.NextEmit = CurTime() +0.02
			self.Owner = ent  self.Emitter = ParticleEmitter( self.Owner:WorldSpaceCenter() ) 
		end
		function EFFECT:Think()
			if !self.Emitter or !IsValid( self.Emitter ) then return false end
			local own = self.Owner  if IsValid( own ) then local pos = own:WorldSpaceCenter()
				self.Emitter:SetPos( pos ) self.Emitter:SetPos( pos )
				if IsValid( LocalPlayer() ) and LocalPlayer():EyePos():Distance( pos ) <= 4096 and self.NextEmit < CurTime() then
					local particle = self.Emitter:Add( "particle/particle_smokegrenade1", pos +VectorRand():GetNormalized()*5 )
					if particle then
						particle:SetVelocity( VectorRand():GetNormalized()*5 )
						particle:SetLifeTime( 0 )
						particle:SetDieTime( math.Rand( 0.75, 1.5 ) )
						particle:SetStartAlpha( 155 )
						particle:SetEndAlpha( 0 )
						particle:SetStartSize( 3 )
						particle:SetEndSize( 6 )
						particle:SetRoll( math.Rand( 0, 360 ) )
						particle:SetColor( 155, 155, 0, 255 )
						particle:SetGravity( Vector( 0, 0, 25 ) )
						particle:SetAirResistance( 0 )
						particle:SetCollide( false )
						particle:SetBounce( 0 )
					end self.NextEmit = CurTime() + 0.02
				end
				return true
			end
			if self.Emitter then self.Emitter:Finish() end return false
		end
		function EFFECT:Render() end
		effects.Register( EFFECT, "xdefm_shoestink" ) end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_mine1"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/roller.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 75, TickRate = 0.1, PhysSound = "Metal_Box.BulletImpact" }
	function ITEM:C_Explode( self ) if self.xdefm_Killed then return else self.xdefm_Killed = true end
		local ef = EffectData() ef:SetStart( self:WorldSpaceCenter() )
		ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetScale( 1 ) util.Effect( "HelicopterMegaBomb", ef )
		local dmg = DamageInfo() dmg:SetDamage( 200 ) dmg:SetDamageType( bit.bor( DMG_BLAST, DMG_AIRBOAT ) )
		dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
		dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 200 )
		self:EmitSound( "Explo.ww2bomb" ) SafeRemoveEntity( self )
	end
	function ITEM:OnInit( self ) self:SetMaterial( "models/props_pipes/pipeset_metal" ) self.xdefm_Killed = false  self:SetCollisionGroup( COLLISION_GROUP_NONE ) end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMaterial( "wood" ) self:GetPhysicsObject():SetBuoyancyRatio( 1 ) end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed or math.floor( dmg:GetDamage() ) <= 0 then return false end
		self:StopSound( "Metal_Box.BulletImpact" ) self:EmitSound( "Metal_Box.BulletImpact" )
		if math.random( 1, 25 ) == 1 then ITEM:C_Explode( self ) end return true
	end
	function ITEM:OnCollide( self, dat ) if self.xdefm_Killed then return end
		if math.random( 1, 10 ) == 1 then ITEM:C_Explode( self ) end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_hula"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_lab/huladoll.mdl", HelperUse = "xdefm.U2"
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 60, TickRate = 0.01, PhysSound = "Plastic_Barrel.ImpactSoft" }
	function ITEM:OnInit( self ) self:SetAutomaticFrameAdvance( true ) self.xdefm_Push = 0 end
	function ITEM:OnUse( self, ent ) if self:IsOnFire() then return end if ent:KeyDown( IN_SPEED ) then return true end
		self:EmitSound( "ambient/creatures/teddy.wav", 70, 100 +math.ceil( self.xdefm_Push/4 ), 0.5 )
	self:ResetSequence( "shake" ) self:SetPlaybackRate( 1 ) self.xdefm_Push = math.Clamp( self.xdefm_Push +4, 0, 255 )
	if self.xdefm_Push >= 255 then self:EmitSound( "ambient/creatures/town_child_scream1.wav", 75, 120, 0.5 ) self:Ignite( 10 ) self.xdefm_Push = 0 end
	local per = ( 255 -self.xdefm_Push ) self:SetColor( Color( 255, per, per ) ) return false end
	function ITEM:OnThink( self ) if self.xdefm_Push > 0 then self.xdefm_Push = math.Clamp( self.xdefm_Push -0.2, 0, 255 )
		local per = ( 255 -self.xdefm_Push )  self:SetColor( Color( 255, per, per ) ) end
	end
	function ITEM:OnDamaged( self ) timer.Simple( 0, function() if IsValid( self ) then self:RemoveAllDecals() end end ) self.xdefm_T2:OnUse( self, nil ) end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_cactus"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_lab/cactus.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 50, PhysSound = "Sand.BulletImpact" }
	function ITEM:OnInit( self ) self.xdefm_NextTouch = CurTime() +1 end
	function ITEM:OnReady( self ) self:SetTrigger( true ) end
	function ITEM:OnTouch( self, ent, typ )
		if typ != 1 or self.xdefm_NextTouch > CurTime() then return end self.xdefm_NextTouch = CurTime() + 0.5
		if !ent:IsPlayer() and !ent:IsNPC() then return end
		self:EmitSound( "Town.d1_town_03_blade_out" )
		local vel = ( self:WorldSpaceCenter() - ent:WorldSpaceCenter() ):GetNormalized()
		local dmg = DamageInfo() dmg:SetDamage( 5 ) dmg:SetAttacker( self:GetFMod_OW() )
		dmg:SetInflictor( self ) dmg:SetDamageType( bit.bor( DMG_AIRBOAT, DMG_SLASH ) )
		dmg:SetDamagePosition( ent:WorldSpaceCenter() )
		dmg:SetDamageForce( vel*10000 ) ent:TakeDamageInfo( dmg )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_combine"
	local ac = { "deathpose_back", "deathpose_front", "deathpose_left", "deathpose_right", "flinchbig", "flinchgut",
	"flinchhead", "flinchleft", "flinchright", "flinchsmall", "signal_advance", "signal_forward", "signal_group", "signal_halt",
	"signal_left", "signal_right", "signal_takecover", "reload" }
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/Combine_Soldier.mdl", TickRate = 0.1,
	Helper = "#xdefm.d"..it, Rarity = 1, Price = 0, KillInWater = true, PhysSound = "MetalVehicle.ImpactSoft" }
	local Mat = Material( "sprites/light_glow02_add" ) Mat:SetInt( "$ignorez", 1 )
	function ITEM:OnInit( self ) self.xdefm_Killed = false  self:SetAutomaticFrameAdvance( true )
		self.xdefm_Act = 0  self.xdefm_ActNext = 0  self.xdefm_Boom = 0
		self:PhysicsInitBox( Vector( -16, -16, 1 ), Vector( 16, 16, 65 ) )
		self:SetMoveType( MOVETYPE_VPHYSICS ) self:GetPhysicsObject():Wake()
		self:StartMotionController() self.ShadowParams = {}
		local hea = ents.Create( "base_anim" ) hea:SetModel( "models/nova/w_headcrab.mdl" ) hea:AddEffects( EF_BONEMERGE )
		hea:SetParent( self ) hea:SetOwner( self ) hea:Spawn() hea:Activate() self:DeleteOnRemove( hea )
		local gre = ents.Create( "base_anim" ) gre:SetModel( "models/weapons/w_grenade.mdl" ) gre:AddEffects( EF_BONEMERGE )
		gre:SetParent( self ) gre:SetOwner( self ) gre:Spawn() gre:Activate() self:DeleteOnRemove( gre )  self:SetNWEntity( "XDEFM_Gre", gre )
		return true
	end
	function ITEM:OnReady( self ) self:StartMotionController() self:GetPhysicsObject():SetMass( 50 ) end
	function ITEM:OnThink( self ) if self.xdefm_Killed then return end
		if self.xdefm_ActNext <= CurTime() and self.xdefm_Act < #ac then self.xdefm_Act = self.xdefm_Act +1
			self:ResetSequence( ac[ self.xdefm_Act ] ) self:SetPlaybackRate( 1 )
			self.xdefm_ActNext = CurTime() +self:SequenceDuration()
			if self.xdefm_Act >= #ac then self:EmitSound("npc/combine_soldier/die"..math.random( 1, 3 )..".wav", 75, math.random( 90, 100 ) )
			else self:EmitSound("npc/combine_soldier/pain"..math.random( 1, 3 )..".wav", 75, math.random( 90, 100 ) ) end
			if self.xdefm_Act >= #ac then self:SetNWBool( "XDEFM_PGr", true ) self.xdefm_Boom = CurTime() +self:SequenceDuration() end
		end
		if self.xdefm_Boom > 0 and self.xdefm_Boom <= CurTime() then self.xdefm_Killed = true
			local ef = EffectData() ef:SetStart( self:WorldSpaceCenter() )
			ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetScale( 1 ) util.Effect( "Explosion", ef )
			local dmg = DamageInfo() dmg:SetDamage( 250 ) dmg:SetDamageType( DMG_BLAST )
			dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
			dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 300 ) SafeRemoveEntityDelayed( self, 0.1 )
		end
	end
	function ITEM:OnRemove( self ) for k, v in pairs( self:GetChildren() ) do v:Remove() end end
	function ITEM:OnPhysSimulate( self, phy, del ) if self.xdefm_Killed then return end self:PhysWake()
		if self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() then return end phy:Wake()
		self.ShadowParams.pos = self:GetPos()
		self.ShadowParams.angle = Angle( 0, self:GetAngles().yaw, 0 )
		self.ShadowParams.maxangular = 1000
		self.ShadowParams.maxangulardamp = 10000
		self.ShadowParams.maxspeed = 0
		self.ShadowParams.maxspeeddamp = 0
		self.ShadowParams.dampfactor = 0.8
		self.ShadowParams.teleportdistance = 0
		self.ShadowParams.deltatime = deltatime
		phy:ComputeShadowControl( self.ShadowParams )
	end
	function ITEM:OnDraw( self ) if !self:GetNWBool( "XDEFM_PGr" ) then return end
		local gre = self:GetNWEntity( "XDEFM_Gre" )  if !IsValid( gre ) or gre:GetClass() != "base_anim" then return end
		render.SetMaterial( Mat ) local siz = 20 +math.sin( CurTime()*10 )*5
		render.DrawSprite( gre:WorldSpaceCenter() +gre:EyeAngles():Up()*3 +gre:EyeAngles():Forward()*1, siz, siz, Color( 255, 0, 0, 255 ) )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_brick"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_debris/concrete_cynderblock001.mdl",
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 50, PhysSound = "Concrete.ImpactHard" }
	function ITEM:OnInit( self ) self.xdefm_Thrown = 0 end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 25 ) end
	function ITEM:OnStore( self, ent ) if self.xdefm_Thrown > 0 then return false end end
	function ITEM:OnUse( self, ent ) if self.xdefm_Thrown > 0 then return false end end
	function ITEM:OnDrop( self, ent, typ ) if !typ or self.xdefm_Thrown > 0 then return end
		self:EmitSound( "Zombie.AttackMiss" )
		self:SetAngles( Angle( ent:EyeAngles().pitch, ent:EyeAngles().yaw, 0 ) )
		self:GetPhysicsObject():SetVelocity( ent:EyeAngles():Forward()*1500 )
		self:GetPhysicsObject():AddAngleVelocity( Vector( 0, 10, 0 )*150 ) xdefm_NoTool( self )
		self:SetCollisionGroup( COLLISION_GROUP_NONE ) self.xdefm_Thrown = 1  SafeRemoveEntityDelayed( self, 30 )
	end
	function ITEM:OnCollide( self, dat )
		if self.xdefm_Thrown == 1 then self:EmitSound( "Breakable.Concrete" )
			local eff = EffectData() eff:SetOrigin( self:WorldSpaceCenter() )
			eff:SetScale( 6 ) eff:SetMagnitude( 5 ) eff:SetRadius( 1 ) util.Effect( "GlassImpact", eff )
			SafeRemoveEntity( self ) local ent = dat.HitEntity
			if IsValid( ent ) then local pos = dat.HitPos +dat.HitNormal
				if ent:IsNPC() or ent:IsPlayer() then
					sound.Play( "physics/body/body_medium_impact_hard"..math.random( 1, 6 )..".wav", pos, 80, 100, 1 )
				end local dmg = DamageInfo()  dmg:SetDamagePosition( pos ) dmg:SetDamageForce( dat.HitNormal*10000 )
				dmg:SetDamageType( DMG_FALL ) dmg:SetAttacker( self:GetFMod_OW() ) dmg:SetInflictor( self ) dmg:SetDamage( 50 )
				local tr = util.TraceLine( { start = dat.HitPos +dat.HitNormal, endpos = dat.HitPos -dat.HitNormal, filter = self } )
				ent:DispatchTraceAttack( dmg, tr, dat.HitNormal )
			end self.xdefm_Thrown = 2
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_health"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/Items/HealthKit.mdl", HelperUse = "xdefm.U2"
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 100, PhysSound = "Plastic_Box.ImpactSoft" }
	function ITEM:OnInit( self ) self.xdefm_Used = false end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Health() >= ent:GetMaxHealth() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() +100 ) )
		ent:EmitSound( "HealthKit.Touch" ) self:Remove() self.xdefm_Used = true return false
	end
	function ITEM:OnTouch( self, ent, typ ) if !IsValid( ent ) or ent:GetClass() != "xdefm_base" or self.xdefm_Used then return end
		local aa, bb = xdefm_ItemGet( ent ) if !istable( bb ) or bb.Type != "Creature" or ent:GetMaxHealth() <= 0 or ent:Health() >= ent:GetMaxHealth() then return end
		if ent.xdefm_Killed then local aa, bb = xdefm_ItemGet( ent )
			if istable( aa ) and isnumber( tonumber( aa[ 3 ] ) ) and tonumber( aa[ 3 ] ) > 0 then return end
			ent:EmitSound( "HealthKit.Touch" ) self:Remove() self.xdefm_Used = true
			local ef = EffectData() ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetEntity( self ) ef:SetRadius( 5 )
			ef:SetScale( 5 ) ef:SetMagnitude( 2 ) util.Effect( "ElectricSpark", ef ) ent.xdefm_Killed = false
			if IsValid( ent:GetPhysicsObject() ) then ent:GetPhysicsObject():EnableGravity( true ) ent:GetPhysicsObject():Wake() end
			ent:SetColor( Color( 255, 255, 255 ) )
		end ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() +100 ) )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_armor"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/items/battery.mdl", HelperUse = "xdefm.U2"
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 80, PhysSound = "Plastic_Box.ImpactSoft" }
	function ITEM:OnInit( self ) self.xdefm_Used = false end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Armor() >= ent:GetMaxArmor() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end ent:SetArmor( math.min( ent:GetMaxArmor(), ent:Armor() +100 ) )
		ent:EmitSound( "ItemBattery.Touch" ) self:Remove() self.xdefm_Used = true return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_paper"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props/cs_office/paper_towels.mdl",
	Helper = "#xdefm.d"..it, Rarity = 1, Price = 15, KillInWater = true, PhysSound = "Cardboard.ImpactHard" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_dollar"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props/cs_assault/money.mdl",
	Helper = "#xdefm.d"..it, Rarity = 1, Price = 200, PhysSound = "Sand.BulletImpact" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_coin"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/money/silvcoin.mdl",
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 500, PhysSound = "Chain.ImpactHard" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_register"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_c17/cashregister01a.mdl",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 400, PhysSound = "SolidMetal.ImpactSoft" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 50 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Breakable.Metal" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local lt = {["it_dollar"]=200,["it_coin"]=50,["ba_money"]=25,["it_coin2"]=1} for i=1, math.random( 4, 6 ) do xdefm_LootDrop( lt, self ) end
		xdefm_BreakEffect( self, 3 ) self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_pallet"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props/cs_assault/moneypallet.mdl",
	Helper = "#xdefm.d"..it, Rarity = 4, Price = 5000, Carryable = false, PhysSound = "Wood_Crate.ImpactHard" }
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMaterial( "wood" ) self:GetPhysicsObject():SetBuoyancyRatio( 5 ) end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "cr_dollar"
	local ITEM = { Name = "#xdefm."..it, Type = "Creature", Model = "models/props_collectables/money_wad.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 750, TickRate = 1, MinSize = 0.8, MaxSize = 1.4 }
	function ITEM:OnInit( self ) self:SetMaxHealth( 25 ) self:SetHealth( self:GetMaxHealth() )
		self:SetBloodColor( BLOOD_COLOR_RED ) self:PhysicsInit( SOLID_VPHYSICS )
		self:GetPhysicsObject():SetMaterial( "flesh" ) self:SetCollisionGroup( COLLISION_GROUP_NPC )
		self.xdefm_NextSnd = 0  self.xdefm_Killed = false  self.xdefm_AtkD = CurTime() +1
		self.xdefm_NextTouch = 0
	end
	function ITEM:OnCaught( self ) self:EmitSound( "NPC_PoisonZombie.Alert" ) self.xdefm_NextSnd = CurTime() +math.Rand( 2, 3 ) end
	function ITEM:OnTouch( self, ent, typ ) if !isnumber( self.xdefm_NextTouch ) or self.xdefm_Killed or self.xdefm_NextTouch > CurTime() then return end
		self.xdefm_NextTouch = CurTime() + 0.5  if !ent:IsPlayer() and !ent:IsNPC() then return end
		ent:StopSound( "Zombie.AttackHit" ) ent:EmitSound( "Zombie.AttackHit" )
		local vel = ( self:WorldSpaceCenter() - ent:WorldSpaceCenter() ):GetNormalized()
		local dmg = DamageInfo() dmg:SetDamage( 10 ) dmg:SetAttacker( self:GetFMod_OW() )
		dmg:SetInflictor( self ) dmg:SetDamageType( DMG_BURN ) dmg:SetDamagePosition( ent:WorldSpaceCenter() )
		dmg:SetDamageForce( vel*10000 ) ent:TakeDamageInfo( dmg )
		self:GetPhysicsObject():SetVelocity( vel*400 )  ent:SetVelocity( vel*-250 )
		if IsValid( ent:GetPhysicsObject() ) then ent:GetPhysicsObject():SetVelocity( vel*-250 ) end
	end
	function ITEM:OnThink( self ) if self.xdefm_Killed then return end
		if math.random( 1, 40 ) == 1 and self.xdefm_NextSnd <= CurTime() then self.xdefm_NextSnd = CurTime() +math.Rand( 2, 4 )
			self:EmitSound( "NPC_PoisonZombie.Idle" )
		end if self:WaterLevel() > 0 or self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() then return end
		if self.xdefm_AtkD <= CurTime() then self.xdefm_AtkD = CurTime() +1  local tas = {}
			for k, v in pairs( ents.FindInSphere( self:GetPos(), 512 ) ) do
				if ( !v:IsNPC() and !v:IsPlayer() )or !isstring( v:GetModel() ) or !util.IsValidModel( v:GetModel() )
				or v:Health() <= 0 then continue end table.insert( tas, v )
			end if #tas > 0 then local tar = tas[ math.random( #tas ) ]
				local tr = util.TraceLine( { start = self:WorldSpaceCenter(), endpos = tar:EyePos(), filter = { tar, self }, mask = MASK_NPCSOLID } )
				if !tr.Hit then self:GetPhysicsObject():SetVelocity( ( tar:EyePos() -self:WorldSpaceCenter() ):GetNormal()*400 )
					if self.xdefm_NextSnd <= CurTime() then self.xdefm_NextSnd = CurTime() +1
						self:EmitSound( "NPC_PoisonZombie.Attack" )
					end
				end
			end
		end
	end
	function ITEM:OnUse( self ) if !self.xdefm_Killed then return false end end
	function ITEM:OnStore( self ) if !self.xdefm_Killed then return false end end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 10 ) self:SetTrigger( true ) self:UseTriggerBounds( true, 4 ) end
	function ITEM:OnPlayerDrop( self, own ) self:SetHealth( 0 ) self:SetColor( Color( 255, 155, 155 ) ) self.xdefm_Anim = "idle"
	self.xdefm_Killed = true end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed then return end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) )
		if self:Health() <= 0 then self:SetColor( Color( 255, 155, 155 ) )
		self:EmitSound( "NPC_PoisonZombie.Die" ) self.xdefm_Killed = true end
	end
	function ITEM:OnDraw( self )
		if !self.Emitter or !IsValid( self.Emitter ) then
			self.Emitter = ParticleEmitter( self:WorldSpaceCenter() )
			self:CallOnRemove( "XDEEmitter", function( self ) if self.Emitter then self.Emitter:Finish() end end )
		elseif self:Health() > 0 then
			if !isnumber( self.xdefm_Ptc ) or self.xdefm_Ptc <= CurTime() then self.xdefm_Ptc = CurTime() +0.05
				local particle = self.Emitter:Add( "particle/smokesprites_000"..math.random( 1, 9 ), self:WorldSpaceCenter() +VectorRand():GetNormal()*5 )
				local vel = VectorRand():GetNormal()*15
				particle:SetVelocity( vel )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( math.Rand( 1, 1.5 ) )
				particle:SetEndAlpha( 0 )
				local Size = math.Rand( 5, 10 )
				particle:SetStartSize( Size )
				particle:SetEndSize( Size*2 )		
				particle:SetRoll( 6 )
				particle:SetRollDelta( 1 )
				particle:SetAirResistance( 200 )
				particle:SetGravity( Vector( 0, 0, 0 ) )
				particle:SetColor( 0, 0, 0 )
				particle:SetStartAlpha( 155 )
				particle:SetCollide( false )
				particle:SetBounce( 0 )
				particle:SetLighting( false )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_present"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/effects/bday_gib01.mdl", "models/effects/bday_gib02.mdl",
	"models/effects/bday_gib03.mdl", "models/effects/bday_gib04.mdl" },
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 200, PhysSound = "Cardboard.ImpactSoft", HelperUse = "xdefm.U2" }
	if CLIENT then -- xdefm_present
		local EFFECT = {}
		function EFFECT:Init( data ) local pos = data:GetOrigin()  self.Emitter = ParticleEmitter( pos )
			self:SetRenderBoundsWS( pos -Vector( 128, 128, 128 ), pos +Vector( 128, 128, 128 ) )
			for i=1, 30 do local pp = ( pos +VectorRand():GetNormalized()*5 )
				local particle = self.Emitter:Add( "effects/spark", pp )
				if particle then local col = HSVToColor( ( CurTime()*300 +i*10 )%360, 1, 1 )
					particle:SetVelocity( VectorRand():GetNormalized()*75 +Vector( 0, 0, 100 ) )
					particle:SetLifeTime( 0 )
					particle:SetDieTime( math.Rand( 2, 4 ) )
					particle:SetStartAlpha( 255 )
					particle:SetEndAlpha( 255 ) local Siz = math.Rand( 3, 6 )
					particle:SetStartSize( Siz )
					particle:SetEndSize( Siz )
					particle:SetStartLength( math.Rand( 3, 6 ) )
					particle:SetEndLength( 0 )
					particle:SetColor( col.r, col.g, col.b )
					particle:SetGravity( Vector( 0, 0, -300 ) )
					particle:SetAirResistance( 50 )
					particle:SetCollide( true )
					particle:SetBounce( 1 )
					particle:SetThinkFunction( function( particle )
						local col = HSVToColor( ( CurTime()*300 +i*10 )%360, 1, 1 )
						particle:SetColor( col.r, col.g, col.b )
						particle:SetNextThink( CurTime() +0.1 )
					end ) particle:SetNextThink( CurTime() +0.1 )
				end
			end
			self.Emitter:Finish()
		end
		function EFFECT:Think() return false end
		function EFFECT:Render() end
		effects.Register( EFFECT, "xdefm_present" )
	end
	function ITEM:OnInit( self ) self.xdefm_Killed = false end
	function ITEM:OnUse( self, ent ) if self.xdefm_Killed or !ent:IsPlayer() or !istable( ent.xdefm_Profile ) then return end
		if ent:KeyDown( IN_SPEED ) then return true end
		xdefm_BroadEffect( "xdefm_present", { Origin = self:WorldSpaceCenter() } )  self.xdefm_Killed = true
		local ran = math.random( 1, 1000 )  if math.random( 1, 10 ) == 1 then
		self:EmitSound( "misc/happy_birthday.wav" ) ran = math.random( 1000, 2500 )
		else self:EmitSound( "garrysmod/balloon_pop_cute.wav" ) end self:Remove() xdefm_GiveMoney( ent, ran )
		xdefm_AddNote( ent, "xdefm.GetMoney&: "..ran, "!V", "coins", 5 ) return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_rottenmeat"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/Gibs/HGIBS_rib.mdl", "models/Gibs/HGIBS_scapula.mdl",
	"models/Gibs/HGIBS_spine.mdl", "models/gibs/antlion_gib_medium_1.mdl", "models/gibs/antlion_gib_medium_2.mdl", "models/gibs/antlion_gib_small_2.mdl",
	"models/gibs/antlion_gib_small_1.mdl", "models/gibs/antlion_gib_medium_3.mdl" }
	, Helper = "#xdefm.d"..it, Rarity = 1, Price = 10, PhysSound = "Flesh_Bloody.ImpactHard", TickRate = 1 }
	function ITEM:OnInit( self ) self:SetMaterial( "models/flesh" ) self:SetColor( Color( 255, 255, 0 ) ) self.xdefm_Kill = CurTime() +60 end
	function ITEM:OnThink( self ) if self.xdefm_Kill > CurTime() then return end
		xdefm_BroadEffect( "BloodImpact", { Flags = 0, Origin = self:GetPos(), Scale = 1, Radius = 1, Magnitude = 1 } )
		self:EmitSound( "Flesh_Bloody.ImpactHard" ) self:Remove()
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_corpse"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/Zombie/Fast.mdl", "models/Zombie/Classic.mdl",
	"models/Zombie/Poison.mdl", "models/Humans/corpse1.mdl", "models/Zombie/Classic_legs.mdl", "models/Gibs/Fast_Zombie_Legs.mdl",
	"models/Zombie/Classic_torso.mdl", "models/zombie/fast_torso.mdl" }
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 500, PhysSound = "Flesh.ImpactSoft" }
	function ITEM:OnInit( self ) self:PhysicsInitBox( self:OBBMins(), self:OBBMaxs() )
		self:SetCollisionBounds( self:OBBMins(), self:OBBMaxs() ) self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSequence( 1 ) self:SetPlaybackRate( 0 ) self:SetMaxHealth( math.random( 100, 200 ) ) self:SetHealth( self:GetMaxHealth() )
		self:GetPhysicsObject():Wake() self:SetColor( Color( 255, 255, 255 ) ) return true
	end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed then return end self:EmitSound( "Flesh_Bloody.ImpactHard" )
		local hp = math.Clamp( self:Health()/self:GetMaxHealth(), 0, 1 )*255  self:SetColor( Color( 255, hp, hp ) )
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) if self:Health() <= 0 then
			self:EmitSound( "Breakable.Flesh" ) self.xdefm_Killed = true
			local lt = {["it_rottenmeat"]=5,["it_bone"]=5,["ba_meat"]=1,["it_meat"]=1} for i=1, math.random( 3, 6 ) do xdefm_LootDrop( lt, self ) end
			if math.random( 1, 25 ) == 1 then xdefm_LootDrop( {["ba_skull"]=1}, self ) end SafeRemoveEntityDelayed( self, 0.1 )
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_gravestone"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props_c17/gravestone001a.mdl", "models/props_c17/gravestone002a.mdl",
	"models/props_c17/gravestone003a.mdl", "models/props_c17/gravestone004a.mdl" }
	, Helper = "#xdefm.d"..it, Rarity = 1, Price = 60, PhysSound = "Concrete.ImpactHard" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 100 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed then return end self:EmitSound( "Breakable.MatConcrete" )
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) if self:Health() <= 0 then self.xdefm_Killed = true
			xdefm_BreakEffect( self, 4 ) self:Remove()
			local lt = {["it_stone"]=100,["it_rottenmeat"]=20} for i=1, math.random( 3, 6 ) do xdefm_LootDrop( lt, self ) end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "cr_crab"
	local ITEM = { Name = "#xdefm."..it, Type = "Creature", Model = "models/headcrabclassic.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 80, TickRate = 0.1, MinSize = 0.6, MaxSize = 1.4 }
	ITEM.Constants = { Health = 20, Force = 75, PainSnd = "NPC_HeadCrab.Pain", DieSnd = "NPC_HeadCrab.Die", JumpSnd = "NPC_Headcrab.Attack",
	FlyAct = "Drown", IdleAct = "Idle01", Damage = 25, DamageType = DMG_CLUB, AtkSnd = "NPC_FastHeadcrab.Bite", JumpFreq = 25, LPos = Vector( 0, 0, 8 ), LDis = 20 }
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetBuoyancyRatio( 1 ) self:SetTrigger( true ) self:StartMotionController() self:PhysWake() end
	function ITEM:OnInit( self ) local con = self.xdefm_T2.Constants  self:SetCollisionGroup( COLLISION_GROUP_NPC )
		self:SetMaxHealth( con.Health ) self:SetHealth( self:GetMaxHealth() ) self.ShadowParams = {}
		self:PhysicsInitBox( self:OBBMins() +con.LPos, self:OBBMaxs() ) self:SetAutomaticFrameAdvance( true )
		self:SetCollisionBounds( self:OBBMins() +con.LPos, self:OBBMaxs() )
		self:SetBloodColor( BLOOD_COLOR_GREEN ) self:GetPhysicsObject():SetMaterial( "flesh" )
		self.xdefm_Killed = false  self.xdefm_Jump = CurTime() +0.5  self.xdefm_Act = true
		self:ResetSequence( con.FlyAct ) self:SetPlaybackRate( 1 ) return true
	end
	function ITEM:OnTouch( self, ent, typ ) if self.xdefm_Killed or typ != 1 then return end local con = self.xdefm_T2.Constants
		if ( !ent:IsPlayer() and !ent:IsNPC() ) or ( self:GetSequenceName( self:GetSequence() ) != "Drown" and self.xdefm_Jump <= CurTime() ) then return end
		ent:StopSound( con.AtkSnd ) ent:EmitSound( con.AtkSnd )
		local vel = ( self:WorldSpaceCenter() - ent:WorldSpaceCenter() ):GetNormalized()
		self:GetPhysicsObject():SetVelocity( vel*con.Force*2 )  ent:SetVelocity( vel*-con.Force*4 )
		local dmg = DamageInfo() dmg:SetDamage( con.Damage ) dmg:SetAttacker( self:GetFMod_OW() )
		dmg:SetInflictor( self ) dmg:SetDamageType( con.DamageType ) dmg:SetDamagePosition( ent:WorldSpaceCenter() )
		dmg:SetDamageForce( vel*10000 ) ent:TakeDamageInfo( dmg )
		if IsValid( ent:GetPhysicsObject() ) then ent:GetPhysicsObject():SetVelocity( vel*-con.Force*4 ) end
	end
	function ITEM:OnPlayerDrop( self, own ) self:SetHealth( 0 ) self:SetColor( Color( 255, 155, 155 ) )
	self.xdefm_Killed = true  self:ResetSequence( self.xdefm_T2.Constants.FlyAct ) self:SetPlaybackRate( 0 ) end
	function ITEM:OnThink( self ) if self.xdefm_Killed or self.xdefm_Jump > CurTime() then return end local con = self.xdefm_T2.Constants
		local lp = self:LocalToWorld( con.LPos )  local tr = util.TraceHull( { start = lp, endpos = lp -Vector( 0, 0, con.LDis ), filter = self, mask = MASK_NPCSOLID, mins = Vector( -8, -8, -2 ), maxs = Vector( 8, 8, 2 ) } )
		if !tr.Hit or self:WaterLevel() > 0 or self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() then
		if !self.xdefm_Act then self.xdefm_Act = true  self:ResetSequence( con.FlyAct ) self:SetPlaybackRate( 1 ) end return end
		if self.xdefm_Act then self.xdefm_Act = false  self:ResetSequence( con.IdleAct ) self:SetPlaybackRate( 1 ) end
		if math.random( 1, con.JumpFreq ) == 1 then self.xdefm_Jump = CurTime() +0.2  self:EmitSound( con.JumpSnd )
			local vel = VectorRand():GetNormal()*math.Rand( con.Force, con.Force*2 )  local ang = Angle( 0, vel:Angle().yaw, 0 )
			self:SetAngles( ang )  self:GetPhysicsObject():SetVelocity( Vector( vel.x, vel.y, math.abs( vel.z ) ) )  self.xdefm_Act = false  return true
		else if self:GetSequenceName( self:GetSequence() ) != con.IdleAct then self:SetSequence( con.IdleAct ) self:SetPlaybackRate( 1 ) end end
	end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed then return end local con = self.xdefm_T2.Constants
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) )
		if self:Health() <= 0 then self:SetColor( Color( 255, 155, 155 ) ) self:EmitSound( con.DieSnd )
		self:ResetSequence( con.FlyAct ) self:SetPlaybackRate( 0 )
		self.xdefm_Killed = true else self:EmitSound( con.PainSnd ) end
	end
	function ITEM:OnPhysSimulate( self, phy, del ) if self.xdefm_Killed then return end
		if self:WaterLevel() > 0 or self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() then return end phy:Wake()
		self.ShadowParams.pos = self:GetPos()
		self.ShadowParams.angle = Angle( 0, self:GetAngles().yaw, 0 )
		self.ShadowParams.maxangular = 1000
		self.ShadowParams.maxangulardamp = 10000
		self.ShadowParams.maxspeed = 0
		self.ShadowParams.maxspeeddamp = 0
		self.ShadowParams.dampfactor = 0.8
		self.ShadowParams.teleportdistance = 0
		self.ShadowParams.deltatime = deltatime
		phy:ComputeShadowControl( self.ShadowParams )
	end
	function ITEM:OnDraw( self )
		if self:Health() > 0 and GetConVar( "developer" ):GetInt() > 0 then local aa, bb = xdefm_ItemGet( self:GetFMod_DT() )  if !istable( bb ) then return end
			local lp = self:LocalToWorld( bb.Constants.LPos )
			local tr = util.TraceLine( { start = lp, endpos = lp -Vector( 0, 0, bb.Constants.LDis ), filter = self, mask = MASK_NPCSOLID } )
			cam.IgnoreZ( true ) render.SetColorMaterial()
				render.DrawSphere( lp, 2, 20, 20, Color( 255, 255, 0 ), true )
				render.DrawWireframeBox( tr.HitPos, tr.HitNormal:Angle() +Angle( 90, 0, 0 ), Vector( -8, -8, -2 ), Vector( 8, 8, 2 ), tr.Hit and Color( 0, 255, 0 ) or Color( 255, 255, 255 ), true )
			cam.IgnoreZ( false )
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "cr_crab2"
	local ITEM = { Name = "#xdefm."..it, Type = "Creature", Model = { "models/headcrab.mdl" }
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 100, TickRate = 0.1, MinSize = 0.6, MaxSize = 1.4 }
	ITEM.Constants = { Health = 20, Force = 125, PainSnd = "NPC_HeadCrab.Pain", DieSnd = "NPC_HeadCrab.Die", JumpSnd = "NPC_Headcrab.Attack",
	FlyAct = "Drown", IdleAct = "Idle01", Damage = 25, DamageType = DMG_CLUB, AtkSnd = "NPC_FastHeadcrab.Bite", JumpFreq = 5, LPos = Vector( 0, 0, 8 ), LDis = 20 }
	xdefm_ItemBased( "cr_crab", it, ITEM )
end
if true then local it = "cr_crab3"
	local ITEM = { Name = "#xdefm."..it, Type = "Creature", Model = { "models/headcrabblack.mdl" }
	, Helper = "#xdefm.d"..it, Rarity = 3, Price = 300, TickRate = 0.1, MinSize = 0.6, MaxSize = 1.4 }
	ITEM.Constants = { Health = 30, Force = 150, PainSnd = "NPC_BlackHeadcrab.Pain", DieSnd = "NPC_BlackHeadcrab.Die", JumpSnd = "NPC_BlackHeadcrab.Talk",
	FlyAct = "Drown", IdleAct = "Idle01", Damage = 50, DamageType = DMG_POISON, AtkSnd = "NPC_BlackHeadcrab.Bite", JumpFreq = 30, LPos = Vector( 0, 0, 8 ), LDis = 20 }
	xdefm_ItemBased( "cr_crab", it, ITEM )
end
if true then local it = "cr_gnome"
	sound.Add( { name = "xdefm.GnomeDie", channel = CHAN_VOICE, volume = 1, level = 75, pitch = 200, sound = "*vo/ravenholm/monk_death07.wav" } )
	sound.Add( { name = "xdefm.GnomePain", channel = CHAN_VOICE, volume = 1, level = 75, pitch = 200,
	sound = { "*vo/ravenholm/monk_pain01.wav", "*vo/ravenholm/monk_pain02.wav", "*vo/ravenholm/monk_pain03.wav",
		"*vo/ravenholm/monk_pain04.wav", "*vo/ravenholm/monk_pain05.wav", "*vo/ravenholm/monk_pain06.wav",
		"*vo/ravenholm/monk_pain07.wav", "*vo/ravenholm/monk_pain08.wav", "*vo/ravenholm/monk_pain09.wav",
		"*vo/ravenholm/monk_pain10.wav", "*vo/ravenholm/monk_pain12.wav" } } )
	sound.Add( { name = "xdefm.GnomeLaugh", channel = CHAN_VOICE, volume = 1, level = 75, pitch = 200,
	sound = { "*vo/ravenholm/madlaugh01.wav", "*vo/ravenholm/madlaugh02.wav", "*vo/ravenholm/madlaugh03.wav",
		"*vo/ravenholm/madlaugh04.wav" } } )
	local ITEM = { Name = "#xdefm."..it, Type = "Creature", Model = "models/props_junk/gnome.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 250, TickRate = 0.1, MinSize = 0.8, MaxSize = 1.4 }
	ITEM.Constants = { Health = 200, Force = 100, PainSnd = "xdefm.GnomePain", DieSnd = "xdefm.GnomeDie", JumpSnd = "xdefm.GnomeLaugh",
	FlyAct = "idle", IdleAct = "idle", Damage = 10, DamageType = DMG_CLUB, AtkSnd = "Flesh.ImpactHard", JumpFreq = 5, LPos = Vector( 0, 0, 0 ), LDis = 5 }
	xdefm_ItemBased( "cr_crab", it, ITEM )
end
if true then local it = "it_campfire"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_unique/firepit_campground.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 100, Carryable = false, TickRate = 1, PhysSound = "Concrete.ImpactHard", CantCook = true }
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( math.ceil( self:GetPhysicsObject():GetMass()*0.1 ) ) end
	function ITEM:OnInit( self )  self.xdefm_Spot = nil  self.xdefm_Pressed = 0  self.xdefm_Fire = -1  self.xdefm_Lit = nil
		self.xdefm_Spot = xdefm_FireSpot( self:LocalToWorld(Vector(0,0,6)), 1, 1, self )
		self.xdefm_Lit = ents.Create( "light_dynamic" )
		self.xdefm_Lit:SetPos( self:LocalToWorld(Vector(0,0,12)) ) self.xdefm_Lit:SetAngles( self:GetAngles() )
		self.xdefm_Lit:SetKeyValue( "_light", "255 155 55 255" )
		self.xdefm_Lit:SetKeyValue( "brightness", "1" ) self.xdefm_Lit:SetOwner( self ) self.xdefm_Lit:SetParent( self )
		self.xdefm_Lit:SetKeyValue( "distance", "0" ) self.xdefm_Lit:SetKeyValue( "style", "12" )
		self.xdefm_Lit:Spawn() self.xdefm_Lit:Activate() self:DeleteOnRemove( self.xdefm_Lit )
		self.xdefm_Lit:Fire( "TurnOff" )
	end
	function ITEM:OnUse( self, ply ) if ply:IsPlayer() and ply:KeyDown( IN_SPEED ) and self.xdefm_Fire != -1 and IsValid( self.xdefm_Spot ) then
			self.xdefm_Fire = -1  self.xdefm_Spot:SetFMod_Enable( false ) self.xdefm_Spot:SetFMod_Strength( 1 )
			if IsValid( self.xdefm_Lit ) then self.xdefm_Lit:SetKeyValue( "distance", "0" ) self.xdefm_Lit:Fire( "TurnOff" ) end
			self:EmitSound( "Physics.WaterSplash" ) return false
		end
	end
	function ITEM:OnThink( self ) if self.xdefm_Fire == -1 then return end
		self.xdefm_Fire = math.Clamp( self.xdefm_Fire -1, 0, 600 )
		if self.xdefm_Fire == 0 then self.xdefm_Fire = -1
			if IsValid( self.xdefm_Spot ) then
				self.xdefm_Spot:SetFMod_Enable( false ) self.xdefm_Spot:SetFMod_Strength( 1 )
				self.xdefm_Spot.xdefm_Power = 1
			end if IsValid( self.xdefm_Lit ) then self.xdefm_Lit:SetKeyValue( "distance", "0" ) self.xdefm_Lit:Fire( "TurnOff" ) end
		elseif self.xdefm_Fire > 0 and IsValid( self.xdefm_Spot ) then
            local pow = math.ceil( self.xdefm_Fire/30 )
			self.xdefm_Spot:SetFMod_Enable( true ) self.xdefm_Spot:SetFMod_Strength( pow*2 )
			self.xdefm_Spot.xdefm_Power = pow
			if IsValid( self.xdefm_Lit ) then self.xdefm_Lit:SetKeyValue( "distance", self.xdefm_Fire )
			self.xdefm_Lit:Fire( "TurnOn" ) end
		end
	end
    local fu = {["it_wood"]=20,["it_shoe"]=25,["it_coal"]=60,["it_junk"]=10,["it_paper"]=20,["it_dollar"]=15,["it_furniture1"]=45}
    function ITEM:OnTouch( self, ent, typ ) if typ != 1 or self.xdefm_Fire >= 300 then return end
        if ent:GetClass() == "xdefm_base" and isnumber( fu[ xdefm_GetClass( ent ) ] ) then local fue = fu[ xdefm_GetClass( ent ) ]
            self.xdefm_Fire = math.Clamp( self.xdefm_Fire + fue, 0, 300 )
			self:EmitSound( "ambient/fire/mtov_flame2.wav", 75, 100 +fue )
			self.xdefm_Spot:SetFMod_Enable( true ) local pow = math.ceil( self.xdefm_Fire/30 )
			self.xdefm_Spot:SetFMod_Strength( pow )
			self.xdefm_Spot.xdefm_Power = pow
			if IsValid( self.xdefm_Lit ) then self.xdefm_Lit:SetKeyValue( "distance", self.xdefm_Fire )
			self.xdefm_Lit:Fire( "TurnOn" ) end ent:Remove()
        end
    end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_stove1"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_interiors/makeshift_stove_battery.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 250, TickRate = 1, HelperUse = "xdefm.U4", PhysSound = "Metal_Barrel.ImpactHard", CantCook = true }
	function ITEM:OnInit( self )  self.xdefm_Enabled = 0  self.xdefm_Spot = nil  self.xdefm_Pressed = 0
		self.xdefm_Spot = xdefm_FireSpot( self:LocalToWorld(Vector(-2.5,-6.5,18)), 5, math.random( 0, 5 ), self )
	end
	function ITEM:OnUse( self, ent ) if self.xdefm_Pressed > CurTime() then return false end self.xdefm_Pressed = CurTime() +1
		if ent:KeyDown( IN_SPEED ) then return true end
        self.xdefm_Enabled = ( self.xdefm_Enabled > 0 and 0 or CurTime() +math.random( 1, 30 ) )
		local bb = ( self.xdefm_Enabled > 0 )  self:EmitSound( "Weapon_Shotgun.Empty" )
		if IsValid( self.xdefm_Spot ) then self.xdefm_Spot:SetFMod_Enable( bb ) end return false
	end
	function ITEM:OnThink( self )
		if self.xdefm_Enabled > 0 and IsValid( self.xdefm_Spot ) then self.xdefm_Spot.xdefm_Power = math.random( 0, 5 ) end
		if self.xdefm_Enabled <= CurTime() and self.xdefm_Enabled > 0 then
			self.xdefm_Enabled = 0  self:EmitSound( "buttons/lever6.wav" )  self.xdefm_Pressed = 0
			if IsValid( self.xdefm_Spot ) then self.xdefm_Spot:SetFMod_Enable( false ) end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_stove2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props/cs_militia/stove01.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 450, Carryable = false, HelperUse = "xdefm.U4", TickRate = 1, PhysSound = "Metal_Barrel.ImpactHard", CantCook = true }
	function ITEM:OnInit( self )  self.xdefm_Enabled = 0  self.xdefm_Spots = {}  self.xdefm_Pressed = 0
		self.xdefm_Spots[ 1 ] = xdefm_FireSpot( self:LocalToWorld(Vector(6,12,16)), 5, 2, self )
		self.xdefm_Spots[ 2 ] = xdefm_FireSpot( self:LocalToWorld(Vector(6,-12,16)), 5, 2, self )
	end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( math.ceil( self:GetPhysicsObject():GetMass()*0.05 ) ) end
	function ITEM:OnUse( self, ent ) if self.xdefm_Pressed > CurTime() then return false end self.xdefm_Pressed = CurTime() +1
		if ent:KeyDown( IN_SPEED ) then return true end
        self.xdefm_Enabled = ( self.xdefm_Enabled > 0 and 0 or CurTime() +math.random( 40, 60 ) )  local bb = ( self.xdefm_Enabled > 0 )
		self:EmitSound( "buttons/lever"..( bb and "7" or "8" )..".wav" )
		for k, v in pairs( self.xdefm_Spots ) do if !IsValid( v ) then continue end v:SetFMod_Enable( bb ) end return false
	end
	function ITEM:OnThink( self ) if self.xdefm_Enabled > CurTime() or self.xdefm_Enabled <= 0 then return end
		self.xdefm_Enabled = 0  self:EmitSound( "buttons/lever8.wav" )  self.xdefm_Pressed = 0
		for k, v in pairs( self.xdefm_Spots ) do if !IsValid( v ) then continue end v:SetFMod_Enable( false ) end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_stove3"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_c17/furniturestove001a.mdl", Helper = "#xdefm.d"..it,
	Rarity = 3, Price = 750, Carryable = false, HelperUse = "xdefm.U4", TickRate = 1, PhysSound = "Metal_Barrel.ImpactHard", CantCook = true }
	function ITEM:OnInit( self )  self.xdefm_Enabled = 0  self.xdefm_Spots = {}  self.xdefm_Pressed = 0
		self.xdefm_Spots[ 1 ] = xdefm_FireSpot( self:LocalToWorld(Vector(3,11,20)), 3, 6, self )
		self.xdefm_Spots[ 2 ] = xdefm_FireSpot( self:LocalToWorld(Vector(3,-11,20)), 3, 6, self )
		self.xdefm_Spots[ 3 ] = xdefm_FireSpot( self:LocalToWorld(Vector(-10,11,20)), 3, 6, self )
		self.xdefm_Spots[ 4 ] = xdefm_FireSpot( self:LocalToWorld(Vector(-10,-11,20)), 3, 6, self )
	end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( math.ceil( self:GetPhysicsObject():GetMass()*0.1 ) ) end
	function ITEM:OnUse( self, ent ) if self.xdefm_Pressed > CurTime() then return false end self.xdefm_Pressed = CurTime() +1
		if ent:KeyDown( IN_SPEED ) then return true end
        self.xdefm_Enabled = ( self.xdefm_Enabled > 0 and 0 or CurTime() +600 )  local bb = ( self.xdefm_Enabled > 0 )
		self:EmitSound( "buttons/lever"..( bb and "7" or "8" )..".wav" )
		for k, v in pairs( self.xdefm_Spots ) do if !IsValid( v ) then continue end v:SetFMod_Enable( bb ) end return false
	end
	function ITEM:OnThink( self ) if self.xdefm_Enabled > CurTime() or self.xdefm_Enabled <= 0 then return end
		self.xdefm_Enabled = 0  self:EmitSound( "buttons/lever8.wav" )  self.xdefm_Pressed = 0
		for k, v in pairs( self.xdefm_Spots ) do if !IsValid( v ) then continue end v:SetFMod_Enable( false ) end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_furniture1"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props_c17/FurnitureChair001a.mdl", "models/props_c17/FurnitureTable001a.mdl",
	"models/props_c17/FurnitureTable002a.mdl", "models/props_c17/FurnitureTable003a.mdl", "models/props_interiors/Furniture_Vanity01a.mdl", "models/props_interiors/Furniture_Couch02a.mdl",
	"models/props_c17/bench01a.mdl", "models/props_c17/FurnitureDrawer002a.mdl", "models/props_c17/FurnitureDresser001a.mdl" }
	, Helper = "#xdefm.d"..it, Rarity = 1, Price = 25, PhysSound = "Wood.ImpactHard", Carryable = false }
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( self:GetPhysicsObject():GetMass()*0.1 ) end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_furniture2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props_c17/chair02a.mdl", "models/props_c17/FurnitureBathtub001a.mdl", "models/props_c17/door01_left.mdl",
	"models/props_c17/FurnitureRadiator001a.mdl", "models/props_c17/FurnitureWashingmachine001a.mdl", "models/props_c17/Lockers001a.mdl", "models/props_combine/breendesk.mdl",
	"models/props_interiors/Furniture_chair03a.mdl", "models/props_junk/PushCart01a.mdl", "models/props_junk/ravenholmsign.mdl", "models/props_wasteland/controlroom_chair001a.mdl",
	"models/props_wasteland/controlroom_desk001a.mdl", "models/props_wasteland/controlroom_desk001b.mdl", "models/props_wasteland/controlroom_storagecloset001a.mdl", "models/props_interiors/bathtub01a.mdl" }
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 125, PhysSound = "Metal_Box.ImpactHard", Carryable = false }
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( self:GetPhysicsObject():GetMass()*0.1 ) end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_radio"
	local so = { "ambient/music/mirame_radio_thru_wall.wav", "ambient/music/cubanmusic1.wav",
	"ambient/music/country_rock_am_radio_loop.wav", "ambient/music/flamenco.wav", "ambient/music/latin.wav",
	"ambient/music/piano1.wav", "ambient/music/piano2.wav" }
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_lab/citizenradio.mdl",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 400, PhysSound = "MetalVent.ImpactHard", TickRate = 0.1 }
	function ITEM:OnInit( self ) self.xdefm_Snd = CreateSound( self, Sound( so[ math.random( #so ) ] ) )
		self.xdefm_Snd:Play()  self.xdefm_BrokenDelay = -1
	end
	function ITEM:OnUse( self, ent ) if self.xdefm_BrokenDelay > CurTime() then return end
		if ent:IsPlayer() and ent:KeyDown( IN_SPEED ) then self.xdefm_BrokenDelay = CurTime() +1
		if self.xdefm_Snd then self.xdefm_Snd:Stop()  self.xdefm_Snd = nil end
		self:StopSound( "eli_lab.al_buttonmash" ) self:EmitSound( "eli_lab.al_buttonmash" ) return false end
	end
	function ITEM:OnThink( self ) if self.xdefm_BrokenDelay > CurTime() then return end
		if self.xdefm_Snd and !self.xdefm_Snd:IsPlaying() then self.xdefm_Snd:Play() end
		if !self.xdefm_Snd then self.xdefm_Snd = CreateSound( self, Sound( so[ math.random( #so ) ] ) ) self.xdefm_Snd:Play() end
	end
	function ITEM:OnDamaged( self ) if self.xdefm_BrokenDelay > CurTime() then return end
		self:StopSound( "DoSpark" ) self:EmitSound( "DoSpark" )
		local ef = EffectData() ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetEntity( self ) ef:SetRadius( 5 )
		ef:SetScale( 5 ) ef:SetMagnitude( 2 ) util.Effect( "ElectricSpark", ef )
		self.xdefm_BrokenDelay = CurTime() +1
		if self.xdefm_Snd then self.xdefm_Snd:Stop()  self.xdefm_Snd = nil end
	end
	function ITEM:OnCollide( self, dat ) if self.xdefm_BrokenDelay > CurTime() then return end
		if dat.Speed >= 80 and dat.DeltaTime > 0.2 then self:TakeDamage( 1 ) end
	end
	function ITEM:OnRemove( self ) if self.xdefm_Snd then self.xdefm_Snd:Stop()  self.xdefm_Snd = nil end end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_orange"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props/cs_italy/orange.mdl", Helper = "#xdefm.d"..it,
	Rarity = 1, Price = 16, PhysSound = "Watermelon.Impact", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Used = false end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Health() >= ent:GetMaxHealth() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end local met = xdefm_CookMeter( self:GetFMod_DT() )
		if met >= 0 then ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() +math.ceil( 8*( 1 +met ) ) ) ) end
		ent:EmitSound( "NPC_Barnacle.FinalBite" ) self:Remove() self.xdefm_Used = true return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_apple"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/maniasfood/apple/apple.mdl", Helper = "#xdefm.d"..it,
	Rarity = 1, Price = 12, PhysSound = "Watermelon.Impact", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Used = false end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 15 ) end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Health() >= ent:GetMaxHealth() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end local met = xdefm_CookMeter( self:GetFMod_DT() )
		if met >= 0 then ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() +math.ceil( 6*( 1 +met ) ) ) ) end
		ent:EmitSound( "NPC_Barnacle.FinalBite" ) self:Remove() self.xdefm_Used = true return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_banana"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props/cs_italy/bananna_bunch.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 40, PhysSound = "Watermelon.Impact", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Used = false end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Health() >= ent:GetMaxHealth() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end local met = xdefm_CookMeter( self:GetFMod_DT() )
		if met >= 0 then ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() +math.ceil( 20*( 1 +met ) ) ) ) end
		ent:EmitSound( "NPC_Barnacle.FinalBite" ) self:Remove() self.xdefm_Used = true return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_melon"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/watermelon01.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 60, PhysSound = "Watermelon.Impact", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 10 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed then return end self:EmitSound( "Watermelon.BulletImpact" )
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) if self:Health() <= 0 then self.xdefm_Killed = true
			self:Remove() local lt = {["it_melo"]=1} for i=1, math.random( 4, 6 ) do xdefm_LootDrop( lt, self ) end
		end
	end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Health() >= ent:GetMaxHealth() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end local met = xdefm_CookMeter( self:GetFMod_DT() )
		if met >= 0 then ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() +math.ceil( 30*( 1 +met ) ) ) ) end
		ent:EmitSound( "NPC_Barnacle.FinalBite" ) self:Remove() self.xdefm_Used = true return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_melo"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props_junk/watermelon01_chunk01b.mdl", "models/props_junk/watermelon01_chunk01c.mdl" },
	Helper = "#xdefm.d"..it, Rarity = 1, PhysSound = "Watermelon.Impact", Price = 10, HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Used = false  self.xdefm_Touch = 0  self:SetCollisionGroup( COLLISION_GROUP_WEAPON ) end
	function ITEM:OnReady( self ) self:SetTrigger( true ) end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Health() >= ent:GetMaxHealth() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end local met = xdefm_CookMeter( self:GetFMod_DT() )
		if met >= 0 then ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() +math.ceil( 5*( 1 +met ) ) ) ) end
		ent:EmitSound( "NPC_Barnacle.FinalBite" ) self:Remove() self.xdefm_Used = true return false
	end
	function ITEM:OnTouch( self, ent ) if self.xdefm_Used or self.xdefm_Touch > CurTime() then return end
		if ( !ent:IsPlayer() and !ent:IsNPC() ) then return end
		self.xdefm_Touch = CurTime() +1
		self:EmitSound( "misc/banana_slip.wav", 70, math.random( 95, 105 ), 0.5 )
		local vel = ( ent:GetPos() -self:GetPos() ):GetNormal()*256  vel.z = 0
		self:GetPhysicsObject():SetVelocity( vel ) ent:SetVelocity( -vel*4 ) ent:GetPhysicsObject():SetVelocity( -vel )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_orangebox"
	local ITEM = { Name = "#xdefm."..it, Type = "Struct", Model = "models/props/de_inferno/crate_fruit_break.mdl", Helper = "#xdefm.d"..it, HelperUse = "xdefm.U3", SType = 1,
	Rarity = 3, Price = 500, Carryable = false, PhysSound = "Wood.ImpactHard", TickRate = 1, Amount = 12, StartSound = "AmmoCrate.Open", ExitSound = "AmmoCrate.Close", }
	function ITEM:OnInit( self ) self.xdefm_OTimer = 0 self:SetNWInt( "XDEFM_CT", 0 ) end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnThink( self ) local ful, tot = true, 0
		for k, v in pairs( self.xdefm_T3 ) do if v == "_" then ful = false else tot = tot +1 end end
		self:SetNWInt( "XDEFM_CT", tot )
		if self.xdefm_OTimer <= 120 then self.xdefm_OTimer = self.xdefm_OTimer +1 else
			self.xdefm_OTimer = 0  local yes = 0
			for k, v in pairs( self.xdefm_T3 ) do if v == "_" then yes = k  self.xdefm_T3[ k ] = "it_orange|0" break end end
			if yes > 0 then self:EmitSound( "Weapon_Bugbait.Splat" ) self:SetColor( Color( 200, 200, 50 ) )
				for k, v in pairs( player.GetHumans() ) do if v.xdefm_Struct and v.xdefm_Struct == self then xdefm_UpdateMenu( v, 3, { [ yes ] = "it_orange|0" } ) end end
			end
		end
	end
	function ITEM:OnInteract( self, ply, typ, dat1, dat2 )
		if typ == 0 and isstring( dat1 ) then dat1 = tonumber( dat1 )
			if isnumber( dat1 ) and ply.xdefm_Profile and ply.xdefm_Profile.Items[ dat1 ] != "_" then
				return false
			end
		end
		if typ == -1 then local yes = false
			for k, v in pairs( self.xdefm_T3 ) do if v != "_" then yes = true break end end
			if yes then self:SetColor( Color( 255, 255, 255 ) ) end
		end
	end
	function ITEM:OnDraw( self ) surface.SetFont( "TargetID" )
		local t1 = tostring( self:GetNWInt( "XDEFM_CT" ) )
		t1 = language.GetPhrase( "xdefm.Store" )..": "..t1.." / 12"
		local x1, y1 = surface.GetTextSize( t1 )
		cam.Start3D2D( self:WorldSpaceCenter() -self:GetRight()*2, self:LocalToWorldAngles( Angle( 0, 180, 90 ) ), 0.2 )
			draw.RoundedBox( 0, -x1/2 -8, -y1/2 -150 -8, x1 +16, y1 +16, Color( 0, 0, 0, 155 ) )
			draw.TextShadow( { text = t1, pos = { 0, -150 }, font = "TargetID",
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		cam.End3D2D()
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "cr_fish"
	local ITEM = { Name = "#xdefm."..it, Type = "Creature", Model = "models/props/cs_militia/fishriver01.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 1, Price = 100, TickRate = 0.1, MinSize = 0.6, MaxSize = 1.5, PhysSound = "Watermelon.Impact" }
	ITEM.Constants = { SpdPos = 28, SpdAng = 100, MoveDist = 512, Health = 25, Mass = 32, AngInv = 0 }
	function ITEM:OnInit( self ) self:SetMaxHealth( self.xdefm_T2.Constants.Health ) self:SetHealth( self:GetMaxHealth() ) self:SetCollisionGroup( COLLISION_GROUP_NPC )
		self:SetBloodColor( BLOOD_COLOR_RED ) self.xdefm_NT = CurTime() +0.5  self.xdefm_TPos = nil  self.ShadowParams = {}  self.xdefm_Killed = false
	end
	function ITEM:OnReady( self ) self:StartMotionController() self:GetPhysicsObject():SetMass( self.xdefm_T2.Constants.Mass ) end
	function ITEM:OnPlayerDrop( self, own ) self:SetHealth( 0 ) self:SetColor( Color( 255, 155, 155 ) )
	self.xdefm_Killed = true  self:GetPhysicsObject():SetBuoyancyRatio( 1 ) end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed then return end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) )
		if self:Health() <= 0 then
			self:SetColor( Color( 255, 155, 155 ) ) self.xdefm_Killed = true
			self:GetPhysicsObject():EnableGravity( true )
		end
	end
	function ITEM:OnPhysSimulate( self, phy, del ) if self:Health() <= 0 then return end phy:Wake()  local con = self.xdefm_T2.Constants
		if self:WaterLevel() > 1 and !self:IsPlayerHolding() and !constraint.FindConstraint( self, "Weld" ) and self:GetPhysicsObject():IsMotionEnabled() then
			if phy:IsGravityEnabled() then phy:EnableGravity( false ) self.xdefm_NT = CurTime() +0.1 end
			local pos = self:GetPos()
			local tr_up = util.QuickTrace( pos, Vector( 0, 0, self:OBBMaxs().z*5 ), self )
			local tr_do = util.QuickTrace( pos, Vector( 0, 0, -self:OBBMins().z*5 ), self )
			if self.xdefm_NT <= CurTime() then
				if !isvector( self.xdefm_TPos ) or pos:Distance( self.xdefm_TPos ) <= 5 or math.random( 1, 5 ) == 1 then
					local vel = VectorRand():GetNormalized()*math.Rand( con.MoveDist/2, con.MoveDist )  vel.z = math.abs( vel.z )  vel.z = math.Rand( -vel.z/3, vel.z/4 )
					if tr_up.Hit or self:WaterLevel() < 3 then vel.z = math.min( -self:OBBMaxs().z*5, vel.z ) end
					if tr_do.Hit then vel.z = math.max( self:OBBMaxs().z*5, vel.z ) end
					local tr_tu = util.TraceHull( { start = pos, endpos = pos+vel, mask = MASK_NPCSOLID, filter = self,
					mins = self:OBBMins(), maxs = self:OBBMaxs() } )
					if tr_tu.HitPos:Distance( tr_tu.StartPos ) >= self:OBBMaxs().z*5 then self.xdefm_TPos = tr_tu.HitPos +tr_tu.HitNormal  self.xdefm_NT = CurTime() + math.Rand( 1, 3 )
					if self:GetMaxHealth() > self:Health() then self:SetHealth( math.min( self:GetMaxHealth(), self:Health() +1 ) ) end end
				end
			end
			if isvector( self.xdefm_TPos ) then local tt = self.xdefm_TPos
				if bit.band( util.PointContents( tt ), CONTENTS_WATER ) != CONTENTS_WATER then
					self.xdefm_TPos = tt -Vector( 0, 0, 4 )
				end
				local tr_fo = util.QuickTrace( pos, ( self.xdefm_TPos - self:GetPos() ):GetNormalized()*5, self )  self.xdefm_NT = CurTime() +math.Rand( 0.5, 1 )
				if tr_fo.Hit or pos:Distance( self.xdefm_TPos ) <= 5 then self.xdefm_TPos = nil  self.xdefm_NT = 0 end
			end
			self.ShadowParams.pos = isvector( self.xdefm_TPos ) and self.xdefm_TPos or self:GetPos()
			local aa = self:GetAngles() if isvector( self.xdefm_TPos ) then
				aa = ( con.AngInv != 1 and ( self.xdefm_TPos -self:GetPos() ) or ( self:GetPos() -self.xdefm_TPos ) ):Angle()
				if con.AngInv == 2 then aa = aa +Angle( 0, 90, 0 ) end
			end
			self.ShadowParams.angle = aa +Angle( 0, math.sin( CurTime()*20 +self:EntIndex() )*15, 0 )
			self.ShadowParams.maxangular = con.SpdAng
			self.ShadowParams.maxangulardamp = con.SpdAng*2
			self.ShadowParams.maxspeed = con.SpdPos
			self.ShadowParams.maxspeeddamp = con.SpdPos*2
			self.ShadowParams.dampfactor = 0.8
			self.ShadowParams.teleportdistance = 0
			self.ShadowParams.deltatime = deltatime
			phy:ComputeShadowControl( self.ShadowParams )
		else phy:EnableGravity( true )
			if self.xdefm_NT < CurTime() then self.xdefm_NT = CurTime() +math.Rand( 0.5, 1 )
				local tr = util.QuickTrace( self:WorldSpaceCenter(), -Vector( 0, 0, 5 ), self )
				if tr.Hit then local vel = VectorRand():GetNormalized()*math.Rand( con.SpdPos*10, con.SpdPos*20 )
					if self:WaterLevel() <= 0 then vel.z = vel.z*2 else vel.z = -math.abs( vel.z ) end phy:AddVelocity( vel )
				end self.xdefm_TPos = nil
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "cr_gold"
	local ITEM = { Name = "#xdefm."..it, Model = "models/props/de_inferno/goldfish.mdl", Price = 60, Rarity = 1, Helper = "#xdefm.d"..it }
	ITEM.Constants = { SpdPos = 28, SpdAng = 100, MoveDist = 512, Health = 10, Mass = 24, AngInv = 0, PhysSound = "Watermelon.Impact" }
	xdefm_ItemBased( "cr_fish", it, ITEM )
end
if true then local it = "cr_fish2"
	local ITEM = { Name = "#xdefm."..it, Model = { "models/tmp_mod/island_fish_001.mdl", "models/tmp_mod/island_fish_002.mdl", "models/tmp_mod/island_fish_003.mdl" },
	Price = 84, Rarity = 2, Helper = "#xdefm.d"..it }
	ITEM.Constants = { SpdPos = 32, SpdAng = 100, MoveDist = 512, Health = 15, Mass = 48, AngInv = 2, PhysSound = "Watermelon.Impact" }
	xdefm_ItemBased( "cr_fish", it, ITEM )
end
if true then local it = "cr_perch"
	local ITEM = { Name = "#xdefm."..it, Model = "models/fish/perch/perch.mdl", Price = 256, Rarity = 3, Helper = "#xdefm.d"..it }
	ITEM.Constants = { SpdPos = 48, SpdAng = 100, MoveDist = 768, Health = 30, Mass = 64, AngInv = 1, PhysSound = "Watermelon.Impact" }
	xdefm_ItemBased( "cr_fish", it, ITEM )
end
if true then local it = "cr_perch2"
	local ITEM = { Name = "#xdefm."..it, Model = "models/fish/perch/perch.mdl", Price = 2500, Rarity = 4, Helper = "#xdefm.d"..it }
	ITEM.Constants = { SpdPos = 64, SpdAng = 500, MoveDist = 1024, Health = 50, Mass = 100, AngInv = 1, PhysSound = "Watermelon.Impact" }
	function ITEM:OnInit( self ) self:SetMaxHealth( self.xdefm_T2.Constants.Health ) self:SetHealth( self:GetMaxHealth() ) self:SetCollisionGroup( COLLISION_GROUP_NPC )
		self:SetBloodColor( BLOOD_COLOR_RED ) self.xdefm_NT = CurTime() +0.5  self.xdefm_TPos = nil  self.ShadowParams = {}  self.xdefm_Killed = false
		self:SetMaterial( "models/props_collectables/gold_bar" )
	end
	function ITEM:OnDraw( self ) render.SetMaterial( Mat ) local siz, col = 32 +math.sin( CurTime()*2 )*2, Color( 255, 255, 55, 255 )
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, col )
        render.DrawSprite( self:WorldSpaceCenter() +self:GetForward()*6, siz, siz, col )
        render.DrawSprite( self:WorldSpaceCenter() -self:GetForward()*6, siz, siz, col )
	end
	xdefm_ItemBased( "cr_fish", it, ITEM )
end
if true then local it = "cr_cute"
	local ITEM = { Name = "#xdefm."..it, Type = "Creature", Model = "models/xdeedited/ichthyosaur.mdl", PhysSound = "Strider.Impact"
	, Helper = "#xdefm.d"..it, Rarity = 4, Carryable = false, Price = 800, TickRate = 0.1, MinSize = 0.8, MaxSize = 1.2 }
	function ITEM:OnInit( self ) self:SetMaxHealth( 300 ) self:SetHealth( self:GetMaxHealth() )
		self:SetBloodColor( BLOOD_COLOR_RED ) self:PhysicsInit( SOLID_BBOX ) self:SetAutomaticFrameAdvance( true )
		self:GetPhysicsObject():SetMass( math.ceil( self:GetPhysicsObject():GetMass()*0.1 ) )
		self:GetPhysicsObject():SetMaterial( "flesh" ) self.xdefm_Anim = "swim"
		self:ResetSequence( self.xdefm_Anim ) self:SetPlaybackRate( 1 )
		self.xdefm_NT = CurTime() +0.5  self.xdefm_TPos = nil  self.ShadowParams = {}
		self.xdefm_Killed = false  self.xdefm_ADL = 0  self.xdefm_SDL = 0
		self.xdefm_NextAtk = 0  self.xdefm_AtkT = nil  self.xdefm_AtkD = 0
		self:GetPhysicsObject():SetBuoyancyRatio( 0 ) self:SetCollisionGroup( COLLISION_GROUP_NPC )
	end
	function ITEM:OnUse( self ) if !self.xdefm_Killed then return false end end
	function ITEM:OnReady( self ) self:StartMotionController() self:GetPhysicsObject():SetMass( 100 ) self:SetTrigger( true ) self:UseTriggerBounds( true, 4 ) end
	function ITEM:OnPlayerDrop( self, own ) self:SetHealth( 0 ) self:SetColor( Color( 255, 155, 155 ) ) self.xdefm_Anim = "idle"
	self.xdefm_Killed = true  self:GetPhysicsObject():SetBuoyancyRatio( 1 ) self:SetPlaybackRate( 0 ) end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed then return end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) )
		if self:Health() <= 0 then self:SetColor( Color( 255, 155, 155 ) )
		self:GetPhysicsObject():EnableGravity( true )
		self.xdefm_Killed = true  self.xdefm_Anim = "idle"  self:SetPlaybackRate( 0 ) end
	end
	function ITEM:OnThink( self ) if self.xdefm_Killed then return end local seq = self:GetSequenceName( self:GetSequence() )
		if seq != self.xdefm_Anim and self.xdefm_ADL <= CurTime() then self:ResetSequence( self.xdefm_Anim ) self:SetPlaybackRate( 1 ) end
		if self.xdefm_AtkD <= CurTime() and !IsValid( self.xdefm_AtkT ) then self.xdefm_AtkD = CurTime() +1  local tas = {}
			for k, v in pairs( ents.FindInSphere( self:GetPos(), 2000 ) ) do
				if ( !v:IsNPC() and !v:IsPlayer() and ( v:GetClass() != "xdefm_base" or xdefm_GetClass( v ) == "cr_cute" ) )
				or !isstring( v:GetModel() ) or !util.IsValidModel( v:GetModel() ) or v:Health() <= 0 or v:WaterLevel() <= 0 then continue end
				table.insert( tas, v ) end if #tas > 0 then local tar = tas[ math.random( #tas ) ]
				local tr = util.TraceLine( { start = self:GetPos(), endpos = tar:GetPos(), filter = { tar, self }, mask = MASK_NPCSOLID } )
				if !tr.Hit then
					if self.xdefm_SDL < CurTime() then self.xdefm_SDL = CurTime() +2
						local snd = "NPC_Ichthyosaur.AttackGrowl"  self:StopSound( snd ) self:EmitSound( snd )
					end self.xdefm_AtkT = tar
				end
			end
		end
	end
	function ITEM:OnTouch( self, ent, typ ) if self.xdefm_Killed or self.xdefm_NextAtk >= CurTime() or ent:Health() <= 0 then return end self.xdefm_NextAtk = CurTime() +1
		if !ent:IsPlayer() and !ent:IsNPC() and ( ent:GetClass() != self:GetClass() or ent:GetFMod_DT() == self:GetFMod_DT() ) then return end
		self:StopSound( "NPC_Ichthyosaur.Bite" ) self:StopSound( "NPC_Ichthyosaur.AttackGrowl" ) self.xdefm_SDL = CurTime() +1.5
		self:EmitSound( self:WaterLevel() > 0 and "NPC_Ichthyosaur.BiteMiss" or "NPC_Ichthyosaur.Bite" ) self.xdefm_ADL = CurTime() +0.75  self:SetCycle( 0 )
		self:ResetSequence( self:WaterLevel() > 0 and "attackend" or "attackmiss" ) self:SetPlaybackRate( 1 )
		local vel = ( self:WorldSpaceCenter() -ent:WorldSpaceCenter() ):GetNormalized()
		local dmg = DamageInfo() dmg:SetDamage( 25 ) dmg:SetAttacker( self:GetFMod_OW() )
		dmg:SetInflictor( self ) dmg:SetDamageType( DMG_CRUSH ) dmg:SetDamagePosition( ent:WorldSpaceCenter() )
		dmg:SetDamageForce( vel*10000 ) ent:TakeDamageInfo( dmg ) ent:SetVelocity( vel*-1000 )
		if IsValid( ent:GetPhysicsObject() ) then ent:GetPhysicsObject():SetVelocity( vel*-1000 ) end
		if ent:Health() <= 0 then ent:Remove() end
	end
	function ITEM:OnPhysSimulate( self, phy, del ) if self.xdefm_Killed then return end phy:Wake() if self:GetPlaybackRate() < 1 then self:SetPlaybackRate( 1 ) end
		if self:WaterLevel() > 0 and !self:IsPlayerHolding() and !constraint.FindConstraint( self, "Weld" ) then self.xdefm_Anim = "swim"
			if phy:IsGravityEnabled() then phy:EnableGravity( false ) self.xdefm_NT = CurTime() +0.1 end
			local pos = self:GetPos()  if self.xdefm_ADL <= CurTime() then self.xdefm_Anim = "swim" end
			local tr_up = util.QuickTrace( pos, Vector( 0, 0, 50 ), self )
			local tr_do = util.QuickTrace( pos, Vector( 0, 0, -50 ), self )
			if self.xdefm_NT <= CurTime() then
				if !IsValid( self.xdefm_AtkT ) and ( !isvector( self.xdefm_TPos ) or pos:Distance( self.xdefm_TPos ) <= 5 or math.random( 1, 3 ) == 1 ) then
					local ve2 = VectorRand():GetNormal()*math.Rand( 500, 1000 )  vel = Vector( ve2.x, ve2.y, math.Rand( -400, 400 ) )  vel.z = vel.z/4
					if tr_up.Hit or self:WaterLevel() < 3 then vel.z = math.min( -50, vel.z ) end
					if tr_do.Hit then vel.z = math.max( 50, vel.z ) end
					local tr_tu = util.TraceHull( { start = pos, endpos = pos+vel, mask = MASK_NPCSOLID, filter = self,
					mins = self:OBBMins(), maxs = self:OBBMaxs() } )
					if byp or tr_tu.HitPos:Distance( tr_tu.StartPos ) >= 50 then self.xdefm_TPos = tr_tu.HitPos +tr_tu.HitNormal  self.xdefm_NT = CurTime() +math.Rand( 1, 3 )
					if self:GetMaxHealth() > self:Health() then self:SetHealth( math.min( self:GetMaxHealth(), self:Health() +1 ) ) end end
				end if IsValid( self.xdefm_AtkT ) and self.xdefm_NT <= CurTime() then self.xdefm_NT = CurTime() +0.2  local tar = self.xdefm_AtkT
					if tar:Health() <= 0 or tar:WaterLevel() <= 0 then self.xdefm_AtkT = nil  self.xdefm_NT = 0 else
						local tr = util.TraceLine( { start = self:GetPos(), endpos = tar:GetPos(), filter = { tar, self }, mask = MASK_NPCSOLID } )
						if tr.Hit then self.xdefm_AtkT = nil  self.xdefm_NT = 0 end
					end
				end
			end
			if !IsValid( self.xdefm_AtkT ) and isvector( self.xdefm_TPos ) then local tt = self.xdefm_TPos
				local tr_fo = util.QuickTrace( pos, ( self.xdefm_TPos - self:GetPos() ):GetNormalized()*10, self )  self.xdefm_NT = CurTime() +math.Rand( 1, 2 )
				if tr_fo.Hit or pos:Distance( self.xdefm_TPos ) <= 50 then self.xdefm_TPos = nil  self.xdefm_NT = 0 end
			end
			self.ShadowParams.pos = isvector( self.xdefm_TPos ) and self.xdefm_TPos or self:GetPos()
			if IsValid( self.xdefm_AtkT ) and self.xdefm_AtkT:WaterLevel() > 0 then self.ShadowParams.pos = self.xdefm_AtkT:GetPos() end
			local aa = self:GetAngles() if isvector( self.xdefm_TPos ) then
				aa = ( self.xdefm_TPos -self:GetPos() ):Angle()  aa = Angle( aa.pitch, aa.yaw, 0 )
			end if IsValid( self.xdefm_AtkT ) then aa = ( self.xdefm_AtkT:WorldSpaceCenter() -self:GetPos() ):Angle()  aa = Angle( aa.pitch, aa.yaw, 0 ) end
			self.ShadowParams.angle = aa
			self.ShadowParams.maxangular = 100
			self.ShadowParams.maxangulardamp = 1000
			self.ShadowParams.maxspeed = 200
			self.ShadowParams.maxspeeddamp = 1000
			self.ShadowParams.dampfactor = 0.8
			self.ShadowParams.teleportdistance = 0
			self.ShadowParams.deltatime = deltatime
			phy:ComputeShadowControl( self.ShadowParams )
		else phy:EnableGravity( true ) if self.xdefm_ADL <= CurTime() then self.xdefm_Anim = "thrash" end
			if self.xdefm_NT < CurTime() then self.xdefm_NT = CurTime() +math.Rand( 0.5, 1 )
				if self.xdefm_SDL < CurTime() then self.xdefm_SDL = CurTime() +math.Rand( 2, 6 )
					local snd = "NPC_Ichthyosaur.AttackGrowl"  self:StopSound( snd ) self:EmitSound( snd )
				end
				local tr = util.QuickTrace( self:WorldSpaceCenter(), -Vector( 0, 0, 100 ), self )
				if tr.Hit then local vel = VectorRand():GetNormalized()*math.Rand( 300, 600 )
					phy:SetVelocity( Vector( vel.x, vel.y, math.Rand( 200, 600 ) ) )
				end self:TakeDamage( 0.5 )  self.xdefm_TPos = nil
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_barre1"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_c17/oildrum001.mdl",
	Helper = "#xdefm.d"..it, Rarity = 1, Price = 50, PhysSound = "Metal_Barrel.ImpactSoft", TickRate = 1 }
	function ITEM:OnInit( self ) self:SetMaxHealth( 50 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or self.xdefm_Killed then return end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Breakable.Metal" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		if math.random( 1, 3 ) == 1 then self:EmitSound( "BaseExplosionEffect.Sound" )
			local ef = EffectData() ef:SetStart( self:WorldSpaceCenter() )
			ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetScale( 1 ) util.Effect( "HelicopterMegaBomb", ef )
			local dmg = DamageInfo() dmg:SetDamage( 100 ) dmg:SetDamageType( DMG_BLAST )
			dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
			dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 300 )
		end
		local lt = {["it_scrap"]=1} for i=2, 4 do xdefm_LootDrop( lt, self ) end
		xdefm_BreakEffect( self, 3 ) self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_barre2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_c17/oildrum001_explosive.mdl",
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 120, PhysSound = "Metal_Barrel.ImpactSoft", TickRate = 1 }
	function ITEM:OnInit( self ) self:SetMaxHealth( 25 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or self.xdefm_Killed then return end
		if ( dmg:IsExplosionDamage() or dmg:IsBulletDamage() or dmg:IsDamageType( DMG_BURN ) or dmg:IsDamageType( DMG_SLOWBURN ) ) and !self:IsOnFire() then
			self:Ignite( math.Round( 4, 10 ) )
		end self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Breakable.Metal" )
		if self:Health() <= 0 then self.xdefm_Killed = true
			local ef = EffectData() ef:SetStart( self:WorldSpaceCenter() )
			ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetScale( 1 ) util.Effect( "Explosion", ef )
			local dmg = DamageInfo() dmg:SetDamage( 150 ) dmg:SetDamageType( DMG_BLAST )
			dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
			dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 300 )
			local lt = {["it_scrap"]=20,["it_metal"]=5} for i=1, math.random( 3, 5 ) do xdefm_LootDrop( lt, self ) end
		xdefm_BreakEffect( self, 3 ) self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	function ITEM:OnCollide( self, dat ) if self.xdefm_Killed then return end
		if dat.Speed >= 300 and dat.DeltaTime > 0.2 then self:TakeDamage( 25 ) end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_bomb1"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/Combine_Helicopter/helicopter_bomb01.mdl",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 200, PhysSound = "MetalVent.ImpactHard", TickRate = 0.5 }
	function ITEM:OnInit( self ) self:SetMaxHealth( 10 ) self:SetHealth( self:GetMaxHealth() )
		self.xdefm_Killed = false  self.xdefm_KillDelay = 0
	end
	function ITEM:OnThink( self ) if !self.xdefm_Killed or self.xdefm_KillDelay >= 5 then return end
		self.xdefm_KillDelay = self.xdefm_KillDelay +1  if self.xdefm_KillDelay >= 5 then
			self:SetSkin( 0 ) local cb = ents.Create( "prop_combine_ball" )
			cb:SetPos( self:WorldSpaceCenter() ) cb:Spawn() cb:Activate() cb:Fire( "Explode" )
			for i=1, 10 do local phy = ents.Create( "env_physexplosion" ) phy:SetPos( self:WorldSpaceCenter() ) phy:SetKeyValue( "SpawnFlags", 1 + 2 )
			phy:SetKeyValue( "magnitude", 100 ) phy:SetKeyValue( "radius", 400 ) phy:Spawn() phy:Activate() phy:Fire( "Explode" ) SafeRemoveEntityDelayed( phy, 0.1 ) end
			local dmg = DamageInfo() dmg:SetDamage( 100 ) dmg:SetDamageType( bit.bor( DMG_SHOCK, DMG_DISSOLVE ) )
			dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
			dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 400 ) SafeRemoveEntity( self )
		else self:SetSkin( self:GetSkin() == 0 and 1 or 0 ) end
	end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or self.xdefm_Killed then return end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) )
		if self:Health() <= 0 then self.xdefm_Killed = true
			self:EmitSound( "NPC_RollerMine.Hurt" )
		end
	end
	function ITEM:OnCollide( self, dat ) if self:Health() <= 0 or self.xdefm_Killed then return end
		if dat.Speed >= 180 and dat.DeltaTime > 0.2 then self:TakeDamage( 10 ) end
	end
	function ITEM:OnRemove( self ) self:StopSound( "NPC_RollerMine.Hurt" ) end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_bomb2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props_phx/ww2bomb.mdl", "models/props_phx/torpedo.mdl",
	"models/props_phx/amraam.mdl", "models/props_phx/mk-82.mdl", "models/props_phx/ball.mdl" }
	,Helper = "#xdefm.d"..it, Rarity = 3, Price = 500, PhysSound = "PhxMetal.ImpactSoft" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 1 ) self:SetHealth( 1 )
		self.xdefm_Killed = false  self.xdefm_Armed = false
	end
	function ITEM:OnUse( self, ent ) if self.xdefm_Killed or !ent:IsPlayer() or !ent:KeyDown( IN_SPEED ) then return end
		self.xdefm_Armed = !self.xdefm_Armed  self:StopSound( "NPC_CombineMine.TurnOn" ) self:StopSound( "NPC_CombineMine.TurnOff" )
		self:EmitSound( self.xdefm_Armed and "NPC_CombineMine.TurnOn" or "NPC_CombineMine.TurnOff" )
		self:SetColor( self.xdefm_Armed and Color( 255, 155, 155 ) or Color( 255, 255, 255 ) ) return false
	end
	function ITEM:OnDamaged( self, dmg ) if !self.xdefm_Armed or self.xdefm_Killed then return end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) )
		if self:Health() <= 0 and !self.xdefm_Killed then self.xdefm_Killed = true  self:EmitSound( "Explo.ww2bomb" )
			for i=1, 20 do local phy = ents.Create( "env_physexplosion" ) phy:SetPos( self:WorldSpaceCenter() ) phy:SetKeyValue( "SpawnFlags", 1 + 2 )
			phy:SetKeyValue( "magnitude", 100 ) phy:SetKeyValue( "radius", 500 ) phy:Spawn() phy:Activate() phy:Fire( "Explode" ) SafeRemoveEntityDelayed( phy, 0.1 ) end
			local smo = ents.Create( "env_ar2explosion" ) smo:SetPos( self:WorldSpaceCenter() ) smo:Spawn() smo:Activate() smo:Fire( "Explode" ) SafeRemoveEntityDelayed( smo, 0.1 )
			local dmg = DamageInfo() dmg:SetDamage( math.random( 250, 2500 ) ) dmg:SetDamageType( bit.bor( DMG_BLAST, DMG_AIRBOAT ) )
			dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
			dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 500 )
			local ef = EffectData()  ef:SetStart( self:WorldSpaceCenter() ) ef:SetOrigin( self:WorldSpaceCenter() )
			ef:SetScale( 1 ) util.Effect( "HelicopterMegaBomb", ef ) self:EmitSound( "Explo.ww2bomb" ) SafeRemoveEntity( self )
		end
	end
	function ITEM:OnCollide( self, dat ) if !self.xdefm_Armed or self.xdefm_Killed then return end
		if dat.Speed >= 120 and dat.DeltaTime > 0.2 then self:TakeDamage( 10 ) end
	end
	xdefm_ItemRegister( it, ITEM )
end