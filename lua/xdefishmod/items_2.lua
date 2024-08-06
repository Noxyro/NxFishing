if CLIENT then local langs = {}
	langs[ "zh-CN" ] = {
		[ "it_junk" ] = "垃圾", [ "dit_junk" ] = "",
    	[ "it_scrap" ] = "废金属", [ "dit_scrap" ] = "",
        [ "it_rpg" ] = "火箭弹", [ "dit_rpg" ] = "按E发射.",
		[ "cr_seagull" ] = "海鸥", [ "dcr_seagull" ] = "会偷走你的财产.",
		[ "cr_crow" ] = "乌鸦", [ "dcr_crow" ] = "会偷走你的稀有财产,比海鸥更快.",
		[ "cr_seagull2" ] = "黄金海鸥", [ "dcr_seagull2" ] = "感受绝望.",
        [ "it_vault" ] = "保险柜", [ "dit_vault" ] = "可能需要费点功夫才能打开它.",
		[ "it_vending" ] = "贩卖机", [ "dit_vending" ] = "购买苏打水和其他东西.",
		[ "it_soda" ] = "苏打水", [ "dit_soda" ] = "回复一定的血量.",
		[ "it_pottery" ] = "陶片", [ "dit_pottery" ] = "价值不菲...至少在碎掉之前.",
        [ "it_potter1" ] = "小陶罐", [ "dit_potter1" ] = "价值不菲,但是十分易碎.",
        [ "it_potter2" ] = "中陶罐", [ "dit_potter2" ] = "价值高昂,但是十分易碎.",
        [ "it_potter3" ] = "大陶罐", [ "dit_potter3" ] = "价值连城,但是十分易碎.",
		[ "it_coal" ] = "煤炭", [ "dit_coal" ] = "",
        [ "it_copperbar" ] = "铜锭", [ "dit_copperbar" ] = "",
		[ "it_leadbar" ] = "铅锭", [ "dit_leadbar" ] = "",
		[ "it_steelbar" ] = "钢锭", [ "dit_steelbar" ] = "",
		[ "it_silverbar" ] = "银锭", [ "dit_silverbar" ] = "银闪闪!",
		[ "it_goldbar" ] = "金锭", [ "dit_goldbar" ] = "金闪闪!!",
		[ "it_platinumbar" ] = "铂锭", [ "dit_platinumbar" ] = "超闪亮!!!",
		[ "it_oreblue" ] = "蓝水晶", [ "dit_oreblue" ] = "",
		[ "it_orepurple" ] = "紫水晶", [ "dit_orepurple" ] = "",
		[ "it_oregreen" ] = "绿水晶", [ "dit_oregreen" ] = "",
		[ "it_orered" ] = "红水晶", [ "dit_orered" ] = "",
		[ "it_orewhite" ] = "钻石", [ "dit_orewhite" ] = "",
		[ "it_gemblue" ] = "纯蓝水晶", [ "dit_gemblue" ] = "打磨过的纯蓝水晶,价格昂贵.",
		[ "it_gempurple" ] = "纯紫水晶", [ "dit_gempurple" ] = "打磨过的纯紫水晶,价格昂贵.",
		[ "it_gemgreen" ] = "纯绿水晶", [ "dit_gemgreen" ] = "打磨过的纯绿水晶,价格及其昂贵.",
		[ "it_gemred" ] = "纯红水晶", [ "dit_gemred" ] = "打磨过的纯红水晶,价格及其昂贵.",
		[ "it_gemwhite" ] = "纯钻石", [ "dit_gemwhite" ] = "没有钻石剑的,我说不行就是不行.",
		[ "it_crowbar" ] = "撬棍", [ "dit_crowbar" ] = "",
		[ "it_stunstick" ] = "电棍", [ "dit_stunstick" ] = "",
		[ "it_hatchet" ] = "斧头", [ "dit_hatchet" ] = "",
		[ "it_guitar" ] = "吉他", [ "dit_guitar" ] = "是乐器不是武器.",
		[ "it_gnome" ] = "花园矮人", [ "dit_gnome" ] = "坏消息:b用么得.\n好消息:能打烂.\n还是坏消息:能打烂.",
		[ "it_grinder" ] = "绞肉机", [ "dit_grinder" ] = "按E开关,会很痛的.",
		[ "it_defib" ] = "除颤器", [ "dit_defib" ] = "可以复活生物,有极小概率会坏掉.",
		[ "it_bugs" ] = "虫盒", [ "dit_bugs" ] = "微微抖动的盒子,我不建议乱动它.",
		[ "it_rock" ] = "岩石", [ "dit_rock" ] = "巨大的岩石,可敲碎.",
		[ "it_crate1" ] = "板条箱", [ "dit_crate1" ] = "箱子里面似乎装了东西,打碎以开启.",
		[ "it_bait1" ] = "初级鱼饵盒", [ "dit_bait1" ] = "盒子里装了3个普通鱼饵,打碎以开启.",
		[ "it_junkx" ] = "垃圾箱", [ "dit_junkx" ] = "装满了垃圾,谨慎打开.",
		[ "it_monitor" ] = "废电脑", [ "dit_monitor" ] = "来自一个暴躁的游戏老哥的馈赠.",
		[ "it_cosmogram" ] = "部落信标", [ "dit_cosmogram" ] = "会将玩家传送到随机区域. 请勿在充能时传送!",
		[ "it_figurine" ] = "部落塑像", [ "dit_figurine" ] = "瞎几把乱飞.",
		[ "it_torch" ] = "部落火炬", [ "dit_torch" ] = "火炬承载着永不熄灭的火焰.",
		[ "it_bust" ] = "部落半身像", [ "dit_bust" ] = "摸一摸它可以治愈一切损伤.",
		[ "cr_saw" ] = "圆锯", [ "dcr_saw" ] = "别问我,我只是在照搬原版.",
		[ "cr_baby" ] = "愤怒娃娃", [ "dcr_baby" ] = "全能狂怒警告.",
		[ "cr_melon" ] = "活西瓜", [ "dcr_melon" ] = "成精的西瓜.",
	}
	langs[ "en" ] = {
		[ "it_junk" ] = "Junk", [ "dit_junk" ] = "",
        [ "it_scrap" ] = "Metal Scrap", [ "dit_scrap" ] = "",
        [ "it_rpg" ] = "RPG Missile", [ "dit_rpg" ] = "Press E to launch.",
		[ "cr_seagull" ] = "Seagull", [ "dcr_seagull" ] = "Will steal your catches.",
		[ "cr_crow" ] = "Crow", [ "dcr_crow" ] = "Willing to steal your catches, smarter and quicker than seagulls.",
		[ "cr_seagull2" ] = "Golden Seagull", [ "dcr_seagull2" ] = "Feel the doom.",
		[ "it_vault" ] = "Safe", [ "dit_vault" ] = "May be difficult to open it.",
		[ "it_vending" ] = "Vending Machine", [ "dit_vending" ] = "Buy cans of soda and something else.",
		[ "it_soda" ] = "Canned Soda", [ "dit_soda" ] = "Refreshing.",
        [ "it_pottery" ] = "Pottery Shard", [ "dit_pottery" ] = "Expensive ... at least before broken.",
        [ "it_potter1" ] = "Small Pottery", [ "dit_potter1" ] = "Expensive but delicate.",
        [ "it_potter2" ] = "Medium Pottery", [ "dit_potter2" ] = "Quite expensive but delicate.",
        [ "it_potter3" ] = "Large Pottery", [ "dit_potter3" ] = "Extremely expensive but delicate.",
        [ "it_coal" ] = "Coal", [ "dit_coal" ] = "",
        [ "it_copperbar" ] = "Copper Ingot", [ "dit_copperbar" ] = "",
		[ "it_leadbar" ] = "Lead Ingot", [ "dit_leadbar" ] = "",
        [ "it_steelbar" ] = "Steel Ingot", [ "dit_steelbar" ] = "",
		[ "it_silverbar" ] = "Silver Ingot", [ "dit_silverbar" ] = "Shiny!",
		[ "it_goldbar" ] = "Gold Ingot", [ "dit_goldbar" ] = "Extra shiny!!",
		[ "it_platinumbar" ] = "Platinum Ingot", [ "dit_platinumbar" ] = "Super shiny!!!",
		[ "it_oreblue" ] = "Sapphire", [ "dit_oreblue" ] = "",
		[ "it_orepurple" ] = "Amethyst", [ "dit_orepurple" ] = "",
		[ "it_oregreen" ] = "Emerald", [ "dit_oregreen" ] = "",
		[ "it_orered" ] = "Ruby", [ "dit_orered" ] = "",
		[ "it_orewhite" ] = "Diamond", [ "dit_orewhite" ] = "",
		[ "it_gemblue" ] = "Pure Sapphire", [ "dit_gemblue" ] = "Pure polished sapphire, expensive.",
		[ "it_gempurple" ] = "Pure Amethyst", [ "dit_gempurple" ] = "Pure polished amethyst, expensive.",
		[ "it_gemgreen" ] = "Pure Emerald", [ "dit_gemgreen" ] = "A polished emerald, extremely expensive.",
		[ "it_gemred" ] = "Pure Ruby", [ "dit_gemred" ] = "A polished ruby, extremely expensive.",
		[ "it_gemwhite" ] = "Pure Diamond", [ "dit_gemwhite" ] = "Diamond sword not included.",
		[ "it_crowbar" ] = "Crowbar", [ "dit_crowbar" ] = "",
		[ "it_stunstick" ] = "Stunstick", [ "dit_stunstick" ] = "",
		[ "it_hatchet" ] = "Hatchet", [ "dit_hatchet" ] = "",
		[ "it_guitar" ] = "Guitar", [ "dit_guitar" ] = "It's an instrument, not a weapon.",
		[ "it_gnome" ] = "Garden Gnome", [ "dit_gnome" ] = "Bad news:Useless.\nGood news:Breakable.\nStill bad news:Breakable.",
		[ "it_grinder" ] = "Grinder", [ "dit_grinder" ] = "Press E to toggle. Will be painful.",
		[ "it_defib" ] = "Defibrillator", [ "dit_defib" ] = "Can revive creatures. Has a small chance to break.",
		[ "it_bugs" ] = "Bug Box", [ "dit_bugs" ] = "Minorly trembling box, I dont recommend touching it.",
		[ "it_rock" ] = "Rock", [ "dit_rock" ] = "Giant breakable rock.",
		[ "it_crate1" ] = "Crate", [ "dit_crate1" ] = "There seems to be something in the crate. Break to open.",
		[ "it_bait1" ] = "Basic Bait Box", [ "dit_bait1" ] = "Contains 3 random common baits. Break to open.",
		[ "it_junkx" ] = "Dumpster", [ "dit_junkx" ] = "Fulfilled with garbage. Open carefully.",
		[ "it_monitor" ] = "Broken Monitor", [ "dit_monitor" ] = "A gift from an ragequitted gamer.",
		[ "it_cosmogram" ] = "Tribal Cosmogram", [ "dit_cosmogram" ] = "Teleport you to a random location. Do not use when recharging!",
		[ "it_figurine" ] = "Tribal Figurine", [ "dit_figurine" ] = "Enchanted figurine that flies everywhere.",
		[ "it_torch" ] = "Tribal Torch", [ "dit_torch" ] = "The flame on it never go out.",
		[ "it_bust" ] = "Tribal Bust", [ "dit_bust" ] = "Fix all the broken on touch.",
		[ "cr_baby" ] = "Angry Baby", [ "dcr_baby" ] = "He's pissed for no reason.",
		[ "cr_saw" ] = "Sawblade", [ "dcr_saw" ] = "It's a living sawblade.",
		[ "cr_melon" ] = "Living Melon", [ "dcr_melon" ] = "WTF?",
	}
	local ln = GetConVar( "gmod_language" ):GetString()  local lg = "en"
	if ln != nil and istable( langs[ ln ] ) then lg = GetConVar( "gmod_language" ):GetString() end
	for holder, text in pairs( langs[ lg ] ) do language.Add( "xdefm."..holder, text ) end
end local Mat = Material( "sprites/light_glow02_add" ) Mat:SetInt( "$ignorez", 1 ) 

