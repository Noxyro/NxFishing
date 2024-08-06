--[[
	Fishing Mod by LemonCola3424(XDE).
	DO NOT REUPLOAD/MODIFY/COPY WITHOUT AUTHORS' PERMISSION.
	和蔼！任何邪恶，终将绳之以法！
--]]

local SVConvars = bit.bor( FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED, FCVAR_LUA_SERVER )
CreateConVar( "xdefmod_nodepth", "0", SVConvars, "", 0, 1 )
CreateConVar( "xdefmod_refund", "1", SVConvars, "", 0, 1 )
CreateConVar( "xdefmod_tempmode", "0", SVConvars, "", 0, 1 )
CreateConVar( "xdefmod_thief", "10", SVConvars, "", 0, 100 )
CreateConVar( "xdefmod_thiefnerf", "0", SVConvars, "", 0, 1 )
CreateConVar( "xdefmod_noprophurt", "1", SVConvars, "", 0, 1 )
CreateConVar( "xdefmod_hurtrod", "0", SVConvars, "", 0, 1 )
CreateConVar( "xdefmod_skpcool", "30", SVConvars, "", 0 )
CreateConVar( "xdefmod_salecool", "5", SVConvars, "", 0 )
CreateConVar( "xdefmod_qsttime", "10", SVConvars, "", 0 )
CreateConVar( "xdefmod_lbdelay", "10", SVConvars, "", 0 )
CreateConVar( "xdefmod_nomorehook", "0", SVConvars, "", 0, 1 )
CreateConVar( "xdefmod_darkrp", "0.05", SVConvars, "", 0.01, 10 )
CreateConVar( "sbox_maxxdefmod_items", "30", SVConvars )

CreateClientConVar( "xdefmod_tagdist", "256", true, false, "", -1 )
CreateClientConVar( "xdefmod_sonar", "1", true, false, "", 0, 1 )
CreateClientConVar( "xdefmod_renderdist", "2048", true, false, "", 0 )
CreateClientConVar( "xdefmod_animui", "1", true, false, "", 0, 1 )
CreateClientConVar( "xdefmod_showhook", "1", true, false, "", 0, 1 )
CreateClientConVar( "xdefmod_printnote", "0", true, false, "", 0, 1 )
CreateClientConVar( "xdefmod_printcmd", "0", true, false, "", 0, 1 )

CreateClientConVar( "xdefmod_drawhalo", "1", true, false, "", 0, 1 )
CreateClientConVar( "xdefmod_collect", "0", true, false, "", 0, 1 )
CreateClientConVar( "xdefmod_fastreel", "0", true, true, "", 0, 1 )
CreateClientConVar( "xdefmod_quickinv", "-1", true, false, "" )
CreateClientConVar( "xdefmod_fps", "0", true, false, "", 0, 1 )
CreateClientConVar( "xdefmod_collection", "11111111111", true, false, "" )
CreateClientConVar( "xdefmod_bgr", "28", true, false, "", 0, 255 )
CreateClientConVar( "xdefmod_bgg", "25", true, false, "", 0, 255 )
CreateClientConVar( "xdefmod_bgb", "72", true, false, "", 0, 255 )
CreateClientConVar( "xdefmod_bga", "255", true, false, "", 0, 255 )
CreateClientConVar( "xdefmod_brr", "0", true, false, "", 0, 255 )
CreateClientConVar( "xdefmod_brg", "206", true, false, "", 0, 255 )
CreateClientConVar( "xdefmod_brb", "209", true, false, "", 0, 255 )
CreateClientConVar( "xdefmod_bra", "255", true, false, "", 0, 255 )

if istable( xdefm ) and istable( xdefm.miscs ) and istable( xdefm.miscs.Menus ) then
	for k, v in pairs( xdefm.miscs.Menus ) do
		if v != nil then
			v:Remove()
		end
	end
end

xdefm = {}
xdefm.miscs = {}
xdefm.miscs.Version = "4.5.1"
xdefm.items = {}
xdefm.shop = {}
xdefm.leader = nil
xdefm.miscs.RodPos = Vector( -6, -2.5, 10 )
xdefm.miscs.RodAng = Angle( 0, 90, 135 )
xdefm.miscs.RiflePos = Vector( 22, -1, 0 )
xdefm.miscs.RifleAng = Angle( -20, 180, 180 )
xdefm.lin_col = Color( 0, 0, 0 )
xdefm.bck_col = Color( GetConVar( "xdefmod_bgr" ):GetInt(), GetConVar( "xdefmod_bgg" ):GetInt(), GetConVar( "xdefmod_bgb" ):GetInt(), GetConVar( "xdefmod_bga" ):GetInt() )
xdefm.ext_col = Color( GetConVar( "xdefmod_brr" ):GetInt(), GetConVar( "xdefmod_brg" ):GetInt(), GetConVar( "xdefmod_brb" ):GetInt(), GetConVar( "xdefmod_bra" ):GetInt() )

if true then --信息集锦
	xdefm.miscs.Rarity = {
		Color( 100, 100, 100 ),
		Color( 255, 255, 255 ),
		Color( 50, 205, 50 ),
		Color( 30, 144, 255 ),
		Color( 148, 0, 211 ),
		Color( 255, 215, 0 ),
	}
	xdefm.miscs.Rarit2 = {
		"xdefm.T0",
		"#xdefm.T1",
		"#xdefm.T2",
		"#xdefm.T3",
		"#xdefm.T4",
		"#xdefm.T5",
		"#xdefm.T6"
	}
	xdefm.miscs.Costs = {
		[ "A" ] = 1,
		[ "B" ] = 1,
		[ "C" ] = 1,
		[ "D" ] = 1,
		[ "E" ] = 1,
		[ "F" ] = 1,
		[ "G" ] = 20
	}
	xdefm.miscs.Types = {
		[ "Creature" ] = 3,
		[ "Bait" ] = 1,
		[ "Useless" ] = 2,
		[ "Recipe" ] = 2,
		[ "Struct" ] = 2,
	}
	xdefm.miscs.Icons = {
		[ "Creature" ] = Material( "icon16/monkey.png" ),
		[ "Bait" ] = Material( "icon16/bug.png" ),
		[ "Useless" ] = Material( "icon16/box.png" ),
		[ "Recipe" ] = Material( "icon16/script.png" ),
		[ "Struct" ] = Material( "icon16/building.png" )
	}
end
sound.Add( { name = "xdefm.ChargeMax", channel = CHAN_WEAPON, volume = 1, level = 75, pitch = 80, sound = ")weapons/shotgun/shotgun_empty.wav" } )
sound.Add( { name = "xdefm.UnReel", channel = CHAN_WEAPON, volume = 1, level = 75, pitch = { 95, 105 }, sound = ")weapons/crossbow/reload1.wav" } )
sound.Add( { name = "xdefm.Break", channel = CHAN_WEAPON, volume = 1, level = 75, pitch = 100, sound = "npc/roller/blade_in.wav" } )
sound.Add( { name = "xdefm.Throw", channel = CHAN_WEAPON, volume = 1, level = 75, pitch = 100, sound = { "npc/vort/claw_swing1.wav", "npc/vort/claw_swing2.wav" } } )
sound.Add( { name = "xdefm.Reel", channel = CHAN_WEAPON, volume = 1, level = 75, pitch = 100, sound = "fishingrod/reel.wav" } )
sound.Add( { name = "xdefm.Bite", channel = CHAN_WEAPON, volume = 1, level = 75, pitch = 100, sound = "weapons/slam/mine_mode.wav" } )

local SP_URS = "ulx/modules/urs_server.lua" --强行接口URS
if SERVER and file.Exists( SP_URS, "LUA" ) then
	include( SP_URS )
end
if istable( URS ) and URS.types then
	local tab = {}
	tab.limits = { "xdefmod_item" }
	table.Merge( URS.types, tab )
	if SERVER then
		for k, v in pairs( tab ) do
			if !URS[ k ] then
				URS[ k ] = {}
			end
			for n, m in pairs( v ) do
				if !URS[ k ][ m ] then
					URS[ k ][ m ] = {}
				end
			end
		end
	end
end

if CLIENT then --客户端
	xdefm.besti = {}
	xdefm.bestb = {}
	xdefm.quest = {}
	xdefm.langs = {}
	xdefm.miscs.Menus = {}
	xdefm.miscs.Notes = {}
	xdefm.miscs.Marker = nil
	xdefm.miscs.AimPan = nil
	xdefm.miscs.Craft = nil
	xdefm.miscs.Ings = nil
	xdefm.miscs.Ing2 = nil
	xdefm.miscs.LC = false
	xdefm.miscs.CamAng = nil
	xdefm.miscs.SeeAng = nil
	xdefm.miscs.CrsPos = nil
	xdefm.miscs.SkpCool = 0
	xdefm.miscs.FOV = 1.5
	xdefm.miscs.LFOV = 1.5
	xdefm.miscs.KeyEnt = nil
	xdefm.miscs.KeyLer = 0
	xdefm.miscs.DX = 0
	xdefm.miscs.DY = 0
	xdefm.miscs.DL = 0
	xdefm.miscs.LS = "_"
	xdefm.miscs.DS = "_"
	local yee, noo, Bck = Material( "icon16/tick.png" ), Material( "icon16/cross.png" ), Material( "gui/gradient_down" )
	
	surface.CreateFont( "xdefm_Font1", { font = "Noto Sans SC", size = 20, weight = 1, antialias = true, bold = true } )
	surface.CreateFont( "xdefm_Font2", { font = "Noto Sans SC", size = 15, weight = 1, antialias = true, bold = true } )
	surface.CreateFont( "xdefm_Font3", { font = "Noto Sans SC", size = 50, weight = 1, antialias = true, bold = true } )
	surface.CreateFont( "xdefm_Font4", { font = "Noto Sans SC", size = 30, weight = 1, antialias = true, bold = true } )
	surface.CreateFont( "xdefm_Font5", { font = "Noto Sans SC", size = 25, weight = 1, antialias = true, bold = true } )
	surface.CreateFont( "xdefm_Font6", { font = "Noto Sans SC", size = 30, weight = 1, antialias = true, bold = true } )
	surface.CreateFont( "xdefm_Font7", { font = "Noto Sans SC", size = 20, weight = 1, antialias = true, bold = true } )
	
	language.Add( "sent_xdefm_trashcan", "#xdefm.TrashCan" )
	killicon.Add( "sent_xdefm_trashcan", "HUD/killicons/default", Color( 0, 255, 255, 255 ) )
	language.Add( "sent_xdefm_equipment", "#xdefm.Equipment" )
	killicon.Add( "sent_xdefm_equipment", "HUD/killicons/default", Color( 0, 255, 255, 255 ) )
	killicon.Add( "sent_xdefm_plate", "HUD/killicons/default", Color( 0, 255, 255, 255 ) )
	language.Add( "sent_xdefm_plate", "#xdefm.Plate" )
	killicon.Add( "sent_xdefm_sonar", "HUD/killicons/default", Color( 0, 255, 255, 255 ) )
	language.Add( "sent_xdefm_sonar", "#xdefm.Sonar" )
	killicon.Add( "weapon_xdefm_rod", "HUD/killicons/default", Color( 0, 255, 255, 255 ) )
	killicon.Add( "weapon_xdefm_builder", "HUD/killicons/default", Color( 0, 255, 255, 255 ) )
	killicon.Add( "xdefm_firespot", "HUD/killicons/default", Color( 0, 255, 255, 255 ) )
	language.Add( "xdefm_firespot", "#xdefm.FireSpot" )
	killicon.Add( "xdefm_rod", "HUD/killicons/default", Color( 0, 255, 255, 255 ) )
	killicon.Add( "xdefm_bobber", "HUD/killicons/default", Color( 0, 255, 255, 255 ) )
	killicon.Add( "xdefm_hook", "HUD/killicons/default", Color( 0, 255, 255, 255 ) )
	killicon.Add( "xdefm_base", "HUD/killicons/default", Color( 0, 255, 255, 255 ) )
	language.Add( "xdefm_rod", "" )
	language.Add( "xdefm_bobber", "" )
	language.Add( "xdefm_hook", "" )
	language.Add( "xdefm_base", "" )
	language.Add( "xdefm.BaseItem", "" )
	killicon.Add( "xdefm_dummy", "HUD/killicons/default", Color( 0, 255, 255, 255 ) )
	language.Add( "xdefm_dummy", "" )
	language.Add( "SBoxLimit_xdefmod_items", "You've hit the Items limit!" )
	
	local I0, I1, I2 = Material( "vgui/cursors/arrow" ), Material( "icon16/basket_put.png" ), Material( "icon16/basket_go.png" )
	local I3, I4, I5, I6 = Material( "icon16/coins.png" ), Material( "icon16/bin_closed.png" ), Material( "icon16/bug_go.png" ), Material( "icon16/script_go.png" )
	local Bc1, Bc2 = Material( "gui/gradient_down" ), Material( "gui/gradient_up" )

	xdefm.langs[ "zh-CN" ] = {
		[ "Version" ] = "版本", [ "Weapon_Rod" ] = "钓鱼竿", [ "Author" ] = "作者", [ "Purpos" ] = "目的", [ "Occupy" ] = "被占据: ",
		[ "Instruct" ] = "左键 - 蓄力/投掷鱼钩,投钩后放线\n右键 - 投钩后收线\nShift - 加速蓄力/收线\nAlt - 控制鱼竿方向\n投钩后左键 - 断开鱼线\nR - 断线",
		[ "Purpose" ] = "根据旧版钓鱼模组和地图的重写,仿制与扩充.", [ "NoHook" ] = "请先按左键释放鱼钩!", [ "NoBone" ] = "你选择的玩家模型没有支持的手部骨骼!", [ "Category" ] = "钓鱼", [ "Close" ] = "关闭",
		[ "Money" ] = "渔币", [ "Level" ] = "等级", [ "M1" ] = "背包", [ "M2" ] = "升级", [ "M3" ] = "状态", [ "Progress" ] = "进度",
		[ "M11" ] = "管理你的物品/鱼饵", [ "M22" ] = "使用技能点升级钓鱼能力", [ "M33" ] = "查看你的钓鱼记录", [ "BaseItem" ] = "",
		[ "Creature" ] = "生物", [ "Bait" ] = "鱼饵", [ "Pickup" ] = "捡起物品", [ "NotBait" ] = "该槽位仅限鱼饵,", [ "NotBai2" ] = "不是有效的鱼饵!", [ "Drop" ] = "丢弃",
		[ "Destroy" ] = "销毁", [ "Trashed" ] = "销毁物品", [ "Dropped" ] = "丢弃物品", [ "T1" ] = "普通", [ "T2" ] = "罕见",
		[ "T0" ] = "?", [ "T3" ] = "稀有", [ "T4" ] = "史诗", [ "T5" ] = "传说", [ "Price" ] = "价值", [ "Total" ] = "总数",
		[ "U1" ] = "捡起", [ "Store" ] = "存储", [ "Owner" ] = "物主", [ "Useless" ] = "物品", [ "NotMine" ] = "你没有权限进行该操作!",
		[ "FullInv" ] = "你的背包已满!", [ "Length" ] = "长度", [ "Depth" ] = "深度", [ "Bobber" ] = "浮漂", [ "Hook" ] = "鱼钩",
		[ "Uplevel" ] = "你升级了!", [ "Skp" ] = "技能点", [ "UpdA" ] = "鱼竿大小", [ "UpdB" ] = "鱼线长度", [ "UpdC" ] = "收线速度", [ "UpdG" ] = "额外鱼钩",
		[ "UpdD" ] = "鱼线韧性", [ "UpdE" ] = "钓鱼效率", [ "UpdF" ] = "银行存储", [ "Upgraded" ] = "能力已升级", [ "Downgraded" ] = "能力已降级",
		[ "StillFishing" ] = "无法在钓鱼时进行此操作!", [ "U2" ] = "使用", [ "TCatch" ] = "总钓鱼数", [ "CBait" ] = "你的鱼饵已被消耗", [ "M55" ] = "购买能帮助你钓到更多物品的鱼饵",
		[ "U3" ] = "查看", [ "NoMoney" ] = "你的渔币不够!", [ "NoLevel" ] = "你的等级不够!", [ "M5" ] = "鱼饵商店", [ "Cost" ] = "花费",
		[ "Bought" ] = "购买物品", [ "Sell" ] = "出售", [ "Sold" ] = "出售物品", [ "TExp" ] = "总经验数", [ "TEarn" ] = "总赚钱数",
		[ "TBuy" ] = "总购买数", [ "Weapon_Inventory" ] = "背包", [ "FList" ] = "好友列表", [ "Player" ] = "玩家", [ "FriendAdd" ] = "输入玩家名称或SteamID",
		[ "Instruct3" ] = "左键(指令:xdefmod_openbnk) - 背包和银行\n右键(指令:xdefmod_opencft) - 背包和制作\nE+左键(指令:xdefmod_openbes) - 图鉴\nE+右键(指令:xdefmod_openfri) - 好友列表\n绑定指令键位可以无需该武器进行操作",
		[ "Bank" ] = "银行", [ "Take" ] = "拿走", [ "Buy" ] = "购买", [ "Equip" ] = "装备", [ "Durability" ] = "耐久",
		[ "FullSto" ] = "该容器已满!", [ "Type" ] = "类型", [ "Friend" ] = "好友", [ "FriendAd2" ] = "添加好友", [ "Dequip" ] = "卸下",
		[ "FriendAd3" ] = "未找到指定玩家!", [ "Allow" ] = "允许", [ "Disallow" ] = "禁止", [ "FriendAd4" ] = "添加好友", [ "FriendAd5" ] = "你只能添加16名好友",
		[ "Apply" ] = "确定", [ "FriendAd5" ] = "好友列表已更新", [ "Delete" ] = "删除好友", [ "Reset" ] = "重置", [ "CleanRefund" ] = "清图补偿",
		[ "Consume" ] = "消耗率", [ "GetMoney" ] = "获得渔币", [ "U4" ] = "开关", [ "FireSpot" ] = "火", [ "NotFit" ] = "该物品不能放在这里!",
		[ "Weapon_Trade" ] = "交易", [ "Instruct4" ] = "左键 - 开始/结束交易\n右键(指令:xdefmod_opentrd) - 打开交易界面\nR - 开关交易屏蔽\n你不能与屏蔽交易或者没有交易武器的人交易.",
		[ "Trade1" ] = "没有目标", [ "Trade2" ] = "正在与玩家交易", [ "Trade3" ] = "发送交易请求", [ "Trade4" ] = "接受交易请求", [ "Trade5" ] = "这不是一个玩家",
		[ "Trade6" ] = "没有携带交易武器", [ "Trade7" ] = "屏蔽了交易请求", [ "Trade8" ] = "正在与其他玩家交易", [ "TradeStat" ] = "交易请求",
		[ "Trade9" ] = "请先取消交易屏蔽!", [ "Trade10" ] = "想要与你交易", [ "Trade11" ] = "正在与你交易", [ "Trade12" ] = "等待对方接受交易", [ "Trade13" ] = "按下",
		[ "Trade14" ] = "打开交易菜单", [ "Trade15" ] = "你现在正在与 ", [ "Trade16" ] = " 交易, 打开交易界面来交换物品", [ "Trade17" ] = "没有交易对象...", [ "PutMoney" ] = "输入交易的渔币数量...",
		[ "PutMone2" ] = "按下以确定渔币数值", [ "PutMone3" ] = "按下以取走渔币", [ "NotTrading" ] = "无法在未交易时进行此操作!", [ "ReadyY" ] = "已准备", [ "ReadyN" ] = "未准备",
		[ "Trade18" ] = "交易完成!", [ "ClearP" ] = "重置加点", [ "Confirm" ] = "确定", [ "ClearedP" ] = "你的技能点已被重置.", [ "CopiedID" ] = "已复制该玩家的SteamID.",
		[ "UCat" ] = "钓鱼模组", [ "UMenuS1" ] = "服务端选项", [ "UMenuC1" ] = "客户端选项", [ "UMenuS2" ] = "服务端XDE钓鱼模组选项. 只有服务器创建者有权利更改这些选项.", [ "UMenuC2" ] = "客户端XDE钓鱼模组选项. 仅影响你个人的游戏体验.", [ "UPart1" ] = "全部重置",
		[ "c_nodepth1" ] = "无视钓鱼深度", [ "c_nodepth2" ] = "取消物品的获取深度限制,但不取消深度对钓鱼效率的增益. 适合在浅水地图使用.",
		[ "c_refund1" ] = "清图补偿", [ "c_refund2" ] = "清理地图或服务器正常关闭后自动出售全图物品,可能会造成服务器性能问题. 对炸服无效.", [ "c_drawhalo1" ] = "实体光环效果",
		[ "c_noprophurt1" ] = "伤害保护", [ "c_noprophurt2" ] = "不在你的钓鱼好友列表的玩家无法伤害你的物品或被你的物品伤害.",
		[ "c_thief1" ] = "海鸥袭击率", [ "c_thief2" ] = "出现海鸥叼走物品的几率,不是确切数值.", [ "c_maxxdefmod_items" ] = "钓鱼物品上限",
		[ "c_tagdist1" ] = "标签距离", [ "c_renderdist1" ] = "物品渲染距离", [ "c_showhook1" ] = "显示鱼钩信息", [ "c_printnote1" ] = "保存消息至控制台", [ "ResetSkp" ] = "重置加点",
		[ "c_skpcool1" ] = "重置点数间隔", [ "c_skpcool2" ] = "重置点数多少秒后可以再次重置.", [ "c_salecool1" ] = "商店降价更新间隔", [ "c_salecool2" ] = "鱼饵商店每隔几分钟更新价格,0为保持平价.",
		[ "c_printcmd1" ] = "保存UI指令至控制台", [ "NoEnoughSkp" ] = "你的技能点不够!", [ "c_lbdelay1" ] = "排行榜更新间隔", [ "c_lbdelay2" ] = "每隔几分钟更新排行榜", [ "M4" ] = "排行榜",
		[ "M44" ] = "全服钓鱼等级最高的前十名玩家", [ "Name" ] = "名称", [ "NoInfo" ] = "暂无信息...", [ "Besti1" ] = "未知物品", [ "Sonar" ] = "声呐", [ "Sonar2" ] = "显示上钩的物品",
		[ "Besti2" ] = "未记录", [ "Besti3" ] = "已记录", [ "Besti4" ] = "物品已记录: ", [ "Collection" ] = "图鉴", [ "Plate3" ] = "展示中: ",
		[ "Angle" ] = "角度: ", [ "PageA" ] = "首页", [ "PageB" ] = "上页", [ "PageC" ] = "下页", [ "PageD" ] = "尾页", [ "Page" ] = "页码",
		[ "c_collect1" ] = "图鉴未收集提示", [ "Equipment" ] = "钓具盒", [ "Equipment2" ] = "获取/移除钓鱼模组的所有武器",
		[ "TrashCan" ] = "垃圾桶", [ "TrashCan2" ] = "卖出触碰的物品", [ "c_hurtrod1" ] = "鱼钩碰撞", [ "c_hurtrod2" ] = "玩家可以用鱼钩造成伤害.",
		[ "c_animui1" ] = "动态UI(低帧数会影响体验)", [ "c_quickinv1" ] = "快速打开背包", [ "Plate" ] = "展示盘", [ "Plate2" ] = "展示你的一个物品",
		[ "c_tempmode1" ] = "临时模式", [ "c_tempmode2" ] = "玩家无法捡起除鱼饵以外的物品,只能现场卖掉物品.", [ "c_thiefnerf1" ] = "弱化海鸥", [ "c_thiefnerf2" ] = "降低所有海鸥飞行速度但是你无法再通过击杀海鸥获得经验值.",
		[ "Radar" ] = "物品雷达", [ "Radar2" ] = "显示周围物品的位置", [ "Bucket" ] = "铁桶", [ "Bucket2" ] = "可以临时存储一定数量的物品.", [ "Recipe" ] = "图纸",
		[ "NotRecipe" ] = "该槽位仅限图纸,", [ "NotRecip2" ] = "不是有效的图纸!", [ "Product" ] = "产品", [ "NeedRecipe" ] = "请先放入图纸.",
		[ "Durability" ] = "耐久", [ "Materials" ] = "材料数", [ "NeedMat" ] = "制作所需材料不够!", [ "Crafted" ] = "合成物品", [ "TCraft" ] = "总制作数",
		[ "Bucket" ] = "铁桶", [ "Bucket2" ] = "临时存储16个小物品", [ "Quest" ] = "任务", [ "Quest2" ] = "上交特定物品获得奖励和经验值", [ "TQuest" ] = "任务完成数",
		[ "c_qsttime1" ] = "跳过任务冷却", [ "c_qsttime2" ] = "完成任务不会有冷却时间,单位为分钟.", [ "GetEXP" ] = "获得经验", [ "Require" ] = "需求", [ "Reward" ] = "奖励",
		[ "c_fastreel1" ] = "自动快速收线", [ "State" ] = "状态", [ "State1" ] = "进行中", [ "State2" ] = "未接受", [ "State3" ] = "冷却中",
		[ "Skip" ] = "跳过", [ "Finish" ] = "结算", [ "QuestBoard" ] = "任务板", [ "Deny1" ] = "缺少所需任务物品!", [ "Deny2" ] = "背包不够容纳奖励!", [ "Deny3" ] = "跳过任务冷却中!",
		[ "Complete" ] = "任务已完成!", [ "Skipped" ] = "任务已跳过.", [ "Failed" ] = "你在未完成任务的情况下退出了游戏,请等待一段时间再接受任务.", [ "QuestSt" ] = "任务开始!", [ "Caught" ] = "捕获",
		[ "c_fps1" ] = "第一人称", [ "DarkRP" ] = "货币兑换机", [ "c_darkrp1" ] = "RP模式兑换汇率", [ "c_darkrp2" ] = "汇率 = DarkRP货币 / 钓鱼货币 * 99%", [ "DarkRP2" ] = "相互兑换鱼币和DarkRP货币",
		[ "NotRP" ] = "本服务器未处于DarkRP模式！", [ "FMoney" ] = "钓鱼货币", [ "DMoney" ] = "DarkRP货币", [ "DRate" ] = "兑换汇率", [ "Exchanged" ] = "货币已兑换",
		[ "DEnter" ] = "输入兑换数值...", [ "Conv1" ] = "兑换为DarkRP", [ "Conv2" ] = "兑换为钓鱼", [ "DarkNPC" ] = "渔夫", [ "DarkNPC2" ] = "我能为你做点什么?",
		[ "NPC1" ] = "获取/放回钓鱼装备", [ "NPC2" ] = "卖出背包内全部物品", [ "NPC3" ] = "打开背包和银行", [ "NPC4" ] = "打开背包和合成", [ "NPC5" ] = "打开图鉴", [ "NPC6" ] = "打开任务", [ "NPC7" ] = "打开RP模式货币转换",
		[ "c_bg" ] = "界面背景颜色", [ "c_br" ] = "界面勾线颜色", [ "Weapon_Craft" ] = "合成", [ "Struct" ] = "建筑", [ "Interact" ] = "互动",
		[ "ST0" ] = "其他建筑", [ "ST1" ] = "存储", [ "ST2" ] = "合成台", [ "ST3" ] = "商店", [ "c_nomorehook1" ] = "关闭多钩功能", [ "c_nomorehook2" ] = "有人说多钩卡服,没办法哎.",
		[ "NoMoreHook" ] = "额外鱼钩已被服务器禁止!", [ "NotEmpty" ] = "不是空的!",
	}
	xdefm.langs[ "en" ] = {
		[ "Version" ] = "Version", [ "Weapon_Rod" ] = "Fishing Rod", [ "Author" ] = "Author", [ "Purpos" ] = "Purpose",
		[ "Instruct" ] = "M1 - Charge/Throw the hook; Reel down after thrown\nM2 - Reel up after thrown\nShift - Speed up charging/reeling\nAlt - Control Rod Direction\nR - Break the reel",
		[ "Purpose" ] = "My own version of the Fishing Mod. Inspired by old fishing mods and maps.", [ "NoHook" ] = "Release the hook first!", [ "NoBone" ] = "Your playermodel doesnt have a proper hand bone!", [ "Category" ] = "Fishing", [ "Close" ] = "Close",
		[ "Money" ] = "Money", [ "Level" ] = "Level", [ "M1" ] = "Inventory", [ "M2" ] = "Upgrade", [ "M3" ] = "Stats", [ "Progress" ] = "Progress",
		[ "M11" ] = "Manage your items and baits", [ "M22" ] = "Upgrade your fishing abilities using skill points", [ "M33" ] = "Check your fishing records", [ "BaseItem" ] = "",
		[ "Creature" ] = "Creature", [ "Bait" ] = "Bait", [ "Pickup" ] = "New Item", [ "NotBait" ] = "This slot is for baits only,", [ "NotBai2" ] = "is not a valid bait!", [ "Drop" ] = "Drop",
		[ "Destroy" ] = "Destroy", [ "Trashed" ] = "Item Trashed", [ "Dropped" ] = "Item Dropped", [ "T1" ] = "Common", [ "T2" ] = "Uncommon",
		[ "T0" ] = "?", [ "T3" ] = "Rare", [ "T4" ] = "Epic", [ "T5" ] = "Legendary", [ "Price" ] = "Price", [ "Total" ] = "Total",
		[ "U1" ] = "Pick Up", [ "Store" ] = "Store", [ "Owner" ] = "Owner", [ "Useless" ] = "Item", [ "NotMine" ] = "You have no right to do this!",
		[ "FullInv" ] = "Your inventory is full!", [ "Length" ] = "Length", [ "Depth" ] = "Depth", [ "Bobber" ] = "Bobber", [ "Hook" ] = "Hook",
		[ "Uplevel" ] = "Level Up!", [ "Skp" ] = "Skill Points", [ "UpdA" ] = "Rod Length", [ "UpdB" ] = "String Length", [ "UpdC" ] = "Reel Speed", [ "UpdG" ] = "Extra Hooks",
		[ "UpdD" ] = "String Strength", [ "UpdE" ] = "Efficiency", [ "UpdF" ] = "Bank Slots", [ "Upgraded" ] = "Ability Upgraded", [ "Downgraded" ] = "Ability Downgraded",
		[ "StillFishing" ] = "Cant do this when fishing!", [ "U2" ] = "Use", [ "TCatch" ] = "Total Catch", [ "CBait" ] = "Your bait has been consumed!", [ "M55" ] = "Buy baits for more stuffs",
		[ "NoMoney" ] = "You don't have enough money!", [ "NoLevel" ] = "Your level is not enough!", [ "M5" ] = "Bait Shop", [ "Cost" ] = "Cost",
		[ "Bought" ] = "Bought Item", [ "Sell" ] = "Sell", [ "Sold" ] = "Item Sold", [ "TExp" ] = "Total Exp", [ "TEarn" ] = "Total Earn",
		[ "TBuy" ] = "Total Buy", [ "Weapon_Inventory" ] = "Inventory", [ "FList" ] = "Friend List", [ "Player" ] = "Player", [ "FriendAdd" ] = "Enter Player Name or SteamID...",
		[ "Instruct3" ] = "M1(Command:xdefmod_openbnk) - Open Inventory and Bank\nM2(Command:xdefmod_opencft) - Open Inventory and Crafting\nE+M1(Command:xdefmod_openbes) - Open Collection\nE+M2(Command:xdefmod_openfri) - Open Friend List\nBind the commands to open menus without the SWEP",
		[ "Bank" ] = "Bank", [ "Take" ] = "Take", [ "Buy" ] = "Buy", [ "Equip" ] = "Equip", [ "Durability" ] = "Durability",
		[ "FullSto" ] = "This storage is full!", [ "Type" ] = "Type", [ "Friend" ] = "Friend", [ "FriendAd2" ] = "Press to add friend",
		[ "FriendAd3" ] = "Player not found!", [ "Allow" ] = "Allow", [ "Disallow" ] = "Disallow", [ "FriendAd4" ] = "Friend Added", [ "FriendAd5" ] = "You can only add 16 friends!",
		[ "Apply" ] = "Apply", [ "FriendAd5" ] = "Friend List Updated!", [ "Delete" ] = "Delete Friend", [ "Reset" ] = "Reset", [ "CleanRefund" ] = "Cleanup Refund",
		[ "Consume" ] = "Consume Rate", [ "GetMoney" ] = "Get Money", [ "U4" ] = "Toggle", [ "FireSpot" ] = "Fire", [ "NotFit" ] = "This item cant be placed here!",
		[ "Weapon_Trade" ] = "Trade", [ "Instruct4" ] = "M1 - Start/Stop Trading\nM2(Command:xdefmod_opentrd) - Open trade menu\nR - Toggle blocking trade offers\nYou cant trade with players who dont have this weapon",
		[ "Trade1" ] = "No Target", [ "Trade2" ] = "Trading with", [ "Trade3" ] = "Send trade offer", [ "Trade4" ] = "Accept trade offer", [ "Trade5" ] = "Invalid Target",
		[ "Trade6" ] = "doesn't have a Trade weapon", [ "Trade7" ] = "has blocked Trade Offers", [ "Trade8" ] = "is trading with others", [ "TradeStat" ] = "Trade Offers",
		[ "Trade9" ] = "Unblock Trade Offers first!", [ "Trade10" ] = "wants to trade with you", [ "Trade11" ] = "is trading with you", [ "Trade12" ] = "Waiting to be accepted", [ "Trade13" ] = "Press",
		[ "Trade14" ] = "to open trade menu", [ "Trade15" ] = "You are now trading with ", [ "Trade16" ] = ". Open Trade Menu to exchange items.", [ "Trade17" ] = "No Trader...", [ "PutMoney" ] = "Insert amount of money to trade...",
		[ "PutMone2" ] = "Press to confirm", [ "PutMone3" ] = "Press to take", [ "NotTrading" ] = "Cant do this while not trading!", [ "ReadyY" ] = "Ready", [ "ReadyN" ] = "Not Ready",
		[ "Trade18" ] = "Trade success!", [ "ClearP" ] = "Clear Points", [ "Confirm" ] = "Confirm", [ "ClearedP" ] = "Your skill points have been reset.",
		[ "CopiedID" ] = "SteamID of the player has been copied.", [ "Dequip" ] = "Dequip",
		[ "UCat" ] = "Fishing", [ "UMenuS1" ] = "Serverside settings", [ "UMenuC1" ] = "Clientside settings", [ "UMenuS2" ] = "Serversize XDE Fishing Mod settings. These can only be changed by server host.", [ "UMenuC2" ] = "Clientside XDE Fishing Mod settings. These only affect your own gaming experience.", [ "UPart1" ] = "Reset everything",
		[ "c_nodepth1" ] = "Ignore fishing depth", [ "c_nodepth2" ] = "Disable depth detection. Useful in maps with shallow water.",
		[ "c_refund1" ] = "Cleanup refund", [ "c_refund2" ] = "Automatically sell all the items before cleanup or manual shutdown, may cause lags.",
		[ "c_thief1" ] = "Thief chance", [ "c_thief2" ] = "The possibility of seagull/crow attack, not the exact chance.",
		[ "c_noprophurt1" ] = "Damage protection", [ "c_noprophurt2" ] = "Players not in your fishing friend list cannot damage your items or be damaged by your items.",
		[ "c_maxxdefmod_items" ] = "Max Items", [ "c_drawhalo1" ] = "Entity halo effect",
		[ "c_tagdist1" ] = "Tag display distance", [ "c_renderdist1" ] = "Item render distance", [ "c_showhook1" ] = "Show hook info", [ "c_printnote1" ] = "Print hints at console",
		[ "ResetSkp" ] = "Reset Skill Points", [ "c_hurtrod1" ] = "Hook Collision", [ "c_hurtrod2" ] = "Allow fishing hooks collide with players/npcs.",
		[ "c_skpcool1" ] = "Skill points reset cooldown", [ "c_skpcool2" ] = "How soon can a player reset skill points again (in second).", [ "c_salecool1" ] = "Shop sale update", [ "c_salecool2" ] = "Update bait shop prices every X minutes, 0 = no sales.",
		[ "c_printcmd1" ] = "Print UI commands at console", [ "NoEnoughSkp" ] = "You dont have enough skill points!", [ "c_lbdelay1" ] = "Leaderboard update", [ "c_lbdelay2" ] = "Update leaderboard every X minutes, 0 = disable leaderboard.", [ "M4" ] = "Leaderboard",
		[ "M44" ] = "Top 10 players of the server", [ "Name" ] = "Name", [ "NoInfo" ] = "No Info...", [ "Besti1" ] = "Invalid Item",
		[ "Besti2" ] = "Not Recorded", [ "Besti3" ] = "Recorded", [ "Besti4" ] = "Item Recorded: ", [ "Sonar" ] = "Sonar", [ "Sonar2" ] = "Display your catches",
		[ "Angle" ] = "Angle: ", [ "PageA" ] = "<<", [ "PageB" ] = "<", [ "PageC" ] = ">", [ "PageD" ] = ">>", [ "Page" ] = "Page",
		[ "c_collect1" ] = "Collection reminder", [ "Equipment" ] = "Equipment Kit", [ "Equipment2" ] = "Get/Strip all the weapons in Fishing Mod",
		[ "TrashCan" ] = "Trashcan", [ "TrashCan2" ] = "Sell items on touch", [ "Collection" ] = "Collection", [ "Plate" ] = "Display Plate", [ "Plate3" ] = "Displaying: ",
		[ "c_animui1" ] = "Animated UI(Sluggish when in low fps)", [ "c_quickinv1" ] = "Quick Inventory", [ "Plate2" ] = "Display one of your item",
		[ "c_tempmode1" ] = "Temp Mode", [ "c_tempmode2" ] = "Players can no longer 'carry' items but only sell them using R+E.", [ "c_thiefnerf1" ] = "Nerfed Theft", [ "c_thiefnerf2" ] = "Slow down seagulls but you can no longer get exps from killing them.",
		[ "Radar" ] = "Item Radar", [ "Radar2" ] = "Show the location of owner's items", [ "Recipe" ] = "Recipe",
		[ "NotRecipe" ] = "This slot is for recipes only,", [ "TCraft" ] = "Total Craft", [ "NotRecip2" ] = "Is not a valid recipe!", [ "Product" ] = "Products", [ "NeedRecipe" ] = "Insert a recipe here.",
		[ "Durability" ] = "Durability", [ "Materials" ] = "Materials", [ "NeedMat" ] = "No enough ingredients!", [ "Crafted" ] = "Item Crafted", [ "GetEXP" ] = "Get EXP",
		[ "Bucket" ] = "Bucket", [ "Bucket2" ] = "Store 16 small items temporarily", [ "Quest" ] = "Quest", [ "Quest2" ] = "Find certain items to gain rewards and exps",
		[ "c_qsttime1" ] = "Skip Quest Cooldown", [ "c_qsttime2" ] = "Cooldown if you skip a quest( in minutes )", [ "TQuest" ] = "Quests Completed",
		[ "c_fastreel1" ] = "Auto fast reel", [ "State" ] = "State", [ "State1" ] = "Ongoing", [ "State2" ] = "Available", [ "State3" ] = "Cooldown",
		[ "Require" ] = "Requires", [ "Reward" ] = "Reward", [ "Skip" ] = "Skip", [ "Finish" ] = "Check", [ "QuestBoard" ] = "Quest Board", [ "QuestSt" ] = "Quest Start!",
		[ "Deny1" ] = "Missing required quest item(s)!", [ "Deny2" ] = "No enough inventory space for reward!", [ "Deny3" ] = "Skipping is in cooldown!", [ "Caught" ] = "Caught",
		[ "Complete" ] = "Mission Complete!", [ "Skipped" ] = "Quest Skipped.", [ "Failed" ] = "You have disconnected before completing the quest, so you cant take another quest for a few minutes.",
		[ "c_fps1" ] = "First person", [ "DarkRP" ] = "Currency Convert", [ "c_darkrp1" ] = "Currency Convert Rate", [ "c_darkrp2" ] = "Rate = DarkRP / Fishing * 99%", [ "DarkRP2" ] = "Convert Fishing Currency and DarkRP Money",
		[ "NotRP" ] = "This server is not running in DarkRP gamemode!", [ "FMoney" ] = "Fishing Money", [ "DMoney" ] = "DarkRP Money", [ "DRate" ] = "Convert Rate", [ "Exchanged" ] = "Currency Converted",
		[ "DEnter" ] = "Enter Convert Value...", [ "Conv1" ] = "To DarkRP", [ "Conv2" ] = "To Fishing", [ "DarkNPC" ] = "Fisherman", [ "DarkNPC2" ] = "What can I do for you?",
		[ "NPC1" ] = "Equip/Unequip Fishing Equipments", [ "NPC2" ] = "Sell Everything", [ "NPC3" ] = "Open Inventory and Bank", [ "NPC4" ] = "Open Inventory and Crafting", [ "NPC5" ] = "Open Collection Menu", [ "NPC6" ] = "Open Quest Eenu", [ "NPC7" ] = "Open Currency Conversion",
		[ "c_bg" ] = "Menu background color", [ "c_br" ] = "Menu outline color", [ "Weapon_Craft" ] = "Crafting", [ "Struct" ] = "Structure", [ "U3" ] = "Interact",
		[ "ST0" ] = "Structure", [ "ST1" ] = "Storage", [ "ST2" ] = "Crafting", [ "ST3" ] = "Shop", [ "c_nomorehook1" ] = "Disable Extra Hooks", [ "c_nomorehook2" ] = "Since some say it causes lags.",
		[ "NoMoreHook" ] = "Extra Hooks is disabled in this server!", [ "NotEmpty" ] = "Is not empty!",
	}
	local ln, lg, be = GetConVar( "gmod_language" ):GetString(), "en", "xdefishmod/bestiary.txt"
	if ln != nil and istable( xdefm.langs[ ln ] ) then
		lg = GetConVar( "gmod_language" ):GetString()
	end
	for holder, text in pairs( xdefm.langs[ lg ] ) do
		language.Add( "xdefm."..holder, text )
	end
	if file.Exists( be, "DATA" ) then
		local dat = file.Read( be, "DATA" )
		if isstring( dat ) and istable( util.JSONToTable( dat ) ) then
			xdefm.besti = util.JSONToTable( dat )
		end
	end
	list.Set( "ContentCategoryIcons", "#xdefm.Category", "icon16/fishing.png" )
	function xdefm_BestiarySave()
		if !file.IsDir( "xdefishmod", "DATA" ) then
			file.CreateDir( "xdefishmod" )
		end
		file.Write( "xdefishmod/bestiary.txt", util.TableToJSON( xdefm.besti, true ) )
	end
	function xdefm_SlotBox( x, y, w, h, slo, ext, ico, con )
		if !isnumber( x ) or !isnumber( y ) or !isnumber( w ) or !isnumber( h ) or !isnumber( slo ) then return end
		local pax = vgui.Create( "DButton" ) pax:SetSize( w, h ) pax:SetPos( x, y )  pax.S_Place = tostring( slo )  pax.B_OnMove = nil
		pax:SetCursor( "blank" ) pax.S_Type = "None"  pax:SetText( "" ) pax.B_OnMove = false  if ico != nil then
		pax.P_Sprite = vgui.Create( "DSprite", pax ) local spr = pax.P_Sprite  spr:SetMaterial( isstring( ico ) and Material( ico ) or ico )
		spr:SetPos( w*0.15, h*0.15 ) spr:SetSize( w*0.15, h*0.15 ) end if !con then pax:Droppable( "XDEFM_MenuDrop" ) end pax.N_Lerp = 1
		pax.T_Item = nil  pax.T_Extra = nil  pax.S_Name = ""  pax.N_Rarity = 0  pax.S_Item = "_" function pax:Paint( w, h ) local col = xdefm.miscs.Rarity[ pax.N_Rarity+1 ]
			if pax.N_Rarity != 0 then draw.RoundedBox( 0, 1, 1, w -2, h -2, Color( col.r*0.4, col.g*0.4, col.b*0.4 ) )
			if xdefm.miscs.AimPan == pax then pax.N_Lerp = Lerp( 0.2, pax.N_Lerp, 4 ) else pax.N_Lerp = Lerp( 0.2, pax.N_Lerp, 1 ) end
			else draw.RoundedBox( 0, 0, 0, w, h, col ) draw.RoundedBox( 0, 1, 1, w -2, h -2, Color( col.r*0.4, col.g*0.4, col.b*0.4 ) ) end
			local alp = math.Clamp( ( pax.N_Lerp -1 )/3, 0, 1 )*255
			surface.SetMaterial( Bc2 ) surface.SetDrawColor( Color( col.r*0.6, col.g*0.6, col.b*0.6, 255 -alp ) ) surface.DrawTexturedRect( 0, 0, w, h )
			surface.SetMaterial( Bc1 ) surface.SetDrawColor( Color( col.r*0.6, col.g*0.6, col.b*0.6, alp ) ) surface.DrawTexturedRect( 0, 0, w, h )
			surface.SetDrawColor( col ) surface.DrawOutlinedRect( 0, 0, w, h, pax.N_Lerp )
			draw.TextShadow( { text = isstring( ext ) and ext or "", pos = { (h-4), 4 },
				font = "xdefm_Font2", xalign = TEXT_ALIGN_RIGHT,
				yalign = TEXT_ALIGN_DOWN, color = Color( 255, 255, 255 ) }, 1, 255 )
		end if !con then
		function pax:DoClick() local ply = LocalPlayer() local typ, men, pro = pax.S_Type, xdefm.miscs.Menus, ply.xdefm_Profile
			if ( input.IsControlDown() or input.IsButtonDown( KEY_LCONTROL ) or input.IsButtonDown( KEY_RCONTROL ) ) and pax.S_Item != "_" then
			if typ == "Inventory" then xdefm_Command( ply, "DestroyInv", pax.S_Place ) end return end
			if ( input.IsShiftDown() or input.IsButtonDown( KEY_LSHIFT ) or input.IsButtonDown( KEY_RSHIFT ) ) and pax.S_Item != "_" then
			if typ == "Inventory" then
				if IsValid( men[ "Bank" ] ) then local num = 0
					for k, v in pairs( pro.Bnk ) do if k > pro.UpdF then break end
					if isstring( v ) and v == "_" then num = k break end end
					if num > 0 then xdefm_Command( ply, "MoveBank", pax.S_Place.."|"..num )
					else xdefm_AddNote( ply, "!V", "resource/warning.wav", "cross", 5 ) end return
				elseif IsValid( men[ "Struct" ] ) and men[ "Struct" ].N_SType == 1 then local num = 0
					for k, v in pairs( men[ "Struct" ].T_Items ) do
					if isstring( v ) and v == "_" then num = k break end end
					if num > 0 then xdefm_Command( ply, "Struct", pax.S_Place.."|"..num )
					else xdefm_AddNote( ply, "!V", "resource/warning.wav", "cross", 5 ) end return
				elseif !IsValid( men[ "Trade" ] ) then
					if pax.T_Item.Type == "Bait" and pax.S_Place != "21" then xdefm_Command( ply, "MoveInv", pax.S_Place.."|21" ) return
					elseif pax.T_Item.Type == "Bait" and pax.S_Place == "21" then
						local num = 0  for k, v in pairs( pro.Items ) do
							if isstring( v ) and v == "_" and k != 21 then num = k break end
						end if num > 0 then xdefm_Command( ply, "MoveInv", pax.S_Place.."|"..num ) end return
					end
				end
				if IsValid( men[ "Craft" ] ) then
					if pax.T_Item.Type == "Recipe" then xdefm_Command( ply, "MoveCraft", pax.S_Place ) end return
				end
				if IsValid( men[ "Trade" ] ) and istable( men[ "Trade" ].T_Slo1 ) then
					local num = 0  for k, v in pairs( men[ "Trade" ].T_Slo1 ) do
					if isstring( v.S_Item ) and v.S_Item == "_" then num = k break end end
					if num > 0 then xdefm_Command( ply, "MoveTrade", pax.S_Place.."|"..num )
					else xdefm_AddNote( ply, "!V", "resource/warning.wav", "cross", 5 ) end return
				elseif pax.T_Item.Type == "Bait" and pax.S_Place != "21" then xdefm_Command( ply, "MoveInv", pax.S_Place.."|21" ) return end
			end
			if typ == "Bank" and men[ "Inventory" ] then
				local num = 0  for k, v in pairs( pro.Items ) do
					if isstring( v ) and v == "_" and ( k != 21 or pax.T_Item.Type == "Bait" ) then num = k break end
				end if num > 0 then xdefm_Command( ply, "MoveBank", num.."|"..pax.S_Place )
				else xdefm_AddNote( ply, "xdefm.FullInv", "resource/warning.wav", "cross", 5 ) end return
			end
			if typ == "Storage" and men[ "Inventory" ] then
				local num = 0  for k, v in pairs( pro.Items ) do
					if isstring( v ) and v == "_" and ( k != 21 or pax.T_Item.Type == "Bait" ) then num = k break end
				end if num > 0 then xdefm_Command( ply, "Struct", num.."|"..pax.S_Place )
				else xdefm_AddNote( ply, "xdefm.FullInv", "resource/warning.wav", "cross", 5 ) end return
			end
			if typ == "Trade" and men[ "Inventory" ] then
				local num = 0  for k, v in pairs( pro.Items ) do
					if isstring( v ) and v == "_" and ( k != 21 or pax.T_Item.Type == "Bait" ) then num = k break end
				end if num > 0 then xdefm_Command( ply, "MoveTrade", num.."|"..pax.S_Place )
				else xdefm_AddNote( ply, "xdefm.FullInv", "resource/warning.wav", "cross", 5 ) end return
			end
			if typ == "Recipe" and men[ "Inventory" ] then
				local num = 0  for k, v in pairs( pro.Items ) do
					if !isstring( v ) or k == 21 then continue end
					if v == "_" then num = k break end local aa, bb = xdefm_ItemGet( v )
				end if num > 0 then xdefm_Command( ply, "MoveCraft", num )
				else xdefm_AddNote( ply, "xdefm.FullInv", "resource/warning.wav", "cross", 5 ) end return
			end
		end end
		pax:Receiver( "XDEFM_MenuDrop", function( own, pan, drp ) --own是B,ppp是A,从A到B
			if ispanel( own ) and ispanel( pan[1] ) and pan[1].B_OnMove and drp then local ppp = pan[1]
				if own.S_Type == ppp.S_Type and own.S_Type == "Inventory" then
					xdefm_Command( LocalPlayer(), "MoveInv", own.S_Place.."|"..ppp.S_Place )
				end
				if own.S_Type != ppp.S_Type then
					if ppp.S_Type == "Inventory" and own.S_Type == "Bank" then
						xdefm_Command( LocalPlayer(), "MoveBank", ppp.S_Place.."|"..own.S_Place )
					elseif own.S_Type == "Inventory" and ppp.S_Type == "Bank" then
						xdefm_Command( LocalPlayer(), "MoveBank", own.S_Place.."|"..ppp.S_Place )
					end
					if ppp.S_Type == "Inventory" and own.S_Type == "Storage" then
						xdefm_Command( LocalPlayer(), "Struct", ppp.S_Place.."|"..own.S_Place )
					elseif own.S_Type == "Inventory" and ppp.S_Type == "Storage" then
						xdefm_Command( LocalPlayer(), "Struct", own.S_Place.."|"..ppp.S_Place )
					end
					if ppp.S_Type == "Inventory" and own.S_Type == "Trade" then
						xdefm_Command( LocalPlayer(), "MoveTrade", ppp.S_Place.."|"..own.S_Place )
					elseif own.S_Type == "Inventory" and ppp.S_Type == "Trade" then
						xdefm_Command( LocalPlayer(), "MoveTrade", own.S_Place.."|"..ppp.S_Place )
					end
					if ppp.S_Type == "Inventory" and own.S_Type == "Recipe" then
						xdefm_Command( LocalPlayer(), "MoveCraft", ppp.S_Place )
					elseif own.S_Type == "Inventory" and ppp.S_Type == "Recipe" then
						xdefm_Command( LocalPlayer(), "MoveCraft", own.S_Place )
					end
				end
				if own.S_Type == ppp.S_Type and own.S_Type == "Bank" then
					xdefm_Command( LocalPlayer(), "MoveBankOuter", own.S_Place.."|"..ppp.S_Place )
				end
				if own.S_Type == ppp.S_Type and own.S_Type == "Trade" then
					xdefm_Command( LocalPlayer(), "MoveTradeOuter", own.S_Place.."|"..ppp.S_Place )
				end
				if own.S_Type == ppp.S_Type and own.S_Type == "Storage" then
					xdefm_Command( LocalPlayer(), "StructOuter", own.S_Place.."|"..ppp.S_Place )
				end
			end
		end )
		function pax:Think()
			if isbool( self:IsDragging() ) and self.B_OnMove != self:IsDragging() then self.B_OnMove = self:IsDragging()
			end if xdefm.miscs.AimPan == pax then xdefm.miscs.Marker = pax.S_Item end
		end end
		function pax:OnCursorEntered() xdefm.miscs.AimPan = pax  xdefm.miscs.Marker = pax.S_Item  pax.B_OnMove = true  if pax.S_Item != "_" then xdefm.miscs.LC = false end end
		function pax:OnCursorExited() if xdefm.miscs.AimPan == pax then xdefm.miscs.AimPan = nil  xdefm.miscs.Marker = nil end  pax.B_OnMove = false end
		function pax:F_SetupItem( ite ) if !isstring( ite ) then return end local aa, bb = xdefm_ItemGet( ite )  if IsValid( pax.P_Txt ) then pax.P_Txt:Remove() end
			if !istable( aa ) or !istable( bb ) or ite == "_" or ite == "" then if IsValid( pax.P_Mdl ) then pax.P_Mdl:Remove() end
				pax.T_Item = nil  pax.T_Extra = nil  pax.S_Name = ""  pax.N_Rarity = 0  pax.S_Item = "_"  pax.N_Lerp = 1
			else if !IsValid( pax.P_Mdl ) then pax.P_Mdl = pax:Add( "ModelImage" ) pax.P_Mdl:DockMargin( 5, 5, 5, 5 )
					pax.P_Mdl:Dock( FILL ) pax.P_Mdl:SetModel( bb.Model[ 1 ] ) pax.P_Mdl:SetMouseInputEnabled( false )
				else pax.P_Mdl:SetModel( bb.Model[ 1 ] ) end pax.S_Name = bb.Name  pax.N_Rarity = math.Clamp( bb.Rarity, 0, 5 )
				pax.T_Item = bb  pax.T_Extra = aa  pax.S_Item = ite  local col = xdefm.miscs.Rarity[ pax.N_Rarity+1 ]
				local pap = vgui.Create( "DPanel", pax ) pap:SetSize( w, h*0.25 ) pap:SetPos( 0, h*0.75 ) pap:SetMouseInputEnabled( false )
				function pap:Paint( ww, hh ) if pax.N_Rarity !=0 then draw.RoundedBox( 0, 0, 0, ww, hh, Color( 0, 0, 0, 200 ) )
					surface.SetFont( "xdefm_Font2" )  local nam = ( pax.S_Name != "_" and pax.S_Name or "" ) local size, _ = surface.GetTextSize( nam )
					local xx = 0  if size >= w then xx = math.sin( CurTime()*2 )*size/2 end
					draw.TextShadow( { text = nam, pos = { ww/2 +xx/2, hh/2 }, font = "xdefm_Font2",
						xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = col
					}, 1, 255 ) surface.SetDrawColor( col )
					surface.DrawOutlinedRect( 0, 0, w, math.ceil( h*0.25 ), 1 ) end
				end pax.P_Txt = pap
			end
		end
		return pax
	end
	function xdefm_CutBox( per, x, y, w, h, lu, ru, rd, ld )
		per = isnumber( per ) and per or 1
		local box = {}
		table.insert( box, { x = x, y = y +per } )
		if lu then
			table.insert( box, { x = x +per, y = y } )
		else
			table.insert( box, { x = x, y = y } )
		end
		if ru then
			table.insert( box, { x = x +w -per, y = y } )
			table.insert( box, { x = x +w, y = y +per } )
		else
			table.insert( box, { x = x +w, y = y } )
		end
		if rd then
			table.insert( box, { x = x +w, y = y +h -per } )
			table.insert( box, { x = x +w -per, y = y +h } )
		else
			table.insert( box, { x = x +w, y = y +h } )
		end
		if ld then
			table.insert( box, { x = x +per, y = y +h } )
			table.insert( box, { x = x, y = y +h -per } )
		else
			table.insert( box, { x = x, y = y +h } )
		end
		surface.DrawPoly( box )
	end

	hook.Add( "AddToolMenuCategories", "xdefm_UCat", function()
		spawnmenu.AddToolCategory( "Utilities", "XDEFMod", "#xdefm.UCat" )
	end )
    hook.Add( "InitPostEntity", "xdefm_LoadProfile", function()
        net.Start( "NET_xdefm_NeedProfile" )
        net.SendToServer()
	end )
	hook.Add( "PopulateToolMenu", "xdefm_UMenus", function()
		spawnmenu.AddToolMenuOption( "Utilities", "XDEFMod", "XDEFModSV", "#xdefm.UMenuS1", "", "", function( panel )
			panel:ClearControls() panel:Help( "#xdefm.UMenuS2" )
			local button = panel:Button( "#xdefm.UPart1" )
			function button:DoClick()
				RunConsoleCommand( "xdefmod_tempmode", 0 )
				RunConsoleCommand( "xdefmod_nodepth", 0 )
				RunConsoleCommand( "xdefmod_refund", 1 )
				RunConsoleCommand( "xdefmod_lbdelay", 10 )
				RunConsoleCommand( "xdefmod_thief", 10 )
				RunConsoleCommand( "sbox_maxxdefmod_items", 30 )
				RunConsoleCommand( "xdefmod_noprophurt", 1 )
				RunConsoleCommand( "xdefmod_hurtrod", 0 )
				RunConsoleCommand( "xdefmod_skpcool", 5 )
				RunConsoleCommand( "xdefmod_salecool", 5 )
				RunConsoleCommand( "xdefmod_thiefnerf", 0 )
				RunConsoleCommand( "xdefmod_qsttime", 10 )
				RunConsoleCommand( "xdefmod_darkrp", 0.05 )
				RunConsoleCommand( "xdefmod_nomorehook", 0 )
			end
			panel:CheckBox( "#xdefm.c_tempmode1", "xdefmod_tempmode" ) panel:ControlHelp( "#xdefm.c_tempmode2" )
			panel:CheckBox( "#xdefm.c_nodepth1", "xdefmod_nodepth" ) panel:ControlHelp( "#xdefm.c_nodepth2" )
			panel:CheckBox( "#xdefm.c_refund1", "xdefmod_refund" ) panel:ControlHelp( "#xdefm.c_refund2" )
			panel:CheckBox( "#xdefm.c_noprophurt1", "xdefmod_noprophurt" ) panel:ControlHelp( "#xdefm.c_noprophurt2" )
			panel:CheckBox( "#xdefm.c_hurtrod1", "xdefmod_hurtrod" ) panel:ControlHelp( "#xdefm.c_hurtrod2" )
			panel:CheckBox( "#xdefm.c_thiefnerf1", "xdefmod_thiefnerf" ) panel:ControlHelp( "#xdefm.c_thiefnerf2" )
			panel:CheckBox( "#xdefm.c_nomorehook1", "xdefmod_nomorehook" ) panel:ControlHelp( "#xdefm.c_nomorehook2" )
			panel:NumSlider( "#xdefm.c_thief1", "xdefmod_thief", 0, 100, 0 ) panel:ControlHelp( "#xdefm.c_thief2" )
			panel:NumSlider( "#xdefm.c_skpcool1", "xdefmod_skpcool", 0, 600, 0 ) panel:ControlHelp( "#xdefm.c_skpcool2" )
			panel:NumSlider( "#xdefm.c_salecool1", "xdefmod_salecool", 0, 60, 0 ) panel:ControlHelp( "#xdefm.c_salecool2" )
			panel:NumSlider( "#xdefm.c_lbdelay1", "xdefmod_lbdelay", 0, 60, 0 ) panel:ControlHelp( "#xdefm.c_lbdelay2" )
			panel:NumSlider( "#xdefm.c_qsttime1", "xdefmod_qsttime", 0, 60, 0 ) panel:ControlHelp( "#xdefm.c_qsttime2" )
			panel:NumSlider( "#xdefm.c_darkrp1", "xdefmod_darkrp", 0.01, 10, 2 ) panel:ControlHelp( "#xdefm.c_darkrp2" )
			panel:NumSlider( "#xdefm.c_maxxdefmod_items", "sbox_maxxdefmod_items", 0, 200, 0 )
		end )
		spawnmenu.AddToolMenuOption( "Utilities", "XDEFMod", "XDEFModCL", "#xdefm.UMenuC1", "", "", function( panel )
			panel:ClearControls()
			panel:Help( "#xdefm.UMenuC2" )
			local button = panel:Button( "#xdefm.UPart1" )
			function button:DoClick()
				RunConsoleCommand( "xdefmod_collect", 0 )
				RunConsoleCommand( "xdefmod_animui", 1 )
				RunConsoleCommand( "xdefmod_quickinv", -1 )
				RunConsoleCommand( "xdefmod_tagdist", 256 )
				RunConsoleCommand( "xdefmod_renderdist", 2048 )
				RunConsoleCommand( "xdefmod_showhook", 1 )
				RunConsoleCommand( "xdefmod_printnote", 0 )
				RunConsoleCommand( "xdefmod_drawhalo", 1 )
				RunConsoleCommand( "xdefmod_printcmd", 0 )
				RunConsoleCommand( "xdefmod_fastreel", 0 )
				RunConsoleCommand( "xdefmod_fps", 0 )
				RunConsoleCommand( "xdefmod_sonar", 1 )
				RunConsoleCommand( "xdefmod_collection", "11111111111" )
				RunConsoleCommand( "xdefmod_bgr", 28 )
				RunConsoleCommand( "xdefmod_bgg", 25 )
				RunConsoleCommand( "xdefmod_bgb", 72 )
				RunConsoleCommand( "xdefmod_bga", 255 )
				RunConsoleCommand( "xdefmod_brr", 0 )
				RunConsoleCommand( "xdefmod_brg", 206 )
				RunConsoleCommand( "xdefmod_brb", 209 )
				RunConsoleCommand( "xdefmod_bra", 255 )
			end
			panel:CheckBox( "#xdefm.c_fps1", "xdefmod_fps" )
			panel:CheckBox( "#xdefm.Sonar2", "xdefmod_sonar" )
			panel:CheckBox( "#xdefm.c_fastreel1", "xdefmod_fastreel" )
			panel:CheckBox( "#xdefm.c_showhook1", "xdefmod_showhook" )
			panel:CheckBox( "#xdefm.c_drawhalo1", "xdefmod_drawhalo" )
			panel:CheckBox( "#xdefm.c_animui1", "xdefmod_animui" )
			panel:CheckBox( "#xdefm.c_collect1", "xdefmod_collect" )
			panel:CheckBox( "#xdefm.c_printnote1", "xdefmod_printnote" )
			panel:CheckBox( "#xdefm.c_printcmd1", "xdefmod_printcmd" )
			panel:NumSlider( "#xdefm.c_tagdist1", "xdefmod_tagdist", 0, 10000, 0 )
			panel:NumSlider( "#xdefm.c_renderdist1", "xdefmod_renderdist", 0, 100000, 0 )
			panel:KeyBinder( "#xdefm.c_quickinv1", "xdefmod_quickinv" )
			panel:ColorPicker( "#xdefm.c_bg", "xdefmod_bgr", "xdefmod_bgg", "xdefmod_bgb", "xdefmod_bga" )
			panel:ColorPicker( "#xdefm.c_br", "xdefmod_brr", "xdefmod_brg", "xdefmod_brb", "xdefmod_bra" )
		end )
	end )
	hook.Add( "ShouldDrawLocalPlayer", "xdefm_DrawPly", function( ply )
		local wep = ply:GetActiveWeapon()
		if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" and GetConVar( "xdefmod_fps" ):GetInt() != 1 then
			return true
		end
	end )
	hook.Add( "CalcView", "xdefm_Cam", function( ply, pos, ang, fov )
		local wep = ply:GetActiveWeapon()
		if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" then
			if GetConVar( "xdefmod_fps" ):GetInt() != 1 then
				local siz = ply:OBBMins():Distance( ply:OBBMaxs() )
				local LPos, LAng = Vector( -40, 0, 10 ), ang
				if xdefm.miscs.SeeAng then
					LAng = Angle( xdefm.miscs.SeeAng.pitch, xdefm.miscs.SeeAng.yaw, 0 )
				end
				local NPos, NAng = LocalToWorld( LPos, LAng, pos, ang )
				local tr = util.TraceLine( {
					start = ply:EyePos(),
					endpos = ply:EyePos() -LAng:Forward()*siz*xdefm.miscs.FOV,
					filter = ply,
					mask = MASK_SHOT_HULL
				} )
				local view = {
					origin = tr.HitPos +tr.HitNormal,
					angles = LAng,
					fov = fov,
					drawviewer = true
				}
				return view
			else
				local view = {
					origin = pos,
					angles = ang,
					fov = fov,
					drawviewer = false
				}
				return view
			end
		end
	end )
	hook.Add( "CreateMove", "xdefm_MoveCL", function( cmd )
		local ply, wep = LocalPlayer(), LocalPlayer():GetActiveWeapon()
		if cmd:KeyDown( IN_USE ) and !xdefm.miscs.Reloaded then
			xdefm.miscs.Reloaded = true
			if ply:KeyDown( IN_RELOAD ) then
				net.Start( "NET_xdefm_Pickup" )
				net.WriteEntity( ply )
				net.SendToServer()
			end
		elseif xdefm.miscs.Reloaded and !cmd:KeyDown( IN_USE ) then
			xdefm.miscs.Reloaded = false
		end
		if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" and GetConVar( "xdefmod_fps" ):GetInt() != 1 then
			if !xdefm.miscs.SeeAng then
				xdefm.miscs.SeeAng = Angle( 0, cmd:GetViewAngles().yaw, 0 )
				cmd:SetViewAngles( xdefm.miscs.SeeAng )
			else
				xdefm.miscs.SeeAng = xdefm.miscs.SeeAng +Angle( cmd:GetMouseY()/50, -cmd:GetMouseX()/50, 0 )
				xdefm.miscs.SeeAng = Angle( math.Clamp( xdefm.miscs.SeeAng.pitch, -90, 90 ), xdefm.miscs.SeeAng.yaw, 0 )
			end
		else
			if xdefm.miscs.SeeAng then xdefm.miscs.SeeAng = nil end
			if xdefm.miscs.CamAng then xdefm.miscs.CamAng = nil end
		end
		if cmd:KeyDown( IN_WALK ) or cmd:KeyDown( IN_FORWARD ) or cmd:KeyDown( IN_BACK ) or cmd:KeyDown( IN_MOVELEFT ) or cmd:KeyDown( IN_MOVERIGHT ) then
			if xdefm.miscs.CamAng then
				xdefm.miscs.CamAng = nil
			end
			if xdefm.miscs.SeeAng and IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" then
				cmd:SetViewAngles( Angle( math.Clamp( xdefm.miscs.SeeAng.pitch, -45, 45 ), xdefm.miscs.SeeAng.yaw, 0 ) )
			end
		elseif IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" then
			if !xdefm.miscs.CamAng then
				xdefm.miscs.CamAng = cmd:GetViewAngles()
			else
				cmd:SetViewAngles( xdefm.miscs.CamAng )
			end
		end
	end )
	hook.Add( "RenderScene", "xdefm_MoveRod", function()
		for k, v in pairs( ents.FindByClass( "xdefm_*" ) ) do
			if !IsValid( v ) or v:GetClass() == "xdefm_firespot" or !IsValid( v:GetFMod_OW() ) then continue end
			if isfunction( v.xdefm_Move ) then
				v:xdefm_Move()
			end
		end
	end )
	hook.Add( "HUDPaint", "xdefm_Notes", function()
		local ply = LocalPlayer()
		if istable( xdefm.miscs.Notes ) and #xdefm.miscs.Notes > 0 then
			local hei = 0
			for k, v in pairs( xdefm.miscs.Notes ) do
				if !istable( v ) or #v != 4 or ( v[ 1 ] < SysTime() and math.Round( v[ 4 ], 2 ) == 0 ) then continue end
				local aaa = math.Clamp( math.Round( v[ 4 ]*255 ), 1, 254 )
				surface.SetFont( "xdefm_Font1" )
				local size, _ = surface.GetTextSize( v[ 2 ] )
				size = math.Clamp( size, 15, 200 )
				local mark = markup.Parse( "<color=255,255,255,255><font=xdefm_Font1>"..v[ 2 ].."</color></font>", size*2 )
				local posx, posy, ler = math.Round( ScrW() -10, 2 ), math.Round( ScrH()/2 +hei, 2 ), v[ 4 ]
				draw.RoundedBox( 0, posx -mark:GetWidth()*ler -5 -35, posy +1, mark:GetWidth() +20 +20, mark:GetHeight() +10, Color( xdefm.lin_col.r, xdefm.lin_col.g, xdefm.lin_col.b, aaa ) )
				draw.RoundedBox( 0, posx -mark:GetWidth()*ler -4 -35, posy +2, mark:GetWidth() +18 +20, mark:GetHeight() +8, Color( xdefm.ext_col.r, xdefm.ext_col.g, xdefm.ext_col.b, aaa ) )
				draw.RoundedBox( 0, posx -mark:GetWidth()*ler -3 -35, posy +3, mark:GetWidth() +16 +20, mark:GetHeight() +6, Color( xdefm.bck_col.r, xdefm.bck_col.g, xdefm.bck_col.b, aaa ) )
				draw.RoundedBoxEx( 0, posx -mark:GetWidth()*ler -38, posy +3, 22, mark:GetHeight() +6, Color( xdefm.ext_col.r*0.5, xdefm.ext_col.g*0.5, xdefm.ext_col.b*0.5, aaa ), true, false, true, false )
				mark:Draw( posx -mark:GetWidth()*ler +mark:GetWidth()*0.5 -10, posy +6, TEXT_ALIGN_CENTER, nil, aaa )
				surface.SetMaterial( v[ 3 ] )
				surface.SetDrawColor( 255, 255, 255, aaa )
				surface.DrawTexturedRect( posx -mark:GetWidth()*ler -36, posy +mark:GetHeight()*0.5 -1, 16, 16 )
				hei = hei +math.Round( ( mark:GetHeight() +15 )*math.Clamp( ler, 0.01, 1 ), 3 )
			end
		end
		if IsValid( ply ) and IsValid( ply:GetWeapon( "weapon_xdefm_trade" ) ) and !ply:GetNWBool( "XDEFMod_BTD" ) then
			local tax = ply:GetNWEntity( "XDEFMod_TPL" )
			for k, v in pairs( player.GetAll() ) do
				if !IsValid( v ) or !v:Alive() or v:WorldSpaceCenter():DistToSqr( ply:WorldSpaceCenter() ) > 70000 then continue end
				local tar = v:GetNWEntity( "XDEFMod_TPL" )
				if tar:IsPlayer() and tar == ply and tax != v then
					local col, scr = Color( 255, 255, 0 ), v:WorldSpaceCenter():ToScreen()
					scr.x = math.Round( scr.x )
					scr.y = math.Round( scr.y )
					draw.TextShadow( {
						text = v:Nick(),
						pos = { scr.x, scr.y },
						font = "xdefm_Font5",
						xalign = TEXT_ALIGN_CENTER,
						yalign = TEXT_ALIGN_CENTER,
						color = col
					}, 1, 255 )
					draw.TextShadow( {
						text = language.GetPhrase( "xdefm.Trade10" ),
						pos = { scr.x, scr.y +20 },
						font = "xdefm_Font1",
						xalign = TEXT_ALIGN_CENTER,
						yalign = TEXT_ALIGN_CENTER,
						color = col
					}, 1, 255 )
				end
			end
		end
	end )
	hook.Add( "DrawOverlay", "xdefm_Info", function()
		local ply, dat = LocalPlayer(), "_"
		if !IsValid( xdefm.miscs.AimPan ) and xdefm.miscs.Marker != nil then
			xdefm.miscs.Marker = nil
		end 
		if IsValid( xdefm.miscs.AimPan ) and xdefm.miscs.Marker != nil and vgui.CursorVisible() then
			local pan = xdefm.miscs.AimPan
			local mat, typ, ite, use, man = I0, pan.S_Type, pan.S_Item, false, xdefm.miscs.Menus 
			local k1 = ite != "_" and ( input.IsControlDown() or input.IsButtonDown( KEY_LCONTROL ) or input.IsButtonDown( KEY_RCONTROL ) )
			local k2 = ite != "_" and !k1 and ( input.IsShiftDown() or input.IsButtonDown( KEY_LSHIFT ) or input.IsButtonDown( KEY_RSHIFT ) )
			if k1 and typ == "Inventory" then
				use = true
				mat = ( xdefm_GetPrice( ite ) > 0 and I3 or I4 )
			elseif k2 then
				if typ == "Inventory" then
					local aa, bb = xdefm_ItemGet( ite )
					if istable( bb ) then
						use = true
						if IsValid( man[ "Bank" ] ) then
							mat = I5
						elseif bb.Type == "Recipe" and IsValid( man[ "Craft" ] ) then
							mat = I6
						elseif bb.Type == "Bait" then
							mat = I5
						end
					end
				end
				if typ == "Inventory" and ( IsValid( man[ "Bank" ] ) or IsValid( man[ "Trade" ] ) or ( IsValid( man[ "Struct" ] ) and man[ "Struct" ].N_SType == 1 ) ) then
					use = true
					mat = I2
				elseif typ == "Bank" and IsValid( man[ "Inventory" ] ) then
					use = true
					mat = I1
				elseif typ == "Storage" and IsValid( man[ "Inventory" ] ) then
					use = true
					mat = I1
				elseif typ == "Recipe" and IsValid( man[ "Inventory" ] ) then
					use = true
					mat = I1
				end
			end
			local xx, yy = input.GetCursorPos()
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.SetMaterial( mat )
			if use then
				surface.DrawTexturedRect( xx, yy, 16, 16 )
			else
				surface.DrawTexturedRect( xx, yy, 24, 24 )
			end
		end
		if IsValid( ply ) and !vgui.CursorVisible() and ply:GetEyeTrace() != nil and IsValid( ply:GetEyeTrace().Entity ) and ply:GetEyeTrace().Entity.xdefm_OnLook
		and isstring( ply:GetEyeTrace().Entity:GetFMod_DT() ) then
			dat = ply:GetEyeTrace().Entity:GetFMod_DT()
		elseif IsValid( ply ) and isstring( xdefm.miscs.Marker ) and !dragndrop.IsDragging() then
			dat = xdefm.miscs.Marker
		end
		local dl = ( dat == "_" )
		if GetConVar( "xdefmod_animui" ):GetInt() > 0 then
			local ttt = string.Explode( "|", dat )
			if xdefm.miscs.LS != ttt[ 1 ] then
				xdefm.miscs.LS = ttt[ 1 ]
				if dat != "_" then xdefm.miscs.DS = dat end
				xdefm.miscs.DL = SysTime() +0.25
			end
		end
		if IsValid( ply ) and ( xdefm.miscs.DS != "_" or xdefm.miscs.DL > SysTime() ) then
		dat = xdefm.miscs.DS
		local aa, bb = xdefm_ItemGet( dat )
		if istable( aa ) and istable( bb ) then
			local xx, yy = 0, 0
			local ent = ply:GetEyeTrace().Entity
			if xdefm.miscs.KeyEnt != ent then
				xdefm.miscs.KeyEnt = ent
				xdefm.miscs.KeyLer = 0
			end
			if IsValid( ent ) and ent:GetClass() == "xdefm_base" and !vgui.CursorVisible() then
				xx = ent:GetPos():ToScreen().x
				yy = ent:GetPos():ToScreen().y
			else
				xx, yy = input.GetCursorPos()
				if xx == 0 and yy == 0 then
					xx, yy = ScrW()/2, ScrH()/2
				end
			end
			if !dl then
				xdefm.miscs.DX, xdefm.miscs.DY = xx, yy
				if xdefm.miscs.DS != dat then
					xdefm.miscs.KeyLer = 0
				end
				xdefm.miscs.DS = dat
			else
				xx, yy = xdefm.miscs.DX, xdefm.miscs.DY
			end
			xx, yy = math.Round( xx +28, 1 ), math.Round( yy +28, 1 )
			if istable( xdefm.miscs.Craft ) and xdefm.miscs.LC and !( input.IsShiftDown() or input.IsButtonDown( KEY_LSHIFT ) or input.IsButtonDown( KEY_RSHIFT ) ) then
				local cft = xdefm.miscs.Craft  local ite = ply.xdefm_Profile.Items
				local per = ( GetConVar( "xdefmod_animui" ):GetInt() > 0 and math.Clamp( ( xdefm.miscs.DL -SysTime() )/0.25, 0, 1 ) or 1 )
				if !dl then per = 1-per end
				xx, yy = input.GetCursorPos()  xx, yy = math.Round( xx, 1 ), math.Round( yy, 1 )
				if !istable( xdefm.miscs.Ings ) then xdefm.miscs.Ings = {}  xdefm.miscs.Ing2 = {} else
					local itt, yes = cft[ #xdefm.miscs.Ings +1 ], false
					if isstring( itt ) and #xdefm.miscs.Ings +1 != #cft then
						for m, n in pairs( ite ) do if n == "_" or m == 21 then continue end
							if xdefm_GetClass( n ) == itt and !isbool( xdefm.miscs.Ing2[ m ] ) then yes = true  xdefm.miscs.Ing2[ m ] = true break end
					end table.insert( xdefm.miscs.Ings, yes ) end local upp = false  local x2, y2 = xx, yy
					render.SetScissorRect( xx +16, yy, xx +48 +150, yy +( ( #cft )*24 +48 )*per, true )
					for k, v in pairs( xdefm.miscs.Ings ) do if !isbool( v ) or !isstring( cft[ k ] ) then continue end
						local aa, bb = xdefm_ItemGet( cft[ k ] ) if !istable( bb ) then continue end
						local col = ( v and Color( 0, 255, 0 ) or Color( 255, 0, 0 ) )
						local bck = ( v and Color( 100, 100, 100 ) or Color( 55, 55, 55 ) )
						x2, y2 = xx +20, yy +k*25
						surface.SetDrawColor( bck ) surface.DrawRect( x2 -4, y2 -4, 28 +150, 26 )
						surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( x2 -4, y2 -4, 28 +150, 26, 2 )
						surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( x2 -4, y2 -4, 28 +150, 26, 1 )
						surface.SetDrawColor( 255, 255, 255, 255 ) surface.SetMaterial( xdefm.miscs.Icons[ bb.Type ] )
						surface.DrawTexturedRect( x2 +2, y2 +1, 16, 16 ) draw.TextShadow( {
							text = xdefm_ItemMark( cft[ k ], true ), pos = { x2 +4 +19, y2 +2 },
							font = "xdefm_Font2", xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_TOP, color = col
						}, 1, 255 ) if !upp then upp = true  local ye2 = true
							for k, v in pairs( xdefm.miscs.Ings ) do if v == false then ye2 = false break end end
							x2, y2 = x2 +146, y2 +#cft*25
							draw.RoundedBoxEx( 0, x2 -4, y2 -27, 32, 25, xdefm.lin_col, true, true, false, false )
							draw.RoundedBoxEx( 0, x2 -4 +1, y2 -27 +1, 32 -2, 25 -2, xdefm.ext_col, true, true, false, false )
							draw.RoundedBoxEx( 0, x2 -4 +2, y2 -27 +2, 32 -4, 25 -4, ye2 and Color( 0, 100, 0 ) or Color( 100, 0, 0 ), true, true, false, false )
							surface.SetDrawColor( 255, 255, 255, 255 ) surface.SetMaterial( ye2 and yee or noo )
							surface.DrawTexturedRect( x2 +4, y2 -22, 16, 16 )
						end
					end
					render.SetScissorRect( 0, 0, 0, 0, false )
				end
			else
				if istable( xdefm.miscs.Ings ) then xdefm.miscs.Ings = nil  xdefm.miscs.Ing2 = nil end
				local rar = ( bb.Rarity + 1 )
				local col = xdefm.miscs.Rarity[ rar ]
				local txt = xdefm_ItemMark( dat )
				if string.find( string.lower( txt ), "&" ) != nil then
					local tab = string.Explode( "&", txt )
					for k, v in pairs( tab ) do
						if v != "" and v != " " and string.find( string.lower( v ), "xdefm." ) != nil then
							tab[ k ] = language.GetPhrase( v )
						end
					end
					txt = table.concat( tab, "" )
				elseif string.find( string.lower( txt ), "xdefm." ) then
					txt = language.GetPhrase( txt )
				end
				local str = "<font=xdefm_Font1>"..string.Replace( txt, "&", "" ).."</font>\n"
				if GetConVar( "developer" ):GetInt() > 0 then
					str = str.."<font=xdefm_Font2><color=155,155,155,255>["..dat.."]</color></font>\n"
				end
				str = str.."<font=xdefm_Font2><color=155,155,155,255>"..language.GetPhrase( xdefm.miscs.Rarit2[ rar ] ).." "..language.GetPhrase( "xdefm."..bb.Type ).."</color></font>\n\n"
				if language.GetPhrase( bb.Helper ) != "" then
					str = str.."<font=xdefm_Font2><color=255,255,255,255>"..language.GetPhrase( bb.Helper ).."</color></font>\n\n"
				end
				local prc = xdefm_GetPrice( dat )
				if bb.Type == "Bait" and isnumber( bb.Consume ) then
					local per = tostring( math.Round( ( 1/bb.Consume )*100 ) ).."%"
					str = str.."<font=xdefm_Font2><color=155,155,155,255>"..language.GetPhrase( "xdefm.Consume" )..": "..per.."</color></font>\n"
					str = str.."<font=xdefm_Font2><color=155,155,155,255>"..language.GetPhrase( "xdefm.Level" )..": "..bb.Level.."</color></font>\n"
				elseif bb.Type == "Recipe" and isnumber( bb.Durability ) then
					if aa[ 2 ] then
						str = str.."<font=xdefm_Font2><color=155,155,155,255>"..language.GetPhrase( "xdefm.Durability" )..": "..aa[ 2 ].."/"..bb.Durability.."</color></font>\n"
					else
						str = str.."<font=xdefm_Font2><color=155,155,155,255>"..language.GetPhrase( "xdefm.Durability" )..": "..bb.Durability.."</color></font>\n"
					end
				end
				if IsValid( ent ) and ent:GetClass() == "xdefm_base" and !vgui.CursorVisible() then
					local own = ""
					if IsValid( ent:GetFMod_OW() ) and ent:GetFMod_OW():IsPlayer() then
						own = ent:GetFMod_OW():Nick()
					elseif isstring( ent:GetFMod_OI() ) and ent:GetFMod_OI() != "" then
						own = ent:GetFMod_OI()
					end
					if own != "" then
						str = str.."<font=xdefm_Font2><color=155,155,155,255>"..language.GetPhrase( "xdefm.Owner" )..": "..own.."</color></font>\n"
					end
				end
				if prc > 0 then
					str = str.."<font=xdefm_Font2><color=155,155,155,255>"..language.GetPhrase( "xdefm.Price" )..": "..prc.."</color></font>"
				end
				local mark = markup.Parse( str, 250 )
				local ww, hh = mark:GetWidth(), mark:GetHeight()
				local per = ( GetConVar( "xdefmod_animui" ):GetInt() > 0 and math.Clamp( ( xdefm.miscs.DL -SysTime() )/0.25, 0, 1 ) or 1 )
				if !dl then per = 1-per end  local aaa = per*255
				if GetConVar( "xdefmod_collect" ):GetInt() > 0 and !isnumber( xdefm.besti[ xdefm_GetClass( dat ) ] ) then
					draw.TextShadow( {
						text = language.GetPhrase( "xdefm.Besti2" ),
						pos = { xx +256, yy +hh*per +20 },
						font = "xdefm_Font1",
						xalign = TEXT_ALIGN_RIGHT,
						yalign = TEXT_ALIGN_CENTER,
						color = Color( 0, 255, 255, aaa )
					}, 1, aaa )
				end
				local x2, y2, w2, h2 = xx -7.5, yy -7.5, 265, hh +15
				render.SetScissorRect( x2 -4, y2 -4, x2 +( w2 +4 )*per, y2 +( h2 +4 )*per, true )
				draw.NoTexture()
				surface.SetDrawColor( Color( col.r*2, col.g*2, col.b*2, aaa ) )
				xdefm_CutBox( w2/10, x2 -2, y2 -2, w2 +4, h2 +4, false, false, true, false )
				surface.SetDrawColor( Color( col.r*0.15, col.g*0.15, col.b*0.15, aaa ) )
				xdefm_CutBox( w2/10, x2 -1, y2 -1, w2 +2, h2 +2, false, false, true, false )
				surface.SetDrawColor( col.r*0.25*aaa/255, col.g*0.25*aaa/255, col.b*0.25*aaa/255, aaa )
				surface.SetMaterial( Bck )
				surface.DrawTexturedRect( xx -7.5, yy -7.5, 265, math.min( 50, hh ) )
				mark:Draw( xx, yy, nil, nil, aaa )
				render.SetScissorRect( 0, 0, 0, 0, false )
				if IsValid( ent ) and dat != "_" and ent:GetClass() == "xdefm_base" and !vgui.CursorVisible() and per > 0
				and ( xdefm_CanInteract( LocalPlayer(), ent ) or ( GetConVar( "xdefmod_animui" ):GetInt() > 0 and xdefm.miscs.KeyLer > 0 ) ) then
					local hei = mark:GetHeight()*per +15
					xdefm.miscs.KeyLer = Lerp( 0.1, xdefm.miscs.KeyLer, xdefm_CanInteract( LocalPlayer(), ent ) and 1 or 0 )
					local alp = GetConVar( "xdefmod_animui" ):GetInt() > 0 and math.Clamp( xdefm.miscs.KeyLer/1*255, 0, 255 ) or 255
					local k1 = input.LookupBinding( "+use", true )
					if isstring( bb.HelperUse ) and isstring( k1 ) and bb.HelperUse != "" then
						local kk = string.Explode( "", k1 )
						if !istable( kk ) then
							k1 = string.upper( k1 )
						else
							kk[ 1 ] = string.upper( kk[ 1 ] )
							k1 = table.concat( kk, "" )
						end
						surface.SetFont( "xdefm_Font5" )
						local x1, y1 = surface.GetTextSize( k1 )
						xx, yy = math.Round( xx ), math.Round( yy )
						draw.RoundedBox( 0, xx -4, yy +hei, x1 +8, y1, ply:KeyDown( IN_USE ) and Color( 155, 155, 155, alp ) or Color( 55, 55, 55, alp ) )
						surface.SetDrawColor( Color( 255, 255, 255, alp ) )
						surface.DrawOutlinedRect( xx -4, yy +hei, x1 +8, y1, 2 )
						surface.SetDrawColor( Color( 0, 0, 0, alp ) )
						surface.DrawOutlinedRect( xx -4, yy +hei, x1 +8, y1, 1 )
						draw.TextShadow( {
							text = k1,
							pos = { xx +x1/2 -2, yy+hei +y1/2 },
							font = "xdefm_Font1",
							xalign = TEXT_ALIGN_CENTER,
							yalign = TEXT_ALIGN_CENTER,
							color = ply:KeyDown( IN_USE ) and Color( 255, 255, 0, alp ) or Color( 255, 255, 255, alp )
						}, 1, alp )
						draw.TextShadow( {
							text = language.GetPhrase( bb.HelperUse ),
							pos = { xx +x1 +12, yy+hei +y1/2 },
							font = "xdefm_Font2",
							xalign = TEXT_ALIGN_LEFT,
							yalign = TEXT_ALIGN_CENTER,
							color = Color( 255, 255, 255, alp )
						}, 1, alp )
						hei = hei +y1 +5
					end
					local k2 = input.LookupBinding( "+reload", true )
					if isstring( k1 ) and isstring( k2 ) then
						local kk1 = string.Explode( "", k1 )
						if !istable( kk1 ) then
							k1 = string.upper( k1 )
						else
							kk1[ 1 ] = string.upper( kk1[ 1 ] )
							k1 = table.concat( kk1, "" )
						end
						local kk2 = string.Explode( "", k2 )
						if !istable( kk2 ) then
							k2 = string.upper( k2 )
						else
							kk2[ 1 ] = string.upper( kk2[ 1 ] )
							k2 = table.concat( kk2, "" )
						end
						surface.SetFont( "xdefm_Font5" )
						local x1, y1 = surface.GetTextSize( k2 )
						local x2, y2 = surface.GetTextSize( k1 )
						draw.RoundedBox( 0, xx -4, yy +hei, x1 +8, y1, ply:KeyDown( IN_RELOAD ) and Color( 155, 155, 155, alp ) or Color( 55, 55, 55, alp ) )
						surface.SetDrawColor( Color( 255, 255, 255, alp ) )
						surface.DrawOutlinedRect( xx -4, yy +hei, x1 +8, y1, 2 )
						surface.SetDrawColor( Color( 0, 0, 0, alp ) )
						surface.DrawOutlinedRect( xx -4, yy +hei, x1 +8, y1, 1 )
						draw.RoundedBox( 0, xx -4 +x1 +28, yy +hei, x2 +8, y2, ply:KeyDown( IN_USE ) and Color( 155, 155, 155, alp ) or Color( 55, 55, 55, alp ) )
						surface.SetDrawColor( Color( 255, 255, 255, alp ) )
						surface.DrawOutlinedRect( xx -4 +x1 +28, yy +hei, x2 +8, y2, 2 )
						surface.SetDrawColor( Color( 0, 0, 0, alp ) )
						surface.DrawOutlinedRect( xx -4 +x1 +28, yy +hei, x2 +8, y2, 1 )
						local dst = ( bb.Price > 0 and "xdefm.Sell" or "xdefm.Destroy" )
						if bb.Carryable and ( ( bb.Type == "Bait" or bb.Type == "Recipe" ) or GetConVar( "xdefmod_tempmode" ):GetInt() <= 0 ) then
							dst = "xdefm.Store"
						end
						draw.TextShadow( {
							text = k2,
							pos = { xx +x1/2 -2, yy+hei +y1/2 },
							font = "xdefm_Font1",
							xalign = TEXT_ALIGN_CENTER,
							yalign = TEXT_ALIGN_CENTER,
							color = ply:KeyDown( IN_RELOAD ) and Color( 255, 255, 0, alp ) or Color( 255, 255, 255, alp )
						}, 1, alp )
						draw.TextShadow( {
							text = k1,
							pos = { xx +x1 +x2/2 +28 -2, yy+hei +y1/2 },
							font = "xdefm_Font1",
							xalign = TEXT_ALIGN_CENTER,
							yalign = TEXT_ALIGN_CENTER,
							color = ply:KeyDown( IN_USE ) and Color( 255, 255, 0, alp ) or Color( 255, 255, 255, alp )
						}, 1, alp )
						draw.TextShadow( {
							text = "+",
							pos = { xx +x1 +14, yy+hei +y1/2 },
							font = "xdefm_Font4",
							xalign = TEXT_ALIGN_CENTER,
							yalign = TEXT_ALIGN_CENTER,
							color = Color( 255, 255, 255, alp )
						}, 1, alp )
						draw.TextShadow( {
							text = language.GetPhrase( dst ),
							pos = { xx +x1 +x2 +40, yy+hei +y1/2 },
							font = "xdefm_Font2",
							xalign = TEXT_ALIGN_LEFT,
							yalign = TEXT_ALIGN_CENTER,
							color = Color( 255, 255, 255, alp )
						}, 1, alp )
					end
				elseif xdefm.miscs.KeyLer != 0 then
						xdefm.miscs.KeyLer = 0
					end
				end
			end
		end
	end )
	hook.Add( "Think", "xdefm_TKCL", function()
		local ply = LocalPlayer()
		if xdefm.miscs.FOV != xdefm.miscs.LFOV then
			xdefm.miscs.FOV = Lerp( 0.1, xdefm.miscs.FOV, xdefm.miscs.LFOV )
		end
		if IsValid( ply ) and istable( xdefm.miscs.Notes ) and #xdefm.miscs.Notes > 0 then
			local hei = 0 
			for k, v in pairs( xdefm.miscs.Notes ) do
				if !istable( v ) or #v != 4 or ( v[ 1 ] < SysTime() and math.Round( v[ 4 ], 2 ) == 0 ) then
					table.remove( xdefm.miscs.Notes, k )
					continue
				end
				if v[ 1 ] >= SysTime() and k >= #xdefm.miscs.Notes -6 then
					v[ 4 ] = Lerp( 0.2, v[ 4 ], 1 )
				else
					v[ 4 ] = Lerp( 0.1, v[ 4 ], 0 )
				end
			end
		end
	end )
	hook.Add( "HUDDrawTargetID", "xdefm_Info", function()
		local ply = LocalPlayer()
		if IsValid( ply ) and IsValid( ply:GetActiveWeapon() ) and ply:GetActiveWeapon():GetClass() == "weapon_xdefm_trade" then
			return false
		end
	end )
	hook.Add( "PlayerBindPress", "xdefm_WheelView", function( ply, bind, pressed )
		local wep = ply:GetActiveWeapon()
		if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" and GetConVar( "xdefmod_fps" ):GetInt() != 1
		and ( string.find( bind, "invprev" ) or string.find( bind, "invnext" ) ) then
			return true
		end
	end )

	net.Receive( "NET_xdefm_Menu", function()
		local ply, typ, tab = LocalPlayer(), tonumber( net.ReadString() ), util.JSONToTable( net.ReadString() )
		if typ != nil and tab != nil then
			xdefm_OpenMenu( ply, typ, tab )
		end
	end )
	net.Receive( "NET_xdefm_Anim", function()
		local ply, act = net.ReadEntity(), net.ReadFloat()
		if IsValid( ply ) and isnumber( act ) and ply:IsPlayer() then
			ply:AnimRestartGesture( GESTURE_SLOT_ATTACK_AND_RELOAD, math.Round( act ), true )
		end
	end )
	net.Receive( "NET_xdefm_Profile", function()
		local dat = net.ReadString()
		if !isstring( dat ) or dat == "" then return end
		local tab = util.JSONToTable( dat )
		if !istable( tab ) then return end
		LocalPlayer().xdefm_Profile = tab
	end )
	net.Receive( "NET_xdefm_SendNote", function()
		local txt, snd, dur, ico = net.ReadString(), net.ReadString(), net.ReadFloat(), net.ReadString()
		xdefm_AddNote( LocalPlayer(), txt, snd, ico, dur )
	end )
	net.Receive( "NET_xdefm_SendSnd", function()
		local ply, snd = LocalPlayer(), net.ReadString()
		if isstring( snd ) and snd != "" and snd != "!V" then
			surface.PlaySound( snd )
		end
	end )
	net.Receive( "NET_xdefm_BreakEF", function()
		local ent, typ = net.ReadEntity(), net.ReadFloat()
		if IsEntity( ent ) and isnumber( typ ) then
			xdefm_BreakEffect( ent, typ )
		end
	end )
	net.Receive( "NET_xdefm_MenuUpdate", function()
		local typ, dat = net.ReadFloat(), net.ReadString()
		if !isnumber( typ ) or !isstring( dat ) or dat == "" then return end
		typ = math.Round( typ )
		local tab = util.JSONToTable( dat )
		if !istable( tab ) then return end
		if istable( xdefm.miscs.Menus ) then
			for k, v in pairs( xdefm.miscs.Menus ) do
				if ispanel( v ) and isfunction( v.XDEFM_Update ) then
					v:XDEFM_Update( typ, tab )
				end
			end
		end
	end )
	net.Receive( "NET_xdefm_CLEffect", function()
		local nam, dat = net.ReadString(), util.JSONToTable( net.ReadString() )
		if !istable( dat ) then return end
		xdefm_BroadEffect( nam, dat )
	end )
	net.Receive( "NET_xdefm_Leaderboard", function()
		local str = net.ReadString()
		local tab = util.JSONToTable( str )
		if !istable( tab ) then return end
		xdefm.leader = tab
		if IsValid( xdefm.miscs.Menus[ "Inventory" ] ) then
			xdefm.miscs.Menus[ "Inventory" ]:XDEFM_Update( 7, tab )
		end
		file.Write( "xdefishmod/leaderboard.txt", str )
	end )
	net.Receive( "NET_xdefm_BestiaryRecord", function()
		local str, ply = net.ReadString(), LocalPlayer()
		if !IsValid( ply ) or !istable( ply.xdefm_Profile ) or !isnumber( ply.xdefm_Profile.UpdA ) then
			return
		end
		if istable( xdefm.besti ) and !isnumber( xdefm.besti[ str ] ) then
			xdefm_AddNote( ply, "xdefm.Besti4&"..xdefm_ItemMark( str ), "npc/scanner/scanner_photo1.wav", "camera_add", 5 )
			xdefm.besti[ str ] = 0
			xdefm_BestiarySave()
		end
	end )
	net.Receive( "NET_xdefm_BestiaryAll", function()
		local int = math.Round( net.ReadFloat() )
		xdefm.besti = {}
		if int == 1 then
			for k, v in pairs( xdefm.items ) do
				xdefm.besti[ k ] = 0
			end
		end
		xdefm_BestiarySave()
	end )
	net.Receive( "NET_xdefm_UpdateShop", function()
		local tab = util.JSONToTable( net.ReadString() )
		if !istable( tab ) then return end
		for k, v in pairs( tab ) do
			if istable( xdefm.shop[ k ] ) then
				xdefm.shop[ k ][ 1 ] = v
			end
		end
	end )
	net.Receive( "NET_xdefm_Quest", function()
		xdefm.quest = util.JSONToTable( net.ReadString() )
		if IsValid( xdefm.miscs.Menus[ "Quest" ] ) then
			xdefm.miscs.Menus[ "Quest" ]:XDEFM_Update( 10, xdefm.quest )
		end
	end )
	net.Receive( "NET_xdefm_MenuClose", function()
		xdefm_CloseMenu( LocalPlayer(), net.ReadString() )
	end )
end

if SERVER then --服务端
	xdefm.quests = {}
	xdefm.skips = {}
	xdefm.pools = {}
	xdefm.miscs.SaleTime = 0
	xdefm.miscs.ShutDown = false
	xdefm.miscs.LeadTime = 0
	local lbtimer = "xdefm_leaderboardupdate"

	util.AddNetworkString( "NET_xdefm_Anim" )
	util.AddNetworkString( "NET_xdefm_Profile" )
	util.AddNetworkString( "NET_xdefm_Menu" )
	util.AddNetworkString( "NET_xdefm_Cmd" )
	util.AddNetworkString( "NET_xdefm_SendNote" )
	util.AddNetworkString( "NET_xdefm_SendSnd" )
	util.AddNetworkString( "NET_xdefm_BreakEF" )
	util.AddNetworkString( "NET_xdefm_UpdateShop" )
	util.AddNetworkString( "NET_xdefm_NeedProfile" )
	util.AddNetworkString( "NET_xdefm_MenuUpdate" )
	util.AddNetworkString( "NET_xdefm_MenuClose" )
	util.AddNetworkString( "NET_xdefm_SendFriends" )
	util.AddNetworkString( "NET_xdefm_ConsoleCmd" )
	util.AddNetworkString( "NET_xdefm_CLEffect" )
	util.AddNetworkString( "NET_xdefm_Pickup" )
	util.AddNetworkString( "NET_xdefm_Leaderboard" )
	util.AddNetworkString( "NET_xdefm_BestiaryRecord" )
	util.AddNetworkString( "NET_xdefm_BestiaryAll" )
	util.AddNetworkString( "NET_xdefm_Quest" )

	function xdefm_PoolAdd( dat )
		if !istable( dat ) then return false end
		local inp = {}
		inp.Items = {} --上钩物品,可只填字符,不允许留白
		if isstring( dat.Items ) then
			inp.Items = { dat.Items }
		elseif istable( dat.Items ) then
			inp.Items = dat.Items
		else
			return false
		end
		inp.Level	 	= isnumber( dat.Level ) and math.Clamp( math.Round( dat.Level ), 0, 1000 ) or 0 --等级限制,满级1000(不大可能达到的地位)
		inp.Exp 		= isnumber( dat.Exp ) and math.Clamp( math.Round( dat.Exp ), 0, 2147483647 ) or 0 --成功钓起获得经验
		inp.DepthMin 	= isnumber( dat.DepthMin ) and math.Clamp( math.Round( dat.DepthMin ), 0, 2147483647 ) or 0 --最低深度(米),0为表面
		inp.DepthMax 	= isnumber( dat.DepthMax ) and math.Clamp( math.Round( dat.DepthMax ), 0, 2147483647 ) or 2147483647 --最高深度(米)
		inp.GroundOnly 	= isbool( dat.GroundOnly ) and dat.GroundOnly or false --仅限河床,搭配深度效果更佳
		inp.Chances 	= {} --上钩几率, 数值越大几率越小,0为必然,裸钩(填数字默认)为"_",全饵通用为"*",不允许留白,效率值会按比例降低该数值
		if isnumber( dat.Chances ) then
			if istable( dat.Baits ) then
				for k, v in pairs( dat.Baits ) do
					inp.Chances[ v ] = math.max( 0, math.Round( dat.Chances ) )
				end
			elseif isstring( dat.Baits ) then
				inp.Chances = { [ dat.Baits ] = math.max( 0, math.Round( dat.Chances ) ) }
			else
				inp.Chances = { [ "_" ] = math.max( 0, math.Round( dat.Chances ) ) }
			end
		elseif istable( dat.Chances ) then
			for k, v in pairs( dat.Chances ) do
				if isstring( k ) and isnumber( v ) then
					inp.Chances[ k ] = math.max( 0, math.Round( v ) )
				end
			end
		end
		if #inp.Items <= 0 then return false end
		if inp.DepthMin > inp.DepthMax then
			inp.DepthMin = inp.DepthMax
		end
		local chn = inp.Chances
		for k, v in pairs( inp.Chances ) do
			if !istable( xdefm.pools[ k ] ) then
				xdefm.pools[ k ] = {}
			end
			local fin = inp
			fin.Chances = chn[ k ]
			table.insert( xdefm.pools[ k ], inp )
		end
		return true
	end
	function xdefm_PoolGet( dept, leve, bait, effi, grou )
		local add = ( GetConVar( "xdefmod_nodepth" ):GetInt() > 0 )
		if !isnumber( leve ) then leve = 0 else leve = math.Clamp( math.Round( leve ), 0, 1000 ) end
		if !isnumber( dept ) then dept = 0 else dept = math.max( 0, math.Round( dept, 1 ) ) end
		if !isstring( bait ) then bait = "_" end if !isbool( grou ) then grou = false end
		if !isnumber( effi ) then effi = 0 else effi = math.Clamp( math.Round( effi ), 0, 100 ) end
		if istable( xdefm.pools[ "*" ] ) and math.random( 1, 3 ) == 1 then
			bait = "*"
		end
		local lis = xdefm.pools[ bait ]
		if bait == "ba_gmod" then
			local tab = {}
			for k, v in pairs( xdefm.pools ) do
				table.insert( tab, v )
			end
			lis = tab[ math.random( #tab ) ]
		end
		if !istable( lis ) then return nil, nil end
		local cel = {}
		sel = lis[ math.random( #lis ) ]
		if !istable( sel ) or !isnumber( sel.Chances ) then return nil, nil end
		local ccc = sel.Chances
		local chn = math.ceil( math.random( ccc -math.min( math.ceil( dept/0.01905 ), ccc*0.5 ) )*( 1 - effi/100 ) )
		if chn < 1 then return nil, nil end
		if leve < sel.Level or ( !add and ( dept > sel.DepthMax or dept < sel.DepthMin ) ) or ( sel.GroundOnly and !grou ) then return nil, nil end
		return chn <= 1 and sel.Items[ math.random( #sel.Items ) ], sel.Exp or nil, nil
	end
	function xdefm_UpdateShop()
		local tab = {}
		for k, v in pairs( xdefm.shop ) do
			if GetConVar( "xdefmod_salecool" ):GetInt() > 0 then
				tab[ k ] = math.Round( math.Rand( 0.5, 1 ), 2 )
				xdefm.shop[ k ][ 1 ] = tab[ k ]
			else
				tab[ k ] = 1
				xdefm.shop[ k ][ 1 ] = 1
			end
		end
		net.Start( "NET_xdefm_UpdateShop" )
		net.WriteString( util.TableToJSON( tab ) )
		net.Broadcast()
	end
	function xdefm_FireSpot( pos, siz, pow, par )
		if !isvector( pos ) then return nil end
		siz = isnumber( siz ) and math.Clamp( siz, 0, 100 ) or 5
		pow = isnumber( pow ) and math.max( pow, 0 ) or siz
		local spo = ents.Create( "xdefm_firespot" )
		spo:SetPos( pos )
		spo:SetAngles( Angle( 0, 0, 0 ) )
		spo.Owner = Entity( 0 )
		if IsEntity( par ) then
			spo:SetParent( par )
			spo:SetAngles( par:GetAngles() )
		end
		spo:Spawn()
		spo:Activate()
		spo:SetFMod_Strength( siz )
		spo:SetFMod_Enable( false )
		par:DeleteOnRemove( spo )
		timer.Simple( 0, function()
			if IsValid( spo ) then
				spo.xdefm_Power = pow
			end
		end )
		return spo
	end
	function xdefm_SetupFriends( ply, tab )
		if !IsValid( ply ) or !ply:IsPlayer() or !isstring( ply:SteamID() ) or ply:IsBot() then return end
		local fil = "xdefishmod/f_"..string.Replace( ply:SteamID(), ":", "_" )..".txt"
		if !istable( tab ) then
			if file.Exists( fil, "DATA" ) then
				ply.xdefm_Friends = util.JSONToTable( file.Read( fil, "DATA" ) )
			else
				ply.xdefm_Friends = {}
				file.Write( fil, util.TableToJSON( {}, true ) )
			end
		else
			local ta2, num = {}, 0
			for k, v in pairs( tab ) do
				if num > 16 then break end
				if isnumber( tonumber( v[ 2 ] ) ) and ( tonumber( v[ 2 ] ) == 1 or tonumber( v[ 2 ] ) == 0 ) then
					ta2[ k ] = v  num = num +1
				end
			end
			ply.xdefm_Friends = ta2  file.Write( fil, util.TableToJSON( ta2, true ) )
			xdefm_UpdateMenu( ply, 2, ply.xdefm_Friends )
			xdefm_AddNote( ply, "xdefm.FriendAd5", "buttons/combine_button1.wav", "group", 5 )
		end
	end
	function xdefm_FriendAllow( ply, id )
		if !IsValid( ply ) or !ply:IsPlayer() or ply:IsBot() or !isstring( ply:SteamID() ) then return false end
		if ply:IsAdmin() or !isstring( id ) or ( id == "" or ply:SteamID() == id ) then return true end
		local path, num, i2, own = "xdefishmod/f_"..string.Replace( id, ":", "_" )..".txt", 0, ply:SteamID(), player.GetBySteamID( id )
		if IsValid( own ) and istable( own.xdefm_Friends ) then
			if istable( own.xdefm_Friends[ i2 ] ) then
				num = own.xdefm_Friends[ i2 ][ 2 ]
			end
		elseif file.Exists( path, "DATA" ) then
			local dat = util.JSONToTable( file.Read( path, "DATA" ) )
			if !istable( dat ) or !istable( tab[ i2 ] ) or #tab[ i2 ] != 2 then
				num = 0
			else
				num = tonumber( tab[ i2 ][ 2 ] )
			end
		end
		if !isnumber( num ) then num = tonumber( num ) end
		if !isnumber( num ) or num != 1 then
			return false
		end
		return true
	end
	function xdefm_NadAllow( ply, ent )
		if !NADMOD or !IsValid( ply ) or !IsValid( ent ) then return false end
		return NADMOD.PlayerCanTouch( ply, ent )
	end
	function xdefm_SendSnd( ply, snd )
		if !IsValid( ply ) or !ply:IsPlayer() or !isstring( snd ) or snd == "" or snd == "!V" then return end
		net.Start( "NET_xdefm_SendSnd" )
		net.WriteString( snd )
		net.Send( ply )
	end
	function xdefm_NoTool( ent, inv )
		if !IsValid( ent ) then return end
		if isbool( inv ) and inv == true then
			ent.xdefm_NoTool = false
		else
			ent.xdefm_NoTool = true
		end
		if inv then
			ent:SetUnFreezable( false )
			if IsValid( ent:GetPhysicsObject() ) then
				ent:GetPhysicsObject():ClearGameFlag( FVPHYSICS_NO_PLAYER_PICKUP )
			end
			return
		end
		ent:SetUnFreezable( true )
		if IsValid( ent:GetPhysicsObject() ) then
			ent:GetPhysicsObject():AddGameFlag( FVPHYSICS_NO_PLAYER_PICKUP )
		end
	end
	function xdefm_ProfileLoad( ply )
		if !IsValid( ply ) or !ply:IsPlayer() or !isstring( ply:SteamID() ) or ply:IsBot() then return end
		local name = string.lower( string.Replace( ply:SteamID(), ":", "_" ) )
		if !file.IsDir( "xdefishmod", "DATA" ) then
			file.CreateDir( "xdefishmod" )
		end
		local path = ( "xdefishmod/p_"..name..".txt" )
		local pro = {}
		if !istable( ply.xdefm_Friends ) then
			xdefm_SetupFriends( ply )
		end
		if file.Exists( path, "DATA" ) then
			pro = util.JSONToTable( file.Read( path, "DATA" ) )
			if !pro.UpdG then pro.UpdG = 0 end
			for k, v in pairs( pro.Items ) do if isstring( v ) and v != "_" and !xdefm.items[ xdefm_GetClass( v ) ] then pro.Items[ k ] = ( k == 21 and "ba_junk" or "it_error" ) end end
			for k, v in pairs( pro.Bnk ) do if isstring( v )  and v != "_" and !xdefm.items[ xdefm_GetClass( v ) ] then pro.Bnk[ k ] = "it_error" end end
		else
			pro = {
				Level = 0,
				Money = 0,
				Exp = 0,
				Items = { "it_bait1","re_basic|25","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_", "_" },
				UpdA = 0,
				UpdB = 0,
				UpdC = 0,
				UpdD = 0,
				UpdE = 0,
				UpdF = 0,
				UpdG = 0,
				Skp = 0,
				Bnk = {},
				TCatch = 0,
				TExp = 0,
				TEarn = 0,
				TBuy = 0,
				TCraft = 0,
				TQuest = 0,
			}
		end
		ply.xdefm_Profile = pro
		xdefm_ProfileUpdate( ply, pro )
	end
	function xdefm_ItemGive( ply, str, non )
		if !IsValid( ply ) or !isstring( str ) or !istable( ply.xdefm_Profile ) then return false end
		local aa, bb = xdefm_ItemGet( str )
		if !istable( aa ) or !istable( bb ) then return false end
		local inv = ply.xdefm_Profile.Items
		if !istable( inv ) then return false end
		if bb.Type == "Creature" and isnumber( bb.MinSize ) and isnumber( bb.MaxSize ) and ( !istable( aa ) or #aa < 2 or aa[ 2 ] == 0 ) then
			local siz = math.Round( math.Rand( bb.MinSize, bb.MaxSize ), 1 )  table.insert( aa, 2, siz ) str = table.concat( aa, "|" )
		elseif bb.Type == "Recipe" and isnumber( bb.Durability ) and ( !istable( aa ) or #aa < 2 or aa[ 2 ] == 0 ) then
			local dur = math.ceil( math.Rand( bb.Durability/2, bb.Durability ) )  table.insert( aa, 2, dur ) str = table.concat( aa, "|" )
		end aa, bb = xdefm_ItemGet( str )
		for k, v in pairs( inv ) do
			if v == "_" and ( k != 21 or bb.Type == "Bait" ) and ( bb.Type != "Bait" or k != 21 or bb.Level <= ply.xdefm_Profile.Level ) then
				ply.xdefm_Profile.Items[ k ] = str
				xdefm_ProfileUpdate( ply )
				local cls = xdefm_GetClass( str )
				net.Start( "NET_xdefm_BestiaryRecord" )
				net.WriteString( cls )
				net.Send( ply )
				if !isbool( non ) or non == false then
					xdefm_AddNote( ply, "xdefm.Pickup&: "..xdefm_ItemMark( str ), "items/ammo_pickup.wav", "basket_put", 5 )
				end
				return true
			end
		end
		xdefm_AddNote( ply, "xdefm.FullInv", "resource/warning.wav", "cross", 5 )
		return false
	end
	function xdefm_ItemSpawn( nam, pos, ang, own, mdl )
		if !isstring( nam ) or nam == "" or nam == "_" then return nil end
		if !isvector( pos ) then pos = Vector( 0, 0, 0 ) end
		if !isangle( ang ) then ang = Angle( 0, 0, 0 ) end
		local aa, bb = xdefm_ItemGet( nam )
		if !istable( aa ) or !istable( bb ) then return nil end
		local ent = ents.Create( "xdefm_base" )
		ent:SetPos( pos )
		ent:SetAngles( ang )
		ent:SetFMod_DT( tostring( nam ) )
		if isstring( mdl ) and util.IsValidModel( mdl ) then
			ent.xdefm_Mdl = mdl
		end
		if !IsValid( own ) or !own:IsPlayer() then
			own = Entity( 0 )
		else
			ent:SetFMod_OI( own:SteamID() )
			if NADMOD then
				NADMOD.PlayerMakePropOwner( own, ent )
			end
		end
		ent:SetNWEntity( "Owner", own )
		ent:SetFMod_OW( own )
		ent.Owner = own
		local hk = hook.Run( "XDEFM_ItemSpawn", ent, nam, own )
		if isbool( hk ) and hk == false then
			ent:Remove()
			return
		end
		ent:Spawn()
		ent:Activate()
		return ent
	end
	function xdefm_DummySpawn( nam, pos, ang, own, mdl )
		if !isstring( nam ) or nam == "" or nam == "_" then return nil end
		if !isvector( pos ) then pos = Vector( 0, 0, 0 ) end
		if !isangle( ang ) then ang = Angle( 0, 0, 0 ) end
		local aa, bb = xdefm_ItemGet( nam )
		if !istable( aa ) or !istable( bb ) then return nil end
		local ent = ents.Create( "xdefm_dummy" )
		ent:SetPos( pos )
		ent:SetAngles( ang )
		ent:SetFMod_DT( tostring( nam ) )
		if isstring( mdl ) and util.IsValidModel( mdl ) then
			ent:SetModel( mdl )
			ent.xdefm_Mdl = mdl
		else
			ent:SetModel( bb.Model[ math.random( #bb.Model ) ] )
		end
		if !IsValid( own ) or !own:IsPlayer() then
			own = Entity( 0 )
		else
			ent:SetFMod_OI( own:SteamID() )
		end
		local hk = hook.Run( "XDEFM_DummySpawn", ent, nam, own )
		if isbool( hk ) and hk == false then
			ent:Remove()
			return
		end
		ent:SetFMod_OW( own )
		ent.Owner = own
		ent:Spawn()
		ent:Activate()
		return ent
	end
	function xdefm_GiveExp( ply, amo )
		if !IsValid( ply ) or !istable( ply.xdefm_Profile ) or !isnumber( amo ) or amo <= 0 then return end
		amo = math.max( 0, math.Round( amo ) )
		local fex, lex = ply.xdefm_Profile.Exp, xdefm_LevelExp( ply.xdefm_Profile.Level )
		ply.xdefm_Profile.Exp = ply.xdefm_Profile.Exp + amo
		if ply.xdefm_Profile.Level >= 1000 then
			ply.xdefm_Profile.Exp = 0
			xdefm_ProfileUpdate( ply )
			ply.xdefm_Profile.TExp = ply.xdefm_Profile.TExp + amo
			return
		end
		if ply.xdefm_Profile.Exp >= lex then
			ply.xdefm_Profile.Exp = 0
			ply.xdefm_Profile.Level = ply.xdefm_Profile.Level + 1
			if ply.xdefm_Profile.Level <= 1000 then
				ply.xdefm_Profile.Skp = ply.xdefm_Profile.Skp + 1
			end
			xdefm_AddNote( ply, "xdefm.Uplevel", "garrysmod/save_load4.wav", "arrow_up", 5 )
			ply.xdefm_Profile.TExp = ply.xdefm_Profile.TExp +math.max( 0, lex -fex )
		else
			xdefm_SendSnd( ply, "garrysmod/content_downloaded.wav" )
			ply.xdefm_Profile.TExp = ply.xdefm_Profile.TExp + amo
		end
		xdefm_ProfileUpdate( ply )
	end
	function xdefm_GiveMoney( ply, amo, nor )
		if !IsValid( ply ) or !istable( ply.xdefm_Profile ) or !isnumber( amo ) or amo <= 0 then return end
		amo = math.max( 0, math.Round( amo ) )
		ply.xdefm_Profile.Money = ply.xdefm_Profile.Money +amo
		if !nor then
			ply.xdefm_Profile.TEarn = ply.xdefm_Profile.TEarn +amo
		end
		xdefm_ProfileUpdate( ply )
		xdefm_SendSnd( ply, "physics/metal/chain_impact_soft"..math.random( 1, 3 )..".wav" )
	end
	function xdefm_UpdateMenu( ply, typ, dat )
		if !IsValid( ply ) or !istable( ply.xdefm_Profile ) or !isnumber( typ ) or !istable( dat ) then return end
		net.Start( "NET_xdefm_MenuUpdate" )
		net.WriteFloat( math.Round( typ ) )
		net.WriteString( util.TableToJSON( dat ) )
		net.Send( ply )
	end
	function xdefm_CleanupRefund()
		if GetConVar( "xdefmod_refund" ):GetInt() <= 0 then return end
		xdefm.refund = {}
		for k, v in pairs( ents.FindByClass( "xdefm_base" ) ) do
			if !IsValid( v ) or !istable( v.xdefm_T2 ) or !isstring( v:GetFMod_OI() ) or v:GetFMod_OI() == "" or !v:GetFMod_DT() then continue end local id = v:GetFMod_OI() local pc = xdefm_GetPrice( v:GetFMod_DT() ) 
			if ( xdefm_ItemGet( v ) == "cr_seagull" or xdefm_ItemGet( v ) == "cr_crow" or xdefm_GetClass( v ) == "cr_seagull2" ) and !v.xdefm_Killed then continue end local aa, bb = xdefm_ItemGet( v )
			if istable( v.xdefm_T3 ) and !table.IsEmpty( v.xdefm_T3 ) then
				for m, n in pairs( v.xdefm_T3 ) do if isstring( n ) and n != "_" then pc = pc +xdefm_GetPrice( n ) end end
			end
			if !isnumber( xdefm.refund[ id ] ) then
				xdefm.refund[ id ] = pc
			else
				xdefm.refund[ id ] = xdefm.refund[ id ] +pc
			end
			v:Remove()
		end
		for k, v in pairs( xdefm.refund ) do
			if !isstring( k ) or !isnumber( v ) or v <= 0 then continue end
			local ply = player.GetBySteamID( k )
			if IsValid( ply ) and ply:IsPlayer() and !ply:IsBot() and istable( ply.xdefm_Profile ) then
				xdefm_AddNote( ply, "xdefm.CleanRefund&: "..v, "!V", "coins", 5 ) xdefm_GiveMoney( ply, v )
			else
				local fil = "xdefishmod/p_"..k..".txt"
				if !file.Exists( fil, "DATA" ) then return end
				local tab = util.JSONToTable( file.Read( fil, "DATA" ) )
				if !istable( tab ) then return end
				tab.Money = tonumber( math.Round( tab.Money ) ) +v
				file.Write( fil, util.TableToJSON( tab, true ) )
			end
		end
		xdefm.refund = nil
	end
	function xdefm_LootDrop( tab, ent )
		if !istable( tab ) then return nil end
		local ite, ttl, tax = "_", 0, {}
		for k, v in pairs( tab ) do
			if !isstring( k ) or !isnumber( v ) then continue end
			ttl = ttl +v
			tax[ ttl ] = k
		end
		if ttl < 1 then return end
		local ran = math.random( 1, math.ceil( ttl ) )
		for k, v in SortedPairs( tax ) do
			if ran <= k then
				ite = v
				break
			end
		end
		if IsEntity( ent ) and !IsUselessModel( ent:GetModel() ) then
			local cen = ent:OBBCenter()
			local aa, bb = ent:OBBMins()*0.5, ent:OBBMaxs()*0.5
			local ang = Angle( math.Rand( 0, 360 ), math.Rand( 0, 360 ), 0 )
			local xx, yy, zz = math.Rand( aa.x, bb.x ), math.Rand( aa.y, bb.y ), math.Rand( aa.z, bb.z )
			local own = Entity( 0 )
			if ent:GetClass() == "xdefm_base" then
				own = ent:GetFMod_OW()
			end
			local ite = xdefm_ItemSpawn( ite, ent:LocalToWorld( Vector( xx, yy, zz )/4 ), ang, own )
			if IsValid( ite ) then
				ite:SetFMod_OI( ent:GetFMod_OI() )
				return ite
			end
		end
		return ite
	end
	function xdefm_QuestRegister( lvl, ned, rew )
		if !isstring( ned ) or ned == "_" or ned == "" then return end
		if !isstring( rew ) or rew == "_" or rew == "" then return end
		lvl = isnumber( lvl ) and math.max( math.Round( lvl ), 0 ) or 0
		table.insert( xdefm.quests, { lvl, ned, rew } )
	end
	function xdefm_QuestPick( lvl, ply )
		if !isnumber( lvl ) then return nil end
		if table.IsEmpty( xdefm.quests ) then return nil end
		if lvl != -1 then local tab = {}
			for k, v in RandomPairs( xdefm.quests ) do
				if v[ 1 ] <= lvl then tab = v break end
			end
			if IsValid( ply ) and ply:IsPlayer() and !ply:IsBot() then
				net.Start( "NET_xdefm_Quest" )
				net.WriteString( util.TableToJSON( tab ) )
				net.Send( ply )
				ply.xdefm_Quest = tab
			end
			return tab
		elseif IsValid( ply ) and ply:IsPlayer() and !ply:IsBot() then
			net.Start( "NET_xdefm_Quest" )
			net.WriteString( util.TableToJSON( {} ) )
			net.Send( ply )
			ply.xdefm_Quest = {}
		end
		return nil
	end

	hook.Add( "PhysgunPickup", "xdefm_NoTool", function( ply, ent )
		if ent.xdefm_NoTool then return false end
		if ent:GetClass() == "xdefm_base" then return false end
	end )
	hook.Add( "CanProperty", "xdefm_NoTool", function( ply, property, ent )
		if ent.xdefm_NoTool then return false end
		if ent:GetClass() == "xdefm_base" then return false end
	end )
	hook.Add( "CanTool", "xdefm_NoTool", function( ply, tr, toolname, tool, button )
		if IsValid( tr.Entity ) and tr.Entity.xdefm_NoTool then return false end
		if IsValid( tr.Entity ) and tr.Entity:GetClass() == "xdefm_base" then return false end
	end )
	hook.Add( "AllowPlayerPickup", "xdefm_NoTool", function( ply, ent )
		if ent.xdefm_NoTool then return false end
	end )
	hook.Add( "GravGunPickupAllowed", "xdefm_NoTool", function( ply, ent )
		if ent.xdefm_NoTool then return false end
	end )
	hook.Add( "PlayerCanPickupWeapon", "xdefm_NoPickup", function( ply, wep )
		if IsValid( wep ) and isstring( wep:GetClass() ) then
			local st, ed = string.find( wep:GetClass():lower(), "weapon_xdefm_" )
			if st and ply:HasWeapon( wep:GetClass() ) then
				return false
			end
		end
	end )
	hook.Add( "Think", "xdefm_TK", function()
		for k, v in pairs( ents.FindByClass( "xdefm_base" ) ) do
			if !IsValid( v ) or !istable( v.xdefm_T2 ) then continue end
			if !v:IsPlayerHolding() and !constraint.FindConstraint( v, "Weld" ) and v:WaterLevel() > 0 and v.xdefm_T2.KillInWater then
				SafeRemoveEntity( v )
				local data = EffectData()
				data:SetOrigin( v:WorldSpaceCenter() )
				data:SetScale( math.Round( v:OBBMins():Distance( v:OBBMaxs() )*0.1, 2 ) )
				util.Effect( "watersplash", data )
			end
		end
		local tim = math.max( math.Round( GetConVar( "xdefmod_salecool" ):GetInt() ), 0 )*60
		local time = math.Round( os.time()/tim )*tim
		if tim > 0 and time != xdefm.miscs.SaleTime then
			xdefm.miscs.SaleTime = time
			xdefm_UpdateShop()
		end
		local ti2 = math.max( math.Round( GetConVar( "xdefmod_lbdelay" ):GetInt() ), 0 )*60
		time = math.Round( os.time()/ti2 )*ti2
		if !istable( xdefm.leader ) or ( ti2 > 0 and time != xdefm.miscs.LeadTime ) then
			xdefm.miscs.LeadTime = time
			if !timer.Exists( lbtimer ) then
				local fil, dir = file.Find( "xdefishmod/p_*.txt", "DATA" )
				if !istable( fil ) or #fil <= 0 then return end
				local cfr, cto, ctb = 0, #fil, {}
				timer.Create( lbtimer, 0, 0, function()
					for i=1, 5 do
						cfr = cfr +1
						local fin = fil[ cfr ]
						if !isstring( fin ) then
							local jso = util.TableToJSON( ctb, true )
							file.Write( "xdefishmod/leaderboard.txt", jso )
							xdefm.leader = ctb
							net.Start( "NET_xdefm_Leaderboard" )
							net.WriteString( jso )
							net.Broadcast()
							for k, v in pairs( player.GetAll() ) do
								xdefm_UpdateMenu( v, 7, ctb )
							end
							timer.Remove( lbtimer )
							break
						end
						local tab = util.JSONToTable( file.Read( "xdefishmod/"..fin, "DATA" ) )
						if !istable( tab ) then continue end
						if istable( ctb[ 10 ] ) and ctb[ 10 ][ 1 ] > tab.TExp then continue end
						for m = 1, 10 do
							local ttt = ctb[ m ]
							if ( !istable( ttt ) or ttt[ 1 ] < tab.TExp ) and isstring( tab.SID64 ) then
								table.insert( ctb, m, { tab.TExp, tab.SID64, tab.Nick, tab.Level, tab.Money } )
								if #ctb > 10 then
									table.remove( ctb, 11 )
								end
								break
							end
						end
					end
				end )
			end
		end
	end )
	hook.Add( "EntityTakeDamage", "xdefm_Hurt", function( tar, dmg )
		if IsValid( dmg:GetInflictor() ) and dmg:GetInflictor():GetNWBool( "XDEFM_HO" ) and IsValid( dmg:GetInflictor():GetOwner() ) then
			dmg:SetInflictor( dmg:GetInflictor():GetOwner() )
			if IsValid( dmg:GetInflictor():GetOwner() ) then
				dmg:SetAttacker( dmg:GetInflictor():GetOwner() )
			end
			if !tar:IsPlayer() and !tar:IsNPC() and !tar:IsNextBot() then return true end
		end
		local inf, atk = dmg:GetInflictor(), dmg:GetAttacker()
		if !IsValid( atk ) or GetConVar( "xdefmod_noprophurt" ):GetInt() <= 0 then return end
		if tar:GetClass() == "xdefm_base" then
			local aa, bb = xdefm_ItemGet( tar:GetFMod_DT() )
			if istable( bb ) and bb.Type == "Creature" then return end
		end
		if atk:IsPlayer() and tar:GetClass() == "xdefm_base" and !xdefm_FriendAllow( atk, tar:GetFMod_OI() ) and !xdefm_NadAllow( atk, tar ) then return true end
		if atk:GetClass() == "xdefm_base" and tar:IsPlayer() and !xdefm_FriendAllow( atk:GetFMod_OW(), tar:SteamID() ) and !xdefm_NadAllow( tar, atk ) then return true end
	end )
	hook.Add( "PreCleanupMap", "xdefm_Refund", function()
		xdefm_CleanupRefund()
	end )
	hook.Add( "ShutDown", "xdefm_Refund", function()
		if xdefm.miscs.ShutDown then return end
		xdefm.miscs.ShutDown = true
		xdefm_CleanupRefund()
	end )
	hook.Add( "OnPlayerPhysicsPickup", "xdefm_LastTake", function( ply, ent )
		if IsValid( ply ) and IsValid( ent ) and ent:GetClass() == "xdefm_base" then
			ent:SetFMod_LU( ply )
		end
	end )
	hook.Add( "OnPlayerPhysicsDrop", "xdefm_LastDrop", function( ply, ent, thr )
		if IsValid( ply ) and IsValid( ent ) and ent:GetClass() == "xdefm_base" then
			ent:SetFMod_LU( nil )
			if istable( ent.xdefm_T2 ) then
				ent.xdefm_T2:OnDrop( ent, ply, thr )
			end
		end
	end )

	net.Receive( "NET_xdefm_Cmd", function( len, ply )
		if !IsValid( ply ) or len > 512 then return end
		local cmd, dat = net.ReadString(), net.ReadString()
		if isstring( cmd ) and isstring( dat ) and cmd != "" and dat != "" then
			xdefm_Command( ply, cmd, dat )
		end
	end )
	net.Receive( "NET_xdefm_SendFriends", function( len, ply )
		if !IsValid( ply ) or len > 8192 then return end
		if isnumber( ply.xdefm_Cool ) and ply.xdefm_Cool > CurTime() then return end
		ply.xdefm_Cool = CurTime() +0.9
		local tab = {}
		if len > 0 then
			local str = net.ReadString()
			if !isstring( str ) or str == "" then return end
			tab = util.JSONToTable( str )
			if !istable( tab ) then return end
		else
			tab = ply.xdefm_Friends
		end
		xdefm_SetupFriends( ply, tab )
	end )
	net.Receive( "NET_xdefm_ConsoleCmd", function( len, ply )
		if !IsValid( ply ) or len > 1024 or len <= 0 then return end
		if isnumber( ply.xdefm_Cool ) and ply.xdefm_Cool > CurTime() then return end
		ply.xdefm_Cool = CurTime() +0.1
		local cmd, var = net.ReadString(), net.ReadString()
		local tab = util.JSONToTable( var )
		xdefm_ConsoleCmd( cmd, tab, ply )
	end )
	net.Receive( "NET_xdefm_Pickup", function( len, ply )
		if !IsValid( ply ) or len <= 0 or len >= 128 or !ply:Alive() then return end
		if isnumber( ply.xdefm_Cool ) and ply.xdefm_Cool > CurTime() then return end
		local pl2 = net.ReadEntity()  if pl2 != ply then return end ply.xdefm_Cool = CurTime()+0.1
		local ent = ply:GetEyeTrace().Entity
		if IsValid( ent ) and ent:GetClass() == "xdefm_base" and !ent:IsConstrained() and xdefm_CanInteract( ply, ent ) and !ent.xdefm_Trashed then
			ply.xdefm_Cool = CurTime() +0.1
			local aa, bb = xdefm_ItemGet( ent:GetFMod_DT() )
			if istable( aa ) and istable( bb ) then
				local own, owi = ent:GetFMod_OW(), ent:GetFMod_OI()
				if bb:OnStore( ent, ply ) == false then return end
				ply.xdefm_Cool = CurTime() +0.1
				if xdefm_FriendAllow( ply, owi ) or xdefm_NadAllow( ply, ent ) then
					if istable( ent.xdefm_T3 ) and !table.IsEmpty( ent.xdefm_T3 ) then local yee = false
						for k, v in pairs( ent.xdefm_T3 ) do if isstring( v ) and v != "_" then
								xdefm_AddNote( ply, xdefm_ItemMark( ent:GetFMod_DT() ).."& &xdefm.NotEmpty", "resource/warning.wav", "cross", 5 ) yee = true break
							end
						end
						if yee then return end
					end
					local hk = hook.Run( "XDEFM_PlayerTake", ply, ent )
					if isbool( hk ) and hk == false then return end
					if bb.Carryable and ( GetConVar( "xdefmod_tempmode" ):GetInt() <= 0 or bb.Type == "Bait" or bb.Type == "Recipe" ) then
						if xdefm_ItemGive( ply, ent:GetFMod_DT() ) then
							ent.xdefm_Trashed = true
							ent:Remove()
						end
					else
						ent.xdefm_Trashed = true
						ent:Remove()
						local prc = xdefm_GetPrice( ent )
						net.Start( "NET_xdefm_BestiaryRecord" )
						net.WriteString( xdefm_GetClass( ent ) )
						net.Send( ply )
						if prc > 0 then
							xdefm_GiveMoney( ply, prc, true )
							xdefm_AddNote( ply, "xdefm.GetMoney&: "..prc, "!V", "coins", 5 )
						else
							xdefm_AddNote( ply, "xdefm.Trashed&: "..xdefm_ItemMark( ent:GetFMod_DT() ), "physics/cardboard/cardboard_box_impact_bullet1.wav", "bin_empty", 5 )
						end
					end
				else xdefm_AddNote( ply, "xdefm.NotMine", "resource/warning.wav", "cross", 5 ) end
			end
		end
	end )
	net.Receive( "NET_xdefm_NeedProfile", function( len, ply )
		if !IsValid( ply ) or len > 0 or istable( ply.xdefm_Profile ) then return end
		if isnumber( xdefm.skips[ ply:SteamID() ] ) then
			ply:SetNWFloat( "XDEFM_QC", CurTime() +GetConVar( "xdefmod_qsttime" ):GetInt()*60 )
			ply:SetNWBool( "XDEFM_QD", true )
		end
		xdefm_ProfileLoad( ply )
		ply.xdefm_Cool = 0
		local id = ply:SteamID()
		for k, v in pairs( ents.FindByClass( "xdefm_base" ) ) do
			if !IsValid( v ) then continue end
			if v:GetFMod_OI() == id then
				v:SetFMod_OW( ply )
			end
		end
	end )
end

if SERVER or CLIENT then --通用端
	local Zom = Material( "vgui/zoom" )
	function xdefm_AddShop( nam, lvl, prc )
		if !isstring( nam ) then return end
		lvl = isnumber( lvl ) and math.max( 0, math.Round( lvl ) ) or 0
		prc = isnumber( prc ) and math.max( 0, math.Round( prc ) ) or 0
		local aa, bb = xdefm_ItemGet( nam )
		if !istable( bb ) or bb.Type != "Bait" then return end
		xdefm.shop[ nam ] = { 1, lvl, prc }
	end
	function xdefm_GetPrice( ite )
		if IsEntity( ite ) and ite:GetClass() == "xdefm_base" then
			ite = ite:GetFMod_DT()
		end
		if !isstring( ite ) or ite == "" or ite == "_" then return 0 end
		local aa, bb = xdefm_ItemGet( ite )
		if !istable( bb ) then return 0 end
		local prc = bb.Price
		if bb.Type == "Creature" and isnumber( tonumber( aa[ 2 ] ) ) then
			prc = math.ceil( prc*tonumber( aa[ 2 ] ) )
		end
		if bb.Type == "Bait" then
			return prc
		elseif bb.Type == "Recipe" then
			return isnumber( tonumber( aa[ 2 ] ) ) and math.ceil( prc*tonumber( aa[ 2 ] )/bb.Durability ) or prc
		else
			local cm = xdefm_CookMeter( ite )
			if cm != 0 then
				return cm > 0 and math.ceil( prc +prc*cm*4 ) or math.ceil( prc*math.abs( 1+ cm )*5 )
			else
				return prc
			end
		end
		return 0
	end
	function xdefm_GetClass( ite )
		if IsEntity( ite ) and ite:GetClass() == "xdefm_base" then
			ite = ite:GetFMod_DT()
		end
		local tb = string.Explode( "|", ite )
		if istable( tb ) and #tb > 1 then
			ite = tb[ 1 ]
		end
		return ite
	end
	function xdefm_ConsoleCmd( cmd, var, ply )
		if !isstring( cmd ) or cmd == "" or !istable( var ) or !IsValid( ply ) or !ply:IsPlayer() or ply:IsBot() then return end
		if CLIENT then
			net.Start( "NET_xdefm_ConsoleCmd" )
			net.WriteString( cmd )
			net.WriteString( util.TableToJSON( var ) )
			net.SendToServer()
		else
			if ply:IsSuperAdmin() and cmd == "xdefmod_note" then
				for k, v in pairs( player.GetAll() ) do
					xdefm_AddNote( v, table.concat( var, " " ), "ambient/levels/canals/windchime2.wav", "!V", 5 )
				end
			end
			if ply:IsSuperAdmin() and cmd == "xdefmod_collectall" then
				net.Start( "NET_xdefm_BestiaryAll" )
				net.WriteFloat( 1 )
				net.Send( ply )
			end
			if ply:IsSuperAdmin() and cmd == "xdefmod_collectclear" then
				net.Start( "NET_xdefm_BestiaryAll" )
				net.WriteFloat( 2 )
				net.Send( ply )
			end
			if ply:IsSuperAdmin() and cmd == "xdefmod_give" then
				local v = table.concat( var, "" )
				xdefm_ItemGive( ply, v )
			end
			if ply:IsSuperAdmin() and cmd == "xdefmod_spawn" and ply:CheckLimit( "xdefmod_items" ) then
				local v = table.concat( var, "" )
				local ite = xdefm_ItemSpawn( table.concat( var, "" ), ply:GetEyeTrace().HitPos, Angle( 0, ply:EyeAngles().yaw, 0 ), ply )
				if !IsValid( ite ) then return end
				ite:SetPos( ite:GetPos() +Vector( 0, 0, ite:OBBMaxs():Distance( ite:OBBMins() )/2 ) )
				local aa, bb = xdefm_ItemGet( ite:GetFMod_DT() )
				if !istable( aa ) or !istable( bb ) then return end
				undo.Create( bb.Name )
				undo.AddEntity( ite )
				undo.SetPlayer( ply )
				undo.Finish()
			end
			if ply:IsSuperAdmin() and cmd == "xdefmod_firespot" and ply:CheckLimit( "xdefmod_items" ) then
				local v = tonumber( table.concat( var, "" ) )
				if !isnumber( v ) then return end
				local spo = xdefm_FireSpot( ply:GetEyeTrace().HitPos +ply:GetEyeTrace().HitNormal, v, v )
				spo.Owner = ply
				spo:Spawn()
				spo:Activate()
				undo.Create( "#xdefm.FireSpot" )
				undo.AddEntity( spo )
				undo.SetPlayer( ply )
				undo.Finish()
				spo:SetFMod_Strength( v )
				spo:SetFMod_Enable( true )
			end
			if cmd == "xdefmod_openinv" then xdefm_OpenMenu( ply, 0, ply.xdefm_Profile ) end
			if cmd == "xdefmod_openbes" then xdefm_OpenMenu( ply, 8, ply.xdefm_Profile ) end
			if cmd == "xdefmod_openfri" then xdefm_OpenMenu( ply, 6, ply.xdefm_Friends ) end
			if cmd == "xdefmod_opentrd" then
				if !istable( ply.xdefm_Trade ) then
					ply.xdefm_Trade = {"_","_","_","_","_","_","_","_","_","_",0}
				end
				xdefm_OpenMenu( ply, 0, ply.xdefm_Profile )
				xdefm_OpenMenu( ply, 7, ply.xdefm_Trade )
			end
			if cmd == "xdefmod_openbnk" then
				xdefm_OpenMenu( ply, 0, ply.xdefm_Profile )
				xdefm_OpenMenu( ply, 5, ply.xdefm_Profile )
			end
			if cmd == "xdefmod_opencft" then
				xdefm_OpenMenu( ply, 0, ply.xdefm_Profile )
				xdefm_OpenMenu( ply, 9, ply.xdefm_Profile )
			end
			if cmd == "xdefmod_opendrp" then
				xdefm_OpenMenu( ply, 2, ply.xdefm_Profile )
			end
		end
	end
	function xdefm_LevelExp( lvl )
		if !isnumber( lvl ) then return 0 end
		return math.ceil( 100 +lvl^1.5 )
	end
	function xdefm_AddNote( ply, txt, snd, ico, dur )
		if CLIENT then
			ply = LocalPlayer()
			if isstring( snd ) and snd != "" and snd != "!V" then
				surface.PlaySound( snd )
			end
			dur = isnumber( dur ) and dur or 5
			if string.find( string.lower( txt ), "&" ) != nil then
				local tab = string.Explode( "&", txt )
				for k, v in pairs( tab ) do
					if v != "" and v != " " and string.find( string.lower( v ), "xdefm." ) != nil then
						tab[ k ] = language.GetPhrase( v )
					end
				end
				txt = table.concat( tab, "" )
			elseif txt != "!V" and string.find( string.lower( txt ), "xdefm." ) then
				txt = language.GetPhrase( txt )
			end
			if !isstring( ico ) or ico == "" or ico == "!V" then
				ico = "information"
			end
			if GetConVar( "xdefmod_printnote" ):GetInt() > 0 then
				MsgC( Color( 255, 255, 255 ), "[", Color( 0, 255, 255 ), "xdefmod", Color( 255, 255, 255 ), "]"..txt.."\n" )
			end
			if txt != "!V" then
				table.insert( xdefm.miscs.Notes, { SysTime() +tonumber( string.Left( tostring( dur ), 4 ) ), txt, Material( "icon16/"..ico..".png" ), 0 } )
			end
		else
			if !isstring( txt ) or txt == "" then
				txt = "!V"
			end
			if !isstring( snd ) or snd == "" then
				snd = "!V"
			end
			if !isstring( ico ) or ico == "" then
				ico = "!V"
			end
			net.Start( "NET_xdefm_SendNote" )
			net.WriteString( txt )
			net.WriteString( snd )
			net.WriteFloat( dur )
			net.WriteString( ico )
			if ply:IsPlayer() then
				net.Send( ply )
			else
				net.Broadcast()
			end
		end
	end
	function xdefm_CookMeter( str )
		if IsEntity( str ) and str:GetClass() == "xdefm_base" then str = str:GetFMod_DT() end
		if !isstring( str ) or str == "" or str == "_" then return 0 end
		local aa, bb = xdefm_ItemGet( str )
		if !istable( aa ) or !istable( bb ) or bb.Type == "Bait" or bb.Type == "Recipe" then return 0 end
		local met = tonumber( aa[ #aa ] )
		if !isnumber( met ) or met == 0 then return 0 end
		local mex = math.ceil( bb.Rarity*100 )
		local me2 = math.ceil( mex*0.1 )
		if met <= mex then
			return math.Clamp( met/mex, 0, 1 )
		else
			return -math.Clamp( ( met-mex )/me2, 0, 1 )
		end
	end
	function xdefm_CookAdd( tar, met )
		if !IsEntity( tar ) and !isstring( tar ) or ( IsEntity( tar ) and tar:GetClass() != "xdefm_base" ) then return nil end
		if !isnumber( met ) then
			met = 0
		else
			met = math.max( 0, math.ceil( met ) )
		end
		if IsEntity( tar ) and SERVER then
			local str = tar:GetFMod_DT()
			if !isstring( str ) or str == "_" then return nil end
			local aa, bb = xdefm_ItemGet( str )
			if !istable( bb ) or bb.Type == "Bait" or bb.Type == "Recipe" or bb.CantCook then return nil end
			local med, mex = tonumber( aa[ #aa ] ), bb.Rarity*110
			if !isnumber( med ) or med >= mex then return end
			med = math.min( med +met, mex )
			if med >= mex and !tar:IsOnFire() then
				tar:Ignite( math.Rand( 3, 6 ) )
			end
			aa[ #aa ] = med
			tar:SetFMod_DT( table.concat( aa, "|" ) )
			return tar:GetFMod_DT()
		elseif isstring( tar ) then
			local aa, bb = xdefm_ItemGet( str )
			if !istable( bb ) or bb.Type == "Bait" or bb.CantCook then return nil end
			local med, mex = tonumber( aa[ #aa ] ), bb.Rarity*110
			if !isnumber( med ) or med >= mex then return nil end
			med = math.min( med +met, mex )
			aa[ #aa ] = med
			return table.concat( aa, "|" )
		end
	end
	function xdefm_CloseMenu( ply, str )
		if !isstring( str ) then return end
		if SERVER and IsValid( ply ) and ply:IsPlayer() and !ply:IsBot() then
			net.Start( "NET_xdefm_MenuClose" )
			net.WriteString( str )
			net.Send( ply )
			return
		end
		if CLIENT then if IsValid( xdefm.miscs.Menus[ str ] ) then xdefm.miscs.Menus[ str ]:Remove() end end
	end
	function xdefm_OpenMenu( ply, typ, tab )
		if !isnumber( typ ) and ( tab != nil and !istable( tab ) ) then return end
		if SERVER and IsValid( ply ) and ply:IsPlayer() and !ply:IsBot() then
			net.Start( "NET_xdefm_Menu" )
			net.WriteString( tonumber( typ ) )
			net.WriteString( util.TableToJSON( tab ) )
			net.Send( ply )
			return
		end
		if CLIENT then
			ply = LocalPlayer()
			typ = math.Round( typ )
			local yes = istable( tab )
			if !yes then return end
			xdefm.bck_col = Color( GetConVar( "xdefmod_bgr" ):GetInt(), GetConVar( "xdefmod_bgg" ):GetInt(), GetConVar( "xdefmod_bgb" ):GetInt(), GetConVar( "xdefmod_bga" ):GetInt() )
			xdefm.ext_col = Color( GetConVar( "xdefmod_brr" ):GetInt(), GetConVar( "xdefmod_brg" ):GetInt(), GetConVar( "xdefmod_brb" ):GetInt(), GetConVar( "xdefmod_bra" ):GetInt() )
if typ == 0 then -- 背包
	if IsValid( xdefm.miscs.Menus[ "Inventory" ] ) then return end
	local pan = vgui.Create( "DFrame" )  xdefm.miscs.Menus.Inventory = pan  pan.T_Data = tab  pan.T_Slots = {}
	pan:SetPos( ScrW()/2 -500, ScrH()/2 -500/2 ) pan:SetSize( 450, 550 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:ParentToHUD() pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW()/2 -500, ScrH()/2 -550/2, 0.2 ) ply.xdefm_Profile = tab  function pan:OnRemove()
		if ispanel( xdefm.miscs.Menus.Double ) then xdefm.miscs.Menus.Double:Remove() end
		if ispanel( xdefm.miscs.Menus.Bank ) then xdefm.miscs.Menus.Bank:Remove() end
		if ispanel( xdefm.miscs.Menus.Trade ) then xdefm.miscs.Menus.Trade:Remove() end
		if ispanel( xdefm.miscs.Menus.Craft ) then xdefm.miscs.Menus.Craft:Remove() end
		if ispanel( xdefm.miscs.Menus.Struct ) then xdefm.miscs.Menus.Struct:Remove() end
	end function pan:Paint( w, h ) local tab = pan.T_Data
		surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 0 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 180 )
		surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.TextShadow( { text = ply:Nick(), pos = { 80, 24 }, font = "xdefm_Font5",
		xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		draw.TextShadow( { text = language.GetPhrase( "#xdefm.Money" )..": "..tab.Money, pos = { 80, 54 }, font = "xdefm_Font1",
		xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 ) end
	if true then -- 头像
		pan.P_AIcon = pan:Add( "AvatarImage" )  local pax = pan.P_AIcon
		pax:SetPos( 8, 8 ) pax:SetSize( 64, 64 ) pax:SetPlayer( ply, 128 ) pax:SetMouseInputEnabled( false )
		pan.P_AFrame = pan:Add( "DPanel" )  pax = pan.P_AFrame
		pax:SetText( "" ) pax:SetPos( 8, 8 ) pax:SetSize( 64, 64 ) pax:SetMouseInputEnabled( false )
		function pax:Paint( w, h ) surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h ) end end
	if true then -- 关闭按钮
		pan.P_Close = pan:Add( "DButton" )  local pax = pan.P_Close
		pax:SetText( "" ) pax:SetPos( 410, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint( w, h ) draw.TextShadow( {
				text = "×", pos = { w/2, h/2 }, font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER,
				color = ( pax.B_Hover and Color( 255, 0, 0 ) or Color( 255, 255, 255 ) )
		}, 2, 255 ) end function pax:DoClick() pan:Close() end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end
	if true then -- 等级框架
		pan.P_Level = pan:Add( "DPanel" )  local pax = pan.P_Level
		pax:SetPos( 8, 80 ) pax:SetSize( 434, 75 )
		function pax:Paint( w, h )  local tab = pan.T_Data
			local pp = xdefm_LevelExp( tab.Level )  local ee = math.Round( math.min( pp, math.Round( tab.Exp ) ) )
			surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, h )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h )
			draw.TextShadow( { text = language.GetPhrase( "#xdefm.Level" )..": "..tab.Level, pos = { 12, 18 }, font = "xdefm_Font1",
			xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
			local xx, yy = pax:GetPos()  local x2, y2 = pan:GetPos()  xx = xx + x2  yy = yy + y2  local per = math.Clamp(ee/pp,0,1)
			surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 8, 32, 416, 30 )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 8, 32, 416, 30, 2 )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 8, 32, 416, 30 )
			render.SetScissorRect( xx +8, yy +32, xx +8 +416*per, yy +58, true )
			draw.RoundedBox( 4, 4 +8, 4 +32, 416 -8, 30 -8, Color( 0, 155, 200 ) )
			render.SetScissorRect( 0, 0, 0, 0, false )
			local txt = ""  if self.B_Hover then txt = ee.." / "..pp else txt = tostring(math.floor(per*100)).." %" end
			draw.TextShadow( { text = txt, pos = { w/2, 46 }, font = "xdefm_Font2",
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		end
		function pax:OnCursorEntered() self.B_Hover = true end function pax:OnCursorExited() self.B_Hover = false end end
	if true then -- 背包/升级/记录/排行/商店
		pan.P_Invent = vgui.Create( "DPropertySheet", pan )  local pax = pan.P_Invent
		pax:SetPos( 8, 165 ) pax:SetSize( 434, 377 ) function pax:Paint( w, h )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 18, w, h -18, 2 )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 18, w, h -18, 1 )
		end pax:SetPadding( 1 )
		local function AddASheetFM( tit, ico, hel ) local pae = vgui.Create( "DPanel" ) function pae:Paint( w, h ) end 
			local ttt = pax:AddSheet( tit, pae, ico ) if isstring( hel ) then ttt.Tab:SetTooltip( hel ) end function ttt.Tab:Paint( w, h )
				local alp = ttt.Tab:IsActive() and 1 or 0.5  local rr, gg, bb = xdefm.bck_col.r, xdefm.bck_col.g, xdefm.bck_col.b
				draw.RoundedBoxEx( 4, 0, 0, w, 20, xdefm.ext_col, true, true, false, false )
				draw.RoundedBoxEx( 4, 1, 1, w -2, 20, xdefm.lin_col, true, true, false, false )
				draw.RoundedBoxEx( 4, 3, 3, w -4, 20, Color( rr*alp, gg*alp, bb*alp, 255 ), true, true, false, false )
			end ttt.Tab.xdefm_DC = ttt.Tab.DoClick
			function ttt.Tab:DoClick() ttt.Tab:xdefm_DC() end return pae end
		pan.P_Menu1 = AddASheetFM( language.GetPhrase( "xdefm.M1" ), "icon16/basket.png", language.GetPhrase( "xdefm.M11" ) )
		pan.P_Menu5 = AddASheetFM( language.GetPhrase( "xdefm.M5" ), "icon16/cart.png", language.GetPhrase( "xdefm.M55" ) )
		pan.P_Menu2 = AddASheetFM( language.GetPhrase( "xdefm.M2" ), "icon16/lightning.png", language.GetPhrase( "xdefm.M22" ) )
		pan.P_Menu3 = AddASheetFM( language.GetPhrase( "xdefm.M3" ), "icon16/star.png", language.GetPhrase( "xdefm.M33" ) )
		if GetConVar( "xdefmod_lbdelay" ):GetInt() > 0 and !game.SinglePlayer() then
			pan.P_Menu4 = AddASheetFM( language.GetPhrase( "xdefm.M4" ), "icon16/chart_bar.png", language.GetPhrase( "xdefm.M44" ) )
		end for k, v in pairs( { pan.P_Menu2, pan.P_Menu3, pan.P_Menu4, pan.P_Menu5 } ) do if !IsValid( v ) then continue end
			function v:Paint( w, h ) surface.SetDrawColor( Color( xdefm.bck_col.r*0.5, xdefm.bck_col.g*0.5, xdefm.bck_col.b*0.5, xdefm.bck_col.a*0.5 ) )
			surface.DrawRect( 0, 0, w, h ) end end
		for k, v in pairs( { pan.P_Menu1, pan.P_Menu2, pan.P_Menu3, pan.P_Menu5 } ) do if !IsValid( v ) then continue end
			v.P_Scroll = v:Add( "DScrollPanel" )  v.P_Scroll:Dock( FILL )  local vba = v.P_Scroll:GetVBar()
			vba:SetHideButtons( true )  vba:SetSize( 0, 0 )
			function vba.btnGrip:Paint( w, h )
				surface.SetDrawColor( 125, 125, 125, 255 ) surface.DrawRect( 0, 0, w, h )
				surface.SetDrawColor( 0, 0, 0, 255 ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			end function vba:Paint( w, h ) draw.RoundedBox( 0, 0, 0, w, h, Color( 45, 45, 45, 255 ) ) end end
		if true then local pax = pan.P_Menu1 --背包栏目
			pax.P_Hold = pax.P_Scroll:Add( "DIconLayout" )  local pa2 = pax.P_Hold  pa2:Dock( FILL )
			pa2:SetSpaceX( 1.75 ) pa2:SetSpaceY( 2 ) function pa2:Paint( w, h ) end local inv = pan.T_Data.Items
			for i=1, 21 do local siz = ( i == 21 and 64 or 85 )
			local slo = xdefm_SlotBox( 0, 0, siz, siz, i, i==21 and language.GetPhrase( "xdefm.Bait" ) or tostring( i ) )
			if i == 21 then pan:Add( slo ) slo:SetPos( 336, 10 ) else pax.P_Hold:Add( slo ) end 
			slo.S_Type = "Inventory"  slo:F_SetupItem( inv[i] ) pan.T_Slots[ i ] = slo
				function slo:DoRightClick( Pnl ) if slo.T_Item == nil or slo:IsDragging() then return end
					if IsValid( pan.P_DMenu ) then pan.P_DMenu:Remove() end pan.P_DMenu = DermaMenu( false, nil )  local dnm = pan.P_DMenu
					local prc = xdefm_GetPrice( slo.S_Item )  local des = ( prc > 0 and "#xdefm.Sell" or "#xdefm.Destroy" )
					local ico = ( prc > 0 and "icon16/coins.png" or "icon16/bin_closed.png" )
					local O_Drop = dnm:AddOption( "#xdefm.Drop", function() if !slo.B_OnMove then xdefm_Command( LocalPlayer(), "DropInv", slo.S_Place ) end end )
					local O_Destroy = dnm:AddOption( des, function() if !slo.B_OnMove then xdefm_Command( LocalPlayer(), "DestroyInv", slo.S_Place ) end end )
					O_Drop:SetIcon( "icon16/basket_remove.png" ) O_Destroy:SetIcon( ico )
					if IsValid( xdefm.miscs.Menus[ "Bank" ] ) then
						local O_Store = dnm:AddOption( "#xdefm.Store", function()
						if !slo.B_OnMove and IsValid( xdefm.miscs.Menus[ "Bank" ] ) then local num = 0
						for k, v in pairs( LocalPlayer().xdefm_Profile.Bnk ) do if k > ply.xdefm_Profile.UpdF then break end
						if isstring( v ) and v == "_" then num = k break end end if num > 0 then
						xdefm_Command( LocalPlayer(), "MoveBank", slo.S_Place.."|"..num )
						else xdefm_AddNote( ply, "!V", "resource/warning.wav", "cross", 5 ) end end end )
						O_Store:SetIcon( "icon16/basket_go.png" )
					elseif IsValid( xdefm.miscs.Menus[ "Struct" ] ) and xdefm.miscs.Menus[ "Struct" ].N_SType == 1 then
						local O_Store = dnm:AddOption( "#xdefm.Store", function()
						if !slo.B_OnMove and IsValid( xdefm.miscs.Menus[ "Struct" ] ) and xdefm.miscs.Menus[ "Struct" ].N_SType == 1 then local num = 0
						for k, v in pairs( xdefm.miscs.Menus[ "Struct" ].T_Items ) do
						if isstring( v ) and v == "_" then num = k break end end if num > 0 then
						xdefm_Command( LocalPlayer(), "Struct", slo.S_Place.."|"..num )
						else xdefm_AddNote( ply, "!V", "resource/warning.wav", "cross", 5 ) end end end )
						O_Store:SetIcon( "icon16/basket_go.png" )
					end
					if slo.T_Item.Type == "Bait" then
						if slo.S_Place != "21" then
							local O_Equip = dnm:AddOption( "#xdefm.Equip", function()
							if !slo.B_OnMove then xdefm_Command( LocalPlayer(), "MoveInv", slo.S_Place.."|21" ) end end )
							O_Equip:SetIcon( "icon16/bug_go.png" ) else
							local O_Dequip = dnm:AddOption( "#xdefm.Dequip", function() if slo.B_OnMove then return end
							local num = 0  for k, v in pairs( LocalPlayer().xdefm_Profile.Items ) do if k != 21 and v == "_" then num = k break end end
							if num > 0 then xdefm_Command( LocalPlayer(), "MoveInv", "21|"..num ) end end ) O_Dequip:SetIcon( "icon16/bug_go.png" )
						end
					end
					if slo.T_Item.Type == "Recipe" and IsValid( xdefm.miscs.Menus[ "Craft" ] ) then
						local O_Store = dnm:AddOption( "#xdefm.Store", function()
						if !slo.B_OnMove and IsValid( xdefm.miscs.Menus[ "Craft" ] ) then
							xdefm_Command( LocalPlayer(), "MoveCraft", slo.S_Place )
						else xdefm_AddNote( ply, "!V", "resource/warning.wav", "cross", 5 ) end end )
						O_Store:SetIcon( "icon16/script_go.png" )
					end
					if IsValid( xdefm.miscs.Menus[ "Trade" ] ) then
						local O_Store = dnm:AddOption( "#xdefm.Weapon_Trade", function()
						if !slo.B_OnMove and IsValid( xdefm.miscs.Menus[ "Trade" ] ) and istable( xdefm.miscs.Menus[ "Trade" ].T_Slo1 ) then
						local num = 0  for k, v in pairs( xdefm.miscs.Menus[ "Trade" ].T_Slo1 ) do
						if isstring( v.S_Item ) and v.S_Item == "_" then num = k break end end if num > 0 then
						xdefm_Command( LocalPlayer(), "MoveTrade", slo.S_Place.."|"..num )
						else xdefm_AddNote( ply, "!V", "resource/warning.wav", "cross", 5 ) end end end )
						O_Store:SetIcon( "icon16/basket_go.png" )
					end
					dnm:Open()
				end
			end end
		if true then local pax = pan.P_Menu2 --升级栏目
			local skp = pax.P_Scroll:Add( "DPanel" ) skp:SetSize( 0, 30 ) skp:Dock( TOP )
			function skp:Paint( w, h ) local tab = xdefm.miscs.Menus.Inventory.T_Data
				draw.TextShadow( { text = language.GetPhrase( "xdefm.Skp" )..": "..tab.Skp, pos = { 8, h/2 }, font = "xdefm_Font7",
				xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
			end local MatA = Material( "gui/gradient_up" )
			local function AddASkillTab( ski ) local num = xdefm.miscs.Costs[ ski ]  if !isnumber( num ) or !tab[ "Upd"..ski ] then return end
				local pan = pax.P_Scroll:Add( "DPanel" ) pan:SetSize( 0, 38 ) pan:Dock( TOP ) pan.N_Goto = math.Clamp( tab[ "Upd"..ski ]/100, 0, 1 )
				function pan:Paint( w, h ) local tab = xdefm.miscs.Menus.Inventory.T_Data
					pan.N_Goto = Lerp( 0.1, pan.N_Goto, math.Clamp( tab[ "Upd"..ski ]/( ski == "G" and 5 or 100 ), 0, 1 ) )
					surface.SetDrawColor( Color( 0, 155, 155, 55 ) ) surface.DrawRect( 8, 4, w -16, h -8 )
					local col = xdefm.ext_col  if ski == "G" and GetConVar( "xdefmod_nomorehook" ):GetInt() >= 1 then col = Color( 255-col.r, 255-col.g, 255-col.b ) end
					draw.RoundedBox( 0, 8, 2, 415*pan.N_Goto, h -4, col )
					surface.SetMaterial( MatA ) surface.SetDrawColor( xdefm.bck_col ) surface.DrawTexturedRect( 8, 2, w -16, h -4 )
					surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 8, 2, w -16, h -4, 2 )
					surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 8, 2, w -16, h -4, 1 )
					draw.TextShadow( { text = language.GetPhrase( "xdefm.Upd"..ski )..( ski == "G" and GetConVar( "xdefmod_nomorehook" ):GetInt() >= 1 and " ※" or "" ),
					pos = { 16, h/2 }, font = "xdefm_Font5", xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
					draw.TextShadow( { text = "Lv."..( ( ski == "G" and tab[ "Upd"..ski ] >= 5 or tab[ "Upd"..ski ] >= 100 ) and "Max" or tab[ "Upd"..ski ] ),
					pos = { w -160, h/2 }, font = "xdefm_Font5", xalign = TEXT_ALIGN_RIGHT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
					draw.TextShadow( { text = "±"..tostring( num ), pos = { w -72, h/2 }, font = "xdefm_Font1",
					xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
				end for i=1, 2 do
					local but = pan:Add( "DButton" ) but:SetSize( 30, 20 ) but:SetPos( 305 +(i-1)*80, 10 ) but:SetText( "" )
						but.B_Hover = false  but.N_Lerp = 0  function but:Paint( w, h ) but.N_Lerp = Lerp( 0.2, but.N_Lerp, but.B_Hover and 1 or 0 )
						col = Color( 100 +55*but.N_Lerp, 100 +100*but.N_Lerp, 100 +100*but.N_Lerp ) local skl = xdefm.miscs.Menus.Inventory.T_Data[ "Upd"..ski ]
						local mmm = ( ski == "G" and skl >= 5 or skl >= 100 )
						if ( i == 2 and mmm ) or ( i == 1 and skl <= 0 ) or ( i == 2 and xdefm.miscs.Menus.Inventory.T_Data[ "Skp" ] < num ) then return end
						draw.RoundedBox( 0, 1, 1, w -2, h -2, col ) draw.TextShadow( { text = ( i == 2 and "+" or "-" ), pos = { w/2, h/2 }, font = "xdefm_Font4",
						xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
						surface.SetDrawColor( 0, 0, 0, 255 ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
						surface.SetDrawColor( 255, 255, 255, 255 ) surface.DrawOutlinedRect( 0, 0, w, h, 1 ) end
					function but:OnCursorEntered() self.B_Hover = true end function but:OnCursorExited() self.B_Hover = false end
					function but:DoClick() local skl = xdefm.miscs.Menus.Inventory.T_Data[ "Upd"..ski ]
						local skl = xdefm.miscs.Menus.Inventory.T_Data[ "Upd"..ski ]  local mmm = ( ski == "G" and skl >= 5 or skl >= 100 )
						if ( i == 2 and mmm ) or ( i == 1 and skl <= 0 ) or ( i == 2 and xdefm.miscs.Menus.Inventory.T_Data[ "Skp" ] < num ) then return end
						xdefm_Command( LocalPlayer(), i == 1 and "Downgrade" or "Upgrade", ski.."|"..1 ) end
					function but:DoRightClick() if IsValid( pan.P_DMenu ) then pan.P_DMenu:Remove() end
						local skl = xdefm.miscs.Menus.Inventory.T_Data[ "Upd"..ski ]  local mmm = ( ski == "G" and skl >= 5 or skl >= 100 )
						if ( i == 2 and mmm ) or ( i == 1 and skl <= 0 ) or ( i == 2 and xdefm.miscs.Menus.Inventory.T_Data[ "Skp" ] < num ) then return end
						pan.P_DMenu = DermaMenu( false, nil )  local dnm = pan.P_DMenu  local wt = ( i == 2 and "+" or "-" )
						local O_X1 = dnm:AddOption( wt.."1", function() if !IsValid( xdefm.miscs.Menus.Inventory ) then return end
							xdefm_Command( LocalPlayer(), i == 1 and "Downgrade" or "Upgrade", ski.."|"..1 ) end )
						local O_X5 = dnm:AddOption( wt.."5", function() if !IsValid( xdefm.miscs.Menus.Inventory ) then return end
							xdefm_Command( LocalPlayer(), i == 1 and "Downgrade" or "Upgrade", ski.."|"..5 ) end )
						if ski != "G" then local O_X10 = dnm:AddOption( wt.."10", function() if !IsValid( xdefm.miscs.Menus.Inventory ) then return end
							xdefm_Command( LocalPlayer(), i == 1 and "Downgrade" or "Upgrade", ski.."|"..10 ) end )
						local O_X50 = dnm:AddOption( wt.."50", function() if !IsValid( xdefm.miscs.Menus.Inventory ) then return end
							xdefm_Command( LocalPlayer(), i == 1 and "Downgrade" or "Upgrade", ski.."|"..50 ) end )
						local O_X100 = dnm:AddOption( wt.."100", function() if !IsValid( xdefm.miscs.Menus.Inventory ) then return end
							xdefm_Command( LocalPlayer(), i == 1 and "Downgrade" or "Upgrade", ski.."|"..100 ) end ) end
						dnm:Open() end
				end
			end local MaX = Material( "gui/center_gradient" )
			AddASkillTab( "A" ) AddASkillTab( "B" ) AddASkillTab( "C" ) AddASkillTab( "D" ) AddASkillTab( "E" ) AddASkillTab( "F" ) AddASkillTab( "G" )
			if true then --清点按钮
				local ppp = pax.P_Scroll:Add( "DPanel" ) ppp:SetSize( 0, 75 ) ppp:Dock( TOP ) function ppp:Paint( w, h ) end ppp.N_Lerp = 0
				local but = ppp:Add( "DButton" ) but:SetSize( 150, 28 ) but:SetPos( 274, 8 ) but:SetText( "" ) but.B_Hover = false function but:Paint( w, h )
					ppp.N_Lerp = Lerp( 0.2, ppp.N_Lerp, but.B_Hover and 1 or 0 )
					col = Color( 100 +55*ppp.N_Lerp, 100 +100*ppp.N_Lerp, 100 +100*ppp.N_Lerp )
					if xdefm.miscs.SkpCool > CurTime() then col = Color( 55, 55, 55 ) end
					surface.SetDrawColor( col ) surface.DrawRect( 0, 0, w, h ) local txt = language.GetPhrase( "xdefm.ResetSkp" )
					if xdefm.miscs.SkpCool > CurTime() then txt = math.Round( xdefm.miscs.SkpCool-CurTime() ).."s"
						local per = math.Clamp( (xdefm.miscs.SkpCool-CurTime())/GetConVar( "xdefmod_skpcool" ):GetInt(), 0, 1 )
						surface.SetDrawColor( 255, 55, 55 ) surface.DrawRect( 0, 0, w*per, h )
					end surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
					surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 ) draw.TextShadow( { text = txt,
					pos = { w/2, h/2 -1 }, font = "xdefm_Font2", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
				end function but:OnCursorEntered() self.B_Hover = true end function but:OnCursorExited() self.B_Hover = false end
				function but:DoClick() if xdefm.miscs.SkpCool > CurTime() then return end
					if IsValid( pan.P_DMenu ) then pan.P_DMenu:Remove() end pan.P_DMenu = DermaMenu( false, nil )  local dnm = pan.P_DMenu
					local O_Yes = dnm:AddOption( "#xdefm.Confirm", function() if xdefm.miscs.SkpCool <= CurTime() and IsValid( xdefm.miscs.Menus[ "Inventory" ] ) then
						xdefm.miscs.SkpCool = CurTime()+GetConVar( "xdefmod_skpcool" ):GetInt() xdefm_Command( LocalPlayer(), "ResetSkp", "_" )
					end end ) O_Yes:SetIcon( "icon16/tick.png" ) dnm:Open()
				end
			end end
		if true then local pax = pan.P_Menu3 --状态栏目
			local function AddAStatTab( stt, aba )
				local pan = pax.P_Scroll:Add( "DPanel" ) pan:SetSize( 0, stt == "!V" and 9 or 30 ) pan:Dock( TOP )
				function pan:Paint( w, h ) if stt == "!V" then return end local tab = xdefm.miscs.Menus.Inventory.T_Data
					local dat, num = stt, 0  if isnumber( xdefm.miscs.Costs[ stt ] )
					then dat = "Upd"..stt  num = xdefm_GetUpValue( tab[ dat ], stt ) else num = tab[ stt ] or 0 end
					draw.TextShadow( { text = language.GetPhrase( "xdefm."..dat )..": "..num,
					pos = { 16, h/2 }, font = "xdefm_Font1", xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
				end
			end
			AddAStatTab( "!V" ) AddAStatTab( "TCatch" ) AddAStatTab( "TEarn" ) AddAStatTab( "TExp" )
			AddAStatTab( "TBuy" ) AddAStatTab( "TCraft" ) AddAStatTab( "TQuest" ) end end
		if true then local pax = pan.P_Menu5 --商店栏目
			pax.P_Scroll:Dock( NODOCK ) pax.P_Scroll:SetPos( 2, 2 ) pax.P_Scroll:SetSize( 434, 347 )
			pax.P_Hold = pax.P_Scroll:Add( "DIconLayout" )  local pa2 = pax.P_Hold  pa2:SetSize( 434, 347 )
			pa2:SetSpaceX( 3 ) pa2:SetSpaceY( 3 ) pa2:SetPos( 3, 2 ) local MaX = Material( "gui/center_gradient" )
			for k, v in SortedPairsByMemberValue( xdefm.shop, 2 ) do
				local Item = pax.P_Hold:Add( "DButton" ) Item:SetSize( 210, 75 ) Item.N_Clicked = 0  Item:SetCursor( "blank" )
				local aa, bb = xdefm_ItemGet( k ) if !istable( bb ) or bb.Type != "Bait" then Item:Remove() return end  Item.N_Lerp = 0.3
				Item.S_Name = bb.Name  Item.N_Rarity = bb.Rarity  Item.S_Item = k  Item.N_Level = v[ 2 ]  Item.N_Cost = math.ceil( v[ 1 ] * v[ 3 ] )
				function Item:OnCursorEntered() xdefm.miscs.AimPan = Item  xdefm.miscs.Marker = Item.S_Item  Item.B_OnMove = true  xdefm.miscs.LC = false end
				function Item:OnCursorExited() if xdefm.miscs.AimPan == Item then xdefm.miscs.AimPan = nil  xdefm.miscs.Marker = nil end Item.B_OnMove = false end
				function Item:DoClick() Item.N_Clicked = CurTime() +0.2  local yes, pro = true, LocalPlayer().xdefm_Profile
					if pro.Money < Item.N_Cost then xdefm_AddNote( ply, "xdefm.NoMoney", "resource/warning.wav", "cross", 5 ) yes = false end
					if yes and pro.Level < Item.N_Level then xdefm_AddNote( ply, "xdefm.NoLevel", "resource/warning.wav", "cross", 5 ) yes = false end
					if yes then xdefm_Command( LocalPlayer(), "BuyBait", Item.S_Item ) end end
				function Item:OnRemove() Item:OnCursorExited() end
				function Item:Paint( w, h ) local col = xdefm.miscs.Rarity[ Item.N_Rarity+1 ]
					local tab = xdefm.shop[ k ]  Item.N_Cost = math.ceil( tab[ 1 ] * tab[ 3 ] )
					draw.RoundedBox( 0, 0, 0, w, h, col )  local pro = LocalPlayer().xdefm_Profile  if !istable( pro ) then return end
					Item.N_Lerp = Lerp( 0.2, Item.N_Lerp, Item.N_Clicked > CurTime() and 0.1 or ( xdefm.miscs.AimPan == Item and 0.5 or 0.3 ) )
					local ccc = Item.N_Lerp  draw.RoundedBox( 0, 1, 1, w -2, h -2, Color( col.r*ccc, col.g*ccc, col.b*ccc ) )
					surface.SetMaterial( MaX ) surface.SetDrawColor( col.r*ccc*1.5, col.g*ccc*1.5, col.b*ccc*1.5 ) surface.DrawTexturedRect( 1, 1, w -2, h -2 )
					local co1, co2 = Color( 255, 0, 0 ), Color( 0, 255, 0 )
					draw.TextShadow( {
						text = language.GetPhrase( Item.S_Name ), pos = { 75, 15 }, font = "xdefm_Font2",
						xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = col
					}, 1, 255 )
					draw.TextShadow( {
						text = language.GetPhrase( "xdefm.Price" )..": "..Item.N_Cost, pos = { 75, 35 }, font = "xdefm_Font2",
						xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = pro.Money >= Item.N_Cost and co2 or co1
					}, 1, 255 )
					draw.TextShadow( {
						text = language.GetPhrase( "xdefm.Level" )..": "..Item.N_Level, pos = { 75, 55 }, font = "xdefm_Font2",
						xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = pro.Level >= Item.N_Level and co2 or co1
					}, 1, 255 ) end
				Item.P_Frame = Item:Add( "DPanel" )  Item:SetText( "" )
				Item.P_Frame:SetSize( 64, 64 ) Item.P_Frame:SetPos( 6, 6 )
				Item.P_Frame:SetMouseInputEnabled( false )  function Item.P_Frame:Paint( w, h ) local col = xdefm.miscs.Rarity[ Item.N_Rarity+1 ]
					surface.SetDrawColor( Color( col.r*0.2, col.g*0.2, col.b*0.2 ) )  surface.DrawRect( 0, 0, w, h )
					surface.SetDrawColor( col )  surface.DrawOutlinedRect( 0, 0, w, h, 2 )
					surface.SetDrawColor( xdefm.lin_col )  surface.DrawOutlinedRect( 0, 0, w, h, 1 ) end
				Item.P_Icon = Item.P_Frame:Add( "ModelImage" ) Item.P_Icon:DockMargin( 5, 5, 5, 5 )
				Item.P_Icon:Dock( FILL ) Item.P_Icon:SetModel( bb.Model[ 1 ] ) Item.P_Icon:SetMouseInputEnabled( false )
			end end
		if GetConVar( "xdefmod_lbdelay" ):GetInt() > 0 and !game.SinglePlayer() then local pax = pan.P_Menu4 --排行栏目
			local ldb = pax:Add( "DPanel" ) ldb:SetSize( 0, 355 ) ldb:Dock( TOP ) pax.T_Leader = xdefm.Leader
			function ldb:Paint( w, h ) local tab = xdefm.miscs.Menus.Inventory.T_Data
				if !istable( pax.T_Leader ) or #pax.T_Leader <= 0 then
					draw.TextShadow( { text = language.GetPhrase( "xdefm.NoInfo" ), pos = { w/2, h/2 }, font = "xdefm_Font5",
					xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 ) return end
				draw.TextShadow( { text = language.GetPhrase( "xdefm.Level" ), pos = { 245, 24 }, font = "xdefm_Font5",
				xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
				draw.TextShadow( { text = language.GetPhrase( "xdefm.Money" ), pos = { 345, 24 }, font = "xdefm_Font5",
				xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
				draw.TextShadow( { text = language.GetPhrase( "xdefm.Player" ), pos = { 65, 24 }, font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
			end local Mat, Ma2 = Material( "gui/noicon.png" ), Material( "gui/center_gradient" )
			pax.P_Scroll = ldb:Add( "DScrollPanel" ) pax.P_Scroll:SetSize( 420, 310 ) local scr = pax.P_Scroll
			local vba = pax.P_Scroll:GetVBar() pax.P_Scroll:SetPos( 6, 40 ) vba:SetHideButtons( true ) vba:SetSize( 0, 0 )
			function vba.btnGrip:Paint( w, h ) end function vba:Paint( w, h ) end function pax.P_Scroll:Paint( w, h ) end
			function pax:UpdateLbd( tab ) pax.T_Leader = tab  scr:Clear() if !istable( tab ) then return end
				for k, v in pairs( tab ) do
					local plc = scr:Add( "DPanel" ) plc:Dock( TOP ) plc:SetSize( 0, 40 ) plc:DockMargin( 0, 4, 0, 0 )
					plc.N_Place = k  plc.T_Data = v  plc.S_Sid = v[ 2 ]
					local avt = plc:Add( "AvatarImage" ) avt:SetPos( 33, 4 ) avt:SetSize( 32, 32 ) avt:SetSteamID( plc.S_Sid, 64 )
					plc:SetToolTip( plc.S_Sid ) function plc:Paint( w, h ) local col = xdefm.ext_col
						local npl = plc.N_Place  if npl == 1 then col = Color( 255, 255, 55 ) elseif npl == 2 then col = Color( 255, 255, 255 )
						elseif npl == 3 then col = Color( 255, 155, 55 ) end local co2 = Color( col.r*0.3, col.g*0.3, col.b*0.3 )  local co3 = Color( col.r*0.6, col.g*0.6, col.b*0.6 )
						surface.SetDrawColor( co2 ) surface.DrawRect( 0, 0, w, h )
						surface.SetDrawColor( co3 ) surface.SetMaterial( Ma2 ) surface.DrawTexturedRect( 0, 0, w, h )
						local bb, si = ( LocalPlayer():SteamID64() == plc.S_Sid ), ( 0.5 +0.5*math.abs( math.sin( CurTime()*4 ) ) )
						surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, bb and 3 or 2 )
						surface.SetDrawColor( bb and Color( col.r*si, col.g*si, col.b*si ) or col ) surface.DrawOutlinedRect( 0, 0, w, h, bb and 2 or 1 )
						draw.TextShadow( { text = k..".", pos = { 16, h/2 }, font = "xdefm_Font7",
						xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = col }, 1, 255 )
						surface.SetMaterial( Mat ) surface.SetDrawColor( 255, 255, 255 ) surface.DrawTexturedRect( 32, 3, 33, 33 )
						surface.SetDrawColor( col ) surface.DrawOutlinedRect( 32, 3, 34, 34, 2 )
						draw.TextShadow( { text = plc.T_Data[ 3 ], pos = { 72, h/2 }, font = "xdefm_Font2",
						xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = col }, 1, 255 )
						draw.TextShadow( { text = plc.T_Data[ 4 ], pos = { 240, h/2 }, font = "xdefm_Font2",
						xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = col }, 1, 255 )
						draw.TextShadow( { text = plc.T_Data[ 5 ], pos = { 340, h/2 }, font = "xdefm_Font2",
						xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = col }, 1, 255 )
					end
				end
			end pax:UpdateLbd( xdefm.leader ) end
	if true then -- 鱼饵框架
		pan.P_AFrame = pan:Add( "DPanel" )  pax = pan.P_AFrame
		pax:SetText( "" ) pax:SetPos( 336 -4, 9 -3 ) pax:SetSize( 64 +8, 64 +8 ) pax:SetMouseInputEnabled( false )
		function pax:Paint( w, h ) surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 ) end end
	function pan:XDEFM_Update( id, dt ) if id == 7 and IsValid( pan.P_Menu4 ) then pan.P_Menu4:UpdateLbd( dt ) end
		if id == 0 then pan.T_Data = dt  for k, v in pairs( pan.T_Slots ) do v:F_SetupItem( dt.Items[ k ] ) end end
	end
elseif typ == 1 then --任务
	if IsValid( xdefm.miscs.Menus[ "Quest" ] ) then return end local Aro = Material( "gui/arrow" )
	local pan = vgui.Create( "DFrame" )  xdefm.miscs.Menus.Quest = pan
	pan:SetPos( ScrW()/2 -300, ScrH()/2 -300 ) pan:SetSize( 600, 400 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:ParentToHUD() pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW()/2 -300, ScrH()/2 -300, 0.2 ) pan.T_Require = {} pan.T_Reward = {}
	pan.B_1 = false  pan.B_2 = false  pan.B_3 = false  pan.N_Total = 0
	function pan:Paint( w, h ) local tab = pan.T_Data
		surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 0 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 180 )
		surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.TextShadow( {
			text = language.GetPhrase( "xdefm.Quest" ) .. " #"..pan.N_Total, font = "xdefm_Font6", pos = { w/2, 24 },
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 )
		}, 1, 255 )
		draw.TextShadow( {
			text = language.GetPhrase( "xdefm.Require" ), font = "xdefm_Font5", pos = { w/2 -160, 50 },
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 )
		}, 1, 255 )
		draw.TextShadow( {
			text = language.GetPhrase( "xdefm.Reward" ), font = "xdefm_Font5", pos = { w/2 +160, 50 },
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 )
		}, 1, 255 ) surface.SetMaterial( Aro )
		surface.SetDrawColor( pan.B_2 and Color( 0, 255, 0 ) or Color( 255, 0, 0 ) ) surface.DrawTexturedRectRotated( w/2, h/2 -15, 60, 60, 90 )
		surface.SetDrawColor( pan.B_1 and Color( 0, 255, 0 ) or Color( 255, 0, 0 ) ) surface.DrawTexturedRectRotated( w/2, h/2 +15, 60, 60, 270 ) end
	if true then -- 关闭按钮
		pan.P_Close = pan:Add( "DButton" )  local pax = pan.P_Close
		pax:SetText( "" ) pax:SetPos( 560, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint( w, h ) draw.TextShadow( {
				text = "×", pos = { w/2, h/2 }, font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER,
				color = ( pax.B_Hover and Color( 255, 0, 0 ) or Color( 255, 255, 255 ) )
		}, 2, 255 ) end function pax:DoClick() pan:Close() end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end --
	for i=1, 2 do -- 需求奖励
		local pax = pan:Add( "DPanel" ) pax:SetPos( 300 -110 -175 +320*( i-1 ), 75 ) pax:SetSize( 250, 250 )
		function pax:Paint( w, h )
			surface.SetDrawColor( Color( xdefm.bck_col.r*0.5, xdefm.bck_col.g*0.5, xdefm.bck_col.b*0.5 ) ) surface.DrawRect( 0, 0, w, h )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h )
		end
		pax.P_Scroll = pax:Add( "DScrollPanel" ) pax.P_Scroll:SetSize( 246, 246 ) pax.P_Scroll:SetPos( 1, 2 )
		local vba = pax.P_Scroll:GetVBar()  vba:SetHideButtons( true )  vba:SetSize( 0, 0 )
		function vba.btnGrip:Paint( w, h ) end function vba:Paint( w, h ) end function pax.P_Scroll:Paint( w, h ) end
		pax.P_Hold = pax.P_Scroll:Add( "DIconLayout" )  local pa2 = pax.P_Hold  pa2:SetSize( 246, 0 )
		pa2:DockMargin( 4, 4, 4, 4 ) pa2:SetSpaceX( 3 ) pa2:SetSpaceY( 3 ) pa2:SetPos( 4, 2 ) function pa2:Paint( w, h ) end
		if i == 1 then pan.P_1 = pax.P_Hold else pan.P_2 = pax.P_Hold end
	end
	for i=1, 2 do -- 跳过结算
		local but = pan:Add( "DButton" ) but:SetPos( 300 -75 -( i == 1 and -100 or 100 ), 340 ) but:SetSize( 150, 45 )
		but:SetText( "" )  but.B_Hover = false  but.N_Lerp = 0  but.N_Clicked = 0
		function but:Paint( w, h ) local col = Color( 0, 155, 0 )
			but.N_Lerp = Lerp( 0.2, but.N_Lerp, but.N_Clicked > CurTime() and -1 or ( but.B_Hover and 1 or 0 ) )
			if ( i == 1 and ( !pan.B_1 or !pan.B_2 ) ) or ( i == 2 and !pan.B_3 ) then col = Color( 155, 0, 0 ) end
			col = Color( col.r +col.r*0.5*but.N_Lerp, col.g +col.g*0.5*but.N_Lerp, col.b +col.b*0.5*but.N_Lerp )
			surface.SetDrawColor( col ) surface.DrawRect( 0, 0, w, h )
			draw.TextShadow( { text = i == 1 and "#xdefm.Finish" or "#xdefm.Skip", pos = { w/2, h/2 }, font = "xdefm_Font4",
			color = Color( 255, 255, 255 ), xalign = TEXT_ALIGN_CENTER, yalign =  TEXT_ALIGN_CENTER }, 1, 200 )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		end
		function but:OnCursorEntered() but.B_Hover = true end
		function but:OnCursorExited() but.B_Hover = false end
		function but:DoClick() if but.N_Clicked > CurTime() then return end
			but.N_Clicked = CurTime() +0.25
			if i == 1 then
				if !pan.B_1 then
					xdefm_AddNote( ply, "xdefm.Deny1", "resource/warning.wav", "cross", 5 )
				elseif !pan.B_2 then
					xdefm_AddNote( ply, "xdefm.Deny2", "resource/warning.wav", "cross", 5 )
				else
					pan.P_Close:DoClick()
					xdefm_Command( LocalPlayer(), "Quest", "_" )
				end
			elseif !pan.B_3 then
				xdefm_AddNote( ply, "xdefm.Deny3", "resource/warning.wav", "cross", 5 )
			else
				pan.P_Close:DoClick()
				xdefm_Command( LocalPlayer(), "Skip", "_" )
			end
		end
		if i == 1 then pan.P_3 = but else pan.P_4 = but end
	end
	function pan:XDEFM_Update( id, dt )
		pan.B_1 = true
		pan.B_2 = false
		pan.B_3 = ( LocalPlayer():GetNWFloat( "XDEFM_QC" ) <= CurTime() )
		if id == 0 then
			pan.N_Total = ( dt.TQuest or 0 ) +1
			local tem = {}
			for k, v in pairs( pan.T_Require ) do
				local yes = false
				for m, n in pairs( dt.Items ) do
					if m != 21 and !tem[ m ] and xdefm_GetClass( n ) == v then
						tem[ m ] = 0
						yes = true
						break
					end
				end
				if !yes then pan.B_1 = false break end
			end
			local emp = 0
			for k, v in pairs( dt.Items ) do
				if k != 21 and ( v == "_" or tem[ k ] ) then emp = emp +1 end
			end
			pan.B_2 = ( emp >= #pan.T_Reward )
		elseif id == 10 then
			pan.P_1:Clear() pan.P_2:Clear() pan.T_Require = {} pan.T_Reward = {}
			for i=1, 2 do
				local tab = dt[ i+1 ]  if !isstring( tab ) then break end
				tab = string.Explode( "&", tab ) or { tab }
				for k, v in pairs( tab ) do
					local aa, bb = xdefm_ItemGet( v )
					if istable( bb ) then
						local slo = xdefm_SlotBox( 0, 0, 58, 58, i, nil, nil, true ) slo:F_SetupItem( v )
						if i == 1 then pan.P_1:Add( slo ) table.insert( pan.T_Require, v )
						else pan.P_2:Add( slo ) table.insert( pan.T_Reward, v ) end
					end
				end
			end
		end
	end
	pan:XDEFM_Update( 10, tab )
elseif typ == 2 then -- 兑换
	if IsValid( xdefm.miscs.Menus[ "Exchange" ] ) then xdefm.miscs.Menus[ "Exchange" ]:Remove() return end
	local pan = vgui.Create( "DFrame" )  xdefm.miscs.Menus.Exchange = pan  pan.T_Data = tab  pan.N_Enter = 0
	pan:SetPos( ScrW()/2 -300, ScrH()/2 -150 ) pan:SetSize( 600, 275 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:ParentToHUD() pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW()/2 -300, ScrH()/2 -275/2, 0.2 ) ply.xdefm_Profile = tab  pan.N_Clicked = 0
	function pan:Paint( w, h ) local tab = pan.T_Data
		surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 0 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 180 )
		surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.TextShadow( { text = ply:Nick(), pos = { 115, 25 }, font = "xdefm_Font4",
		xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		draw.TextShadow( { text = language.GetPhrase( "#xdefm.FMoney" )..": "..tab.Money, pos = { 115, 55 }, font = "xdefm_Font1",
		xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		draw.TextShadow( { text = language.GetPhrase( "#xdefm.DMoney" )..": "..( ply.getDarkRPVar and ply:getDarkRPVar("money") or "Currency Not Found!" ), pos = { 115, 78 }, font = "xdefm_Font1",
		xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		local rat = math.Round( 0.99*GetConVar( "xdefmod_darkrp" ):GetFloat()*100, 2 ).."%"
		draw.TextShadow( { text = language.GetPhrase( "#xdefm.DRate" )..": "..rat, pos = { 115, 101 }, font = "xdefm_Font1",
		xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 8, 115, 582, 150, 2 )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 8, 115, 582, 150 )
		surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 16, 126, 564, 43 )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 16, 126, 564, 43 ) end
	if true then -- 头像
		pan.P_AIcon = pan:Add( "AvatarImage" )  local pax = pan.P_AIcon
		pax:SetPos( 8, 10 ) pax:SetSize( 100, 100 ) pax:SetPlayer( ply, 128 ) pax:SetMouseInputEnabled( false )
		pan.P_AFrame = pan:Add( "DPanel" )  pax = pan.P_AFrame
		pax:SetText( "" ) pax:SetPos( 8, 10 ) pax:SetSize( 100, 100 ) pax:SetMouseInputEnabled( false )
		function pax:Paint( w, h ) surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 3 )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 ) end end
	if true then -- 关闭按钮
		pan.P_Close = pan:Add( "DButton" )  local pax = pan.P_Close
		pax:SetText( "" ) pax:SetPos( 560, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint( w, h ) draw.TextShadow( {
				text = "×", pos = { w/2, h/2 }, font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER,
				color = ( pax.B_Hover and Color( 255, 0, 0 ) or Color( 255, 255, 255 ) )
		}, 2, 255 ) end function pax:DoClick() pan:Close() end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end
	if true then -- 数值
		pan.P_Entry = vgui.Create( "DTextEntry", pan )
		pan.P_Entry:SetSize( 555, 35 ) pan.P_Entry:SetPos( 20, 130 ) pan.P_Entry:SetFont( "xdefm_Font4" )
		pan.P_Entry:SetUpdateOnType( true ) pan.P_Entry:SetNumeric( true ) pan.P_Entry:SetMultiline( false )
		pan.P_Entry:SetTextColor( Color( 0, 0, 0 ) )
		pan.P_Entry:SetPlaceholderText( "#xdefm.DEnter" )
		function pan.P_Entry:OnValueChange( val )
			local num = isnumber( tonumber( val ) ) and tonumber( val ) or 0
			if !isnumber( num ) or num < 0 or num > 2147483647 then
				num = math.Clamp( !isnumber( num ) and 0 or num, 0, 2147483647 )
				pan.P_Entry:SetText( num ) surface.PlaySound( "resource/warning.wav" )
			end
			pan.N_Enter = num
		end end
	for i=1, 2 do -- 转换按钮
		if !ply.getDarkRPVar then break end
		local but = vgui.Create( "DButton", pan )  but:SetText( "" )  but.B_Hover = false  but.N_Lerp = 0
		but:SetSize( 200, 60 ) but:SetPos( -180 +i*250, 190 ) but.N_Num = 0
		function but:Paint( w, h )
			local rat = GetConVar( "xdefmod_darkrp" ):GetFloat()
			local num = math.max( i == 1 and math.floor( pan.N_Enter*rat*0.99 ) or math.floor( pan.N_Enter/rat*0.99 ), 0 )
			local col = Color( 155, 0, 0 )
			if num > 0 then
				if ( i == 1 and pan.T_Data.Money >= pan.N_Enter ) or ( i == 2 and LocalPlayer():canAfford( pan.N_Enter ) ) then
					col = Color( 0, 155, 0 )
				end
			end
			but.N_Num = Lerp( 0.2, but.N_Num, num )
			but.N_Lerp = Lerp( 0.2, but.N_Lerp, pan.N_Clicked > CurTime() and -1 or ( but.B_Hover and 1 or 0 ) )
			col = Color( col.r +col.r*0.5*but.N_Lerp, col.g +col.g*0.5*but.N_Lerp, col.b +col.b*0.5*but.N_Lerp )
			surface.SetDrawColor( col ) surface.DrawRect( 0, 0, w, h )
			draw.TextShadow( { text = i == 1 and "#xdefm.Conv1" or "#xdefm.Conv2", pos = { w/2, 16 }, font = "xdefm_Font5",
			color = Color( 255, 255, 255 ), xalign = TEXT_ALIGN_CENTER, yalign =  TEXT_ALIGN_CENTER }, 1, 200 )
			draw.TextShadow( { text = math.Round( but.N_Num ), pos = { w/2, 45 }, font = "xdefm_Font5",
			color = Color( 255, 255, 255 ), xalign = TEXT_ALIGN_CENTER, yalign =  TEXT_ALIGN_CENTER }, 1, 200 )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		end
		function but:OnCursorEntered() but.B_Hover = true end
		function but:OnCursorExited() but.B_Hover = false end
		function but:DoClick() if pan.N_Clicked > CurTime() then return end
			local rat = GetConVar( "xdefmod_darkrp" ):GetFloat()
			local num = math.max( i == 1 and math.floor( pan.N_Enter*rat*0.99 ) or math.floor( pan.N_Enter/rat*0.99 ), 0 )
			if num > 0 and ( ( i == 1 and pan.T_Data.Money >= pan.N_Enter ) or ( i == 2 and LocalPlayer():canAfford( pan.N_Enter ) ) ) then
				xdefm_Command( ply, "Convert", pan.N_Enter.."|"..i )
				pan.N_Clicked = CurTime() +0.5
			else
				surface.PlaySound( "resource/warning.wav" )
				pan.N_Clicked = CurTime() +0.25
			end
		end end
	function pan:XDEFM_Update( id, dt ) if id == 0 then pan.T_Data = dt end end
elseif typ == 3 then -- 渔夫
	if IsValid( xdefm.miscs.Menus[ "NPC" ] ) then return end
	local pan = vgui.Create( "DFrame" )  xdefm.miscs.Menus.NPC = pan  pan.T_Data = tab  pan.N_Enter = 0
	pan:SetPos( ScrW()/2 -250, ScrH()/2 -150 ) pan:SetSize( 500, 345 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:ParentToHUD() pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW()/2 -250, ScrH()/2 -275/2, 0.2 ) ply.xdefm_Profile = tab  pan.N_Clicked = 0
	function pan:Paint( w, h ) local tab = pan.T_Data
		surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 0 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 180 )
		surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.TextShadow( { text = "#xdefm.DarkNPC2", pos = { w/2, 24 }, font = "xdefm_Font4",
		xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		surface.SetDrawColor( Color( xdefm.bck_col.r*0.5, xdefm.bck_col.g*0.5, xdefm.bck_col.b*0.5, xdefm.bck_col.a*0.5 ) ) surface.DrawRect( 8, 45, 484, 290 )
		surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 8, 45, 484, 290, 2 )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 8, 45, 484, 290 ) end
	if true then -- 关闭按钮
		pan.P_Close = pan:Add( "DButton" )  local pax = pan.P_Close
		pax:SetText( "" ) pax:SetPos( 460, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint( w, h ) draw.TextShadow( {
				text = "×", pos = { w/2, h/2 }, font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER,
				color = ( pax.B_Hover and Color( 255, 0, 0 ) or Color( 255, 255, 255 ) )
		}, 2, 255 ) end function pax:DoClick() pan:Close() end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end
	local icos = { "box", "coins", "basket", "wrench", "camera", "script", "arrow_refresh" }
	for i=1, 7 do -- 互动按钮
		local but = vgui.Create( "DButton", pan )  but:SetText( "" )  but.B_Hover = false  but.N_Lerp = 0
		but:SetSize( 472, 36 ) but:SetPos( 14, 12 +40*i ) but:SetIcon( "icon16/"..icos[ i ]..".png" ) but.N_Clicked = 0
		function but:Paint( w, h ) local col = Color( 100, 100, 100 )
			but.N_Lerp = Lerp( 0.2, but.N_Lerp, but.N_Clicked > CurTime() and -1 or ( but.B_Hover and 1 or 0 ) )
			col = Color( col.r +col.r*0.5*but.N_Lerp, col.g +col.g*0.5*but.N_Lerp, col.b +col.b*0.5*but.N_Lerp )
			surface.SetDrawColor( col ) surface.DrawRect( 0, 0, w, h )
			draw.TextShadow( { text = "#xdefm.NPC"..i, pos = { 36, h/2 }, font = "xdefm_Font5",
			color = Color( 255, 255, 255 ), xalign = TEXT_ALIGN_LEFT, yalign =  TEXT_ALIGN_CENTER }, 1, 200 )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 ) end
		function but:OnCursorEntered() but.B_Hover = true end
		function but:OnCursorExited() but.B_Hover = false end
		function but:DoClick() if but.N_Clicked > CurTime() then return end
			surface.PlaySound( "buttons/lightswitch2.wav" )  but.N_Clicked = CurTime() +0.3
			xdefm_Command( LocalPlayer(), "NPC", tostring( i ) )
		end end
	function pan:XDEFM_Update( id, dt ) if id == 0 then pan.T_Data = dt end end
elseif typ == 4 then -- 建筑
	if IsValid( xdefm.miscs.Menus[ "Struct" ] ) then return end  local MaR = Material( "gui/gradient" )
	local pan = vgui.Create( "DFrame" )  xdefm.miscs.Menus.Struct = pan  pan.T_Data = ply.xdefm_Profile  pan.S_Recipe = "_"
	pan:SetPos( ScrW()/2 -40, ScrH()/2 -550/2 ) pan:SetSize( 600, 550 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW()/2 -40, ScrH()/2 -500/2, 0.2 ) pan.S_Struct = "_"  pan.N_Num = -1  pan.N_Max = -1  pan.N_SType = 0
	function pan:Paint( w, h )
		surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 0 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 180 )
		surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		local rec, col = "xdefm.Struct", Color( 200, 200, 200 )
		if isstring( pan.S_Struct ) and pan.S_Struct != "_" then
			local aa, bb = xdefm_ItemGet( pan.S_Struct )
			if istable( aa ) and istable( bb ) then
				rec = bb.Name  col = xdefm.miscs.Rarity[ bb.Rarity +1 ]
				local nam = language.GetPhrase( "xdefm.ST"..pan.N_SType )
				if pan.N_Num != -1 then nam = nam..( pan.N_Max != -1 and " ( "..pan.N_Num.." / "..pan.N_Max.." )" or " ( "..pan.N_Num.." )" ) end
				draw.TextShadow( { text = nam, pos = { w/2, 52 }, font = "xdefm_Font7",
				xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 128, 128, 128 ) }, 1, 255 )
			end
		end
		draw.TextShadow( { text = language.GetPhrase( rec ), pos = { w/2, 25 }, font = "xdefm_Font6",
		xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = col }, 1, 255 )
	end
	function pan:OnRemove() xdefm_Command( LocalPlayer(), "StructExit", "_" ) xdefm.miscs.LC = false end
	if true then -- 框架
		pan.P_Base = pan:Add( "DPanel" )  local pax = pan.P_Base  pax.N_Type = 0  pan.T_Slots = {}
		pax:SetPos( 8, 70 ) pax:SetSize( 582, 470 ) function pax:Paint( w, h ) end
		function pax:Paint( w, h )
			surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, h )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h )
		end
		pax.P_Scroll = pax:Add( "DScrollPanel" )  pax.P_Scroll:SetSize( 576, 462 ) pax.P_Scroll:SetPos( 4, 4 )
		local vba = pax.P_Scroll:GetVBar()  vba:SetHideButtons( true )  vba:SetSize( 0, 0 )
		function vba.btnGrip:Paint( w, h ) end function vba:Paint( w, h ) end
		function pax.P_Scroll:Paint( w, h ) end
		pax.P_Hold = pax.P_Scroll:Add( "DIconLayout" )  local pa2 = pax.P_Hold  pa2:Dock( FILL )
		pa2:SetSpaceX( 2 ) pa2:SetSpaceY( 2 ) function pa2:Paint( w, h ) end
		function pax:OnCursorEntered() self.B_Hover = true end function pax:OnCursorExited() self.B_Hover = false end
		pax.P_Hold.N_Num = 0
	end
	if true then -- 关闭按钮
		pan.P_Close = pan:Add( "DButton" )  local pax = pan.P_Close
		pax:SetText( "" ) pax:SetPos( 560, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint( w, h ) draw.TextShadow( {
				text = "×", pos = { w/2, h/2 }, font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER,
				color = ( pax.B_Hover and Color( 255, 0, 0 ) or Color( 255, 255, 255 ) )
		}, 2, 255 ) end function pax:DoClick() pan:Close() end
		function pax:OnCursorEntered() pax.B_Hover = true end
		function pax:OnCursorExited() pax.B_Hover = false end
	end --
	function pan:XDEFM_Update( id, dt ) if id == 0 then pan.T_Data = dt end
		if id == 3 then if !istable( dt ) or !istable( pan.T_Items ) or pan.N_SType != 1 then return end
			for k, v in pairs( dt ) do
				if !isnumber( k ) or !pan.T_Items[ k ] or !pan.T_Slots[ k ] then continue end
				if pan.T_Items[ k ] == "_" and v != "_" then pan.N_Num = pan.N_Num +1
				elseif pan.T_Items[ k ] != "_" and v == "_" then pan.N_Num = pan.N_Num -1 end
				pan.T_Items[ k ] = v  pan.T_Slots[ k ]:F_SetupItem( v )
			end
		elseif id == 2 then if !istable( dt ) or #dt < 1 then return end local str = dt[ 1 ]
			local aa, bb = xdefm_ItemGet( str )
			if istable( aa ) and istable( bb ) and bb.Type == "Struct" then
				pan.S_Struct = str  local stp, pax = bb.SType, pan.P_Base  pan.N_SType = stp
				if stp == 1 then table.remove( dt, 1 )  pan.T_Slots = {}  pan.N_Max = 0  pan.N_Num = 0  pan.T_Items = {}
					for k, v in pairs( dt ) do
						local slo = xdefm_SlotBox( 0, 0, 94, 94, k, tostring( k ) )  pax.P_Hold:Add( slo )
						pan.T_Slots[ k ] = slo  slo.S_Type = "Storage"  slo:F_SetupItem( v )  pan.N_Max = pan.N_Max +1
						if v != "_" then pan.N_Num = pan.N_Num +1 end  pan.T_Items[ k ] = v
						function slo:DoRightClick( Pnl ) if slo.T_Item == nil or slo:IsDragging() or !IsValid( xdefm.miscs.Menus[ "Inventory" ] ) then return end
							if IsValid( pan.P_DMenu ) then pan.P_DMenu:Remove() end pan.P_DMenu = DermaMenu( false, nil )  local dnm = pan.P_DMenu
							local O_Take = dnm:AddOption( "#xdefm.Take", function() if !slo.B_OnMove and IsValid( xdefm.miscs.Menus[ "Inventory" ] ) then
							local num = 0  for k, v in pairs( LocalPlayer().xdefm_Profile.Items ) do
								if isstring( v ) and v == "_" then num = k break end
							end if num > 0 then xdefm_Command( LocalPlayer(), "Struct", num.."|"..k )
							else xdefm_AddNote( ply, "xdefm.FullInv", "resource/warning.wav", "cross", 5 ) end end end )
							O_Take:SetIcon( "icon16/basket_put.png" ) dnm:Open()
						end
					end
				elseif stp == 2 then pan.N_Num = 0
					local function xdefm_AddCraft( tab ) pan.N_Num = pan.N_Num +1
					local cc = string.Explode( "&", tab ) if !istable( cc ) or #cc < 2 then return end
					local slo = vgui.Create( "DButton", pax.P_Hold ) slo:SetSize( 50, 80 ) slo:Dock( TOP ) slo:SetText( "" ) slo:SetCursor( "blank" )
					local aa, bb = xdefm_ItemGet( cc[ #cc ] ) if !istable( aa ) or !istable( bb ) then slo:Remove() return end
					local col = xdefm.miscs.Rarity[ bb.Rarity +1 ]  local icc = xdefm.miscs.Icons[ bb.Type ]  slo.S_Item = cc[ #cc ]
					slo.B_Hover = false  slo.N_Num = pan.N_Num  slo.N_Clk = 0  slo.N_Lerp = 0 if icc != nil then
					pax.P_Sprite = vgui.Create( "DPanel", slo ) local spr = pax.P_Sprite  
					spr:SetPos( 79, 23 ) spr:SetSize( 16, 16 ) spr:SetMouseInputEnabled( false )
					function spr:Paint( w, h ) surface.SetMaterial( icc )
						surface.SetDrawColor( Color( 255, 255, 255, 255 ) ) surface.DrawTexturedRect( 0, 0, w, h )
					end end slo.T_Craft = cc function slo:Paint( w, h )
					local coc = ( slo.B_Hover and 0.4 or 0.2 ) local co2 = Color( col.r*coc, col.g*coc, col.b*coc )
					slo.N_Lerp = Lerp( 0.1, slo.N_Lerp, ( slo.N_Clk <= CurTime() and slo.B_Hover ) and 0 or 1 )
					local co3 = Color( col.r*coc*2, col.g*coc*2, col.b*coc*2, 55 +slo.N_Lerp*100 ) draw.RoundedBox( 0, 2 +3, 2, w -1 -8, h -2, co2 )
					surface.SetDrawColor( co3 ) surface.SetMaterial( MaR ) surface.DrawTexturedRect( 2 +5, 2, w -5 -8, h -2 -2 )
					surface.SetDrawColor( xdefm.ext_col )  surface.DrawOutlinedRect( 2 +3, 2, w -1 -8, h -2, 2 )
					surface.SetDrawColor( xdefm.lin_col )  surface.DrawOutlinedRect( 2 +3, 2, w -1 -8, h -2 )
					draw.TextShadow( { text = bb.Name, pos = { 102, 30 }, font = "xdefm_Font5",
					xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = col }, 1, 255 )
					draw.TextShadow( { text = language.GetPhrase( "xdefm.Materials" )..": "..tostring( #cc -1 ),
					pos = { 80, 60 }, font = "xdefm_Font1", xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
					draw.TextShadow( { text = "#"..slo.N_Num,
					pos = { 540, 40 }, font = "xdefm_Font4", xalign = TEXT_ALIGN_RIGHT, yalign = TEXT_ALIGN_CENTER, color = Color( 200, 200, 200 ) }, 1, 255 ) end
					function slo:OnCursorEntered() slo.B_Hover = true  xdefm.miscs.Craft = cc  pan.P_Select = slo  xdefm.miscs.AimPan = slo
					xdefm.miscs.Ings = {}  xdefm.miscs.Ing2 = {}  xdefm.miscs.Marker = slo.S_Item  xdefm.miscs.LC = true end
					function slo:OnCursorExited() slo.B_Hover = false  if xdefm.miscs.AimPan == slo then xdefm.miscs.AimPan = nil end
					if pan.P_Select == slo then xdefm.miscs.Marker = nil
					pan.P_Select = nil  xdefm.miscs.Marker = nil end end
					function slo:DoClick() if slo.N_Clk > CurTime() then return end slo.N_Clk = CurTime() +0.25
					xdefm_Command( LocalPlayer(), "Struct", tostring( slo.N_Num ) ) end
					local ico = xdefm_SlotBox( 13, 11, 60, 60, 1 ) slo:Add( ico ) ico:F_SetupItem( cc[ #cc ] )
					ico.P_Txt:Remove() ico:SetMouseInputEnabled( false )
					end for k, v in pairs( bb.Crafts ) do xdefm_AddCraft( v ) end
				elseif stp == 3 then pan.N_Num = 0  local MaX = Material( "gui/center_gradient" )
					for k, v in SortedPairsByMemberValue( bb.Shop, 1 ) do
						local Item = pax.P_Hold:Add( "DButton" ) Item:SetSize( 286, 75 ) Item.N_Clicked = 0  Item:SetCursor( "blank" )
						local aa, bb = xdefm_ItemGet( k ) if !istable( bb ) then Item:Remove() return end  Item.N_Lerp = 0.3  pan.N_Num = pan.N_Num +1
						Item.S_Name = bb.Name  Item.N_Rarity = bb.Rarity  Item.N_Cost = v[ 1 ]  Item.N_Level = v[ 2 ]
						function Item:OnCursorEntered() xdefm.miscs.AimPan = Item  xdefm.miscs.Marker = k  Item.B_OnMove = true  xdefm.miscs.LC = false end
						function Item:OnCursorExited() if xdefm.miscs.AimPan == Item then xdefm.miscs.AimPan = nil  xdefm.miscs.Marker = nil end Item.B_OnMove = false end
						function Item:DoClick() Item.N_Clicked = CurTime() +0.2  local yes, pro = true, LocalPlayer().xdefm_Profile
							if pro.Money < Item.N_Cost then xdefm_AddNote( ply, "xdefm.NoMoney", "resource/warning.wav", "cross", 5 ) yes = false end
							if pro.Level < Item.N_Level then xdefm_AddNote( ply, "xdefm.NoLevel", "resource/warning.wav", "cross", 5 ) yes = false end
							if yes then xdefm_Command( LocalPlayer(), "Struct", k ) end end
						function Item:OnRemove() Item:OnCursorExited() end
						function Item:Paint( w, h ) local col = xdefm.miscs.Rarity[ Item.N_Rarity+1 ]
							draw.RoundedBox( 0, 0, 0, w, h, col )  local pro = LocalPlayer().xdefm_Profile  if !istable( pro ) then return end
							Item.N_Lerp = Lerp( 0.2, Item.N_Lerp, Item.N_Clicked > CurTime() and 0.1 or ( xdefm.miscs.AimPan == Item and 0.5 or 0.3 ) )
							local ccc = Item.N_Lerp  draw.RoundedBox( 0, 1, 1, w -2, h -2, Color( col.r*ccc, col.g*ccc, col.b*ccc ) )
							surface.SetMaterial( MaX ) surface.SetDrawColor( col.r*ccc*1.5, col.g*ccc*1.5, col.b*ccc*1.5 ) surface.DrawTexturedRect( 1, 1, w -2, h -2 )
							local co1, co2 = Color( 255, 0, 0 ), Color( 0, 255, 0 )
							draw.TextShadow( {
								text = language.GetPhrase( Item.S_Name ), pos = { 75, 15 }, font = "xdefm_Font2",
								xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = col
							}, 1, 255 )
							draw.TextShadow( {
								text = language.GetPhrase( "xdefm.Price" )..": "..Item.N_Cost, pos = { 75, 35 }, font = "xdefm_Font2",
								xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = pro.Money >= Item.N_Cost and co2 or co1
							}, 1, 255 )
							draw.TextShadow( {
								text = language.GetPhrase( "xdefm.Level" )..": "..Item.N_Level, pos = { 75, 55 }, font = "xdefm_Font2",
								xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = pro.Level >= Item.N_Level and co2 or co1
							}, 1, 255 ) end
						Item.P_Frame = Item:Add( "DPanel" )  Item:SetText( "" )
						Item.P_Frame:SetSize( 64, 64 ) Item.P_Frame:SetPos( 6, 6 )
						Item.P_Frame:SetMouseInputEnabled( false )  function Item.P_Frame:Paint( w, h ) local col = xdefm.miscs.Rarity[ Item.N_Rarity+1 ]
							surface.SetDrawColor( Color( col.r*0.2, col.g*0.2, col.b*0.2 ) )  surface.DrawRect( 0, 0, w, h )
							surface.SetDrawColor( col )  surface.DrawOutlinedRect( 0, 0, w, h, 2 )
							surface.SetDrawColor( xdefm.lin_col )  surface.DrawOutlinedRect( 0, 0, w, h, 1 ) end
						Item.P_Icon = Item.P_Frame:Add( "ModelImage" ) Item.P_Icon:DockMargin( 5, 5, 5, 5 )
						Item.P_Icon:Dock( FILL ) Item.P_Icon:SetModel( bb.Model[ 1 ] ) Item.P_Icon:SetMouseInputEnabled( false )
					end
				end
			end
		end
	end
	pan:XDEFM_Update( 2, tab )
elseif typ == 5 then -- 银行
	if IsValid( xdefm.miscs.Menus[ "Bank" ] ) then return end
	local pan = vgui.Create( "DFrame" )  xdefm.miscs.Menus.Bank = pan  pan.T_Data = tab  pan.T_Slots = {}  pan.N_Store = 0
	pan:SetPos( ScrW()/2 -40, ScrH()/2 -550/2 ) pan:SetSize( 800, 600 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:ParentToHUD() pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW()/2 -40, ScrH()/2 -500/2, 0.2 )
	function pan:Paint( w, h ) local tab = pan.T_Data  local pro = LocalPlayer().xdefm_Profile
		surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 0 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 180 )
		surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.TextShadow( {
			text = language.GetPhrase( "xdefm.Bank" ).." ( "..pan.N_Store.." / "..pro.UpdF.." )", pos = { w/2, 25 }, font = "xdefm_Font6",
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 )
		}, 1, 255 ) end
	if true then -- 关闭按钮
		pan.P_Close = pan:Add( "DButton" )  local pax = pan.P_Close
		pax:SetText( "" ) pax:SetPos( 760, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint( w, h ) draw.TextShadow( {
				text = "×", pos = { w/2, h/2 }, font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER,
				color = ( pax.B_Hover and Color( 255, 0, 0 ) or Color( 255, 255, 255 ) )
		}, 2, 255 ) end function pax:DoClick() pan:Close() end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end --
	if true then -- 内容
		local bck = pan:Add( "DPanel" ) bck:SetSize( 784, 541 ) bck:SetPos( 8, 50 )
		pan.P_Scroll = pan:Add( "DScrollPanel" )
		pan.P_Scroll:SetSize( 784, 534 ) pan.P_Scroll:SetPos( 9, 53 )  pan.N_Sto = 0
		local vba = pan.P_Scroll:GetVBar()  vba:SetHideButtons( true )  vba:SetSize( 0, 0 )
		function vba.btnGrip:Paint( w, h ) end function vba:Paint( w, h ) end
		function pan.P_Scroll:Paint( w, h ) end
		function bck:Paint( w, h )
			surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, h )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h )
		end pan.P_Hold = pan.P_Scroll:Add( "DIconLayout" )  local pa2 = pan.P_Hold  pa2:SetSize( 784, 0 )
		pa2:DockMargin( 4, 4, 4, 4 ) pa2:SetSpaceX( 3 ) pa2:SetSpaceY( 3 ) pa2:SetPos( 4, 2 ) function pa2:Paint( w, h ) end end
	function pan:XDEFM_Update( id, dt ) if id == 0 then local pro = dt  pan.N_Store = 0
			for k, v in pairs( pan.T_Slots ) do
				if IsValid( v ) and k > pro.UpdF then v:Remove() pan.T_Slots[ k ] = nil end
			end if pro.UpdF <= 0 then pan.T_Slots = {} return end
			for i=1, pro.UpdF do local ite = pro.Bnk[ i ]  if !isstring( ite ) then continue end
				local slo = nil  if IsValid( pan.T_Slots[ i ] ) then slo = pan.T_Slots[ i ] else
					slo = xdefm_SlotBox( 0, 0, 108, 108, i, tostring( i ) )  pan.P_Hold:Add( slo )
					pan.T_Slots[ i ] = slo  slo.S_Type = "Bank"
				end slo:F_SetupItem( ite )  if ite != "_" then pan.N_Store = pan.N_Store + 1 end
				function slo:DoRightClick( Pnl ) if slo.T_Item == nil or slo:IsDragging() or !IsValid( xdefm.miscs.Menus[ "Inventory" ] ) then return end
					if IsValid( pan.P_DMenu ) then pan.P_DMenu:Remove() end pan.P_DMenu = DermaMenu( false, nil )  local dnm = pan.P_DMenu
					local O_Take = dnm:AddOption( "#xdefm.Take", function() if !slo.B_OnMove and IsValid( xdefm.miscs.Menus[ "Inventory" ] ) then
					local num = 0  for k, v in pairs( LocalPlayer().xdefm_Profile.Items ) do
						if isstring( v ) and v == "_" then num = k break end
					end if num > 0 then xdefm_Command( LocalPlayer(), "MoveBank", num.."|"..i )
					else xdefm_AddNote( ply, "xdefm.FullInv", "resource/warning.wav", "cross", 5 ) end end end )
					O_Take:SetIcon( "icon16/basket_put.png" ) dnm:Open()
				end
			end
		end
	end pan:XDEFM_Update( 0, LocalPlayer().xdefm_Profile )
elseif typ == 6 then -- 好友列表
	if IsValid( xdefm.miscs.Menus[ "Friends" ] ) then return end
	local pan = vgui.Create( "DFrame" )  xdefm.miscs.Menus.Friends = pan  pan.T_Data = tab  pan.N_Count = 0  pan.B_Edited = false
	pan:SetPos( ScrW()/2 -200, ScrH()/2 -550/2 ) pan:SetSize( 400, 550 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:ParentToHUD() pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW()/2 -200, ScrH()/2 -500/2, 0.2 ) pan.N_Clicked = 0
	function pan:Paint( w, h ) local tab = pan.T_Data
		surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 0 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 180 )
		surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.TextShadow( {
			text = language.GetPhrase( "xdefm.FList" ), font = "xdefm_Font6", pos = { w/2, 24 },
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 )
		}, 1, 255 )
		draw.RoundedBox( 0, 8 +0, 50 +0, 382, 420, xdefm.lin_col )
		draw.RoundedBox( 0, 8 +1, 50 +1, 382 -2, 420 -2, xdefm.ext_col )
		draw.RoundedBox( 0, 8 +2, 50 +2, 382 -4, 420 -4, xdefm.bck_col )
		draw.RoundedBox( 0, 8 +0, 474 +0, 382, 30, xdefm.lin_col )
		draw.RoundedBox( 0, 8 +1, 474 +1, 382 -2, 30 -2, xdefm.ext_col )
		draw.RoundedBox( 0, 8 +2, 474 +2, 382 -4, 30 -4, xdefm.bck_col ) end
	if true then -- 关闭按钮
		pan.P_Close = pan:Add( "DButton" )  local pax = pan.P_Close
		pax:SetText( "" ) pax:SetPos( 360, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint( w, h ) draw.TextShadow( {
				text = "×", pos = { w/2, h/2 }, font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER,
				color = ( pax.B_Hover and Color( 255, 0, 0 ) or Color( 255, 255, 255 ) )
		}, 2, 255 ) end function pax:DoClick() pan:Close() end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end --
	if true then -- 列表
		pan.P_List = vgui.Create( "DListView", pan )
		pan.P_List:SetPos( 11, 53 ) pan.P_List:SetSize( 376, 414 )
		pan.P_List:SetMultiSelect( false )
		local p1 = pan.P_List:AddColumn( language.GetPhrase( "xdefm.Player" ) )
		local p2 = pan.P_List:AddColumn( language.GetPhrase( "xdefm.Friend" ) )
		p1:SetWidth( 180 )
		function pan.P_List:RefreshPlayerS() pan.P_List:Clear()
			for k, v in pairs( pan.T_Data ) do if !isnumber( tonumber( v[ 2 ] ) ) then return end
				local aa, cc, dd, nn = false, tonumber( v[ 2 ] ), player.GetBySteamID( k ), k
				if IsValid( dd ) and dd:IsPlayer() then nn = dd:Nick() else nn = v[ 1 ] end
				local ee = ( cc > 0 and language.GetPhrase( "xdefm.Allow" ) or language.GetPhrase( "xdefm.Disallow" ) )
				local pnl = pan.P_List:AddLine( nn, ee )  pnl.N_RightStat = cc  pnl.S_SteamID = k  pnl.S_Name = nn
				pnl:SetToolTip( k )  pan.N_Count = pan.N_Count +1
			end
		end
		function pan.P_List:OnRowSelected( id, pnl ) local stt = pnl.N_RightStat  pan.P_List:ClearSelection()
			if IsValid( pan.P_DMenu ) then pan.P_DMenu:Remove() end pan.P_DMenu = DermaMenu( false, nil )  local dnm = pan.P_DMenu
			local aa = stt > 0 and true or false
			local O_ = dnm:AddOption( pnl.S_Name, function() xdefm_AddNote( ply, "xdefm.CopiedID", "weapons/pistol/pistol_empty.wav", "tick", 5 )
			SetClipboardText( pnl:GetTooltip() ) end )
			local O_aa = dnm:AddOption( language.GetPhrase( aa and "xdefm.Disallow" or "xdefm.Allow" ).." "..language.GetPhrase( "xdefm.Friend" ), function()
				if !IsValid( pan ) or !istable( pan.T_Data ) then return end
				if !IsValid( pnl ) or !istable( pan.T_Data[ pnl.S_SteamID ] ) or !isnumber( pnl.N_RightStat ) then return end local stt = math.Clamp( math.Round( pnl.N_RightStat ), 0, 1 )
				if aa then if stt > 0 then pnl.N_RightStat = 0 end else if stt == 0 then pnl.N_RightStat = 1 end end
				pnl:SetColumnText( 2, language.GetPhrase( aa and "xdefm.Disallow" or "xdefm.Allow" ) )  pan.B_Edited = true
				pan.T_Data[ pnl.S_SteamID ][ 2 ] = pnl.N_RightStat
			end )
			O_aa:SetIcon( aa and "icon16/cross.png" or "icon16/tick.png" )
			local O_cc = dnm:AddOption( language.GetPhrase( "xdefm.Delete" ), function()
				if !IsValid( pan ) or !istable( pan.T_Data ) then return end
				if !IsValid( pnl ) or !istable( pan.T_Data[ pnl.S_SteamID ] ) or !isnumber( pnl.N_RightStat ) then return end
				pan.T_Data[ pnl.S_SteamID ] = nil  pan.P_List:RemoveLine( id ) pan.B_Edited = true
			end )
			O_cc:SetIcon( "icon16/group_delete.png" ) dnm:Open()
		end
		pan.P_List:RefreshPlayerS() end
	if true then -- 添加
		pan.P_Entry = vgui.Create( "DTextEntry", pan )
		pan.P_Entry:SetSize( 376, 24 ) pan.P_Entry:SetPos( 11, 477 )
		pan.P_Entry:SetUpdateOnType( true ) pan.P_Entry:SetNumeric( false ) pan.P_Entry:SetMultiline( false )
		pan.P_Entry:SetTextColor( Color( 0, 0, 0 ) ) pan.P_Entry.S_Enter = ""
		pan.P_Entry:SetPlaceholderText( "#xdefm.FriendAdd" )
		function pan.P_Entry:FindTheFriend() local ply, str = nil, pan.P_Entry.S_Enter
			if pan.N_Count >= 16 then xdefm_AddNote( ply, "xdefm.FriendAd5", "resource/warning.wav", "cross", 5 ) return end
			if str == "" then xdefm_AddNote( ply, "xdefm.FriendAd3", "resource/warning.wav", "cross", 5 ) return end
			for k, v in pairs( player.GetAll() ) do if !IsValid( v ) or v:IsBot() or v == LocalPlayer() or istable( pan.T_Data[ v:SteamID() ] ) then continue end
				if v:SteamID() == str then ply = v break end
				local st, ed = string.find( string.lower( v:Nick() ), string.lower( str ) )
				if st then ply = v break end
			end if !IsValid( ply ) then xdefm_AddNote( ply, "xdefm.FriendAd3", "resource/warning.wav", "cross", 5 ) return end
			local pnl = pan.P_List:AddLine( ply:Nick(), language.GetPhrase( "xdefm.Disallow" ), language.GetPhrase( "xdefm.Disallow" ) )  pnl.N_RightStat = 0
			pnl.S_SteamID = ply:SteamID()  pnl.S_Name = ply:Nick()  pnl:SetToolTip( ply:SteamID() )
			xdefm_AddNote( ply, language.GetPhrase( "xdefm.FriendAd4" )..": "..ply:Nick(), "buttons/button15.wav", "group_add", 5 ) pnl.S_SteamID = ply:SteamID()
			pan.N_Count = pan.N_Count +1  pan.T_Data[ ply:SteamID() ] = { ply:Nick(), 0 }
			pan.P_Entry.S_Enter = ""  pan.P_Entry:SetText( "" )  pan.B_Edited = true
		end
		function pan.P_Entry:OnEnter() pan.P_Entry.FindTheFriend() end
		function pan.P_Entry:OnValueChange( val ) if string.len( val ) >= 64 then
			pan.P_Entry:SetText( pan.P_Entry.S_Enter ) surface.PlaySound( "resource/warning.wav" )
			else pan.P_Entry.S_Enter = val end
		end
		pan.P_Search = vgui.Create( "DImageButton", pan.P_Entry ) local pax = pan.P_Search
		pax:SetImage( "icon16/add.png" ) pax:SetToolTip( "#xdefm.FriendAd2" )
		pax:SetPos( 356, 4 ) pax:SetSize( 16, 16 ) end function pan.P_Search:DoClick() pan.P_Entry.FindTheFriend() end
	for i=1, 2 do -- 重置/确认
		local but = vgui.Create( "DButton", pan )  but:SetText( "" )  but.B_Hover = false  but.N_Lerp = 0
		but:SetSize( 120, 30 )  but:SetPos( -100 +i*160, 510 ) but:SetIcon( i == 1 and "icon16/group_go.png" or "icon16/group_edit.png" )
		function but:Paint( w, h ) local col = Color( 100, 100, 100 )
			but.N_Lerp = Lerp( 0.2, but.N_Lerp, pan.N_Clicked > CurTime() and -1 or ( but.B_Hover and 1 or 0 ) )
			if pan.B_Edited then col = Color( 155, 0, 0 ) end
			col = Color( col.r +col.r*0.5*but.N_Lerp, col.g +col.g*0.5*but.N_Lerp, col.b +col.b*0.5*but.N_Lerp )
			surface.SetDrawColor( col ) surface.DrawRect( 0, 0, w, h )
			draw.TextShadow( { text = i == 1 and "#xdefm.Reset" or "#xdefm.Apply", pos = { w/2, h/2 }, font = "xdefm_Font1",
			color = Color( 255, 255, 255 ), xalign = TEXT_ALIGN_CENTER, yalign =  TEXT_ALIGN_CENTER }, 1, 200 )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		end
		function but:OnCursorEntered() but.B_Hover = true end
		function but:OnCursorExited() but.B_Hover = false end
		function but:DoClick() if pan.N_Clicked > CurTime() then return end
			pan.N_Clicked = CurTime() +1  pan.B_Edited = false  local str = util.TableToJSON( pan.T_Data, true )
			net.Start( "NET_xdefm_SendFriends" ) if i == 2 then net.WriteString( str ) end net.SendToServer()
		end
	end
	function pan:XDEFM_Update( id, dt ) if id == 2 then pan.T_Data = dt  pan.P_List:RefreshPlayerS() end end
elseif typ == 7 then -- 交易
	if IsValid( xdefm.miscs.Menus[ "Trade" ] ) then return end
	local pan = vgui.Create( "DFrame" )  xdefm.miscs.Menus.Trade = pan
	pan.T_PlyA = { LocalPlayer():Nick(), LocalPlayer():SteamID64(), LocalPlayer():GetNWFloat( "XDEFMod_RTT" ) }
	pan.T_PlyB = { "_", nil, false }  pan.T_Slo1 = {}  pan.T_Slo2 = {}
	pan.T_TabA = tab  pan.T_TabB = { "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", 0 }
	pan:SetPos( ScrW()/2 -40, ScrH()/2 -750/2 ) pan:SetSize( 500, 685 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:ParentToHUD() pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW()/2 -40, ScrH()/2 -700/2, 0.2 )
	if true then -- 关闭按钮
		pan.P_Close = pan:Add( "DButton" )  local pax = pan.P_Close
		pax:SetText( "" ) pax:SetPos( 455, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint( w, h ) draw.TextShadow( {
				text = "×", pos = { w/2, h/2 }, font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER,
				color = ( pax.B_Hover and Color( 255, 0, 0 ) or Color( 255, 255, 255 ) )
		}, 2, 255 ) end function pax:DoClick() pan:Close() end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end --
	function pan:Paint( w, h ) local tab = pan.T_Data  local pro = LocalPlayer().xdefm_Profile
		surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 0 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 180 )
		surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.TextShadow( {
			text = language.GetPhrase( "xdefm.Weapon_Trade" ), pos = { w/2, 25 }, font = "xdefm_Font6",
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 )
		}, 1, 255 ) end
	for i=1, 2 do -- 已方对方
		local pax = vgui.Create( "DPanel", pan ) pax:SetPos( 8, 50 +(i-1)*315 ) pax:SetSize( 484, 310 ) pax.N_Clicked = 0
		function pax:Paint( w, h ) local bb = ( i == 1 and true or false )
			local tab = ( i == 1 and pan.T_PlyA or pan.T_PlyB )  local ta2 = ( i == 1 and pan.T_TabA or pan.T_TabB )
			surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, h )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h )
			draw.TextShadow( {
				text = tab[ 1 ], pos = { 80, 24 }, font = "xdefm_Font4",
				xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 )
			}, 1, 255 )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 10, 77, 464, 188, 2 )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 10, 77, 464, 188, 1 )
			draw.TextShadow( {
				text = language.GetPhrase( "xdefm.Money" )..": ", pos = { 8, 285 }, font = "xdefm_Font1",
				xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 )
			}, 1, 255 )
			if IsValid( pax.P_Entry ) and i != 2 then
				local col = ( pax.P_Entry:IsEditing() and Color( 150, 150, 150 ) or Color( 75, 75, 75 ) )
				if !pax.P_Entry:IsEditing() and ta2[ 11 ] != pax.P_Entry.N_Enter then col = Color( 150, 25, 25 ) end
				surface.SetDrawColor( Color( xdefm.bck_col.r*0.5, xdefm.bck_col.g*0.5, xdefm.bck_col.b*0.5, xdefm.bck_col.a*0.5 ) ) surface.DrawRect( 80, 272, 215 +6, 30 )
				surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 80, 272, 215 +6, 30, 2 )
				surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 80, 272, 215 +6, 30 )
			end
		end
		if true then -- 交易确认
			local but = vgui.Create( "DButton", pax )  but:SetText( "" )  but.B_Hover = false
			but:SetSize( 150, 25 )  but:SetPos( 84, 42 )
			function but:Paint( w, h ) local col, ply = Color( 100, 100, 100 ), LocalPlayer()
				if !ply:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() or ply:GetNWEntity( "XDEFMod_TPL" ):GetNWEntity( "XDEFMod_TPL" ) != ply then return end
				local rd = false  if i == 1 then rd = ( LocalPlayer():GetNWFloat( "XDEFMod_RTT" ) == 1 )
				elseif i == 2 then rd = ( pan.T_PlyB[ 3 ] == 1 ) end
				col = ( rd and Color( 55, 155, 55 ) or Color( 155, 55, 55 ) )
				if pax.N_Clicked <= CurTime() and but.B_Hover then col = Color( col.r*1.5, col.g*1.5, col.b*1.5 ) end
				if pax.N_Clicked > CurTime() then col = Color( col.r*0.25, col.g*0.25, col.b*0.25 ) end
				surface.SetDrawColor( col ) surface.DrawRect( 0, 0, w, h )
				draw.TextShadow( { text = rd and "#xdefm.ReadyY" or "#xdefm.ReadyN", pos = { w/2, h/2 -2 }, font = "xdefm_Font1",
				color = Color( 255, 255, 255 ), xalign = TEXT_ALIGN_CENTER, yalign =  TEXT_ALIGN_CENTER }, 1, 200 )
				if i == 1 then surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
				surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 ) end
			end if i == 2 then but:SetMouseInputEnabled( false ) end if i == 1 then pan.P_ButA = but else pan.P_ButB = but end
			function but:OnCursorEntered() but.B_Hover = true end function but:OnCursorExited() but.B_Hover = false end
			function but:DoClick() if pax.N_Clicked > CurTime() then return end
				pax.N_Clicked = CurTime() +1  xdefm_Command( LocalPlayer(), "TradeToggle", "_" ) 
			end end
		if true then -- 钱数
			pax.P_Entry = vgui.Create( "DTextEntry", pax ) 
			pax.P_Entry:SetSize( 215, 24 )
			pax.P_Entry:SetPos( 85, 275 )
			pax.P_Entry:SetUpdateOnType( true )
			pax.P_Entry:SetNumeric( true )
			pax.P_Entry:SetMultiline( false )
			pax.P_Entry:SetCursorColor( Color( 255, 255, 255 ) )
			pax.P_Entry:SetFont( "xdefm_Font5" )
			pax.P_Entry:SetPaintBackground( false )
			pax.P_Entry:SetTextColor( Color( 255, 255, 255 ) )
			local tab = ( i == 1 and pan.T_TabA or pan.T_TabB )
			pax.P_Entry.N_Enter = tab[ 11 ]
			pax.P_Entry:SetText( tostring( pax.P_Entry.N_Enter ) )
			pax.P_Entry:SetPlaceholderText( "#xdefm.PutMoney" )
			pax.P_Entry:SetToolTip( tab[ 11 ] )
			function pax.P_Entry:OnEnter() xdefm_Command( LocalPlayer(), "TradeMoney", tostring( pax.P_Entry.N_Enter ) ) end
			function pax.P_Entry:OnValueChange( val ) local tum, vat, fce = tonumber( val ), 0, false  if val != "" and ( !isnumber( tum ) or string.len( val ) >= 64 or tum < 0 or tum > 2147483647 ) then
				if isnumber( tum ) and tum > 2147483647 then vat = 2147483647  fce = true elseif isnumber( tum ) and tum < 0 then vat = 0  fce = true else vat = pax.P_Entry.N_Enter
				pax.P_Entry:SetText( tostring( pax.P_Entry.N_Enter ) ) end surface.PlaySound( "resource/warning.wav" )
				else vat = tum  if val == "" then vat = 0  fce = true end end if pax.P_Entry.N_Enter != vat then pax.P_Entry.N_Enter = vat end
				if fce then pax.P_Entry:SetText( tostring( pax.P_Entry.N_Enter ) ) end
			end if i == 2 then pax.P_Entry:SetEnabled( false )  pax.P_Entry:SetMouseInputEnabled( false ) else
				pax.P_Confirm = vgui.Create( "DImageButton", pax.P_Entry ) local pa2 = pax.P_Confirm
				pa2:SetImage( "icon16/cog.png" ) pa2:SetToolTip( "#xdefm.PutMone2" )
				pa2:SetPos( 173, 4 ) pa2:SetSize( 16, 16 ) function pa2:DoClick() xdefm_Command( LocalPlayer(), "TradeMoney", tostring( pax.P_Entry.N_Enter ) ) end
				pax.P_Take = vgui.Create( "DImageButton", pax.P_Entry ) local pa3 = pax.P_Take
				pa3:SetImage( "icon16/coins.png" ) pa3:SetToolTip( "#xdefm.PutMone3" )
				pa3:SetPos( 193, 4 ) pa3:SetSize( 16, 16 ) function pa3:DoClick() xdefm_Command( LocalPlayer(), "TradeMoney", "0" ) end
			end end
		if true then -- 头像
			pax.P_AIcon = pax:Add( "AvatarImage" )  local pa2 = pax.P_AIcon
			pa2:SetPos( 8, 8 ) pa2:SetSize( 64, 64 ) pa2:SetMouseInputEnabled( false )
			pax.P_AFrame = pax:Add( "DPanel" )  pa2 = pax.P_AFrame
			local tab = ( i == 1 and pan.T_PlyA or pan.T_PlyB )
			if tab[ 2 ] != nil then pax.P_AIcon:SetSteamID( tab[ 2 ], 128 ) end
			pa2:SetText( "" ) pa2:SetPos( 8, 8 ) pa2:SetSize( 64, 64 ) pa2:SetMouseInputEnabled( false )
			function pa2:Paint( w, h ) surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 ) end end
		if true then -- 物品框架
			pax.P_Hold = pax:Add( "DIconLayout" )  pax.P_Hold:SetPos( 13, 80 ) pax.P_Hold:SetSize( 484-16, 180 )
			pax.P_Hold:SetSpaceX( 2 ) pax.P_Hold:SetSpaceY( 2 ) local tab = nil
			if i == 1 then tab = pan.T_Slo1 else tab = pan.T_Slo2 end
			for x = 1, 10 do local slo = xdefm_SlotBox( 0, 0, 90, 90, x, tostring( x ), nil, ( i == 2 and true or false ) )
			if i == 1 then slo.S_Type = "Trade"
				function slo:DoRightClick( Pnl ) if slo.T_Item == nil or slo:IsDragging() or !IsValid( xdefm.miscs.Menus[ "Inventory" ] ) then return end
					if IsValid( pan.P_DMenu ) then pan.P_DMenu:Remove() end pan.P_DMenu = DermaMenu( false, nil )  local dnm = pan.P_DMenu
					local O_Take = dnm:AddOption( "#xdefm.Take", function() if !slo.B_OnMove and IsValid( xdefm.miscs.Menus[ "Inventory" ] ) then
					local num = 0  for k, v in pairs( LocalPlayer().xdefm_Profile.Items ) do
						if isstring( v ) and v == "_" then num = k break end
					end if num > 0 then xdefm_Command( LocalPlayer(), "MoveTrade", num.."|"..x )
					else xdefm_AddNote( ply, "xdefm.FullInv", "resource/warning.wav", "cross", 5 ) end end end )
					O_Take:SetIcon( "icon16/basket_remove.png" ) dnm:Open()
				end
			end pax.P_Hold:Add( slo ) table.insert( tab, slo ) end end
		if i == 1 then pan.P_PanA = pax else pan.P_PanB = pax end end
	if true then -- 无交易对象时遮住下头
		pan.P_NoTrade = vgui.Create( "DPanel", pan ) pan.P_NoTrade:SetPos( 8, 365 ) pan.P_NoTrade:SetSize( 484, 310 )
		function pan.P_NoTrade:Paint( w, h )
			surface.SetDrawColor( Color( xdefm.bck_col.r*0.5, xdefm.bck_col.g*0.5, xdefm.bck_col.b*0.5, 255 ) ) surface.DrawRect( 0, 0, w, h )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h )
			draw.TextShadow( {
				text = language.GetPhrase( "xdefm.Trade17" ), pos = { w/2, h/2 }, font = "xdefm_Font6",
				xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 )
			}, 1, 255 )
		end end
	pan.P_NoTrade:SetMouseInputEnabled( true ) pan.P_NoTrade:SetAlpha( 255 )
	pan.P_PanB:SetMouseInputEnabled( false ) pan.P_PanB:SetAlpha( 0 )
	function pan:XDEFM_Update( id, dt )
		if id == 4 then pan.T_TabA = dt  for i=1, 10 do pan.T_Slo1[ i ]:F_SetupItem( dt[ i ] ) end
			pan.P_PanA.P_Entry.N_Enter = dt[ 11 ]  pan.P_PanA.P_Entry:SetText( tostring( dt[ 11 ] ) ) pan.P_PanA.P_Entry:SetToolTip( dt[ 11 ] )
		end
		if id == 5 then pan.T_TabB = dt  for i=1, 10 do pan.T_Slo2[ i ]:F_SetupItem( dt[ i ] ) end
			pan.P_PanB.P_Entry.N_Enter = dt[ 11 ]  pan.P_PanB.P_Entry:SetText( tostring( dt[ 11 ] ) ) pan.P_PanB.P_Entry:SetToolTip( dt[ 11 ] )
		end
		if id == 6 then pan.T_PlyB = dt  local sid = dt[ 2 ]
			if sid != nil then
				pan.P_NoTrade:SetMouseInputEnabled( false ) pan.P_NoTrade:SetAlpha( 0 )
				pan.P_PanB:SetMouseInputEnabled( true ) pan.P_PanB:SetAlpha( 255 )
				pan.P_PanB.P_AIcon:SetSteamID( sid, 128 )
			else pan.P_NoTrade:SetMouseInputEnabled( true ) pan.P_NoTrade:SetAlpha( 255 )
			pan.P_PanB:SetMouseInputEnabled( false ) pan.P_PanB:SetAlpha( 0 ) end
		end
	end pan:XDEFM_Update( 4, tab )
elseif typ == 8 then -- 图鉴
	if IsValid( xdefm.miscs.Menus[ "Bestiary" ] ) then return end
	local pan = vgui.Create( "DFrame" )  xdefm.miscs.Menus.Bestiary = pan  pan.T_Items = {}  pan.N_Total = 0  pan.N_All = 0
	for k, v in pairs( xdefm.items ) do pan.N_All = pan.N_All +1 end pan.N_Bing = -1
	pan.T_Typs = { ["Creature"] = true, ["Bait"] = true, ["Useless"] = true, ["Recipe"] = true, ["Struct"] = true }
	pan.T_Rars = { true, true, true, true, true }  pan.T_Buts = {}  pan.T_But2 = {}  pan.T_Dats = { PagO = 0, PagT = 0, Num = 0 }
	local Typs = { "Creature", "Bait", "Useless", "Recipe", "Struct" }
	local cvar = string.Explode( "", GetConVar( "xdefmod_collection" ):GetString() )
	if !istable( cvar ) or #cvar != 11 then RunConsoleCommand( "xdefmod_collection", "11111111111" )
	else
		for k, v in pairs( cvar ) do
			v = tonumber( v )  if !isnumber( v ) then continue end
			if k <= 5 then pan.T_Typs[ Typs[ k ] ] = ( v != 0 )
			elseif k != 11 then pan.T_Rars[ k-5 ] = ( v != 0 )
			else pan.T_Dats.PagO = v end
		end
	end
	if istable( xdefm.besti ) then for k, v in pairs( xdefm.besti ) do if xdefm.items[ k ] then table.insert( pan.T_Items, k ) pan.N_Total = pan.N_Total +1 end end end
	pan:SetPos( ScrW()/2 -750/2, ScrH()/2 -700/2 ) pan:SetSize( 750, 700 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:ParentToHUD() pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW()/2 -750/2, ScrH()/2 -750/2, 0.2 ) pan.B_Hover = false
	if ply:IsSuperAdmin() then pan:SetIcon( "icon16/shield.png" ) end
	local Ma2 = Material( "vgui/gradient_up" )
	if true then -- 关闭按钮
		pan.P_Close = pan:Add( "DButton" )  local pax = pan.P_Close
		pax:SetText( "" ) pax:SetPos( 710, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint( w, h ) draw.TextShadow( {
				text = "×", pos = { w/2, h/2 }, font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER,
				color = ( pax.B_Hover and Color( 255, 0, 0 ) or Color( 255, 255, 255 ) )
		}, 2, 255 ) end function pax:DoClick() pan:Close() end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end --
	function pan:Paint( w, h ) local pro = LocalPlayer().xdefm_Profile
		surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 0 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 180 )
		surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.RoundedBox( 0, 24 +0, 45 +0, -52 +w, 80, xdefm.lin_col )
		draw.RoundedBox( 0, 24 +1, 45 +1, -52 +w -2, 80 -2, xdefm.ext_col )
		draw.RoundedBox( 0, 24 +2, 45 +2, -52 +w -4, 80 -4, xdefm.bck_col )
		local per = math.Clamp( pan.N_Total/pan.N_All, 0, 1 )
		local col = Color( 0, 155, 200 ) if per >= 1 then col = Color( 200, 155, 0 ) end
		draw.RoundedBox( 0, 8 +0, 650 +0, -16 +w, 40, xdefm.lin_col )
		draw.RoundedBox( 0, 8 +1, 650 +1, -16 +w -2, 40 -2, xdefm.ext_col )
		draw.RoundedBox( 0, 8 +2, 650 +2, -16 +w -4, 40 -4, xdefm.bck_col )
		draw.RoundedBox( 0, 8 +4, 650 +4, ( w-24 )*per, 40 -8, col )
		pan.N_Bing = Lerp( 0.05, pan.N_Bing, pan.B_Hover and 0.25 or 0 )
		draw.RoundedBox( 0, 8 +4, 650 +4, ( w-24 )*per, 40 -8, Color( 255, 255, 255, 255*pan.N_Bing ) )
		surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 7, 163, w -14, h -277, 2 )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 7, 163, w -14, h -277, 1 )
		if !pan.B_Hover then local ppp = math.Round( per, 4 )*100
			draw.TextShadow( { text = language.GetPhrase( "xdefm.Progress" )..": "..ppp.."%", pos = { w/2, 670 },
			font = "xdefm_Font4", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		else draw.TextShadow( { text = language.GetPhrase( "xdefm.Progress" )..": "..pan.N_Total.."/"..pan.N_All, pos = { w/2, 670 },
			font = "xdefm_Font4", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		end draw.TextShadow( {
			text = language.GetPhrase( "xdefm.Collection" ), pos = { w/2, 25 }, font = "xdefm_Font6",
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		draw.TextShadow( { text = language.GetPhrase( "xdefm.Total" )..": "..pan.T_Dats.Num, pos = { 150 +w/2, 145 },
		font = "xdefm_Font5", xalign = TEXT_ALIGN_CENTER,
		yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		if pan.T_Dats.PagT > 0 then
			draw.TextShadow( { text = language.GetPhrase( "xdefm.Page" )..": "..pan.T_Dats.PagO.."/"..pan.T_Dats.PagT, pos = { -150 +w/2, 145 },
			font = "xdefm_Font5", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		else draw.TextShadow( { text = language.GetPhrase( "xdefm.Page" )..": 0", pos = { -150 +w/2, 145 },
			font = "xdefm_Font5", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		end end
	local function AddTickButton( x, y, typ ) if !isstring( typ ) then typ = "Useless" end
		local but = pan:Add( "DButton" ) but:SetPos( x, y ) but:SetSize( 160, 32 ) but:SetText( "" )
		but.B_Hover = false  but.N_Ho = 0  but.N_In = 0  pan.T_Buts[ typ ] = but
		function but:Paint( w, h ) local pe3 = 0
			if but.B_Hover then pe3 = math.Clamp( but.N_Ho -SysTime(), 0, 1 )
			else pe3 = 1-math.Clamp( but.N_Ho -SysTime(), 0, 1 ) end
			surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, h )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h )
			if but.N_In > SysTime() then local per = ( 1-math.Clamp( ( but.N_In -SysTime() )/0.4, 0, 1 ) )
				local pe2 = math.Clamp( per*2, 0, 1 )
				draw.RoundedBox( 0, 2, 2, ( w -4 )*pe2, ( h -4 )*pe2, Color( 255, 255, 255, 255*(1-per) ) ) end
			draw.RoundedBox( 0, 2, 2, w -4, h -4, Color( 255, 255, 255, 50*(1-pe3) ) )
			draw.TextShadow( { text = language.GetPhrase( "xdefm."..typ ), pos = { 32, h/2 },
			font = "xdefm_Font1", xalign = TEXT_ALIGN_LEFT,
			yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255*pe3 ) }, 1, 255 )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawRect( w -20 -8, 5, 22, 22 )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( w -20 -8, 5, 22, 22, 3 )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( w -20 -8, 5, 22, 22, 1 )
			if pan.T_Typs[ typ ] then draw.TextShadow( { text = "●", pos = { w -18, 16 },
				font = "xdefm_Font2", xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER, color = Color( 0, 255, 0 ) }, 1, 255 ) end end
		function but:OnCursorEntered() but.B_Hover = true  but.N_Ho = SysTime() +0.5 end
		function but:OnCursorExited() but.B_Hover = false  but.N_Ho = SysTime() +0.5 end
		function but:DoClick() pan.T_Typs[ typ ] = !pan.T_Typs[ typ ]  but.N_In = SysTime() +0.4
		if input.IsShiftDown() then local ref = pan.T_Typs[ typ ]
			for k, v in pairs( pan.T_Typs ) do if k != typ and v != ref then pan.T_Typs[ k ] = ref  pan.T_Buts[ k ].N_In = SysTime() +0.4 end end
		end pan:RefreshDatItems() end
		function but:DoRightClick() local ref = false
			if pan.T_Typs[ typ ] == false then pan.T_Typs[ typ ] = true  but.N_In = SysTime() +0.4  ref = true end
			for k, v in pairs( pan.T_Typs ) do if k != typ and v == true then pan.T_Typs[ k ] = false  ref = true
			if pan.T_Buts[ k ] then pan.T_Buts[ k ].N_In = SysTime() +0.4 end end end
			if ref then pan:RefreshDatItems() end end
		local ico = xdefm.miscs.Icons[ typ ]  local spr = but:Add( "DImage" ) spr:SetPos( 8, 8 )
		spr:SetSize( 16, 16 ) spr:SetMaterial( ico ) return but end local ba = 30
	AddTickButton( ba, 50, "Useless" ) AddTickButton( ba +175, 50, "Creature" )
	AddTickButton( ba +175*2, 50, "Bait" ) AddTickButton( ba +175*3, 50, "Recipe" ) AddTickButton( ba, 86, "Struct" )
	pan.P_Select = pan:Add( "DPanel" ) local pax = pan.P_Select  pax:SetSize( 734 -6, 420 -6 )
	pax:SetPos( 8 +3, 165 +3 ) local Mat = Material( "gui/center_gradient" )
	function pax:Paint( w, h ) surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, h ) end
	pan.P_Items = pax:Add( "DIconLayout" ) local pa2 = pan.P_Items  pa2:Dock( FILL )
	pa2:SetSpaceX( 4.5 ) pa2:SetSpaceY( 4.5 ) function pa2:Paint( w, h ) end
	for i=1, 5 do local but = pan:Add( "DButton" ) but:SetSize( 20, 45 ) but:SetText( "" )  pan.T_But2[ i ] = but
	but:SetPos( 8 +(i-1)*30, 596 ) but:SetToolTip( "#xdefm.T"..i ) function but:Paint( w, h ) local col = xdefm.miscs.Rarity[ i+1 ]
		surface.SetDrawColor( col ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Ma2 ) surface.SetDrawColor( col.r*0.5, col.g*0.5, col.b*0.5 ) surface.DrawTexturedRect( 0, 0, w, h )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		if pan.T_Rars[ i ] == true then surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 ) end
	end function but:DoClick() pan.T_Rars[ i ] = !pan.T_Rars[ i ]
	if input.IsShiftDown() then local ref = pan.T_Rars[ i ]
		for k, v in pairs( pan.T_Rars ) do if k != i and v != ref then pan.T_Rars[ k ] = ref end end
	end pan:RefreshDatItems( pag ) end
	function but:DoRightClick() local ref = false
		if pan.T_Rars[ i ] == false then pan.T_Rars[ i ] = true  ref = true end
		for k, v in pairs( pan.T_Rars ) do if k != i and v == true then pan.T_Rars[ k ] = false  ref = true end end
	if ref then pan:RefreshDatItems() end end end
	for i=1, 4 do local but = pan:Add( "DButton" ) but:SetSize( 75, 30 ) but:SetText( "" ) but.B_Hover = false  but.N_Clicked = 0  but.N_Bing = 0
	but:SetPos( 366 +(i-1)*100, 606 ) function but:Paint( w, h ) local col = xdefm.miscs.Rarity[ i+1 ]
		local pgo, pgt = pan.T_Dats.PagO, pan.T_Dats.PagT
		but.N_Bing = Lerp( 0.2, but.N_Bing, but.N_Clicked > CurTime() and -1 or ( but.B_Hover and 1 or 0 ) )
		surface.SetDrawColor( Color( 100 +55*but.N_Bing, 100 +100*but.N_Bing, 100 +100*but.N_Bing ) )
		if pgt <= 0 or ( i == 1 and ( pgo <= 1 or pgt <= 2 ) ) or ( i == 2 and pgo <= 1 ) or ( i == 3 and pgo >= pgt )
		or ( i == 4 and ( pgo >= pgt or pgt <= 2 ) ) then surface.SetDrawColor( Color( 25, 25, 25 ) ) end
		surface.DrawRect( 0, 0, w, h ) surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 ) local txt = ""
		if i == 1 then txt = "A" elseif i == 2 then txt = "B" elseif i == 3 then txt = "C" elseif i == 4 then txt = "D" end
		draw.TextShadow( { text = language.GetPhrase( "xdefm.Page"..txt ), pos = { w/2, h/2 -2 }, font = "xdefm_Font4",
		xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
	end function but:OnCursorEntered() self.B_Hover = true end function but:OnCursorExited() self.B_Hover = false end
	function but:DoClick() if but.N_Clicked > CurTime() or pan.T_Dats.PagT <= 0 then return end but.N_Clicked = CurTime() +0.1
		local pgo, pgt = pan.T_Dats.PagO, pan.T_Dats.PagT
		if ( i == 1 and ( pgo <= 1 or pgt <= 2 ) ) or ( i == 2 and pgo <= 1 ) or ( i == 3 and pgo >= pgt )
		or ( i == 4 and ( pgo >= pgt or pgt <= 2 ) ) then return end
		if i == 1 then pan.T_Dats.PagO = 1 elseif i == 2 then pan.T_Dats.PagO = math.max( pan.T_Dats.PagO -1, 0 )
		elseif i == 3 then pan.T_Dats.PagO = math.min( pan.T_Dats.PagO +1, pgt ) elseif i == 4 then pan.T_Dats.PagO = pgt end pan:RefreshDatItems()
	end end
	pan.P_Prog = pan:Add( "DPanel" ) pan.P_Prog:SetSize( 734, 40 ) pan.P_Prog:SetPos( 8, 650 ) function pan.P_Prog:Paint( w, h ) end
	function pan.P_Prog:OnCursorEntered() pan.B_Hover = true end function pan.P_Prog:OnCursorExited() pan.B_Hover = false end
	function pan:RefreshDatItems() pa2:Clear() local ite = {}
		local ttl = 0  for k, v in pairs( pan.T_Items ) do
			local tab = xdefm.items[ v ]  if !istable( tab ) or !isstring( tab.Type ) then continue end
			if !pan.T_Typs[ tab.Type ] or pan.T_Typs[ tab.Type ] != true then continue end
			if !pan.T_Rars[ tab.Rarity ] or pan.T_Rars[ tab.Rarity ] != true then continue end
			table.insert( ite, v )  ttl = ttl +1
		end pan.T_Dats.Num = ttl  pan.T_Dats.PagT = math.ceil( ttl/28 )  local pag = pan.T_Dats.PagO
		if pag > pan.T_Dats.PagT then pan.T_Dats.PagO = pan.T_Dats.PagT
		elseif pag <= 0 and ttl > 0 then pan.T_Dats.PagO = 1 end pag = pan.T_Dats.PagO  local st = 1 +(pag-1)*28
		for i=st, st +27 do if !isstring( ite[ i ] ) then break end local cls = ite[ i ]
			local tab = xdefm.items[ cls ]  if !istable( tab ) or !isstring( tab.Type ) then continue end
			if !pan.T_Typs[ tab.Type ] or pan.T_Typs[ tab.Type ] != true then continue end
			if !pan.T_Rars[ tab.Rarity ] or pan.T_Rars[ tab.Rarity ] != true then continue end
			local slo = xdefm_SlotBox( 0, 0, 100, 100, 0, nil, xdefm.miscs.Icons[ tab.Type ], true )
			if slo then slo:F_SetupItem( ite[ i ] ) pa2:Add( slo )
				function slo:DoClick() if !ply:IsAdmin() then return end local it = cls
					if tab.Type == "Food" then it = it.."|"..tab.BestCook
					elseif tab.Type == "Creature" then it = it.."|"..tab.MaxSize
					elseif tab.Type == "Recipe" then it = it.."|"..tab.Durability end
					surface.PlaySound( "garrysmod/ui_click.wav" )
					RunConsoleCommand( "xdefmod_spawn", it )
				end
				function slo:DoRightClick() if !ply:IsAdmin() then return end local it = cls
					if tab.Type == "Food" then it = it.."|"..tab.BestCook
					elseif tab.Type == "Creature" then it = it.."|"..tab.MaxSize
					elseif tab.Type == "Recipe" then it = it.."|"..tab.Durability end
					surface.PlaySound( "garrysmod/ui_return.wav" )
					RunConsoleCommand( "xdefmod_give", it )
				end
			end
		end local cvar = {}
		for k, v in pairs( Typs ) do table.insert( cvar, pan.T_Typs[ v ] == true and 1 or 0 ) end
		for k, v in pairs( pan.T_Rars ) do table.insert( cvar, v == true and 1 or 0 ) end
		table.insert( cvar, pan.T_Dats.PagO )
		RunConsoleCommand( "xdefmod_collection", table.concat( cvar, "" ) )
	end pan:RefreshDatItems()
elseif typ == 9 then -- 制作
	if IsValid( xdefm.miscs.Menus[ "Craft" ] ) then return end  local MaR = Material( "gui/gradient" )
	local pan = vgui.Create( "DFrame" )  xdefm.miscs.Menus.Craft = pan  pan.T_Data = ply.xdefm_Profile  pan.S_Recipe = "_"
	pan:SetPos( ScrW()/2 -40, ScrH()/2 -550/2 ) pan:SetSize( 600, 550 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW()/2 -40, ScrH()/2 -500/2, 0.2 )
	function pan:Paint( w, h )
		surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 0 )
		surface.DrawTexturedRectRotated( w/2, h/2, w, h, 180 )
		surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.TextShadow( { text = language.GetPhrase( "xdefm.Weapon_Craft" ), pos = { w/2, 25 }, font = "xdefm_Font6",
		xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
	end
	function pan:OnRemove()
		xdefm.miscs.LC = false  local num = 0
		for k, v in pairs( pan.T_Data.Items ) do
			if v == "_" and k != 21 then num = k break end
		end if num > 0 then xdefm_Command( LocalPlayer(), "MoveCraft", num ) end
	end
	if true then -- 关闭按钮
		pan.P_Close = pan:Add( "DButton" )  local pax = pan.P_Close
		pax:SetText( "" ) pax:SetPos( 560, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint( w, h ) draw.TextShadow( {
				text = "×", pos = { w/2, h/2 }, font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER,
				color = ( pax.B_Hover and Color( 255, 0, 0 ) or Color( 255, 255, 255 ) )
		}, 2, 255 ) end function pax:DoClick() pan:Close() end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end --
	if true then -- 框架
		pan.P_Base = pan:Add( "DPanel" )  local pax = pan.P_Base  pax.N_Type = 0  pan.T_Slots = {}
		pax:SetPos( 8, 50 ) pax:SetSize( 582, 490 ) function pax:Paint( w, h ) end pax.N_Type = typ
		function pax:Paint( w, h ) local rec, slo, dur, yes, col = "xdefm.NeedRecipe", pan.T_Slots[ 1 ], 0, false, Color( 200, 200, 200 )
			local pro, dum = 0, 0
			if isstring( pan.T_Slots[ 1 ].S_Item ) and pan.T_Slots[ 1 ].S_Item != "_" then
				local aa, bb = xdefm_ItemGet( pan.T_Slots[ 1 ].S_Item )
				if istable( aa ) and istable( bb ) and bb.Type == "Recipe" then
					rec = bb.Name  dur = aa[ 2 ]  yes = true  col = xdefm.miscs.Rarity[ bb.Rarity +1 ]
					dum = bb.Durability  pro = #bb.Crafts
				end
			end
			surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, 80 )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, 80, 2 )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, 80 )
			draw.TextShadow( { text = language.GetPhrase( rec ), pos = { 80, 20 }, font = "xdefm_Font1",
			xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = col }, 1, 255 )
			if yes and dur and dum then draw.TextShadow( { text = language.GetPhrase( "xdefm.Durability" )..": "..dur.." / "..dum,
				pos = { 80, 40 }, font = "xdefm_Font2", xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = xdefm.ext_col }, 1, 255 )
				draw.TextShadow( { text = language.GetPhrase( "xdefm.Product" )..": "..pro,
				pos = { 80, 60 }, font = "xdefm_Font2", xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = xdefm.ext_col }, 1, 255 )
			end
		end
		local res = xdefm_SlotBox( 8, 8, 64, 64, 1, "#xdefm.Recipe", nil ) pax:Add( res ) res.S_Type = "Recipe"  pan.P_Slot = res
		function res:DoRightClick( Pnl ) if res.T_Item == nil or res:IsDragging() or !IsValid( xdefm.miscs.Menus[ "Inventory" ] ) then return end
			if IsValid( pan.P_DMenu ) then pan.P_DMenu:Remove() end pan.P_DMenu = DermaMenu( false, nil )  local dnm = pan.P_DMenu
			local O_Take = dnm:AddOption( "#xdefm.Take", function() if !res.B_OnMove and IsValid( xdefm.miscs.Menus[ "Inventory" ] ) then
			local num = 0  for k, v in pairs( LocalPlayer().xdefm_Profile.Items ) do
				if isstring( v ) and v == "_" and k != 21 then num = k break end
			end if num > 0 then xdefm_Command( LocalPlayer(), "MoveCraft", num )
			else xdefm_AddNote( ply, "xdefm.FullInv", "resource/warning.wav", "cross", 5 ) end end end )
			O_Take:SetIcon( "icon16/basket_put.png" ) dnm:Open()
		end
		local bck = pax:Add( "DPanel" ) bck:SetSize( 582, 404 ) bck:SetPos( 1, 85 )
		pax.P_Scroll = pax:Add( "DScrollPanel" )
		pax.P_Scroll:SetSize( 582, 394 ) pax.P_Scroll:SetPos( 1, 89 )
		local vba = pax.P_Scroll:GetVBar()  vba:SetHideButtons( true )  vba:SetSize( 0, 0 )
		function vba.btnGrip:Paint( w, h ) end  function vba:Paint( w, h ) end
		function pax.P_Scroll:Paint( w, h ) end
		function bck:Paint( w, h )
			surface.SetDrawColor( xdefm.bck_col ) surface.DrawRect( 0, 0, w, h )
			surface.SetDrawColor( xdefm.ext_col ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefm.lin_col ) surface.DrawOutlinedRect( 0, 0, w, h )
		end  pan.T_Slots[ 1 ] = res
		pax.P_Hold = pax.P_Scroll:Add( "DIconLayout" )  local pa2 = pax.P_Hold  pa2:SetSize( 582, 1000 )
		pa2:SetSpaceX( 1 ) pa2:SetSpaceY( 0 ) function pa2:Paint( w, h ) end
		function pax:OnCursorEntered() self.B_Hover = true end function pax:OnCursorExited() self.B_Hover = false end
		pax.P_Hold.N_Num = 0
	end
	function pan:XDEFM_Update( id, dt )
		if id == 0 then pan.T_Data = dt end if id != 9 then return end
		pan.P_Slot:F_SetupItem( dt[ 1 ] )  pan.S_Recipe = dt[ 1 ]  local pax = pan.P_Base
		pax.P_Hold:Clear()  local aa, bb = xdefm_ItemGet( dt[ 1 ] )
		if !istable( bb ) or bb.Type != "Recipe" or #bb.Crafts <= 0
		then xdefm.miscs.Craft = nil  xdefm.miscs.Marker = nil return end pax.P_Hold.N_Num = 0
		local function xdefm_AddCraft( tab ) pax.P_Hold.N_Num = pax.P_Hold.N_Num +1
			local cc = string.Explode( "&", tab ) if !istable( cc ) or #cc < 2 then return end
			local slo = vgui.Create( "DButton", pax.P_Hold ) slo:SetSize( 50, 80 ) slo:Dock( TOP ) slo:SetText( "" ) slo:SetCursor( "blank" )
			local aa, bb = xdefm_ItemGet( cc[ #cc ] ) if !istable( aa ) or !istable( bb ) then slo:Remove() return end
			local col = xdefm.miscs.Rarity[ bb.Rarity +1 ]  local icc = xdefm.miscs.Icons[ bb.Type ]  slo.S_Item = cc[ #cc ]
			slo.B_Hover = false  slo.N_Num = pax.P_Hold.N_Num  slo.N_Clk = 0  slo.N_Lerp = 0 if icc != nil then
				pax.P_Sprite = vgui.Create( "DPanel", slo ) local spr = pax.P_Sprite  
				spr:SetPos( 79, 23 ) spr:SetSize( 16, 16 ) spr:SetMouseInputEnabled( false )
				function spr:Paint( w, h ) surface.SetMaterial( icc )
					surface.SetDrawColor( Color( 255, 255, 255, 255 ) ) surface.DrawTexturedRect( 0, 0, w, h )
				end end slo.T_Craft = cc function slo:Paint( w, h )
				local coc = ( slo.B_Hover and 0.4 or 0.2 ) local co2 = Color( col.r*coc, col.g*coc, col.b*coc )
				slo.N_Lerp = Lerp( 0.1, slo.N_Lerp, ( slo.N_Clk <= CurTime() and slo.B_Hover ) and 0 or 1 )
				local co3 = Color( col.r*coc*2, col.g*coc*2, col.b*coc*2, 55 +slo.N_Lerp*100 ) draw.RoundedBox( 0, 2 +3, 2, w -1 -8, h -2, co2 )
				surface.SetDrawColor( co3 ) surface.SetMaterial( MaR ) surface.DrawTexturedRect( 2 +5, 2, w -5 -8, h -2 -2 )
				surface.SetDrawColor( xdefm.ext_col )  surface.DrawOutlinedRect( 2 +3, 2, w -1 -8, h -2, 2 )
				surface.SetDrawColor( xdefm.lin_col )  surface.DrawOutlinedRect( 2 +3, 2, w -1 -8, h -2 )
				draw.TextShadow( { text = bb.Name, pos = { 102, 30 }, font = "xdefm_Font5",
				xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = col }, 1, 255 )
				draw.TextShadow( { text = language.GetPhrase( "xdefm.Materials" )..": "..tostring( #cc -1 ),
				pos = { 80, 60 }, font = "xdefm_Font1", xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
				draw.TextShadow( { text = "#"..slo.N_Num,
				pos = { 540, 40 }, font = "xdefm_Font4", xalign = TEXT_ALIGN_RIGHT, yalign = TEXT_ALIGN_CENTER, color = Color( 200, 200, 200 ) }, 1, 255 ) end
			function slo:OnCursorEntered() slo.B_Hover = true  xdefm.miscs.Craft = cc  pan.P_Select = slo  xdefm.miscs.AimPan = slo
			xdefm.miscs.Ings = {}  xdefm.miscs.Ing2 = {}  xdefm.miscs.Marker = slo.S_Item  xdefm.miscs.LC = true end
			function slo:OnCursorExited() slo.B_Hover = false  if xdefm.miscs.AimPan == slo then xdefm.miscs.AimPan = nil end
			if pan.P_Select == slo then xdefm.miscs.Marker = nil
			pan.P_Select = nil  xdefm.miscs.Marker = nil end end
			function slo:DoClick() if slo.N_Clk > CurTime() then return end slo.N_Clk = CurTime() +0.25
			xdefm_Command( LocalPlayer(), "Craft", tostring( slo.N_Num ) ) end
			local ico = xdefm_SlotBox( 13, 11, 60, 60, 1 ) slo:Add( ico ) ico:F_SetupItem( cc[ #cc ] )
			ico.P_Txt:Remove() ico:SetMouseInputEnabled( false )
		end for k, v in pairs( bb.Crafts ) do xdefm_AddCraft( v ) end
	end pan:XDEFM_Update( 9, tab )
end end end
	function xdefm_ProfileUpdate( ply, tab )
		if !IsValid( ply ) or !ply:IsPlayer() or !isstring( ply:SteamID() ) or ply:IsBot() then return end
		if !istable( tab ) then tab = ply.xdefm_Profile end
		if SERVER then
			tab.Nick = ply:Nick()
			tab.SID64 = ply:SteamID64()
			local dat = util.TableToJSON( tab, true )
			if !isstring( dat ) or dat == "" then
				tab = {
					Level = 0,
					Money = 0,
					Exp = 0,
					Items = { "it_bait1","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_", "_" },
					UpdA = 0,
					UpdB = 0,
					UpdC = 0,
					UpdD = 0,
					UpdE = 0,
					UpdF = 0,
					UpdG = 0,
					Skp = 0,
					Bnk = {},
					TCatch = 0,
					TExp = 0,
					TEarn = 0,
					TBuy = 0
				}
				tab.Nick = ply:Nick()
				tab.SID64 = ply:SteamID64()
				dat = util.TableToJSON( tab, true )
			end
			ply.xdefm_Profile = tab
			local name = string.lower( string.Replace( ply:SteamID(), ":", "_" ) )
			if !file.IsDir( "xdefishmod", "DATA" ) then
				file.CreateDir( "xdefishmod" )
			end
			file.Write( "xdefishmod/p_"..name..".txt", dat )
			net.Start( "NET_xdefm_Profile" )
			net.WriteString( util.TableToJSON( ply.xdefm_Profile ) )
			net.Send( ply )
			xdefm_UpdateMenu( ply, 0, ply.xdefm_Profile )
		end
	end
	function xdefm_GetUpValue( lvl, ele )
		if !isnumber( lvl ) or !isstring( ele ) then return nil end
		lvl = math.Clamp( math.Round( lvl ), 0, 100 )
		if ele == "A" then return 0.5 +lvl*0.025 end
		if ele == "B" then return 210 +lvl*90 end
		if ele == "C" then return 0.8 +lvl*0.192 end
		if ele == "D" then return 200 +lvl*50 end
		if ele == "E" then return lvl*0.01 end
		if ele == "F" then return 0 +lvl end
		if ele == "G" then return 1 +lvl end
		return nil
	end
	function xdefm_CanInteract( fr, to )
		if !IsValid( fr ) or !IsValid( to ) or !fr:IsPlayer() then return false end
		local siz = to:OBBMins():Distance( to:OBBMaxs() )
		return fr:WorldSpaceCenter():Distance( to:WorldSpaceCenter() ) <= math.max( 64, math.ceil( siz*1.5 ) )
	end
	function xdefm_ItemMark( str, aco )
		if !isstring( str ) or str == "" or str == "_" then return "" end
		local aa, bb = xdefm_ItemGet( str )
		if !istable( aa ) or !istable( bb ) then return "" end
		local ext = ""
		if bb.Type == "Creature" and aa[2] then
			ext = " (x"..aa[2]..")"
		end
		if bb.Type == "Recipe" and aa[2] then
			local per = math.Round( ( aa[2]/bb.Durability )*100 )
			ext = " ("..per.."%)"
		end
		local nam = bb.Name
		if CLIENT then
			nam = language.GetPhrase( nam )
		end
		if aco then
			return nam..ext
		else
			local col = xdefm.miscs.Rarity[ bb.Rarity+1 ]
			return "&<color="..col.r..","..col.g..","..col.b..">&"..nam.."&"..ext.."&</color>&"
		end
	end
	function xdefm_ItemRegister( nam, dat )
		if !isstring( nam ) or nam == "" or nam == "_" or nam == "!V" or !istable( dat ) then return false end
		local inp = {}
		inp.Name 		= isstring( dat.Name ) and dat.Name or language.GetPhrase( "xdefm.BaseItem" ) --物品名称
		inp.Type 		= ( isstring( dat.Type ) and isnumber( xdefm.miscs.Types[ dat.Type ] ) ) and dat.Type or "Useless" --种类,参考xdefm.miscs.Types
		inp.Model 		= { "models/props_junk/popcan01a.mdl" } --模型,可用集合,注意图标只选择集合第一个模型,填入非模型路径会导致报错
		inp.Helper 		= isstring( dat.Helper ) and dat.Helper or "" --注释
		inp.Rarity 		= isnumber( dat.Rarity ) and math.Clamp( math.Round( dat.Rarity ), 1, 5 ) or 1 --稀有度,白绿蓝紫橙
		inp.Price 		= isnumber( dat.Price ) and math.max( math.Round( dat.Price ), 0 ) or 0 --价格,出售价格另算
		inp.Carryable 	= true  if isbool( dat.Carryable ) then inp.Carryable = dat.Carryable end --可放入背包
		inp.Secret 		= true  if isbool( dat.Secret ) then inp.Secret = dat.Secret end --设置此项使该物品无法用指令刷出
		inp.TickRate 	= isnumber( dat.TickRate ) and math.max( dat.TickRate, 0 ) or 60 --实体Think间隔(秒)
		inp.KillInWater = false  if isbool( dat.KillInWater ) then inp.KillInWater = dat.KillInWater end --入水消失,默认关闭
		inp.Constants 	= {}  if istable( dat.Constants ) then inp.Constants = dat.Constants end --常量集合
		inp.PhysSound	= isstring( dat.PhysSound ) and dat.PhysSound or nil --碰撞音效
		inp.CantCook	= isbool( dat.CantCook ) and dat.CantCook or nil --不允许该物品烹饪增值,用于炉子一类物品
		if SERVER then
			inp.OnTouch = function( inp, ent, usr, typ ) end if isfunction( dat.OnTouch ) then inp.OnTouch = dat.OnTouch end --触摸,usr触碰实体,typ1开始,0持续,-1结束
			inp.OnUse = function( inp, ent, usr ) return true end if isfunction( dat.OnUse ) then inp.OnUse = dat.OnUse end --使用,return false来阻止捡起物品
			inp.OnThink = function( inp, ent ) end if isfunction( dat.OnThink ) then inp.OnThink = dat.OnThink end
			inp.OnCollide = function( inp, ent, dat ) end if isfunction( dat.OnCollide ) then inp.OnCollide = dat.OnCollide end --碰撞,dat数据
			inp.OnInit = function( inp, ent ) return false end if isfunction( dat.OnInit ) then inp.OnInit = dat.OnInit end --生成,于OnDrop后,return false取消默认实体设定
			inp.OnReady = function( inp, ent ) end if isfunction( dat.OnReady ) then inp.OnReady = dat.OnReady end --生成后0.1秒
			inp.OnDamaged = function( inp, ent, dmg ) return true end if isfunction( dat.OnDamaged ) then inp.OnDamaged = dat.OnDamaged end --受伤,return false不受伤害影响
			inp.OnDrop = function( inp, ent, usr, typ ) end if isfunction( dat.OnDrop ) then inp.OnDrop = dat.OnDrop end --按E捡起丢在地上或丢出,typ false为丢在地上,true为丢出
			inp.OnStore = function( inp, ent, usr ) return true end if isfunction( dat.OnStore ) then inp.OnStore = dat.OnStore end --R键存储,return false拒绝或inp.Carryable反选
			inp.OnPhysSimulate = function( inp, ent, phy, del ) end if isfunction( dat.OnPhysSimulate ) then inp.OnPhysSimulate = dat.OnPhysSimulate end --物理操控
			inp.OnRemove = function( inp, ent ) end if isfunction( dat.OnRemove ) then inp.OnRemove = dat.OnRemove end --删除
			inp.OnPlayerDrop = function( inp, ent ) end if isfunction( dat.OnPlayerDrop ) then inp.OnPlayerDrop = dat.OnPlayerDrop end --被玩家丢弃
			inp.OnCaught = function( inp, ent, ply ) end if isfunction( dat.OnCaught ) then inp.OnCaught = dat.OnCaught end --被钓出水面(钓鱼成功加经验时)
		else
			inp.OnDraw = function( inp, ent ) end if isfunction( dat.OnDraw ) then inp.OnDraw = dat.OnDraw end --实体渲染
			inp.HelperUse = "xdefm.U1"  if isstring( dat.HelperUse ) then inp.HelperUse = dat.HelperUse end --使用键注释,默认"捡起"
		end
		if isstring( dat.Model ) then inp.Model = { dat.Model } elseif istable( dat.Model ) and #dat.Model > 0 then inp.Model = dat.Model end local typ = dat.Type
		if typ == "Creature" then
			inp.MaxSize = ( isnumber( dat.MaxSize ) and math.max( math.Round( dat.MaxSize, 1 ), 0 ) or 1 ) --生物最高大小
			inp.MinSize = ( isnumber( dat.MinSize ) and math.max( math.Round( dat.MinSize, 1 ), 0 ) or 1 ) --生物最低大小
			if inp.MinSize > inp.MaxSize then inp.MinSize = inp.MaxSize end
		elseif typ == "Bait" then
			inp.Consume = ( isnumber( dat.Consume ) and math.max( dat.Consume, 0 ) or 0 ) --鱼饵消耗几率,数值越大越不容易被消耗,1为一次消耗,0为不消耗
			inp.Level = ( isnumber( dat.Level ) and math.Clamp( dat.Level, 0, 1000 ) or 0 ) --鱼饵等级限制
		elseif typ == "Recipe" then
			inp.Durability = ( isnumber( dat.Durability ) and math.max( math.Round( dat.Durability ), 1 ) or 1 ) --图纸能用几次
			if istable( dat.Crafts ) or isstring( dat.Crafts ) then inp.Crafts = dat.Crafts else return false end --图纸材料&产品,可填集合
			if isstring( inp.Crafts ) then inp.Crafts = { inp.Crafts } end for k, v in pairs( inp.Crafts ) do if !isstring( v ) then return false end
			local dec = string.Explode( "&", v ) if !istable( dec ) or #dec < 2 then return false end end
			--图纸格式:"材料A&材料B&材料C&产品",可填集合,产品为&分割开的最后一个物品,材料种类可重合,物品类别不做要求
			--注意生物大小不受限制,但烹饪后的物品无法参与制作
		elseif typ == "Struct" then
			inp.SType = isnumber( dat.SType ) and math.Clamp( math.Round( dat.SType ), 0, 3 ) or 0 --建筑类型,其他、存储、合成、商店
			if inp.SType == 1 then
				inp.Accepted = istable( dat.Accepted ) and dat.Accepted or nil --存储物品类型限制,留白为不限
				inp.Amount = isnumber( dat.Amount ) and math.max( 0, math.Round( dat.Amount ) ) or 0 --存储容量
			elseif inp.SType == 2 then
				if istable( dat.Crafts ) or isstring( dat.Crafts ) then inp.Crafts = dat.Crafts else return false end --合成格式同图纸,但是可以无限使用
				if isstring( inp.Crafts ) then inp.Crafts = { inp.Crafts } end for k, v in pairs( inp.Crafts ) do if !isstring( v ) then return false end
				local dec = string.Explode( "&", v ) if !istable( dec ) or #dec < 2 then return false end end
			elseif inp.SType == 3 then
				if istable( dat.Shop ) then inp.Shop = dat.Shop else return false end --物品&价格,可填集合,不会降价
				for k, v in pairs( inp.Shop ) do if !istable( v ) then return false end end
			end
			inp.OnInteract =  isfunction( dat.OnInteract ) and dat.OnInteract or nil --typ1,0,-1对应进入,互动,退出
			inp.StartSound = isstring( dat.StartSound ) and dat.StartSound or nil --开始使用音效
			inp.ExitSound  = isstring( dat.ExitSound ) and dat.ExitSound or nil --结束使用音效
		end
		nam = string.Replace( nam, " ", "_" )
		xdefm.items[ nam ] = inp
		return true
	end
	function xdefm_ItemBased( bas, nam, dat )
		if !isstring( nam ) or nam == "" or nam == "_" or !istable( dat ) or string.find( nam, "|" ) != nil or string.find( nam, "&" ) != nil then return false end
		local aa, bb = xdefm_ItemGet( bas )
		if !istable( bb ) then return false end
		local inp = {}
		for k, v in pairs( bb ) do
			inp[ k ] = ( dat[ k ] != nil and dat[ k ] or v )
		end
		if isstring( inp.Model ) then
			inp.Model = { inp.Model }
		end
		nam = string.Replace( nam, " ", "_" )
		xdefm.items[ nam ] = inp
		return true
	end
	function xdefm_ItemGet( dat )
		if IsEntity( dat ) and dat:GetClass() == "xdefm_base" then
			dat = dat:GetFMod_DT()
		end
		if !isstring( dat ) or dat == "" or dat == "_" then
			return nil, nil
		end
		local it1 = string.Explode( "|", dat )
		if istable( it1 ) then
			dat = xdefm_GetClass( dat )
		end
		local tab = xdefm.items[ dat ]
		if !istable( tab ) then
			return nil, nil
		end
		if !istable( it1 ) then
			it1 = { dat }
		end
		return it1, table.Inherit( tab, {} )
	end
	function xdefm_Command( ply, cmd, dat )
		if isnumber( dat ) then dat = tostring( dat ) end
		if !isstring( dat ) or dat == "" or !isstring( cmd ) or ( isnumber( ply.XDEFM_Cool ) and ply.XDEFM_Cool > CurTime() )
		or !istable( ply.xdefm_Profile ) then return false end
		if CLIENT then
			net.Start( "NET_xdefm_Cmd" )
			net.WriteString( cmd )
			net.WriteString( dat )
			net.SendToServer()
			if GetConVar( "xdefmod_printcmd" ):GetInt() > 0 then
				MsgC( Color( 255, 255, 255 ), "[", Color( 0, 255, 255 ), "xdefmod", Color( 255, 255, 255 ), "]Command: "..cmd.." "..dat.."\n" )
			end
		else
			ply.XDEFM_Cool = CurTime()+0.2
			local wep = ply:GetActiveWeapon()
			local usi = ply:GetNWEntity( "XDEFM_Using" )
			local hk = hook.Run( "XDEFM_Command", ply, cmd, dat )
			if isbool( hk ) and hk == false then return false end
if cmd == "StructExit" then local usi = ply.xdefm_Struct  if !IsValid( ply.xdefm_Struct ) then return false end
	local aa, bb = xdefm_ItemGet( usi )  if !istable( bb ) then return false end
	if bb.ExitSound then usi:EmitSound( bb.ExitSound ) end ply.xdefm_Struct = nil
	if bb.OnInteract then local yes = true
		for k, v in pairs( player.GetHumans() ) do if v.xdefm_Struct == usi then yes = false end end
		if yes then bb:OnInteract( usi, ply, -1 ) end
	end return true
elseif cmd == "Struct" then local usi = ply.xdefm_Struct  if !IsValid( ply.xdefm_Struct ) then return false end local usi = ply.xdefm_Struct  local cls = xdefm_GetClass( usi )
	if ( !xdefm_FriendAllow( ply, usi ) and !xdefm_NadAllow( ply, usi ) ) then return end
	if !isstring( cls ) then return false end local aa, bb = xdefm_ItemGet( cls )  if !istable( bb ) or bb.Type != "Struct" then return false end local stp = bb.SType
	if stp == 1 then local ab = string.Explode( "|", dat ) if !istable( ab ) or #ab != 2 then return false end
		if isfunction( bb.OnInteract ) then if bb:OnInteract( usi, ply, 0, unpack( ab ) ) == false then
		xdefm_AddNote( ply, "!V", "resource/warning.wav", "cross", 5 ) return end end
		local aa, bb = tonumber( ab[ 1 ] ), tonumber( ab[ 2 ] )  if !isnumber( aa ) or !isnumber( bb ) then return false end
		local wep = ply:GetWeapon( "weapon_xdefm_rod" )  if aa == 21 and IsValid( wep ) then
			local rd = wep.FMod_Rod  local bb = wep.FMod_Bobber  local hk = wep.FMod_Hook
			if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
		end local a1 = ply.xdefm_Profile.Items[ aa ]  local b1 = usi.xdefm_T3[ bb ]
		if !isstring( a1 ) or !isstring( b1 ) or ( a1 == "_" and b1 == "_" ) then return false end
		local a2, a3 = xdefm_ItemGet( a1 )  local b2, b3 = xdefm_ItemGet( b1 )
		if aa == 21 and b3 and istable( b3 ) and b3.Type != "Bait" then
		xdefm_AddNote( ply, "xdefm.NotBait& "..xdefm_ItemMark( b1 ).." &xdefm.NotBai2", "resource/warning.wav", "cross", 5 ) return false end
		if ( !istable( a3 ) and !istable( b3 ) ) then return end
		if istable( b3 ) and b3.Type == "Bait" and aa == 21 and b3.Level > ply.xdefm_Profile.Level then	
		xdefm_AddNote( ply, "xdefm.NoLevel", "resource/warning.wav", "cross", 5 ) return false end
		ply.xdefm_Profile.Items[ aa ] = b1  usi.xdefm_T3[ bb ] = a1
		if isstring( b1 ) and b1 != "_" then net.Start( "NET_xdefm_BestiaryRecord" ) net.WriteString( xdefm_GetClass( b1 ) ) net.Send( ply ) end xdefm_ProfileUpdate( ply )
		for k, v in pairs( player.GetHumans() ) do if v.xdefm_Struct and v.xdefm_Struct == usi then xdefm_UpdateMenu( v, 3, { [ bb ] = a1 } ) end end return true
	elseif stp == 2 then local slo = bb.Crafts[ tonumber( dat ) ]  if !isstring( slo ) then return false end
		if isfunction( bb.OnInteract ) then if bb:OnInteract( usi, ply, 0, slo ) == false then
		xdefm_AddNote( ply, "!V", "resource/warning.wav", "cross", 5 ) return end end
		ply.XDEFM_Cool = CurTime() +0.1  local ing = string.Explode( "&", slo )  if !istable( ing ) or #ing < 2 then return false end
		local wep = ply:GetWeapon( "weapon_xdefm_rod" )  if IsValid( wep ) then
			local rd = wep.FMod_Rod  local bb = wep.FMod_Bobber  local hk = wep.FMod_Hook
			if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
		end local ite, ned = ply.xdefm_Profile.Items, {}
		for k, v in pairs( ing ) do if k == #ing then break end
			local yes = false
			for m, n in pairs( ite ) do if n == "_" or ned[ m ] != nil then continue end
				if xdefm_GetClass( n ) == v then
					yes = true  ned[ m ] = 0 break
				end
			end if !yes then xdefm_AddNote( ply, "xdefm.NeedMat", "resource/warning.wav", "cross", 5 ) return false end
		end
		for k, v in pairs( ned ) do ply.xdefm_Profile.Items[ k ] = "_" end
		if xdefm_ItemGive( ply, ing[ #ing ], true ) then aa[ 2 ] = tonumber( aa[ 2 ] )
			xdefm_AddNote( ply, "xdefm.Crafted&: &"..xdefm_ItemMark( ing[ #ing ] ), "buttons/lever7.wav", "wrench", 5 )
			ply.xdefm_Profile.TCraft = ( isnumber( ply.xdefm_Profile.TCraft ) and ply.xdefm_Profile.TCraft +1 or 0 )
			xdefm_ProfileUpdate( ply )
		end return true
	elseif stp == 3 then
		local pro = ply.xdefm_Profile  local mon, lvl = ply.xdefm_Profile.Money, ply.xdefm_Profile.Level
		local slo = bb.Shop[ dat ] if !istable( slo ) then return false end
		if isfunction( bb.OnInteract ) then if bb:OnInteract( usi, ply, 0, dat ) == false then
		xdefm_AddNote( ply, "!V", "resource/warning.wav", "cross", 5 ) return end end
		local prc = math.ceil( slo[ 1 ] ) if mon < prc or lvl < slo[ 2 ] then return false end local slo = 0
		for k, v in pairs( pro.Items ) do if v == "_" then slo = k break end end
		if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" and slo == 21 then
			local rd = wep.FMod_Rod  local bb = wep.FMod_Bobber  local hk = wep.FMod_Hook
			if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end end
		if xdefm_ItemGive( ply, dat ) then ply.xdefm_Profile.Money = mon -prc
			ply.xdefm_Profile.TBuy = ply.xdefm_Profile.TBuy+1  xdefm_ProfileUpdate( ply ) return true end
		end return true
elseif cmd == "StructOuter" then local usi = ply.xdefm_Struct  if !IsValid( ply.xdefm_Struct ) then return false end local usi = ply.xdefm_Struct  local cls = xdefm_GetClass( usi )
	if !isstring( cls ) then return false end local aa, bb = xdefm_ItemGet( cls )  if !istable( bb ) or bb.Type != "Struct" then return false end local stp = bb.SType
	if stp == 1 then local ab = string.Explode( "|", dat ) if !istable( ab ) or #ab != 2 then return false end
		if isfunction( bb.OnInteract ) then if bb:OnInteract( usi, ply, 0, unpack( ab ) ) == false then
		xdefm_AddNote( ply, "!V", "resource/warning.wav", "cross", 5 ) return end end
		local aa, bb = tonumber( ab[ 1 ] ), tonumber( ab[ 2 ] )  if !isnumber( aa ) or !isnumber( bb ) then return false end
		local a1 = usi.xdefm_T3[ aa ]  local b1 = usi.xdefm_T3[ bb ]
		if !isstring( a1 ) or !isstring( b1 ) or ( a1 == "_" and b1 == "_" ) then return false end
		usi.xdefm_T3[ aa ] = b1  usi.xdefm_T3[ bb ] = a1
		if isstring( b1 ) and b1 != "_" then net.Start( "NET_xdefm_BestiaryRecord" ) net.WriteString( xdefm_GetClass( b1 ) ) net.Send( ply ) end xdefm_ProfileUpdate( ply )
		for k, v in pairs( player.GetHumans() ) do if v.xdefm_Struct and v.xdefm_Struct == usi then xdefm_UpdateMenu( v, 3, { [ bb ] = a1, [ aa ] = b1 } ) end end return true
	end
elseif cmd == "MoveInv" then local ab = string.Explode( "|", dat ) if !istable( ab ) or #ab != 2 then return false end
	local aa, bb = tonumber( ab[1] ), tonumber( ab[2] ) if !isnumber( aa ) or !isnumber( bb ) or aa <= 0 or bb <= 0 then return false end
	aa = math.Clamp( math.Round( aa ), 1, 21 )  bb = math.Clamp( math.Round( bb ), 1, 21 )  local inv = ply.xdefm_Profile.Items
	local a1, a2 = inv[ aa ], inv[ bb ]  if a1 == "_" and a2 == "_" or aa == bb or a1 == a2 then return false end
	local c1, t1 = xdefm_ItemGet( a1 )  local c2, t2 = xdefm_ItemGet( a2 )  if !istable( c1 ) and !istable( c2 ) then return false end
	if ( istable( t1 ) and t1.Type != "Bait" and bb == 21 ) or ( istable( t2 ) and t2.Type != "Bait" and aa == 21 ) then local bai = ""
	if istable( t1 ) and t1.Type != "Bait" then bai = a1 elseif istable( t2 ) and t2.Type != "Bait" then bai = a2 end
	xdefm_AddNote( ply, "xdefm.NotBait& "..xdefm_ItemMark( bai ).." &xdefm.NotBai2", "resource/warning.wav", "cross", 5 ) return false end
	if istable( t2 ) and t2.Type == "Bait" and aa == 21 and t2.Level > ply.xdefm_Profile.Level then
	xdefm_AddNote( ply, "xdefm.NoLevel", "resource/warning.wav", "cross", 5 ) return false end
	if istable( t1 ) and t1.Type == "Bait" and bb == 21 and t1.Level > ply.xdefm_Profile.Level then
	xdefm_AddNote( ply, "xdefm.NoLevel", "resource/warning.wav", "cross", 5 ) return false end
	local wep = ply:GetWeapon( "weapon_xdefm_rod" )  if ( aa == 21 or bb == 21 ) and IsValid( wep ) then
		local rd = wep.FMod_Rod  local bb = wep.FMod_Bobber  local hk = wep.FMod_Hook
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end ply.xdefm_Profile.Items[ aa ] = a2  ply.xdefm_Profile.Items[ bb ] = a1  xdefm_ProfileUpdate( ply ) return true
elseif cmd == "DestroyInv" then local aa = tonumber( dat )  if !isnumber( aa ) then return false end aa = math.Clamp( math.Round( aa ), 1, 21 )  local inv = ply.xdefm_Profile.Items
	local a1 = inv[ aa ]  if !isstring( a1 ) or a1 == "_" then return false end  local bb, cc = xdefm_ItemGet( a1 )
	local prc = xdefm_GetPrice( a1 )  local wep = ply:GetWeapon( "weapon_xdefm_rod" )  if aa == 21 and IsValid( wep ) then
		local rd = wep.FMod_Rod  local bb = wep.FMod_Bobber  local hk = wep.FMod_Hook
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end if istable( cc ) and prc > 0 then xdefm_GiveMoney( ply, prc ) xdefm_AddNote( ply, "xdefm.GetMoney&: "..prc, "!V", "coins", 5 )
	else xdefm_AddNote( ply, "xdefm.Trashed&: "..xdefm_ItemMark( a1 ), "physics/cardboard/cardboard_box_impact_bullet1.wav", "bin_empty", 5 ) end
	ply.xdefm_Profile.Items[ aa ] = "_"  xdefm_ProfileUpdate( ply ) return true
elseif cmd == "DropInv" then local aa = tonumber( dat )  if !isnumber( aa ) then return false end aa = math.Clamp( math.Round( aa ), 1, 21 )  local inv = ply.xdefm_Profile.Items
	local a1 = inv[ aa ]  if !isstring( a1 ) or a1 == "_" then return false end
	if !ply:CheckLimit( "xdefmod_items" ) or ( URS and URS.Check( ply, "xdefmod_item", "_" ) == false ) or !ply:IsInWorld() then return false end
	local yes = xdefm_ItemSpawn( a1, ply:WorldSpaceCenter(), Angle( 0, ply:EyeAngles().yaw, 0 ), ply )
	if IsValid( yes ) then ply.xdefm_Profile.Items[ aa ] = "_"  xdefm_ProfileUpdate( ply )  local siz = yes:OBBMins():Distance( yes:OBBMaxs() )
	local tr = util.QuickTrace( ply:EyePos(), ply:EyeAngles():Forward()*( yes:OBBMins():Distance( yes:OBBMaxs() ) )*4, { yes, ply } )
	yes:SetPos( tr.HitPos +( tr.Hit and tr.HitNormal or Vector( 0, 0, 1 ) )*math.abs( yes:OBBMins().z -yes:OBBMaxs().z ) ) end
	local wep = ply:GetWeapon( "weapon_xdefm_rod" )  if aa == 21 and IsValid( wep ) then
		local rd = wep.FMod_Rod  local bb = wep.FMod_Bobber  local hk = wep.FMod_Hook
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end local aa, bb = xdefm_ItemGet( a1 ) if istable( aa ) and istable( bb ) then bb:OnPlayerDrop( yes, ply ) ply:AddCount( "xdefmod_items", yes )
	xdefm_AddNote( ply, "xdefm.Dropped&: "..xdefm_ItemMark( a1 ), "weapons/iceaxe/iceaxe_swing1.wav", "basket_remove", 5 ) end return true
elseif cmd == "Upgrade" then local pro = ply.xdefm_Profile  local skp = pro.Skp  local exp = string.Explode( "|", dat )
	local d1, d2  if istable( exp ) and #exp == 2 then d1, d2 = exp[ 1 ], exp[ 2 ] else d1, d2 = dat, 1 end
	d2 = tonumber( d2 ) if !isnumber( d2 ) or d2 <= 0 then return false end d2 = math.ceil( d2 )
	local maxx = ( d1 == "G" and 5 or 100 )  local max2 = maxx -ply.xdefm_Profile[ "Upd"..d1 ]  d2 = math.min( max2, d2 )
	if !isnumber( xdefm.miscs.Costs[ d1 ] ) or ply.xdefm_Profile[ "Upd"..d1 ] >= maxx or max2 <= 0 then return false end
	local co1 = xdefm.miscs.Costs[ d1 ]  local co2 = co1*d2  if skp < co2 then d2 = math.floor( skp/co1 ) end
	if d2 <= 0 then xdefm_AddNote( ply, "xdefm.NoEnoughSkp", "resource/warning.wav", "cross", 5 ) return false end
	co2 = co1*d2 if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" then
		local rd = wep.FMod_Rod  local bb = wep.FMod_Bobber  local hk = wep.FMod_Hook
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end if d1 == "F" then for i=1, d2 do if !isstring( ply.xdefm_Profile[ "Bnk" ][ ply.xdefm_Profile[ "UpdF" ]+i ] ) then
		ply.xdefm_Profile[ "Bnk" ][ ply.xdefm_Profile[ "UpdF" ]+i ] = "_" end end
	end ply.xdefm_Profile[ "Upd"..d1 ] = ply.xdefm_Profile[ "Upd"..d1 ] +d2
	ply.xdefm_Profile[ "Skp" ] = ply.xdefm_Profile[ "Skp" ] -co2  xdefm_ProfileUpdate( ply )
	if d1 == "G" and GetConVar( "xdefmod_nomorehook" ):GetInt() >= 1 then
		xdefm_AddNote( ply, "xdefm.NoMoreHook", "resource/warning.wav", "cross", 5 )
	else
		xdefm_AddNote( ply, "xdefm.Upgraded&: &xdefm.Upd"..d1, "ui/buttonclick.wav", "lightning_add", 5 )
	end
	if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" and IsValid( wep.FMod_Rod ) then wep.FMod_Rod:Remove() end return true
elseif cmd == "Downgrade" then local pro = ply.xdefm_Profile  local skp = pro.Skp  local exp = string.Explode( "|", dat )
	local d1, d2  if istable( exp ) and #exp == 2 then d1, d2 = exp[ 1 ], exp[ 2 ] else d1, d2 = dat, 1 end
	d2 = tonumber( d2 ) if !isnumber( d2 ) or d2 <= 0 then return false end d2 = math.ceil( d2 )
	if !isnumber( xdefm.miscs.Costs[ d1 ] ) or ply.xdefm_Profile[ "Upd"..d1 ] <= 0 then return false end
	d2 = math.min( ply.xdefm_Profile[ "Upd"..d1 ], d2 )  local co1 = xdefm.miscs.Costs[ d1 ]  local co2 = co1*d2
	if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" then
		local rd = wep.FMod_Rod  local bb = wep.FMod_Bobber  local hk = wep.FMod_Hook
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end ply.xdefm_Profile[ "Upd"..d1 ] = ply.xdefm_Profile[ "Upd"..d1 ] -d2
	ply.xdefm_Profile[ "Skp" ] = ply.xdefm_Profile[ "Skp" ] +co2  xdefm_ProfileUpdate( ply )
	xdefm_AddNote( ply, "xdefm.Downgraded&: &xdefm.Upd"..d1, "ui/buttonclick.wav", "lightning_delete", 5 )
	if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" and IsValid( wep.FMod_Rod ) then wep.FMod_Rod:Remove() end return true
elseif cmd == "MoveBank" then local sls = ply.xdefm_Profile.Bnk
	local ab = string.Explode( "|", dat ) if !istable( ab ) or #ab != 2 then return false end
	local aa, bb = tonumber( ab[ 1 ] ), tonumber( ab[ 2 ] )  if !isnumber( aa ) or !isnumber( bb ) then return false end
	local wep = ply:GetWeapon( "weapon_xdefm_rod" )  if aa == 21 and IsValid( wep ) then
		local rd = wep.FMod_Rod  local bb = wep.FMod_Bobber  local hk = wep.FMod_Hook
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end local a1 = ply.xdefm_Profile.Items[ aa ]  local b1 = sls[ bb ]
	if !isstring( a1 ) or !isstring( b1 ) or ( a1 == "_" and b1 == "_" ) then return false end
	local a2, a3 = xdefm_ItemGet( a1 )  local b2, b3 = xdefm_ItemGet( b1 )
	if aa == 21 and b3 and istable( b3 ) and b3.Type != "Bait" then
	xdefm_AddNote( ply, "xdefm.NotBait& "..xdefm_ItemMark( b1 ).." &xdefm.NotBai2", "resource/warning.wav", "cross", 5 ) return false end
	if ( !istable( a3 ) and !istable( b3 ) ) or bb > ply.xdefm_Profile.UpdF then return end
	if istable( b3 ) and b3.Type == "Bait" and aa == 21 and b3.Level > ply.xdefm_Profile.Level then	
	xdefm_AddNote( ply, "xdefm.NoLevel", "resource/warning.wav", "cross", 5 ) return false end
	ply.xdefm_Profile.Items[ aa ] = b1  ply.xdefm_Profile.Bnk[ bb ] = a1
	if isstring( b1 ) and b1 != "_" then net.Start( "NET_xdefm_BestiaryRecord" ) net.WriteString( xdefm_GetClass( b1 ) ) net.Send( ply ) end
	xdefm_ProfileUpdate( ply ) return true
elseif cmd == "MoveBankOuter" then local sls = ply.xdefm_Profile.Bnk
	local ab = string.Explode( "|", dat ) if !istable( ab ) or #ab != 2 then return false end
	local aa, bb = tonumber( ab[ 1 ] ), tonumber( ab[ 2 ] )  if !isnumber( aa ) or !isnumber( bb ) then return false end
	local a1 = sls[ aa ]  local b1 = sls[ bb ]
	if !isstring( a1 ) or !isstring( b1 ) or ( a1 == "_" and b1 == "_" ) then return false end
	local a2, a3 = xdefm_ItemGet( a1 )  local b2, b3 = xdefm_ItemGet( b1 )
	if ( !istable( a3 ) and !istable( b3 ) ) or aa > ply.xdefm_Profile.UpdF or bb > ply.xdefm_Profile.UpdF then return end
	ply.xdefm_Profile.Bnk[ aa ] = b1  ply.xdefm_Profile.Bnk[ bb ] = a1
	xdefm_ProfileUpdate( ply ) return true
elseif cmd == "MoveTrade" and istable( ply.xdefm_Trade ) then
	local ab = string.Explode( "|", dat ) if !istable( ab ) or #ab != 2 then return false end
	local aa, bb = tonumber( ab[ 1 ] ), tonumber( ab[ 2 ] )  if !isnumber( aa ) or !isnumber( bb ) then return false end
	aa = math.Clamp( math.Round( aa ), 1, 21 )  bb = math.Clamp( math.Round( bb ), 1, 10 )
	local a1 = ply.xdefm_Profile.Items[ aa ]  local b1 = ply.xdefm_Trade[ bb ]
	if !isstring( a1 ) or !isstring( b1 ) or ( a1 == "_" and b1 == "_" ) then return false end
	local a2, a3 = xdefm_ItemGet( a1 )  local b2, b3 = xdefm_ItemGet( b1 ) if !istable( a3 ) and !istable( b3 ) then return false end
	local wep = ply:GetWeapon( "weapon_xdefm_rod" )  if aa == 21 and IsValid( wep ) then
		local rd = wep.FMod_Rod  local bb = wep.FMod_Bobber  local hk = wep.FMod_Hook
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end if !( !istable( a3 ) and istable( b3 ) ) and !( ply:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() and ply:GetNWEntity( "XDEFMod_TPL" ):GetNWEntity( "XDEFMod_TPL" ) == ply ) then
	xdefm_AddNote( ply, "xdefm.NotTrading", "resource/warning.wav", "cross", 5 ) return false end
	if istable( b3 ) and b3.Type == "Bait" and aa == 21 and b3.Level > ply.xdefm_Profile.Level then	
	xdefm_AddNote( ply, "xdefm.NoLevel", "resource/warning.wav", "cross", 5 ) return false end
	ply.xdefm_Profile.Items[ aa ] = b1  ply.xdefm_Trade[ bb ] = a1
	if isstring( b1 ) and b1 != "_" then net.Start( "NET_xdefm_BestiaryRecord" ) net.WriteString( xdefm_GetClass( b1 ) ) net.Send( ply ) end
	if ply:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() and ply:GetNWEntity( "XDEFMod_TPL" ):GetNWEntity( "XDEFMod_TPL" ) == ply then
		xdefm_UpdateMenu( ply:GetNWEntity( "XDEFMod_TPL" ), 5, ply.xdefm_Trade )
	end xdefm_ProfileUpdate( ply ) xdefm_UpdateMenu( ply, 4, ply.xdefm_Trade ) return true
elseif cmd == "MoveTradeOuter" and istable( ply.xdefm_Trade ) then
	local ab = string.Explode( "|", dat ) if !istable( ab ) or #ab != 2 then return false end
	local aa, bb = tonumber( ab[ 1 ] ), tonumber( ab[ 2 ] )  if !isnumber( aa ) or !isnumber( bb ) then return false end
	aa = math.Clamp( math.Round( aa ), 1, 10 )  bb = math.Clamp( math.Round( bb ), 1, 10 )
	local a1 = ply.xdefm_Trade[ aa ]  local b1 = ply.xdefm_Trade[ bb ]
	if !isstring( a1 ) or !isstring( b1 ) or ( a1 == "_" and b1 == "_" ) then return false end
	local a2, a3 = xdefm_ItemGet( a1 )  local b2, b3 = xdefm_ItemGet( b1 ) if !istable( a3 ) and !istable( b3 ) then return false end
	ply.xdefm_Trade[ aa ] = b1  ply.xdefm_Trade[ bb ] = a1
	if ply:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() and ply:GetNWEntity( "XDEFMod_TPL" ):GetNWEntity( "XDEFMod_TPL" ) == ply then
		xdefm_UpdateMenu( ply:GetNWEntity( "XDEFMod_TPL" ), 5, ply.xdefm_Trade )
	end xdefm_ProfileUpdate( ply ) xdefm_UpdateMenu( ply, 4, ply.xdefm_Trade ) return true
elseif cmd == "TradeMoney" and istable( ply.xdefm_Trade ) then
	local ab = tonumber( dat ) if !isnumber( ab ) or ab < 0 or ab > 2147483647 then return false end
	ab = math.Clamp( math.Round( ab ), 0, 2147483647 )  local mn, dl = ply.xdefm_Profile.Money, ply.xdefm_Trade[ 11 ]
	ab = ab -ply.xdefm_Trade[ 11 ]  if ab == 0 then return false end
	if ab > 0 then if !ply:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() or ply:GetNWEntity( "XDEFMod_TPL" ):GetNWEntity( "XDEFMod_TPL" ) != ply then
		xdefm_AddNote( ply, "xdefm.NotTrading", "resource/warning.wav", "cross", 5 ) return false end
		ab = math.min( mn, ab )  ply.xdefm_Trade[ 11 ] = ply.xdefm_Trade[ 11 ] +ab
		ply.xdefm_Profile.Money = ply.xdefm_Profile.Money -ab
		xdefm_ProfileUpdate( ply ) xdefm_UpdateMenu( ply, 4, ply.xdefm_Trade )
		if ply:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() and ply:GetNWEntity( "XDEFMod_TPL" ):GetNWEntity( "XDEFMod_TPL" ) == ply then
			xdefm_UpdateMenu( ply:GetNWEntity( "XDEFMod_TPL" ), 5, ply.xdefm_Trade )
		end
	else ab = math.abs( ab )  ply.xdefm_Trade[ 11 ] = ply.xdefm_Trade[ 11 ] -ab
		ply.xdefm_Profile.Money = ply.xdefm_Profile.Money +ab
		xdefm_ProfileUpdate( ply ) xdefm_UpdateMenu( ply, 4, ply.xdefm_Trade )
		if ply:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() and ply:GetNWEntity( "XDEFMod_TPL" ):GetNWEntity( "XDEFMod_TPL" ) == ply then
			xdefm_UpdateMenu( ply:GetNWEntity( "XDEFMod_TPL" ), 5, ply.xdefm_Trade )
		end
	end return true
elseif cmd == "TradeToggle" and istable( ply.xdefm_Trade ) then local tar = ply:GetNWEntity( "XDEFMod_TPL" )  ply.xdefm_Cool = CurTime() + 0.9
	if !tar:IsPlayer() or tar:GetNWEntity( "XDEFMod_TPL" ) != ply then ply:SetNWFloat( "XDEFMod_RTT", 0 )
	else ply:SetNWFloat( "XDEFMod_RTT", ply:GetNWFloat( "XDEFMod_RTT" ) != 1 and 1 or 0 ) end local tpl = ply:GetNWEntity( "XDEFMod_TPL" )
	if tpl:IsPlayer() and tpl:GetNWEntity( "XDEFMod_TPL" ) == ply then
		xdefm_UpdateMenu( tpl, 6, { ply:Nick(), ply:SteamID64(), ply:GetNWFloat( "XDEFMod_RTT" ) } )
		xdefm_SendSnd( tpl, "buttons/lightswitch2.wav" ) end return true
elseif cmd == "ResetSkp" then ply.xdefm_SkpCool = CurTime() +GetConVar( "xdefmod_skpcool" ):GetInt() -0.5
	local pro = ply.xdefm_Profile  local skp = pro.Skp  if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" then
		local rd = wep.FMod_Rod  local bb = wep.FMod_Bobber  local hk = wep.FMod_Hook
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end for k, v in pairs( xdefm.miscs.Costs ) do local pts = pro[ "Upd"..k ] if !isnumber( pts ) or pts <= 0 then continue end
		skp = skp +v*pts  ply.xdefm_Profile[ "Upd"..k ] = 0
	end xdefm_AddNote( ply, "xdefm.ClearedP", "buttons/button15.wav", "lightning_go", 5 )
	if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" and IsValid( wep.FMod_Rod ) then wep.FMod_Rod:Remove() end
	ply.xdefm_Profile[ "Skp" ] = skp  xdefm_ProfileUpdate( ply ) return true
elseif cmd == "BuyBait" then
	local pro = ply.xdefm_Profile  local mon, lvl = ply.xdefm_Profile.Money, ply.xdefm_Profile.Level  local slo = xdefm.shop[ dat ] if !istable( slo ) then return false end
	local prc = math.ceil( slo[ 1 ] * slo[ 3 ] ) if mon < prc or lvl < slo[ 2 ] then return false end local slo = 0
	for k, v in pairs( pro.Items ) do if v == "_" then slo = k break end end
	if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" and slo == 21 then
		local rd = wep.FMod_Rod  local bb = wep.FMod_Bobber  local hk = wep.FMod_Hook
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end end
	if xdefm_ItemGive( ply, dat ) then ply.xdefm_Profile.Money = mon -prc
		ply.xdefm_Profile.TBuy = ply.xdefm_Profile.TBuy+1  xdefm_ProfileUpdate( ply )
	return true end
elseif cmd == "MoveCraft" then local aa = tonumber( dat )  if !isnumber( aa ) then return end
	local wep = ply:GetWeapon( "weapon_xdefm_rod" )  if aa == 21 and IsValid( wep ) then
		local rd = wep.FMod_Rod  local bb = wep.FMod_Bobber  local hk = wep.FMod_Hook
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end local a1, b1 = ply.xdefm_Profile.Items[ aa ], ply.xdefm_Recipe or "_"
	if !isstring( a1 ) or ( a1 == "_" and b1 == "_" ) then return end
	local a2, a3 = xdefm_ItemGet( a1 )
	if istable( a3 ) and a3.Type != "Recipe" then
		xdefm_AddNote( ply, "xdefm.NotRecipe& "..xdefm_ItemMark( a1 ).." &xdefm.NotRecip2", "resource/warning.wav", "cross", 5 ) return false end
	ply.xdefm_Recipe = a1
	ply.xdefm_Profile.Items[ aa ] = b1
	if isstring( b1 ) and b1 != "_" then net.Start( "NET_xdefm_BestiaryRecord" ) net.WriteString( xdefm_GetClass( b1 ) ) net.Send( ply ) end
	xdefm_ProfileUpdate( ply ) xdefm_UpdateMenu( ply, 9, { ply.xdefm_Recipe } ) return true
elseif cmd == "Craft" then
	local ab = tonumber( dat ) if !isnumber( ab ) then return false end local re = ply.xdefm_Recipe or "_"
	local aa, bb = xdefm_ItemGet( re )  if !istable( bb ) or bb.Type != "Recipe" or !bb.Crafts or !isstring( bb.Crafts[ ab ] ) then return false end
	ply.XDEFM_Cool = CurTime() +0.1  local ing = string.Explode( "&", bb.Crafts[ ab ] )  if !istable( ing ) or #ing < 2 then return false end
	local wep = ply:GetWeapon( "weapon_xdefm_rod" )  if IsValid( wep ) then
		local rd = wep.FMod_Rod  local bb = wep.FMod_Bobber  local hk = wep.FMod_Hook
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end local ite, ned = ply.xdefm_Profile.Items, {}
	for k, v in pairs( ing ) do if k == #ing then break end
		local yes = false
		for m, n in pairs( ite ) do if n == "_" or ned[ m ] != nil then continue end
			if xdefm_GetClass( n ) == v then
				yes = true  ned[ m ] = 0 break
			end
		end if !yes then xdefm_AddNote( ply, "xdefm.NeedMat", "resource/warning.wav", "cross", 5 ) return false end
	end
	for k, v in pairs( ned ) do ply.xdefm_Profile.Items[ k ] = "_" end
	if xdefm_ItemGive( ply, ing[ #ing ], true ) then aa[ 2 ] = tonumber( aa[ 2 ] )
		xdefm_AddNote( ply, "xdefm.Crafted&: &"..xdefm_ItemMark( ing[ #ing ] ), "buttons/lever7.wav", "wrench", 5 )
		ply.xdefm_Profile.TCraft = ( isnumber( ply.xdefm_Profile.TCraft ) and ply.xdefm_Profile.TCraft +1 or 0 )
		xdefm_ProfileUpdate( ply )
		if !isnumber( aa[ 2 ] ) or aa[ 2 ] <= 1 then ply.xdefm_Recipe = "_" else ply.xdefm_Recipe = aa[ 1 ].."|"..( aa[ 2 ] -1 ) end
		xdefm_UpdateMenu( ply, 9, { ply.xdefm_Recipe } )
	end return true
elseif cmd == "Quest" then local dt = ply.xdefm_Quest  if !istable( dt ) or table.IsEmpty( dt ) then return false end
	local rq, rw = ( string.Explode( "&", dt[ 2 ] ) or { dt[ 2 ] } ), ( string.Explode( "&", dt[ 3 ] ) or { dt[ 3 ] } )
	local dl, em, pr, ot = {}, 0, ply.xdefm_Profile.Items, {}  ply.XDEFM_Cool = CurTime() +0.5  local yes = false
	for k, v in pairs( ents.FindInSphere( ply:GetPos(), 512 ) ) do
		if v:GetClass() == "sent_xdefm_quest" or v:GetClass() == "sent_xdefm_darknpc" then yes = true break end
	end if !yes then return false end
	for k, v in pairs( rq ) do
		local yes = false
		for m, n in pairs( pr ) do
			if m != 21 and !dl[ m ] and xdefm_GetClass( n ) == v then
				dl[ m ] = 0
				yes = true
				break
			end
		end if !yes then return false end
	end
	for k, v in pairs( pr ) do
		if k != 21 and ( v == "_" or dl[ k ] ) then
			em = em +1  table.insert( ot, k )
		end
	end if em < #rw then return false end
	for k, v in pairs( dl ) do ply.xdefm_Profile.Items[ k ] = "_" end
	for k, v in pairs( rw ) do
		ply.xdefm_Profile.Items[ ot[ k ] ] = v
		if v != "_" then net.Start( "NET_xdefm_BestiaryRecord" ) net.WriteString( xdefm_GetClass( v ) )
		net.Send( ply ) end
	end
	xdefm_QuestPick( -1, ply ) xdefm_AddNote( ply, "xdefm.Complete", "ui/achievement_earned.wav", "page", 5 )
	ply.xdefm_Profile.TQuest = ( ply.xdefm_Profile.TQuest and ply.xdefm_Profile.TQuest +1 or 1 )
	xdefm_ProfileUpdate( ply ) return true
elseif cmd == "Skip" then local dt = ply.xdefm_Quest  if !istable( dt ) or table.IsEmpty( dt ) then return false end
	if xdefm.skips[ ply:SteamID() ] or ply:GetNWFloat( "XDEFM_QC" ) > CurTime() then return false end ply.XDEFM_Cool = CurTime() +0.5
	xdefm.skips[ ply:SteamID() ] = 0
	local yes = false  for k, v in pairs( ents.FindInSphere( ply:GetPos(), 512 ) ) do
		if v:GetClass() == "sent_xdefm_quest" or v:GetClass() == "sent_xdefm_darknpc" then yes = true break end
	end if !yes then return false end ply:SetNWFloat( "XDEFM_QC", CurTime() +GetConVar( "xdefmod_qsttime" ):GetInt()*60 )
	xdefm_QuestPick( -1, ply ) xdefm_AddNote( ply, "xdefm.Skipped", "npc/vort/claw_swing1.wav", "page_red", 5 )
	ply.xdefm_Profile.TQuest = ( ply.xdefm_Profile.TQuest or 0 )
	xdefm_ProfileUpdate( ply ) return true
elseif cmd == "Convert" then if !DarkRP then xdefm_AddNote( ply, "xdefm.NotRP", "resource/warning.wav", "cross", 5 ) return false end
	local ab = string.Explode( "|", dat ) if !istable( ab ) or #ab != 2 then return false end
	local aa, bb = tonumber( ab[ 1 ] ), tonumber( ab[ 2 ] )
	if !isnumber( aa ) or !isnumber( bb ) or ( bb != 1 and bb != 2 ) or aa <= 0 or aa >= 2147483647 then return false end
	if ( bb == 1 and ply.xdefm_Profile.Money < aa ) or ( bb == 2 and !ply:canAfford( aa ) ) then return false end
	local rat = GetConVar( "xdefmod_darkrp" ):GetFloat()
	local num = math.max( bb == 1 and math.floor( aa*rat*0.99 ) or math.floor( aa/rat*0.99 ), 0 )
	if bb == 1 then
		ply.xdefm_Profile.Money = ply.xdefm_Profile.Money -aa
		ply:addMoney( num )
	else
		ply:addMoney( -aa )
		ply.xdefm_Profile.Money = ply.xdefm_Profile.Money +num
	end
	xdefm_AddNote( ply, "xdefm.Exchanged&: "..( bb == 1 and "-" or "+" )..num, "garrysmod/ui_return.wav", "calculator", 5 )
	xdefm_ProfileUpdate( ply ) return true
elseif cmd == "NPC" then
	local num = tonumber( dat )  if !isnumber( num ) or num < 1 or num > 7 then return false end ply.xdefm_Cool = CurTime() +0.2
	if num == 1 then
		local tak, weps = false, { "inventory", "rod", "trade" }
		for k, v in pairs( weps ) do local www = ( "weapon_xdefm_"..v )
			if !ply:HasWeapon( www ) then ply:Give( www, true ) tak = true end end
		if tak then ply:EmitSound( "AmmoCrate.Open" ) return true else
		for k, v in pairs( weps ) do local www = ( "weapon_xdefm_"..v )
			if ply:HasWeapon( www ) then ply:StripWeapon( www ) end end ply:EmitSound( "AmmoCrate.Close" ) return true end
	elseif num == 2 then
		local prc = 0  local wep = ply:GetWeapon( "weapon_xdefm_rod" )  if aa == 21 and IsValid( wep ) then
			local rd = wep.FMod_Rod  local bb = wep.FMod_Bobber  local hk = wep.FMod_Hook
			if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
		end for k, v in pairs( ply.xdefm_Profile.Items ) do
			prc = prc +xdefm_GetPrice( v )  ply.xdefm_Profile.Items[ k ] = "_"
		end if prc > 0 then xdefm_GiveMoney( ply, prc ) xdefm_AddNote( ply, "xdefm.GetMoney&: "..prc, "!V", "coins", 5 ) end
		xdefm_ProfileUpdate( ply ) return true
	elseif num == 3 then xdefm_OpenMenu( ply, 0, ply.xdefm_Profile ) xdefm_OpenMenu( ply, 5, ply.xdefm_Profile ) return true
	elseif num == 4 then xdefm_OpenMenu( ply, 0, ply.xdefm_Profile ) xdefm_OpenMenu( ply, 9, { ply.xdefm_Recipe or "_" } ) return true
	elseif num == 5 then xdefm_OpenMenu( ply, 8, ply.xdefm_Profile ) return true
	elseif num == 6 then
		if ply:GetNWBool( "XDEFM_QD" ) then xdefm_AddNote( ply, "xdefm.Failed", "resource/warning.wav", "cross", 5 ) return true end local lvl = ( ply.xdefm_Profile.Level or 0 )
		if !istable( ply.xdefm_Quest ) or table.IsEmpty( ply.xdefm_Quest ) then local qst = xdefm_QuestPick( lvl, ply )
		if qst then xdefm_AddNote( ply, "xdefm.QuestSt", "friends/friend_online.wav", "page_add", 5 ) end
		end xdefm_OpenMenu( ply, 1, ply.xdefm_Quest or {} ) xdefm_UpdateMenu( ply, 0, ply.xdefm_Profile ) return true
	elseif num == 7 then
		xdefm_OpenMenu( ply, 2, ply.xdefm_Profile ) return true end return false end
end end
	function xdefm_BreakEffect( ent, typ )
		if !IsEntity( ent ) or !isnumber( typ ) or ent == Entity( 0 ) then return end
		typ = math.max( 0, math.Round( typ ) )
		if SERVER then
			net.Start( "NET_xdefm_BreakEF" )
			net.WriteEntity( ent )
			net.WriteFloat( typ )
			net.Broadcast()
		else
			if !IsValid( ent ) then return end
			local pos = ent:GetPos()
			local aa, bb = ent:WorldSpaceAABB()
			local num = math.Clamp( math.Round( ent:BoundingRadius() / 8 ), 0, 32 )
			for i = 0, num do
				local ef = EffectData()
				ef:SetOrigin( Vector( math.Rand( aa.x, bb.x ), math.Rand( aa.y, bb.y ), math.Rand( aa.z, bb.z ) ) )
				ef:SetMagnitude( typ )
				util.Effect( "xdefm_gib", ef )
			end
		end
	end
	function xdefm_SetMoney( ply, amo, add )
		if !IsValid( ply ) or !istable( ply.xdefm_Profile ) then return end
		amo = isnumber( amo ) and math.Round( amo ) or 0
		if !isbool( add ) then
			add = true
		end
		local def = ply.xdefm_Profile.Money
		if !add then
			ply.xdefm_Profile.Money = amo
		else
			ply.xdefm_Profile.Money = def +amo
			if amo > 0 then
				ply.xdefm_Profile.Total = ply.xdefm_Profile.Total +amo
			end
		end
		xdefm_ProfileUpdate( ply )
	end
	function xdefm_BroadEffect( nam, dat )
		if !isstring( nam ) or !istable( dat ) then return end
		if SERVER then
			net.Start( "NET_xdefm_CLEffect" )
			net.WriteString( nam )
			net.WriteString( util.TableToJSON( dat ) )
			net.Broadcast()
		else
			local eff = EffectData()
			if isangle( dat.Angles ) then eff:SetAngles( dat.Angles ) end
			if isnumber( dat.Attachment ) then eff:SetAttachment( dat.Attachment ) end
			if isnumber( dat.Color ) then eff:SetColor( dat.Color ) end
			if isnumber( dat.DamageType ) then eff:SetDamageType( dat.DamageType ) end
			if isnumber( dat.EntIndex ) then eff:SetEntIndex( dat.EntIndex ) end
			if IsEntity( dat.Entity ) then eff:SetEntity( dat.Entity ) end
			if isnumber( dat.Flags ) then eff:SetFlags( dat.Flags ) end
			if isnumber( dat.HitBox ) then eff:SetHitBox( dat.HitBox ) end
			if isnumber( dat.Magnitude ) then eff:SetMagnitude( dat.Magnitude ) end
			if isnumber( dat.Scale ) then eff:SetScale( dat.Scale ) end
			if isnumber( dat.Radius ) then eff:SetRadius( dat.Radius ) end
			if isnumber( dat.MaterialIndex ) then eff:SetMaterialIndex( dat.MaterialIndex ) end
			if isvector( dat.Normal ) then eff:SetNormal( dat.Normal ) end
			if isvector( dat.Origin ) then eff:SetOrigin( dat.Origin ) end
			if isvector( dat.Start ) then eff:SetStart( dat.Start ) end
			if isnumber( dat.SurfaceProp ) then eff:SetSurfaceProp( dat.SurfaceProp ) end
			util.Effect( nam, eff )
		end
	end

	hook.Add( "StartCommand", "xdefm_Move", function( ply, cmd )
		if IsValid( ply ) and ply:Alive() and IsValid( ply:GetActiveWeapon() ) and ply:GetActiveWeapon():GetClass() == "weapon_xdefm_rod" then
			local wep = ply:GetActiveWeapon()
			if CLIENT and cmd:GetMouseWheel() != 0 then
				xdefm.miscs.LFOV = math.Clamp( xdefm.miscs.LFOV -cmd:GetMouseWheel()/10, 0.25, 5 )
			end
		end
		if SERVER and IsValid( ply ) then
			if IsValid( ply.xdefm_Struct ) and ply.xdefm_Struct:GetClass() == "xdefm_base" and ply:GetPos():Distance( ply.xdefm_Struct:GetPos() ) > 300 then local usi = ply.xdefm_Struct
				xdefm_CloseMenu( v, "Struct" )
			end
			if ply:GetNWFloat( "XDEFM_QC" ) > 0 and ply:GetNWFloat( "XDEFM_QC" ) <= CurTime() then
				ply:SetNWFloat( "XDEFM_QC", 0 ) ply:SetNWBool( "XDEFM_QD", false ) xdefm.skips[ ply:SteamID() ] = nil
			end
			local usi, usn = ply:GetNWEntity( "XDEFM_Using" ), ply.xdefm_Using
			local trd = ply:GetNWEntity( "XDEFMod_TPL" )
			if IsValid( trd ) and trd:IsPlayer() and trd:Alive() and trd:HasWeapon( "weapon_xdefm_trade" ) and trd:GetNWEntity( "XDEFMod_TPL" ) == ply and
			trd:WorldSpaceCenter():DistToSqr( ply:WorldSpaceCenter() ) < 70000 and ply:HasWeapon( "weapon_xdefm_trade" ) and !ply:GetNWBool( "XDEFMod_BTD" ) and !trd:GetNWBool( "XDEFMod_BTD" ) then
				if !ply.xdefm_HasTPL then
					ply.xdefm_HasTPL = true
					xdefm_UpdateMenu( ply, 6, { trd:Nick(), trd:SteamID64(), false } )
					xdefm_AddNote( ply, "xdefm.Trade15&"..trd:Nick().."&xdefm.Trade16", "garrysmod/content_downloaded.wav", "arrow_refresh", 5 )
					if !istable( ply.xdefm_Trade ) then ply.xdefm_Trade = { "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", 0 } end
					if !istable( trd.xdefm_Trade ) then trd.xdefm_Trade = { "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", 0 } end
					xdefm_UpdateMenu( ply, 5, trd.xdefm_Trade )
					xdefm_UpdateMenu( ply, 4, ply.xdefm_Trade )
				end
			elseif ply.xdefm_HasTPL then
				ply.xdefm_HasTPL = nil
				xdefm_UpdateMenu( ply, 6, { "_", nil, false } )
				ply:SetNWFloat( "XDEFMod_RTT", 2 )
			end
		end
	end )
	hook.Add( "CanTool", "xdefm_NoTool", function( ply, tr, toolname, tool, button )
		if IsValid( tr.Entity ) and ( tr.Entity:GetNWString( "xdefm_Data" ) != "" or string.find( tr.Entity:GetClass():lower(), "xdefm_" ) ) then
			return true
		end
	end )
	hook.Add( "PlayerButtonDown", "xdefm_QuickInv", function( ply, key )
		if ( CLIENT or game.SinglePlayer() ) and key == GetConVar( "xdefmod_quickinv" ):GetInt() then
			xdefm_ConsoleCmd( "xdefmod_openinv", {}, ply )
		end
	end )
end
concommand.Add( "xdefmod_note", function( ply, cmd, var ) xdefm_ConsoleCmd( cmd, var, ply ) end )
concommand.Add( "xdefmod_give", function( ply, cmd, var ) xdefm_ConsoleCmd( cmd, var, ply ) end )
concommand.Add( "xdefmod_spawn", function( ply, cmd, var ) xdefm_ConsoleCmd( cmd, var, ply ) end )
concommand.Add( "xdefmod_firespot", function( ply, cmd, var ) xdefm_ConsoleCmd( cmd, var, ply ) end )
concommand.Add( "xdefmod_count", function( ply, cmd, var ) local num = 0  for k, v in pairs( xdefm.items ) do num = num +1 end print( num ) end )
concommand.Add( "xdefmod_openinv", function( ply, cmd, var ) xdefm_ConsoleCmd( cmd, {}, ply ) end )
concommand.Add( "xdefmod_openbnk", function( ply, cmd, var ) xdefm_ConsoleCmd( cmd, {}, ply ) end )
concommand.Add( "xdefmod_openfri", function( ply, cmd, var ) xdefm_ConsoleCmd( cmd, {}, ply ) end )
concommand.Add( "xdefmod_opentrd", function( ply, cmd, var ) xdefm_ConsoleCmd( cmd, {}, ply ) end )
concommand.Add( "xdefmod_openbes", function( ply, cmd, var ) xdefm_ConsoleCmd( cmd, {}, ply ) end )
concommand.Add( "xdefmod_opencft", function( ply, cmd, var ) xdefm_ConsoleCmd( cmd, {}, ply ) end )
concommand.Add( "xdefmod_opendrp", function( ply, cmd, var ) xdefm_ConsoleCmd( cmd, {}, ply ) end )
concommand.Add( "xdefmod_collectall", function( ply, cmd, var ) xdefm_ConsoleCmd( cmd, {}, ply ) end, nil, nil, FCVAR_PROTECTED )
concommand.Add( "xdefmod_collectclear", function( ply, cmd, var ) xdefm_ConsoleCmd( cmd, {}, ply ) end, nil, nil, FCVAR_PROTECTED )
if CLIENT then -- xdefm_gib
	local Mats = { [ "1" ] = "wood", [ "2" ] = "glass", [ "3" ] = "metal", [ "4" ] = "concrete", [ "5" ] = "flesh" }
	local Gibs = {
		[ "1" ] = {
			"models/gibs/wood_gib01c.mdl", "models/gibs/wood_gib01d.mdl", "models/gibs/wood_gib01e.mdl",
		},
		[ "2" ] = {
			"models/gibs/glass_shard01.mdl", "models/gibs/glass_shard02.mdl", "models/gibs/glass_shard03.mdl",
			"models/gibs/glass_shard04.mdl", "models/gibs/glass_shard05.mdl", "models/gibs/glass_shard06.mdl"
		},
		[ "3" ] = {
			"models/gibs/metal_gib1.mdl", "models/gibs/metal_gib2.mdl", "models/gibs/metal_gib3.mdl",
			"models/gibs/metal_gib4.mdl", "models/gibs/metal_gib5.mdl"
		},
		[ "4" ] = {
			"models/props_debris/concrete_chunk09a.mdl", "models/props_debris/concrete_chunk03a.mdl"
		},
		[ "5" ] = {
			"models/gibs/antlion_gib_medium_2.mdl", "models/gibs/antlion_gib_small_2.mdl", "models/gibs/antlion_gib_small_1.mdl",
			"models/gibs/antlion_gib_medium_3.mdl", "models/gibs/antlion_gib_medium_1.mdl"
		},
	}
	local EFFECT = {}
	function EFFECT:Init( data )
		local Mag = data:GetMagnitude() if !istable( Gibs[ tostring( Mag ) ] ) then return end local gg = Gibs[ tostring( Mag ) ]
		self.Entity:SetModel( gg[ math.random( #gg ) ] ) self.Entity:PhysicsInit( SOLID_VPHYSICS ) self.Entity:SetRenderMode( RENDERMODE_TRANSCOLOR )
		self.Entity:SetCollisionGroup( COLLISION_GROUP_DEBRIS ) self.Entity:SetCollisionBounds( Vector( -128 -128, -128 ), Vector( 128, 128, 128 ) )
		self.Entity:SetModelScale( math.Rand( 0.5, 1 ) ) self.Entity:SetRenderMode( RENDERMODE_TRANSCOLOR )
		local phys = self.Entity:GetPhysicsObject()  if IsValid( phys ) then
			phys:Wake() phys:EnableMotion( true )
			phys:SetMaterial( Mats[ tostring( Mag ) ] )
			phys:SetAngles( Angle( math.Rand( 0, 360 ), math.Rand( 0, 360 ), math.Rand( 0, 360 ) ) )
			local vel = VectorRand():GetNormalized()*math.Rand( 50, 150 )  vel = Vector( vel.x, vel.y, math.abs( vel.z ) )
			phys:SetVelocity( vel ) phys:Wake()
		end if Mag == 5 then self.Entity:SetMaterial( "models/flesh" ) end
		self.LifeTime = CurTime() + math.Rand( 3, 5 )  self.LifeAlp = 255  self.xdefm_Allow = true
	end
	function EFFECT:PhysicsCollide( data, physobj ) end
	function EFFECT:Think() if !self.xdefm_Allow then return false end local own = self.Entity
		if self.LifeTime < CurTime() then  self.LifeAlp = Lerp( 0.05, self.LifeAlp, 0 )
			self.Entity:SetColor( Color( own:GetColor().r, own:GetColor().g, own:GetColor().b, self.LifeAlp ) )
			if self.LifeAlp <= 1 then return false end
		end return true
	end
	function EFFECT:Render() if self.xdefm_Allow then self.Entity:DrawModel() end end
	effects.Register( EFFECT, "xdefm_gib" ) end
if true then -- xdefm_base
	local ENT = {}  ENT.Base = "base_anim"  ENT.PrintName = ""  ENT.Spawnable = false  ENT.xdefm_Hold = {}
	ENT.RenderGroup = RENDERGROUP_BOTH  ENT.Owner = nil  ENT.xdefm_T1 = {}  ENT.xdefm_T2 = {}  ENT.xdefm_OnLook = false  ENT.xdefm_Cur = 0
	function ENT:SetupDataTables() self:NetworkVar( "Entity", 0, "FMod_OW" ) self:NetworkVar( "String", 0, "FMod_OI" )
	self:NetworkVar( "String", 1, "FMod_DT" ) self:NetworkVar( "Entity", 1, "FMod_LU" ) end
	function ENT:Initialize() if !SERVER then return end self:SetCollisionGroup( COLLISION_GROUP_NONE ) self:SetUseType( SIMPLE_USE )
		if !isstring( self:GetFMod_DT() ) or self:GetFMod_DT() == "" then self:Remove() return end
		local aa, bb = xdefm_ItemGet( self:GetFMod_DT() )  if !istable( aa ) or !istable( bb ) then self:Remove() return end
		self.xdefm_T1 = aa  self.xdefm_T2 = bb  local tab = string.Explode( "|", self:GetFMod_DT() )
		if bb.Type == "Creature" and isnumber( bb.MinSize ) and isnumber( bb.MaxSize ) and ( !istable( tab ) or #tab < 2 or tab[ 2 ] == 0 ) then
			local siz = math.Round( math.Rand( bb.MinSize, bb.MaxSize ), 1 ) if !istable( tab ) then tab = { self:GetFMod_DT() } end
			table.insert( tab, 2, siz ) self:SetFMod_DT( table.concat( tab, "|" ) )
		elseif bb.Type == "Recipe" and isnumber( bb.Durability ) and ( !istable( tab ) or #tab < 2 or tab[ 2 ] == 0 ) then
			local dur = math.ceil( math.Rand( bb.Durability/2, bb.Durability ) ) if !istable( tab ) then tab = { self:GetFMod_DT() } end
			table.insert( tab, 2, dur ) self:SetFMod_DT( table.concat( tab, "|" ) )
		elseif bb.Type == "Struct" and bb.SType == 1 and bb.Amount > 0 then self.xdefm_T3 = {}
			for i=1, bb.Amount do self.xdefm_T3[ i ] = "_" end
		end local tab = string.Explode( "|", self:GetFMod_DT() )
		if bb.Type != "Bait" and ( !istable( tab ) or #tab != xdefm.miscs.Types[ bb.Type ] ) then self:SetFMod_DT( self:GetFMod_DT().."|0" ) end
		if bb.Type == "Creature" and istable( tab ) and isnumber( tonumber( tab[ 2 ] ) ) then self:SetModelScale( tonumber( tab[ 2 ] ), 0.01 ) end
		if isstring( self.xdefm_Mdl ) then self:SetModel( self.xdefm_Mdl ) else
		self:SetModel( bb.Model[ math.random( #bb.Model ) ] ) end local ovrd = self.xdefm_T2:OnInit( self )
		if !ovrd then self:PhysicsInit( SOLID_VPHYSICS ) self:SetMoveType( MOVETYPE_VPHYSICS )
			self:SetRenderMode( RENDERMODE_TRANSCOLOR )  if IsValid( self:GetPhysicsObject() ) then self:GetPhysicsObject():Wake()
				self:GetPhysicsObject():AddGameFlag( FVPHYSICS_NO_IMPACT_DMG )
				self:GetPhysicsObject():AddGameFlag( FVPHYSICS_NO_NPC_IMPACT_DMG ) end
		end timer.Simple( 0.1, function() if IsValid( self ) then bb:OnReady( self ) end end ) self:Activate()
	end
	function ENT:HandleAnimEvent() return true end
	function ENT:OnRemove() if CLIENT or !istable( self.xdefm_T2 ) then return end self.xdefm_T2:OnRemove( self )
		if self.xdefm_T2.Type == "Struct" then
			for k, v in pairs( player.GetHumans() ) do if v.xdefm_Struct == self then xdefm_CloseMenu( v, "Struct" ) end end
		end
	end
	function ENT:OnDuplicated() SafeRemoveEntity( self ) end
	function ENT:OnRestore() if SERVER then SafeRemoveEntity( self ) end end
	function ENT:OnTakeDamage( dmg ) if !istable( self.xdefm_T2 ) or dmg:GetDamage() <= 0 then return end local aa, bb = xdefm_ItemGet( self:GetFMod_DT() )
		local yes = self.xdefm_T2:OnDamaged( self, dmg ) if !isbool( yes ) or yes == true then self:TakePhysicsDamage( dmg ) end
	end
	function ENT:TurnToDummy() if CLIENT then return nil end
		local dum = ents.Create( "xdefm_dummy" )  dum:SetModel( self:GetModel() )
		dum:SetAngles( self:GetAngles() ) dum:SetPos( self:GetPos() ) dum:SetFMod_DT( self:GetFMod_DT() ) dum:Spawn() dum:Activate()
		self.OnRemove = function() end dum:SetFMod_OW( self:GetFMod_OW() ) dum:SetFMod_OI( self:GetFMod_OI() )
		SafeRemoveEntity( self ) return dum
	end
	function ENT:Use( ent ) if !IsValid( ent ) or !istable( self.xdefm_T2 ) or !ent:IsPlayer() or ent:KeyDown( IN_RELOAD ) then return end local owi = self:GetFMod_OI()
		if !xdefm_CanInteract( ent, self ) or ( !xdefm_FriendAllow( ent, owi ) and !xdefm_NadAllow( ent, self ) ) then return end
		if self.xdefm_T2.Type == "Struct" and self.xdefm_T2.SType != 0 and !ent:IsBot() then
			local act = self.xdefm_T2.OnInteract and self.xdefm_T2:OnInteract( self, ent, 1 ) or nil
			if act == false or IsValid( ent.xdefm_Struct ) then return end local ttt, dat = self.xdefm_T2.SType, {}
			if !ent:KeyDown( IN_SPEED ) then
				if ttt == 1 then dat = { xdefm_GetClass( self ), unpack( self.xdefm_T3 ) } else dat = { xdefm_GetClass( self ) } end
				xdefm_OpenMenu( ent, 0, ent.xdefm_Profile ) xdefm_OpenMenu( ent, 4, dat ) ent.xdefm_Struct = self
				if self.xdefm_T2.StartSound then self:EmitSound( self.xdefm_T2.StartSound ) end if act != true then return end
			end
		end
		local use = self.xdefm_T2:OnUse( self, ent )  local typ = self.xdefm_T2.Type
		if ( !isbool( use ) or use != false ) and !ent:IsPlayerHolding() then
			if !constraint.FindConstraint( self, "Weld" ) and IsValid( self:GetPhysicsObject() ) and !self:IsPlayerHolding()
			and self:GetPhysicsObject():IsMotionEnabled() and ( !ent.xdefm_Cool or ent.xdefm_Cool <= CurTime() ) then ent:PickupObject( self ) end
		end
	end
	function ENT:StartTouch( ent ) if !IsValid( ent ) or !istable( self.xdefm_T2 ) then return end local tab = self.xdefm_T2
		tab:OnTouch( self, ent, 1 )
	end
	function ENT:Touch( ent ) if !IsValid( ent ) or !istable( self.xdefm_T2 ) then return end
		if ent:GetClass() == "xdefm_base" and !xdefm_FriendAllow( ent:GetFMod_OW(), self:GetFMod_OI() ) and !xdefm_NadAllow( ent:GetFMod_OW(), self ) then return end
		self.xdefm_T2:OnTouch( self, ent, 0 )
	end
	function ENT:EndTouch( ent ) if !IsValid( ent ) or !istable( self.xdefm_T2 ) then return end
		self.xdefm_T2:OnTouch( self, ent, -1 )
	end
	function ENT:PhysicsCollide( dat, phy ) if !istable( self.xdefm_T2 ) or !IsValid( self:GetPhysicsObject() ) then return end
		local col = self.xdefm_T2:OnCollide( self, dat )  if isbool( col ) and col == false then return end
		if isstring( self.xdefm_T2.PhysSound ) and dat.Speed >= 60 and dat.DeltaTime > 0.2 then
			self:StopSound( self.xdefm_T2.PhysSound ) self:EmitSound( self.xdefm_T2.PhysSound )
		end
	end
	function ENT:PhysicsSimulate( phy, del ) if !istable( self.xdefm_T2 ) then return end
		self.xdefm_T2:OnPhysSimulate( self, phy, del )
	end
	function ENT:Think() if !istable( self.xdefm_T2 ) then return end
		if CLIENT then local ply = LocalPlayer()  self:NextThink( CurTime() +0.1 )  if !IsValid( ply ) then return end
			self:NextThink( CurTime() +0.1 )
			if self.xdefm_OnLook != self:BeingLookedAtByLocalPlayer() then
				self.xdefm_OnLook = self:BeingLookedAtByLocalPlayer()
				self.xdefm_Cur = SysTime() +0.25
			end
			local aa, bb = xdefm_ItemGet( self:GetFMod_DT() )
			if istable( bb ) and self.xdefm_OnLook or self.xdefm_Cur > SysTime() then
				local alp = math.Clamp( ( self.xdefm_Cur -SysTime() )/0.25, 0, 1 )
				if self.xdefm_OnLook then alp = 1-alp end
				local col = xdefm.miscs.Rarity[ bb.Rarity+1 ]
				halo.Add( { self }, Color( col.r, col.g, col.b, 255*alp ), 2*alp, 2*alp, 2*alp, true, true )
			end
		else self.xdefm_T2:OnThink( self ) self:NextThink( CurTime() +self.xdefm_T2.TickRate ) local tab = self.xdefm_T2 end
		return true
	end
	if CLIENT then local Mat = Material( "models/shiny" )
		function ENT:Draw() if isstring( self:GetFMod_DT() ) and self:GetFMod_DT() != "" and self:GetFMod_DT() != "_" then
			local aa, bb = xdefm_ItemGet( self:GetFMod_DT() ) if istable( bb ) then local dis = GetConVar( "xdefmod_renderdist" ):GetInt()
			local ply, wep = LocalPlayer(), LocalPlayer():GetActiveWeapon()
			if !IsValid( LocalPlayer() ) or dis <= 0 or LocalPlayer():GetPos():DistToSqr( self:GetPos() ) <= dis^2 then self:DrawModel()
			if bb.Type != "Bait" and !bb.CantCook then local me2, per = xdefm_CookMeter( self:GetFMod_DT() ), 0
				if me2 > 0 then render.SetColorModulation( 1, 1, 0 ) per = me2*0.4 elseif me2 < 0 then per = 0.4 +math.abs( me2 )*0.5
					local aaa = math.abs( 1 +me2 ) render.SetColorModulation( aaa, aaa, 0 )
				end if per > 0 then render.SetBlend( per ) render.MaterialOverride( Mat )
				self:DrawModel() render.SetBlend( 1 ) render.MaterialOverride() render.SetColorModulation( 1, 1, 1 ) end
			end bb:OnDraw( self ) end
		end end end
		function ENT:BeingLookedAtByLocalPlayer() local ply = LocalPlayer() if !IsValid( ply ) or !ply:Alive() then return false end
			local view = ply:GetViewEntity()  local dist = math.Clamp( math.ceil( GetConVar( "xdefmod_tagdist" ):GetInt() )^2, -1, 2147483647 )
			if view:IsPlayer() then return ( ( view:EyePos():DistToSqr( self:GetPos() ) <= dist or dist == -1 ) and view:GetEyeTrace().Entity == self ) end return false
		end
	end
	scripted_ents.Register( ENT, "xdefm_base" ) end
if true then -- xdefm_dummy
	local ENT = {}  ENT.Base = "base_anim"  ENT.PrintName = ""  ENT.Spawnable = false
	ENT.RenderGroup = RENDERGROUP_BOTH  ENT.Owner = nil  ENT.xdefm_T1 = {}  ENT.xdefm_T2 = {}
	function ENT:SetupDataTables() self:NetworkVar( "String", 1, "FMod_DT" ) self:NetworkVar( "String", 2, "FMod_OI" )
	self:NetworkVar( "Entity", 0, "FMod_OW" ) end
	function ENT:Initialize() if !SERVER then return end
		if !isstring( self:GetFMod_DT() ) or self:GetFMod_DT() == "" then self:Remove() return end
		local aa, bb = xdefm_ItemGet( self:GetFMod_DT() )  if !istable( aa ) or !istable( bb ) then self:Remove() return end
		self.xdefm_T1 = aa  self.xdefm_T2 = bb  local tab = string.Explode( "|", self:GetFMod_DT() )
		if bb.Type == "Creature" and isnumber( bb.MinSize ) and isnumber( bb.MaxSize ) and ( !istable( tab ) or #tab < 2 or tab[ 2 ] == 0 ) then
			local siz = math.Round( math.Rand( bb.MinSize, bb.MaxSize ), 1 ) if !istable( tab ) then tab = { self:GetFMod_DT() } end
			table.insert( tab, 2, siz ) self:SetFMod_DT( table.concat( tab, "|" ) )
		elseif bb.Type == "Recipe" and isnumber( bb.Durability ) and ( !istable( tab ) or #tab < 2 or tab[ 2 ] == 0 ) then
			local dur = math.ceil( math.Rand( bb.Durability/2, bb.Durability ) ) if !istable( tab ) then tab = { self:GetFMod_DT() } end
			table.insert( tab, 2, dur ) self:SetFMod_DT( table.concat( tab, "|" ) )
		elseif bb.Type == "Struct" and bb.SType == 1 and bb.Amount > 0 then self.xdefm_T3 = {}
			for i=1, bb.Amount do self.xdefm_T3[ i ] = "_" end
		end local tab = string.Explode( "|", self:GetFMod_DT() )
		if bb.Type != "Bait" and ( !istable( tab ) or #tab != xdefm.miscs.Types[ bb.Type ] ) then self:SetFMod_DT( self:GetFMod_DT().."|0" ) end
		if bb.Type == "Creature" and istable( tab ) and isnumber( tonumber( tab[ 2 ] ) ) then self:SetModelScale( tonumber( tab[ 2 ] ), 0.01 ) end
		self:SetNotSolid( true ) self:Activate()
	end
	function ENT:OnDuplicated() SafeRemoveEntity( self ) end
	function ENT:OnRestore() if SERVER then SafeRemoveEntity( self ) end end
	function ENT:Think() if CLIENT then return end if !istable( self.xdefm_T2 ) then self:Remove() return false end
		if !self:IsInWorld() then self:Remove() return false end self:NextThink( CurTime() +0.1 ) return true
	end
	function ENT:TurnToItem()
		local ite = xdefm_ItemSpawn( self:GetFMod_DT(), self:GetPos(), self:GetAngles(), own, self:GetModel() )
		if IsValid( ite ) then ite:SetFMod_OW( self:GetFMod_OW() ) ite:SetFMod_OI( self:GetFMod_OI() )
			if NADMOD and self:GetFMod_OW():IsPlayer() then NADMOD.PlayerMakePropOwner( self:GetFMod_OW(), ent ) end
			ite:SetNWEntity( "Owner", self:GetFMod_OW() )  ite.Owner = self:GetFMod_OW()
			self:Remove() return ite end self:Remove()
	end
	if CLIENT then local Mat = Material( "models/shiny" )
		function ENT:Draw() if isstring( self:GetFMod_DT() ) and self:GetFMod_DT() != "" and self:GetFMod_DT() != "_" then
			local aa, bb = xdefm_ItemGet( self:GetFMod_DT() ) if istable( bb ) then local dis = GetConVar( "xdefmod_renderdist" ):GetInt()
			local ply, wep = LocalPlayer(), LocalPlayer():GetActiveWeapon()  self:DrawModel()
			if !IsValid( LocalPlayer() ) or dis <= 0 or LocalPlayer():GetPos():DistToSqr( self:GetPos() ) <= dis^2 then
			if bb.Type != "Bait" and !bb.CantCook then local me2, per = xdefm_CookMeter( self:GetFMod_DT() ), 0
				if me2 > 0 then render.SetColorModulation( 1, 1, 0 ) per = me2*0.4 elseif me2 < 0 then per = 0.4 +math.abs( me2 )*0.5
					local aaa = math.abs( 1 +me2 ) render.SetColorModulation( aaa, aaa, 0 )
				end if per > 0 then render.SetBlend( per ) render.MaterialOverride( Mat )
				self:DrawModel() render.SetBlend( 1 ) render.MaterialOverride() render.SetColorModulation( 1, 1, 1 ) end
			end bb:OnDraw( self ) end
		end end end
		function ENT:BeingLookedAtByLocalPlayer() local ply = LocalPlayer() if !IsValid( ply ) or !ply:Alive() then return false end
			local view = ply:GetViewEntity()  local dist = math.Clamp( math.ceil( GetConVar( "xdefmod_tagdist" ):GetInt() )^2, -1, 2147483647 )
			if view:IsPlayer() then return ( ( view:EyePos():DistToSqr( self:GetPos() ) <= dist or dist == -1 ) and view:GetEyeTrace().Entity == self ) end return false
		end
	end
	scripted_ents.Register( ENT, "xdefm_dummy" ) end
if true then -- xdefm_firespot
	local ENT = {}  ENT.Base = "base_anim"  ENT.PrintName = ""  ENT.Spawnable = false
	ENT.RenderGroup = RENDERGROUP_TRANSLUCENT  ENT.xdefm_NextBurn = 0  ENT.xdefm_Power = -1
	function ENT:SetupDataTables() self:NetworkVar( "Bool", 0, "FMod_Enable" ) self:NetworkVar( "Float", 0, "FMod_Strength" ) end
	function ENT:Initialize() if !SERVER then return end self:SetModel( "models/hunter/plates/plate.mdl" )
		self:SetNotSolid( true ) self:SetFMod_Enable( false ) self:SetMoveType( MOVETYPE_NONE )
		self:DrawShadow( false ) self:SetFMod_Strength( 5 ) self:Activate()
	end
	function ENT:OnDuplicated() SafeRemoveEntity( self ) end
	function ENT:OnRestore() if SERVER then SafeRemoveEntity( self ) end end
	function ENT:OnTakeDamage( dmg ) end function ENT:Use( ent ) end
	function ENT:Think() if CLIENT or !self:GetFMod_Enable() then return end self:NextThink( CurTime() +0.1 )
		if self.xdefm_NextBurn <= CurTime() and self.xdefm_Power > 0 then self.xdefm_NextBurn = CurTime() +math.Rand( 0.1, 0.5 )
			local own = ( IsValid( self:GetParent() ) and self:GetParent() or Entity( 0 ) )
			local siz = math.Clamp( self:GetFMod_Strength(), 1, 100 )  local tr = util.TraceHull( {
				start = self:WorldSpaceCenter() +Vector( 0, 0, siz ), endpos = self:WorldSpaceCenter() +Vector( 0, 0, siz*3 ),
				filter = { own, self }, mask = MASK_SHOT, mins = Vector( -siz, -siz, -siz ), maxs = Vector( siz, siz, siz )
			} ) local ent = tr.Entity  if IsValid( ent ) and !ent:IsWorld() and util.IsValidModel( ent:GetModel() ) then
				if ent:GetClass() != "xdefm_base" or !istable( ent.xdefm_T2 ) or ent.xdefm_T2.Type == "Bait" or ent:Health() > 0 then
					local dmg = DamageInfo() dmg:SetDamage( self.xdefm_Power ) dmg:SetAttacker( Entity( 0 ) )
					dmg:SetInflictor( self ) dmg:SetDamageType( DMG_BURN ) local vel = VectorRand():GetNormalized()*1000
					dmg:SetDamageForce( Vector( vel.x, vel.y, 1000 ) ) dmg:SetDamagePosition( tr.HitPos ) ent:TakeDamageInfo( dmg )
				else xdefm_CookAdd( ent, self.xdefm_Power ) end
			end
		end
	end
	if CLIENT then
		ENT.xdefm_Emitter = nil  ENT.xdefm_NextEmit = 0
		local Mat = Material( "sprites/light_glow02_add" ) Mat:SetInt( "$ignorez", 1 )  local Mat2 = Material( "debug/debugwireframevertexcolor" )
		function ENT:Draw() self:SetRenderBounds( Vector( -256, -256, -256 ), Vector( 256, 256, 256 ) ) self:DrawShadow( false )
			local dis = GetConVar( "xdefmod_renderdist" ):GetInt()
			if !( !IsValid( LocalPlayer() ) or dis <= 0 or LocalPlayer():GetPos():DistToSqr( self:GetPos() ) <= dis^2 ) then return end
			if GetConVar( "developer" ):GetInt() > 0 then
				cam.IgnoreZ( true ) render.SetMaterial( Mat2 )
				render.DrawBox( self:GetPos(), self:GetAngles(), self:OBBMins(), self:OBBMaxs(), Color( 255, 255, 0 ) )
				render.DrawBox( self:GetPos(), self:GetAngles(), self:OBBMaxs(), self:OBBMins(), Color( 255, 255, 0 ) )
				cam.IgnoreZ( false )
			end
			if self.xdefm_Emitter == nil then self.xdefm_Emitter = ParticleEmitter( self:WorldSpaceCenter() ) end
			if self.xdefm_Emitter != nil and self:GetFMod_Enable() and self:GetFMod_Strength() > 0 then
				local siz, emt = math.Clamp( self:GetFMod_Strength(), 1, 100 ), self.xdefm_Emitter
				local own = ( IsValid( self:GetParent() ) and self:GetParent() or Entity( 0 ) )
				if GetConVar( "developer" ):GetInt() > 0 then
					local tr = util.TraceHull( {
						start = self:WorldSpaceCenter() +Vector( 0, 0, siz ), endpos = self:WorldSpaceCenter() +Vector( 0, 0, siz +siz*2 ),
						filter = { own, self }, mask = MASK_SHOT, mins = Vector( -siz, -siz, -siz ), maxs = Vector( siz, siz, siz )
					} )
					cam.IgnoreZ( true ) render.SetMaterial( Mat2 ) local pos = tr.HitPos
					local col = ( tr.Hit and Color( 255, 0, 0 ) or Color( 255, 255, 0 ) )
					render.DrawBox( pos, Angle(0,0,0), Vector(-siz,-siz,-siz), Vector(siz,siz,siz), col )
					render.DrawBox( pos, Angle(0,0,0), Vector(-siz,-siz,siz), Vector(siz,siz,-siz), col )
					cam.IgnoreZ( false )
				end
				render.SetMaterial( Mat ) local sss = siz*7 +math.sin( CurTime()*20 )*siz*2
				render.DrawSprite( self:WorldSpaceCenter(), sss, sss, Color( 255, 155, 0, 255 ) )
				if self.xdefm_NextEmit > CurTime() then return end self.xdefm_NextEmit = CurTime() +0.05
				local particle = emt:Add( "effects/fire_cloud"..math.random( 1, 2 ), self:WorldSpaceCenter() )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( math.Rand( 0.75, 1.5 ) )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				local Size = math.Rand( siz*0.8, siz*1.2 )
				particle:SetStartSize( Size )
				particle:SetEndSize( 0.1 )		
				particle:SetRoll( math.random( 0, 360 ) )
				particle:SetAirResistance( 200 )
				particle:SetGravity( VectorRand():GetNormalized()*siz*2 +Vector( 0, 0, siz*math.Rand( 12, 20 ) ) )
				particle:SetColor( 255, math.random( 200, 255 ), math.random( 200, 255 ) )
				particle:SetCollide( false )
				particle:SetBounce( 0 )
				particle:SetLighting( false )
				local particle = emt:Add( "particle/smokesprites_000"..math.random( 1, 9 ), self:WorldSpaceCenter() +VectorRand():GetNormal()*siz/2 )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( math.Rand( 1, 1.5 ) )
				particle:SetStartAlpha( 128 )
				particle:SetEndAlpha( 0 )
				local Size = math.Rand( siz*0.8, siz*1.6 )
				particle:SetStartSize( 0 )
				particle:SetEndSize( Size )		
				particle:SetRoll( math.random( 0, 360 ) )
				particle:SetRollDelta( math.Rand( -3, 3 ) )
				particle:SetAirResistance( 200 )
				particle:SetGravity( VectorRand():GetNormalized()*siz*4 +Vector( 0, 0, siz*20 ) )
				particle:SetColor( 128, 128, 128 )
				particle:SetCollide( false )
				particle:SetBounce( 0 )
				particle:SetLighting( false )
			end
		end
	end
	scripted_ents.Register( ENT, "xdefm_firespot" ) end
local fil, dir = file.Find( "xdefishmod/*.lua", "LUA" ) if !fil or !dir then return end
for _, out in pairs( fil ) do if SERVER then AddCSLuaFile( "xdefishmod/"..out ) end include( "xdefishmod/"..out ) end
if SERVER then xdefm_UpdateShop() end