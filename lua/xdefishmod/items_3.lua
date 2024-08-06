if CLIENT then local langs = {}
	langs[ "zh-CN" ] = {
		[ "it_camera" ] = "照相机", [ "dit_camera" ] = "",
        [ "it_ammo" ] = "弹药盒", [ "dit_ammo" ] = "诡异的是在水中浸泡了这么久的子弹还能使用.",
		[ "it_ammocan1" ] = "弹药箱", [ "dit_ammocan1" ] = "很坚固的弹药箱,但是不建议使用热兵器打开.",
		[ "it_ammocan2" ] = "武器堆", [ "dit_ammocan2" ] = "很坚固的一堆武器箱,也不建议使用热兵器打开.",
		[ "it_firearm1" ] = "生锈的枪", [ "dit_firearm1" ] = "老旧的枪支,很容易走火.",
		[ "it_firearm2" ] = "枪", [ "dit_firearm2" ] = "崭新出厂.",
        [ "it_grenade" ] = "破片手雷", [ "dit_grenade" ] = "",
        [ "it_flashbang" ] = "闪光弹", [ "dit_flashbang" ] = "",
        [ "it_launcher" ] = "火箭发射器", [ "dit_launcher" ] = "",
		[ "it_bait2" ] = "进阶鱼饵盒", [ "dit_bait2" ] = "盒子里装了3个罕见鱼饵,打碎以开启.",
		[ "it_bait3" ] = "高级鱼饵盒", [ "dit_bait3" ] = "盒子里装了3个稀有鱼饵,打碎以开启.",
		[ "it_crate2" ] = "大板条箱", [ "dit_crate2" ] = "箱子里面装了更多东西,打碎以开启.",
		[ "it_crate3" ] = "补给箱", [ "dit_crate3" ] = "装有大量补给.",
		[ "it_car" ] = "汽车", [ "dit_car" ] = "你要觉得还能开你可以试试.",
		[ "it_bread1" ] = "糊面包", [ "dit_bread1" ] = "致癌警告.",
		[ "it_bread2" ] = "面包", [ "dit_bread2" ] = "请勿传送.",
		[ "cr_bread" ] = "面包怪", [ "dcr_bread" ] = "说了不要传送诶我去.",
		[ "it_pumpkin1" ] = "南瓜", [ "dit_pumpkin1" ] = "普通的南瓜.",
		[ "it_pumpkin2" ] = "大南瓜", [ "dit_pumpkin2" ] = "不普通的南瓜.",
		[ "it_pumpki" ] = "南瓜块", [ "dit_pumpki" ] = "",
		[ "it_mush1" ] = "蘑菇", [ "dit_mush1" ] = "",
		[ "it_mush2" ] = "毒蘑菇", [ "dit_mush2" ] = "",
		[ "it_pmetal" ] = "奇异金属片", [ "dit_pmetal" ] = "赛博垃圾.",
		[ "it_pradio" ] = "收音机", [ "dit_pradio" ] = "无休止地播放着同一个旋律.",
		[ "it_pcube" ] = "同伴方块", [ "dit_pcube" ] = "一个普通的方块,可以用火焰伤害摧毁.",
		[ "it_pcore" ] = "情感核心", [ "dit_pcore" ] = "有个性的话痨球.",
		[ "it_pturre1" ] = "炮台", [ "dit_pturre1" ] = "友好的炮台,会攻击生物(包括鸟).",
		[ "it_pturre2" ] = "受损炮台", [ "dit_pturre2" ] = "友好的炮台,会攻击生物(包括鸟),有几率自毁.",
		[ "it_cmetal" ] = "奇异金属片", [ "dit_cmetal" ] = "赛博垃圾.",
		[ "it_ccore" ] = "不稳定的能量核心", [ "dit_ccore" ] = "",
		[ "it_chopper" ] = "跳雷", [ "dit_chopper" ] = "不对劲.",
		[ "it_chealth" ] = "补血器", [ "dit_chealth" ] = "花费200鱼币回复全部血量.",
		[ "it_carmor" ] = "补甲器", [ "dit_carmor" ] = "花费100鱼币回复全部护甲.",
		[ "it_csuper" ] = "超级补充器", [ "dit_csuper" ] = "花费150鱼币回复全部血量和护甲.",
		[ "it_cturret" ] = "炮台", [ "dit_cturret" ] = "友好的炮台,会攻击生物(包括鸟).",
		[ "it_cscanner" ] = "僚机", [ "dit_cscanner" ] = "会围着目标疯狂拍照.",
		[ "it_cthumper" ] = "撞击器", [ "dit_cthumper" ] = "吵.",
		[ "it_gballoon" ] = "气球", [ "dit_gballoon" ] = "",
		[ "it_gballoox" ] = "气球盒", [ "dit_gballoox" ] = "",
		[ "it_gfood" ] = "垃圾食品", [ "dit_gfood" ] = "咋不行.",
		[ "it_cheli" ] = "破损的直升机", [ "dit_cheli" ] = "来自某人的奇怪想法.",
		[ "it_water" ] = "水瓶", [ "dit_water" ] = "",
		[ "it_shovel" ] = "铲子", [ "dit_shovel" ] = "",
		[ "it_pot" ] = "炼金锅", [ "dit_pot" ] = "放进一些物品来得到等价或低价的物品.",
		[ "it_rainbowbar" ] = "彩虹锭", [ "dit_rainbowbar" ] = "<color=0,0,255>☆</color><color=255,0,255>☆</color><color=0,255,0>☆</color><color=255,255,0>☆</color><color=255,0,0>☆</color><color=255,255,255>☆</color>.",
		[ "it_junku" ] = "反回收垃圾桶", [ "dit_junku" ] = "会把一切物品变成垃圾,不客气不客气.",
		[ "it_exp1" ] = "基础经验书", [ "dit_exp1" ] = "获得40经验.\n超过等级需要的经验会被忽略.",
		[ "it_exp2" ] = "进阶经验书", [ "dit_exp2" ] = "获得160经验.\n注意超过等级需要的经验会被忽略.",
		[ "it_exp3" ] = "高级经验书", [ "dit_exp3" ] = "获得400经验.\n注意超过等级需要的经验会被忽略.",
		[ "it_exp4" ] = "至尊经验书", [ "dit_exp4" ] = "直接提升一级.\n注意超过等级需要的经验会被忽略.",
	}
	langs[ "en" ] = {
		[ "it_camera" ] = "Camera", [ "dit_camera" ] = "",
        [ "it_ammo" ] = "Ammo", [ "dit_ammo" ] = "A box of random ammo.",
		[ "it_ammocan1" ] = "Ammo Box", [ "dit_ammocan1" ] = "Secure ammo box, keep it away from fire.",
		[ "it_ammocan2" ] = "Weapon Stash", [ "dit_ammocan2" ] = "Secure weapon boxes, extremely hard to open.",
		[ "it_firearm1" ] = "Rusty Gun", [ "dit_firearm1" ] = "Will go off easily.",
		[ "it_firearm2" ] = "Gun", [ "dit_firearm2" ] = "Still good as new.",
        [ "it_grenade" ] = "Frag Grenade", [ "dit_grenade" ] = "",
        [ "it_flashbang" ] = "Flashbang", [ "dit_flashbang" ] = "",
        [ "it_launcher" ] = "Rocket Launcher", [ "dit_launcher" ] = "",
		[ "it_bait2" ] = "Improved Bait Box", [ "dit_bait2" ] = "Contains 3 random uncommon baits. Break to open.",
		[ "it_bait3" ] = "Advanced Bait Box", [ "dit_bait3" ] = "Contains 3 random rare baits. Break to open.",
		[ "it_crate2" ] = "Big Crate", [ "dit_crate2" ] = "There are more things in this crate. Break to open.",
		[ "it_crate3" ] = "Supply Crate", [ "dit_crate3" ] = "Contains some supplies.",
		[ "it_car" ] = "Car", [ "dit_car" ] = "Is it still driveable? Let's find out ...",
		[ "it_bread1" ] = "Burnt Bread", [ "dit_bread1" ] = "Caner warning.",
		[ "it_bread2" ] = "Bread", [ "dit_bread2" ] = "Do not teleport.",
		[ "cr_bread" ] = "Bread Monster", [ "dcr_bread" ] = "I told you DO NOT TELEPORT.",
		[ "it_pumpkin1" ] = "Pumpkin", [ "dit_pumpkin1" ] = "Common pumpkin.",
		[ "it_pumpkin2" ] = "Big Pumpkin", [ "dit_pumpkin2" ] = "Uncommon pumpkin.",
		[ "it_pumpki" ] = "Pumpkin Chunk", [ "dit_pumpki" ] = "",
		[ "it_mush1" ] = "Mushroom", [ "dit_mush1" ] = "",
		[ "it_mush2" ] = "Poisonous Mushroom", [ "dit_mush2" ] = "",
		[ "it_pmetal" ] = "Strange Metal Plate", [ "dit_pmetal" ] = "Cyberuseless.",
		[ "it_pradio" ] = "Radio", [ "dit_pradio" ] = "Tirelessly playing the same music.",
		[ "it_pcube" ] = "Companion Cube", [ "dit_pcube" ] = "An ordinary cube, can be destroyed with fire.",
		[ "it_pcore" ] = "Personality Core", [ "dit_pcore" ] = "Talkactive core buddy.",
		[ "it_pturre1" ] = "Turret", [ "dit_pturre1" ] = "Friendly turret that attacks creatures( including birds ).",
		[ "it_pturre2" ] = "Broken Turret", [ "dit_pturre2" ] = "Friendly turret that attacks creatures( including birds ). Quite broken and unstable.",
		[ "it_cmetal" ] = "Strange Metal Plate", [ "dit_cmetal" ] = "Cyberuseless.",
		[ "it_ccore" ] = "Unstable Power Core", [ "dit_ccore" ] = "",
		[ "it_chopper" ] = "Hopper Mine", [ "dit_chopper" ] = "Something isn't right.",
		[ "it_chealth" ] = "Health Charger", [ "dit_chealth" ] = "Spend 200 to refill your health.",
		[ "it_carmor" ] = "Suit Charger", [ "dit_carmor" ] = "Spend 100 to refill your armor.",
		[ "it_csuper" ] = "Super Charger", [ "dit_csuper" ] = "Spend 150 to refill your health and armor.",
		[ "it_cturret" ] = "Turret", [ "dit_cturret" ] = "Friendly turret that attacks creatures( including birds ).",
		[ "it_cscanner" ] = "Scanner", [ "dit_cscanner" ] = "Will fly around its target and take LOTS of pictures.",
		[ "it_cthumper" ] = "Thumper", [ "dit_cthumper" ] = "Noisy.",
		[ "it_gballoon" ] = "Balloon", [ "dit_gballoon" ] = "",
		[ "it_gballoox" ] = "Balloon Box", [ "dit_gballoox" ] = "",
		[ "it_gfood" ] = "Junk Food", [ "dit_gfood" ] = "Why not?",
		[ "it_cheli" ] = "Broken Helicopter", [ "dit_cheli" ] = "From my friend's strange idea.",
		[ "it_water" ] = "Water Bottle", [ "dit_water" ] = "",
		[ "it_shovel" ] = "Shovel", [ "dit_shovel" ] = "",
		[ "it_pot" ] = "Alchemist's Pot", [ "dit_pot" ] = "Put in some items to get a mineral.",
		[ "it_rainbowbar" ] = "Rainbow Ingot", [ "dit_rainbowbar" ] = "<color=0,0,255>☆</color><color=255,0,255>☆</color><color=0,255,0>☆</color><color=255,255,0>☆</color><color=255,0,0>☆</color><color=255,255,255>☆</color>.",
		[ "it_junku" ] = "Unrecycle Bin", [ "dit_junku" ] = "Turns everything into junks. Ur welcome.",
		[ "it_exp1" ] = "Basic Book", [ "dit_exp1" ] = "Gives the user 40 EXPs.\nEXPs beyond level requirements will be ignored.\nCannot be used when the user's level is above 100.",
		[ "it_exp2" ] = "Improved Book", [ "dit_exp2" ] = "Gives the user 160 EXPs.\nEXPs beyond level requirements will be ignored.\nCannot be used when the user's level is above 100.",
		[ "it_exp3" ] = "Advanced Book", [ "dit_exp3" ] = "Gives the user 400 EXPs.\nEXPs beyond level requirements will be ignored.\nCannot be used when the user's level is above 100.",
		[ "it_exp4" ] = "Mega Book", [ "dit_exp4" ] = "Level up the user.\nEXPs beyond level requirements will be ignored",
	}
	local ln = GetConVar( "gmod_language" ):GetString()  local lg = "en"
	if ln != nil and istable( langs[ ln ] ) then lg = GetConVar( "gmod_language" ):GetString() end
	for holder, text in pairs( langs[ lg ] ) do language.Add( "xdefm."..holder, text ) end
end local Mat = Material( "sprites/light_glow02_add" ) Mat:SetInt( "$ignorez", 1 ) 