if true then local it = "it_junk"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props_junk/garbage_bag001a.mdl", "models/props_junk/garbage_metalcan001a.mdl", "models/props_junk/garbage_metalcan002a.mdl",
	"models/props_junk/garbage_takeoutcarton001a.mdl", "models/props_junk/garbage_plasticbottle001a.mdl",
	"models/props_junk/garbage_plasticbottle003a.mdl", "models/props_junk/garbage_milkcarton002a.mdl", "models/props_junk/garbage_milkcarton001a.mdl", }
	, Helper = "#xdefm.d"..it, Rarity = 1, Price = 5, KillInWater = true, PhysSound = "Plastic_Barrel.ImpactSoft" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_scrap"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props_c17/oildrumchunk01a.mdl", "models/props_c17/oildrumchunk01b.mdl",
	"models/props_c17/oildrumchunk01c.mdl", "models/props_c17/oildrumchunk01d.mdl", "models/props_c17/oildrumchunk01e.mdl" },
	Helper = "#xdefm.d"..it, Rarity = 1, Price = 20, PhysSound = "Metal_Box.ImpactSoft" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_rpg"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/weapons/w_missile_closed.mdl", CantCook = true,
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 225, PhysSound = "Metal_Box.BulletImpact", TickRate = 0.05, HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_TimerExp = 0  self.xdefm_Killed = false  self.xdefm_ForceExp = 0
        self:SetMaxHealth( 1 ) self:SetHealth( self:GetMaxHealth() )
    end
	function ITEM:OnUse( self, ply ) if self.xdefm_TimerExp <= 0 and ply:KeyDown( IN_SPEED ) then return true end
		if self.xdefm_TimerExp > 0 or self.xdefm_Killed then return false end self.xdefm_TimerExp = CurTime() +0.25  self.xdefm_ForceExp = CurTime() +10
		self:EmitSound( "Weapon_RPG.NPC_Single" ) return false
	end
    function ITEM:OnDamaged( self, dmg ) if self.xdefm_TimerExp > CurTime() or dmg:GetDamage() < 1 then return end
        if self.xdefm_TimerExp <= 0 or self.xdefm_Killed then return end self.xdefm_Killed = true local ef = EffectData()
		ef:SetStart( self:WorldSpaceCenter() ) ef:SetOrigin( self:WorldSpaceCenter() )
		ef:SetScale( 1 ) util.Effect( "HelicopterMegaBomb", ef )
		local dmg = DamageInfo() dmg:SetDamage( 100 ) dmg:SetDamageType( bit.bor( DMG_BLAST, DMG_AIRBOAT ) )
		dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
		dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 128 ) self:EmitSound( "Explo.ww2bomb" ) SafeRemoveEntity( self )
    end
	function ITEM:OnThink( self ) if self.xdefm_TimerExp <= 0 or self.xdefm_Killed then return end
		local lp, la = LocalToWorld( Vector( -15, 0, 0 ), Angle( 180, 0, 0 ), self:GetPos(), self:GetAngles() )
		xdefm_BroadEffect( "Sparks", { Origin = lp, Angles = la, Normal = la:Forward(), Scale = 1, Magnitude = 1, Radius = 2 } )
		self:GetPhysicsObject():SetVelocity( self:GetAngles():Forward()*2000 )
        if self.xdefm_ForceExp > 0 and self.xdefm_ForceExp <= CurTime() then self:TakeDamage( 1 ) end
	end
	function ITEM:OnCollide( self, dat, phy ) if self.xdefm_TimerExp > CurTime() or self.xdefm_Killed then return end
		self:TakeDamage( 10 )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "cr_seagull"
	local ITEM = { Name = "#xdefm."..it, Type = "Creature", Model = "models/seagull.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 250, TickRate = 0.1, MinSize = 0.8, MaxSize = 1.2 }
	ITEM.Constants = { Speed = 512, MoveSnd = "xdefm.SeagullIncoming", HurtSnd = "xdefm.SeagullHurt", TrailColor = Color( 200, 200, 200 ),
	IdleAni = "Idle01", FlyAni = "Fly", DieAni = "Soar", MoveDist = 1024, Health = 10 }
	sound.Add( { name = "xdefm.SeagullIncoming", channel = CHAN_VOICE, volume = 1, level = 75,
	pitch = math.random( 95, 105 ), sound = { "ambient/creatures/seagull_idle1.wav", "ambient/creatures/seagull_idle2.wav", "ambient/creatures/seagull_idle3.wav" } } )
	sound.Add( { name = "xdefm.SeagullHurt", channel = CHAN_VOICE, volume = 1, level = 75,
	pitch = math.random( 115, 125 ), sound = { "ambient/creatures/seagull_pain1.wav", "ambient/creatures/seagull_pain2.wav", "ambient/creatures/seagull_pain3.wav" } } )
	function ITEM:OnInit( self ) self:SetMaxHealth( self.xdefm_T2.Constants.Health ) self:SetHealth( self:GetMaxHealth() )
		self:PhysicsInitBox( self:OBBMins()/3, self:OBBMaxs()/3 ) self:SetAutomaticFrameAdvance( true )
		self:SetCollisionGroup( COLLISION_GROUP_WORLD ) self:SetBloodColor( BLOOD_COLOR_RED )
		self:GetPhysicsObject():SetMaterial( "flesh" ) self:ResetSequence( self.xdefm_T2.Constants.IdleAni ) self:SetPlaybackRate( 1 )
		self.xdefm_NT = 0  self.xdefm_TPos = nil  self.ShadowParams = {}  self.xdefm_TickGone = 0  self.xdefm_NextCatch = 0
		self.xdefm_Killed = false  xdefm_NoTool( self )  self.xdefm_Target, self.xdefm_Catch = nil, nil
		self.xdefm_Trail = util.SpriteTrail( self, 0, self.xdefm_T2.Constants.TrailColor, true, 5, 20, 1, 1/(20+5)*0.5, "trails/smoke" )
		return true
	end
	function ITEM:OnUse( self ) if self:Health() > 0 then return false end end
	function ITEM:OnReady( self ) self:StartMotionController() self:PhysWake() self:GetPhysicsObject():SetMass( 100 )
		if !self.xdefm_Killed then self:EmitSound( self.xdefm_T2.Constants.MoveSnd ) end self:SetTrigger( true )
	end
	function ITEM:OnPlayerDrop( self, own ) self:SetHealth( 0 ) xdefm_NoTool( self, true )
		self:SetColor( Color( 255, 155, 155 ) ) self:ResetSequence( self.xdefm_T2.Constants.DieAni ) self:SetPlaybackRate( 0 ) self.xdefm_Killed = true
		if IsValid( self.xdefm_Trail ) then self.xdefm_Trail:Remove() end self:SetCollisionGroup( COLLISION_GROUP_NPC )
	end
	function ITEM:OnTouch( self, ent, typ ) if typ != 1 or ent:GetClass() != "xdefm_base" or ent != self.xdefm_Target or IsValid( self.xdefmod_Catch ) or !IsValid( self.xdefm_Target ) then return end
		local ite = ent:TurnToDummy()  if IsValid( ite ) then self.xdefm_Catch = ite  ite:SetParent( self )  self.xdefm_Target = nil
			self.xdefm_TPos = nil  self.xdefm_NT = 0
			self:EmitSound( ")weapons/iceaxe/iceaxe_swing1.wav", 75, math.random( 95, 100 ) )
		end
	end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed or !dmg:GetAttacker():IsPlayer() or dmg:GetDamage() <= 0 then return end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) local con = ( GetConVar( "xdefmod_thiefnerf" ):GetInt() < 1 )
		self:StopSound( self.xdefm_T2.Constants.MoveSnd ) self:StopSound( self.xdefm_T2.Constants.HurtSnd ) self:EmitSound( self.xdefm_T2.Constants.HurtSnd )
		if self:Health() <= 0 then self:GetPhysicsObject():EnableGravity( true ) self:SetColor( Color( 255, 155, 155 ) )
			local atk = dmg:GetAttacker()  if atk:IsPlayer() and !atk:IsBot() then
				self:SetFMod_OW( atk ) self:SetFMod_OI( atk:SteamID() )
			end if IsValid( self.xdefm_Catch ) then self.xdefm_Catch:TurnToItem() end
			if IsValid( self.xdefm_Trail ) and con and IsValid( dmg:GetInflictor() ) and dmg:GetInflictor():GetClass() != "xdefm_base" then
				xdefm_GiveExp( dmg:GetAttacker(), 20*( self.xdefm_T2.Rarity ) )
			end
			if IsValid( self.xdefm_Trail ) then SafeRemoveEntity( self.xdefm_Trail ) end
			self:ResetSequence( self.xdefm_T2.Constants.DieAni ) self:SetPlaybackRate( 0 )
			self:SetCollisionGroup( COLLISION_GROUP_NPC ) self.xdefm_TickGone = 0
			xdefm_NoTool( self, true ) self.xdefm_Killed = true  self:PhysWake()
		end
	end
	function ITEM:OnThink( self ) if self.xdefm_Killed then return end
		if !IsValid( self.xdefm_Target ) or self.xdefm_Target:GetClass() != "xdefm_base" then self.xdefm_TickGone = self.xdefm_TickGone +1
			if self.xdefm_TickGone > 600 then SafeRemoveEntity( self.xdefm_Catch ) SafeRemoveEntity( self ) self.xdefm_Killed = true
			self:StopSound( self.xdefm_T2.Constants.HurtSnd )  self:EmitSound( self.xdefm_T2.Constants.MoveSnd ) end
		elseif !IsValid( self.xdefmod_Catch ) and self.xdefm_NextCatch <= CurTime() then self.xdefm_NextCatch = CurTime() +0.5
			local tr = util.TraceLine( {
				start = self:GetPos(),
				endpos = self:GetPos() +( self.xdefm_Target:WorldSpaceCenter() -self:GetPos() ):GetNormal()*8,
				mask = MASK_SHOT,
				filter = self
			} )
			if !IsValid( tr.Entity ) or tr.Entity != self.xdefm_Target then return end
			local ite = self.xdefm_Target:TurnToDummy()  if IsValid( ite ) then self.xdefm_Catch = ite
				self:EmitSound( ")weapons/iceaxe/iceaxe_swing1.wav", 75, math.random( 95, 100 ) )
				ite:SetParent( self )  self.xdefm_Target = nil
				self.xdefm_TPos = nil  self.xdefm_NT = 0
			end
		end
	end
	function ITEM:OnPhysSimulate( self, phy, del ) if self.xdefm_Killed or constraint.FindConstraint( self, "Weld" ) then return end phy:Wake()
		local pos = self:GetPos()  local con = ( GetConVar( "xdefmod_thiefnerf" ):GetInt() < 1 )  if self.xdefm_NT <= CurTime() then
			if !IsValid( self.xdefm_Target ) and ( !isvector( self.xdefm_TPos ) or pos:Distance( self.xdefm_TPos ) <= 25 or math.random( 1, 5 ) == 1 ) then
				local ran = self.xdefm_T2.Constants.MoveDist
				local vel = VectorRand():GetNormalized()*math.Rand( ran/4, ran )  vel.z = math.abs( vel.z/4 )
				local tr_up = util.QuickTrace( pos, Vector( 0, 0, 200 ), self ) if tr_up.Hit then vel.z = 0 end
				local tr_tu = util.TraceHull( { start = pos, endpos = pos+vel, mask = MASK_NPCSOLID, filter = self,
				mins = self:OBBMins(), maxs = self:OBBMaxs() } )
				if tr_tu.HitPos:Distance( tr_tu.StartPos ) >= 50 and !tr_tu.HitSky then self.xdefm_TPos = tr_tu.HitPos +tr_tu.HitNormal  self.xdefm_NT = CurTime() +math.Rand( 1, 2 )
				if phy:IsGravityEnabled() then phy:EnableGravity( false ) self:ResetSequence( self.xdefm_T2.Constants.FlyAni ) self:SetPlaybackRate( 2 ) end end
			end
			if IsValid( self.xdefm_Target ) then
				self.xdefm_TPos = self.xdefm_Target:WorldSpaceCenter()
				if phy:IsGravityEnabled() then phy:EnableGravity( false ) self:ResetSequence( self.xdefm_T2.Constants.FlyAni ) self:SetPlaybackRate( 2 ) end
			end
		end
		local aa = self:GetAngles()  if isvector( self.xdefm_TPos ) then
			local tr_fo = util.QuickTrace( pos, ( self.xdefm_TPos - self:GetPos() ):GetNormalized()*50, self )
			if ( tr_fo.Hit or pos:Distance( self.xdefm_TPos ) <= 50 ) and !IsValid( self.xdefm_Target ) then self.xdefm_TPos = nil
				if tr_fo.Hit then self.xdefm_NT = CurTime() +math.Rand( 1, 2 ) else self.xdefm_NT = 0 end
				if !phy:IsGravityEnabled() then phy:EnableGravity( true ) self:ResetSequence( self.xdefm_T2.Constants.IdleAni ) self:SetPlaybackRate( 1 ) end
			end
			if isvector( self.xdefm_TPos ) then
				aa = ( self.xdefm_TPos -self:GetPos() ):Angle()  aa = Angle( aa.pitch, aa.yaw, 0 )
			end
		end
		self.ShadowParams.pos = isvector( self.xdefm_TPos ) and self.xdefm_TPos or self:GetPos()
		self.ShadowParams.angle = aa
		self.ShadowParams.maxangular = 1000
		self.ShadowParams.maxangulardamp = 10000
		self.ShadowParams.maxspeed = self.xdefm_T2.Constants.Speed*( con and 1 or 0.25 )
		self.ShadowParams.maxspeeddamp = 10000
		self.ShadowParams.dampfactor = 0.8
		self.ShadowParams.teleportdistance = 0
		self.ShadowParams.deltatime = deltatime
		if isvector( self.xdefm_TPos ) then phy:ComputeShadowControl( self.ShadowParams ) end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "cr_crow"
	local ITEM = { Name = "#xdefm."..it, Model = "models/crow.mdl", Price = 800, Rarity = 3, Helper = "#xdefm.d"..it }
	ITEM.Constants = { Speed = 1024, MoveSnd = "xdefm.CrowIncoming", HurtSnd = "xdefm.CrowHurt", TrailColor = Color( 50, 50, 50 ),
	IdleAni = "Idle01", FlyAni = "Fly", DieAni = "Soar", MoveDist = 1024, Health = 25 }
	sound.Add( { name = "xdefm.CrowIncoming", channel = CHAN_VOICE, volume = 1, level = 75,
	pitch = math.random( 95, 105 ), sound = { "npc/crow/alert1.wav", "npc/crow/alert2.wav", "npc/crow/alert3.wav" } } )
	sound.Add( { name = "xdefm.CrowHurt", channel = CHAN_VOICE, volume = 1, level = 75,
	pitch = math.random( 115, 125 ), sound = { "npc/crow/pain1.wav", "npc/crow/pain2.wav" } } )
	xdefm_ItemBased( "cr_seagull", it, ITEM )
