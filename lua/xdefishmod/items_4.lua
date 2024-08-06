if CLIENT then local langs = {}
	langs[ "zh-CN" ] = {
		[ "it_slot" ] = "老虎机", [ "dit_slot" ] = "我第一个写的脚本实体就是像这样子的老虎机,我会把这段记忆保存在这里.\n花费1000鱼币玩一次.",
		[ "it_gballoom" ] = "气球机", [ "dit_gballoom" ] = "花费100鱼币吹一个气球.",
		[ "it_atm" ] = "ATM机", [ "dit_atm" ] = "放入的鱼币每一分钟增长1%. 最高一分钟10000. Shift+E取钱.",
		[ "it_refill" ] = "恢复包", [ "dit_refill" ] = "回满你的血量和护甲. 可以复活生物.",
		[ "it_fridge" ] = "冰箱", [ "dit_fridge" ] = "打碎以开启.",
		[ "it_supply" ] = "补给箱", [ "dit_supply" ] = "购买一些武器弹药.",
		[ "it_egg" ] = "卵", [ "dit_egg" ] = "砸烂之后生成一只鸟.",
		[ "cr_knight" ] = "棋子", [ "dcr_knight" ] = "没事它是无害的.",
		[ "it_tungstenbar" ] = "钨锭", [ "dit_tungstenbar" ] = "一块钨.",
		[ "it_clocked" ] = "联合军锁", [ "dit_clocked" ] = "一张地图总有一个被这玩意儿锁住的门.",
		[ "it_coin2" ] = "稀有银币", [ "dit_coin2" ] = "银币闪烁着不寻常的光.",
		[ "it_treasure" ] = "宝藏箱", [ "dit_treasure" ] = "装有一些宝物.",
		[ "cr_pigeon" ] = "鸽子", [ "dcr_pigeon" ] = "友好的鸽子.",
		[ "it_expr" ] = "报纸", [ "dit_expr" ] = "获得少量经验.",
		[ "it_exps" ] = "报纸捆", [ "dit_exps" ] = "",
		[ "it_chemical" ] = "化学药剂", [ "dit_chemical" ] = "",
		[ "it_antibird" ] = "静电球", [ "dit_antibird" ] = "消灭一只海鸥后破碎.",
		[ "it_printer" ] = "打印机", [ "dit_printer" ] = "放入一瓶化学试剂和一卷纸合成一张报纸.",
		[ "it_server" ] = "研究电脑", [ "dit_server" ] = "每20秒生成一点经验值,最高300.",
		[ "it_miner" ] = "鱼币矿机", [ "dit_miner" ] = "每2秒生成一点鱼币,最高10000.",
		[ "it_tesla" ] = "电击塔", [ "dit_tesla" ] = "放入电池可以自动攻击海鸥.",
		[ "it_cooler" ] = "饮水机", [ "dit_cooler" ] = "购买纯净水.",
		[ "it_ejunk" ] = "电子垃圾", [ "dit_ejunk" ] = "全都被水泡坏了.",
		[ "it_jumppad" ] = "跳板", [ "dit_jumppad" ] = "踩上去能跳的很高.",
		[ "it_flower" ] = "花朵", [ "dit_flower" ] = "散发着令人愉悦的味道.",
		[ "it_stove4" ] = "豪华炉灶", [ "dit_stove4" ] = "炉灶烘烤过的物品可以增值. 可以调整火力.",
		[ "it_stove5" ] = "智能炉灶", [ "dit_stove5" ] = "炉灶烘烤过的物品可以增值. 能检测物品烘烤程度并自动关闭.",
		[ "it_microwave" ] = "微波炉", [ "dit_microwave" ] = "缓慢,但是很安全.",
		[ "it_metal2" ] = "金属片", [ "dit_metal2" ] = "",
		[ "it_wood2" ] = "木板", [ "dit_wood2" ] = "",
		[ "it_glass2" ] = "玻璃板", [ "dit_glass2" ] = "",
		[ "it_stone2" ] = "水泥袋", [ "dit_stone2" ] = "",
		[ "it_glass3" ] = "钢化玻璃板", [ "dit_glass3" ] = "",
		[ "it_plastic" ] = "塑料板", [ "dit_plastic" ] = "",
		[ "it_bag1" ] = "任务奖励 LV1", [ "dit_bag1" ] = "按E打开.",
		[ "it_bag2" ] = "任务奖励 LV2", [ "dit_bag2" ] = "按E打开.",
		[ "it_bag3" ] = "任务奖励 LV3", [ "dit_bag3" ] = "按E打开.",
		[ "it_bag4" ] = "任务奖励 LV4", [ "dit_bag4" ] = "按E打开.",
		[ "it_cage" ] = "蟹笼", [ "dit_cage" ] = "放入鱼饵沉入水底来捕捉生物. 可能会被鱼挤爆.",
		[ "it_auto" ] = "自动钓鱼机™", [ "dit_auto" ] = "将机器放入水中可以自动钓鱼. 别忘了放鱼饵.",
		[ "it_propane" ] = "燃气瓶", [ "dit_propane" ] = "严禁烟火.",
		[ "it_ore" ] = "废矿石", [ "dit_ore" ] = "",
		[ "it_recipe1" ] = "初级图纸堆", [ "dit_recipe1" ] = "装有2张普通图纸,打碎以开启.",
		[ "it_recipe2" ] = "进阶图纸堆", [ "dit_recipe2" ] = "装有2张罕见图纸,打碎以开启.",
		[ "it_recipe3" ] = "高级图纸堆", [ "dit_recipe3" ] = "装有2张稀有图纸,打碎以开启.",
		[ "it_bait4" ] = "大师鱼饵盒", [ "dit_bait4" ] = "盒子里装了3个史诗鱼饵,打碎以开启.",
		[ "it_potato" ] = "洋芋", [ "dit_potato" ] = "",
		[ "it_furnace1" ] = "石熔炉", [ "dit_furnace1" ] = "简单的矿石冶炼.",
		[ "it_pipebomb" ] = "土质炸药", [ "dit_pipebomb" ] = "丢进水里有几率炸出死鱼.",
		[ "it_mine2" ] = "水雷", [ "dit_mine2" ] = "崭新出厂. 触碰物品后爆炸.",
	}
	langs[ "en" ] = {
		[ "it_slot" ] = "Slot Machine", [ "dit_slot" ] = "Since my first scripted entity is a slot machine like this, I decided to keep the memories here.\nSpend 1000 to play once.",
		[ "it_gballoom" ] = "Balloon Machine", [ "dit_gballoom" ] = "Spend 100 for a balloon.",
		[ "it_atm" ] = "ATM", [ "dit_atm" ] = "The money you put in grows by 1% every minute. Up to 10000. Withdraw by pressing Shift+E.",
		[ "it_refill" ] = "Refill Kit", [ "dit_refill" ] = "Fulfill your health and armor. Can also revive creatures.",
		[ "it_fridge" ] = "Fridge", [ "dit_fridge" ] = "Break to open.",
		[ "it_supply" ] = "Supply Crate", [ "dit_supply" ] = "Buy some weapons and ammo.",
		[ "it_egg" ] = "Egg", [ "dit_egg" ] = "Spawn a bird on break.",
		[ "cr_knight" ] = "Knight", [ "dcr_knight" ] = "Don't worry it's harmless.",
		[ "it_tungstenbar" ] = "Tungsten Ingot", [ "dit_tungstenbar" ] = "A bar of tungsten.",
		[ "it_clocked" ] = "Lock", [ "dit_clocked" ] = "An campaign map always has a door locked by this thing.",
		[ "it_coin2" ] = "Rare Coin", [ "dit_coin2" ] = "It shone with an unusual light.",
		[ "it_treasure" ] = "Treasure Chest", [ "dit_treasure" ] = "Contains booty.",
		[ "cr_pigeon" ] = "Pigeon", [ "dcr_pigeon" ] = "Friendly pet pigeon.",
		[ "it_expr" ] = "Newspaper", [ "dit_expr" ] = "Gain small amount of exps.",
		[ "it_exps" ] = "Newspaper Bundle", [ "dit_exps" ] = "",
		[ "it_chemical" ] = "Chemicals", [ "dit_chemical" ] = "",
		[ "it_antibird" ] = "Tesla Orb", [ "dit_antibird" ] = "Prevent bird attack once and break.",
		[ "it_printer" ] = "Printer", [ "dit_printer" ] = "Insert 1 bottled chemicals and 1 paper roll to craft a piece of newspaper.",
		[ "it_server" ] = "Research Server", [ "dit_server" ] = "Generate 1 exp every 20 seconds, up to 300.",
		[ "it_miner" ] = "FishCoin Miner", [ "dit_miner" ] = "Generate 1 money every 2 seconds, up to 10000.",
		[ "it_tesla" ] = "Tesla Tower", [ "dit_tesla" ] = "Insert batteries to attack birds.",
		[ "it_cooler" ] = "Water Cooler", [ "dit_cooler" ] = "Buy some bottled water.",
		[ "it_ejunk" ] = "E-Junk", [ "dit_ejunk" ] = "It's all soaked in water.",
		[ "it_jumppad" ] = "Jump Pad", [ "dit_jumppad" ] = "Launch you to the sky on touch.",
		[ "it_flower" ] = "Flower", [ "dit_flower" ] = "Give off a pleasant smell.",
		[ "it_stove4" ] = "Deluxe Stove", [ "dit_stove4" ] = "Cooked items can increase in value. Has 3 fire modes.",
		[ "it_stove5" ] = "Technology Stove", [ "dit_stove5" ] = "Cooked items can increase in value. Can detect baking degree and shut down automatically.",
		[ "it_microwave" ] = "Microwave", [ "dit_microwave" ] = "Slow but safe.",
		[ "it_metal2" ] = "Metal Sheet", [ "dit_metal2" ] = "",
		[ "it_wood2" ] = "Wooden Board", [ "dit_wood2" ] = "",
		[ "it_glass2" ] = "Glass Plate", [ "dit_glass2" ] = "",
		[ "it_stone2" ] = "Concrete Bags", [ "dit_stone2" ] = "",
		[ "it_glass3" ] = "Tempered Glass Plate", [ "dit_glass3" ] = "",
		[ "it_plastic" ] = "Plastic Plate", [ "dit_plastic" ] = "",
		[ "it_bag1" ] = "Quest Reward LV1", [ "dit_bag1" ] = "Press E to open.",
		[ "it_bag2" ] = "Quest Reward LV2", [ "dit_bag2" ] = "Press E to open.",
		[ "it_bag3" ] = "Quest Reward LV3", [ "dit_bag3" ] = "Press E to open.",
		[ "it_bag4" ] = "Quest Reward LV4", [ "dit_bag4" ] = "Press E to open.",
		[ "it_cage" ] = "Crab Cage", [ "dit_cage" ] = "Insert baits and sink it to the bottom to catch creatures. May break when it's full.",
		[ "it_auto" ] = "Auto Fishing™", [ "dit_auto" ] = "Submerge it in water to fish automatically. Can also insert baits.",
		[ "it_propane" ] = "Propane Tank", [ "dit_propane" ] = "No smoking.",
		[ "it_ore" ] = "Metal Ore", [ "dit_ore" ] = "",
		[ "it_recipe1" ] = "Basic Recipe Bundle", [ "dit_recipe1" ] = "Contains 2 random common recipes. Break to open.",
		[ "it_recipe2" ] = "Improved Recipe Bundle", [ "dit_recipe2" ] = "Contains 2 random uncommon recipes. Break to open.",
		[ "it_recipe3" ] = "Advanced Recipe Bundle", [ "dit_recipe3" ] = "Contains 2 random rare recipes. Break to open.",
		[ "it_bait4" ] = "Master Bait Box", [ "dit_bait4" ] = "Contains 3 random epic baits. Break to open.",
		[ "it_potato" ] = "Potato", [ "dit_potato" ] = "",
		[ "it_furnace1" ] = "Stone Furnace", [ "dit_furnace1" ] = "Basic ore smelting.",
		[ "it_pipebomb" ] = "Pipe Bomb", [ "dit_pipebomb" ] = "May catch fishes randomly when thrown into water.",
		[ "it_mine2" ] = "Naval Mine", [ "dit_mine2" ] = "Good as new. Detonate after touching props.",
	}
	local ln = GetConVar( "gmod_language" ):GetString()  local lg = "en"
	if ln != nil and istable( langs[ ln ] ) then lg = GetConVar( "gmod_language" ):GetString() end
	for holder, text in pairs( langs[ lg ] ) do language.Add( "xdefm."..holder, text ) end