if true then local it = "it_camera"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/maxofs2d/camera.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 3, Price = 500, PhysSound = "weapon.ImpactHard", TickRate = 0.1, HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_NextFire = 0 end
	function ITEM:OnUse( self, ply ) if self.xdefm_NextFire > CurTime() or !ply:IsPlayer() then return false end if ply:KeyDown( IN_SPEED ) then return true end
		self.xdefm_NextFire = CurTime() +0.5  self:SetNWBool( "XDEFM_PT", true ) self:EmitSound( "NPC_CScanner.TakePhoto" )
		local lit = ents.Create( "light_dynamic" )  lit:SetPos( self:WorldSpaceCenter() ) lit:SetAngles( self:GetAngles() )
		lit:SetKeyValue( "_light", "255 255 255 255" )
		lit:SetKeyValue( "brightness", "8" ) lit:SetOwner( self ) lit:SetParent( self )
		lit:SetKeyValue( "distance", "128" ) lit:SetKeyValue( "style", "6" )
		lit:Spawn() lit:Activate() self:DeleteOnRemove( lit )
		lit:Fire( "TurnOn" ) SafeRemoveEntityDelayed( lit, 0.2 )
		timer.Simple( 0.2, function() if IsValid( self ) then self:SetNWBool( "XDEFM_PT", false ) end end ) return false
	end
	function ITEM:OnDraw( self )
		render.SetMaterial( Mat ) local siz = self:GetNWBool( "XDEFM_PT" ) and 40 or 0
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( 255, 255, 255, 255 ) )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_ammo"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/Items/BoxBuckshot.mdl", "models/Items/BoxMRounds.mdl", "models/Items/BoxSRounds.mdl",
	"models/Items/357ammo.mdl", "models/Items/combine_rifle_cartridge01.mdl" }, HelperUse = "xdefm.U2", Helper = "#xdefm.d"..it, Rarity = 2, Price = 250,
	CantCook = true, PhysSound = "weapon.ImpactHard", TickRate = 0.1, CantCook = true }
	local tb = {
		[ "models/items/boxbuckshot.mdl" ] = { "Weapon_Shotgun.NPC_Single", 7, 8, "Buckshot", 200 },
		[ "models/items/boxmrounds.mdl" ] = { "Weapon_SMG1.NPC_Single", 1, 4, "SMG1", 450 },
		[ "models/items/boxsrounds.mdl" ] = { "Weapon_Pistol.NPC_Single", 1, 5, "Pistol", 200 },
		[ "models/items/357ammo.mdl" ] = { "Weapon_357.Single", 1, 40, "357", 60 },
		[ "models/items/combine_rifle_cartridge01.mdl" ] = { "Weapon_AR2.NPC_Single", 1, 8, "Ar2", 300 }
	}
	function ITEM:OnInit( self ) self:SetMaxHealth( 60 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false  self.xdefm_NextShot = 0 end
	function ITEM:OnStore( self ) if self.xdefm_Killed or self:IsOnFire() then return false end end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed or ( !dmg:IsBulletDamage() and !dmg:IsExplosionDamage() and !dmg:IsDamageType( DMG_BURN ) and !dmg:IsDamageType( DMG_SLOWBURN ) ) then return end
		if !self:IsOnFire() then self:Ignite( 360 ) end self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) )
		if self:Health() <= 0 then self.xdefm_Killed = true
			local ef = EffectData()  ef:SetStart( self:WorldSpaceCenter() )
			ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetScale( 1 ) util.Effect( "Explosion", ef )
			local tab = tb[ string.lower( self:GetModel() ) ]  if istable( tab ) then
				local dmg = DamageInfo() dmg:SetDamage( tab[ 3 ]*5 ) dmg:SetDamageType( DMG_BULLET )
				dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
				dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 200 )
				for i=1, math.random( 4, 8 ) do
					local bullet = {}  bullet.Num = tab[ 2 ]  bullet.Src = self:WorldSpaceCenter()
					bullet.Dir = VectorRand():GetNormal()  bullet.Spread = Vector( 0.1, 0.1, 0 )  bullet.Force = tab[ 3 ]*100
					bullet.Tracer = 1  bullet.TracerName = "Tracer"  bullet.Damage = tab[ 3 ]  bullet.AmmoType = "Pistol"
					bullet.Attacker = ( self:GetFMod_OW():IsPlayer() and self:GetFMod_OW() or self )  self:FireBullets( bullet )
				end
			end
			xdefm_BreakEffect( self, 3 ) self:Remove()
		end
	end
	function ITEM:OnUse( self, ply ) if self:IsOnFire() or self.xdefm_Killed then return end
		if ply:KeyDown( IN_SPEED ) then return true end
		local tab = tb[ string.lower( self:GetModel() ) ]  if istable( tab ) then self:EmitSound( "AmmoCrate.Close" )
			ply:GiveAmmo( tab[ 5 ], tab[ 4 ] ) self.xdefm_Killed = true  self:Remove() return false
		end
	end
	function ITEM:OnThink( self ) if self.xdefm_Killed or !self:IsOnFire() or self.xdefm_NextShot > CurTime() then return end
		self.xdefm_NextShot = CurTime() +math.Rand( 0.1, 0.5 )  local tab = tb[ string.lower( self:GetModel() ) ]  if !istable( tab ) then return end
		local bullet = {}  bullet.Num = tab[ 2 ]  bullet.Src = self:WorldSpaceCenter()
		bullet.Dir = VectorRand():GetNormal()  bullet.Spread = Vector( 0.05, 0.05, 0 )  bullet.Force = tab[ 3 ]*100
		bullet.Tracer = 1  bullet.TracerName = "Tracer"  bullet.Damage = tab[ 3 ]
		bullet.AmmoType = "Pistol"  bullet.Attacker = ( self:GetFMod_OW():IsPlayer() and self:GetFMod_OW() or self )
		local ef = EffectData() ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetEntity( self ) ef:SetRadius( 3 )
		ef:SetScale( 3 ) ef:SetMagnitude( 2 ) ef:SetAngles( bullet.Dir:Angle() ) ef:SetNormal( bullet.Dir )  util.Effect( "ElectricSpark", ef )
		self:FireBullets( bullet ) self:EmitSound( tab[ 1 ] ) self:GetPhysicsObject():AddVelocity( VectorRand():GetNormalized()*math.random( 50, 250 ) )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_ammocan1"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props/de_prodigy/ammo_can_02.mdl",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 750, PhysSound = "Metal_Box.ImpactSoft" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 100 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or self.xdefm_Killed then return end
		if ( dmg:IsBulletDamage() or dmg:IsExplosionDamage() or dmg:IsDamageType( DMG_BURN ) or dmg:IsDamageType( DMG_SLOWBURN ) ) then dmg:ScaleDamage( 5 ) self:Ignite( 3600 ) end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Breakable.Metal" )
		if self:Health() <= 0 then self.xdefm_Killed = true
			if !self:IsOnFire() then for i=1, math.random( 2, 4 ) do xdefm_LootDrop( {["it_ammo"]=7,["it_rpg"]=1,["it_grenade"]=1,["it_flashbang"]=1}, self ) end
			else local ef = EffectData()  ef:SetStart( self:WorldSpaceCenter() ) self:EmitSound( "NPC_SScanner.Gib" )
				ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetScale( 1 ) util.Effect( "HelicopterMegaBomb", ef )
				local dmg = DamageInfo() dmg:SetDamage( math.random( 50, 200 ) ) dmg:SetDamageType( DMG_BLAST )
				dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
				dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 300 )
				util.ScreenShake( self:WorldSpaceCenter(), 5, 5, 1, 400 )
			end
		xdefm_BreakEffect( self, 3 ) self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_ammocan2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props/de_prodigy/ammo_can_01.mdl", "models/props/de_prodigy/ammo_can_03.mdl" }, Carryable = false,
	Helper = "#xdefm.d"..it, Rarity = 4, Price = 2500, PhysSound = "Metal_Box.ImpactHard", Carryable = false }
	function ITEM:OnInit( self ) self:SetMaxHealth( 250 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or self.xdefm_Killed then return end
		if ( dmg:IsBulletDamage() or dmg:IsExplosionDamage() or dmg:IsDamageType( DMG_BURN ) or dmg:IsDamageType( DMG_SLOWBURN ) ) then dmg:ScaleDamage( 5 ) self:Ignite( 3600 ) end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Breakable.Metal" )
		if self:Health() <= 0 then self.xdefm_Killed = true
			if !self:IsOnFire() then local lt = {["it_ammocan1"]=200,["it_firearm1"]=600,["it_firearm2"]=200,["it_grenade"]=100,["it_rpg"]=100,["it_launcher"]=5} for i=1, math.random( 4, 8 ) do xdefm_LootDrop( lt, self ) end
			else local ef = EffectData()  ef:SetStart( self:WorldSpaceCenter() ) self:EmitSound( "NPC_SScanner.Gib" )
				ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetScale( 1 ) util.Effect( "Explosion", ef )
				local dmg = DamageInfo() dmg:SetDamage( math.random( 250, 500 ) ) dmg:SetDamageType( DMG_BLAST )
				dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
				dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 400 ) util.ScreenShake( self:WorldSpaceCenter(), 10, 10, 1, 500 )
			end
		xdefm_BreakEffect( self, 3 ) self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_firearm1"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/weapons/w_pist_deagle.mdl", "models/weapons/w_mach_m249para.mdl",
		"models/weapons/w_shot_xm1014.mdl", "models/weapons/w_shot_m3super90.mdl",
		"models/weapons/w_smg_mp5.mdl", "models/weapons/w_smg_p90.mdl", "models/weapons/w_smg_ump45.mdl",
		"models/weapons/w_rif_ak47.mdl", "models/weapons/w_rif_m4a1.mdl", "models/weapons/w_rif_sg552.mdl", "models/weapons/w_rif_aug.mdl",
		"models/weapons/w_pist_usp.mdl", "models/weapons/w_pist_fiveseven.mdl", "models/weapons/w_pist_glock18.mdl",
		"models/weapons/w_snip_scout.mdl", "models/weapons/w_snip_awp.mdl", "models/weapons/w_snip_g3sg1.mdl", "models/weapons/w_snip_sg550.mdl"
	}, Helper = "#xdefm.d"..it, Rarity = 2, Price = 400, PhysSound = "weapon.ImpactHard", TickRate = 0.01, HelperUse = "xdefm.U2" }
	ITEM.Constants = { Broken = true }
	local tb = {
		[ "models/weapons/w_shot_xm1014.mdl" ] = { ")weapons/xm1014/xm1014-1.wav", 6, 8, 0.5 },
		[ "models/weapons/w_shot_m3super90.mdl" ] = { ")weapons/m3/m3-1.wav", 6, 8, 1 },
		[ "models/weapons/w_smg_mp5.mdl" ] = { ")weapons/mp5navy/mp5-1.wav", 1, 4, 0.08 },
		[ "models/weapons/w_smg_p90.mdl" ] = { ")weapons/p90/p90-1.wav", 1, 4, 0.07 },
		[ "models/weapons/w_smg_ump45.mdl" ] = { ")weapons/ump45/ump45-1.wav", 1, 4, 0.1 },
		[ "models/weapons/w_rif_ak47.mdl" ] = { ")weapons/ak47/ak47-1.wav", 1, 8, 0.1 },
		[ "models/weapons/w_rif_m4a1.mdl" ] = { ")weapons/m4a1/m4a1_unsil-1.wav", 1, 8, 0.08 },
		[ "models/weapons/w_rif_sg552.mdl" ] = { ")weapons/sg552/sg552-1.wav", 1, 8, 0.1 },
		[ "models/weapons/w_rif_aug.mdl" ] = { ")weapons/aug/aug-1.wav", 1, 8, 0.09 },
		[ "models/weapons/w_mach_m249para.mdl" ] = { ")weapons/m249/m249-1.wav", 1, 8, 0.08 },
		[ "models/weapons/w_pist_usp.mdl" ] = { ")weapons/usp/usp_unsil-1.wav", 1, 5, 0.2 },
		[ "models/weapons/w_pist_fiveseven.mdl" ] = { ")weapons/fiveseven/fiveseven-1.wav", 1, 5, 0.2 },
		[ "models/weapons/w_pist_deagle.mdl" ] = { ")weapons/deagle/deagle-1.wav", 1, 40, 0.4 },
		[ "models/weapons/w_pist_glock18.mdl" ] = { ")weapons/glock/glock18-1.wav", 1, 5, 0.2 },
		[ "models/weapons/w_snip_scout.mdl" ] = { ")weapons/scout/scout_fire-1.wav", 1, 75, 1 },
		[ "models/weapons/w_snip_awp.mdl" ] = { ")weapons/awp/awp1.wav", 1, 115, 1 },
		[ "models/weapons/w_snip_g3sg1.mdl" ] = { ")weapons/g3sg1/g3sg1-1.wav", 1, 60, 0.25 },
		[ "models/weapons/w_snip_sg550.mdl" ] = { ")weapons/sg550/sg550-1.wav", 1, 50, 0.25 },
	}
	function ITEM:OnInit( self ) self.xdefm_NextFire = 0  if self.xdefm_T2.Constants.Broken then self:SetColor( Color( 255, 255, 200 ) ) end
		self:SetUseType( CONTINUOUS_USE ) self.xdefm_Snd = nil
	end
	function ITEM:OnUse( self, ply ) if self.xdefm_NextFire > CurTime() or !ply:IsPlayer() then return false end if ply:KeyDown( IN_SPEED ) then return true end
		local tab = tb[ string.lower( self:GetModel() ) ]  if !istable( tab ) or !self:GetAttachment( 1 ) then return false end self.xdefm_NextFire = CurTime() +tab[ 4 ]*( bro and 1.5 or 1 )
		local bro = self.xdefm_T2.Constants.Broken  if math.random( 1, 3 ) == 1 and bro then self:EmitSound( "Weapon_Pistol.Empty" ) return false end
		timer.Simple( 0.01, function() if !IsValid( self ) then return end self:ResetSequence( "attack_player" ) self:SetPlaybackRate( 1 )
		local bullet = {}  bullet.Num = tab[ 2 ]  bullet.Src = self:GetAttachment( 1 ).Pos
		bullet.Dir = self:GetForward()  bullet.Spread = Vector( 0.05*( bro and 0.5 or 1 ), 0.05*( bro and 0.5 or 1 ), 0 )  bullet.Force = tab[ 3 ]*100
		bullet.Tracer = 1  bullet.TracerName = "Tracer"  bullet.Damage = tab[ 3 ]*( bro and 4 or 1 )
		bullet.AmmoType = "Pistol"  bullet.Attacker = ( self:GetFMod_OW():IsPlayer() and self:GetFMod_OW() or self ) self:FireBullets( bullet )
		if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end self.xdefm_Snd = CreateSound( self, Sound( tab[ 1 ] ) ) self.xdefm_Snd:Play()
		self:GetPhysicsObject():AddVelocity( VectorRand():GetNormal()*50 -self:GetForward()*math.random( 150, 300 ) ) end ) return false
	end
	function ITEM:OnCollide( self, phy ) if self.xdefm_NextFire > CurTime() or !self.xdefm_T2.Constants.Broken then return end
		if self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() then return end
		if phy.Speed >= 60 and phy.DeltaTime > 0.2 and math.random( 1, 2 ) == 1 then
			local tab = tb[ string.lower( self:GetModel() ) ]  if !istable( tab ) or !self:GetAttachment( 1 ) then return end
			self:ResetSequence( "attack_player" ) self:SetPlaybackRate( 1 ) self.xdefm_NextFire = CurTime() +tab[ 4 ]
			local bullet = {}  bullet.Num = tab[ 2 ]  bullet.Src = self:GetAttachment( 1 ).Pos
			bullet.Dir = self:GetForward()  bullet.Spread = Vector( 0.05, 0.05, 0 )  bullet.Force = tab[ 3 ]*100
			bullet.Tracer = 1  bullet.TracerName = "Tracer"  bullet.Damage = tab[ 3 ]
			bullet.AmmoType = "Pistol"  bullet.Attacker = ( self:GetFMod_OW():IsPlayer() and self:GetFMod_OW() or self )
			if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end self.xdefm_Snd = CreateSound( self, Sound( tab[ 1 ] ) ) self.xdefm_Snd:Play()
			self:FireBullets( bullet ) self:GetPhysicsObject():AddVelocity( VectorRand():GetNormal()*50 -self:GetForward()*math.random( 150, 300 ) )
		end
	end
	function ITEM:OnRemove( self ) if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_firearm2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/weapons/w_pist_deagle.mdl", "models/weapons/w_mach_m249para.mdl",
		"models/weapons/w_shot_xm1014.mdl", "models/weapons/w_shot_m3super90.mdl",
		"models/weapons/w_smg_mp5.mdl", "models/weapons/w_smg_p90.mdl", "models/weapons/w_smg_ump45.mdl",
		"models/weapons/w_rif_ak47.mdl", "models/weapons/w_rif_m4a1.mdl", "models/weapons/w_rif_sg552.mdl", "models/weapons/w_rif_aug.mdl",
		"models/weapons/w_pist_usp.mdl", "models/weapons/w_pist_fiveseven.mdl", "models/weapons/w_pist_glock18.mdl",
		"models/weapons/w_snip_scout.mdl", "models/weapons/w_snip_awp.mdl", "models/weapons/w_snip_g3sg1.mdl", "models/weapons/w_snip_sg550.mdl"
	}, Helper = "#xdefm.d"..it, Rarity = 3, Price = 800, PhysSound = "weapon.ImpactHard", TickRate = 0.01, HelperUse = "xdefm.U2" }
	ITEM.Constants = { Broken = false }
	xdefm_ItemBased( "it_firearm1", it, ITEM )