end
if true then local it = "cr_seagull2"
	local ITEM = { Name = "#xdefm."..it, Model = "models/seagull.mdl", Price = 5000, Rarity = 5, Helper = "#xdefm.d"..it }
	ITEM.Constants = { Speed = 8192, MoveSnd = "xdefm.SeagullIncoming", HurtSnd = "xdefm.SeagullHurt", TrailColor = Color( 255, 192, 0 ),
	IdleAni = "Idle01", FlyAni = "Fly", DieAni = "Soar", MoveDist = 768, Health = 50 }
	sound.Add( { name = "xdefm.CrowIncoming", channel = CHAN_VOICE, volume = 1, level = 75,
	pitch = math.random( 95, 105 ), sound = { "npc/crow/alert1.wav", "npc/crow/alert2.wav", "npc/crow/alert3.wav" } } )
	sound.Add( { name = "xdefm.CrowHurt", channel = CHAN_VOICE, volume = 1, level = 75,
	pitch = math.random( 115, 125 ), sound = { "npc/crow/pain1.wav", "npc/crow/pain2.wav" } } )
	function ITEM:OnInit( self ) self:SetMaxHealth( self.xdefm_T2.Constants.Health ) self:SetHealth( self:GetMaxHealth() )
		self:PhysicsInitBox( self:OBBMins()/3, self:OBBMaxs()/3 ) self:SetAutomaticFrameAdvance( true )
		self:SetCollisionGroup( COLLISION_GROUP_WORLD ) self:SetBloodColor( BLOOD_COLOR_RED )
		self:GetPhysicsObject():SetMaterial( "flesh" ) self:ResetSequence( self.xdefm_T2.Constants.IdleAni ) self:SetPlaybackRate( 1 )
		self.xdefm_NT = 0  self.xdefm_TPos = nil  self.ShadowParams = {}  self.xdefm_TickGone = 0  self.xdefm_NextCatch = 0
		self.xdefm_Killed = false  xdefm_NoTool( self )  self.xdefm_Target, self.xdefm_Catch = nil, nil
		self.xdefm_Trail = util.SpriteTrail( self, 0, self.xdefm_T2.Constants.TrailColor, true, 5, 20, 1, 1/(20+5)*0.5, "trails/laser" )
		self:SetMaterial( "models/props_collectables/gold_bar" ) return true
	end
	function ITEM:OnDraw( self ) if self:Health() <= 0 then return end
		local cen = ( self:WorldSpaceCenter() +self:GetUp()*4 )
		if !self.Emitter or !IsValid( self.Emitter ) then
			self.Emitter = ParticleEmitter( self:WorldSpaceCenter() )
			self:CallOnRemove( "XDEEmitter", function( self ) if self.Emitter then self.Emitter:Finish() end end )
		elseif self:Health() > 0 then
			if !isnumber( self.xdefm_Ptc ) or self.xdefm_Ptc <= CurTime() then self.xdefm_Ptc = CurTime() +0.01
				local particle = self.Emitter:Add( "particle/smokesprites_000"..math.random( 1, 9 ), cen +VectorRand():GetNormal()*4 )
				local vel = VectorRand():GetNormal()*10
				particle:SetVelocity( vel )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( math.Rand( 1, 1.5 ) )
				particle:SetEndAlpha( 0 )
				local Size = math.Rand( 6, 9 )
				particle:SetStartSize( Size )
				particle:SetEndSize( Size*2 )		
				particle:SetRoll( 6 )
				particle:SetRollDelta( 1 )
				particle:SetAirResistance( 200 )
				particle:SetGravity( Vector( 0, 0, 0 ) )
				particle:SetColor( 255, 192, 0 )
				particle:SetStartAlpha( 64 )
				particle:SetCollide( false )
				particle:SetBounce( 0 )
				particle:SetLighting( false )

				local particle = self.Emitter:Add( "effects/laser_tracer", cen +VectorRand():GetNormal()*4 )
				local vel = VectorRand():GetNormal()*64  vel.z = math.abs( vel.z )
				particle:SetVelocity( vel )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( math.Rand( 1, 1.5 ) )
				particle:SetEndAlpha( 0 )
				local Size = math.Rand( 3, 6 )
				particle:SetStartSize( Size )
				particle:SetEndSize( Size )	
				particle:SetStartLength( Size*2 )
				particle:SetEndLength( 0 )	
				particle:SetRoll( 6 )
				particle:SetRollDelta( 1 )
				particle:SetAirResistance( 16 )
				particle:SetGravity( Vector( 0, 0, -64 ) )
				particle:SetColor( 255, 192, 0 )
				particle:SetStartAlpha( 255 )
				particle:SetCollide( true )
				particle:SetBounce( 1 )
				particle:SetLighting( false )
			end
		end
	end
	xdefm_ItemBased( "cr_seagull", it, ITEM )
end