end local Mat = Material( "sprites/light_glow02_add" ) Mat:SetInt( "$ignorez", 1 )
local Ma2 = Material( "particle/particle_glow_04" )

if true then local it = "it_slot"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_c17/cashregister01a.mdl",
	Helper = "#xdefm.d"..it, Rarity = 5, Price = 2333, PhysSound = "Metal_Box.ImpactSoft" }
	function ITEM:OnInit( self ) self.xdefm_Cool = 0 end
	function ITEM:OnUse( self, usr ) if self.xdefm_Cool > CurTime() then return false end
		if usr:KeyDown( IN_SPEED ) then return true end local pro = usr.xdefm_Profile  self.xdefm_Cool = CurTime() +1
		if !istable( pro ) or !isnumber( pro.Money ) or pro.Money < 1000 then self:EmitSound( "Buttons.snd10" ) return false end
		self:EmitSound( "NPC_Alyx.Vend_Coin" ) local n1, n2, n3 = math.random( 0, 9 ), math.random( 0, 9 ), math.random( 0, 9 )
		local prc, snd = 0, ""  if n1 == n2 or n2 == n3 then prc = 2500  snd = "garrysmod/save_load"..math.random( 1, 4 )..".wav" end
		if n1 == n2 and n1 == n3 then prc = 25000  snd = "misc/happy_birthday.wav" end  xdefm_AddNote( usr, n1.." "..n2.." "..n3, "!V", "joystick", 5 )
		if prc > 0 then xdefm_AddNote( usr, "xdefm.GetMoney&: "..prc, snd, "coins", 5 ) end
		usr.xdefm_Profile.Money = pro.Money -1000 +prc  xdefm_ProfileUpdate( usr ) return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_gballoom"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/maxofs2d/thruster_projector.mdl",
	Helper = "#xdefm.d"..it, Rarity = 4, Price = 1080, PhysSound = "Metal_Box.ImpactSoft", TickRate = 0.01 }
	function ITEM:OnInit( self ) self.xdefm_Cool = 0 end
	function ITEM:OnUse( self, usr ) if self.xdefm_Cool > CurTime() then return false end
		if usr:KeyDown( IN_SPEED ) then return true end local pro = usr.xdefm_Profile  self.xdefm_Cool = CurTime() +1
		if !istable( pro ) or !isnumber( pro.Money ) or pro.Money < 100 then self:EmitSound( "Buttons.snd10" ) return false end
		self:SetAngles( Angle( 0, self:GetAngles().yaw, 0 ) )
		local ite = xdefm_ItemSpawn( "it_gballoon", self:WorldSpaceCenter() +self:GetUp()*20, Angle( 0, math.random( 0, 360 ), 0 ), usr )
		if !IsValid( ite ) then return false end self:EmitSound( "Weapon_SLAM.TripMineMode" ) usr:PickupObject( ite )
		usr.xdefm_Profile.Money = pro.Money -100  xdefm_ProfileUpdate( usr ) return false
	end
	function ITEM:OnThink( self ) self:SetColor( HSVToColor( ( CurTime()*50 ), 1, 1 ) ) end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_atm"
	local tb = {[200]="it_dollar",[500]="it_coin",[850]="it_silverbar",[2400]="it_goldbar",[4000]="it_platinumbar",[10000]="it_rainbowbar"}
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_unique/atm01.mdl", Helper = "#xdefm.d"..it,
	Rarity = 4, Price = 1500, PhysSound = "Metal_Box.ImpactSoft", TickRate = 1, HelperUse = "xdefm.U2", Carryable = false, TickRate = 1 }
	function ITEM:OnInit( self ) self:SetNWInt( "XDEFM_MN", 0 )  self.xdefm_Cool = 0  self.xdefm_Delay = 0 end
	function ITEM:OnReady( self ) self:PhysWake() self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnUse( self, usr ) if self.xdefm_Cool > CurTime() then return false end
		local pro = usr.xdefm_Profile  if !istable( pro ) or !isnumber( pro.Money ) then return end
		self.xdefm_Cool = CurTime() +0.1  local tot = self:GetNWInt( "XDEFM_MN" )
		if usr:KeyDown( IN_SPEED ) then
			if tot <= 0 then self:EmitSound( "Buttons.snd10" ) return false end local amo = math.min( tot, 100 )
			xdefm_AddNote( usr, "xdefm.GetMoney&: "..amo, "!V", "coins", 5 ) xdefm_GiveMoney( usr, amo )
			self:EmitSound( "Buttons.snd9" )  self:SetNWInt( "XDEFM_MN", tot -amo )
			self.xdefm_Delay = CurTime() +60
			return false
		else
			if pro.Money <= 0 then self:EmitSound( "Buttons.snd10" ) return false end local amo = math.min( pro.Money, 100 )
			usr.xdefm_Profile.Money = pro.Money -30  xdefm_ProfileUpdate( usr )
			self:EmitSound( "Buttons.snd4" ) self:SetNWInt( "XDEFM_MN", tot +amo )
			self.xdefm_Delay = CurTime() +60
			return false
		end
	end
	function ITEM:OnThink( self )
		if self.xdefm_Delay <= CurTime() then self.xdefm_Delay = CurTime() +60
			local tot = self:GetNWInt( "XDEFM_MN" )  local adm = math.min( 10000, math.floor( tot*0.01 ) )
			if tot > 0 then self:SetNWInt( "XDEFM_MN", tot +adm ) end
		end
	end
	function ITEM:OnDraw( self )
		local amo, txt = math.Round( self:GetNWInt( "XDEFM_MN" ) ), ""
		if amo >= 1000 then txt = tostring( math.Round( amo/1000, 1 ) ).."K"
		elseif amo >= 1000000 then txt = tostring( math.Round( amo/1000000, 1 ) ).."M"
		else txt = tostring( math.Round( self:GetNWInt( "XDEFM_MN" ) ) ) end
		surface.SetFont( "HudHintTextLarge" )  local xx, yy = surface.GetTextSize( txt )
		cam.Start3D2D( self:WorldSpaceCenter() +self:GetForward()*8 -self:GetUp()*4 +self:GetRight()*8.25, self:LocalToWorldAngles( Angle( 0, 90, 90 ) ), 0.1 )
			draw.RoundedBox( 0, -xx/2 -8, -yy/2 -150 -8, xx +16, yy +16, Color( 0, 0, 0, 155 ) )
			draw.TextShadow( { text = txt, pos = { 0, -150 }, font = "HudHintTextLarge",
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		cam.End3D2D()
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_refill"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/Items/car_battery01.mdl", HelperUse = "xdefm.U2"
	, Helper = "#xdefm.d"..it, Rarity = 3, Price = 400, PhysSound = "Plastic_Box.ImpactSoft" }
	function ITEM:OnInit( self ) self.xdefm_Used = false end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Health() >= ent:GetMaxHealth() and ent:Armor() >= ent:GetMaxArmor() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end ent:SetHealth( ent:GetMaxHealth() ) ent:SetArmor( ent:GetMaxArmor(), ent:Health() +100 )
		ent:EmitSound( "TriggerSuperArmor.StartCharging" ) self:Remove() self.xdefm_Used = true return false
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
if true then local it = "it_fridge"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_c17/FurnitureFridge001a.mdl",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 500, PhysSound = "SolidMetal.ImpactSoft", Carryable = false }
	function ITEM:OnInit( self ) self:SetMaxHealth( 100 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnReady( self ) self:PhysWake() self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Breakable.Metal" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local lt = {["it_bread2"]=200,["it_apple"]=5,["it_orange"]=5,["it_melon"]=5,["it_gfood"]=100,["it_soda"]=25} for i=1, math.random( 4, 6 ) do xdefm_LootDrop( lt, self ) end
		xdefm_BreakEffect( self, 3 ) self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_supply"
	local ITEM = { Name = "#xdefm."..it, Type = "Struct", Model = "models/Items/ammocrate_smg1.mdl", Carryable = false, StartSound = "AmmoCrate.Open", ExitSound = "AmmoCrate.Close",
	Helper = "#xdefm.d"..it, Rarity = 4, Price = 2000, PhysSound = "Metal_Box.ImpactHard", TickRate = 0.1, SType = 3 }
	ITEM.Shop = { [ "it_ammocan1" ] = { 3000, 25 }, [ "it_ammo" ] = { 1250, 25 }, [ "it_grenade" ] = { 1500, 25 }, [ "it_flashbang" ] = { 1250, 25 } }
	function ITEM:OnInit( self ) self:SetAutomaticFrameAdvance( true ) self:SetBodygroup( 1, 1 ) self.xdefm_Cool = 0  self.xdefm_Anim = 0 end
	function ITEM:OnReady( self ) self:PhysWake() self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnInteract( self, ent, typ )
		if typ == 1 then self:ResetSequence( "Open" ) self:SetPlaybackRate( 1 )
		elseif typ == -1 then self:ResetSequence( "Close" ) self:SetPlaybackRate( 1 ) end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_egg"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_phx/misc/egg.mdl",
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 250, PhysSound = "Grenade.ImpactSoft", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Thrown = 0 end
	function ITEM:OnDrop( self, ent, typ ) if !typ or self.xdefm_Thrown > 0 then return end
		self:EmitSound( "Zombie.AttackMiss" )
		self:SetAngles( Angle( ent:EyeAngles().pitch, ent:EyeAngles().yaw, 0 ) )
		self:GetPhysicsObject():SetVelocity( ent:EyeAngles():Forward()*1000 )
		self:GetPhysicsObject():AddAngleVelocity( Vector( 0, 10, 0 )*150 ) xdefm_NoTool( self )
		self:SetCollisionGroup( COLLISION_GROUP_NONE ) self.xdefm_Thrown = 1  SafeRemoveEntityDelayed( self, 30 )
	end
	function ITEM:OnCollide( self, dat )
		if self.xdefm_Thrown == 1 then self.xdefm_Thrown = 2
			local eff = EffectData() eff:SetOrigin( self:WorldSpaceCenter() )
			eff:SetScale( 1 ) eff:SetMagnitude( 2 ) eff:SetRadius( 1 ) util.Effect( "GlassImpact", eff )
			self:EmitSound( "Egg.Crack" ) SafeRemoveEntityDelayed( self, 0.1 )
			if xdefm_CookMeter( self ) != 0 then return end
			local lt = {["cr_pigeon"]=1,["cr_seagull"]=2,["cr_crow"]=1} xdefm_LootDrop( lt, self )
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "cr_knight"
	local ITEM = { Name = "#xdefm."..it, Type = "Creature", Model = { "models/props_phx/games/chess/white_knight.mdl",
	"models/props_phx/games/chess/black_knight.mdl" }, Helper = "#xdefm.d"..it, Rarity = 3, Price = 768, TickRate = 0.1, MinSize = 1, MaxSize = 1.4 }
	function ITEM:OnInit( self ) self:SetMaxHealth( 128 ) self:SetHealth( self:GetMaxHealth() )
		self:PhysicsInit( SOLID_VPHYSICS ) self:SetCollisionGroup( COLLISION_GROUP_NPC )
		self.ShadowParams = {}  self.xdefm_Killed = false  self.xdefm_Target = nil  self.xdefm_Snd = nil
		self:StartMotionController() self.xdefm_NextFind = 0 return true
	end
	function ITEM:OnUse( self ) if self:Health() > 0 then return false end end
	function ITEM:OnReady( self ) self:PhysWake() self:GetPhysicsObject():SetMass( 100 ) self:SetTrigger( true ) end
	function ITEM:OnThink( self ) if self.xdefm_Killed then return end
		if ( !IsValid( self.xdefm_Target ) or self.xdefm_Target:Health() <= 0 ) and self.xdefm_NextFind <= CurTime() then local tas, dis, tar = {}, 2048, nil
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
		end
	end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed then return end self:EmitSound( "Wood.Break" )
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) )
		if self:Health() <= 0 then self.xdefm_Killed = true  xdefm_BreakEffect( self, 1 ) SafeRemoveEntityDelayed( self, 0.1 ) end
	end
	function ITEM:OnPhysSimulate( self, phy, del ) if self.xdefm_Killed or constraint.FindConstraint( self, "Weld" ) then return end phy:Wake()
		if self:IsPlayerHolding() or !self:GetPhysicsObject():IsMotionEnabled() then return end local tar = self.xdefm_Target
		if !IsValid( tar ) or !tar:IsPlayer() or tar:Health() <= 0 then return end local pos, ang = self:GetPos(), self:GetAngles()
		local ang1, ang2 = tar:EyeAngles(), ( self:GetPos() -tar:EyePos() ):Angle()
		local vv, aa = WorldToLocal( Vector( 0, 0, 0 ), ang1, Vector( 0, 0, 0 ), ang2 )
		local deg = math.sqrt( aa.pitch^2 +aa.yaw^2 )
		local tr = util.TraceLine( { start = pos, endpos = pos -Vector( 0, 0, 64 ), filter = self, mask = MASK_NPCSOLID } )  pos = tr.HitPos
		if deg > 90 and self:GetPos():Distance( tar:GetPos() ) > 64 then pos = pos +( tar:GetPos() -self:GetPos() )/4
			ang = Angle( 0, ( tar:GetPos() -self:GetPos() ):Angle().yaw, 0 )  self:SetAngles( ang )
			if !self.xdefm_Snd then self.xdefm_Snd = CreateSound( self, Sound( "Wood.ScrapeRough" ) ) self.xdefm_Snd:Play() end
		elseif self.xdefm_Snd then self.xdefm_Snd:Stop()  self.xdefm_Snd = nil end
		self.ShadowParams.pos = pos
		self.ShadowParams.angle = ang
		self.ShadowParams.maxangular = 10000
		self.ShadowParams.maxangulardamp = 10000
		self.ShadowParams.maxspeed = 10000
		self.ShadowParams.maxspeeddamp = 10000
		self.ShadowParams.dampfactor = 0.8
		self.ShadowParams.teleportdistance = 0
		self.ShadowParams.deltatime = deltatime
		phy:ComputeShadowControl( self.ShadowParams )
	end
	function ITEM:OnRemove( self ) if self.xdefm_Snd then self.xdefm_Snd:Stop()  self.xdefm_Snd = nil end end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_tungstenbar"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/xdeedited/ingot_tungsten.mdl",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 500, PhysSound = "GlassBottle.ImpactHard", TickRate = 0.1 }
	function ITEM:OnInit( self ) self:SetColor( Color( 79, 69, 42 ) ) end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 150 ) end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_clocked"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_combine/combine_lock01.mdl", TickRate = 0.1,
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 300, Carryable = false, PhysSound = "SolidMetal.ImpactSoft" }
	function ITEM:OnUse( self, ent ) if ent:KeyDown( IN_SPEED ) then return true end self:EmitSound( "combine.door_lock" ) return false end
	function ITEM:OnRemove( self ) for k, v in pairs( self:GetChildren() ) do v:Remove() end end
	function ITEM:OnDraw( self )
		render.SetMaterial( Mat ) local siz = 10
		render.DrawSprite( self:WorldSpaceCenter() -self:EyeAngles():Up()*9.5 -self:EyeAngles():Forward()*3.5 -self:EyeAngles():Right()*6, siz, siz, Color( 255, 0, 0, 255 ) )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_coin2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/money/silvcoin.mdl",
	Helper = "#xdefm.d"..it, Rarity = 4, Price = 1500, PhysSound = "Chain.ImpactHard" }
	function ITEM:OnInit( self ) self:SetColor( Color( 155, 255, 255 ) ) end
	function ITEM:OnDraw( self )
		render.SetMaterial( Mat ) local siz = 15 +math.sin( CurTime()*5 )*1
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( 155, 255, 255, 255 ) )
		if !self.Emitter or !IsValid( self.Emitter ) then self.Emitter = ParticleEmitter( self:WorldSpaceCenter() )
			self:CallOnRemove( "XDEEmitter", function( self ) if self.Emitter then self.Emitter:Finish() end end )
		else
			if !isnumber( self.xdefm_Ptc ) or self.xdefm_Ptc <= CurTime() then self.xdefm_Ptc = CurTime() +0.05
				local particle = self.Emitter:Add( "sprites/glow04_noz", self:WorldSpaceCenter() +VectorRand():GetNormalized()*3 )
				particle:SetVelocity( Vector( 0, 0, 40 ) +VectorRand():GetNormal()*20 )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( math.Rand( 1, 3 ) )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				local Size = math.Rand( 0.5, 1 )
				particle:SetStartSize( Size )
				particle:SetEndSize( 0 )		
				particle:SetRoll( 3 )
				particle:SetRollDelta( 0 )
				particle:SetAirResistance( 200 )
				particle:SetGravity( Vector( 0, 0, -25 ) )
				particle:SetColor( 155, 255, 255 )
				particle:SetCollide( true )
				particle:SetBounce( 1 )
				particle:SetLighting( false )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_expr"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_c17/paper01.mdl", KillInWater = true,
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 0, PhysSound = "Cardboard.ImpactSoft", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Killed = false end
	function ITEM:OnUse( self, ent ) if self.xdefm_Killed then return end
		if ent:KeyDown( IN_SPEED ) then return true end local pro = ent.xdefm_Profile
		self.xdefm_Killed = true  xdefm_BroadEffect( "xdefm_present", { Origin = self:WorldSpaceCenter() } )
		local exp = math.random( 5, 25 )  xdefm_AddNote( ent, "xdefm.GetEXP&: "..exp, "buttons/bell1.wav", "medal_gold_1", 5 )
		self:Remove() xdefm_GiveExp( ent, exp ) return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_exps"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/garbage_newspaper001a.mdl", KillInWater = true,
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 400, PhysSound = "Cardboard.ImpactSoft", HelperUse = "xdefm.U2", Carryable = false }
	function ITEM:OnInit( self ) self.xdefm_Papers = math.random( 3, 5 )  self.xdefm_MPapers = self.xdefm_Papers end
	function ITEM:OnStore( self ) return self.xdefm_MPapers >= self.xdefm_Papers end
	function ITEM:OnUse( self, ent ) if self.xdefm_Papers <= 0 then return end
		if ent:KeyDown( IN_SPEED ) then return true end local pro = ent.xdefm_Profile
		if xdefm_ItemGive( ent, "it_expr" ) then self.xdefm_Papers = self.xdefm_Papers -1
			self:GetPhysicsObject():SetVelocity( VectorRand():GetNormal()*64 )
			xdefm_BroadEffect( "GlassImpact", { Entity = self, Origin = self:GetPos(), Scale = 1, Magnitude = 1, Radius = 1 } )
			self:EmitSound( "Cardboard.BulletImpact" ) if self.xdefm_Papers <= 0 then self:Remove() end
		end
		return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_chemical"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_lab/jar01b.mdl", KillInWater = true,
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 100, PhysSound = "Plastic_Barrel.ImpactSoft" }
	function ITEM:OnDrop( self, ent, typ ) if !typ or self.xdefm_Thrown > 0 then return end
		self:EmitSound( "Zombie.AttackMiss" )
		self:SetAngles( Angle( ent:EyeAngles().pitch, ent:EyeAngles().yaw, 0 ) )
		self:GetPhysicsObject():SetVelocity( ent:EyeAngles():Forward()*1000 )
		self:GetPhysicsObject():AddAngleVelocity( Vector( 0, 10, 0 )*150 ) xdefm_NoTool( self )
		self:SetCollisionGroup( COLLISION_GROUP_NONE ) self.xdefm_Thrown = 1  SafeRemoveEntityDelayed( self, 30 )
	end
	function ITEM:OnInit( self ) self.xdefm_Thrown = 0 self:SetColor( Color( math.random( 0, 255 ), math.random( 0, 255 ), math.random( 0, 255 ) ) ) end
	function ITEM:OnCollide( self, dat )
		if self.xdefm_Thrown == 1 then self.xdefm_Thrown = 2
			xdefm_BroadEffect( "StriderBlood", { Origin = dat.HitPos +dat.HitNormal, Magnitude = 3, Scale = 1, Radius = 5 } )
			self:EmitSound( "physics/plastic/plastic_barrel_break"..math.random( 1, 2 )..".wav" ) SafeRemoveEntityDelayed( self, 0.1 )
			local dmg = DamageInfo() dmg:SetDamage( math.random( 0, 50 ) ) dmg:SetDamageType( DMG_POISON )
			dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
			dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 64 )
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_antibird"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/maxofs2d/hover_rings.mdl",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 500, PhysSound = "Glass.ImpactHard", TickRate = 0.25 }
	function ITEM:OnInit( self ) self.xdefm_Killed = false end
	function ITEM:OnThink( self ) if self.xdefm_Killed then return end local ent = nil
		for k, v in pairs( ents.FindInSphere( self:GetPos(), 512 ) ) do if v:GetClass() == "xdefm_base" and !v.xdefm_Killed and
			v:Health() > 0 and ( xdefm_GetClass( v ) == "cr_seagull" or xdefm_GetClass( v ) == "cr_crow" or xdefm_GetClass( v ) == "cr_seagull2" ) then ent = v break end end if !IsValid( ent ) then return end
		self:EmitSound( "PropJeep.FireCannon" ) xdefm_BreakEffect( self, 2 ) SafeRemoveEntity( self )
		local dmg = DamageInfo()  dmg:SetDamagePosition( ent:GetPos() ) dmg:SetDamageForce( VectorRand():GetNormal()*1024 )
		dmg:SetDamageType( DMG_SHOCK ) dmg:SetAttacker( self:GetFMod_OW() ) dmg:SetInflictor( self )
		dmg:SetDamage( 25 ) ent:TakeDamageInfo( dmg )
		ent:SetName( ent:GetName() != "" and ent:GetName() or "["..ent:EntIndex().."]xdefm_dissolved" )
		local ef = EffectData() ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetEntity( self ) ef:SetRadius( 5 )
		ef:SetScale( 2 ) ef:SetMagnitude( 5 ) ef:SetNormal( Vector( 0, 0, 1 ) ) util.Effect( "ElectricSpark", ef )
		local ta1 = ents.Create( "info_target" ) ta1:SetPos( self:GetPos() ) local na1 = "["..ta1:EntIndex().."]xdefm_point"
		ta1:SetName( na1 ) ta1:Spawn() ta1:Activate()
		local ta2 = ents.Create( "info_target" ) ta2:SetPos( ent:GetPos() ) local na2 = "["..ta2:EntIndex().."]xdefm_point"
		ta2:SetName( na2 ) ta2:Spawn() ta2:Activate() local las = ents.Create( "env_beam" )
		las:SetPos( self:GetPos() ) las:SetKeyValue( "LightningStart", na1 )
		las:SetKeyValue( "LightningEnd", na2 ) las:SetKeyValue( "BoltWidth", "1" )
		las:SetKeyValue( "renderamt", "255" ) las:SetKeyValue( "rendercolor", "255 255 255" )
		las:SetKeyValue( "damage", "0" ) las:SetKeyValue( "ClipStyle", "3" )
		las:SetKeyValue( "framerate", "10" ) las:SetKeyValue( "dissolvetype", "0" )
		las:SetKeyValue( "targetname", "las" ) las:SetKeyValue( "texture", "sprites/laserbeam.vmt" )
		las:SetKeyValue( "TextureScroll", "10" ) las:SetKeyValue( "NoiseAmplitude", "10" )
		las:SetOwner( self ) las:Spawn() las:Activate()
		las:Fire( "TurnOn" ) ent:DeleteOnRemove( las ) las:DeleteOnRemove( ta1 ) las:DeleteOnRemove( ta2 )
		SafeRemoveEntityDelayed( las, 0.25 )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_treasure"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props/cs_militia/footlocker01_closed.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 4, Price = 2000 }
	function ITEM:OnInit( self ) self:SetMaxHealth( 200 ) self:SetHealth( self:GetMaxHealth() ) self.xdefm_Killed = false end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 50 ) end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Wood.Break" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local lt = {["it_coin"]=200,["it_silverbar"]=20,["it_goldbar"]=20,["it_coin2"]=20,
		["it_gemblue"]=1,["it_gemgreen"]=1,["it_gempurple"]=1,["it_gemred"]=1}
		for i=1, math.random( 4, 6 ) do xdefm_LootDrop( lt, self ) end
		xdefm_BreakEffect( self, 1 ) self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_cooler"
	local ITEM = { Name = "#xdefm."..it, Type = "Struct", Model = "models/props_interiors/water_cooler.mdl", Helper = "#xdefm.d"..it,
	Rarity = 3, Price = 1000, Carryable = false, TickRate = 1, PhysSound = "Plastic_Box.ImpactHard", HelperUse = "xdefm.U3", SType = 3, StartSound = "Buttons.snd1", ExitSound = "NPC.ButtonLatchUnlocked2" }
	ITEM.Shop = { [ "it_water" ] = { 400, 0 } }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_ejunk"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props_lab/harddrive01.mdl", "models/props_lab/harddrive02.mdl", "models/props_lab/monitor01a.mdl",
	"models/props_lab/monitor01b.mdl", "models/props_lab/monitor02.mdl", "models/props_c17/computer01_keyboard.mdl"}
	, Helper = "#xdefm.d"..it, Rarity = 1, Price = 60, KillInWater = true, PhysSound = "SolidMetal.ImpactSoft" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_jumppad"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/maxofs2d/hover_plate.mdl",
	Helper = "#xdefm.d"..it, Rarity = 2, PhysSound = "SolidMetal.ImpactSoft", Price = 300 }
	function ITEM:OnInit( self ) self.xdefm_Used = false  self.xdefm_Touch = 0  self:SetCollisionGroup( COLLISION_GROUP_WEAPON ) end
	function ITEM:OnReady( self ) self:SetTrigger( true ) end
	function ITEM:OnTouch( self, ent ) if self.xdefm_Used or self.xdefm_Touch > CurTime() then return end
		if ( !ent:IsPlayer() and !ent:IsNPC() ) then return end
		xdefm_BroadEffect( "Sparks", { Origin = self:GetPos(), self:GetUp(), Scale = 2, Magnitude = 1, Radius = 2 } )
		self.xdefm_Touch = CurTime() +1  self:EmitSound( ")weapons/ar2/ar2_altfire.wav" )
		local vel = ent:GetVelocity()  vel.z = 512
		ent:SetVelocity( vel )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "cr_pigeon"
	local ITEM = { Name = "#xdefm."..it, Type = "Creature", Model = "models/pigeon.mdl",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 500, TickRate = 0.1, MinSize = 0.8, MaxSize = 1.2 }
	function ITEM:OnInit( self ) self:SetMaxHealth( 15 ) self:SetHealth( self:GetMaxHealth() )
		self:PhysicsInitBox( self:OBBMins()/3, self:OBBMaxs()/3 ) self:SetAutomaticFrameAdvance( true )
		self:SetCollisionGroup( COLLISION_GROUP_WORLD ) self:SetBloodColor( BLOOD_COLOR_RED )
		self:GetPhysicsObject():SetMaterial( "flesh" ) self:ResetSequence( "Fly01" ) self:SetPlaybackRate( 1 )
		self.xdefm_NT = 0  self.xdefm_TPos = nil  self.ShadowParams = {}  self.xdefm_TickGone = 0  self.xdefm_NextSnd = 0
		self.xdefm_Killed = false  xdefm_NoTool( self )  self.xdefm_Target, self.xdefm_Catch = nil, nil
		self.xdefm_NextFind = 0
		return true
	end
	function ITEM:OnReady( self ) self:StartMotionController() self:PhysWake() self:GetPhysicsObject():SetMass( 100 )
		if !self.xdefm_Killed then self:EmitSound( "NPC_Pigeon.Idle" ) end self:SetTrigger( true )
	end
	function ITEM:OnPlayerDrop( self, own ) self:SetHealth( 0 ) xdefm_NoTool( self, true )
		self:SetColor( Color( 255, 155, 155 ) ) self:ResetSequence( "Fly01" ) self:SetPlaybackRate( 0 ) self.xdefm_Killed = true
		if IsValid( self.xdefm_Trail ) then self.xdefm_Trail:Remove() end self:SetCollisionGroup( COLLISION_GROUP_NPC )
	end
	function ITEM:OnThink( self ) if self.xdefm_Killed then return end local seq = self:GetSequenceName( self:GetSequence() )
		if math.random( 1, 30 ) == 1 and self.xdefm_NextSnd <= CurTime() then
			self.xdefm_NextSnd = CurTime() +math.Rand( 2, 4 )  self:EmitSound( "NPC_Pigeon.Idle" )
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
		end
	end
	function ITEM:OnDamaged( self, dmg ) if self.xdefm_Killed then return end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) )
		if self:Health() <= 0 then self.xdefm_Killed = true
			self:SetColor( Color( 255, 155, 155 ) ) self:SetPlaybackRate( 0 )
		end
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
				local num = math.sin( CurTime() +self:EntIndex()*10 )
				self.xdefm_TPos = self.xdefm_Target:WorldSpaceCenter()
				+Vector( 0, 0, self.xdefm_Target:OBBMaxs().z/( 2.5 +num/4 ) ) +Angle( 0, ( self:EntIndex() +CurTime() )*20, 0 ):Forward()*dis
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
		self.ShadowParams.angle = isvector( self.xdefm_TPos ) and ( self.xdefm_TPos -self:GetPos() ):Angle() or self:GetAngles()
		self.ShadowParams.maxangular = 1000
		self.ShadowParams.maxangulardamp = 10000
		self.ShadowParams.maxspeed = 400
		self.ShadowParams.maxspeeddamp = 10000
		self.ShadowParams.dampfactor = 0.8
		self.ShadowParams.teleportdistance = 0
		self.ShadowParams.deltatime = deltatime
		if isvector( self.xdefm_TPos ) then phy:ComputeShadowControl( self.ShadowParams ) end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_printer"
	local ITEM = { Name = "#xdefm."..it, Type = "Struct", Model = "models/props_interiors/printer.mdl", Helper = "#xdefm.d"..it,
	Rarity = 3, Price = 1000, Carryable = false, TickRate = 1, PhysSound = "Computer.ImpactHard", HelperUse = "xdefm.U3", SType = 2, StartSound = "Buttons.snd4", ExitSound = "NPC.ButtonLatchUnlocked2" }
    ITEM.Crafts = {
		"it_chemical&it_paper&it_expr",
		"it_expr&it_expr&it_expr&it_expr&it_exps",
		"it_expr&it_expr&it_expr&it_exp1",
		"it_exp1&it_exp1&it_exp1&it_exp1&it_exp2",
    }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_server"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_lab/reciever_cart.mdl", Helper = "#xdefm.d"..it, CantCook = true,
	Rarity = 4, Price = 1500, Carryable = false, TickRate = 1, PhysSound = "Computer.ImpactHard", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Delay = 0  self.xdefm_Exps = 0 end
	function ITEM:OnUse( self, ent ) if ent:KeyDown( IN_SPEED ) then return true end
		if self.xdefm_Exps <= 0 then self:EmitSound( "Buttons.snd2" ) else
			xdefm_GiveExp( ent, self.xdefm_Exps ) self:SetNWFloat( "XDEFM_EX", 0 )
			xdefm_AddNote( ent, "xdefm.GetEXP&: "..self.xdefm_Exps, "buttons/bell1.wav", "medal_gold_1", 5 )
			self:EmitSound( "Buttons.snd3" ) self.xdefm_Delay = 0  self.xdefm_Exps = 0
			self:SetColor( Color( 255, 255, 255 ) )
		end return false
	end
	function ITEM:OnThink( self ) if self.xdefm_Exps >= 500 then return end
		if self.xdefm_Delay < 20 then self.xdefm_Delay = self.xdefm_Delay +1
			if self.xdefm_Delay >= 20 then self.xdefm_Delay = 0
				self.xdefm_Exps = self.xdefm_Exps +1
				self:SetNWFloat( "XDEFM_EX", self.xdefm_Exps ) self:SetColor( Color( 155, 255, 255 ) )
			end
		end
	end
	function ITEM:OnDraw( self )
		local txt = tostring( math.Round( self:GetNWFloat( "XDEFM_EX" ) ) )
		surface.SetFont( "HudHintTextLarge" )  local xx, yy = surface.GetTextSize( txt )
		cam.Start3D2D( self:WorldSpaceCenter() +self:GetForward()*15 -self:GetUp()*22 -self:GetRight()*4, self:LocalToWorldAngles( Angle( 0, 90, 90 ) ), 0.2 )
			draw.RoundedBox( 0, -xx/2 -8, -yy/2 -150 -8, xx +16, yy +16, Color( 0, 0, 0, 155 ) )
			draw.TextShadow( { text = txt, pos = { 0, -150 }, font = "HudHintTextLarge",
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		cam.End3D2D()
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_tesla"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_trainstation/trainstation_ornament002.mdl", Helper = "#xdefm.d"..it, CantCook = true,
	Rarity = 5, Price = 4000, Carryable = false, TickRate = 0.2, PhysSound = "Computer.ImpactHard" }
	function ITEM:OnInit( self ) self.xdefm_Cool = 0  self.xdefm_Charge = 0 end
	function ITEM:OnTouch( self, ent, typ ) if typ != 1 or self.xdefm_Cool > CurTime() or self.xdefm_Charge >= 15 then return end self.xdefm_Cool = CurTime() +0.5
		if ent:GetClass() == "xdefm_base" and ent:IsPlayerHolding() then
			self.xdefm_Cool = CurTime() +0.1  local cls = xdefm_GetClass( ent )
			if ( cls == "it_armor" or cls == "it_refill" ) and !ent.xdefm_Trashed then
				self:EmitSound( "Weapon_PhysCannon.Charge" ) ent.xdefm_Trashed = true  ent:Remove()
				self.xdefm_Charge = self.xdefm_Charge +3
				if self.xdefm_Charge >= 1 then self:SetColor( Color( 155, 255, 255 ) ) end
			end
		end
	end
	function ITEM:OnThink( self ) if self.xdefm_Charge <= 0 or self.xdefm_Cool > CurTime() then return end local ent = nil
		for k, v in pairs( ents.FindInSphere( self:GetPos(), 512 ) ) do if v:GetClass() == "xdefm_base" and !v.xdefm_Killed and
			v:Health() > 0 and ( xdefm_GetClass( v ) == "cr_seagull" or xdefm_GetClass( v ) == "cr_crow" ) then ent = v break end end
		if !IsValid( ent ) then return end self:EmitSound( "Airboat.FireGunHeavy" )
		self.xdefm_Charge = self.xdefm_Charge -1  self.xdefm_Cool = CurTime() +0.25
		if self.xdefm_Charge <= 0 then self:SetColor( Color( 255, 255, 255 ) ) end
		local dmg = DamageInfo()  dmg:SetDamagePosition( ent:GetPos() ) dmg:SetDamageForce( VectorRand():GetNormal()*1024 )
		dmg:SetDamageType( DMG_SHOCK ) dmg:SetAttacker( self:GetFMod_OW() ) dmg:SetInflictor( self )
		dmg:SetDamage( 20 ) ent:TakeDamageInfo( dmg )
		ent:SetName( ent:GetName() != "" and ent:GetName() or "["..ent:EntIndex().."]xdefm_dissolved" )
		local ef = EffectData() ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetEntity( self ) ef:SetRadius( 5 )
		ef:SetScale( 2 ) ef:SetMagnitude( 5 ) ef:SetNormal( Vector( 0, 0, 1 ) ) util.Effect( "ElectricSpark", ef )
		local ta1 = ents.Create( "info_target" ) ta1:SetPos( self:GetPos() ) local na1 = "["..ta1:EntIndex().."]xdefm_point"
		ta1:SetName( na1 ) ta1:Spawn() ta1:Activate()
		local ta2 = ents.Create( "info_target" ) ta2:SetPos( ent:GetPos() ) local na2 = "["..ta2:EntIndex().."]xdefm_point"
		ta2:SetName( na2 ) ta2:Spawn() ta2:Activate() local las = ents.Create( "env_beam" )
		las:SetPos( self:GetPos() ) las:SetKeyValue( "LightningStart", na1 )
		las:SetKeyValue( "LightningEnd", na2 ) las:SetKeyValue( "BoltWidth", "1" )
		las:SetKeyValue( "renderamt", "255" ) las:SetKeyValue( "rendercolor", "255 255 255" )
		las:SetKeyValue( "damage", "0" ) las:SetKeyValue( "ClipStyle", "3" )
		las:SetKeyValue( "framerate", "10" ) las:SetKeyValue( "dissolvetype", "0" )
		las:SetKeyValue( "targetname", "las" ) las:SetKeyValue( "texture", "sprites/laserbeam.vmt" )
		las:SetKeyValue( "TextureScroll", "10" ) las:SetKeyValue( "NoiseAmplitude", "5" )
		las:SetOwner( self ) las:Spawn() las:Activate()
		las:Fire( "TurnOn" ) ent:DeleteOnRemove( las ) las:DeleteOnRemove( ta1 ) las:DeleteOnRemove( ta2 )
		SafeRemoveEntityDelayed( las, 0.25 )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_flower"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_collectables/flower.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 3, Price = 400, TickRate = 1, PhysSound = "Sand.BulletImpact" }
	function ITEM:OnInit( self ) self:NextThink( CurTime() +3 ) end
	function ITEM:OnThink( self )
		for k, v in pairs( ents.FindInSphere( self:WorldSpaceCenter(), 64 ) ) do
			if ( !v:IsPlayer() and !v:IsNPC() ) or v == self then continue end
			if ( v:IsPlayer() and !v:Alive() ) or ( v:IsNPC() and v:GetNPCState() == NPC_STATE_DEAD ) then continue end
			v:SetHealth( math.min( v:GetMaxHealth(), v:Health() +1 ) )
			if v:IsPlayer() and v:Armor() < 100 then
				v:SetArmor( math.min( 100, v:Armor() +1 ) )
			end
		end
	end
	function ITEM:OnDraw( self )
		if !self.Emitter or !IsValid( self.Emitter ) then self.Emitter = ParticleEmitter( self:WorldSpaceCenter() )
			self:CallOnRemove( "XDEEmitter", function( self ) if self.Emitter then self.Emitter:Finish() end end )
		else
			if !isnumber( self.xdefm_Ptc ) or self.xdefm_Ptc <= CurTime() then self.xdefm_Ptc = CurTime() +0.1
				local particle = self.Emitter:Add( "sprites/glow04_noz", self:WorldSpaceCenter() +VectorRand():GetNormalized()*6 )
				particle:SetVelocity( VectorRand():GetNormal()*5 )
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
				particle:SetGravity( Vector( 0, 0, 25 ) )
				particle:SetColor( 55, 255, 255 )
				particle:SetCollide( false )
				particle:SetBounce( 0 )
				particle:SetLighting( false )
				local particl2 = self.Emitter:Add( "particle/particle_smokegrenade1", self:WorldSpaceCenter() +VectorRand():GetNormalized()*2 )
				particl2:SetVelocity( VectorRand():GetNormalized()*5 )
				particl2:SetLifeTime( 0 )
				particl2:SetDieTime( math.Rand( 0.75, 1.5 ) )
				particl2:SetStartAlpha( 155 )
				particl2:SetEndAlpha( 0 )
				particl2:SetStartSize( 2 )
				particl2:SetEndSize( 4 )
				particl2:SetRoll( math.Rand( 0, 360 ) )
				particl2:SetRollDelta( math.Rand( -1, 1 ) )
				particl2:SetColor( 55, 255, 255 )
				particl2:SetGravity( Vector( 0, 0, 0 ) )
				particl2:SetAirResistance( 0 )
				particl2:SetCollide( false )
				particl2:SetBounce( 0 )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_stove4"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_wasteland/kitchen_stove001a.mdl", Helper = "#xdefm.d"..it,
	Rarity = 4, Price = 2000, Carryable = false, HelperUse = "xdefm.U4", TickRate = 1, PhysSound = "Metal_Barrel.ImpactHard", CantCook = true }
	function ITEM:OnInit( self )  self.xdefm_Enabled = 0  self.xdefm_Spots = {}  self.xdefm_Pressed = 0  self.xdefm_Level = 0
	end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( math.ceil( self:GetPhysicsObject():GetMass()*0.1 ) ) end
	function ITEM:OnUse( self, ent ) if self.xdefm_Pressed > CurTime() then return false end self.xdefm_Pressed = CurTime() +0.5
		if ent:KeyDown( IN_SPEED ) then return true end
		self.xdefm_Enabled = ( CurTime() +600 )
		self.xdefm_Level = ( self.xdefm_Level < 3 and self.xdefm_Level +1 or 0 )  local lvl = self.xdefm_Level
		self:EmitSound( lvl > 0 and "buttons/blip1.wav" or "buttons/button10.wav", 75, 90 +self.xdefm_Level*10 )
		for k, v in pairs( self.xdefm_Spots ) do if IsValid( v ) then v:Remove() end end
		self.xdefm_Spots[ 1 ] = xdefm_FireSpot( self:LocalToWorld(Vector(6,25,40)), lvl*2, lvl*5, self )
		self.xdefm_Spots[ 2 ] = xdefm_FireSpot( self:LocalToWorld(Vector(6,12,40)), lvl*2, lvl*5, self )
		self.xdefm_Spots[ 3 ] = xdefm_FireSpot( self:LocalToWorld(Vector(-7,25,40)), lvl*2, lvl*5, self )
		self.xdefm_Spots[ 4 ] = xdefm_FireSpot( self:LocalToWorld(Vector(-7,12,40)), lvl*2, lvl*5, self )
		for i=1, 4 do self.xdefm_Spots[ i ]:SetFMod_Enable( true ) end
		return false
	end
	function ITEM:OnThink( self ) if self.xdefm_Enabled > CurTime() or self.xdefm_Enabled <= 0 then return end
		self.xdefm_Enabled = 0  self:EmitSound( "buttons/button10.wav", 75, 90 )  self.xdefm_Pressed = 0  self.xdefm_Level = 0
		for k, v in pairs( self.xdefm_Spots ) do if !IsValid( v ) then continue end v:Remove() end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_stove5"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/maxofs2d/hover_propeller.mdl", Helper = "#xdefm.d"..it,
	Rarity = 5, Price = 3500, Carryable = false, HelperUse = "xdefm.U4", TickRate = 0.1, PhysSound = "Metal_Barrel.ImpactHard", CantCook = true }
	function ITEM:OnInit( self ) self:SetNWBool( "FMod_On", false )  self:SetNWFloat( "FMod_PR", 0 )
		self.xdefm_Spot = xdefm_FireSpot( self:LocalToWorld(Vector(0,0,25)), 8, 10, self ) self.xdefm_Spot:SetNoDraw( true )
	end
	function ITEM:OnUse( self, ent )
		if ent:KeyDown( IN_SPEED ) then return true end
		self:SetNWBool( "FMod_On", !self:GetNWBool( "FMod_On" ) ) local bb = self:GetNWBool( "FMod_On" )
		self:EmitSound( bb and "buttons/button1.wav" or "buttons/button10.wav", 75, 110 )
		self.xdefm_Spot:SetFMod_Enable( bb )
		self:SetNWFloat( "FMod_PR", 0 )
		return false
	end
	function ITEM:OnThink( self ) if !self:GetNWBool( "FMod_On" ) or !IsValid( self.xdefm_Spot ) then return end
		local tr = util.TraceHull( {
			start = self:WorldSpaceCenter() +Vector( 0, 0, 5 ), endpos = self:WorldSpaceCenter() +Vector( 0, 0, 15 ),
			filter = self, mask = MASK_SHOT, mins = Vector( -5, -5, -5 ), maxs = Vector( 5, 5, 5 )
		} )
		if tr.Hit and tr.Entity:GetClass() == "xdefm_base" then
			local met = xdefm_CookMeter( tr.Entity:GetFMod_DT() )
			self:SetNWFloat( "FMod_PR", met*100 )
			local aa, bb = xdefm_ItemGet( tr.Entity )
			if !istable( aa ) or !istable( bb ) or bb.Type == "Bait" or bb.Type == "Recipe" then return end
			local met, mex = tonumber( aa[ #aa ] ), math.ceil( bb.Rarity*100 )
			if met +10 >= mex and ( met +10 != mex or met == mex ) then
				self:SetNWBool( "FMod_On", false ) local bb = self:GetNWBool( "FMod_On" )
				self:EmitSound( "buttons/button10.wav", 75, 110 )
				self.xdefm_Spot:SetFMod_Enable( false )
			end
		end
	end
	local Mat = Material( "particle/particle_glow_02" )  local Ma2 = Material( "particle/warp1_warp" )
	function ITEM:OnDraw( self ) local pos = self:WorldSpaceCenter() +self:GetUp()*10
		local txt = tostring( math.Round( self:GetNWFloat( "FMod_PR" ) ) ).."%"
		local col = 255 -math.Clamp( self:GetNWFloat( "FMod_PR" )/100, 0, 1 )*255
		surface.SetFont( "HudHintTextLarge" )  local xx, yy = surface.GetTextSize( txt )
		cam.Start3D2D( self:WorldSpaceCenter() -self:GetForward()*9 -self:GetUp()*25, self:LocalToWorldAngles( Angle( 0, -90, 90 ) ), 0.2 )
			draw.RoundedBox( 0, -xx/2 -8, -yy/2 -150 -8, xx +16, yy +16, Color( 0, 0, 0, 155 ) )
			draw.TextShadow( { text = txt, pos = { 0, -150 }, font = "HudHintTextLarge",
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( col, 255, col ) }, 1, 255 )
		cam.End3D2D()
		if !self:GetNWBool( "FMod_On" ) then return end
		render.SetMaterial( Ma2 ) local siz = 25 +math.cos( CurTime()*5 )*5
		render.DrawSprite( pos, siz/2, siz/2, Color( 255, 255, 255 ) )
		render.SetMaterial( Mat ) render.DrawSprite( pos, siz, siz, Color( 55, 255, 255, 55 ) )
		if ( !isnumber( self.xdefm_Pa1 ) or self.xdefm_Pa1 <= CurTime() ) then self.xdefm_Pa1 = CurTime() +0.1
			if !self.Emit or !IsValid( self.Emit ) then
				self.Emit = ParticleEmitter( pos, false )
				self:CallOnRemove( "XDEEmitter", function( self ) if self.Emit then self.Emit:Finish() end end )
			else
				local particle = self.Emit:Add( "particle/particle_glow_02", pos +VectorRand():GetNormalized()*4 )
				particle:SetVelocity( VectorRand():GetNormalized()*5 +Vector( 0, 0, 20 ) )
				particle:SetColor( 0, 255, 255 )
				particle:SetDieTime( math.Rand( 1, 2 ) )
				particle:SetStartAlpha( 155 )
				particle:SetEndAlpha( 0 )
				local siz = math.Rand( 4, 8 )
				particle:SetStartSize( siz )
				particle:SetEndSize( siz )
				particle:SetRoll( math.Rand( 0, 360 ) )
				particle:SetRollDelta( math.Rand( -3, 3 ) )

				local particle = self.Emit:Add( "particle/particle_glow_03", pos +VectorRand():GetNormalized()*6 )
				particle:SetVelocity( Vector( 0, 0, 12 ) )
				particle:SetColor( 0, 255, 255 )
				particle:SetDieTime( math.Rand( 0.5, 0.75 ) )
				particle:SetStartAlpha( 155 )
				particle:SetEndAlpha( 0 )
				local siz = math.Rand( 4, 6 )
				particle:SetStartSize( siz )
				particle:SetEndSize( siz )
				particle:SetStartLength( siz )
				particle:SetEndLength( siz*2 )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_microwave"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props/cs_office/microwave.mdl", Helper = "#xdefm.d"..it,
	Rarity = 5, Price = 4000, Carryable = false, HelperUse = "xdefm.U4", TickRate = 0.1, PhysSound = "SolidMetal.ImpactSoft", CantCook = true }
	function ITEM:OnInit( self ) self:SetNWBool( "FMod_On", false )  self:SetNWFloat( "FMod_PR", 0 )
		self.xdefm_Item = "_"  self.xdefm_Cool = 0  self.xdefm_Snd = nil
	end
	function ITEM:OnUse( self, ent )
		if ent:KeyDown( IN_SPEED ) then return true end
		if self.xdefm_Item == "_" then self:EmitSound( "buttons/button10.wav" ) self:GetPhysicsObject():AddVelocity( VectorRand():GetNormalized()*8 )
		else
			if xdefm_ItemGive( ent, self.xdefm_Item ) then
				if self.xdefm_Snd then self.xdefm_Snd:Stop() end
				self:EmitSound( "Doors.FullOpen1" ) self.xdefm_Item = "_"
				self:SetNWFloat( "FMod_PR", 0 )
				self:SetNWBool( "FMod_On", false )
			end
		end
		return false
	end
	function ITEM:OnThink( self ) if !self:GetNWBool( "FMod_On" ) or self.xdefm_Item == "_" then return end
		local aa, bb = xdefm_ItemGet( self.xdefm_Item )
		if !istable( bb ) or bb.Type == "Bait" or bb.Type == "Recipe" then return end
		local met, me2 = aa[ #aa ], bb.Rarity*100
		aa[ #aa ] = math.min( me2, aa[ #aa ]+1 )
		self:SetNWFloat( "FMod_PR", aa[ #aa ]/me2*100 or 0 )
		self.xdefm_Item = table.concat( aa, "|" )
		if aa[ #aa ] >= me2 then
			if self.xdefm_Snd then self.xdefm_Snd:Stop() end
			self:EmitSound( "plats/elevbell1.wav" )
			self:SetNWBool( "FMod_On", false )
		end
	end
	function ITEM:OnRemove( self ) if self.xdefm_Snd then self.xdefm_Snd:Stop()  self.xdefm_Snd = nil end end
	function ITEM:OnTouch( self, ent, typ ) if typ != 1 or self.xdefm_Cool > CurTime() or self.xdefm_Item != "_" then return end self.xdefm_Cool = CurTime() +0.5
		if ent:GetClass() == "xdefm_base" and ent:IsPlayerHolding() and ent:Health() <= 0 and !ent.xdefm_Trashed then
			local aa, bb = xdefm_ItemGet( ent )
			if !istable( bb ) or bb.CantCook or !bb.Carryable or bb.Type == "Bait" or bb.Type == "Recipe" then return end
			self:EmitSound( "Doors.FullClose1" ) ent.xdefm_Trashed = true  ent:Remove()
			self.xdefm_Snd = CreateSound( self, "ambient/machines/combine_shield_loop3.wav" )
			self.xdefm_Snd:Play()  self.xdefm_Item = ent:GetFMod_DT()  self:SetNWBool( "FMod_On", true )
		end
	end
	function ITEM:OnDraw( self ) local pos = self:WorldSpaceCenter() +self:GetUp()*10
		local txt = tostring( math.ceil( self:GetNWFloat( "FMod_PR" ) ) ).."%"
		local col = 255 -math.Clamp( self:GetNWFloat( "FMod_PR" )/100, 0, 1 )*255
		surface.SetFont( "HudHintTextLarge" )  local xx, yy = surface.GetTextSize( txt )
		cam.Start3D2D( self:WorldSpaceCenter() -self:GetRight()*11 -self:GetUp()*30 +self:GetForward()*5, self:LocalToWorldAngles( Angle( 0, 180, 90 ) ), 0.2 )
			draw.RoundedBox( 0, -xx/2 -8, -yy/2 -150 -8, xx +16, yy +16, Color( 0, 0, 0, 155 ) )
			draw.TextShadow( { text = txt, pos = { 0, -150 }, font = "HudHintTextLarge",
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( col, 255, col ) }, 1, 255 )
		cam.End3D2D()
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_wood2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_debris/wood_board06a.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 100, PhysSound = "Wood.ImpactSoft" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_stone2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props/de_prodigy/concretebags4.mdl", Helper = "#xdefm.d"..it,
	Rarity = 3, Price = 400, PhysSound = "Concrete.ImpactHard" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_metal2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_debris/metal_panelchunk02e.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 250, PhysSound = "SolidMetal.ImpactHard" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_glass2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_phx/construct/glass/glass_plate1x1.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 160, PhysSound = "Glass.ImpactHard" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_glass3"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_phx/construct/windows/window1x1.mdl", Helper = "#xdefm.d"..it,
	Rarity = 3, Price = 900, PhysSound = "SolidMetal.ImpactHard" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_plastic"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_phx/construct/plastic/plastic_panel1x1.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 100, PhysSound = "Plastic_Barrel.ImpactHard" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_bag1"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/garbage_bag001a.mdl",
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 0, PhysSound = "Cardboard.ImpactSoft", HelperUse = "xdefm.U2" }
	ITEM.Constants = { Exp = 50, Money = 1000 }
	ITEM.Constants.Loot = {["it_bait1"]=1,["it_recipe1"]=1}
	local Mat = Material( "particle/particle_glow_04" )
	function ITEM:OnInit( self ) self.xdefm_Killed = false end
	function ITEM:OnUse( self, ent ) if self.xdefm_Killed then return end
		if ent:KeyDown( IN_SPEED ) then return true end local pro = ent.xdefm_Profile
		local rew = xdefm_LootDrop( self.xdefm_T2.Constants.Loot )  if rew then
			if !xdefm_ItemGive( ent, rew ) then return false end
			self.xdefm_Killed = true  xdefm_BroadEffect( "xdefm_present", { Origin = self:WorldSpaceCenter() } )
			local exp, mon = self.xdefm_T2.Constants.Exp, self.xdefm_T2.Constants.Money
			xdefm_AddNote( ent, "xdefm.GetEXP&: "..math.ceil( math.Rand( exp/2, exp*1.5 ) ), "!V", "medal_gold_1", 5 )
			xdefm_AddNote( ent, "xdefm.GetMoney&: "..math.ceil( math.Rand( mon/2, mon*1.5 ) ), "!V", "coins", 5 )
			xdefm_SendSnd( ent, "misc/happy_birthday.wav" )
			self:Remove() xdefm_GiveExp( ent, exp ) xdefm_GiveMoney( ent, mon )
		end return false
	end
	function ITEM:OnDraw( self )
		local aa, bb = xdefm_ItemGet( self )  local col = xdefm.miscs.Rarity[ bb.Rarity +1 ]
		render.SetMaterial( Ma2 ) local siz = 26 +math.sin( CurTime()*5 )*2
		render.DrawSprite( self:WorldSpaceCenter(), siz, siz, Color( col.r, col.g, col.b, 55 ) )
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_bag2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/garbage_bag001a.mdl",
	Helper = "#xdefm.d"..it, Rarity = 3, Price = 0, PhysSound = "Cardboard.ImpactSoft", HelperUse = "xdefm.U2" }
	ITEM.Constants = { Exp = 125, Money = 2500 }
	ITEM.Constants.Loot = {["it_bait2"]=1,["it_recipe1"]=1}
	xdefm_ItemBased( "it_bag1", it, ITEM )
end
if true then local it = "it_bag3"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/garbage_bag001a.mdl",
	Helper = "#xdefm.d"..it, Rarity = 4, Price = 0, PhysSound = "Cardboard.ImpactSoft", HelperUse = "xdefm.U2" }
	ITEM.Constants = { Exp = 250, Money = 5000 }
	ITEM.Constants.Loot = {["it_bait3"]=1,["it_recipe2"]=1}
	xdefm_ItemBased( "it_bag1", it, ITEM )
end
if true then local it = "it_bag4"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/garbage_bag001a.mdl",
	Helper = "#xdefm.d"..it, Rarity = 5, Price = 0, PhysSound = "Cardboard.ImpactSoft", HelperUse = "xdefm.U2" }
	ITEM.Constants = { Exp = 400, Money = 10000 }
	ITEM.Constants.Loot = {["it_bait4"]=1,["it_recipe3"]=1}
	xdefm_ItemBased( "it_bag2", it, ITEM )
end
if true then local it = "it_miner"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_silo/silo_server_b.mdl", Helper = "#xdefm.d"..it, CantCook = true,
	Rarity = 4, Price = 2000, Carryable = false, TickRate = 1, PhysSound = "Computer.ImpactHard", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Delay = 0  self.xdefm_Exps = 0 end
	function ITEM:OnUse( self, ent ) if ent:KeyDown( IN_SPEED ) then return true end
		if self.xdefm_Exps <= 0 then self:EmitSound( "Buttons.snd2" ) else
			xdefm_GiveMoney( ent, self.xdefm_Exps ) self:SetNWFloat( "XDEFM_EX", 0 )
			xdefm_AddNote( ent, "xdefm.GetMoney&: "..self.xdefm_Exps, "!V", "coins", 5 )
			self:EmitSound( "Buttons.snd3" ) self.xdefm_Delay = 0  self.xdefm_Exps = 0
			self:SetColor( Color( 255, 255, 255 ) )
		end return false
	end
	function ITEM:OnThink( self ) if self.xdefm_Exps >= 10000 then return end
		if self.xdefm_Delay < 2 then self.xdefm_Delay = self.xdefm_Delay +1
			if self.xdefm_Delay >= 2 then self.xdefm_Delay = 0
				self.xdefm_Exps = self.xdefm_Exps +1
				self:SetNWFloat( "XDEFM_EX", self.xdefm_Exps ) self:SetColor( Color( 155, 255, 255 ) )
			end
		end
	end
	function ITEM:OnDraw( self )
		local txt = tostring( math.Round( self:GetNWFloat( "XDEFM_EX" ) ) )
		surface.SetFont( "HudHintTextLarge" )  local xx, yy = surface.GetTextSize( txt )
		cam.Start3D2D( self:WorldSpaceCenter() +self:GetForward()*15 -self:GetUp()*22 -self:GetRight()*4, self:LocalToWorldAngles( Angle( 0, 90, 90 ) ), 0.2 )
			draw.RoundedBox( 0, -xx/2 -8, -yy/2 -150 -8, xx +16, yy +16, Color( 0, 0, 0, 155 ) )
			draw.TextShadow( { text = txt, pos = { 0, -150 }, font = "HudHintTextLarge",
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		cam.End3D2D()
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_cage"
	local ITEM = { Name = "#xdefm."..it, Type = "Struct", Model = "models/lostcoast/props_wasteland/crabpot.mdl", Helper = "#xdefm.d"..it, ExitSound = "Doors.FullClose6",
	Rarity = 2, Price = 400, TickRate = 0.1, PhysSound = "SolidMetal.ImpactSoft", HelperUse = "xdefm.U3", SType = 1, Amount = 6, StartSound = "Doors.FullOpen6" }
	function ITEM:OnInit( self ) self.xdefm_Delay = 0  self.xdefm_Dums = {} end
	function ITEM:C_DummySet( self ) local hl, ct = self.xdefm_T3, self.xdefm_Dums
		for k, v in pairs( ct ) do if IsValid( v ) then v:Remove() end end self.xdefm_Dums = {}
		for k, v in pairs( hl ) do if v == "_" then continue end  local vel = VectorRand()*5  vel.z = 5
			local dum = xdefm_DummySpawn( v, self:LocalToWorld( vel ), Angle( 0, math.random( 0, 360 ), 0 ), self:GetFMod_OW() )
			dum:SetParent( self ) self:DeleteOnRemove( dum )
			if IsValid( dum ) then dum:SetParent( self ) self:DeleteOnRemove( dum ) table.insert( self.xdefm_Dums, dum ) end
		end self.xdefm_Delay = CurTime() +0.5
	end
	function ITEM:OnInteract( self, ent, typ )
		if typ == 0 and isstring( dat1 ) then dat1 = tonumber( dat1 )
			if isnumber( dat1 ) and ply.xdefm_Profile and ply.xdefm_Profile.Items[ dat1 ] != "_" then
				return false
			end
		end
		if typ == -1 then ITEM:C_DummySet( self ) end
	end
	function ITEM:OnThink( self ) if self.xdefm_Delay > CurTime() or self.xdefm_Bait == "_" then return end
		if self:WaterLevel() < 3 then return end local tr = util.QuickTrace( self:GetPos(), -Vector( 0, 0, 15 ), self )  if !tr.HitWorld then return end
		local slo, bai = 0, "_"
		for k, v in pairs( self.xdefm_T3 ) do if v != "_" then local xx, yy = xdefm_ItemGet( v ) if yy and yy.Type == "Bait" then slo = k  bai = v break end end end
		local aa, bb = xdefm_ItemGet( bai )
		local ite = xdefm_PoolGet( math.random( 0, 10 ), 100, bai, 0, false )  if ite == nil then return end
		local cc, dd = xdefm_ItemGet( ite )  if !istable( dd ) or dd.Type != "Creature" or !dd.Carryable then return end
		if isnumber( dd.MinSize ) and isnumber( dd.MaxSize ) then ite = ite.."|"..math.Round( math.Rand( dd.MinSize, dd.MaxSize ), 1 ) end
		if math.random( 1, bb.Consume ) == 1 then
			self:EmitSound("ambient/water/water_spray1.wav", 75, math.random( 95, 105 ), 1, CHAN_ITEM ) self.xdefm_T3[ slo ] = "_"
			for k, v in pairs( player.GetHumans() ) do if v.xdefm_Struct and v.xdefm_Struct == self then xdefm_UpdateMenu( v, 3, { [ slo ] = "_" } ) end end
		end local ful = true
		for k, v in pairs( self.xdefm_T3 ) do if isstring( v ) and v == "_" then ful = false  self.xdefm_T3[ k ] = ite
		for k, v in pairs( player.GetHumans() ) do if v.xdefm_Struct and v.xdefm_Struct == self then xdefm_UpdateMenu( v, 3, { [ k ] = ite } ) end end break end end
		if !ful then
			self:EmitSound( "ChainLink.ImpactSoft" ) ITEM:C_DummySet( self )
		else if math.random( 1, 5 ) == 1 then
				self:EmitSound( "Breakable.Metal" )
				xdefm_BreakEffect( self, 3 ) 
				SafeRemoveEntity( self )
			else
				self:EmitSound( "Bounce.Metal" )
				self:GetPhysicsObject():AddVelocity( VectorRand():GetNormal()*25 )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_auto"
	local ITEM = { Name = "#xdefm."..it, Type = "Struct", Model = "models/props_c17/FurnitureBoiler001a.mdl", Helper = "#xdefm.d"..it, StartSound = "Doors.FullOpen7", ExitSound = "Doors.FullClose7",
	Rarity = 5, Price = 10000, Carryable = false, TickRate = 0.4, PhysSound = "SolidMetal.ImpactSoft", HelperUse = "xdefm.U3", SType = 1, Amount = 12 }
	function ITEM:OnInit( self ) self.xdefm_Delay = 0  self.xdefm_Snd = nil
		self:SetNWInt( "XDEFM_CT", 0 )  self:SetNWBool( "XDEFM_AV", false )
	end
	function ITEM:OnThink( self ) local ful, tot = true, 0
		for k, v in pairs( self.xdefm_T3 ) do if v == "_" then ful = false else tot = tot +1 end end
		self:SetNWInt( "XDEFM_CT", tot )
		local bb = ( self:WaterLevel() >= 1 and !ful )
		if self.xdefm_Delay <= CurTime() and self.xdefm_Avail != bb then
			self.xdefm_Delay = CurTime() +0.5  self.xdefm_Avail = bb
			self:SetNWBool( "XDEFM_AV", bb )
			if self.xdefm_Avail then
				self:EmitSound( "friends/message.wav" )
				self.xdefm_Snd = CreateSound( self, "ambient/machines/air_conditioner_loop_1.wav" )
				self.xdefm_Snd:Play()
			elseif self.xdefm_Snd then
				self:EmitSound( "friends/friend_join.wav" )
				self.xdefm_Snd:Stop()
				self.xdefm_Snd = nil
				return
			end
		end
		if self.xdefm_Avail then local slo, bai = 0, "*"
			for k, v in pairs( self.xdefm_T3 ) do if v != "_" then
				local aa, bb = xdefm_ItemGet( v )
				if bb and bb.Type == "Bait" then slo = k  bai = v break end
			end end
			local ite = xdefm_PoolGet( 10, 100, bai, 10, false )  if ite == nil then return end
			local cc, dd = xdefm_ItemGet( ite )  if !istable( dd ) or ite == "it_auto" then return end local yee = 0
			for k, v in pairs( self.xdefm_T3 ) do if v == "_" then self.xdefm_T3[ k ] = ite  yee = k break end end
			if yee != 0 then self:EmitSound( "Underwater.BulletImpact" )  local ttt = { [ yee ] = ite }
				if bai != "*" then
					local aa, bb = xdefm_ItemGet( bai )
					if istable( bb ) and bb.Type == "Bait" and bb.Consume >= 0 and math.random( 1, bb.Consume ) == 1 then
						self.xdefm_T3[ slo ] = "_"
						self:EmitSound( "ambient/water/water_spray1.wav" )
						ttt[ slo ] = "_"
					end
				end
				for k, v in pairs( player.GetHumans() ) do if v.xdefm_Struct and v.xdefm_Struct == self then xdefm_UpdateMenu( v, 3, ttt ) end end
			end
		end
	end
	function ITEM:OnRemove( self ) if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end end
	function ITEM:OnDraw( self ) surface.SetFont( "TargetID" )
		local t1 = tostring( self:GetNWInt( "XDEFM_CT" ) )
		t1 = language.GetPhrase( "xdefm.Store" )..": "..t1.." / 12"
		local x1, y1 = surface.GetTextSize( t1 )
		cam.Start3D2D( self:WorldSpaceCenter() -self:GetUp()*32 -self:GetRight()*2, self:LocalToWorldAngles( Angle( 0, 180, 90 ) ), 0.2 )
			draw.RoundedBox( 0, -x1/2 -8, -y1/2 -150 -8, x1 +16, y1 +16, Color( 0, 0, 0, 155 ) )
			draw.TextShadow( { text = t1, pos = { 0, -150 }, font = "TargetID",
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		cam.End3D2D()
		if !self.Emitter or !IsValid( self.Emitter ) then self.Emitter = ParticleEmitter( self:WorldSpaceCenter() )
			self:CallOnRemove( "XDEEmitter", function( self ) if self.Emitter then self.Emitter:Finish() end end )
		else
			if !self:GetNWBool( "XDEFM_AV" ) then return end
			if ( !isnumber( self.xdefm_Ptc ) or self.xdefm_Ptc <= CurTime() ) and self.Emitter then self.xdefm_Ptc = CurTime() +0.05
				local particle = self.Emitter:Add( "effects/bubble", self:WorldSpaceCenter() +self:GetUp()*46 +self:GetRight()*9 +self:GetForward()*2 +VectorRand():GetNormalized()*2 )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( math.Rand( 1, 2 ) )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				local Size = math.Rand( 2, 4 )
				particle:SetStartSize( Size )
				particle:SetEndSize( 0 )		
				particle:SetRoll( 3 )
				particle:SetRollDelta( 0 )
				particle:SetAirResistance( 200 )
				particle:SetGravity( Vector( 0, 0, 150 ) )
				particle:SetColor( 255, 255, 255 )
				particle:SetRoll( math.random( 0, 360 ) )
				particle:SetCollide( false )
				particle:SetBounce( 0 )
				particle:SetLighting( false )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_ore"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = { "models/props_foliage/rock_forest01d.mdl", "models/props_foliage/rock_forest01c.mdl" }, Helper = "#xdefm.d"..it,
	Rarity = 1, Price = 25, KillInWater = true, PhysSound = "Concrete.ImpactSoft" }
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_recipe1"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/garbage_newspaper001a.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 300, PhysSound = "Cardboard.ImpactHard" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 20 ) self:SetHealth( self:GetMaxHealth() ) self:SetCollisionGroup( COLLISION_GROUP_NONE ) self.xdefm_Killed = false end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Cardboard.Break" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local lt = {["re_basic"]=1,["re_tool1"]=1,["re_bait1"]=1,["re_misc"]=1}
		for i=1, 2 do xdefm_LootDrop( lt, self ) end self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_recipe2"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/garbage_newspaper001a.mdl", Helper = "#xdefm.d"..it,
	Rarity = 3, Price = 750, PhysSound = "Cardboard.ImpactHard" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 20 ) self:SetHealth( self:GetMaxHealth() ) self:SetCollisionGroup( COLLISION_GROUP_NONE ) self.xdefm_Killed = false end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Cardboard.Break" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local lt = {["re_tool2"]=1,["re_bait2"]=1,["re_crate"]=1,["re_advance"]=1}
		for i=1, 2 do xdefm_LootDrop( lt, self ) end self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_recipe3"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/garbage_newspaper001a.mdl", Helper = "#xdefm.d"..it,
	Rarity = 4, Price = 1200, PhysSound = "Cardboard.ImpactHard" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 20 ) self:SetHealth( self:GetMaxHealth() ) self:SetCollisionGroup( COLLISION_GROUP_NONE ) self.xdefm_Killed = false end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Cardboard.Break" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local lt = {["re_tool3"]=1,["re_bait3"]=1,["re_spec"]=1}
		for i=1, 2 do xdefm_LootDrop( lt, self ) end self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_bait4"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_vents/vent_large_straight002.mdl", Helper = "#xdefm.d"..it,
	Rarity = 4, Price = 2500, PhysSound = "Metal_Box.ImpactHard" }
	function ITEM:OnInit( self ) self:SetMaxHealth( 100 ) self:SetHealth( self:GetMaxHealth() ) self:SetCollisionGroup( COLLISION_GROUP_NONE ) self.xdefm_Killed = false end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMass( 100 ) end
	function ITEM:OnDamaged( self, dmg ) if self:Health() <= 0 or dmg:GetDamage() <= 0 or self.xdefm_Killed then return false end
		self:SetHealth( math.max( 0, self:Health() -dmg:GetDamage() ) ) self:EmitSound( "Breakable.Metal" )
		if self:Health() <= 0 then self.xdefm_Killed = true
		local lt = {["ba_gmod"]=1,["ba_magnet"]=1,["ba_combine"]=5,["ba_portal"]=5}
		for i=1, 3 do xdefm_LootDrop( lt, self ) end self:SetNotSolid( true ) SafeRemoveEntityDelayed( self, 0.1 ) end return true
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_potato"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_phx/misc/potato.mdl", Helper = "#xdefm.d"..it,
	Rarity = 1, Price = 25, PhysSound = "Watermelon.Impact", HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Killed = false end
	function ITEM:OnUse( self, ent ) if self.xdefm_Used then return end if ent:Health() >= ent:GetMaxHealth() then return true end
		if ent:KeyDown( IN_SPEED ) then return true end local met = xdefm_CookMeter( self:GetFMod_DT() )
		if met >= 0 then ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() +math.ceil( 5*( 1 +met ) ) ) ) end
		ent:EmitSound( "NPC_Barnacle.FinalBite" ) self:Remove() self.xdefm_Used = true return false
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_propane"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/props_junk/propane_tank001a.mdl", TickRate = 0.1,
	Helper = "#xdefm.d"..it, Rarity = 2, Price = 150, PhysSound = "PhxMetal.ImpactSoft", CantCook = true, HelperUse = "xdefm.U2" }
	function ITEM:OnInit( self ) self.xdefm_Used = false self.xdefm_Snd = nil
		self:SetMaxHealth( 1 ) self:SetHealth( 1 )  self.xdefm_Explode = 0
	end
	function ITEM:OnDamaged( self, dmg ) if dmg:GetDamage() < 1 or self.xdefm_Used then return end self.xdefm_Used = true
		self:SetNWBool( "XDEFM_EF", true ) self.xdefm_Snd = CreateSound( self, Sound( "ambient/gas/cannister_loop.wav" ) ) self:SetHealth( 0 )
		self.xdefm_Snd:Play() self.xdefm_Snd:ChangePitch( 80, 5 ) self.xdefm_Snd:ChangeVolume( 0, 5 ) self.xdefm_Explode = CurTime() +math.Rand( 2, 4 )
	end
	function ITEM:OnThink( self ) if !self:GetNWBool( "XDEFM_EF" ) or !self.xdefm_Used then return end
		self:GetPhysicsObject():AddVelocity( self:GetUp()*-128 +VectorRand():GetNormal()*10 )
		if self.xdefm_Explode > 0 and self.xdefm_Explode <= CurTime() then
			local ef = EffectData() ef:SetStart( self:WorldSpaceCenter() )
			ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetScale( 1 ) util.Effect( "HelicopterMegaBomb", ef )
			local dmg = DamageInfo() dmg:SetDamage( 100 ) dmg:SetDamageType( DMG_BLAST )
			dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
			dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 200 )
			self:EmitSound( "Explo.ww2bomb" ) SafeRemoveEntity( self ) self.xdefm_Explode = 0
		end
	end
	function ITEM:OnStore( self ) return !self.xdefm_Used end
	function ITEM:OnRemove( self ) if self.xdefm_Snd then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end end
	function ITEM:OnDraw( self ) local ef = self:GetNWBool( "XDEFM_EF" )
		if ef and ( !isnumber( self.xdefm_Pa1 ) or self.xdefm_Pa1 <= CurTime() ) then self.xdefm_Pa1 = CurTime() +0.01
			if !self.Emit or !IsValid( self.Emit ) then
				self.Emit = ParticleEmitter( self:WorldSpaceCenter(), false )
				self:CallOnRemove( "XDEEmitter", function( self ) if self.Emit then self.Emit:Finish() end end )
			else
				local particle = self.Emit:Add( "particle/particle_smokegrenade", self:WorldSpaceCenter() +self:GetUp()*20 )
				particle:SetVelocity( self:GetUp()*20 +VectorRand():GetNormalized()*20 )
				particle:SetColor( 255, 255, 255 )
				particle:SetDieTime( 1 )
				particle:SetStartAlpha( 155 )
				particle:SetEndAlpha( 0 )
				local siz = math.Rand( 2, 4 )
				particle:SetStartSize( siz )
				particle:SetEndSize( siz*3 )
				particle:SetRoll( math.Rand( 0, 360 ) )
				particle:SetRollDelta( math.Rand( -3, 3 ) )
				particle:SetAirResistance( 1 )
				local particl2 = self.Emit:Add( "effects/fire_cloud"..math.random( 1, 2 ), self:WorldSpaceCenter() +VectorRand():GetNormalized()*2 +self:GetUp()*20 )
				particl2:SetVelocity( VectorRand():GetNormal()*25 )
				particl2:SetColor( 255, 255, 255 )
				particl2:SetDieTime( 0.5 )
				particl2:SetStartAlpha( 155 )
				particl2:SetEndAlpha( 0 )
				local siz = math.Rand( 4, 6 )
				particl2:SetStartSize( siz )
				particl2:SetEndSize( siz )
				particl2:SetRoll( math.Rand( 0, 360 ) )
				particl2:SetRollDelta( math.Rand( -3, 3 ) )
				particl2:SetAirResistance( 100 )
			end
		end
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_furnace1"
	local ITEM = { Name = "#xdefm."..it, Type = "Struct", Model = "models/props/de_inferno/clayoven.mdl", Helper = "#xdefm.d"..it,
	Rarity = 2, Price = 600, Carryable = false, PhysSound = "Concrete.ImpactHard", HelperUse = "xdefm.U3", SType = 2, StartSound = "Concrete.ImpactSoft", ExitSound = "Concrete.ImpactHard" }
	ITEM.Crafts = {
		"it_wood&it_wood&it_wood&it_coal",
		"it_ore&it_ore&it_coal&it_copperbar",
		"it_metal&it_metal&it_coal&it_metal2",
		"it_scrap&it_scrap&it_coal&it_steelbar",
		"it_ejunk&it_ejunk&it_coal&it_tungstenbar",
		"it_pottery&it_pottery&it_coal&it_potter1",
	}
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_pipebomb"
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/w_models/weapons/w_eq_pipebomb.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 2, Price = 100, TickRate = 0.1, PhysSound = "Grenade.ImpactHard", CantCook = true }
	function ITEM:C_Explode( self ) if self.xdefm_Killed then return else self.xdefm_Killed = true end
		local ef = EffectData() ef:SetStart( self:WorldSpaceCenter() ) ef:SetOrigin( self:WorldSpaceCenter() )
		ef:SetScale( 1 ) util.Effect( "HelicopterMegaBomb", ef )
		for k, v in pairs( ents.FindInSphere( self:WorldSpaceCenter(), 400 ) ) do if !IsValid( v ) or v:Health() <= 0 then continue end
			local dmg = DamageInfo() dmg:SetDamage( 50*( v:GetClass() == "xdefm_base" and 10 or 1 ) ) dmg:SetDamageType( DMG_BLAST )
			dmg:SetDamagePosition( v:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
			dmg:SetInflictor( self ) v:TakeDamageInfo( dmg ) end
		local smo = ents.Create( "env_ar2explosion" ) smo:SetPos( self:WorldSpaceCenter() ) smo:Spawn() smo:Activate() smo:Fire( "Explode" ) SafeRemoveEntityDelayed( smo, 0.1 )
		self:EmitSound( "Explo.ww2bomb" ) SafeRemoveEntity( self ) if self.xdefm_Snd != nil then self.xdefm_Snd:Stop() end if self:WaterLevel() <= 0 then return end
		for i=1, 5 do if math.random( 1, 5 ) != 1 then continue end local ori = self:GetPos() +Vector( 0, 0, 8 )
			local tr = util.TraceLine( { start = ori, endpos = ori +VectorRand():GetNormalized()*math.random( 100, 400 ),
			filter = self, mask = MASK_SHOT_HULL } ) if !tr.Hit or ( IsValid( tr.Entity ) and tr.Entity:IsWorld() ) then
				local ite = xdefm_ItemSpawn( ( math.random( 1, 3 ) == 1 and "cr_fish|" or "cr_gold|" )..math.Round( math.Rand( 0.6, 1 ), 1 ),
				tr.HitPos +tr.HitNormal*2, VectorRand():GetNormalized():Angle(), self:GetFMod_OW() )
				if IsValid( ite ) and ite:WaterLevel() <= 0 then ite:Remove() elseif IsValid( ite ) then
				ite:TakeDamage( ite:Health() ) ite:GetPhysicsObject():SetVelocity( Vector( 0, 0, 0 ) ) end
			end
		end
	end
	function ITEM:OnInit( self ) self.xdefm_Killed = false  self.xdefm_Timer = 0  self.xdefm_Snd = nil end
	function ITEM:OnThink( self ) if self.xdefm_Timer <= 0 or self.xdefm_Killed then return end self.xdefm_Timer = self.xdefm_Timer +0.1
		if self.xdefm_Snd != nil then self.xdefm_Snd:ChangePitch( 100 +math.Clamp( self.xdefm_Timer, 0, 10 )*10, 0 ) end
		if self.xdefm_Timer > 10 then ITEM:C_Explode( self ) else local att = self:GetAttachment( 1 )  if !att then return end
			local ef = EffectData() ef:SetOrigin( att.Pos ) ef:SetEntity( self ) ef:SetRadius( 2 )
			ef:SetScale( 1 ) ef:SetMagnitude( 2 ) ef:SetAttachment( 1 ) util.Effect( "ElectricSpark", ef )
		end
	end
	function ITEM:OnRemove( self ) if self.xdefm_Snd != nil then self.xdefm_Snd:Stop() end end
	function ITEM:OnUse( self, ent ) if self.xdefm_Killed or !ent:IsPlayer() then return end
		if ent:KeyDown( IN_SPEED ) then return true end
		if self.xdefm_Timer <= 0 then self.xdefm_Timer = self.xdefm_Timer +1 else self.xdefm_Timer = 0 end
		if self.xdefm_Snd != nil then self.xdefm_Snd:Stop() self.xdefm_Snd = nil end
		self:EmitSound( "Weapon_Shotgun.Empty" )
		if self.xdefm_Timer > 0 then self.xdefm_Snd = CreateSound( self, Sound( "Weapon_FlareGun.Burn" ) )  self.xdefm_Snd:Play() end 
	end
	xdefm_ItemRegister( it, ITEM )
end
if true then local it = "it_mine2" --20
	local ITEM = { Name = "#xdefm."..it, Type = "Useless", Model = "models/roller.mdl"
	, Helper = "#xdefm.d"..it, Rarity = 3, Price = 160, TickRate = 0.5, PhysSound = "PhxMetal.ImpactSoft" }
	function ITEM:C_Explode( self ) if self.xdefm_Killed then return else self.xdefm_Killed = true end
		local ef = EffectData() ef:SetStart( self:WorldSpaceCenter() )
		ef:SetOrigin( self:WorldSpaceCenter() ) ef:SetScale( 1 ) util.Effect( "HelicopterMegaBomb", ef )
		local dmg = DamageInfo() dmg:SetDamage( 1024 ) dmg:SetDamageType( bit.bor( DMG_AIRBOAT ) )
		dmg:SetDamagePosition( self:WorldSpaceCenter() ) dmg:SetDamageForce( Vector( 0, 0, 1 ) ) dmg:SetAttacker( self:GetFMod_OW() )
		dmg:SetInflictor( self ) util.BlastDamageInfo( dmg, self:WorldSpaceCenter(), 256 )
		self:EmitSound( "Explo.ww2bomb" ) SafeRemoveEntity( self )
	end
	function ITEM:OnInit( self ) self.xdefm_Killed = false  self.xdefm_Armed = false end
	function ITEM:OnReady( self ) self:GetPhysicsObject():SetMaterial( "wood" ) self:GetPhysicsObject():SetBuoyancyRatio( 1 ) end
	function ITEM:OnThink( self ) if self.xdefm_Killed then return end
		if constraint.FindConstraint( self, "Weld" ) or !self:GetPhysicsObject():IsMotionEnabled() or self:IsPlayerHolding() then
			if self.xdefm_Armed then self.xdefm_Armed = false  self:SetModel( "models/roller.mdl" )
				self:EmitSound( "Weapon_Pistol.Empty" )
			end
		elseif !self.xdefm_Armed then self.xdefm_Armed = true
			self:SetModel( "models/roller_spikes.mdl" ) self:EmitSound( "Weapon_Pistol.Empty" )
		end
	end
	function ITEM:OnCollide( self, phy ) if !self.xdefm_Armed or self.xdefm_Killed then return end
		local ent = phy.HitEntity  if !IsValid( ent ) or !util.IsValidModel( ent:GetModel() ) or ent:IsPlayer() or ent:IsNPC() then return end
		self:EmitSound( "MetalVent.ImpactHard" ) ITEM:C_Explode( self )  self.xdefm_Killed = true
	end
	xdefm_ItemRegister( it, ITEM )
end