end
if true then local it = "it_grenade"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/weapons/w_eq_fraggrenade.mdl", "models/Items/grenadeAmmo.mdl" },
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 300, PhysSound = "weapon.ImpactHard", TickRate = 1, HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Trigger = 0  self.xdefm_Killed = false end
	function ITEM:OnCaught( self ) if self.xdefm_Trigger > 0 or self.xdefm_Killed then return end
		self:EmitSound( "weapons/pinpull.wav" ) self.xdefm_Trigger = CurTime() +5  self:SetNWBool( "XDEFMod_PP", true )
	end
	function ITEM:OnUse( self, ply ) if ply:KeyDown( IN_SPEED ) then return true end
		if self.xdefm_Trigger > 0 or self.xdefm_Killed then return true end
		self:EmitSound( "weapons/pinpull.wav" ) self.xdefm_Trigger = CurTime() +5  self:SetNWBool( "XDEFMod_PP", true )
		return false
	end
	function ITEM:OnThink( self ) if self.xdefm_Killed or self.xdefm_Trigger <= 0 or self.xdefm_Trigger > CurTime() then return end
        self.xdefm_Killed = true local ef = EffectData()
		ef:SetStart( self:WorldSpaceCenter() ) ef:SetOrigin( self:WorldSpaceCenter() )
		ef:SetScale( 10 ) util.Effect( "Explosion", ef )
		for i=1, math.random( 4, 6 ) do
			local bullet = {}  bullet.Num = 5  bullet.Src = self:WorldSpaceCenter()
			bullet.Dir = VectorRand():GetNormal()  bullet.Spread = Vector( 1, 1, 0 )  bullet.Force = 10
			bullet.Tracer = 1  bullet.TracerName = "Ar2Tracer"  bullet.Damage = 80  bullet.AmmoType = "Pistol"
			bullet.Attacker = ( self:GetFMod_OW():IsPlayer() and self:GetFMod_OW() or self )  self:FireBullets( bullet )
		end
		local dmg = DamageInfo() dmg:SetDamage( 150 ) dmg:SetDamageType( bit.bor( DMG_BLAST, DMG_AIRBOAT ) )
		dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
		dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 128 ) self:EmitSound( "NPC_SScanner.Gib" ) SafeRemoveEntity( self )
	end
	function ITEM:OnDraw( self )
		if self:GetNWBool( "XDEFMod_PP" ) then
			render.SetMaterial( Mat ) local siz = 15 +math.sin( CurTime()*20 )*15
			render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( 255, 0, 0, 255 ) )
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_flashbang"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/weapons/w_eq_flashbang.mdl",
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 250, PhysSound = "weapon.ImpactHard", TickRate = 1, HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Trigger = 0  self.xdefm_Killed = false end
	function ITEM:OnCaught( self ) if self.xdefm_Trigger > 0 or self.xdefm_Killed then return end
		self:EmitSound( "weapons/pinpull.wav" ) self.xdefm_Trigger = CurTime() +5  self:SetNWBool( "XDEFMod_PP", true )
	end
	function ITEM:OnUse( self, ply ) if ply:KeyDown( IN_SPEED ) then return true end
		if self.xdefm_Trigger > 0 or self.xdefm_Killed then return true end
		self:EmitSound( "weapons/pinpull.wav" ) self.xdefm_Trigger = CurTime() +5  self:SetNWBool( "XDEFMod_PP", true )
		return false
	end
	function ITEM:OnThink( self ) if self.xdefm_Killed or self.xdefm_Trigger <= 0 or self.xdefm_Trigger > CurTime() then return end
        self.xdefm_Killed = true local ef = EffectData()
		ef:SetStart( self:WorldSpaceCenter() ) ef:SetOrigin( self:WorldSpaceCenter() )
		ef:SetScale( 2 ) ef:SetMagnitude( 1 ) ef:SetRadius( 2 ) util.Effect( "cball_explode", ef )
		local dmg = DamageInfo() dmg:SetDamage( 10 ) dmg:SetDamageType( DMG_BLAST )
		dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
		dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 256 )
		for k, v in pairs( ents.FindInSphere( self:WorldSpaceCenter(), 256 ) ) do
			if v:IsNPC() then v:ClearSchedule() elseif v:IsPlayer() then v:ScreenFade( SCREENFADE.IN, Color( 255, 255, 255 ), 4, 1 ) end
		end util.ScreenShake( self:WorldSpaceCenter(), 100, 100, 2, 256 ) self:EmitSound( "Flashbang.Explode" ) SafeRemoveEntity( self )
	end
	function ITEM:OnDraw( self )
		if self:GetNWBool( "XDEFMod_PP" ) then
			render.SetMaterial( Mat ) local siz = 15 +math.sin( CurTime()*20 )*15
			render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( 255, 255, 0, 255 ) )
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_launcher"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/weapons/w_physics.mdl",
	Helper = "#xdefm.d"..it, Rarity = 5, Price = 4500, PhysSound = "weapon.ImpactHard", TickRate = 0.1, HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_NextFire = 0  self:SetUseType( CONTINUOUS_USE ) end
	function ITEM:OnUse( self, ply ) if self.xdefm_NextFire > CurTime() or !ply:IsPlayer() then return false end if ply:KeyDown( IN_SPEED ) then return true end
		local att = self:GetAttachment( 1 ) if !att then return false end local rok = ents.Create( "rpg_missile" )
		rok:SetPos( att.Pos +self:EyeAngles():Forward()*16 ) rok:SetAngles( att.Ang ) rok:SetOwner( self )
		rok:Spawn() rok:Activate() rok:SetVelocity( self:EyeAngles():Forward()*1000 ) rok:SetGravity( 0 ) rok:SetSaveValue( "m_flDamage", 100 )
		rok:SetNWBool( "XDEFM_HO", true ) self:EmitSound( "weapons/stinger_fire1.wav" ) self.xdefm_NextFire = CurTime() +2
		self:GetPhysicsObject():AddVelocity( VectorRand():GetNormal()*25 -self:GetForward()*math.random( 200, 400 ) ) return false
	end
	function ITEM:OnThink( self )
		if self.xdefm_NextFire > 0 and self.xdefm_NextFire <= CurTime() then
			self:EmitSound( "Weapon_Shotgun.Empty" ) self.xdefm_NextFire = 0
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_car"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props_vehicles/car003a_physics.mdl", "models/props_vehicles/car003b_physics.mdl",
	"models/props_vehicles/car002b_physics.mdl", "models/props_vehicles/car004a_physics.mdl", "models/props_vehicles/car004b_physics.mdl", "models/props_vehicles/car005a_physics.mdl",
	"models/props_vehicles/car005b_physics.mdl" }, Helper = "#xdefm.d"..it, Rarity = 4, Price = 1280, Carryable = false, PhysSound = "MetalVehicle.ImpactSoft", TickRate = 0.1, HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_NextRun = 0  self.xdefm_Killed = false
	self.xdefm_Snd = nil  self:SetMaxHealth( 400 ) self:SetHealth( self:GetMaxHealth() ) end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( self:GetPhysicsObject():GetMass()*0.01 ) end
	function ITEM:OnUse( self, ply ) if self.xdefm_Killed or self.xdefm_NextRun > 0 then return false end
		if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end
		self.xdefm_Snd = CreateSound( self, Sound( "ATV_turbo_on" ) )  self.xdefm_Snd:Play()
		self.xdefm_NextRun = CurTime() +math.Rand( 1, 5 )  return false
	end
	function ITEM:OnThink( self ) if self.xdefm_Killed then return end
		if self.xdefm_NextRun > 0 and self.xdefm_NextRun <= CurTime() then self.xdefm_NextRun = 0
			if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end self:EmitSound( "ATV_engine_stop" )
		elseif self.xdefm_NextRun > 0 then local vel = ( self:GetAngles():Forward()*600 )
			vel.z = self:GetPhysicsObject():GetVelocity().z  self:GetPhysicsObject():SetVelocity( vel )
			self:GetPhysicsObject():AddAngleVelocity( Vector( 0, 0, math.sin( CurTime()*math.random( 2, 6 ) )*300 ) )
		end
	end
	function ITEM:OnCollide( self, dat, phy ) if self.xdefm_Killed then return end local ent = dat.HitEntity
		if self.xdefm_NextRun > 0 and dat.Speed >= 60 and dat.DeltaTime >= 0.2 then
			ent:EmitSound( "MetalVent.ImpactHard" ) local dmg = DamageInfo()
			dmg:SetDamage( 25 ) dmg:SetAttacker( self:GetFMod_OW() ) dmg:SetInflictor( self )
			dmg:SetDamagePosition( dat.HitPos ) dmg:SetDamageForce( dat.OurOldVelocity*5 ) dmg:SetDamageType( DMG_CRUSH )
			ent:TakeDamageInfo( dmg ) self:TakeDamageInfo( dmg ) if dat.Speed >= 900 then self.xdefm_NextRun = 0.1 end
		end
	end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:StopSound( "Breakable.Metal" ) self:EmitSound( "Breakable.Metal" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local ef = EffectData() ef:SetStart( self:WorldSpaceCenter() ) ef:SetOrigin( self:WorldSpaceCenter() )
		ef:SetScale( 1 ) util.Effect( "HelicopterMegaBomb", ef ) self:EmitSound( "Explo.ww2bomb" )
		local dmg = DamageInfo() dmg:SetDamage( 150 ) dmg:SetDamageType( bit.bor( DMG_BLAST, DMG_AIRBOAT ) )
		dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
		dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 200 )
		local lt = {["it_scrap"]=200,["it_copperbar"]=60,["it_leadbar"]=10,["it_steelbar"]=10} for i=1, math.random( 4, 6 ) do xdefm_LootDrop( lt, self ) end
		xdefm_BreakEffect( self, 3 ) self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	function ITEM:OnRemove( self ) if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_bread1"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/weapons/c_models/c_bread/c_bread_burnt.mdl",
	Helper = "#xdefm.d"..it, Rarity = 1, Price = 60, PhysSound = "Flesh.ImpactSoft", HelperUse = "xdefm.U2", CantCook = true }
	function ITEM:OnInit( self ) self.xdefm_Used = false end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Health() >= ent:GetMaxHealth() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() +math.random( 2, 10 ) ) )
		ent:EmitSound( "NPC_Barnacle.FinalBite" ) self:Remove() self.xdefm_Used = true return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_bread2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/weapons/c_models/c_bread/c_bread_cinnamon.mdl",
	"models/weapons/c_models/c_bread/c_bread_cornbread.mdl", "models/weapons/c_models/c_bread/c_bread_crumpet.mdl", "models/weapons/c_models/c_bread/c_bread_plainloaf.mdl",
	"models/weapons/c_models/c_bread/c_bread_pretzel.mdl", "models/weapons/c_models/c_bread/c_bread_ration.mdl", "models/weapons/c_models/c_bread/c_bread_russianblack.mdl" },
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 250, PhysSound = "Flesh.ImpactSoft", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Used = false end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Health() >= ent:GetMaxHealth() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end local met = xdefm_CookMeter( self:GetFMod_DT() )
		if met >= 0 then ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() +math.ceil( math.random( 5, 20 )*( 1 +met ) ) ) ) end
		ent:EmitSound( "NPC_Barnacle.FinalBite" ) self:Remove() self.xdefm_Used = true return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "cr_bread"
	sound.Add( { name = "xdefm.BreadAlert", channel = CHAN_VOICE, volume = 1, level = 75, pitch = 100,
	sound = { "weapons/breadmonster/sapper/bm_sapper_scream_01.wav", "weapons/breadmonster/sapper/bm_sapper_scream_02.wav" } } )
	sound.Add( { name = "xdefm.BreadAttack", channel = CHAN_VOICE, volume = 1, level = 75, pitch = 100,
	sound = { "weapons/breadmonster/throwable/bm_throwable_attack_01.wav", "weapons/breadmonster/throwable/bm_throwable_attack_02.wav", "weapons/breadmonster/throwable/bm_throwable_attack_03.wav",
		"weapons/breadmonster/throwable/bm_throwable_attack_04.wav", "weapons/breadmonster/throwable/bm_throwable_attack_05.wav", "weapons/breadmonster/throwable/bm_throwable_attack_06.wav",
		"weapons/breadmonster/throwable/bm_throwable_attack_07.wav", "weapons/breadmonster/throwable/bm_throwable_attack_08.wav", "weapons/breadmonster/throwable/bm_throwable_attack_09.wav",
		"weapons/breadmonster/throwable/bm_throwable_attack_10.wav" } } )
	local ITEM = { Name = "#xdefm."..it, Type = "Creature", Model = "models/weapons/w_models/w_breadmonster/w_breadmonster.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 3, Price = 500, TickRate = 0.1, MinSize = 1, MaxSize = 2 }
	function ITEM:OnReady( self ) self:StartMotionController() self:SetTrigger( true ) self:GetPhysicsObject():SetMass( 75 ) end
	function ITEM:OnInit( self ) self:SetMaxHealth( 100 ) self:SetHealth( self:GetMaxHealth() ) self.ShadowParams = {}
		self:SetAutomaticFrameAdvance( true ) self:SetBloodColor( BLOOD_COLOR_RED ) self.ShadowParams = {}  self.xdefm_Atk = 0
		self.xdefm_Killed = false  self.xdefm_AtkD = 0  self.xdefm_AtkT = nil  self:SetCollisionGroup( COLLISION_GROUP_WORLD )
	end
	function ITEM:OnThink( self ) if self.xdefm_Killed then return end
		if self.xdefm_AtkD <= CurTime() and !IsValid( self.xdefm_AtkT ) then self.xdefm_AtkD = CurTime() +1  local tas = {}
			for k, v in pairs( ents.FindInSphere( self:GetPos(), 2048 ) ) do if v == self then continue end
				if ( !v:IsNPC() and !v:IsPlayer() and v:GetClass() != "xdefm_base" )
				or !isstring( v:GetModel() ) or !util.IsValidModel( v:GetModel() ) or v:Health() <= 0 then continue end table.insert( tas, v )
			end if #tas > 0 then local tar = tas[ math.random( #tas ) ]
				local tr = util.TraceLine( { start = self:GetPos(), endpos = tar:WorldSpaceCenter(), filter = { tar, self }, mask = MASK_NPCSOLID } )
				if !tr.Hit then self:EmitSound( "xdefm.BreadAlert" ) self.xdefm_AtkT = tar end
			end
		end
		if IsValid( self.xdefm_AtkT ) then local tar = self.xdefm_AtkT
			if tar:Health() <= 0 then self.xdefm_AtkT = nil  self.xdefm_NT = 0 else
			local tr = util.TraceLine( { start = self:GetPos(), endpos = tar:GetPos(), filter = { tar, self }, mask = MASK_NPCSOLID } )
			if tr.Hit then self.xdefm_AtkT = nil  self.xdefm_NT = 0 end end
		end
	end
	function ITEM:OnTouch( self, ent, typ ) if typ == -1 or self.xdefm_Killed or self.xdefm_Atk > CurTime() then return end self.xdefm_Atk = CurTime() +0.25
		if ent:Health() <= 0 or ( !ent:IsPlayer() and !ent:IsNPC() and ent:GetClass() != "xdefm_base" ) then return end
		local vel = ( self:WorldSpaceCenter() - ent:WorldSpaceCenter() ):GetNormalized()
		local dmg = DamageInfo() dmg:SetDamage( 5 ) dmg:SetAttacker( self:GetFMod_OW() )
		dmg:SetInflictor( self ) dmg:SetDamageType( DMG_SLASH ) dmg:SetDamagePosition( ent:WorldSpaceCenter() )
		dmg:SetDamageForce( vel*200 ) ent:TakeDamageInfo( dmg ) self:EmitSound( "xdefm.BreadAttack" )
		ent:SetVelocity( vel*-400 )
		if IsValid( ent:GetPhysicsObject() ) then ent:GetPhysicsObject():SetVelocity( vel*-300 ) end
	end
	function ITEM:OnPlayerDrop( self, own ) self:SetHealth( 0 ) self:SetColor( Color( 255, 155, 155 ) )
	self:SetCollisionGroup( COLLISION_GROUP_NPC ) self.xdefm_Killed = true end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed then return end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) )
		if self:Health() <= 0 then self:SetColor( Color( 255, 155, 155 ) ) self:SetCollisionGroup( COLLISION_GROUP_NPC )
		self:EmitSound( "NPC_BlackHeadcrab.Die" ) self.xdefm_Killed = true self:SetPlaybackRate( 0 ) end
	end
	function ITEM:OnPhysSimulate( self, phy, del ) if self.xdefm_Killed then return end
		if self:GetCollisionGroup() != COLLISION_GROUP_WORLD then self:SetCollisionGroup( COLLISION_GROUP_WORLD ) end
		if self:GetPlaybackRate() != 1 then self:SetPlaybackRate( 1 ) end
		if self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() then return end
		phy:Wake() if !IsValid( self.xdefm_AtkT ) then return end
		local vel = ( self.xdefm_AtkT:WorldSpaceCenter() -self:GetPos() ):GetNormalized()*16
		local ang = ( self.xdefm_AtkT:WorldSpaceCenter() -self:GetPos() ):Angle()  ang = Angle( 0, ang.yaw, 0 )
		self.ShadowParams.pos = self:GetPos() +vel
		self.ShadowParams.angle = ang
		self.ShadowParams.maxangular = 1000
		self.ShadowParams.maxangulardamp = 10000
		self.ShadowParams.maxspeed = 1000
		self.ShadowParams.maxspeeddamp = 10000
		self.ShadowParams.dampfactor = 0.8
		self.ShadowParams.teleportdistance = 0
		self.ShadowParams.deltatime = deltatime
		phy:ComputeShadowControl( self.ShadowParams )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_pumpkin1"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_outland/pumpkin01.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 100, PhysSound = "Watermelon.Impact", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 50 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed then return end self:EmitSound( "Watermelon.BulletImpact" )
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) if self:Health() <= 0 then self.xdefm_Killed = true
			self:Remove() local lt = {["it_pumpki"]=1} for i=1, 5 do xdefm_LootDrop( lt, self ) end
		end
	end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Health() >= ent:GetMaxHealth() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end local met = xdefm_CookMeter( self:GetFMod_DT() )
		if met >= 0 then ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() +math.ceil( 50*( 1 +met ) ) ) ) end
		ent:EmitSound( "NPC_Barnacle.FinalBite" ) self:Remove() self.xdefm_Used = true return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_pumpkin2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_outland/pumpkin01_explosive.mdl", Helper = "#xdefm.d"..it,
	Rarity = 3, Price = 300, PhysSound = "Watermelon.Impact", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 100 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed then return end self:EmitSound( "Watermelon.BulletImpact" )
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) if self:Health() <= 0 then self.xdefm_Killed = true
			self:Remove() local lt = {["it_pumpki"]=1} for i=1, 10 do xdefm_LootDrop( lt, self ) end
		end
	end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Health() >= ent:GetMaxHealth() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end local met = xdefm_CookMeter( self:GetFMod_DT() )
		if met >= 0 then ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() +math.ceil( 150*( 1 +met ) ) ) ) end
		ent:EmitSound( "NPC_Barnacle.FinalBite" ) self:Remove() self.xdefm_Used = true return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_pumpki"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props_outland/pumpkin01_chunk01a.mdl", "models/props_outland/pumpkin01_chunk01b.mdl",
	"models/props_outland/pumpkin01_chunk02a.mdl" },
	Helper = "#xdefm.d"..it, Rarity = 1, PhysSound = "Watermelon.Impact", Price = 20, HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Used = false self:SetCollisionGroup( COLLISION_GROUP_WEAPON ) end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Health() >= ent:GetMaxHealth() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end local met = xdefm_CookMeter( self:GetFMod_DT() )
		if met >= 0 then ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() +math.ceil( 10*( 1 +met ) ) ) ) end
		ent:EmitSound( "NPC_Barnacle.FinalBite" ) self:Remove() self.xdefm_Used = true return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_pmetal"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/npcs/turret/turret_fx_break_gib2.mdl", "models/npcs/turret/turret_fx_break_gib12.mdl",
	"models/npcs/turret/turret_fx_break_gib15.mdl", "models/npcs/turret/turret_fx_break_gib16.mdl", "models/npcs/turret/turret_fx_break_gib20.mdl", "models/npcs/turret/turret_fx_break_gib21.mdl",
	"models/npcs/turret/turret_fx_break_gib22.mdl" }, Helper = "#xdefm.d"..it, Rarity = 3, Price = 825, PhysSound = "EpicMetal.ImpactSoft" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_pcube"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props/metal_box_fx_fizzler.mdl", Helper = "#xdefm.d"..it,
	Rarity = 3, Price = 450, PhysSound = "Metal_Box.ImpactHard" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 200 ) self:SetHealth( self:GetMaxHealth() ) self:SetSkin( math.random( 0, 2 ) ) self.xdefm_Killed = false end
	function ITEM:OnDamaged( self, dmg ) if dmg:GetDamage() <= 0 or self.xdefm_Killed or ( !dmg:IsDamageType( DMG_DISSOLVE ) and !dmg:IsDamageType( DMG_BURN ) and !dmg:IsDamageType( DMG_SLOWBURN ) ) then return true end
		if !self:IsOnFire() then self:Ignite( math.random( 360 ) ) end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:StopSound( "Metal_Box.Strain" ) self:StopSound( "Metal_Box.Break" )
		if self:Health() > 0 then self:EmitSound( "Metal_Box.Strain" ) else self.xdefm_Killed = true  self:EmitSound( "Metal_Box.Break" )
		local lt = {["it_scrap"]=1} for i=1, math.random( 4, 6 ) do xdefm_LootDrop( lt, self ) end
		xdefm_BreakEffect( self, 3 ) self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_pradio"
	local so = Sound( "ambient/music/looping_radio_mix.wav" )
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props/radio_reference.mdl",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 1000, PhysSound = "Metal_Box.ImpactSoft", TickRate = 0.1, HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Snd = CreateSound( self, so )
		self.xdefm_Snd:Play()  self.xdefm_BrokenDelay = 0  self.xdefm_TurnOn = true
		self.xdefm_NextChange = CurTime() +math.Rand( 2, 10 )  self.xdefm_Broken = false
	end
	function ITEM:OnUse( self, ent ) if ent:KeyDown( IN_SPEED ) then return true end
		if ent:IsPlayer() then self.xdefm_BrokenDelay = CurTime() +1  self.xdefm_TurnOn = !self.xdefm_TurnOn
		if self.xdefm_Snd then self.xdefm_Snd:Stop()  self.xdefm_Snd = nil end
		self.xdefm_NextChange = CurTime() +math.Rand( 2, 10 )  self.xdefm_Broken = false
		self:StopSound( "eli_lab.al_buttonmash" ) self:EmitSound( "eli_lab.al_buttonmash" ) return false end
	end
	function ITEM:OnThink( self ) if self.xdefm_Broken then return end
		if self.xdefm_TurnOn and self.xdefm_Snd and !self.xdefm_Snd:IsPlaying() then self.xdefm_Snd:Play() end
		if self.xdefm_TurnOn and !self.xdefm_Snd then self.xdefm_Snd = CreateSound( self, so )
		self.xdefm_Snd:ChangePitch( 100, 0 ) self.xdefm_Snd:Play() end
		if self.xdefm_TurnOn then self:GetPhysicsObject():AddVelocity( VectorRand():GetNormal()*10 )
			if self.xdefm_Snd and self.xdefm_NextChange <= CurTime() then self.xdefm_NextChange = CurTime() +math.Rand( 2, 10 )
				local chn = math.random( 80, 120 )  self.xdefm_Snd:ChangePitch( chn, math.Rand( 1, 2 ) )
			end
		end
	end
	function ITEM:OnDamaged( self ) if self.xdefm_Broken or !self.xdefm_TurnOn then return end
		self:StopSound( "DoSpark" ) self:EmitSound( "DoSpark" )
		local ef = EffectData() ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetEntity( self ) ef:SetRadius( 5 )
		ef:SetScale( 5 ) ef:SetMagnitude( 2 ) util.Effect( "ElectricSpark", ef )
		self.xdefm_BrokenDelay = CurTime() +1  self.xdefm_Broken = true
		if self.xdefm_Snd then self.xdefm_Snd:ChangeVolume( 0, 2 ) self.xdefm_Snd:ChangePitch( 60, 2 ) end
	end
	function ITEM:OnCollide( self, dat ) if self.xdefm_Broken or !self.xdefm_TurnOn then return end
		if dat.Speed >= 300 and dat.DeltaTime > 0.2 then self:TakeDamage( 1 ) end
	end
	function ITEM:OnRemove( self ) if self.xdefm_Snd then self.xdefm_Snd:Stop()  self.xdefm_Snd = nil end end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_pcore"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/xdeedited/personality_sphere_skins.mdl",
	Helper = "#xdefm.d"..it, Rarity = 5, Price = 7500, PhysSound = "MetalGrate.ImpactSoft", TickRate = 0.1 }
	local ani = { "sphere_idle_neutral", "core01_idle", "core02_idle", "core03_idle" }
	local spe = { "sphere_glance_subtle", "sphere_react_laser_ow", "sphere_shake_slow", "sphere_swagger" }
	local tab = {
		{ {"02",40},{"03",37},{"04",33},{"05",20},{"06",6},{"07",7},{"10",10},{"11",7},{"12",9},{"13",14},{"14",10},
			{"15",8},{"16",4},{"17",6},{"18",2},{"19",1},{"20",1},{"21",1},{"22",1},{"26",1},{"28",5},{"29",8},{"30",11},
			{"31",2},{"35",7},{"36",8},{"37",6},{"38",6},{"40",5},{"41",8},{"42",4},{"43",6},{"44",4} },
		{ {"01",5},{"02",1},{"03",1},{"04",1},{"05",3},{"06",7},{"07",1},{"08",2},{"09",1},{"10",1},{"11",3},
			{"12",3},{"13",1},{"14",1},{"15",4},{"16",1},{"17",3},{"18",2},{"19",2},{"20",3},{"21",4},{"22",2},{"23",5},
			{"24",1} },
		{ {"01",2},{"02",4},{"03",5},{"04",2},{"05",2},{"06",2},{"07",3},{"08",2},{"09",2},{"10",2},{"11",2},
			{"12",2},{"13",2},{"14",2},{"15",2},{"16",2},{"17",3},{"18",2},{"19",2},{"20",2},{"21",3},{"22",3},{"23",3},
			{"24",4},{"25",4},{"26",5},{"27",4},{"28",9},{"29",3},{"30",3},{"31",1},{"32",2},{"33",2},{"34",3} },
		{ {"01",8},{"02",9},{"03",6},{"04",7},{"05",8},{"06",7},{"07",5},{"08",5},{"09",8},{"10",13},{"11",13},
			{"12",5},{"13",4},{"14",6},{"15",6},{"16",5},{"17",4},{"18",4},{"19",8},{"20",11},{"21",6},{"22",6},{"23",11},
			{"24",11},{"25",3},{"26",8},{"27",7},{"28",9},{"29",11},{"30",3} }
	}
	function ITEM:OnInit( self ) self.xdefm_NextSpeak = CurTime() +math.Rand( 1, 10 )  self.xdefm_Type = math.random( 0, 3 )
		self:SetAutomaticFrameAdvance( true ) self:ResetSequence( ani[ self.xdefm_Type +1 ] ) self:SetPlaybackRate( 1 ) 
		self:SetSkin( self.xdefm_Type ) self.xdefm_Voice = nil  self.xdefm_VTime = CurTime() +1  self.xdefm_AnimD = 0
	end
	function ITEM:OnThink( self ) if self:GetSkin() != self.xdefm_Type then self:SetSkin( self.xdefm_Type ) end
		if self.xdefm_AnimD and self:GetCycle() == 1 then
			self:ResetSequence( spe[ self.xdefm_Type +1 ] ) self:SetPlaybackRate( 1 ) end
		if self.xdefm_AnimD < CurTime() and self:GetSequenceName( self:GetSequence() ) != ani[ self.xdefm_Type +1 ] then
			self:ResetSequence( ani[ self.xdefm_Type +1 ] ) self:SetPlaybackRate( 1 ) end
		if ( self.xdefm_Voice == nil or !self.xdefm_Voice:IsPlaying() ) and self.xdefm_VTime > CurTime() and math.random( 1, 30 ) == 1 then self.xdefm_VTime = 0 end
		if self.xdefm_VTime <= CurTime() then local typ, snd = self.xdefm_Type, tab[ self.xdefm_Type +1 ]  if !istable( snd ) then return end
			local con = snd[ math.random( #snd ) ]  local del = con[ 2 ]  local pat = ""
			if typ == 0 then pat = "npc/cores/wheatley_sapper_idle"..con[ 1 ]..".mp3"
			elseif typ == 1 then pat = "npc/cores/space"..con[ 1 ]..".mp3"
			elseif typ == 2 then pat = "npc/cores/attachedfact"..con[ 1 ]..".mp3"
			elseif typ == 3 then pat = "npc/cores/babble"..con[ 1 ]..".mp3" end
			if pat == "" or !isnumber( del ) or del <= 0 then return end if self.xdefm_Voice then self.xdefm_Voice:Stop()  self.xdefm_Voice = nil end
			self.xdefm_AnimD = CurTime() +del  self:ResetSequence( spe[ typ +1 ] ) self:SetPlaybackRate( 1 )
			self.xdefm_Voice = CreateSound( self, Sound( pat ) )  self.xdefm_Voice:Play()  self.xdefm_VTime = CurTime() +del +1
		end
	end
	function ITEM:OnRemove( self ) if self.xdefm_Voice then self.xdefm_Voice:Stop()  self.xdefm_Voice = nil end end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_pturre1"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props/turret_01.mdl", TickRate = 0.04
	, Helper = "#xdefm.d"..it, Rarity = 4, Price = 2250, PhysSound = "SolidMetal.ImpactSoft", Carryable = false }
	ITEM.Constants = { [ "Broken" ] = false }
	local so = { "npc/turret/different_turret01.wav",
		"npc/turret/sp_sabotage_factory_good_pass01.wav",
		"npc/turret/sp_sabotage_factory_template01.wav" }
	function ITEM:OnInit( self ) self.xdefm_NextSnd = CurTime() +1  self.xdefm_Detect = CurTime() +1
		self:SetAutomaticFrameAdvance( true ) self:ResetSequence( "idle" ) self:SetPlaybackRate( 1 )
		self.xdefm_Alive = true  self.ShadowParams = {}  self.xdefm_Target = nil
		self.xdefm_Find = 0  self.xdefm_NextFire = 0  self.xdefm_BreakIn = 0  self.xdefm_Cool = 0
		self:SetNWFloat( "XDEFM_Pit", 0 )  self:SetNWFloat( "XDEFM_Yaw", 0 )  self.xdefm_Broken = self.xdefm_T2.Constants.Broken
		self:SetSkin( self.xdefm_Broken and 1 or 0 )
	end
	function ITEM:OnUse( self, ent )
		if self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() then return end
		self:SetAngles( Angle( 0, self:GetAngles().yaw, 0 ) )
	end
	function ITEM:OnStore( self ) if self.xdefm_Broken and self.xdefm_BreakIn > 0 then return false end end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnThink( self ) local seq, pit = self:GetSequenceName( self:GetSequence() ), math.abs( self:GetAngles().roll )
		if !isnumber( self.xdefm_BreakIn ) then self.xdefm_BreakIn = 0 end
		if self.xdefm_BreakIn > 0 and self.xdefm_BreakIn <= CurTime() then
			xdefm_BreakEffect( self, 3 ) self:EmitSound( "Breakable.Metal" ) self:Remove()
		return end if self.xdefm_BreakIn > 0 then return end
		if self.xdefm_Detect <= CurTime() then self.xdefm_Detect = CurTime() +0.2
			if pit > 45 then if self.xdefm_Alive then self.xdefm_Alive = false
					if self.xdefm_NextSnd <= CurTime() then self.xdefm_NextSnd = CurTime() +math.Rand( 4.1, 6 )  self.xdefm_Detect = CurTime()
						self:EmitSound( "npc/turret_floor/turret_tipped_"..math.random( 1, 6 )..".wav" )  self.xdefm_Target = nil
					end if seq != "idle" and seq != "retract" then self:ResetSequence( "retract" ) self.xdefm_NextFire = CurTime() +1 end
				end
			elseif !self.xdefm_Alive then self.xdefm_Alive = true
				if self:IsPlayerHolding() then self:EmitSound( so[ math.random( #so ) ] )
					self.xdefm_NextSnd = CurTime() +math.Rand( 1, 2 )
				end
			end if self.xdefm_Alive then local att = self:GetAttachment( self:LookupAttachment( "eyes" ) )
				if !att or IsValid( self.xdefm_Target ) then return end for k, v in pairs( ents.FindInCone( att.Pos, att.Ang:Forward(), 1000, 0.707 ) ) do
					if v:Health() <= 0 or v:GetClass() != "xdefm_base" then continue end
					if v:GetClass() == "xdefm_base" and ( !istable( v.xdefm_T2 ) or v.xdefm_T2.Type != "Creature" ) then continue end
					local tr = util.TraceLine( { start = att.Pos, endpos = v:WorldSpaceCenter(), filter = { self, v }, mask = MASK_SHOT } )
					if !tr.Hit or tr.Entity:Health() > 0 then self.xdefm_Target = v
					if self.xdefm_NextSnd <= CurTime() then self:EmitSound( "npc/turret_floor/turret_active_"..math.random( 1, 8 )..".wav" )
					self.xdefm_NextSnd = CurTime() +3.1 end if seq == "idle" or seq == "retract" then self.xdefm_NextFire = CurTime() +1*( self.xdefm_Broken and 1 or 0.25 )
					self:ResetSequence( "deploy" ) self.xdefm_Find = CurTime() +5 end break end
				end
			end
		end if self.xdefm_Alive then
			if IsValid( self.xdefm_Target ) then local tar = self.xdefm_Target  local att = self:GetAttachment( self:LookupAttachment( "eyes" ) )
				if tar:Health() <= 0 or ( !tar:IsNPC() and tar:GetClass() != "xdefm_base" ) or ( tar:GetClass() == "xdefm_base" and ( !istable( tar.xdefm_T2 ) or tar.xdefm_T2.Type != "Creature" ) )
				or tar:WorldSpaceCenter():Distance( att.Pos ) > 2000 then self.xdefm_Target = nil return end
				local _, aa = WorldToLocal( Vector( 0, 0, 0 ), ( tar:WorldSpaceCenter() -att.Pos ):Angle(), Vector( 0, 0, 0 ), self:GetAngles() )
				if math.sqrt( aa.pitch^2 +aa.yaw^2 ) > 60 then self.xdefm_Target = nil  self.xdefm_Detect = CurTime() end
				local tr = util.TraceLine( { start = att.Pos,  endpos = tar:WorldSpaceCenter(), filter = { self, tar }, mask = MASK_NPCWORLDSTATIC } )
				if tr.Hit then self.xdefm_Target = nil return end self.xdefm_Find = CurTime() +5
				local pit, yaw = self:GetNWFloat( "XDEFM_Pit" ), self:GetNWFloat( "XDEFM_Yaw" )
				local _, aa = WorldToLocal( Vector( 0, 0, 0 ), ( tar:WorldSpaceCenter() -att.Pos ):Angle(), Vector( 0, 0, 0 ), self:LocalToWorldAngles( Angle( pit, yaw, 0 ) ) )
				aa.Pitch = math.Clamp( aa.Pitch, -10, 10 )  aa.Yaw = math.Clamp( aa.Yaw, -10, 10 )
				self:SetNWFloat( "XDEFM_Pit", math.Clamp( pit +aa.pitch, -15, 15 ) )
				self:SetNWFloat( "XDEFM_Yaw", math.Clamp( yaw +aa.yaw, -60, 60 ) )
				self:SetPoseParameter( "aim_pitch", self:GetNWFloat( "XDEFM_Pit" ) )
				self:SetPoseParameter( "aim_yaw", self:GetNWFloat( "XDEFM_Yaw" ) )
				tr = util.TraceLine( { start = att.Pos, endpos = tar:WorldSpaceCenter(), filter = { self }, mask = MASK_SHOT } )
				if self.xdefm_NextFire <= CurTime() and tr.Hit and ( tr.Entity == tar or tr.Entity:Health() > 0 ) and self.xdefm_Cool <= CurTime() then
					if math.random( 1, 200 ) == 1 and self.xdefm_BreakIn == 0 and self.xdefm_Broken then self.xdefm_BreakIn = CurTime() +5  self:Ignite( 360 )
						if self.xdefm_NextSnd <= CurTime() then self:EmitSound( "npc/turret/turretshotbylaser0"..math.random( 1, 9 )..".wav" )
						self.xdefm_NextSnd = CurTime() +10 self:EmitSound( "Weapon_IRifle.Empty" ) end
					end
					local ran = math.random( 1, 2 )  self.xdefm_Cool = CurTime() +0.08*( self.xdefm_Broken and 2 or 1 )
					for i=1, 2 do local at = self:GetAttachment( 2 +( i == 1 and 2 or 0 ) +ran )
						local bullet = {}
						bullet.Num = 1  bullet.Src = at.Pos
						bullet.Dir = ( ( tar:IsNPC() and tar:HeadTarget( at.Pos ) or tar:WorldSpaceCenter() ) -at.Pos ):GetNormal()
						bullet.Spread = Vector( 0.025, 0.025, 0 )
						bullet.Force = 1
						bullet.Tracer = 1
						bullet.TracerName = "ToolTracer"
						bullet.Damage = 2
						bullet.AmmoType = "Pistol"
						bullet.Attacker = ( self:GetFMod_OW():IsPlayer() and self:GetFMod_OW() or self )
						self:FireBullets( bullet )
					end self:ResetSequence( ran == 1 and "fire" or "fire2" ) self:EmitSound( "Weapon_SMG1.NPC_Single" )
				end
			elseif self.xdefm_Find > CurTime() then
				local pit, yaw = self:GetNWFloat( "XDEFM_Pit" ), self:GetNWFloat( "XDEFM_Yaw" )
				local _, aa = WorldToLocal( Vector( 0, 0, 0 ), self:LocalToWorldAngles( Angle( 0, 60*math.sin( CurTime()*2 +self:EntIndex() ), 0 ) ), Vector( 0, 0, 0 ), self:LocalToWorldAngles( Angle( pit, yaw, 0 ) ) )
				aa.Pitch = math.Clamp( aa.Pitch, -5, 5 )  aa.Yaw = math.Clamp( aa.Yaw, -5, 5 )
				self:SetNWFloat( "XDEFM_Pit", math.Clamp( pit +aa.pitch, -15, 15 ) )
				self:SetNWFloat( "XDEFM_Yaw", math.Clamp( yaw +aa.yaw, -60, 60 ) )
				self:SetPoseParameter( "aim_pitch", self:GetNWFloat( "XDEFM_Pit" ) )
				self:SetPoseParameter( "aim_yaw", self:GetNWFloat( "XDEFM_Yaw" ) )
			elseif seq != "retract" and seq != "idle" then self:ResetSequence( "retract" )
				if self.xdefm_NextSnd <= CurTime() then self:EmitSound( "npc/turret_floor/turret_retire_"..math.random( 1, 7 )..".wav" )
					self.xdefm_NextSnd = CurTime() +2.1
				end self:SetNWFloat( "XDEFM_Pit", 0 ) self:SetPoseParameter( "aim_pitch", 0 )
				self:SetNWFloat( "XDEFM_Yaw", 0 ) self:SetPoseParameter( "aim_yaw", 0 )
			end
		elseif self.xdefm_NextSnd <= CurTime() and math.random( 1, 40 ) == 1 then
			self:EmitSound( "npc/turret/turretstuckintube0"..math.random( 1, 9 )..".wav" )
			self:GetPhysicsObject():AddVelocity( VectorRand():GetNormal()*100 )
			self.xdefm_NextSnd = CurTime() +1
		end
	end local Ma1 = Material( "effects/laser_citadel1" )  local Ma2 = Material( "sprites/physg_glow1" )
	function ITEM:OnDraw( self ) self:DrawModel() local act = self:GetSequenceName( self:GetSequence() )
		if !isnumber( self.xdefm_LasP ) then self.xdefm_LasP = 0 else self.xdefm_LasP = Lerp( 0.1, self.xdefm_LasP, self:GetNWFloat( "XDEFM_Pit" ) ) end
		if !isnumber( self.xdefm_LasY ) then self.xdefm_LasY = 0 else self.xdefm_LasY = Lerp( 0.1, self.xdefm_LasY, self:GetNWFloat( "XDEFM_Yaw" ) ) end
		if ( act == "deploy" or act == "fire" or act == "fire2" ) then
			local att = self:GetAttachment( self:LookupAttachment( "light" ) )  if !att then return end
			local tr = util.TraceLine( {
				start = att.Pos, endpos = att.Pos +self:LocalToWorldAngles( Angle( self.xdefm_LasP, self.xdefm_LasY, 0 ) ):Forward()*2000,
				filter = self, mask = MASK_SHOT
			} ) self:SetRenderBoundsWS( tr.StartPos, tr.HitPos ) local col = Color( 155, 0, 0 )
			render.SetMaterial( Ma1 ) render.DrawBeam( tr.StartPos, tr.HitPos, 10, 1, 0, col )
			if tr.Hit then render.SetMaterial( Ma2 ) render.DrawSprite( tr.HitPos, 15, 15, col ) end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_pturre2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", "models/props/turret_01.mdl", TickRate = 0.04
	, Helper = "#xdefm.d"..it, Rarity = 3, Price = 1250, PhysSound = "SolidMetal.ImpactSoft", Carryable = false }
	ITEM.Constants = { [ "Broken" ] = true }
	xdefm_ItemBased( "it_pturre1", it, ITEM )
end
if true then local it = "it_bait2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/cardboard_box001a.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 600, PhysSound = "Cardboard.ImpactHard" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 50 ) self:SetHealth( self:GetMaxHealth() ) self:SetCollisionGroup( COLLISION_GROUP_NONE ) self.xdefm_Killed = false end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Cardboard.Break" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local lt = {["ba_skull"]=5,["ba_bread"]=5,["ba_box"]=5,["ba_fish"]=5,["ba_pickaxe"]=5,["ba_teddy"]=2,["ba_bomb"]=2}
		for i=1, 3 do xdefm_LootDrop( lt, self ) end self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_bait3"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/cardboard_box002a.mdl", Helper = "#xdefm.d"..it,
	Rarity = 3, Price = 1200, PhysSound = "Cardboard.ImpactHard" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 60 ) self:SetHealth( self:GetMaxHealth() ) self:SetCollisionGroup( COLLISION_GROUP_NONE ) self.xdefm_Killed = false end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Cardboard.Break" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local lt = {["ba_teddy"]=25,["ba_bomb"]=25,["ba_meat"]=25,["ba_c4"]=25,["ba_drill"]=25,["ba_combine"]=2,["ba_portal"]=2,["ba_gmod"]=1}
		for i=1, 3 do xdefm_LootDrop( lt, self ) end self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_crate2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/wood_crate002a.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 3, Price = 450 }
	function ITEM:OnInit( self ) self:SetMaxHealth( 120 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Wood.Break" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local lt = {["it_health"]=75,["it_steelbar"]=50,["it_copperbar"]=50,["it_grenade"]=50,["it_leadbar"]=50,
		["it_coal"]=50,["it_armor"]=75,["it_present"]=25,["it_refill"]=50,["it_coin"]=50}
		for i=1, math.random( 8, 16 ) do xdefm_LootDrop( lt, self ) end
		xdefm_BreakEffect( self, 1 ) self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_mush1"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_collectables/mushrooms.mdl", Helper = "#xdefm.d"..it,
	Rarity = 1, Price = 45, PhysSound = "Watermelon.BulletImpact", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Used = false end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Health() >= ent:GetMaxHealth() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end local met = xdefm_CookMeter( self:GetFMod_DT() )
		if met >= 0 then ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() +math.ceil( 20*( 1 +met ) ) ) ) end
		ent:EmitSound( "NPC_Barnacle.FinalBite" ) self:Remove() self.xdefm_Used = true return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_mush2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_collectables/mushrooms_glowing.mdl", Helper = "#xdefm.d"..it,
	Rarity = 1, Price = 135, PhysSound = "Watermelon.BulletImpact", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Used = false end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end
		if ent:KeyDown( IN_SPEED ) then return true end local met = xdefm_CookMeter( self:GetFMod_DT() )
		if met >= 0 then local dmg = DamageInfo() dmg:SetDamage( 50*( 1 +met ) ) dmg:SetAttacker( self:GetFMod_OW() )
			dmg:SetInflictor( self ) dmg:SetDamageType( DMG_POISON ) dmg:SetDamageForce( VectorRand():GetNormal()*1000 )
			dmg:SetDamagePosition( ent:WorldSpaceCenter() ) ent:TakeDamageInfo( dmg )
		end
		ent:EmitSound( "NPC_Barnacle.FinalBite" ) self:Remove() self.xdefm_Used = true return false
	end
	function ITEM:OnCollide( self, dat )
		if dat.Speed >= 60 and dat.DeltaTime > 0.2 then local ent = dat.HitEntity self:EmitSound( "Watermelon.Impact" )
		if ent:IsPlayer() or ent:IsNPC() then
			local dmg = DamageInfo() dmg:SetDamage( 5 ) dmg:SetAttacker( self:GetFMod_OW() )
			dmg:SetInflictor( self ) dmg:SetDamageType( DMG_POISON )
			dmg:SetDamageForce( ( ent:WorldSpaceCenter() -self:WorldSpaceCenter() ):GetNormalized()*5000 )
			dmg:SetDamagePosition( ent:WorldSpaceCenter() ) ent:TakeDamageInfo( dmg )
		end end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_crate3"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/Items/item_item_crate.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 3, Price = 500 }
	function ITEM:OnInit( self ) self:SetMaxHealth( 50 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Wood.Break" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local lt = {["it_health"]=50,["it_armor"]=50,["it_ammo"]=100,["it_rpg"]=25}
		for i=1, math.random( 4, 6 ) do xdefm_LootDrop( lt, self ) end
		xdefm_BreakEffect( self, 1 ) self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_cmetal"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/combine_turrets/floor_turret_gib1.mdl", "models/combine_turrets/floor_turret_gib2.mdl",
	"models/combine_turrets/floor_turret_gib3.mdl", "models/combine_turrets/floor_turret_gib4.mdl", "models/combine_turrets/floor_turret_gib5.mdl" }
	, Helper = "#xdefm.d"..it, Rarity = 3, Price = 750, PhysSound = "EpicMetal.ImpactSoft" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_ccore"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/items/combine_rifle_ammo01.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 3, Price = 999, TickRate = 0.1, PhysSound = "PhxMetal.ImpactSoft" }
	function ITEM:OnInit( self ) self.xdefm_NextShock = CurTime() +1 self.xdefm_NextHit = 0 self.xdefm_NextBlast = 0 end
	function ITEM:OnReady( self ) self:SetTrigger( true ) end
	function ITEM:OnThink( self ) if self.xdefm_NextShock > CurTime() then return end self.xdefm_NextShock = CurTime() + math.Rand( 1, 2 )
		if self:WaterLevel() >= 3 then return end if self.xdefm_NextBlast < 20 then local ef = EffectData()  ef:SetEntity( self ) ef:SetOrigin( self:WorldSpaceCenter() )
		ef:SetScale( 1 ) ef:SetMagnitude( 1 ) ef:SetRadius( 1 ) util.Effect( "TeslaHitBoxes", ef )
		ef = EffectData()  ef:SetEntity( self ) ef:SetOrigin( self:WorldSpaceCenter() )
		ef:SetScale( 2 ) ef:SetMagnitude( 2 ) ef:SetRadius( 2 ) util.Effect( "ElectricSpark", ef )
		self:EmitSound( "LoudSpark" ) local dmg = DamageInfo() dmg:SetDamage( 10 ) dmg:SetDamageType( bit.bor( DMG_DISSOLVE, DMG_SHOCK ) )
		dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
		dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 64 ) self:GetPhysicsObject():AddVelocity( VectorRand():GetNormalized()*256 )
		self.xdefm_NextBlast = self.xdefm_NextBlast +1  if self.xdefm_NextBlast >= 20 then
			self:EmitSound( "weapons/cguard/charging.wav" ) self.xdefm_NextShock = CurTime() +1
		end else self.xdefm_NextBlast = 0  self.xdefm_NextShock = CurTime() + math.Rand( 1, 2 )
			local cb = ents.Create( "prop_combine_ball" )
			cb:SetPos( self:WorldSpaceCenter() ) cb:Spawn() cb:Activate() cb:Fire( "Explode" )
			for i=1, 1 do local phy = ents.Create( "env_physexplosion" ) phy:SetPos( self:WorldSpaceCenter() ) phy:SetKeyValue( "SpawnFlags", 1 + 2 )
			phy:SetKeyValue( "magnitude", 100 ) phy:SetKeyValue( "radius", 400 ) phy:Spawn() phy:Activate() phy:Fire( "Explode" ) SafeRemoveEntityDelayed( phy, 0.1 ) end
			local dmg = DamageInfo() dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetDamage( 50 )
			dmg:SetAttacker( self:GetFMod_OW() ) dmg:SetInflictor( self ) dmg:SetDamageType( bit.bor( DMG_DISSOLVE, DMG_SHOCK ) )
			util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 400 ) self:GetPhysicsObject():AddVelocity( Vector( 0, 0, 128 ) )
		end
	end
	function ITEM:OnTouch( self, ent ) if self.xdefm_NextHit > CurTime() then return end self.xdefm_NextHit = CurTime() +0.5
		if ent:IsPlayer() or ent:IsNPC() then self:EmitSound( "Weapon_StunStick.Melee_Hit" )
		local dmg = DamageInfo() dmg:SetDamage( 5 ) dmg:SetDamageType( bit.bor( DMG_DISSOLVE, DMG_SHOCK ) )
		dmg:SetDamagePosition( ent:WorldSpaceCenter() ) dmg:SetDamageForce( ( ent:GetPos() -self:GetPos() ):GetNormalized()*10000 ) dmg:SetAttacker( self:GetFMod_OW() )
		dmg:SetInflictor( self ) ent:TakeDamageInfo( dmg ) local ef = EffectData()  ef:SetEntity( ent ) end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_cturret"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/Combine_turrets/Floor_turret.mdl", TickRate = 0.04
	, Helper = "#xdefm.d"..it, Rarity = 4, Price = 1800, PhysSound = "SolidMetal.ImpactSoft", Carryable = false }
	function ITEM:OnInit( self ) self.xdefm_NextSnd = CurTime() +1  self.xdefm_Detect = CurTime() +1
		self:SetAutomaticFrameAdvance( true ) self:ResetSequence( "idle" ) self:SetPlaybackRate( 1 )
		self.xdefm_Alive = true  self.ShadowParams = {}  self.xdefm_Target = nil
		self.xdefm_Find = 0  self.xdefm_NextFire = 0  self.xdefm_Cool = 0
		self:SetNWFloat( "XDEFM_Pit", 0 )  self:SetNWFloat( "XDEFM_Yaw", 0 )
		self:SetSkin( self.xdefm_Broken and 1 or 0 )
	end
	function ITEM:OnUse( self, ent )
		if self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() then return end
		self:SetAngles( Angle( 0, self:GetAngles().yaw, 0 ) )
	end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnThink( self ) local seq, pit = self:GetSequenceName( self:GetSequence() ), math.abs( self:GetAngles().roll )
		if self.xdefm_Detect <= CurTime() then self.xdefm_Detect = CurTime() +0.2
			if pit > 45 then if self.xdefm_Alive then self.xdefm_Alive = false
					if self.xdefm_NextSnd <= CurTime() then self.xdefm_NextSnd = CurTime() +math.Rand( 4.1, 6 )  self.xdefm_Detect = CurTime()
						self:EmitSound( "NPC_CeilingTurret.Die" )  self.xdefm_Target = nil
					end if seq != "idle" and seq != "retract" then self:ResetSequence( "retract" ) self.xdefm_NextFire = CurTime() +1 end
				end
			elseif !self.xdefm_Alive then self.xdefm_Alive = true
				if self:IsPlayerHolding() then self:EmitSound( "NPC_CeilingTurret.Deploy" )
					self.xdefm_NextSnd = CurTime() +math.Rand( 1, 2 )
				end
			end if self.xdefm_Alive then local att = self:GetAttachment( self:LookupAttachment( "eyes" ) )
				if !att or IsValid( self.xdefm_Target ) then return end for k, v in pairs( ents.FindInCone( att.Pos, att.Ang:Forward(), 1024, 0.707 ) ) do
					if v:Health() <= 0 or v:GetClass() != "xdefm_base" then continue end
					if v:GetClass() == "xdefm_base" and ( !istable( v.xdefm_T2 ) or v.xdefm_T2.Type != "Creature" ) then continue end
					local tr = util.TraceLine( { start = att.Pos, endpos = v:WorldSpaceCenter(), filter = { self, v }, mask = MASK_SHOT } )
					if !tr.Hit or tr.Entity:Health() > 0 then self.xdefm_Target = v
					if self.xdefm_NextSnd <= CurTime() then self:EmitSound( "NPC_CeilingTurret.Active" )
					self.xdefm_NextSnd = CurTime() +3.1 end if seq == "idle" or seq == "retract" then self.xdefm_NextFire = CurTime() +0.25
					self:ResetSequence( "deploy" ) self.xdefm_Find = CurTime() +5 end break end
				end
			end
		end if self.xdefm_Alive then
			if IsValid( self.xdefm_Target ) then local tar = self.xdefm_Target  local att = self:GetAttachment( self:LookupAttachment( "eyes" ) )
				if tar:Health() <= 0 or ( !tar:IsNPC() and tar:GetClass() != "xdefm_base" ) or ( tar:GetClass() == "xdefm_base" and ( !istable( tar.xdefm_T2 ) or tar.xdefm_T2.Type != "Creature" ) )
				or tar:WorldSpaceCenter():Distance( att.Pos ) > 2048 then self.xdefm_Target = nil return end
				local _, aa = WorldToLocal( Vector( 0, 0, 0 ), ( tar:WorldSpaceCenter() -att.Pos ):Angle(), Vector( 0, 0, 0 ), self:GetAngles() )
				if math.sqrt( aa.pitch^2 +aa.yaw^2 ) > 60 then self.xdefm_Target = nil  self.xdefm_Detect = CurTime() end
				local tr = util.TraceLine( { start = att.Pos,  endpos = tar:WorldSpaceCenter(), filter = { self, tar }, mask = MASK_NPCWORLDSTATIC } )
				if tr.Hit then self.xdefm_Target = nil return end self.xdefm_Find = CurTime() +5
				local pit, yaw = self:GetNWFloat( "XDEFM_Pit" ), self:GetNWFloat( "XDEFM_Yaw" )
				local _, aa = WorldToLocal( Vector( 0, 0, 0 ), ( tar:WorldSpaceCenter() -att.Pos ):Angle(), Vector( 0, 0, 0 ), self:LocalToWorldAngles( Angle( pit, yaw, 0 ) ) )
				aa.Pitch = math.Clamp( aa.Pitch, -10, 10 )  aa.Yaw = math.Clamp( aa.Yaw, -10, 10 )
				self:SetNWFloat( "XDEFM_Pit", math.Clamp( pit +aa.pitch, -15, 15 ) )
				self:SetNWFloat( "XDEFM_Yaw", math.Clamp( yaw +aa.yaw, -60, 60 ) )
				self:SetPoseParameter( "aim_pitch", self:GetNWFloat( "XDEFM_Pit" ) )
				self:SetPoseParameter( "aim_yaw", self:GetNWFloat( "XDEFM_Yaw" ) )
				tr = util.TraceLine( { start = att.Pos, endpos = tar:WorldSpaceCenter(), filter = { self }, mask = MASK_SHOT } )
				if self.xdefm_NextFire <= CurTime() and tr.Hit and ( tr.Entity == tar or tr.Entity:Health() > 0 ) and self.xdefm_Cool <= CurTime() then
					local ran = math.random( 1, 2 )  self.xdefm_Cool = CurTime() +0.08
					local at = self:GetAttachment( 1 )
						local bullet = {}
						bullet.Num = 1  bullet.Src = at.Pos
						bullet.Dir = ( ( tar:IsNPC() and tar:HeadTarget( at.Pos ) or tar:WorldSpaceCenter() ) -at.Pos ):GetNormal()
						bullet.Spread = Vector( 0.025, 0.025, 0 )
						bullet.Force = 1
						bullet.Tracer = 1
						bullet.TracerName = "Ar2Tracer"
						bullet.Damage = 3
						bullet.AmmoType = "Ar2"
						bullet.Attacker = ( self:GetFMod_OW():IsPlayer() and self:GetFMod_OW() or self )
						self:FireBullets( bullet )
					self:ResetSequence( "fire" ) self:EmitSound( "Weapon_AR2.NPC_Single" )
				end
			elseif self.xdefm_Find > CurTime() then
				local pit, yaw = self:GetNWFloat( "XDEFM_Pit" ), self:GetNWFloat( "XDEFM_Yaw" )
				local _, aa = WorldToLocal( Vector( 0, 0, 0 ), self:LocalToWorldAngles( Angle( 0, 60*math.sin( CurTime()*2 +self:EntIndex() ), 0 ) ), Vector( 0, 0, 0 ), self:LocalToWorldAngles( Angle( pit, yaw, 0 ) ) )
				aa.Pitch = math.Clamp( aa.Pitch, -5, 5 )  aa.Yaw = math.Clamp( aa.Yaw, -5, 5 )
				self:SetNWFloat( "XDEFM_Pit", math.Clamp( pit +aa.pitch, -15, 15 ) )
				self:SetNWFloat( "XDEFM_Yaw", math.Clamp( yaw +aa.yaw, -60, 60 ) )
				self:SetPoseParameter( "aim_pitch", self:GetNWFloat( "XDEFM_Pit" ) )
				self:SetPoseParameter( "aim_yaw", self:GetNWFloat( "XDEFM_Yaw" ) )
			elseif seq != "retract" and seq != "idle" then self:ResetSequence( "retract" )
				if self.xdefm_NextSnd <= CurTime() then self:EmitSound( "NPC_CeilingTurret.Retire" )
					self.xdefm_NextSnd = CurTime() +2.1
				end self:SetNWFloat( "XDEFM_Pit", 0 ) self:SetPoseParameter( "aim_pitch", 0 )
				self:SetNWFloat( "XDEFM_Yaw", 0 ) self:SetPoseParameter( "aim_yaw", 0 )
			end
		end
	end local Ma1 = Material( "effects/laser_citadel1" )  local Ma2 = Material( "sprites/physg_glow1" )
	function ITEM:OnDraw( self ) self:DrawModel() local act = self:GetSequenceName( self:GetSequence() )
		if !isnumber( self.xdefm_LasP ) then self.xdefm_LasP = 0 else self.xdefm_LasP = Lerp( 0.1, self.xdefm_LasP, self:GetNWFloat( "XDEFM_Pit" ) ) end
		if !isnumber( self.xdefm_LasY ) then self.xdefm_LasY = 0 else self.xdefm_LasY = Lerp( 0.1, self.xdefm_LasY, self:GetNWFloat( "XDEFM_Yaw" ) ) end
		if ( act == "deploy" or act == "fire" or act == "fire2" ) then
			local att = self:GetAttachment( self:LookupAttachment( "light" ) )  if !att then return end
			local tr = util.TraceLine( {
				start = att.Pos, endpos = att.Pos +self:LocalToWorldAngles( Angle( self.xdefm_LasP, self.xdefm_LasY, 0 ) ):Forward()*2000,
				filter = self, mask = MASK_SHOT
			} ) self:SetRenderBoundsWS( tr.StartPos, tr.HitPos ) local col = Color( 0, 155, 155 )
			render.SetMaterial( Ma1 ) render.DrawBeam( tr.StartPos, tr.HitPos, 10, 1, 0, col )
			if tr.Hit then render.SetMaterial( Ma2 ) render.DrawSprite( tr.HitPos, 15, 15, col ) end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_chopper"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_combine/combine_mine01.mdl", TickRate = 0.1
	, Helper = "#xdefm.d"..it, Rarity = 3, Price = 200, PhysSound = "EpicMetal.ImpactSoft", Carryable = false }
	function ITEM:OnInit( self ) self:SetPoseParameter( "blenditates", 65 ) self:SetAutomaticFrameAdvance( true )
		self.xdefm_Killed = false  self.xdefm_Cool = 0  self:SetTrigger( true )
	end
	function ITEM:OnThink( self ) if self.xdefm_Killed or self.xdefm_Cool > CurTime()
		or self:GetPhysicsObject():IsMotionEnabled() then return end local tas = {}
		for k, v in pairs( ents.FindInSphere( self:GetPos(), 512 ) ) do if v == self then continue end
			if ( !v:IsNPC() and !v:IsPlayer() ) or !isstring( v:GetModel() ) or !util.IsValidModel( v:GetModel() ) or v:Health() <= 0 then continue end table.insert( tas, v )
		end if #tas > 0 then local tar = tas[ math.random( #tas ) ]
			local tr = util.TraceLine( { start = self:GetPos(), endpos = tar:WorldSpaceCenter(), filter = { tar, self }, mask = MASK_NPCSOLID } )
			if !tr.Hit then self:EmitSound( "NPC_CombineMine.OpenHooks" ) self:GetPhysicsObject():EnableMotion( true )
				self:SetPoseParameter( "blenditates", 65 ) self.xdefm_Cool = CurTime() +0.2
				local dis = ( tr.HitPos:Distance( self:GetPos() ) ) local leg = ( tar:WorldSpaceCenter() -self:GetPos() )
				self:GetPhysicsObject():SetVelocity( leg +( ( tar:IsPlayer() and tar:GetVelocity() or tar:GetMoveVelocity() )*dis/leg:Length() ) +Vector( 0, 0, 300 ) )
			end
		end
	end
	function ITEM:OnTouch( self, ent ) if self.xdefm_Killed then return end
		if ent:IsPlayer() or ent:IsNPC() then
			xdefm_BroadEffect( "Explosion", { Flags = 0, Origin = self:GetPos(), Scale = 1, Radius = 1, Magnitude = 1 } )
			local dmg = DamageInfo() dmg:SetDamage( 200 ) dmg:SetDamageType( bit.bor( DMG_DISSOLVE ) )
			dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
			dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 128 )
			self:EmitSound( "NPC_CScanner.Die" ) SafeRemoveEntity( self ) self.xdefm_Killed = true
		end
	end
	function ITEM:OnCollide( self, dat, phy ) if self.xdefm_Killed then return end
		if self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() then return end
		local pit = math.abs( dat.HitNormal:Angle().pitch )
		if self.xdefm_Cool <= CurTime() and dat.HitEntity == Entity( 0 ) and pit <= 90 and pit > 0 then
			timer.Simple( 0, function() if !IsValid( self ) then return end
				self:SetPos( dat.HitPos ) self:SetAngles( Angle( 0, self:GetAngles().yaw, 0 ) )
				self:GetPhysicsObject():EnableMotion( false ) self:SetPoseParameter( "blenditates", 0 )
				self:EmitSound( "NPC_CombineMine.CloseHooks" )
			end ) self.xdefm_Cool = CurTime() +1
		end
	end
	function ITEM:OnDraw( self )
		render.SetMaterial( Mat ) local siz = 30 +math.sin( CurTime()*5 )*5
		render.DrawSprite( self:GetPos() +self:EyeAngles():Up()*8, siz, siz, Color( 255, 0, 0, 255 ) )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_chealth"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_combine/health_charger001.mdl", HelperUse = "xdefm.U2"
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 175, PhysSound = "EpicMetal.ImpactSoft", TickRate = 0.1, Carryable = false }
	function ITEM:OnInit( self ) self.xdefm_Cool = CurTime() +1  self:SetAutomaticFrameAdvance( true ) self:ResetSequence( "idle" ) self:SetPlaybackRate( 0 ) end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( self:GetPhysicsObject():GetMass()*0.5 ) end
	function ITEM:OnUse( self, usr ) if self.xdefm_Cool > CurTime() then return false end
		if usr:KeyDown( IN_SPEED ) then return true end local pro = usr.xdefm_Profile  self.xdefm_Cool = CurTime() +1
		if !istable( pro ) or !isnumber( pro.Money ) or pro.Money < 200 or usr:Health() >= usr:GetMaxHealth() then self:EmitSound( "WallHealth.Deny" ) return false end
		self:ResetSequence( "idle" ) self:SetPlaybackRate( 1 ) usr:SetHealth( usr:GetMaxHealth() ) self:EmitSound( "WallHealth.Start" )
		usr.xdefm_Profile.Money = pro.Money -200  xdefm_ProfileUpdate( usr ) return false end
	function ITEM:OnThink( self ) if self.xdefm_Cool > 0 and self.xdefm_Cool <= CurTime() then
		self.xdefm_Cool = 0  self:ResetSequence( "idle" ) self:SetPlaybackRate( 0 )
	end end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_carmor"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_combine/suit_charger001.mdl", HelperUse = "xdefm.U2"
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 150, PhysSound = "EpicMetal.ImpactSoft", TickRate = 0.1, Carryable = false }
	function ITEM:OnInit( self ) self.xdefm_Cool = CurTime() +1  self:SetAutomaticFrameAdvance( true ) self:ResetSequence( "idle" ) self:SetPlaybackRate( 0 ) end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( self:GetPhysicsObject():GetMass()*0.5 ) end
	function ITEM:OnUse( self, usr ) if self.xdefm_Cool > CurTime() then return false end
		if usr:KeyDown( IN_SPEED ) then return true end local pro = usr.xdefm_Profile  self.xdefm_Cool = CurTime() +1
		if !istable( pro ) or !isnumber( pro.Money ) or pro.Money < 100 or usr:Armor() >= usr:GetMaxArmor() then self:EmitSound( "SuitRecharge.Deny" ) return false end
		self:ResetSequence( "idle" ) self:SetPlaybackRate( 1 ) usr:SetArmor( usr:GetMaxArmor() ) self:EmitSound( "SuitRecharge.Start" )
		usr.xdefm_Profile.Money = pro.Money -100  xdefm_ProfileUpdate( usr ) return false end
	function ITEM:OnThink( self ) if self.xdefm_Cool > 0 and self.xdefm_Cool <= CurTime() then
		self.xdefm_Cool = 0  self:ResetSequence( "idle" ) self:SetPlaybackRate( 0 )
	end end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_csuper"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_combine/suit_charger001.mdl", HelperUse = "xdefm.U2"
	, Helper = "#xdefm.d"..it, Rarity = 3, Price = 800, PhysSound = "EpicMetal.ImpactSoft", TickRate = 0.1, Carryable = false }
	function ITEM:OnInit( self ) self.xdefm_Cool = CurTime() +1  self:SetAutomaticFrameAdvance( true ) self:ResetSequence( "idle" ) self:SetPlaybackRate( 0 ) end
	function ITEM:OnUse( self, usr ) if self.xdefm_Cool > CurTime() then return false end
		if usr:KeyDown( IN_SPEED ) then return true end local pro = usr.xdefm_Profile  self.xdefm_Cool = CurTime() +1
		if !istable( pro ) or !isnumber( pro.Money ) or pro.Money < 150 or ( usr:Armor() >= usr:GetMaxArmor() and usr:Health() >= usr:GetMaxHealth() ) then self:EmitSound( "TriggerSuperArmor.DoneCharging" ) return false end
		self:ResetSequence( "idle" ) self:SetPlaybackRate( 1 ) usr:SetArmor( usr:GetMaxArmor()*2 )
		self:EmitSound( "TriggerSuperArmor.StartCharging" ) usr:SetHealth( usr:GetMaxHealth() )
		usr.xdefm_Profile.Money = pro.Money -150  xdefm_ProfileUpdate( usr ) return false end
	function ITEM:OnThink( self ) if self.xdefm_Cool > 0 and self.xdefm_Cool <= CurTime() then
		self.xdefm_Cool = 0  self:ResetSequence( "idle" ) self:SetPlaybackRate( 0 )
	end end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_cscanner"
	local ITEM = { Name = "#xdefm."..it, Type = "Creature", Model = "models/Combine_Scanner.mdl", Carryable = false,
	Helper = "#xdefm.d"..it, Rarity = 4, Price = 1200, TickRate = 0.1, MinSize = 0.8, MaxSize = 1.2 }
	function ITEM:OnInit( self ) self:SetMaxHealth( 200 ) self:SetHealth( self:GetMaxHealth() )
		self:PhysicsInitBox( self:OBBMins()/3, self:OBBMaxs()/3 ) self:SetAutomaticFrameAdvance( true )
		self:SetCollisionGroup( COLLISION_GROUP_NPC ) self:GetPhysicsObject():SetMaterial( "metal" ) self:ResetSequence( "inspect"..math.random( 1, 2 ) ) self:SetPlaybackRate( 1 )
		self.ShadowParams = {}  self.xdefm_Killed = false  self.xdefm_Target = nil  self.xdefm_NextSnd = 0  self.xdefm_NextPic = 0
		self.xdefm_NT = 0  self.xdefm_TPos = nil self:StartMotionController() self.xdefm_NextFind = 0  return true
	end
	function ITEM:OnUse( self ) if self:Health() > 0 then return false end end
	function ITEM:OnReady( self ) self:StartMotionController() self:PhysWake() self:GetPhysicsObject():SetMass( 100 )
		if !self.xdefm_Killed then self:EmitSound( "NPC_CScanner.Alert" ) end self:SetTrigger( true )
	end
	function ITEM:OnThink( self ) if self.xdefm_Killed then return end local seq = self:GetSequenceName( self:GetSequence() )
		if math.random( 1, 40 ) == 1 and self.xdefm_NextSnd <= CurTime() then
			self.xdefm_NextSnd = CurTime() +math.Rand( 2, 4 )  self:EmitSound( "NPC_CScanner.Idle" )
		end if self:GetPlaybackRate() != 1 then self:SetPlaybackRate( 1 ) end
		if ( !IsValid( self.xdefm_Target ) or !self.xdefm_Target:Alive() ) and self.xdefm_NextFind <= CurTime() then local tas, dis, tar = {}, 2048, nil
			for k, v in pairs( ents.FindInSphere( self:GetPos(), 2048 ) ) do if v:IsPlayer() and v:Alive() then table.insert( tas, v ) end end
			if #tas > 0 then
				for k, v in pairs( tas ) do
					local din = v:GetPos():Distance( self:GetPos() )
					if din < dis then
						local tr = util.TraceLine( {
							start = self:GetPos(),
							endpos = v:GetPos(),
							filter = { v, self },
							mask = MASK_NPCSOLID
						} )
						if !tr.Hit then
							tar = v
							dis = din
						end
					end
				end
			end
			self.xdefm_Target = tar
			self.xdefm_NextFind = CurTime() +1
		else local tar = self.xdefm_Target
			if !IsValid( tar ) or ( !tar:IsNPC() and !tar:IsPlayer() ) or tar:Health() <= 0 then self.xdefm_Target = nil end
			local dis = tar:EyePos():Distance( self:GetPos() )  if self.xdefm_NextPic <= CurTime() and dis <= 256 then
				self:SetNWBool( "XDEFM_PT", true ) self.xdefm_NextPic = CurTime() +math.Rand( 5, 10 )  self:EmitSound( "NPC_CScanner.TakePhoto" )
				local lit = ents.Create( "light_dynamic" )  lit:SetPos( self:WorldSpaceCenter() ) lit:SetAngles( self:GetAngles() )
				lit:SetKeyValue( "_light", "255 255 255 255" )
				lit:SetKeyValue( "brightness", "8" ) lit:SetOwner( self ) lit:SetParent( self )
				lit:SetKeyValue( "distance", "128" ) lit:SetKeyValue( "style", "6" )
				lit:Spawn() lit:Activate() self:DeleteOnRemove( lit )
				lit:Fire( "TurnOn" ) SafeRemoveEntityDelayed( lit, 0.2 )
				timer.Simple( 0.2, function() if IsValid( self ) then self:SetNWBool( "XDEFM_PT", false ) end end )
			end
		end
	end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed then return end self:EmitSound( "NPC_CScanner.Pain" )
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) )
		if self:Health() <= 0 then self.xdefm_Killed = true  self:EmitSound( "NPC_CScanner.Die" )
		local ef = EffectData() ef:SetStart( self:WorldSpaceCenter() )
		ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetScale( 1 ) util.Effect( "HelicopterMegaBomb", ef )
		xdefm_LootDrop( {["it_armor"]=1}, self ) for i=1, math.random( 2, 4 ) do xdefm_LootDrop( {["it_cmetal"]=1}, self ) end
		local dmg = DamageInfo() dmg:SetDamage( 100 ) dmg:SetDamageType( DMG_BLAST )
		dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
		dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 128 ) xdefm_BreakEffect( self, 3 ) SafeRemoveEntityDelayed( self, 0.1 ) end
	end
	function ITEM:OnPhysSimulate( self, phy, del ) if self.xdefm_Killed or constraint.FindConstraint( self, "Weld" ) then return end phy:Wake()
		local pos = self:GetPos()  if self.xdefm_NT <= CurTime() then
			if !IsValid( self.xdefm_Target ) and ( !isvector( self.xdefm_TPos ) or pos:Distance( self.xdefm_TPos ) <= 25 or math.random( 1, 5 ) == 1 ) then
				local vel = VectorRand():GetNormalized()*math.Rand( 512, -512 ) vel.z = vel.z/4
				local tr_up = util.QuickTrace( pos, Vector( 0, 0, 256 ), self ) if tr_up.Hit then vel.z = 0 end
				local tr_tu = util.TraceHull( { start = pos, endpos = pos+vel, mask = MASK_NPCSOLID, filter = self,
				mins = self:OBBMins(), maxs = self:OBBMaxs() } )
				if tr_tu.HitPos:Distance( tr_tu.StartPos ) >= 64 then self.xdefm_TPos = tr_tu.HitPos +tr_tu.HitNormal  self.xdefm_NT = CurTime() +math.Rand( 1, 2 ) end
			end
			if IsValid( self.xdefm_Target ) then local dis = self.xdefm_Target:OBBMins():Distance( self.xdefm_Target:OBBMaxs() )
				self.xdefm_TPos = self.xdefm_Target:WorldSpaceCenter()
				+Vector( 0, 0, self.xdefm_Target:OBBMaxs().z/2 ) +Angle( 0, ( self:EntIndex() +CurTime() )*20, 0 ):Forward()*dis
			end
		end
		local aa = self:GetAngles()  if isvector( self.xdefm_TPos ) then
			local tr_fo = util.QuickTrace( pos, ( self.xdefm_TPos - self:GetPos() ):GetNormalized()*50, self )
			if ( tr_fo.Hit or pos:Distance( self.xdefm_TPos ) <= 64 ) and !IsValid( self.xdefm_Target ) then self.xdefm_TPos = nil
				if tr_fo.Hit then self.xdefm_NT = CurTime() +math.Rand( 1, 2 ) else self.xdefm_NT = 0 end
			end
			if isvector( self.xdefm_TPos ) then aa = ( self.xdefm_TPos - self:GetPos() ):Angle()  aa = Angle( aa.pitch, aa.yaw, 0 ) end
		end if IsValid( self.xdefm_Target ) then aa = ( self.xdefm_Target:EyePos() -self:GetPos() ):Angle()  aa = Angle( 0, aa.yaw, 0 ) end
		self.ShadowParams.pos = isvector( self.xdefm_TPos ) and self.xdefm_TPos or self:GetPos()
		self.ShadowParams.angle = aa
		self.ShadowParams.maxangular = 1000
		self.ShadowParams.maxangulardamp = 10000
		self.ShadowParams.maxspeed = 100
		self.ShadowParams.maxspeeddamp = 1000
		self.ShadowParams.dampfactor = 0.8
		self.ShadowParams.teleportdistance = 0
		self.ShadowParams.deltatime = deltatime
		if isvector( self.xdefm_TPos ) then phy:ComputeShadowControl( self.ShadowParams ) end
	end
	function ITEM:OnDraw( self )
		local att = self:GetAttachment( 1 ) if !att then return end
		render.SetMaterial( Mat ) local siz = self:GetNWBool( "XDEFM_PT" ) and 60 or 20
		render.DrawSprite( att.Pos, siz, siz, Color( 255, 255, 255, 255 ) )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_cheli"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/gibs/helicopter_brokenpiece_06_body.mdl", HelperUse = "xdefm.U2",
	Helper = "#xdefm.d"..it, Rarity = 4, Price = 1800, Carryable = false, PhysSound = "MetalVehicle.ImpactSoft", TickRate = 0.01, HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_NextRun = 0  self.xdefm_Killed = false
	self.xdefm_Snd = nil  self:SetMaxHealth( 800 ) self:SetHealth( self:GetMaxHealth() ) end
	function ITEM:OnUse( self, ply ) if self.xdefm_Killed or self.xdefm_NextRun > 0 then return false end
		if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end
		self.xdefm_Snd = CreateSound( self, Sound( "NPC_AttackHelicopter.Rotors" ) )  self.xdefm_Snd:Play() self.xdefm_Snd:ChangePitch( 200, 3 )
		self.xdefm_NextRun = CurTime() +math.Rand( 3, 6 )  return false
	end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( self:GetPhysicsObject():GetMass()*0.05 ) end
	function ITEM:OnThink( self ) if self.xdefm_Killed then return end
		if self.xdefm_NextRun > 0 and self.xdefm_NextRun <= CurTime() then self.xdefm_NextRun = 0
			if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end self:EmitSound( "apc_engine_stop" )
		elseif self.xdefm_NextRun > 0 then
			self:GetPhysicsObject():SetVelocity( Vector( 0, 0, 256 ) )
			self:SetAngles( Angle( 0, self:GetAngles().yaw +30, 0 ) )
		end
	end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:StopSound( "Breakable.Metal" ) self:EmitSound( "Breakable.Metal" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local ef = EffectData() ef:SetStart( self:WorldSpaceCenter() ) ef:SetOrigin( self:WorldSpaceCenter() )
		ef:SetScale( 1 ) util.Effect( "HelicopterMegaBomb", ef ) self:EmitSound( "Explo.ww2bomb" )
		local dmg = DamageInfo() dmg:SetDamage( 300 ) dmg:SetDamageType( bit.bor( DMG_BLAST, DMG_AIRBOAT ) )
		dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
		dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 256 )
		local lt = {["it_cmetal"]=1} for i=1, math.random( 4, 6 ) do xdefm_LootDrop( lt, self ) end
		xdefm_BreakEffect( self, 3 ) self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	function ITEM:OnRemove( self ) if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_cthumper"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_combine/combinethumper002.mdl", HelperUse = "xdefm.U2"
	, Helper = "#xdefm.d"..it, Rarity = 5, Price = 5000, Carryable = false, PhysSound = "EpicMetal.ImpactSoft", TickRate = 0.1 }
	function ITEM:OnInit( self ) self.xdefm_Cool = CurTime() +0.5 self:SetAutomaticFrameAdvance( true ) self:ResetSequence( "idle" ) self:SetPlaybackRate( 1 ) end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 60 ) end
	function ITEM:OnThink( self ) local cyc = self:GetCycle()
		if cyc >= 0.95 and self.xdefm_Cool <= CurTime() then self.xdefm_Cool = CurTime() +0.5
			self:EmitSound( "coast.thumper_hit" ) util.ScreenShake( self:WorldSpaceCenter(), 50, 50, 1, 512 )
			for i=1, 5 do local phy = ents.Create( "env_physexplosion" ) phy:SetPos( self:WorldSpaceCenter() ) phy:SetKeyValue( "SpawnFlags", 1 + 2 + 4 )
			phy:SetKeyValue( "magnitude", 100 ) phy:SetKeyValue( "radius", 512 ) phy:SetOwner( self ) phy:Spawn() phy:Activate() phy:Fire( "Explode" ) SafeRemoveEntityDelayed( phy, 0.1 ) end
			local mot = self:GetPhysicsObject():IsMotionEnabled() self:GetPhysicsObject():EnableMotion( false )
			if mot then timer.Simple( 0, function() if IsValid( self ) then self:GetPhysicsObject():EnableMotion( true ) end end ) end
			for k, v in pairs( ents.FindInSphere( self:WorldSpaceCenter(), 512 ) ) do
				if v:IsNPC() then v:SetVelocity( ( v:GetPos() -self:GetPos() ):GetNormal()*256 +Vector( 0, 0, 256 ) ) v:ClearSchedule() end
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_gballoon"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/balloons/balloon_classicheart.mdl", "models/balloons/balloon_dog.mdl",
	"models/balloons/balloon_star.mdl", "models/maxofs2d/balloon_classic.mdl", "models/maxofs2d/balloon_gman.mdl", "models/maxofs2d/balloon_mossman.mdl" }
	, Helper = "#xdefm.d"..it, Rarity = 1, Price = 100, PhysSound = "Plastic_Barrel.ImpactSoft", TickRate = 1, CantCook = true }
	function ITEM:OnInit( self ) self:PhysicsInit( SOLID_VPHYSICS ) self.xdefm_Killed = false  self.xdefm_Gas = 0  self.xdefm_Yaw = math.random( 0, 360 )
		self.ShadowParams = {}  self:StartMotionController() self.xdefm_Snd = nil
		if self:GetModel() == "models/maxofs2d/balloon_classic.mdl" then self:SetSkin( math.random( 0, 3 ) ) end
		self:SetColor( Color( math.random( 0, 255 ), math.random( 0, 255 ), math.random( 0, 255 ) ) ) return true
	end
	function ITEM:OnUse( self, ent ) if self.xdefm_Killed or self.xdefm_Gas > 0 then return false end
		if ent:KeyDown( IN_SPEED ) then return true end
		self:SetModelScale( 0.01, 1 )  self.xdefm_Gas = CurTime() +1
		self.xdefm_Snd = CreateSound( self, Sound( "ambient/gas/steam2.wav" ) )
		self.xdefm_Snd:Play() self.xdefm_Snd:ChangePitch( 200, 0 ) self.xdefm_Snd:ChangePitch( 255, 1 )
		self.xdefm_Snd:ChangeVolume( 0, 1 ) return false
	end
	function ITEM:OnThink( self ) if self.xdefm_Killed then return end
		local tr = util.TraceLine( {
			start = self:GetPos(),
			endpos = self:GetPos() +Vector( 0, 0, 32 ),
			filter = self,
			mask = MASK_SHOT,
		} )
		if tr.HitSky or ( self.xdefm_Gas > 0 and self.xdefm_Gas <= CurTime() ) then self:TakeDamage( 10 ) end
	end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 1 ) self:GetPhysicsObject():SetMaterial( "paper" ) end
	function ITEM:OnPhysSimulate( self, phy, del ) if self.xdefm_Killed or constraint.FindConstraint( self, "Weld" ) then return end phy:Wake()
		if self:IsPlayerHolding() or !phy:IsMotionEnabled() then return end if self.xdefm_Gas > 0 and self.xdefm_Gas <= CurTime() then self:TakeDamage( 1 ) end
		self.ShadowParams.pos = self:GetPos() +Vector( 0, 0, 1 ) + ( self.xdefm_Gas > 0 and VectorRand():GetNormal()*128 or Vector( 0, 0, 0 ) )
		self.ShadowParams.angle = self.xdefm_Gas > 0 and VectorRand():GetNormal():Angle() or Angle( 0, self.xdefm_Yaw, 0 )
		self.ShadowParams.maxangular = 100
		self.ShadowParams.maxangulardamp = 100
		self.ShadowParams.maxspeed = 100 +( self.xdefm_Gas > 0 and 500 or 0 )
		self.ShadowParams.maxspeeddamp = 100 +( self.xdefm_Gas > 0 and 9900 or 0 )
		self.ShadowParams.dampfactor = 0.8
		self.ShadowParams.teleportdistance = 0
		self.ShadowParams.deltatime = deltatime
		phy:ComputeShadowControl( self.ShadowParams )
	end
	function ITEM:OnDamaged( self, dmg ) if dmg:GetDamage() <= 0 or self.xdefm_Killed then return end self.xdefm_Killed = true
		if dmg:IsDamageType( DMG_BURN ) or dmg:IsDamageType( DMG_SLOWBURN ) or dmg:IsDamageType( DMG_BLAST ) then
			local ef = EffectData() ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetScale( 1 ) util.Effect( "HelicopterMegaBomb", ef )
			local dmg = DamageInfo() dmg:SetDamage( 64 ) dmg:SetDamageType( DMG_BURN )
			dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
			dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 128 )
		end SafeRemoveEntity( self ) local col = self:GetColor()
		local ef = EffectData() ef:SetOrigin( self:GetPos() ) ef:SetStart( Vector( col.r, col.g, col.b ) ) util.Effect( "balloon_pop", ef )
	end
	function ITEM:OnRemove( self ) if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_gballoox"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/maxofs2d/cube_tool.mdl",
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 500, PhysSound = "Cardboard.ImpactHard", CantCook = true }
	function ITEM:OnInit( self ) self.xdefm_Killed = false end
	function ITEM:OnDamaged( self, dmg ) if dmg:GetDamage() <= 0 or self.xdefm_Killed then return end self.xdefm_Killed = true
		for i=1, math.random( 4, 6 ) do xdefm_LootDrop( {["it_gballoon"]=1}, self ) end
		self:EmitSound( "Cardboard.Break" ) SafeRemoveEntity( self )
		local ef = EffectData() ef:SetOrigin( self:GetPos() ) ef:SetStart( Vector( 255, 255, 155 ) ) util.Effect( "balloon_pop", ef )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_gfood"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/food/burger.mdl", "models/food/hotdog.mdl", "models/noesis/donut.mdl" }
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 300, PhysSound = "Bounce.Flesh", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Used = false end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Health() >= ent:GetMaxHealth() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end local met = xdefm_CookMeter( self:GetFMod_DT() )
		if met >= 0 then ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() +math.ceil( math.random( 8, 40 )*( 1 +met ) ) ) ) end
		ent:EmitSound( "NPC_Barnacle.FinalBite" ) self:Remove() self.xdefm_Used = true return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_water"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props_junk/garbage_glassbottle001a.mdl", "models/props_junk/glassjug01.mdl",
	"models/props_junk/garbage_glassbottle003a.mdl", "models/props_junk/GlassBottle01a.mdl", "models/props_junk/garbage_glassbottle002a.mdl" },
	Helper = "#xdefm.d"..it, Rarity = 1, Price = 80, PhysSound = "GlassBottle.ImpactHard", CantCook = true }
	function ITEM:OnDrop( self, ent, typ ) if !typ or self.xdefm_Thrown > 0 then return end
		self:EmitSound( "Zombie.AttackMiss" )
		self:SetAngles( Angle( ent:EyeAngles().pitch, ent:EyeAngles().yaw, 0 ) )
		self:GetPhysicsObject():SetVelocity( ent:EyeAngles():Forward()*1000 )
		self:GetPhysicsObject():AddAngleVelocity( Vector( 0, 10, 0 )*150 ) xdefm_NoTool( self )
		self:SetCollisionGroup( COLLISION_GROUP_NONE ) self.xdefm_Thrown = 1  SafeRemoveEntityDelayed( self, 30 )
	end
	function ITEM:OnInit( self ) self.xdefm_Thrown = 0 self:SetColor( Color( 128, 128, 128 ) ) end
	function ITEM:OnCollide( self, dat )
		if dat.Speed >= 60 and dat.DeltaTime > 0.2 and math.random( 1, 2 ) == 1 then
			self:EmitSound( "ambient/water/drip"..math.random( 1, 4 )..".wav", 75, 100 )
		end
		if self.xdefm_Thrown == 1 then self.xdefm_Thrown = 2
			xdefm_BroadEffect( "watersplash", { Flags = 0, Scale = 15, Origin = dat.HitPos +dat.HitNormal } )
			self:EmitSound( "Glass.Break" ) xdefm_BreakEffect( self, 2 ) SafeRemoveEntityDelayed( self, 0.1 )
			local dmg = DamageInfo() dmg:SetDamage( 10 ) dmg:SetDamageType( DMG_DROWN )
			dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
			dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 80 )
			for k, v in pairs( ents.FindInSphere( self:GetPos(), 80 ) ) do if v:IsWorld() or !isstring( v:GetModel() ) or !util.IsValidModel( v:GetModel() ) then continue end
				v:SetColor( Color( 255, 255, 255 ) ) v:SetMaterial( "" )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_shovel"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/Shovel01a.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 170, PhysSound = "Metal_Box.ImpactSoft" }
	function ITEM:OnUse( self, ply ) return true end
	function ITEM:OnCollide( self, dat )
		if dat.Speed >= 120 and dat.DeltaTime > 0.25 and self:IsPlayerHolding() then local ent = dat.HitEntity
			if IsValid( ent ) and !ent:IsWorld() and util.IsValidModel( ent:GetModel() ) and ent != self:GetFMod_LU() then
				local dmg = DamageInfo()  dmg:SetDamagePosition( dat.HitPos ) dmg:SetDamageForce( dat.HitNormal*1000 )
				dmg:SetDamageType( DMG_CLUB ) dmg:SetAttacker( self:GetFMod_OW() ) dmg:SetInflictor( self )
				dmg:SetDamage( 40 ) ent:TakeDamageInfo( dmg ) self:EmitSound( "MetalVent.ImpactHard" )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_pot"
	local tb = {[8]="it_stone",[30]="it_coal",[100]="it_copperbar",[200]="it_oreblue",[225]="it_leadbar",[300]="it_steelbar",
	[450]="it_orepurple",[850]="it_silverbar",[900]="it_gemblue",[1200]="it_orered",[1400]="it_gempurple",[2400]="it_goldbar",[2500]="it_orewhite",
	[2700]="it_gemgreen",[3600]="it_gemred",[4000]="it_platinumbar",[6000]="it_gemwhite",[10000]="it_rainbowbar",[100000]="it_rainbow",[200000]="it_error",[250000]="it_exp4"}
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_c17/metalPot001a.mdl", Helper = "#xdefm.d"..it,
	Rarity = 5, Price = 3000, PhysSound = "Metal_Box.ImpactSoft", TickRate = 1, CantCook = true, HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Price = 0  self.xdefm_Process = 0  self.xdefm_Cool = 0  self.xdefm_Snd = nil end
	function ITEM:OnUse( self, ent ) if ent:KeyDown( IN_SPEED ) then return true end if self.xdefm_Process > 0 or self.xdefm_Cool > CurTime() then return false end
		self.xdefm_Cool = CurTime() +0.5  if self.xdefm_Price <= 0 then self:EmitSound( "Metal_Barrel.BulletImpact" ) return false end
		self.xdefm_Process = CurTime() +5  self.xdefm_Snd = CreateSound( self, Sound( "ambient/gas/steam_loop1.wav" ) ) self:SetAngles( Angle( 0, self:GetAngles().yaw, 0 ) )
		self.xdefm_Snd:Play() self.xdefm_Snd:ChangePitch( 155, 0 ) self.xdefm_Snd:ChangeVolume( 0.5, 0 ) self:SetNWBool( "XDEFM_EF", true ) return false
	end
	function ITEM:OnThink( self ) if self.xdefm_Process <= 0 then return end
		if self.xdefm_Process <= CurTime() then self.xdefm_Process = 0  if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end
			self:EmitSound( "Metal_Barrel.ImpactSoft" ) self:SetNWBool( "XDEFM_EF", false ) local ite = "_"
			for k, v in SortedPairs( tb ) do if k > self.xdefm_Price then break else ite = v end
			end if ite != "_" then local ent = xdefm_ItemSpawn( ite, self:GetPos() +Vector( 0, 0, 16 ), self:GetAngles(), self:GetFMod_OW() ) end
			self.xdefm_Price = 0
		end
	end
	function ITEM:OnTouch( self, ent, typ ) if typ != 1 or self.xdefm_Process > 0 or self.xdefm_Cool > CurTime() or self.xdefm_Price >= 100000 then return end self.xdefm_Cool = CurTime() +0.5
		if ent:GetClass() == "xdefm_base" and ent:IsPlayerHolding() and xdefm_CookMeter( ent ) == 0 then
			if xdefm_GetClass( ent ) == "it_pot" then return end
			local aa, bb = xdefm_ItemGet( ent ) if !istable( bb ) or bb.Type == "Bait" or ent.xdefm_Trashed then return end local prc = xdefm_GetPrice( ent:GetFMod_DT() )
			self.xdefm_Price = self.xdefm_Price +prc  self:EmitSound( "Metal_Barrel.ImpactSoft" )
			ent.xdefm_Trashed = true  ent:Remove()
		end
	end
	function ITEM:OnRemove( self ) if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end end
	function ITEM:OnDraw( self )
		if !self.Emitter or !IsValid( self.Emitter ) then
			self.Emitter = ParticleEmitter( self:WorldSpaceCenter() )
			self:CallOnRemove( "XDEEmitter", function( self ) if self.Emitter then self.Emitter:Finish() end end )
		elseif self:GetNWBool( "XDEFM_EF" ) then
			if !isnumber( self.xdefm_Ptc ) or self.xdefm_Ptc <= CurTime() then self.xdefm_Ptc = CurTime() +0.05
				local particle = self.Emitter:Add( "particle/smokesprites_000"..math.random( 1, 9 ), self:WorldSpaceCenter() +VectorRand():GetNormal()*5 )
				local vel = VectorRand():GetNormal()*15  local col = HSVToColor( ( CurTime()*100 ), 1, 1 )
				particle:SetVelocity( vel )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( math.Rand( 1, 2 ) )
				particle:SetEndAlpha( 0 )
				local Size = math.Rand( 3, 6 )
				particle:SetStartSize( Size )
				particle:SetEndSize( Size*2 )		
				particle:SetRoll( 6 )
				particle:SetRollDelta( 1 )
				particle:SetAirResistance( 200 )
				particle:SetGravity( Vector( 0, 0, 128 ) )
				particle:SetColor( col.r, col.g, col.b )
				particle:SetStartAlpha( 155 )
				particle:SetCollide( false )
				particle:SetBounce( 0 )
				particle:SetLighting( false )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_rainbowbar"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/xdeedited/ingot_platinum.mdl",
	Helper = "#xdefm.d"..it, Rarity = 5, Price = 10000, PhysSound = "GlassBottle.ImpactHard", TickRate = 0.01 }
	function ITEM:OnThink( self ) self:SetColor( HSVToColor( ( CurTime()*100 ), 1, 1 ) ) end
	function ITEM:OnDraw( self ) render.SetMaterial( Mat ) local siz, col = 30 +math.sin( CurTime()*2 )*2, self:GetColor()
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, col )
        render.DrawSprite( self:WorldSpaceCenter() +self:GetForward()*6, siz, siz, col )
        render.DrawSprite( self:WorldSpaceCenter() -self:GetForward()*6, siz, siz, col )
        if ( !isnumber( self.xdefm_Pa1 ) or self.xdefm_Pa1 <= CurTime() ) then self.xdefm_Pa1 = CurTime() +0.05
			if !self.Emit or !IsValid( self.Emit ) then self.Emit = ParticleEmitter( self:WorldSpaceCenter() )
				self:CallOnRemove( "XDEEmitter", function( self ) if self.Emit then self.Emit:Finish() end end )
			else
				local particle = self.Emit:Add( "particle/particle_glow_03_additive", self:WorldSpaceCenter() +VectorRand():GetNormalized()*math.random( 0, 10 ) )
				particle:SetVelocity( VectorRand():GetNormalized()*25 )
				particle:SetColor( col.r, col.g, col.b )
				particle:SetDieTime( math.Rand( 3, 6 ) )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( 1 )
				particle:SetEndSize( 4 )
				particle:SetCollide( false )
				particle:SetRoll( math.Rand( -360, 360 ) )
				particle:SetRollDelta( math.Rand( -30, 30 ) )
				local pos = particle:GetPos()
				local hei = ( math.random( 1, 2 ) == 1 and 1 or -1 )
				particle:SetThinkFunction( function( particle ) if !IsValid( self ) then return end
					particle:SetGravity( ( self:GetPos() +VectorRand():GetNormalized()*10 -particle:GetPos() ):GetNormalized()*50 )
					particle:SetNextThink( CurTime() +0.1 )
				end ) particle:SetNextThink( CurTime() +0.1 )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_junku"
	local ITEM = { Name = "#xdefm."..it, Type = "Struct", Model = "models/props_junk/TrashBin01a.mdl", Amount = 12, StartSound = "AmmoCrate.Open", ExitSound = "AmmoCrate.Close",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 666, PhysSound = "Plastic_Barrel.ImpactHard", Carryable = false, SType = 1, HelperUse = "xdefm.U3" }
	function ITEM:OnInteract( self, ent, typ )
		if typ == -1 then local yes = false
			for k, v in pairs( self.xdefm_T3 ) do
				if isstring( v ) and v != "_" and xdefm_GetClass( v ) != "it_junk" then
					if !yes then yes = true end
					if xdefm_GetPrice( v ) < 5 then self.xdefm_T3[ k ] = "_" else self.xdefm_T3[ k ] = "it_junk" end
				end
			end
			if yes then self:EmitSound( "Plastic_Barrel.ImpactHard" )
				local ef = EffectData() ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetEntity( self ) ef:SetRadius( 5 )
				ef:SetScale( 5 ) ef:SetMagnitude( 2 ) util.Effect( "ElectricSpark", ef ) 
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_exp1"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_lab/bindergreen.mdl",
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 0, PhysSound = "Cardboard.ImpactSoft", HelperUse = "xdefm.U2" }
	ITEM.Constants = { Amount = 40 }
	function ITEM:OnInit( self ) self.xdefm_Killed = false end
	function ITEM:OnUse( self, ent ) if self.xdefm_Killed then return end
		if ent:KeyDown( IN_SPEED ) then return true end local pro = ent.xdefm_Profile
		if !istable( pro ) or !isnumber( pro.Level ) then self:EmitSound( "Buttons.snd10" ) return false end
		self.xdefm_Killed = true  xdefm_BroadEffect( "xdefm_present", { Origin = self:WorldSpaceCenter() } )
		local exp = self.xdefm_T2.Constants.Amount
		xdefm_AddNote( ent, "xdefm.GetEXP&: "..exp, "buttons/bell1.wav", "medal_gold_1", 5 )
		self:Remove() xdefm_GiveExp( ent, exp ) return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_exp2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_lab/binderblue.mdl",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 0, PhysSound = "Cardboard.ImpactSoft", HelperUse = "xdefm.U2" }
	ITEM.Constants = { Amount = 160 }
	xdefm_ItemBased( "it_exp1", it, ITEM )
end
if true then local it = "it_exp3"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_lab/binderredlabel.mdl",
	Helper = "#xdefm.d"..it, Rarity = 4, Price = 0, PhysSound = "Cardboard.ImpactSoft", HelperUse = "xdefm.U2" }
	ITEM.Constants = { Amount = 400 }
	xdefm_ItemBased( "it_exp1", it, ITEM )
end
if true then local it = "it_exp4"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_lab/bindergraylabel01a.mdl",
	Helper = "#xdefm.d"..it, Rarity = 5, Price = 0, PhysSound = "Cardboard.ImpactSoft", HelperUse = "xdefm.U2" }
	ITEM.Constants = { Amount = 9999 }
	xdefm_ItemBased( "it_exp1", it, ITEM )
end