if true then local it = "it_vault"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_collectables/vault.mdl",
	Helper = "#xdefm.d"..it, Rarity = 5, Price = 7500, PhysSound = "Metal_Box.ImpactHard" }
	function ITEM:OnInit( self ) self:SetMaxHealth( math.random( 300, 3000 ) ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 150 ) end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or self.xdefm_Killed then return end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Breakable.Metal" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local lt = {["it_coin2"]=1,["it_silverbar"]=1,["it_goldbar"]=1,["it_platinumbar"]=1,
		["it_gemblue"]=1,["it_gemgreen"]=1,["it_gempurple"]=1,["it_gemred"]=1,["it_rainbowbar"]=1}
		for i=1, math.random( 4, 6 ) do xdefm_LootDrop( lt, self ) end
		xdefm_BreakEffect( self, 3 ) self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_pottery"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props_c17/pottery02a_break01.mdl", "models/props_c17/pottery02a_break02.mdl",
	"models/props_c17/pottery02a_break03.mdl", "models/props_c17/pottery02a_break04.mdl", "models/props_c17/pottery04a_break01.mdl", "models/props_c17/pottery04a_break02.mdl",
	"models/props_c17/pottery04a_break03.mdl", "models/props_c17/pottery04a_break04.mdl" },
	Helper = "#xdefm.d"..it, Rarity = 1, Price = 50, PhysSound = "Tile.BulletImpact" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_potter1"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props_c17/pottery01a.mdl", "models/props_c17/pottery02a.mdl",
	"models/props_c17/pottery04a.mdl","models/props_c17/pottery03a.mdl", "models/props_c17/pottery04a.mdl", "models/props_c17/pottery05a.mdl" }
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 500, PhysSound = "Tile.BulletImpact" }
    function ITEM:OnInit( self ) self.xdefm_Killed = false end
    function ITEM:OnDamaged( self, dmg )
        if dmg:GetDamage() > 0 and !self.xdefm_Killed then self.xdefm_Killed = true
            local lt = {["it_pottery"]=1} for i=1, 2 do xdefm_LootDrop( lt, self ) end
            self:EmitSound( "Pottery.Break" ) self:Remove()
        end
    end
	function ITEM:OnCollide( self, dat ) if self.xdefm_Killed then return end
		if dat.Speed >= 300 and dat.DeltaTime > 0.2 then self:TakeDamage( 1 ) end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_potter2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props_c17/pottery06a.mdl", "models/props_c17/pottery07a.mdl",
	"models/props_c17/pottery08a.mdl","models/props_c17/pottery09a.mdl" }
	, Helper = "#xdefm.d"..it, Rarity = 3, Price = 1250, PhysSound = "Tile.BulletImpact" }
    function ITEM:OnInit( self ) self.xdefm_Killed = false end
    function ITEM:OnDamaged( self, dmg )
        if dmg:GetDamage() > 0 and !self.xdefm_Killed then self.xdefm_Killed = true
            local lt = {["it_pottery"]=1} for i=1, 4 do xdefm_LootDrop( lt, self ) end
            self:EmitSound( "Pottery.Break" ) self:Remove()
        end
    end
	function ITEM:OnCollide( self, dat ) if self.xdefm_Killed then return end
		if dat.Speed >= 450 and dat.DeltaTime > 0.2 then self:TakeDamage( 1 ) end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_potter3"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_c17/pottery_large01a.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 4, Price = 3000, PhysSound = "Tile.BulletImpact" }
    function ITEM:OnInit( self ) self.xdefm_Killed = false end
    function ITEM:OnDamaged( self, dmg )
        if dmg:GetDamage() > 0 and !self.xdefm_Killed then self.xdefm_Killed = true
            local lt = {["it_pottery"]=1} for i=1, 6 do xdefm_LootDrop( lt, self ) end
            self:EmitSound( "Pottery.Break" ) self:Remove()
        end
    end
	function ITEM:OnCollide( self, dat ) if self.xdefm_Killed then return end
		if dat.Speed >= 600 and dat.DeltaTime > 0.2 then self:TakeDamage( 1 ) end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_coal"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/xdeedited/coal.mdl",
	Helper = "#xdefm.d"..it, Rarity = 1, Price = 30, PhysSound = "Concrete.ImpactHard" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_copperbar"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/xdeedited/ingot_copper.mdl",
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 100, PhysSound = "GlassBottle.ImpactHard" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_leadbar"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/xdeedited/ingot_lead.mdl",
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 225, PhysSound = "GlassBottle.ImpactHard" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_steelbar"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/xdeedited/ingot_steel.mdl",
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 300, PhysSound = "GlassBottle.ImpactHard" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_silverbar"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/xdeedited/ingot_tungsten.mdl",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 1500, PhysSound = "GlassBottle.ImpactHard" }
	function ITEM:OnDraw( self ) render.SetMaterial( Mat ) local siz, col = 32 +math.sin( CurTime()*2 )*2, Color( 255, 255, 255, 255 )
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, col )
        render.DrawSprite( self:WorldSpaceCenter() +self:GetForward()*6, siz, siz, col )
        render.DrawSprite( self:WorldSpaceCenter() -self:GetForward()*6, siz, siz, col )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_goldbar"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/xdeedited/ingot_gold.mdl",
	Helper = "#xdefm.d"..it, Rarity = 4, Price = 2400, PhysSound = "GlassBottle.ImpactHard" }
	function ITEM:OnDraw( self ) render.SetMaterial( Mat ) local siz, col = 32 +math.sin( CurTime()*2 )*2, Color( 255, 255, 55, 255 )
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, col )
        render.DrawSprite( self:WorldSpaceCenter() +self:GetForward()*6, siz, siz, col )
        render.DrawSprite( self:WorldSpaceCenter() -self:GetForward()*6, siz, siz, col )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_platinumbar"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/xdeedited/ingot_platinum.mdl",
	Helper = "#xdefm.d"..it, Rarity = 5, Price = 4000, PhysSound = "GlassBottle.ImpactHard" }
	function ITEM:OnDraw( self ) render.SetMaterial( Mat ) local siz, col = 32 +math.sin( CurTime()*2 )*2, Color( 255, 255, 255, 255 )
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, col )
        render.DrawSprite( self:WorldSpaceCenter() +self:GetForward()*6, siz, siz, col )
        render.DrawSprite( self:WorldSpaceCenter() -self:GetForward()*6, siz, siz, col )
        if ( !isnumber( self.xdefm_Pa1 ) or self.xdefm_Pa1 <= CurTime() ) then self.xdefm_Pa1 = CurTime() +0.05
			if !self.Emit or !IsValid( self.Emit ) then
				self.Emit = ParticleEmitter( self:WorldSpaceCenter(), false )
				self:CallOnRemove( "XDEEmitter", function( self ) if self.Emit then self.Emit:Finish() end end )
			else
				local particle = self.Emit:Add( "sprites/light_glow02_add", self:WorldSpaceCenter() +VectorRand():GetNormalized()*math.random( -6, 6 ) )
				particle:SetVelocity( VectorRand():GetNormalized()*20 )
				particle:SetColor( 255, 255, 255 )
				particle:SetDieTime( math.Rand( 1, 2 ) )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( math.random( 3, 6 ) )
				particle:SetEndSize( 0 )
				particle:SetCollide( false )
				particle:SetRoll( math.Rand( -360, 360 ) )
				particle:SetRollDelta( math.Rand( -30, 30 ) )
				particle:SetThinkFunction( function( particle )
					particle:SetGravity( VectorRand():GetNormalized()*80 )
					particle:SetNextThink( CurTime() +0.1 )
				end ) particle:SetNextThink( CurTime() +0.1 )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_oreblue"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/xdeedited/ore_sapphire.mdl",
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 200, PhysSound = "Concrete.ImpactSoft" }
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnDraw( self )
		render.SetMaterial( Mat ) local siz = 30
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( 0, 0, 255, 255 ) )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_orepurple"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/xdeedited/ore_amethyst.mdl",
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 450, PhysSound = "Concrete.ImpactSoft" }
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnDraw( self )
		render.SetMaterial( Mat ) local siz = 30
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( 255, 0, 255, 255 ) )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_oregreen"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/xdeedited/ore_emerald.mdl",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 900, PhysSound = "Concrete.ImpactSoft" }
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnDraw( self )
		render.SetMaterial( Mat ) local siz = 30
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( 0, 255, 0, 255 ) )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_orered"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/xdeedited/ore_ruby.mdl",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 1200, PhysSound = "Concrete.ImpactSoft" }
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnDraw( self )
		render.SetMaterial( Mat ) local siz = 30
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( 255, 0, 0, 255 ) )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_orewhite"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/xdeedited/ore_diamond.mdl",
	Helper = "#xdefm.d"..it, Rarity = 4, Price = 2500, PhysSound = "Concrete.ImpactSoft" }
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 150 ) end
	function ITEM:OnDraw( self )
		render.SetMaterial( Mat ) local siz = 30
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( 255, 255, 255, 255 ) )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_gemblue"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/oc_diving/sapphire.mdl",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 900, PhysSound = "GlassBottle.ImpactHard" }
	local Mat = Material( "sprites/light_glow02_add" ) Mat:SetInt( "$ignorez", 1 ) 
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 150 ) end
	function ITEM:OnDraw( self )
		render.SetMaterial( Mat ) local siz = 30 +math.sin( CurTime()*5 )*5
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( 0, 0, 255, 255 ) )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_gempurple"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/xdeedited/amethyst.mdl",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 1400, PhysSound = "GlassBottle.ImpactHard" }
	local Mat = Material( "sprites/light_glow02_add" ) Mat:SetInt( "$ignorez", 1 ) 
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 150 ) end
	function ITEM:OnDraw( self )
		render.SetMaterial( Mat ) local siz = 30 +math.sin( CurTime()*5 )*5
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( 255, 0, 255, 255 ) )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_gemgreen"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/oc_diving/emerald.mdl",
	Helper = "#xdefm.d"..it, Rarity = 4, Price = 2700, PhysSound = "GlassBottle.ImpactHard" }
	local Mat = Material( "sprites/light_glow02_add" ) Mat:SetInt( "$ignorez", 1 ) 
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 150 ) end
	function ITEM:OnDraw( self )
		render.SetMaterial( Mat ) local siz = 30 +math.sin( CurTime()*5 )*5
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( 0, 255, 0, 255 ) )
		if !self.Emitter or !IsValid( self.Emitter ) then self.Emitter = ParticleEmitter( self:WorldSpaceCenter() )
			self:CallOnRemove( "XDEEmitter", function( self ) if self.Emitter then self.Emitter:Finish() end end )
		else
			if !isnumber( self.xdefm_Ptc ) or self.xdefm_Ptc <= CurTime() then self.xdefm_Ptc = CurTime() +0.1
				local particle = self.Emitter:Add( "sprites/glow04_noz", self:WorldSpaceCenter() +VectorRand():GetNormalized()*6 )
				local vel = VectorRand():GetNormalized()*10
				particle:SetVelocity( Vector( vel.x, vel.y, 25 ) )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( 1 )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				local Size = math.Rand( 1, 2 )
				particle:SetStartSize( Size )
				particle:SetEndSize( 0 )		
				particle:SetRoll( 3 )
				particle:SetRollDelta( 0 )
				particle:SetAirResistance( 200 )
				particle:SetGravity( Vector( 0, 0, -50 ) )
				particle:SetColor( 0, 255, 0 )
				particle:SetCollide( false )
				particle:SetBounce( 0 )
				particle:SetLighting( false )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_gemred"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/oc_diving/ruby.mdl",
	Helper = "#xdefm.d"..it, Rarity = 4, Price = 3600, PhysSound = "GlassBottle.ImpactHard" }
	local Mat = Material( "sprites/light_glow02_add" ) Mat:SetInt( "$ignorez", 1 )
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 150 ) end
	function ITEM:OnDraw( self )
		render.SetMaterial( Mat ) local siz = 30 +math.sin( CurTime()*5 )*5
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( 255, 0, 0, 255 ) )
		if !self.Emitter or !IsValid( self.Emitter ) then self.Emitter = ParticleEmitter( self:WorldSpaceCenter() )
			self:CallOnRemove( "XDEEmitter", function( self ) if self.Emitter then self.Emitter:Finish() end end )
		else
			if !isnumber( self.xdefm_Ptc ) or self.xdefm_Ptc <= CurTime() then self.xdefm_Ptc = CurTime() +0.1
				local particle = self.Emitter:Add( "sprites/glow04_noz", self:WorldSpaceCenter() +VectorRand():GetNormalized()*6 )
				particle:SetVelocity( VectorRand():GetNormal()*10 )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( 1 )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				local Size = math.Rand( 1, 2 )
				particle:SetStartSize( Size )
				particle:SetEndSize( 0 )		
				particle:SetRoll( 3 )
				particle:SetRollDelta( 0 )
				particle:SetAirResistance( 200 )
				particle:SetGravity( Vector( 0, 0, 0 ) )
				particle:SetColor( 255, 0, 0 )
				particle:SetCollide( false )
				particle:SetBounce( 0 )
				particle:SetLighting( false )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_gemwhite"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/oc_diving/diamond.mdl",
	Helper = "#xdefm.d"..it, Rarity = 5, Price = 6000, TickRate = 0.1, PhysSound = "GlassBottle.ImpactHard" }
	local Mat = Material( "sprites/light_glow02_add" ) Mat:SetInt( "$ignorez", 1 )
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 150 ) end
	function ITEM:OnDraw( self )
		render.SetMaterial( Mat ) local siz = 30 +math.sin( CurTime()*5 )*5
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( 255, 255, 255, 255 ) )
		if !self.Emitter or !IsValid( self.Emitter ) then self.Emitter = ParticleEmitter( self:WorldSpaceCenter() )
			self:CallOnRemove( "XDEEmitter", function( self ) if self.Emitter then self.Emitter:Finish() end end )
		else
			if !isnumber( self.xdefm_Ptc ) or self.xdefm_Ptc <= CurTime() then self.xdefm_Ptc = CurTime() +0.1
				local particle = self.Emitter:Add( "sprites/glow04_noz", self:WorldSpaceCenter() +VectorRand():GetNormalized()*6 )
				particle:SetVelocity( Vector( 0, 0, 0 ) )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( math.Rand( 1, 2 ) )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				local Size = math.Rand( 1, 1.5 )
				particle:SetStartSize( Size )
				particle:SetEndSize( 0 )		
				particle:SetRoll( 3 )
				particle:SetRollDelta( 0 )
				particle:SetAirResistance( 200 )
				particle:SetGravity( Vector( 0, 0, 50 ) )
				particle:SetColor( 255, 255, 255 )
				particle:SetCollide( false )
				particle:SetBounce( 0 )
				particle:SetLighting( false )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_crowbar"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/weapons/w_crowbar.mdl", Helper = "#xdefm.d"..it,
	Rarity = 1, Price = 75, PhysSound = "Weapon_Crowbar.Melee_HitWorld" }
	function ITEM:OnUse( self, ply ) return true end
	function ITEM:OnCollide( self, dat )
		if dat.Speed >= 120 and dat.DeltaTime > 0.25 and self:IsPlayerHolding() then local ent = dat.HitEntity
			if IsValid( ent ) and !ent:IsWorld() and util.IsValidModel( ent:GetModel() ) and ent != self:GetFMod_LU() then
				local dmg = DamageInfo()  dmg:SetDamagePosition( dat.HitPos ) dmg:SetDamageForce( dat.HitNormal*1000 )
				dmg:SetDamageType( DMG_CLUB ) dmg:SetAttacker( self:GetFMod_OW() ) dmg:SetInflictor( self )
				dmg:SetDamage( 25 ) ent:TakeDamageInfo( dmg ) self:EmitSound( "Weapon_Crowbar.Melee_Hit" )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_stunstick"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/weapons/w_stunbaton.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 120, PhysSound = "Weapon_StunStick.Melee_HitWorld" }
	function ITEM:OnUse( self, ply ) return true end
	function ITEM:OnCollide( self, dat )
		if dat.Speed >= 30 and dat.DeltaTime > 0.2 then local ent = dat.HitEntity
			if IsValid( ent ) and !ent:IsWorld() and util.IsValidModel( ent:GetModel() ) and ent != self:GetFMod_LU() then
				local dmg = DamageInfo()  dmg:SetDamagePosition( dat.HitPos ) dmg:SetDamageForce( dat.HitNormal*1000 )
				dmg:SetDamageType( DMG_SHOCK ) dmg:SetAttacker( self:GetFMod_OW() ) dmg:SetInflictor( self )
				dmg:SetDamage( 40 ) ent:TakeDamageInfo( dmg )
			end self:EmitSound( "Weapon_StunStick.Melee_Hit" )
			self:GetPhysicsObject():SetVelocity( -dat.HitNormal:GetNormalized()*math.random( 100, 400 ) +VectorRand():GetNormalized()*50 )
			local ef = EffectData() ef:SetOrigin( dat.HitPos -dat.HitNormal ) ef:SetNormal( -dat.HitNormal )
			ef:SetScale( 1 ) ef:SetMagnitude( 1 ) ef:SetRadius( 1 ) util.Effect( "StunstickImpact", ef )
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_guitar"
	sound.Add( { name = "xdefm.GuitarUse", channel = CHAN_WEAPON, volume = 1, level = 75, pitch = { 75, 125 }, sound = ")weapons/guitar_strum.wav" } )
	sound.Add( { name = "xdefm.GuitarHit", channel = CHAN_WEAPON, volume = 1, level = 75, pitch = { 95, 105 },
	sound = { ")weapons/guitar_impact1.wav", ")weapons/guitar_impact2.wav" } } )
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_phx/misc/fender.mdl", Helper = "#xdefm.d"..it,
	Rarity = 3, Price = 500, PhysSound = "Wood_Box.ImpactSoft", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_NexGuit = 0 end
	function ITEM:OnUse( self, ply ) if ply:KeyDown( IN_SPEED ) then return true end
		if self.xdefm_NexGuit > CurTime() then return false end self.xdefm_NexGuit = CurTime() +1
		self:GetPhysicsObject():SetVelocity( VectorRand():GetNormalized()*30 )
	self:EmitSound( "xdefm.GuitarUse" ) return false end
	function ITEM:OnCollide( self, dat )
		if dat.Speed >= 120 and dat.DeltaTime > 0.25 and self:IsPlayerHolding() then local ent = dat.HitEntity
			if IsValid( ent ) and !ent:IsWorld() and util.IsValidModel( ent:GetModel() ) and ent != self:GetFMod_LU() then
				local dmg = DamageInfo()  dmg:SetDamagePosition( dat.HitPos ) dmg:SetDamageForce( dat.HitNormal*1000 )
				dmg:SetDamageType( DMG_CLUB ) dmg:SetAttacker( self:GetFMod_OW() ) dmg:SetInflictor( self )
				dmg:SetDamage( 20 ) ent:TakeDamageInfo( dmg ) self:EmitSound( "xdefm.GuitarHit" )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_hatchet"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props/cs_militia/axe.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 150, PhysSound = "Weapon_Crowbar.Melee_HitWorld" }
	function ITEM:OnUse( self, ply ) return true end
	function ITEM:OnCollide( self, dat )
		if dat.Speed >= 120 and dat.DeltaTime > 0.25 and self:IsPlayerHolding() then local ent = dat.HitEntity
			if IsValid( ent ) and !ent:IsWorld() and util.IsValidModel( ent:GetModel() ) and ent != self:GetFMod_LU() then
				local dmg = DamageInfo()  dmg:SetDamagePosition( dat.HitPos ) dmg:SetDamageForce( dat.HitNormal*1000 )
				dmg:SetDamageType( DMG_SLASH ) dmg:SetAttacker( self:GetFMod_OW() ) dmg:SetInflictor( self )
				dmg:SetDamage( 50 ) ent:TakeDamageInfo( dmg ) self:EmitSound( "weapons/knife/knife_hit"..math.random( 1, 4 )..".wav" )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_gnome"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/gnome.mdl",
	Helper = "#xdefm.d"..it, Rarity = 1, Price = 50, PhysSound = "Concrete.ImpactSoft" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 100 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		local col = math.Clamp( self:Health()/self:GetMaxHealth(), 0, 1 )*255 self:SetColor( Color( 255, col, col ) )
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Breakable.Concrete" )
		if self:Health() <= 0 then self.xdefm_Killed = true self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) xdefm_BreakEffect( self, 4 )
		if math.random( 1, 10 ) != 1 then return true end
		local ite = xdefm_ItemSpawn( "cr_gnome|"..math.Round( math.Rand( 0.8, 1 ), 1 ), self:GetPos(), self:GetAngles(), self:GetFMod_OW() )
		if IsValid( ite ) then ite:EmitSound( "xdefm.GnomeLaugh" )
		ite:GetPhysicsObject():SetVelocity( VectorRand():GetNormal()*50 +Vector( 0, 0, 250 ) ) ite.xdefm_Jump = CurTime() +2 end
		end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_grinder"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_c17/grinderclamp01a.mdl", Helper = "#xdefm.d"..it,
	Rarity = 3, Price = 600, HelperUse = "xdefm.U2", TickRate = 0.25 }
	function ITEM:OnInit( self ) self.xdefm_Toggle = false  self.xdefm_Cool = 0  self.xdefm_Snd = nil end
	function ITEM:OnUse( self, ply ) if ply:KeyDown( IN_SPEED ) then return true end self:StopSound( "Airboat_engine_stop" )
		if self.xdefm_Cool > CurTime() then return false end self.xdefm_Toggle = !self.xdefm_Toggle
		if !self.xdefm_Toggle then self:EmitSound( "Airboat_engine_stop" )
			if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end
		else self.xdefm_Snd = CreateSound( self, Sound( "Airboat_fan_fullthrottle" ) )  self.xdefm_Snd:Play()
			self.xdefm_Snd:ChangePitch( 40, 0 ) self.xdefm_Snd:ChangePitch( 80, 1 )
		end self.xdefm_Cool = CurTime() +0.5
		return false
	end
	function ITEM:OnTouch( self, ent, typ ) if !IsValid( ent ) or typ != 0 or !util.IsValidModel( ent:GetModel() ) or !self.xdefm_Toggle then return end
		self:StopSound( "NPC_Manhack.Slice" ) self:StopSound( "NPC_Manhack.Grind" )
		if ent:IsNPC() or ent:IsPlayer() then self:EmitSound( "NPC_Manhack.Slice" ) else self:EmitSound( "NPC_Manhack.Grind" ) end
		self:GetPhysicsObject():AddVelocity( ent:GetPos() -self:GetPos() ) local dmg = DamageInfo() dmg:SetDamage( 1 ) dmg:SetDamageType( DMG_SLASH )
		dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( ( ent:GetPos() -self:GetPos() ):GetNormalized()*1000 )
		dmg:SetAttacker( self:GetFMod_OW() ) dmg:SetInflictor( self ) ent:TakeDamageInfo( dmg )
		xdefm_BroadEffect( "Sparks", { Origin = self:LocalToWorld( Vector( 0, 2, 10 ) ), Entity = self, Normal = self:GetAngles():Up(),
		Scale = 1, Magnitude = 1, Radius = 1 } )
	end
	function ITEM:OnThink( self ) if self.xdefm_Toggle then self:GetPhysicsObject():AddVelocity( VectorRand():GetNormalized()*50 ) end end
	function ITEM:OnRemove( self ) if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_bugs"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/garbage_takeoutcarton001a.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 110, PhysSound = "Default.ImpactSoft", TickRate = 0.1 }
	function ITEM:OnInit( self ) self.xdefm_Killing = 0  self.xdefm_Snd = nil end
	function ITEM:OnThink( self )
		if self.xdefm_Killing > 0 and self.xdefm_Killing <= CurTime() then
		self.xdefm_Killing = 0  self:SetNWBool( "XDEFM_Open", false ) if self.xdefm_Snd then self.xdefm_Snd:FadeOut( 2 ) end end
		if math.random( 1, 5 ) == 1 or self.xdefm_Killing > 0 then
		if self.xdefm_Killing > 0 then local dmg = DamageInfo() dmg:SetDamage( 1 ) dmg:SetDamageType( DMG_SLASH )
		dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
		dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 100 ) end
		self:GetPhysicsObject():AddVelocity( VectorRand():GetNormalized()*( self.xdefm_Killing > 0 and 100 or 25 ) ) end
	end
	function ITEM:OnDamaged( self, dmg ) if dmg:GetDamage() <= 0 or self.xdefm_Killing > 0 then return end self:SetNWBool( "XDEFM_Open", true )
		self:EmitSound( "NPC_Antlion.Distracted" )  self.xdefm_Killing = CurTime() +math.random( 4, 8 )
		self.xdefm_Snd = CreateSound( self, Sound( "NPC_Antlion.WingsOpen" ) ) self.xdefm_Snd:Play() self.xdefm_Snd:ChangePitch( 200, 0 ) self.xdefm_Snd:ChangeVolume( 0.5, 0 )
	end
	function ITEM:OnCollide( self, dat, phy )
		if self.xdefm_Killing == 0 and dat.DeltaTime > 0.2 and dat.Speed > 300 then self:TakeDamage( 1 ) end
	end
	function ITEM:OnDraw( self )
		if ( self:GetNWBool( "XDEFM_Open" ) or math.random( 1, 100 ) == 1 ) and ( !isnumber( self.xdefm_Pa1 ) or self.xdefm_Pa1 <= CurTime() ) then self.xdefm_Pa1 = CurTime() +0.01
			if !self.Emit or !IsValid( self.Emit ) then
				self.Emit = ParticleEmitter( self:WorldSpaceCenter(), false )
				self:CallOnRemove( "XDEEmitter", function( self ) if self.Emit then self.Emit:Finish() end end )
			else
				local particle = self.Emit:Add( "effects/fleck_antlion1", self:WorldSpaceCenter() +VectorRand():GetNormalized()*2 )
				particle:SetVelocity( VectorRand():GetNormalized()*math.random( 20, 60 ) )
				particle:SetColor( 255, 255, 155 )
				particle:SetDieTime( math.Rand( 3, 5 ) )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 255 )
				particle:SetStartSize( 1 )
				particle:SetEndSize( 1 )
				particle:SetCollide( true )
				particle:SetColor( 155, 155, 0 )
				particle:SetRoll( math.Rand( -360, 360 ) )
				particle:SetRollDelta( math.Rand( -30, 30 ) )
				particle:SetBounce( 2 ) local pos = particle:GetPos()
				local pos = particle:GetPos()
				local hei = ( math.random( 1, 2 ) == 1 and 1 or -1 )
				particle:SetThinkFunction( function( particle )
					if !IsValid( self ) then particle:SetGravity( VectorRand():GetNormalized()*math.random( 50, 250 ) ) return end
					particle:SetGravity( ( self:GetPos() +VectorRand():GetNormalized()*128 -particle:GetPos() ):GetNormalized()*200 )
					particle:SetNextThink( CurTime() +0.1 )
				end ) particle:SetNextThink( CurTime() +0.1 )
			end
		end
	end
	function ITEM:OnRemove( self ) if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_defib"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/w_models/weapons/w_eq_defibrillator.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 4, Price = 1000, PhysSound = "weapon.ImpactSoft" }
	function ITEM:OnInit( self ) self.xdefm_Cool = 0 end
	function ITEM:OnTouch( self, ent, typ ) if typ == -1 or !self:IsPlayerHolding() or self.xdefm_Cool > CurTime() then return end
		if ent:GetClass() != "xdefm_base" or !isstring( ent:GetFMod_DT() ) then return end self.xdefm_Cool = CurTime() +1
		local aa, bb = xdefm_ItemGet( ent:GetFMod_DT() )  if !istable( bb ) or bb.Type != "Creature" or !ent.xdefm_Killed then return end
		if ent:Health() < ent:GetMaxHealth() then self:EmitSound( "AlyxEMP.Charge" )
			local ef = EffectData() ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetEntity( self ) ef:SetRadius( 5 )
			ef:SetScale( 5 ) ef:SetMagnitude( 2 ) util.Effect( "ElectricSpark", ef ) ent:SetHealth( ent:GetMaxHealth() )  ent.xdefm_Killed = false
			if IsValid( ent:GetPhysicsObject() ) then ent:GetPhysicsObject():EnableGravity( true ) ent:GetPhysicsObject():Wake() end ent:SetColor( Color( 255, 255, 255 ) )
			if math.random( 1, 100 ) == 1 then self:EmitSound( "Breakable.Metal" )
				xdefm_BreakEffect( self, 3 ) self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_vending"
	local ITEM = { Name = "#xdefm."..it, Type = "Struct", Model = "models/props_interiors/VendingMachineSoda01a.mdl", Helper = "#xdefm.d"..it,
	Rarity = 4, Price = 1280, Carryable = false, PhysSound = "Plastic_Box.ImpactHard", HelperUse = "xdefm.U3", SType = 3, StartSound = "Buttons.snd1", ExitSound = "NPC.ButtonLatchUnlocked2" }
	ITEM.Shop = { [ "it_soda" ] = { 150, 5 }, [ "it_water" ] = { 400, 5 }, [ "it_health" ] = { 500, 5 }, [ "it_armor" ] = { 400, 5 } }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_soda"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/PopCan01a.mdl", TickRate = 0.1,
	Helper = "#xdefm.d"..it, Rarity = 1, Price = 30, PhysSound = "Popcan.ImpactHard", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self:SetSkin( math.random( 0, 2 ) ) self.xdefm_Used = false self.xdefm_Snd = nil
		self:SetMaxHealth( 1 ) self:SetHealth( 1 )
	end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Health() >= ent:GetMaxHealth() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() +math.random( 4, 16 ) ) )
		ent:EmitSound( "NPC_Barnacle.Digest" ) self:Remove() self.xdefm_Used = true return false
	end
	function ITEM:OnDamaged( self, dmg ) if dmg:GetDamage() < 1 or self.xdefm_Used then return end self.xdefm_Used = true
		self:SetNWBool( "XDEFM_EF", true ) self.xdefm_Snd = CreateSound( self, Sound( "ambient/gas/cannister_loop.wav" ) ) self:SetHealth( 0 )
		self.xdefm_Snd:Play() self.xdefm_Snd:ChangePitch( 200, 5 ) self.xdefm_Snd:ChangeVolume( 0, 5 ) SafeRemoveEntityDelayed( self, 5 )
	end
	function ITEM:OnThink( self ) if !self:GetNWBool( "XDEFM_EF" ) or !self.xdefm_Used then return end
		self:GetPhysicsObject():AddVelocity( self:GetUp()*-100 +VectorRand():GetNormal()*10 )
	end
	function ITEM:OnStore( self ) return !self.xdefm_Used end
	function ITEM:OnRemove( self ) if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end end
	function ITEM:OnDraw( self ) local ef = self:GetNWBool( "XDEFM_EF" )
		if ef and ( !isnumber( self.xdefm_Pa1 ) or self.xdefm_Pa1 <= CurTime() ) then self.xdefm_Pa1 = CurTime() +0.01
			if !self.Emit or !IsValid( self.Emit ) then
				self.Emit = ParticleEmitter( self:WorldSpaceCenter(), false )
				self:CallOnRemove( "XDEEmitter", function( self ) if self.Emit then self.Emit:Finish() end end )
			else
				local particle = self.Emit:Add( "effects/bubble", self:WorldSpaceCenter() )
				particle:SetVelocity( self:GetUp()*40 +VectorRand():GetNormal()*20 )
				particle:SetColor( 255, 255, 255 )
				particle:SetDieTime( 1 )
				particle:SetStartAlpha( 200 )
				particle:SetEndAlpha( 0 )
				local siz = math.Rand( 1, 3 )
				particle:SetStartSize( siz )
				particle:SetEndSize( siz )
				particle:SetRoll( math.Rand( -360, 360 ) )
				particle:SetRollDelta( math.Rand( -30, 30 ) )
				particle:SetAirResistance( 1 )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_rock"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props_lab/bigrock.mdl", "models/props_mining/caverocks_cluster01.mdl", "models/props_mining/caverocks_cluster02.mdl" }, Helper = "#xdefm.d"..it,
	Rarity = 3, Price = 250, Carryable = false, KillInWater = true, PhysSound = "Concrete.ImpactHard" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 120 ) self:SetHealth( self:GetMaxHealth() ) self:SetCollisionGroup( COLLISION_GROUP_NONE ) self.xdefm_Killed = false end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Breakable.Concrete" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local lt = {["it_stone"]=80,["it_ore"]=60,["it_coal"]=40,["it_copperbar"]=20,["it_leadbar"]=20,["it_steelbar"]=20,["it_oreblue"]=2,["it_oregreen"]=2,["it_orered"]=2,["it_orepurple"]=2}
		for i=1, math.random( 3, 6 ) do xdefm_LootDrop( lt, self ) end
		xdefm_BreakEffect( self, 4 ) self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_crate1"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/wood_crate001a.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 3, Price = 200 }
	function ITEM:OnInit( self ) self:SetMaxHealth( 40 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Wood.Break" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local lt = {["it_health"]=3,["it_steelbar"]=2,["it_copperbar"]=2,["it_grenade"]=2,["it_metal2"]=2,
		["it_wood2"]=2,["it_armor"]=3,["it_present"]=1,["it_refill"]=2,["it_coin"]=2,["it_plastic"]=2}
		for i=1, math.random( 4, 8 ) do xdefm_LootDrop( lt, self ) end
		xdefm_BreakEffect( self, 1 ) self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_bait1"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/cardboard_box003a.mdl", Helper = "#xdefm.d"..it,
	Rarity = 1, Price = 200, PhysSound = "Cardboard.ImpactHard" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 40 ) self:SetHealth( self:GetMaxHealth() ) self:SetCollisionGroup( COLLISION_GROUP_NONE ) self.xdefm_Killed = false end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Cardboard.Break" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local lt = {["ba_money"]=5,["ba_seed"]=5,["ba_wrench"]=5,["ba_pan"]=5,["ba_hook"]=5,["ba_skull"]=2,["ba_bread"]=2}
		for i=1, 3 do xdefm_LootDrop( lt, self ) end self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "cr_baby"
	local ITEM = { Name = "#xdefm."..it, Type = "Creature", Model = "models/props_c17/doll01.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 230, TickRate = 0.1, MinSize = 0.8, MaxSize = 1.4 }
	function ITEM:OnReady( self ) self:StartMotionController() self:SetTrigger( true ) self:GetPhysicsObject():SetMass( 50 ) end
	function ITEM:OnInit( self ) self:SetMaxHealth( 10 ) self:SetHealth( self:GetMaxHealth() ) self.ShadowParams = {}
		self:SetAutomaticFrameAdvance( true ) self:SetBloodColor( BLOOD_COLOR_RED ) self.ShadowParams = {}  self.xdefm_Atk = 0
		self.xdefm_Killed = false  self.xdefm_AtkD = 0  self.xdefm_AtkT = nil
		self:SetCollisionGroup( COLLISION_GROUP_NPC )
	end
	function ITEM:OnThink( self ) if self.xdefm_Killed then return end
		if self.xdefm_AtkD <= CurTime() and !IsValid( self.xdefm_AtkT ) then self.xdefm_AtkD = CurTime() +1  local tas = {}
			for k, v in pairs( ents.FindInSphere( self:GetPos(), 1000 ) ) do if v == self then continue end
				if ( !v:IsNPC() and !v:IsPlayer() and v:GetClass() != "xdefm_base" )
				or !isstring( v:GetModel() ) or !util.IsValidModel( v:GetModel() ) or v:Health() <= 0 then continue end table.insert( tas, v )
			end if #tas > 0 then local tar = tas[ math.random( #tas ) ]
				local tr = util.TraceLine( { start = self:GetPos(), endpos = tar:WorldSpaceCenter(), filter = { tar, self }, mask = MASK_NPCSOLID } )
				if !tr.Hit then self:EmitSound( "Doll.Squeak" ) self.xdefm_AtkT = tar end
			end
		end
		if IsValid( self.xdefm_AtkT ) then local tar = self.xdefm_AtkT
			if tar:Health() <= 0 then self.xdefm_AtkT = nil  self.xdefm_NT = 0 else
			local tr = util.TraceLine( { start = self:GetPos(), endpos = tar:GetPos(), filter = { tar, self }, mask = MASK_NPCSOLID } )
			if tr.Hit then self.xdefm_AtkT = nil  self.xdefm_NT = 0 end end
		end
	end
	function ITEM:OnTouch( self, ent, typ ) if typ == -1 or self.xdefm_Killed or self.xdefm_Atk > CurTime() then return end self.xdefm_Atk = CurTime() +0.5
		if ent:Health() <= 0 or ( !ent:IsPlayer() and !ent:IsNPC() and ent:GetClass() != "xdefm_base" ) then return end ent:EmitSound( "Flesh.ImpactHard" )
		local vel = ( self:WorldSpaceCenter() - ent:WorldSpaceCenter() ):GetNormalized()
		local dmg = DamageInfo() dmg:SetDamage( math.random( 1, 3 ) ) dmg:SetAttacker( self:GetFMod_OW() )
		dmg:SetInflictor( self ) dmg:SetDamageType( DMG_CLUB ) dmg:SetDamagePosition( ent:WorldSpaceCenter() )
		dmg:SetDamageForce( vel*10000 ) ent:TakeDamageInfo( dmg ) self:EmitSound( "Doll.Squeak" )
		self:GetPhysicsObject():SetVelocity( vel*100 )  ent:SetVelocity( vel*-300 )
		if IsValid( ent:GetPhysicsObject() ) then ent:GetPhysicsObject():SetVelocity( vel*-300 ) end
	end
	function ITEM:OnPlayerDrop( self, own ) self:SetHealth( 0 ) self:SetColor( Color( 255, 155, 155 ) )
	self.xdefm_Killed = true end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed then return end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) )
		if self:Health() <= 0 then self:SetColor( Color( 255, 155, 155 ) )
		self:EmitSound( "ambient/creatures/town_child_scream1.wav", 75, math.random( 150, 160 ) ) self.xdefm_Killed = true end
	end
	function ITEM:OnPhysSimulate( self, phy, del ) if self.xdefm_Killed then return end
		if self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() then return end phy:Wake()
		local tr = util.TraceLine( { start = self:GetPos(), endpos = self:GetPos() -Vector( 0, 0, 8 ), filter = { self }, mask = MASK_NPCSOLID } )
		if !tr.Hit then return end local vel = VectorRand():GetNormal()*16
		if IsValid( self.xdefm_AtkT ) then vel = ( self.xdefm_AtkT:WorldSpaceCenter() -self:GetPos() ):GetNormalized()*16 end
		self.ShadowParams.pos = self:GetPos() +Vector( 0, 0, math.random( 8, 24 ) ) +vel
		self.ShadowParams.angle = Angle( 0, self:GetAngles().yaw +CurTime() +self:EntIndex(), 0 )
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
if true then local it = "cr_saw"
	local ITEM = { Name = "#xdefm."..it, Type = "Creature", Model = "models/props_junk/sawblade001a.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 200, TickRate = 0.1, MinSize = 0.6, MaxSize = 1.4 }
	function ITEM:OnInit( self ) self:SetMaxHealth( 75 ) self:SetHealth( self:GetMaxHealth() ) self:SetCollisionGroup( COLLISION_GROUP_NPC )
		self.xdefm_NT = CurTime() +0.5  self.xdefm_TPos = nil  self.ShadowParams = {}  self.xdefm_Killed = false  self.xdefm_NextAtk = 0
	end
	function ITEM:OnReady( self ) self:StartMotionController() self:GetPhysicsObject():SetMass( 100 ) self:SetTrigger( true ) self:UseTriggerBounds( true, 8 ) end
	function ITEM:OnPlayerDrop( self, own ) self:SetHealth( 0 ) self:SetColor( Color( 255, 155, 155 ) ) self.xdefm_Killed = true end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed then return end self:EmitSound( "NPC_Manhack.Bat" )
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) )
		if self:Health() <= 0 then self:SetColor( Color( 255, 155, 155 ) ) self.xdefm_Killed = true  self:EmitSound( "NPC_Manhack.Die" )
		self:GetPhysicsObject():EnableGravity( true ) end
	end
	function ITEM:OnTouch( self, ent, typ ) if self.xdefm_NextAtk > CurTime() or typ == -1 or self.xdefm_Killed then return end self.xdefm_NextAtk = CurTime() +0.1
		if self:IsPlayerHolding() or !self:GetPhysicsObject():IsMotionEnabled() then return end
		if ( ent:IsPlayer() or ent:IsNPC() ) then self:EmitSound( "NPC_Manhack.Slice" ) else self:EmitSound( "NPC_Manhack.Grind" ) end
		local dmg = DamageInfo() dmg:SetDamage( 1 ) dmg:SetAttacker( self:GetFMod_OW() ) local vel = ( ent:WorldSpaceCenter() -self:WorldSpaceCenter() ):GetNormalized()
		dmg:SetInflictor( self ) dmg:SetDamageType( DMG_SLASH ) dmg:SetDamagePosition( ent:WorldSpaceCenter() )
		dmg:SetDamageForce( vel*10000 ) ent:TakeDamageInfo( dmg )
		if ( ent:IsPlayer() or ent:IsNPC() ) then self:GetPhysicsObject():SetVelocity( vel*400 )  ent:SetVelocity( vel*-600 )
			if IsValid( ent:GetPhysicsObject() ) then ent:GetPhysicsObject():SetVelocity( vel*-600 ) else self:GetPhysicsObject():SetVelocity( vel*600 ) end
		end xdefm_BroadEffect( "ElectricSpark", { Origin = self:WorldSpaceCenter(), Magnitude = 2, Scale = 1, Radius = 3 } )
	end
	function ITEM:OnPhysSimulate( self, phy, del ) if self:Health() <= 0 or self.xdefm_Killed or self.xdefm_NextAtk > CurTime() then return end phy:Wake()  local con = self.xdefm_T2.Constants
		if !self:IsPlayerHolding() and !constraint.FindConstraint( self, "Weld" ) and self:GetPhysicsObject():IsMotionEnabled() then
			if phy:IsGravityEnabled() then phy:EnableGravity( false ) self.xdefm_NT = CurTime() +0.1 end
			local pos = self:GetPos()
			local tr_up = util.QuickTrace( pos, Vector( 0, 0, self:OBBMaxs().z*5 ), self )
			local tr_do = util.QuickTrace( pos, Vector( 0, 0, self:OBBMins().z*5 ), self )
			if self.xdefm_NT <= CurTime() then
				if !isvector( self.xdefm_TPos ) or pos:Distance( self.xdefm_TPos ) <= 5 or math.random( 1, 5 ) == 1 then
					local vel = VectorRand():GetNormalized()*math.Rand( 250, 1000 )  vel.z = vel.z/5
					if tr_up.Hit then vel.z = math.min( -10, vel.z ) end
					if tr_do.Hit then vel.z = math.max( 10, vel.z ) end
					local tr_tu = util.TraceHull( { start = pos, endpos = pos+vel, mask = MASK_NPCSOLID, filter = self,
					mins = self:OBBMins(), maxs = self:OBBMaxs() } )
					if tr_tu.HitPos:Distance( tr_tu.StartPos ) >= 10 then self.xdefm_TPos = tr_tu.HitPos +tr_tu.HitNormal  self.xdefm_NT = CurTime() + math.Rand( 1, 3 )
					if self:GetMaxHealth() > self:Health() then self:SetHealth( math.min( self:GetMaxHealth(), self:Health() +1 ) ) end end
				end
			end
			if isvector( self.xdefm_TPos ) then local tt = self.xdefm_TPos
				if tr_up.Hit then self.xdefm_TPos = Vector( self:GetPos().x, self:GetPos().y, self:GetPos().z -25 ) end
				if tr_do.Hit then self.xdefm_TPos = Vector( self:GetPos().x, self:GetPos().y, self:GetPos().z +25 ) end
				local tr_fo = util.QuickTrace( pos, ( self.xdefm_TPos - self:GetPos() ):GetNormalized()*5, self )  self.xdefm_NT = CurTime() + math.Rand( 1, 2 )
				if tr_fo.Hit or pos:Distance( self.xdefm_TPos ) <= 5 then self.xdefm_TPos = nil  self.xdefm_NT = 0 end
			end
			self.ShadowParams.pos = ( isvector( self.xdefm_TPos ) and self.xdefm_TPos or self:GetPos() ) +Vector( 0, 0, 10*math.sin( CurTime()*10 ) )
			self.ShadowParams.angle = self:GetAngles() +Angle( 0, CurTime()*100 +self:EntIndex()*10, 0 )
			self.ShadowParams.maxangular = 1000
			self.ShadowParams.maxangulardamp = 10000
			self.ShadowParams.maxspeed = 100
			self.ShadowParams.maxspeeddamp = 1000
			self.ShadowParams.dampfactor = 0.8
			self.ShadowParams.teleportdistance = 0
			self.ShadowParams.deltatime = deltatime
			phy:ComputeShadowControl( self.ShadowParams )
		else phy:EnableGravity( true )
			if self.xdefm_NT < CurTime() then self.xdefm_NT = CurTime() +math.Rand( 0.5, 1 )
				phy:AddVelocity( VectorRand():GetNormalized()*math.Rand( 250, 1000 ) )
				self.xdefm_TPos = nil
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_cosmogram"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_combine/breenglobe.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 4, Price = 1500, PhysSound = "Default.ImpactSoft" }
	local Mat = Material( "effects/blueflare1" )
	local s1 = { "ambient/machines/teleport4.wav", "ambient/machines/teleport3.wav", "ambient/machines/teleport1.wav" }
	function ITEM:OnInit( self ) self:SetNWFloat( "XDEFM_Cha", 0 )  self.xdefm_DelayUse = 0 end
	function ITEM:OnStore( self ) return self:GetNWFloat( "XDEFM_Cha" ) <= CurTime() end
	function ITEM:OnUse( self, ent ) if !ent:IsPlayer() or ent:InVehicle() or !ent:Alive() or self.xdefm_DelayUse > CurTime() then return end self.xdefm_DelayUse = CurTime() +1
		if ent:KeyDown( IN_SPEED ) then return true end
		ent:EmitSound( self:GetNWFloat( "XDEFM_Cha" ) > CurTime() and "ambient/levels/labs/electric_explosion"..math.random( 1, 5 )..".wav" or s1[ math.random( #s1 ) ], 75, math.random( 95, 105 ) )
		local ran = VectorRand():GetNormalized()*math.random( 2000, 20000 )  local cha = ( self:GetNWFloat( "XDEFM_Cha" ) <= CurTime() )  local tot = 0
		if cha then repeat ran = VectorRand():GetNormalized()*math.random( 2000, 20000 )  tot = tot +1 until util.IsInWorld( ran ) or tot <= 1024 end
		local tr = util.TraceHull( { start = ran, endpos = ran +Vector( 0, 0, -100000 ), filter = ent,
		mins = ent:OBBMins(), maxs = ent:OBBMaxs() } ).HitPos
		ent:ScreenFade( SCREENFADE.IN, cha and Color( 255, 255, 255 ) or Color( 255, 155, 155 ), 2, 0 )
		ent:SetPos( tr )  if !util.IsInWorld( tr ) then ent:Kill() end
		self:SetNWFloat( "XDEFM_Cha", CurTime() +11 ) return false
	end
	function ITEM:OnTouch( self, ent, typ ) if typ != 1 or ent:GetClass() != "xdefm_base" or self.xdefm_DelayUse > CurTime() then return end self.xdefm_DelayUse = CurTime() +1
		self:EmitSound( self:GetNWFloat( "XDEFM_Cha" ) > CurTime() and "ambient/levels/labs/electric_explosion"..math.random( 1, 5 )..".wav" or s1[ math.random( #s1 ) ], 75, math.random( 95, 105 ) )
		local cls = xdefm_GetClass( ent )
		local ran = VectorRand():GetNormalized()*math.random( 1000, 10000 )  local cha = ( self:GetNWFloat( "XDEFM_Cha" ) <= CurTime() )  local tot = 0
		if cha then repeat ran = VectorRand():GetNormalized()*math.random( 1000, 10000 )  tot = tot +1 until util.IsInWorld( ran ) or tot <= 1024 end
		local tr = util.TraceHull( { start = ran, endpos = ran +Vector( 0, 0, -100000 ), filter = ent,
		mins = ent:OBBMins(), maxs = ent:OBBMaxs() } ).HitPos
		if util.IsInWorld( tr ) then
			if cls == "it_bread2" and math.random( 1, 3 ) == 1 then
				ent:Remove() xdefm_ItemSpawn( "cr_bread|"..math.Round( math.Rand( 1, 2 ), 1 ), tr, VectorRand():Angle(), ent:GetFMod_OW() )
			else ent:SetPos( tr ) end
		else ent:Remove() end self:SetNWFloat( "XDEFM_Cha", CurTime() +11 )
	end
	function ITEM:OnDraw( self ) local cha = ( self:GetNWFloat( "XDEFM_Cha" ) <= CurTime() )
		render.SetMaterial( Mat ) local siz = 40 +math.sin( CurTime()*10 )*5
		render.DrawSprite( self:WorldSpaceCenter() +self:GetUp()*3, siz, siz, cha and Color( 255, 255, 155, 255 ) or Color( 255, 0, 0, 255 ) )
		if cha and ( !isnumber( self.xdefm_Pa1 ) or self.xdefm_Pa1 <= CurTime() ) then self.xdefm_Pa1 = CurTime() +0.1
			if !self.Emit or !IsValid( self.Emit ) then
				self.Emit = ParticleEmitter( self:WorldSpaceCenter(), false )
				self:CallOnRemove( "XDEEmitter", function( self ) if self.Emit then self.Emit:Finish() end end )
			else
				local particle = self.Emit:Add( "effects/yellowflare", self:WorldSpaceCenter() +VectorRand():GetNormalized()*10 )
				particle:SetVelocity( VectorRand():GetNormalized()*math.random( 15, 45 ) )
				particle:SetColor( 255, 255, 155 )
				particle:SetDieTime( 2 )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( math.Rand( 2, 4 ) )
				particle:SetEndSize( 0 )
				particle:SetCollide( true )
				particle:SetRoll( math.Rand( -360, 360 ) )
				particle:SetRollDelta( math.Rand( -30, 30 ) )
				particle:SetBounce( 1 ) local pos = particle:GetPos()
				particle:SetThinkFunction( function( particle )
					particle:SetGravity( ( pos - particle:GetPos() ):GetNormalized()*100 )
					particle:SetNextThink( CurTime() +0.1 )
				end ) particle:SetNextThink( CurTime() +0.1 )
			end
		end
		if !isnumber( self.xdefm_Pa2 ) or self.xdefm_Pa2 <= CurTime() then self.xdefm_Pa2 = CurTime() +( cha and 0.5 or 0.25 )
			if !self.xdefm_Emi2 or !IsValid( self.xdefm_Emi2 ) then
				self.xdefm_Emi2 = ParticleEmitter( self:WorldSpaceCenter(), true )
				self:CallOnRemove( "XDEEmitter2", function( self ) if self.Emi2 then self.Emi2:Finish() end end )
			else
				local particle = self.xdefm_Emi2:Add( "particle/particle_ring_wave_addnofog", self:GetPos() )
				particle:SetAngles( Angle( 90, 0, 0 ) )
				if cha then particle:SetColor( 255, 255, 155 ) else particle:SetColor( 255, 0, 0 ) end
				particle:SetDieTime( 1 )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( 5 )
				particle:SetEndSize( 20 )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_figurine"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/dav0r/hoverball.mdl", TickRate = 0.5
	, Helper = "#xdefm.d"..it, Rarity = 3, Price = 500, PhysSound = "AI_BaseNPC.BodyDrop_Light" }
	local Mat = Material( "sprites/light_glow02_add" ) Mat:SetInt( "$ignorez", 1 )
	local ma = {
		"models/humans/male/group01/joe_facemap",
		"models/humans/male/group01/van_facemap",
		"models/humans/male/group01/vance_facemap",
		"models/humans/male/group01/ted_facemap",
		"models/humans/male/group01/sandro_facemap",
		"models/humans/male/group01/mike_facemap",
		"models/humans/male/group01/eric_facemap",
		"models/humans/male/group01/erdim_facemap",
		"models/humans/male/group01/art_facemap",
		"models/police/barneyface",
		"models/monk/grigori_head",
		"models/kleiner/walter_face",
		"models/gman/gman_face_map3",
		"models/eli/eli_tex4z",	
		"models/humans/male/group01/art_facemap", 
		"models/odessa/odessa_face",
		"models/humans/female/group01/chau_facemap",
		"models/humans/female/group01/joey_facemap",
		"models/humans/female/group01/kim_facemap", 
		"models/humans/female/group01/lakeetra_facemap", 
		"models/alyx/alyx_faceandhair",
	}
	local so = {
		"vo/npc/female01/hi01.wav",
		"vo/npc/female01/hi02.wav",
		"vo/npc/male01/hi01.wav",
		"vo/npc/male01/hi02.wav"
	}
	function ITEM:OnInit( self ) self:SetModelScale( math.Rand( 1, 3 ), 0.01 ) self.ShadowParams = {}
		self.xdefm_Mat = ma[ math.random( #ma ) ]  self:SetMaterial( self.xdefm_Mat )
	end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 10*self:GetModelScale() )  self:GetPhysicsObject():EnableGravity( false )
	self:StartMotionController() end
	function ITEM:OnThink( self ) if self:IsPlayerHolding() or !self:GetPhysicsObject():IsMotionEnabled() then return end
		self:EmitSound( so[ math.random( #so ) ], 75, math.random( 125, 165 ) )
		self:GetPhysicsObject():SetVelocity( VectorRand():GetNormalized()*100 )
		self:GetPhysicsObject():EnableGravity( false ) self:SetMaterial( self.xdefm_Mat )
	end
	function ITEM:OnDraw( self ) local cha = ( self:GetNWFloat( "XDEFM_Cha" ) <= CurTime() )
		render.SetMaterial( Mat ) local siz = self:GetModelScale()*40 +math.sin( CurTime()*10 )*5
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( 255, 255, 155 ) )
	end
	function ITEM:OnDamaged( self ) self:GetPhysicsObject():EnableGravity( true ) end
	function ITEM:OnPhysSimulate( self, phy, del ) if self.xdefm_Killed then return end
		if self:IsPlayerHolding() or !self:GetPhysicsObject():IsMotionEnabled() then return end phy:Wake()
		self.ShadowParams.pos = self:GetPos()
		self.ShadowParams.angle = Angle( -90, self:GetAngles().yaw +CurTime()*10 +self:EntIndex(), 0 )
		self.ShadowParams.maxangular = 10000
		self.ShadowParams.maxangulardamp = 10000
		self.ShadowParams.maxspeed = 0
		self.ShadowParams.maxspeeddamp = 0
		self.ShadowParams.dampfactor = 0.8
		self.ShadowParams.teleportdistance = 0
		self.ShadowParams.deltatime = deltatime
		phy:ComputeShadowControl( self.ShadowParams )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_torch"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_debris/wood_chunk08b.mdl", CantCook = true
	, Helper = "#xdefm.d"..it, Rarity = 3, Price = 800, PhysSound = "Default.ImpactSoft" }
	local Mat = Material( "effects/blueflare1" )  local Ma2 = Material( "effects/splashwake3" )  Ma2:SetInt( "$ignorez", 1 )
	function ITEM:OnInit( self ) self:SetNWBool( "XDEFM_TOn", true )
		self.xdefm_Fir = xdefm_FireSpot( self:WorldSpaceCenter(), 20, 2, self )  self.xdefm_Fir:SetFMod_Enable( true ) self.xdefm_Fir:SetNoDraw( true )
		local lit = ents.Create( "light_dynamic" )  lit:SetPos( self:WorldSpaceCenter() +self:GetUp()*8 ) lit:SetAngles( Angle( 90, 0, 0 ) )
		lit:SetKeyValue( "_light", "255 255 155 255" )
		lit:SetKeyValue( "brightness", "1" ) lit:SetOwner( self ) lit:SetParent( self )
		lit:SetKeyValue( "distance", "400" ) lit:SetKeyValue( "style", "6" )
		lit:Spawn() lit:Activate() self:DeleteOnRemove( lit )
		lit:Fire( "TurnOn" ) self.xdefm_Lit = lit
	end
	function ITEM:OnUse( self, ent ) if ent:IsPlayer() and ent:KeyDown( IN_SPEED ) then return end local b = self:GetNWBool( "XDEFM_TOn" )
		self:SetNWBool( "XDEFM_TOn", !b ) self:EmitSound( "Cardboard.Strain" )
		if IsValid( self.xdefm_Lit ) then self.xdefm_Lit:Fire( b and "TurnOff" or "TurnOn" ) end
		if IsValid( self.xdefm_Fir ) then self.xdefm_Fir:SetFMod_Enable( !b ) end return false
	end
	function ITEM:OnDraw( self ) if !self:GetNWBool( "XDEFM_TOn" ) then return end local pos = self:WorldSpaceCenter() +self:GetUp()*8
		render.SetMaterial( Mat ) local siz = 30 +math.sin( CurTime()*20 )*5
		render.DrawSprite( pos, siz, siz, Color( 255, 255, 155 ) ) render.SetMaterial( Ma2 )
		siz = 25 +math.cos( CurTime()*20 )*5  render.DrawSprite( pos, siz, siz, Color( 255, 255, 155, 5 ) )
		if ( !isnumber( self.xdefm_Pa1 ) or self.xdefm_Pa1 <= CurTime() ) then self.xdefm_Pa1 = CurTime() +0.1
			if !self.Emit or !IsValid( self.Emit ) then
				self.Emit = ParticleEmitter( pos, false )
				self:CallOnRemove( "XDEEmitter", function( self ) if self.Emit then self.Emit:Finish() end end )
			else
				local particle = self.Emit:Add( "effects/yellowflare", pos +VectorRand():GetNormalized()*5 )
				particle:SetColor( 255, 255, 155 )
				particle:SetDieTime( 3 )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( math.Rand( 2, 4 ) )
				particle:SetEndSize( 0 )
				particle:SetCollide( true )
				particle:SetRoll( math.Rand( -360, 360 ) )
				particle:SetRollDelta( math.Rand( -30, 30 ) )
				particle:SetBounce( 1 )
				particle:SetThinkFunction( function( particle )
					particle:SetGravity( VectorRand():GetNormal()*50 )
					particle:SetNextThink( CurTime() +0.1 )
				end ) particle:SetNextThink( CurTime() +0.1 )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_bust"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_combine/breenbust.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 5, Price = 3600, PhysSound = "Concrete.ImpactSoft" }
	local Mat = Material( "sprites/light_glow02_add" ) Mat:SetInt( "$ignorez", 1 )
	function ITEM:OnInit( self ) self.xdefm_NextT = CurTime() +1 end
	function ITEM:OnReady( self ) self:SetTrigger( true ) self:UseTriggerBounds( true, 0 ) end
	function ITEM:OnTouch( self, ent, typ ) if typ == -1 or self.xdefm_NextT > CurTime() then return end
		if !IsValid( ent ) or ent:GetMaxHealth() <= 0 or ent:Health() >= ent:GetMaxHealth() then return end
		self.xdefm_NextT = CurTime() +1  self:EmitSound( "WallHealth.Start" ) ent:SetHealth( ent:GetMaxHealth() ) if ent:IsOnFire() then ent:Extinguish() end
		if ent:GetClass() == "xdefm_base" and isstring( ent:GetFMod_DT() ) then local aa, bb = xdefm_ItemGet( ent:GetFMod_DT() )
			if istable( bb ) and bb.Type == "Creature" and ent.xdefm_Killed then ent.xdefm_Killed = false
				if IsValid( ent:GetPhysicsObject() ) then ent:GetPhysicsObject():EnableGravity( true ) ent:GetPhysicsObject():Wake() end
				ent:SetColor( Color( 255, 255, 255 ) )
			end
		end
	end
	function ITEM:OnDraw( self )
		render.SetMaterial( Mat ) local siz = 100 +math.sin( CurTime()*10 )*5
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( 255, 255, 155 ) )
		if ( !isnumber( self.xdefm_Pa1 ) or self.xdefm_Pa1 <= CurTime() ) then self.xdefm_Pa1 = CurTime() +0.1
			if !self.Emit or !IsValid( self.Emit ) then
				self.Emit = ParticleEmitter( self:WorldSpaceCenter(), false )
				self:CallOnRemove( "XDEEmitter", function( self ) if self.Emit then self.Emit:Finish() end end )
			else
				local particle = self.Emit:Add( "effects/yellowflare", self:WorldSpaceCenter() +VectorRand():GetNormalized()*15 )
				particle:SetVelocity( VectorRand():GetNormalized()*5 )
				particle:SetColor( 255, 255, 155 )
				particle:SetDieTime( math.Rand( 1, 3 ) )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( math.Rand( 3, 6 ) )
				particle:SetEndSize( 0 )
				particle:SetCollide( true )
				particle:SetRoll( math.Rand( -360, 360 ) )
				particle:SetRollDelta( math.Rand( -30, 30 ) )
				particle:SetBounce( 1 )
				particle:SetGravity( Vector( 0, 0, 10 ) )
			end
		end
		if !isnumber( self.xdefm_Pa2 ) or self.xdefm_Pa2 <= CurTime() then self.xdefm_Pa2 = CurTime() +1
			if !self.xdefm_Emi2 or !IsValid( self.xdefm_Emi2 ) then
				self.xdefm_Emi2 = ParticleEmitter( self:WorldSpaceCenter(), true )
				self:CallOnRemove( "XDEEmitter2", function( self ) if self.Emi2 then self.Emi2:Finish() end end )
			else
				local particle = self.xdefm_Emi2:Add( "particle/particle_ring_wave_addnofog", self:WorldSpaceCenter() -self:GetUp()*12 )
				particle:SetAngles( Angle( 90, 0, 0 ) )
				particle:SetColor( 255, 255, 155 )
				particle:SetDieTime( 2 )
				particle:SetStartAlpha( 0 )
				particle:SetEndAlpha( 255 )
				particle:SetStartSize( 20 )
				particle:SetEndSize( 0 )
				particle:SetPos( self:WorldSpaceCenter() -self:GetUp()*12 )
				particle:SetThinkFunction( function( particle )
					if IsValid( self ) then particle:SetPos( self:WorldSpaceCenter() -self:GetUp()*12 ) end
					particle:SetNextThink( CurTime() )
				end ) particle:SetNextThink( CurTime() )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "cr_melon"
	local ITEM = { Name = "#xdefm."..it, Type = "Creature", Model = "models/props_junk/watermelon01.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 80, TickRate = 0.1, MinSize = 0.8, MaxSize = 1.2 }
	function ITEM:OnInit( self ) self:SetMaxHealth( 10 ) self:SetHealth( self:GetMaxHealth() )
		self:SetBloodColor( BLOOD_COLOR_RED ) self:PhysicsInit( SOLID_VPHYSICS )
		self:SetCollisionGroup( COLLISION_GROUP_NPC ) self.xdefm_Killed = false
		self.xdefm_NextRun = CurTime() +math.Rand( 0.5, 2 )
	end
	function ITEM:OnThink( self ) if self.xdefm_Killed then return end
		if self.xdefm_NextRun <= CurTime() then local vel = VectorRand():GetNormalized()*math.random( 100, 300 )
			vel.z = 0  self:GetPhysicsObject():AddVelocity( vel )
			self.xdefm_NextRun = CurTime() +math.Rand( 0.5, 2 )
		end
	end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 10 ) self:SetTrigger( true ) self:UseTriggerBounds( true, 4 ) end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed then return end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) )
		if self:Health() <= 0 then self.xdefm_Killed = true
			self:EmitSound( "physics/body/body_medium_break"..math.random( 1, 2 )..".wav" )
			local tab = {["it_melo"]=1} for i=1, math.random( 4, 6 ) do xdefm_LootDrop( tab, self ) end
			SafeRemoveEntity( self )
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_junkx"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/TrashDumpster01a.mdl",
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 200, Carryable = false, PhysSound = "MetalGrate.ImpactHard" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 100 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 50 ) end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or self.xdefm_Killed then return end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Breakable.Metal" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local lt = {["it_junks"]=8,["it_junk"]=1}
		for i=1, math.random( 3, 5 ) do xdefm_LootDrop( lt, self ) end
		xdefm_BreakEffect( self, 3 ) self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_monitor"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props_lab/monitor01a.mdl", "models/props_lab/monitor01b.mdl",
	"models/props_lab/monitor02.mdl" }, Helper = "#xdefm.d"..it, Rarity = 2, Price = 200, PhysSound = "Computer.ImpactSoft" }
	function ITEM:OnInit( self ) self.xdefm_NextBounce = CurTime() +0.25 end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_NextBounce > CurTime() then return end  self.xdefm_NextBounce = CurTime() +0.25
		if self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() then return end
		xdefm_BreakEffect( self, 3 ) self:EmitSound( "MetalVehicle.ImpactSoft" ) util.ScreenShake( self:WorldSpaceCenter(), 5, 5, 0.5, 250 )
		self:GetPhysicsObject():AddVelocity( VectorRand():GetNormal()*1000 )
	end function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnCollide( self, dat ) if self.xdefm_NextBounce > CurTime() then return end
		if self:IsPlayerHolding() or constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() then return end
		if dat.Speed >= 60 and dat.DeltaTime > 0.2 then self.xdefm_NextBounce = CurTime() +0.25
			xdefm_BreakEffect( self, 3 ) self:EmitSound( "MetalVehicle.ImpactSoft" ) util.ScreenShake( self:WorldSpaceCenter(), 5, 5, 0.5, 250 )
			if IsValid( dat.HitEntity ) and util.IsValidModel( dat.HitEntity:GetModel() ) then local ent = dat.HitEntity
				local dmg = DamageInfo()  dmg:SetDamage( 10 ) dmg:SetAttacker( self:GetFMod_OW() )
				dmg:SetInflictor( self ) dmg:SetDamageType( DMG_CRUSH ) dmg:SetDamagePosition( ent:WorldSpaceCenter() )
				dmg:SetDamageForce( ( ent:WorldSpaceCenter() -self:WorldSpaceCenter() ):GetNormalized()*10000 )
				ent:TakeDamageInfo( dmg ) ent:SetVelocity( dmg:GetDamageForce()/10 )
				if IsValid( ent:GetPhysicsObject() ) then ent:GetPhysicsObject():SetVelocity( dmg:GetDamageForce()/20 ) end
				self:GetPhysicsObject():SetVelocity( -dmg:GetDamageForce()/20 )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end