--[[
Custom Non-Commercial License v1.0 - 06.08.2024

Part of the "NxFishing" project on GitHub: https://github.com/Noxyro/NxFishing
© 2024 Noxyro; Original work by LemonCola3424

BASIC LICENSE TERMS: NON-COMMERCIAL USE ONLY; CREDITS TO ORIGINAL AUTHOR REQUIRED; MODIFY AND DISTRIBUTE FREELY UNDER LICENSE TERMS
See "LICENSE.md" and "README.md" in project folder or on GitHub for full license and contact details.
--]]

local SVConvars = bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED, FCVAR_LUA_SERVER)
CreateConVar("xdefmod_nodepth", "0", SVConvars, "", 0, 1)
CreateConVar("xdefmod_refund", "1", SVConvars, "", 0, 1)
CreateConVar("xdefmod_tempmode", "0", SVConvars, "", 0, 1)
CreateConVar("xdefmod_thief", "10", SVConvars, "", 0, 100)
CreateConVar("xdefmod_thiefnerf", "0", SVConvars, "", 0, 1)
CreateConVar("xdefmod_noprophurt", "1", SVConvars, "", 0, 1)
CreateConVar("xdefmod_hurtrod", "0", SVConvars, "", 0, 1)
CreateConVar("xdefmod_skpcool", "30", SVConvars, "", 0)
CreateConVar("xdefmod_salecool", "5", SVConvars, "", 0)
CreateConVar("xdefmod_qsttime", "10", SVConvars, "", 0)
CreateConVar("xdefmod_lbdelay", "10", SVConvars, "", 0)
CreateConVar("xdefmod_nomorehook", "0", SVConvars, "", 0, 1)
CreateConVar("xdefmod_darkrp", "0.05", SVConvars, "", 0.01, 10)
CreateConVar("sbox_maxxdefmod_items", "30", SVConvars)

if CLIENT then
	CreateClientConVar("xdefmod_tagdist", "256", true, false, "", -1)
	CreateClientConVar("xdefmod_sonar", "1", true, false, "", 0, 1)
	CreateClientConVar("xdefmod_renderdist", "2048", true, false, "", 0)
	CreateClientConVar("xdefmod_animui", "1", true, false, "", 0, 1)
	CreateClientConVar("xdefmod_showhook", "1", true, false, "", 0, 1)
	CreateClientConVar("xdefmod_printnote", "0", true, false, "", 0, 1)
	CreateClientConVar("xdefmod_printcmd", "0", true, false, "", 0, 1)

	CreateClientConVar("xdefmod_drawhalo", "1", true, false, "", 0, 1)
	CreateClientConVar("xdefmod_collect", "0", true, false, "", 0, 1)
	CreateClientConVar("xdefmod_fastreel", "0", true, true, "", 0, 1)
	CreateClientConVar("xdefmod_quickinv", "-1", true, false, "")
	CreateClientConVar("xdefmod_fps", "0", true, false, "", 0, 1)
	CreateClientConVar("xdefmod_collection", "11111111111", true, false, "")
	CreateClientConVar("xdefmod_bgr", "28", true, false, "", 0, 255)
	CreateClientConVar("xdefmod_bgg", "25", true, false, "", 0, 255)
	CreateClientConVar("xdefmod_bgb", "72", true, false, "", 0, 255)
	CreateClientConVar("xdefmod_bga", "255", true, false, "", 0, 255)
	CreateClientConVar("xdefmod_brr", "0", true, false, "", 0, 255)
	CreateClientConVar("xdefmod_brg", "206", true, false, "", 0, 255)
	CreateClientConVar("xdefmod_brb", "209", true, false, "", 0, 255)
	CreateClientConVar("xdefmod_bra", "255", true, false, "", 0, 255)
end

-- Check for existing instance of addon and
if istable(xdefmod) and istable(xdefmod.util) and istable(xdefmod.util.menus) then
	for k, v in pairs(xdefmod.util.menus) do
		if v ~= nil then
			v:Remove()
		end
	end
end

-- Init
xdefmod = {}

xdefmod.items = {}
xdefmod.util = {}
xdefmod.shop = {}

xdefmod.leader = nil

-- Constants
xdefmod.util.VERSION = "1.0.0"

xdefmod.util.ROD_POS = Vector(-6, -2.5, 10)
xdefmod.util.ROD_ANG = Angle(0, 90, 135)

xdefmod.util.RIFLE_POS = Vector(22, -1, 0)
xdefmod.util.RIFLE_ANG = Angle(-20, 180, 180)

if CLIENT then
	xdefmod.COLOR_LINE = Color(0, 0, 0)
	xdefmod.COLOR_BACKGROUND = Color(GetConVar("xdefmod_bgr"):GetInt(), GetConVar("xdefmod_bgg"):GetInt(), GetConVar("xdefmod_bgb"):GetInt(), GetConVar("xdefmod_bga"):GetInt())
	xdefmod.COLOR_BORDER = Color(GetConVar("xdefmod_brr"):GetInt(), GetConVar("xdefmod_brg"):GetInt(), GetConVar("xdefmod_brb"):GetInt(), GetConVar("xdefmod_bra"):GetInt())
end

xdefmod.util.RARITY_COLORS = {
	Color(100, 100, 100),
	Color(255, 255, 255),
	Color(50, 205, 50),
	Color(30, 144, 255),
	Color(148, 0, 211),
	Color(255, 215, 0),
}

xdefmod.util.RARITY_NAMES = {
	"xdefm.T0",
	"#xdefm.T1",
	"#xdefm.T2",
	"#xdefm.T3",
	"#xdefm.T4",
	"#xdefm.T5",
	"#xdefm.T6"
}

xdefmod.util.UPGRADE_COSTS = {
	["A"] = 1,
	["B"] = 1,
	["C"] = 1,
	["D"] = 1,
	["E"] = 1,
	["F"] = 1,
	["G"] = 20
}

xdefmod.util.ITEM_TYPES = {
	["Creature"] = 3,
	["Bait"] = 1,
	["Useless"] = 2,
	["Recipe"] = 2,
	["Struct"] = 2,
}

xdefmod.util.ITEM_ICONS = {
	["Creature"] = Material("icon16/monkey.png"),
	["Bait"] = Material("icon16/bug.png"),
	["Useless"] = Material("icon16/box.png"),
	["Recipe"] = Material("icon16/script.png"),
	["Struct"] = Material("icon16/building.png")
}

-- Sound definitions
sound.Add({ name = "xdefm.ChargeMax", channel = CHAN_WEAPON, volume = 1, level = 75, pitch = 80, sound = ")weapons/shotgun/shotgun_empty.wav" })
sound.Add({ name = "xdefm.UnReel", channel = CHAN_WEAPON, volume = 1, level = 75, pitch = { 95, 105 }, sound = ")weapons/crossbow/reload1.wav" })
sound.Add({ name = "xdefm.Break", channel = CHAN_WEAPON, volume = 1, level = 75, pitch = 100, sound = "npc/roller/blade_in.wav" })
sound.Add({ name = "xdefm.Throw", channel = CHAN_WEAPON, volume = 1, level = 75, pitch = 100, sound = { "npc/vort/claw_swing1.wav", "npc/vort/claw_swing2.wav" } })
sound.Add({ name = "xdefm.Reel", channel = CHAN_WEAPON, volume = 1, level = 75, pitch = 100, sound = "fishingrod/reel.wav" })
sound.Add({ name = "xdefm.Bite", channel = CHAN_WEAPON, volume = 1, level = 75, pitch = 100, sound = "weapons/slam/mine_mode.wav" })

-- URS/ULX integration
local SP_URS = "ulx/modules/urs_server.lua"
if SERVER and file.Exists(SP_URS, "LUA") then
	include(SP_URS)
end

-- Register fishing item type with URS limit restrictions
if istable(URS) and URS.types then
	local tab = {}
	tab.limits = { "xdefmod_item" }
	table.Merge(URS.types, tab)

	if SERVER then
		for k, v in pairs(tab) do
			if not URS[k] then
				URS[k] = {}
			end
			for n, m in pairs(v) do
				if not URS[k][m] then
					URS[k][m] = {}
				end
			end
		end
	end
end

-- Client only variables
if CLIENT then
	-- Init
	xdefmod.bestiary = {}
	xdefmod.bestb = {}
	xdefmod.quests = {}
	xdefmod.lang = {}
	xdefmod.util.menus = {}
	xdefmod.util.notes = {}

	xdefmod.util.marker = nil
	xdefmod.util.aim_pan = nil
	xdefmod.util.craft = nil
	xdefmod.util.ings = nil
	xdefmod.util.ing2 = nil
	xdefmod.util.lc = false
	xdefmod.util.camera_ang = nil
	xdefmod.util.see_ang = nil
	xdefmod.util.cursor_pos = nil
	xdefmod.util.skill_reset_cooldown = 0
	xdefmod.util.fov = 1.5
	xdefmod.util.lfov = 1.5
	xdefmod.util.key_ent = nil
	xdefmod.util.key_ler = 0
	xdefmod.util.dx = 0
	xdefmod.util.dy = 0
	xdefmod.util.dl = 0
	xdefmod.util.ls = "_"
	xdefmod.util.ds = "_"

	-- Create fonts on client
	surface.CreateFont("xdefm_Font1", { font = "Noto Sans SC", size = 20, weight = 1, antialias = true, bold = true })
	surface.CreateFont("xdefm_Font2", { font = "Noto Sans SC", size = 15, weight = 1, antialias = true, bold = true })
	surface.CreateFont("xdefm_Font3", { font = "Noto Sans SC", size = 50, weight = 1, antialias = true, bold = true })
	surface.CreateFont("xdefm_Font4", { font = "Noto Sans SC", size = 30, weight = 1, antialias = true, bold = true })
	surface.CreateFont("xdefm_Font5", { font = "Noto Sans SC", size = 25, weight = 1, antialias = true, bold = true })
	surface.CreateFont("xdefm_Font6", { font = "Noto Sans SC", size = 30, weight = 1, antialias = true, bold = true })
	surface.CreateFont("xdefm_Font7", { font = "Noto Sans SC", size = 20, weight = 1, antialias = true, bold = true })

	-- Add language strings
	language.Add("xdefm_rod", "")
	language.Add("xdefm_bobber", "")
	language.Add("xdefm_hook", "")
	language.Add("xdefm_base", "")
	language.Add("xdefm.BaseItem", "")
	language.Add("xdefm_dummy", "")
	language.Add("xdefm_firespot", "#xdefm.FireSpot")
	language.Add("sent_xdefm_trashcan", "#xdefm.TrashCan")
	language.Add("sent_xdefm_equipment", "#xdefm.Equipment")
	language.Add("sent_xdefm_plate", "#xdefm.Plate")
	language.Add("sent_xdefm_sonar", "#xdefm.Sonar")
	language.Add("SBoxLimit_xdefmod_items", "You've hit the Items limit!")

	-- Add kill icons
	killicon.Add("xdefm_rod", "HUD/killicons/default", Color(0, 255, 255, 255))
	killicon.Add("xdefm_bobber", "HUD/killicons/default", Color(0, 255, 255, 255))
	killicon.Add("xdefm_hook", "HUD/killicons/default", Color(0, 255, 255, 255))
	killicon.Add("xdefm_base", "HUD/killicons/default", Color(0, 255, 255, 255))
	killicon.Add("xdefm_dummy", "HUD/killicons/default", Color(0, 255, 255, 255))
	killicon.Add("xdefm_firespot", "HUD/killicons/default", Color(0, 255, 255, 255))
	killicon.Add("sent_xdefm_trashcan", "HUD/killicons/default", Color(0, 255, 255, 255))
	killicon.Add("sent_xdefm_equipment", "HUD/killicons/default", Color(0, 255, 255, 255))
	killicon.Add("sent_xdefm_plate", "HUD/killicons/default", Color(0, 255, 255, 255))
	killicon.Add("sent_xdefm_sonar", "HUD/killicons/default", Color(0, 255, 255, 255))
	killicon.Add("weapon_xdefm_rod", "HUD/killicons/default", Color(0, 255, 255, 255))
	killicon.Add("weapon_xdefm_builder", "HUD/killicons/default", Color(0, 255, 255, 255))

	-- Icon material constants
	local ICON_YES = Material("icon16/tick.png")
	local ICON_NO = Material("icon16/cross.png")
	local ICON_BACK = Material("gui/gradient_down")

	local ICON_0 = Material("vgui/cursors/arrow")
	local ICON_1 = Material("icon16/basket_put.png")
	local ICON_2 = Material("icon16/basket_go.png")
	local ICON_3 = Material("icon16/coins.png")
	local ICON_4 = Material("icon16/bin_closed.png")
	local ICON_5 = Material("icon16/bug_go.png")
	local ICON_6 = Material("icon16/script_go.png")

	local GUI_BACK_1 = Material("gui/gradient_down")
	local GUI_BACK_2 = Material("gui/gradient_up")

	xdefmod.lang[ "zh-CN" ] = {
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

	xdefmod.lang[ "en" ] = {
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

	-- Check if language has translation, otherwise use "en" as default
	local lang_detected = GetConVar("gmod_language"):GetString()
	local language_selected = "en"
	local bestiary_path = "xdefishmod/bestiary.txt"
	if lang_detected ~= nil and istable(xdefmod.lang[lang_detected]) then
		language_selected = lang_detected
	end

	-- Add all entries from used language table to language strings
	for holder, text in pairs(xdefmod.lang[language_selected]) do
		language.Add("xdefm." .. holder, text)
	end

	-- Check if bestiary file exists and load it
	if file.Exists(bestiary_path, "DATA") then
		local dat = file.Read(bestiary_path, "DATA")
		if isstring(dat) and istable(util.JSONToTable(dat)) then
			xdefmod.bestiary = util.JSONToTable(dat)
		end
	end

	-- Set icon for spawn menu category
	list.Set("ContentCategoryIcons", "#xdefm.Category", "icon16/fishing.png")

	-- REVIEW: Reconsider if beastiary record should be saved client-side instead of server-side.
	-- Overwrites or creates bestiary file in data folder
	function xdefm_BestiarySave()
		if not file.IsDir("xdefishmod", "DATA") then
			file.CreateDir("xdefishmod")
		end

		file.Write("xdefishmod/bestiary.txt", util.TableToJSON(xdefmod.bestiary, true))
	end


	function xdefm_SlotBox(slot_x, slot_y, slot_width, slot_height, slot_number, item_text, item_icon, locked)
		if not isnumber(slot_x) or not isnumber(slot_y) or not isnumber(slot_width) or not isnumber(slot_height) or not isnumber(slot_number) then
			return
		end

		local slot_box = vgui.Create("DButton")
		slot_box:SetSize(slot_width, slot_height)
		slot_box:SetPos(slot_x, slot_y)
		slot_box.S_Place = tostring(slot_number)
		slot_box.B_OnMove = nil
		slot_box:SetCursor("blank")
		slot_box.S_Type = "None"
		slot_box:SetText("")
		slot_box.B_OnMove = false

		if item_icon ~= nil then
			slot_box.P_Sprite = vgui.Create("DSprite", slot_box)
			local spr = slot_box.P_Sprite
			spr:SetMaterial(isstring(item_icon) and Material(item_icon) or item_icon)
			spr:SetPos(slot_width * 0.15, slot_height * 0.15)
			spr:SetSize(slot_width * 0.15, slot_height * 0.15)
		end

		if not locked then
			slot_box:Droppable("XDEFM_MenuDrop")
		end

		slot_box.N_Lerp = 1
		slot_box.T_Item = nil
		slot_box.T_Extra = nil
		slot_box.S_Name = ""
		slot_box.N_Rarity = 0
		slot_box.S_Item = "_"

		function slot_box:Paint(w, h)
			local col = xdefmod.util.RARITY_COLORS[slot_box.N_Rarity + 1]
			if slot_box.N_Rarity ~= 0 then
				draw.RoundedBox(0, 1, 1, w - 2, h - 2, Color(col.r * 0.4, col.g * 0.4, col.b * 0.4))
				if xdefmod.util.aim_pan == slot_box then
					slot_box.N_Lerp = Lerp(0.2, slot_box.N_Lerp, 4)
				else
					slot_box.N_Lerp = Lerp(0.2, slot_box.N_Lerp, 1)
				end
			else
				draw.RoundedBox(0, 0, 0, w, h, col)
				draw.RoundedBox(0, 1, 1, w - 2, h - 2, Color(col.r * 0.4, col.g * 0.4, col.b * 0.4))
			end

			local alp = math.Clamp((slot_box.N_Lerp - 1) / 3, 0, 1) * 255
			surface.SetMaterial(GUI_BACK_2)
			surface.SetDrawColor(Color(col.r * 0.6, col.g * 0.6, col.b * 0.6, 255 - alp))
			surface.DrawTexturedRect(0, 0, w, h)
			surface.SetMaterial(GUI_BACK_1)
			surface.SetDrawColor(Color(col.r * 0.6, col.g * 0.6, col.b * 0.6, alp))
			surface.DrawTexturedRect(0, 0, w, h)
			surface.SetDrawColor(col)
			surface.DrawOutlinedRect(0, 0, w, h, slot_box.N_Lerp)

			draw.TextShadow({
				text = isstring(item_text) and item_text or "",
				pos = { h - 4, 4 },
				font = "xdefm_Font2",
				xalign = TEXT_ALIGN_RIGHT,
				yalign = TEXT_ALIGN_DOWN,
				color = Color(255, 255, 255)
			}, 1, 255)
		end

		if not locked then
			function slot_box:DoClick()
				local ply = LocalPlayer()
				local slot_type = slot_box.S_Type
				local menu_list = xdefmod.util.menus
				local ply_profile = ply.xdefm_Profile
				-- Check control-click and sell / destroy item in slot
				if (input.IsControlDown() or input.IsButtonDown(KEY_LCONTROL) or input.IsButtonDown(KEY_RCONTROL)) and slot_box.S_Item ~= "_" then
					if slot_type == "Inventory" then
						xdefm_Command(ply, "DestroyInv", slot_box.S_Place)
					end

					return
				end

				-- Check shift-click and fast-move item to any applicable slot
				if (input.IsShiftDown() or input.IsButtonDown(KEY_LSHIFT) or input.IsButtonDown(KEY_RSHIFT)) and slot_box.S_Item ~= "_" then
					if slot_type == "Inventory" then
						if IsValid(menu_list["Bank"]) then
							local num = 0
							for k, v in pairs(ply_profile.Bnk) do
								if k > ply_profile.UpdF then
									break
								end

								if isstring(v) and v == "_" then
									num = k
									break
								end
							end

							if num > 0 then
								xdefm_Command(ply, "MoveBank", slot_box.S_Place .. "|" .. num)
							else
								xdefm_AddNote(ply, "!V", "resource/warning.wav", "cross", 5)
							end

							return
						elseif IsValid(menu_list["Struct"]) and menu_list["Struct"].N_SType == 1 then
							local num = 0
							for k, v in pairs(menu_list["Struct"].T_Items) do
								if isstring(v) and v == "_" then
									num = k
									break
								end
							end

							if num > 0 then
								xdefm_Command(ply, "Struct", slot_box.S_Place .. "|" .. num)
							else
								xdefm_AddNote(ply, "!V", "resource/warning.wav", "cross", 5)
							end

							return
						elseif not IsValid(menu_list["Trade"]) then
							if slot_box.T_Item.Type == "Bait" and slot_box.S_Place ~= "21" then
								xdefm_Command(ply, "MoveInv", slot_box.S_Place .. "|21")
								return
							elseif slot_box.T_Item.Type == "Bait" and slot_box.S_Place == "21" then
								local free_slot = 0
								for slot_index, item_name in pairs(ply_profile.Items) do
									if isstring(item_name) and item_name == "_" and slot_index ~= 21 then
										free_slot = slot_index
										break
									end
								end

								if free_slot > 0 then
									xdefm_Command(ply, "MoveInv", slot_box.S_Place .. "|" .. free_slot)
								end

								return
							end
						end

						if IsValid(menu_list["Craft"]) then
							if slot_box.T_Item.Type == "Recipe" then
								xdefm_Command(ply, "MoveCraft", slot_box.S_Place)
							end

							return
						end

						if IsValid(menu_list["Trade"]) and istable(menu_list["Trade"].T_Slo1) then
							local num = 0
							for k, v in pairs(menu_list["Trade"].T_Slo1) do
								if isstring(v.S_Item) and v.S_Item == "_" then
									num = k
									break
								end
							end

							if num > 0 then
								xdefm_Command(ply, "MoveTrade", slot_box.S_Place .. "|" .. num)
							else
								xdefm_AddNote(ply, "!V", "resource/warning.wav", "cross", 5)
							end

							return
						elseif slot_box.T_Item.Type == "Bait" and slot_box.S_Place ~= "21" then
							xdefm_Command(ply, "MoveInv", slot_box.S_Place .. "|21")
							return
						end
					end

					if slot_type == "Bank" and menu_list["Inventory"] then
						local num = 0
						for k, v in pairs(ply_profile.Items) do
							if isstring(v) and v == "_" and (k ~= 21 or slot_box.T_Item.Type == "Bait") then
								num = k
								break
							end
						end

						if num > 0 then
							xdefm_Command(ply, "MoveBank", num .. "|" .. slot_box.S_Place)
						else
							xdefm_AddNote(ply, "xdefm.FullInv", "resource/warning.wav", "cross", 5)
						end

						return
					end

					if slot_type == "Storage" and menu_list["Inventory"] then
						local num = 0
						for k, v in pairs(ply_profile.Items) do
							if isstring(v) and v == "_" and (k ~= 21 or slot_box.T_Item.Type == "Bait") then
								num = k
								break
							end
						end

						if num > 0 then
							xdefm_Command(ply, "Struct", num .. "|" .. slot_box.S_Place)
						else
							xdefm_AddNote(ply, "xdefm.FullInv", "resource/warning.wav", "cross", 5)
						end

						return
					end

					if slot_type == "Trade" and menu_list["Inventory"] then
						local num = 0
						for k, v in pairs(ply_profile.Items) do
							if isstring(v) and v == "_" and (k ~= 21 or slot_box.T_Item.Type == "Bait") then
								num = k
								break
							end
						end

						if num > 0 then
							xdefm_Command(ply, "MoveTrade", num .. "|" .. slot_box.S_Place)
						else
							xdefm_AddNote(ply, "xdefm.FullInv", "resource/warning.wav", "cross", 5)
						end

						return
					end

					if slot_type == "Recipe" and menu_list["Inventory"] then
						local num = 0
						for k, v in pairs(ply_profile.Items) do
							if isstring(v) and k ~= 21 and v == "_" then
								num = k
								break

								--local aa, bb = xdefm_ItemGet(v) -- Unused?
							end
						end

						if num > 0 then
							xdefm_Command(ply, "MoveCraft", num)
						else
							xdefm_AddNote(ply, "xdefm.FullInv", "resource/warning.wav", "cross", 5)
						end

						return
					end
				end
			end

			slot_box:Receiver("XDEFM_MenuDrop", function(panel_to, panel_list, drop)
				if ispanel(panel_to) and ispanel(panel_list[1]) and panel_list[1].B_OnMove and drop then
					local panel_from = panel_list[1]
					if panel_to.S_Type == panel_from.S_Type and panel_to.S_Type == "Inventory" then
						xdefm_Command(LocalPlayer(), "MoveInv", panel_to.S_Place .. "|" .. panel_from.S_Place)
					end

					if panel_to.S_Type ~= panel_from.S_Type then
						if panel_from.S_Type == "Inventory" and panel_to.S_Type == "Bank" then
							xdefm_Command(LocalPlayer(), "MoveBank", panel_from.S_Place .. "|" .. panel_to.S_Place)
						elseif panel_to.S_Type == "Inventory" and panel_from.S_Type == "Bank" then
							xdefm_Command(LocalPlayer(), "MoveBank", panel_to.S_Place .. "|" .. panel_from.S_Place)
						end

						if panel_from.S_Type == "Inventory" and panel_to.S_Type == "Storage" then
							xdefm_Command(LocalPlayer(), "Struct", panel_from.S_Place .. "|" .. panel_to.S_Place)
						elseif panel_to.S_Type == "Inventory" and panel_from.S_Type == "Storage" then
							xdefm_Command(LocalPlayer(), "Struct", panel_to.S_Place .. "|" .. panel_from.S_Place)
						end

						if panel_from.S_Type == "Inventory" and panel_to.S_Type == "Trade" then
							xdefm_Command(LocalPlayer(), "MoveTrade", panel_from.S_Place .. "|" .. panel_to.S_Place)
						elseif panel_to.S_Type == "Inventory" and panel_from.S_Type == "Trade" then
							xdefm_Command(LocalPlayer(), "MoveTrade", panel_to.S_Place .. "|" .. panel_from.S_Place)
						end

						if panel_from.S_Type == "Inventory" and panel_to.S_Type == "Recipe" then
							xdefm_Command(LocalPlayer(), "MoveCraft", panel_from.S_Place)
						elseif panel_to.S_Type == "Inventory" and panel_from.S_Type == "Recipe" then
							xdefm_Command(LocalPlayer(), "MoveCraft", panel_to.S_Place)
						end
					end

					if panel_to.S_Type == panel_from.S_Type and panel_to.S_Type == "Bank" then
						xdefm_Command(LocalPlayer(), "MoveBankOuter", panel_to.S_Place .. "|" .. panel_from.S_Place)
					end

					if panel_to.S_Type == panel_from.S_Type and panel_to.S_Type == "Trade" then
						xdefm_Command(LocalPlayer(), "MoveTradeOuter", panel_to.S_Place .. "|" .. panel_from.S_Place)
					end

					if panel_to.S_Type == panel_from.S_Type and panel_to.S_Type == "Storage" then
						xdefm_Command(LocalPlayer(), "StructOuter", panel_to.S_Place .. "|" .. panel_from.S_Place)
					end
				end
			end)

			function slot_box:Think()
				if isbool(self:IsDragging()) and self.B_OnMove ~= self:IsDragging() then
					self.B_OnMove = self:IsDragging()
				end

				if xdefmod.util.aim_pan == slot_box then
					xdefmod.util.marker = slot_box.S_Item
				end
			end
		end

		function slot_box:OnCursorEntered()
			xdefmod.util.aim_pan = slot_box
			xdefmod.util.marker = slot_box.S_Item
			slot_box.B_OnMove = true
			if slot_box.S_Item ~= "_" then
				xdefmod.util.lc = false
			end
		end

		function slot_box:OnCursorExited()
			if xdefmod.util.aim_pan == slot_box then
				xdefmod.util.aim_pan = nil
				xdefmod.util.marker = nil
			end

			slot_box.B_OnMove = false
		end

		function slot_box:F_SetupItem(item_name)
			if not isstring(item_name) then
				return
			end

			local item_info, item = xdefm_ItemGet(item_name)
			if IsValid(slot_box.P_Txt) then
				slot_box.P_Txt:Remove()
			end

			if not istable(item_info) or not istable(item) or item_name == "_" or item_name == "" then
				if IsValid(slot_box.P_Mdl) then
					slot_box.P_Mdl:Remove()
				end

				slot_box.T_Item = nil
				slot_box.T_Extra = nil
				slot_box.S_Name = ""
				slot_box.N_Rarity = 0
				slot_box.S_Item = "_"
				slot_box.N_Lerp = 1
			else
				if not IsValid(slot_box.P_Mdl) then
					slot_box.P_Mdl = slot_box:Add("ModelImage")
					slot_box.P_Mdl:DockMargin(5, 5, 5, 5)
					slot_box.P_Mdl:Dock(FILL)
					slot_box.P_Mdl:SetModel(item.Model[1])
					slot_box.P_Mdl:SetMouseInputEnabled(false)
				else
					slot_box.P_Mdl:SetModel(item.Model[1])
				end

				slot_box.S_Name = item.Name
				slot_box.N_Rarity = math.Clamp(item.Rarity, 0, 5)
				slot_box.T_Item = item
				slot_box.T_Extra = item_info
				slot_box.S_Item = item_name

				local rarity_color = xdefmod.util.RARITY_COLORS[slot_box.N_Rarity + 1]
				local rarity_indicator = vgui.Create("DPanel", slot_box)
				rarity_indicator:SetSize(slot_width, slot_height * 0.25)
				rarity_indicator:SetPos(0, slot_height * 0.75)
				rarity_indicator:SetMouseInputEnabled(false)

				function rarity_indicator:Paint(indicator_width, indicator_height)
					if slot_box.N_Rarity ~= 0 then
						draw.RoundedBox(0, 0, 0, indicator_width, indicator_height, Color(0, 0, 0, 200))
						surface.SetFont("xdefm_Font2")

						local nam = (slot_box.S_Name ~= "_" and slot_box.S_Name or "")
						local size, _ = surface.GetTextSize(nam)
						local indicator_x = 0
						if size >= slot_width then
							indicator_x = math.sin(CurTime() * 2) * size / 2
						end

						draw.TextShadow({
							text = nam,
							pos = { indicator_width / 2 + indicator_x / 2, indicator_height / 2 },
							font = "xdefm_Font2",
							xalign = TEXT_ALIGN_CENTER,
							yalign = TEXT_ALIGN_CENTER,
							color = rarity_color
						}, 1, 255)

						surface.SetDrawColor(rarity_color)
						surface.DrawOutlinedRect(0, 0, slot_width, math.ceil(slot_height * 0.25), 1)
					end
				end

				slot_box.P_Txt = rarity_indicator
			end
		end
		return slot_box
	end

	-- Draws box with cut corners
	function xdefm_CutBox(cut_size, box_x, box_y, box_width, box_height, is_top_left_cut, is_top_right_cut, is_bottom_right_cut, is_bottom_left_cut)
		cut_size = isnumber(cut_size) and cut_size or 1

		local box_vertices = {}
		table.insert(box_vertices, { x = box_x, y = box_y + cut_size })

		if is_top_left_cut then
			table.insert(box_vertices, { x = box_x + cut_size, y = box_y })
		else
			table.insert(box_vertices, { x = box_x, y = box_y })
		end

		if is_top_right_cut then
			table.insert(box_vertices, { x = box_x + box_width - cut_size, y = box_y })
			table.insert(box_vertices, { x = box_x + box_width, y = box_y + cut_size })
		else
			table.insert(box_vertices, { x = box_x + box_width, y = box_y })
		end

		if is_bottom_right_cut then
			table.insert(box_vertices, { x = box_x + box_width, y = box_y + box_height - cut_size })
			table.insert(box_vertices, { x = box_x + box_width - cut_size, y = box_y + box_height })
		else
			table.insert(box_vertices, { x = box_x + box_width, y = box_y + box_height })
		end

		if is_bottom_left_cut then
			table.insert(box_vertices, { x = box_x + cut_size, y = box_y + box_height })
			table.insert(box_vertices, { x = box_x, y = box_y + box_height - cut_size })
		else
			table.insert(box_vertices, { x = box_x, y = box_y + box_height })
		end

		surface.DrawPoly(box_vertices)
	end

	-- Hooks

	hook.Add("AddToolMenuCategories", "xdefm_UCat", function()
		spawnmenu.AddToolCategory("Utilities", "XDEFMod", "#xdefm.UCat")
	end)

	hook.Add("InitPostEntity", "xdefm_LoadProfile", function()
		net.Start("NET_xdefm_NeedProfile")
		net.SendToServer()
	end)

	hook.Add("PopulateToolMenu", "xdefm_UMenus", function()
		spawnmenu.AddToolMenuOption("Utilities", "XDEFMod", "XDEFModSV", "#xdefm.UMenuS1", "", "", function(panel)
			panel:ClearControls()
			panel:Help("#xdefm.UMenuS2")

			local button = panel:Button("#xdefm.UPart1")
			function button:DoClick()
				RunConsoleCommand("xdefmod_tempmode", 0)
				RunConsoleCommand("xdefmod_nodepth", 0)
				RunConsoleCommand("xdefmod_refund", 1)
				RunConsoleCommand("xdefmod_lbdelay", 10)
				RunConsoleCommand("xdefmod_thief", 10)
				RunConsoleCommand("sbox_maxxdefmod_items", 30)
				RunConsoleCommand("xdefmod_noprophurt", 1)
				RunConsoleCommand("xdefmod_hurtrod", 0)
				RunConsoleCommand("xdefmod_skpcool", 5)
				RunConsoleCommand("xdefmod_salecool", 5)
				RunConsoleCommand("xdefmod_thiefnerf", 0)
				RunConsoleCommand("xdefmod_qsttime", 10)
				RunConsoleCommand("xdefmod_darkrp", 0.05)
				RunConsoleCommand("xdefmod_nomorehook", 0)
			end

			panel:CheckBox("#xdefm.c_tempmode1", "xdefmod_tempmode")
			panel:ControlHelp("#xdefm.c_tempmode2")
			panel:CheckBox("#xdefm.c_nodepth1", "xdefmod_nodepth")
			panel:ControlHelp("#xdefm.c_nodepth2")
			panel:CheckBox("#xdefm.c_refund1", "xdefmod_refund")
			panel:ControlHelp("#xdefm.c_refund2")
			panel:CheckBox("#xdefm.c_noprophurt1", "xdefmod_noprophurt")
			panel:ControlHelp("#xdefm.c_noprophurt2")
			panel:CheckBox("#xdefm.c_hurtrod1", "xdefmod_hurtrod")
			panel:ControlHelp("#xdefm.c_hurtrod2")
			panel:CheckBox("#xdefm.c_thiefnerf1", "xdefmod_thiefnerf")
			panel:ControlHelp("#xdefm.c_thiefnerf2")
			panel:CheckBox("#xdefm.c_nomorehook1", "xdefmod_nomorehook")
			panel:ControlHelp("#xdefm.c_nomorehook2")
			panel:NumSlider("#xdefm.c_thief1", "xdefmod_thief", 0, 100, 0)
			panel:ControlHelp("#xdefm.c_thief2")
			panel:NumSlider("#xdefm.c_skpcool1", "xdefmod_skpcool", 0, 600, 0)
			panel:ControlHelp("#xdefm.c_skpcool2")
			panel:NumSlider("#xdefm.c_salecool1", "xdefmod_salecool", 0, 60, 0)
			panel:ControlHelp("#xdefm.c_salecool2")
			panel:NumSlider("#xdefm.c_lbdelay1", "xdefmod_lbdelay", 0, 60, 0)
			panel:ControlHelp("#xdefm.c_lbdelay2")
			panel:NumSlider("#xdefm.c_qsttime1", "xdefmod_qsttime", 0, 60, 0)
			panel:ControlHelp("#xdefm.c_qsttime2")
			panel:NumSlider("#xdefm.c_darkrp1", "xdefmod_darkrp", 0.01, 10, 2)
			panel:ControlHelp("#xdefm.c_darkrp2")
			panel:NumSlider("#xdefm.c_maxxdefmod_items", "sbox_maxxdefmod_items", 0, 200, 0)
		end)

		spawnmenu.AddToolMenuOption("Utilities", "XDEFMod", "XDEFModCL", "#xdefm.UMenuC1", "", "", function(panel)
			panel:ClearControls()
			panel:Help("#xdefm.UMenuC2")

			local button = panel:Button("#xdefm.UPart1")
			function button:DoClick()
				RunConsoleCommand("xdefmod_collect", 0)
				RunConsoleCommand("xdefmod_animui", 1)
				RunConsoleCommand("xdefmod_quickinv", -1)
				RunConsoleCommand("xdefmod_tagdist", 256)
				RunConsoleCommand("xdefmod_renderdist", 2048)
				RunConsoleCommand("xdefmod_showhook", 1)
				RunConsoleCommand("xdefmod_printnote", 0)
				RunConsoleCommand("xdefmod_drawhalo", 1)
				RunConsoleCommand("xdefmod_printcmd", 0)
				RunConsoleCommand("xdefmod_fastreel", 0)
				RunConsoleCommand("xdefmod_fps", 0)
				RunConsoleCommand("xdefmod_sonar", 1)
				RunConsoleCommand("xdefmod_collection", "11111111111")
				RunConsoleCommand("xdefmod_bgr", 28)
				RunConsoleCommand("xdefmod_bgg", 25)
				RunConsoleCommand("xdefmod_bgb", 72)
				RunConsoleCommand("xdefmod_bga", 255)
				RunConsoleCommand("xdefmod_brr", 0)
				RunConsoleCommand("xdefmod_brg", 206)
				RunConsoleCommand("xdefmod_brb", 209)
				RunConsoleCommand("xdefmod_bra", 255)
			end

			panel:CheckBox("#xdefm.c_fps1", "xdefmod_fps")
			panel:CheckBox("#xdefm.Sonar2", "xdefmod_sonar")
			panel:CheckBox("#xdefm.c_fastreel1", "xdefmod_fastreel")
			panel:CheckBox("#xdefm.c_showhook1", "xdefmod_showhook")
			panel:CheckBox("#xdefm.c_drawhalo1", "xdefmod_drawhalo")
			panel:CheckBox("#xdefm.c_animui1", "xdefmod_animui")
			panel:CheckBox("#xdefm.c_collect1", "xdefmod_collect")
			panel:CheckBox("#xdefm.c_printnote1", "xdefmod_printnote")
			panel:CheckBox("#xdefm.c_printcmd1", "xdefmod_printcmd")
			panel:NumSlider("#xdefm.c_tagdist1", "xdefmod_tagdist", 0, 10000, 0)
			panel:NumSlider("#xdefm.c_renderdist1", "xdefmod_renderdist", 0, 100000, 0)
			panel:KeyBinder("#xdefm.c_quickinv1", "xdefmod_quickinv")
			panel:ColorPicker("#xdefm.c_bg", "xdefmod_bgr", "xdefmod_bgg", "xdefmod_bgb", "xdefmod_bga")
			panel:ColorPicker("#xdefm.c_br", "xdefmod_brr", "xdefmod_brg", "xdefmod_brb", "xdefmod_bra")
		end)
	end)

	hook.Add("ShouldDrawLocalPlayer", "xdefm_DrawPly", function(ply)
		local wep = ply:GetActiveWeapon()
		if IsValid(wep) and wep:GetClass() == "weapon_xdefm_rod" and GetConVar("xdefmod_fps"):GetInt() ~= 1 then
			return true
		end
	end)

	hook.Add("CalcView", "xdefm_Cam", function(ply, origin, angles, fov)
		local ply_weapon = ply:GetActiveWeapon()
		if IsValid(ply_weapon) and ply_weapon:GetClass() == "weapon_xdefm_rod" then
			-- Third person
			if GetConVar("xdefmod_fps"):GetInt() ~= 1 then
				local player_size = ply:OBBMins():Distance(ply:OBBMaxs())
				--local local_pos = Vector(-40, 0, 10) -- Unused?
				local local_ang = angles
				if xdefmod.util.see_ang then
					local_ang = Angle(xdefmod.util.see_ang.pitch, xdefmod.util.see_ang.yaw, 0)
				end

				--local NPos, NAng = LocalToWorld(local_pos, local_ang, pos, ang) -- Unused?
				local cam_wall_trace = util.TraceLine({
					start = ply:EyePos(),
					endpos = ply:EyePos() - local_ang:Forward() * player_size * xdefmod.util.fov,
					filter = ply,
					mask = MASK_SHOT_HULL
				})

				local view = {
					origin = cam_wall_trace.HitPos + cam_wall_trace.HitNormal,
					angles = local_ang,
					fov = fov,
					drawviewer = true
				}

				return view
			-- First person
			else
				local view = {
					origin = origin,
					angles = angles,
					fov = fov,
					drawviewer = false
				}

				return view
			end
		end
	end)

	hook.Add("CreateMove", "xdefm_MoveCL", function(cmd)
		local ply = LocalPlayer()
		local ply_weapon = LocalPlayer():GetActiveWeapon()
		if cmd:KeyDown(IN_USE) and not xdefmod.util.Reloaded then
			xdefmod.util.Reloaded = true
			if ply:KeyDown(IN_RELOAD) then
				net.Start("NET_xdefm_Pickup")
				net.WriteEntity(ply)
				net.SendToServer()
			end
		elseif xdefmod.util.Reloaded and not cmd:KeyDown(IN_USE) then
			xdefmod.util.Reloaded = false
		end

		if IsValid(ply_weapon) and ply_weapon:GetClass() == "weapon_xdefm_rod" and GetConVar("xdefmod_fps"):GetInt() ~= 1 then
			if not xdefmod.util.see_ang then
				xdefmod.util.see_ang = Angle(0, cmd:GetViewAngles().yaw, 0)
				cmd:SetViewAngles(xdefmod.util.see_ang)
			else
				xdefmod.util.see_ang = xdefmod.util.see_ang + Angle(cmd:GetMouseY() / 50, -cmd:GetMouseX() / 50, 0)
				xdefmod.util.see_ang = Angle(math.Clamp(xdefmod.util.see_ang.pitch, -90, 90), xdefmod.util.see_ang.yaw, 0)
			end
		else
			if xdefmod.util.see_ang then
				xdefmod.util.see_ang = nil
			end

			if xdefmod.util.camera_ang then
				xdefmod.util.camera_ang = nil
			end
		end

		if cmd:KeyDown(IN_WALK) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_BACK) or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) then
			if xdefmod.util.camera_ang then
				xdefmod.util.camera_ang = nil
			end

			if xdefmod.util.see_ang and IsValid(ply_weapon) and ply_weapon:GetClass() == "weapon_xdefm_rod" then
				cmd:SetViewAngles(Angle(math.Clamp(xdefmod.util.see_ang.pitch, -45, 45), xdefmod.util.see_ang.yaw, 0))
			end
		elseif IsValid(ply_weapon) and ply_weapon:GetClass() == "weapon_xdefm_rod" then
			if not xdefmod.util.camera_ang then
				xdefmod.util.camera_ang = cmd:GetViewAngles()
			else
				cmd:SetViewAngles(xdefmod.util.camera_ang)
			end
		end
	end)

	hook.Add("RenderScene", "xdefm_MoveRod", function()
		for _, ent_fishing in pairs(ents.FindByClass("xdefm_*")) do
			if IsValid(ent_fishing) and ent_fishing:GetClass() ~= "xdefm_firespot" and IsValid(ent_fishing:GetFMod_OW()) and isfunction(ent_fishing.xdefm_Move) then
				ent_fishing:xdefm_Move()
			end
		end
	end)

	hook.Add("HUDPaint", "xdefm_Notes", function()
		local ply = LocalPlayer()
		if istable(xdefmod.util.notes) and #xdefmod.util.notes > 0 then
			local hei = 0
			for k, v in pairs(xdefmod.util.notes) do
				if istable(v) and #v == 4 and (v[1] >= SysTime() or math.Round(v[4], 2) ~= 0) then
					local aaa = math.Clamp(math.Round(v[4] * 255), 1, 254)

					surface.SetFont("xdefm_Font1")
					local size, _ = surface.GetTextSize(v[2])
					size = math.Clamp(size, 15, 200)

					local mark = markup.Parse("<color=255,255,255,255><font=xdefm_Font1>" .. v[2] .. "</color></font>", size * 2)
					local posx, posy, ler = math.Round(ScrW() - 10, 2), math.Round(ScrH() / 2 + hei, 2), v[4]

					draw.RoundedBox(0, posx - mark:GetWidth() * ler - 5 - 35, posy + 1, mark:GetWidth() + 20 + 20, mark:GetHeight() + 10, Color(xdefmod.COLOR_LINE.r, xdefmod.COLOR_LINE.g, xdefmod.COLOR_LINE.b, aaa))
					draw.RoundedBox(0, posx - mark:GetWidth() * ler - 4 - 35, posy + 2, mark:GetWidth() + 18 + 20, mark:GetHeight() + 8, Color(xdefmod.COLOR_BORDER.r, xdefmod.COLOR_BORDER.g, xdefmod.COLOR_BORDER.b, aaa))
					draw.RoundedBox(0, posx - mark:GetWidth() * ler - 3 - 35, posy + 3, mark:GetWidth() + 16 + 20, mark:GetHeight() + 6, Color(xdefmod.COLOR_BACKGROUND.r, xdefmod.COLOR_BACKGROUND.g, xdefmod.COLOR_BACKGROUND.b, aaa))
					draw.RoundedBoxEx(0, posx - mark:GetWidth() * ler - 38, posy + 3, 22, mark:GetHeight() + 6, Color(xdefmod.COLOR_BORDER.r * 0.5, xdefmod.COLOR_BORDER.g * 0.5, xdefmod.COLOR_BORDER.b * 0.5, aaa), true, false, true, false)

					mark:Draw(posx - mark:GetWidth() * ler + mark:GetWidth() * 0.5 - 10, posy + 6, TEXT_ALIGN_CENTER, nil, aaa)

					surface.SetMaterial(v[3])
					surface.SetDrawColor(255, 255, 255, aaa)
					surface.DrawTexturedRect(posx - mark:GetWidth() * ler - 36, posy + mark:GetHeight() * 0.5 - 1, 16, 16)

					hei = hei + math.Round((mark:GetHeight() + 15) * math.Clamp(ler, 0.01, 1), 3)
				end
			end
		end

		if IsValid(ply) and IsValid(ply:GetWeapon("weapon_xdefm_trade")) and not ply:GetNWBool("XDEFMod_BTD") then
			local tax = ply:GetNWEntity("XDEFMod_TPL")
			for k, v in pairs(player.GetAll()) do
				if IsValid(v) and v:Alive() and v:WorldSpaceCenter():DistToSqr(ply:WorldSpaceCenter()) <= 70000 then
					local tar = v:GetNWEntity("XDEFMod_TPL")
					if tar:IsPlayer() and tar == ply and tax ~= v then
						local col, scr = Color(255, 255, 0), v:WorldSpaceCenter():ToScreen()
						scr.x = math.Round(scr.x)
						scr.y = math.Round(scr.y)

						draw.TextShadow({
							text = v:Nick(),
							pos = { scr.x, scr.y },
							font = "xdefm_Font5",
							xalign = TEXT_ALIGN_CENTER,
							yalign = TEXT_ALIGN_CENTER,
							color = col
						}, 1, 255)

						draw.TextShadow({
							text = language.GetPhrase("xdefm.Trade10"),
							pos = { scr.x, scr.y + 20 },
							font = "xdefm_Font1",
							xalign = TEXT_ALIGN_CENTER,
							yalign = TEXT_ALIGN_CENTER,
							color = col
						}, 1, 255)
					end
				end
			end
		end
	end)

	hook.Add("DrawOverlay", "xdefm_Info", function()
		local ply = LocalPlayer()
		local item_data = "_"
		if not IsValid(xdefmod.util.aim_pan) and xdefmod.util.marker ~= nil then
			xdefmod.util.marker = nil
		end

		if IsValid(xdefmod.util.aim_pan) and xdefmod.util.marker ~= nil and vgui.CursorVisible() then
			local pan = xdefmod.util.aim_pan
			local mat, typ, ite, use, man = ICON_0, pan.S_Type, pan.S_Item, false, xdefmod.util.menus
			local k1 = ite ~= "_" and (input.IsControlDown() or input.IsButtonDown(KEY_LCONTROL) or input.IsButtonDown(KEY_RCONTROL))
			local k2 = ite ~= "_" and not k1 and (input.IsShiftDown() or input.IsButtonDown(KEY_LSHIFT) or input.IsButtonDown(KEY_RSHIFT))
			if k1 and typ == "Inventory" then
				use = true
				mat = (xdefm_GetPrice(ite) > 0 and ICON_3 or ICON_4)
			elseif k2 then
				if typ == "Inventory" then
					local _, bb = xdefm_ItemGet(ite)
					if istable(bb) then
						use = true
						if IsValid(man["Bank"]) then
							mat = ICON_5
						elseif bb.Type == "Recipe" and IsValid(man["Craft"]) then
							mat = ICON_6
						elseif bb.Type == "Bait" then
							mat = ICON_5
						end
					end
				end

				if typ == "Inventory" and (IsValid(man["Bank"]) or IsValid(man["Trade"]) or (IsValid(man["Struct"]) and man["Struct"].N_SType == 1)) then
					use = true
					mat = ICON_2
				elseif typ == "Bank" and IsValid(man["Inventory"]) then
					use = true
					mat = ICON_1
				elseif typ == "Storage" and IsValid(man["Inventory"]) then
					use = true
					mat = ICON_1
				elseif typ == "Recipe" and IsValid(man["Inventory"]) then
					use = true
					mat = ICON_1
				end
			end

			local xx, yy = input.GetCursorPos()
			surface.SetDrawColor(255, 255, 255, 255)
			surface.SetMaterial(mat)

			if use then
				surface.DrawTexturedRect(xx, yy, 16, 16)
			else
				surface.DrawTexturedRect(xx, yy, 24, 24)
			end
		end

		if IsValid(ply) and not vgui.CursorVisible() and ply:GetEyeTrace() ~= nil then
			local ent = ply:GetEyeTrace().Entity
			if IsValid(ent) and ent.xdefm_OnLook then
				local ent_data = ply:GetEyeTrace().Entity:GetFMod_DT()
				if isstring(ent_data) then
					item_data = ent_data
				end
			end
		elseif IsValid(ply) and isstring(xdefmod.util.marker) and not dragndrop.IsDragging() then
			item_data = xdefmod.util.marker
		end

		local is_empty_item = (item_data == "_")
		if GetConVar("xdefmod_animui"):GetInt() > 0 then
			local ttt = string.Explode("|", item_data)
			if xdefmod.util.ls ~= ttt[1] then
				xdefmod.util.ls = ttt[1]
				if item_data ~= "_" then xdefmod.util.ds = item_data end
				xdefmod.util.dl = SysTime() + 0.25
			end
		end

		if IsValid(ply) and (xdefmod.util.ds ~= "_" or xdefmod.util.dl > SysTime()) then
			item_data = xdefmod.util.ds

			local aa, bb = xdefm_ItemGet(item_data)
			if istable(aa) and istable(bb) then
				local xx, yy = 0, 0
				local ent = ply:GetEyeTrace().Entity
				if xdefmod.util.key_ent ~= ent then
					xdefmod.util.key_ent = ent
					xdefmod.util.key_ler = 0
				end

				if IsValid(ent) and ent:GetClass() == "xdefm_base" and not vgui.CursorVisible() then
					xx = ent:GetPos():ToScreen().x
					yy = ent:GetPos():ToScreen().y
				else
					xx, yy = input.GetCursorPos()
					if xx == 0 and yy == 0 then
						xx, yy = ScrW() / 2, ScrH() / 2
					end
				end

				if not is_empty_item then
					xdefmod.util.dx, xdefmod.util.dy = xx, yy
					if xdefmod.util.ds ~= item_data then
						xdefmod.util.key_ler = 0
					end
					xdefmod.util.ds = item_data
				else
					xx, yy = xdefmod.util.dx, xdefmod.util.dy
				end

				xx, yy = math.Round(xx + 28, 1), math.Round(yy + 28, 1)

				if istable(xdefmod.util.craft) and xdefmod.util.lc and not (input.IsShiftDown() or input.IsButtonDown(KEY_LSHIFT) or input.IsButtonDown(KEY_RSHIFT)) then
					local cft = xdefmod.util.craft
					local ite = ply.xdefm_Profile.Items
					local per = (GetConVar("xdefmod_animui"):GetInt() > 0 and math.Clamp((xdefmod.util.dl - SysTime()) / 0.25, 0, 1) or 1)
					if not is_empty_item then
						per = 1 - per
					end

					xx, yy = input.GetCursorPos()
					xx, yy = math.Round(xx, 1), math.Round(yy, 1)

					if not istable(xdefmod.util.ings) then
						xdefmod.util.ings = {}
						xdefmod.util.ing2 = {}
					else
						local itt, yes = cft[#xdefmod.util.ings + 1], false
						if isstring(itt) and #xdefmod.util.ings + 1 ~= #cft then
							for m, n in pairs(ite) do
								if n ~= "_" and m ~= 21 and xdefm_GetClass(n) == itt and not isbool(xdefmod.util.ing2[m]) then
									yes = true
									xdefmod.util.ing2[m] = true
									break
								end
							end

							table.insert(xdefmod.util.ings, yes)
						end

						local upp = false
						local x2, y2 = xx, yy
						render.SetScissorRect(xx + 16, yy, xx + 48 + 150, yy + ((#cft) * 24 + 48) * per, true)

						for k, v in pairs(xdefmod.util.ings) do
							if isbool(v) and isstring(cft[k]) then
								local _, bb = xdefm_ItemGet(cft[k]) -- FIXME: "bb" shadows existing binding!
								if istable(bb) then
									local col = (v and Color(0, 255, 0) or Color(255, 0, 0))
									local bck = (v and Color(100, 100, 100) or Color(55, 55, 55))
									x2, y2 = xx + 20, yy + k * 25
									surface.SetDrawColor(bck)
									surface.DrawRect(x2 - 4, y2 - 4, 28 + 150, 26)
									surface.SetDrawColor(xdefmod.COLOR_BORDER)
									surface.DrawOutlinedRect(x2 - 4, y2 - 4, 28 + 150, 26, 2)
									surface.SetDrawColor(xdefmod.COLOR_LINE)
									surface.DrawOutlinedRect(x2 - 4, y2 - 4, 28 + 150, 26, 1)
									surface.SetDrawColor(255, 255, 255, 255)
									surface.SetMaterial(xdefmod.util.ITEM_ICONS[bb.Type])
									surface.DrawTexturedRect(x2 + 2, y2 + 1, 16, 16)
									draw.TextShadow({
										text = xdefm_ItemMark(cft[k], true),
										pos = { x2 + 4 + 19, y2 + 2 },
										font = "xdefm_Font2",
										xalign = TEXT_ALIGN_LEFT,
										yalign = TEXT_ALIGN_TOP,
										color = col
									}, 1, 255)
									if not upp then
										upp = true
										local ye2 = true
										for k, v in pairs(xdefmod.util.ings) do if v == false then -- FIXME: "k" and "v" shadow existing bindings!
												ye2 = false
												break
											end end
										x2, y2 = x2 + 146, y2 + #cft * 25
										draw.RoundedBoxEx(0, x2 - 4, y2 - 27, 32, 25, xdefmod.COLOR_LINE, true, true, false, false)
										draw.RoundedBoxEx(0, x2 - 4 + 1, y2 - 27 + 1, 32 - 2, 25 - 2, xdefmod.COLOR_BORDER, true, true, false, false)
										draw.RoundedBoxEx(0, x2 - 4 + 2, y2 - 27 + 2, 32 - 4, 25 - 4, ye2 and Color(0, 100, 0) or Color(100, 0, 0), true, true, false, false)
										surface.SetDrawColor(255, 255, 255, 255)
										surface.SetMaterial(ye2 and ICON_YES or ICON_NO)
										surface.DrawTexturedRect(x2 + 4, y2 - 22, 16, 16)
									end
								end
							end
						end

						render.SetScissorRect(0, 0, 0, 0, false)
					end
				else
					if istable(xdefmod.util.ings) then
						xdefmod.util.ings = nil
						xdefmod.util.ing2 = nil
					end

					local rar = (bb.Rarity + 1)
					local col = xdefmod.util.RARITY_COLORS[rar]
					local txt = xdefm_ItemMark(item_data)
					if string.find(string.lower(txt), "&") ~= nil then
						local tab = string.Explode("&", txt)

						for k, v in pairs(tab) do
							if v ~= "" and v ~= " " and string.find(string.lower(v), "xdefm.") ~= nil then
								tab[k] = language.GetPhrase(v)
							end
						end

						txt = table.concat(tab, "")
					elseif string.find(string.lower(txt), "xdefm.") then
						txt = language.GetPhrase(txt)
					end

					local markup_string = "<font=xdefm_Font1>" .. string.Replace(txt, "&", "") .. "</font>\n"
					if GetConVar("developer"):GetInt() > 0 then
						markup_string = markup_string .. "<font=xdefm_Font2><color=155,155,155,255>[" .. item_data .. "]</color></font>\n"
					end

					markup_string = markup_string .. "<font=xdefm_Font2><color=155,155,155,255>" .. language.GetPhrase(xdefmod.util.RARITY_NAMES[rar]) .. " " .. language.GetPhrase("xdefm." .. bb.Type) .. "</color></font>\n\n"

					if language.GetPhrase(bb.Helper) ~= "" then
						markup_string = markup_string .. "<font=xdefm_Font2><color=255,255,255,255>" .. language.GetPhrase(bb.Helper) .. "</color></font>\n\n"
					end

					local prc = xdefm_GetPrice(item_data)
					if bb.Type == "Bait" and isnumber(bb.Consume) then
						local per = tostring(math.Round((1 / bb.Consume) * 100)) .. "%"
						markup_string = markup_string .. "<font=xdefm_Font2><color=155,155,155,255>" .. language.GetPhrase("xdefm.Consume") .. ": " .. per .. "</color></font>\n"
						markup_string = markup_string .. "<font=xdefm_Font2><color=155,155,155,255>" .. language.GetPhrase("xdefm.Level") .. ": " .. bb.Level .. "</color></font>\n"
					elseif bb.Type == "Recipe" and isnumber(bb.Durability) then
						if aa[2] then
							markup_string = markup_string .. "<font=xdefm_Font2><color=155,155,155,255>" .. language.GetPhrase("xdefm.Durability") .. ": " .. aa[2] .. "/" .. bb.Durability .. "</color></font>\n"
						else
							markup_string = markup_string .. "<font=xdefm_Font2><color=155,155,155,255>" .. language.GetPhrase("xdefm.Durability") .. ": " .. bb.Durability .. "</color></font>\n"
						end
					end

					if IsValid(ent) and ent:GetClass() == "xdefm_base" and not vgui.CursorVisible() then
						local own = ""
						if IsValid(ent:GetFMod_OW()) and ent:GetFMod_OW():IsPlayer() then
							own = ent:GetFMod_OW():Nick()
						elseif isstring(ent:GetFMod_OI()) and ent:GetFMod_OI() ~= "" then
							own = ent:GetFMod_OI()
						end
						if own ~= "" then
							markup_string = markup_string .. "<font=xdefm_Font2><color=155,155,155,255>" .. language.GetPhrase("xdefm.Owner") .. ": " .. own .. "</color></font>\n"
						end
					end

					if prc > 0 then
						markup_string = markup_string .. "<font=xdefm_Font2><color=155,155,155,255>" .. language.GetPhrase("xdefm.Price") .. ": " .. prc .. "</color></font>"
					end

					local markup_obj = markup.Parse(markup_string, 250)
					--local ww = markup_obj:GetWidth() -- Unused?
					local hh = markup_obj:GetHeight()
					local animation_state = (GetConVar("xdefmod_animui"):GetInt() > 0 and math.Clamp((xdefmod.util.dl - SysTime()) / 0.25, 0, 1) or 1)
					if not is_empty_item then
						animation_state = 1 - animation_state
					end

					local color_alpha = animation_state * 255
					if GetConVar("xdefmod_collect"):GetInt() > 0 and not isnumber(xdefmod.bestiary[xdefm_GetClass(item_data)]) then
						draw.TextShadow({
							text = language.GetPhrase("xdefm.Besti2"),
							pos = { xx + 256, yy + hh * animation_state + 20 },
							font = "xdefm_Font1",
							xalign = TEXT_ALIGN_RIGHT,
							yalign = TEXT_ALIGN_CENTER,
							color = Color(0, 255, 255, color_alpha)
						}, 1, color_alpha)
					end

					local x2 = xx - 7.5
					local y2 = yy - 7.5
					local w2 = 265
					local h2 = hh + 15
					-- Set clipping rectangle for drawing area based on animation state
					render.SetScissorRect(x2 - 4, y2 - 4, x2 + (w2 + 4) * animation_state, y2 + (h2 + 4) * animation_state, true)

					-- Reset texture
					draw.NoTexture()

					-- Draw outer cut-corner box
					surface.SetDrawColor(Color(col.r * 2, col.g * 2, col.b * 2, color_alpha))
					xdefm_CutBox(w2 / 10, x2 - 2, y2 - 2, w2 + 4, h2 + 4, false, false, true, false)

					-- Draw inner cut-corner box
					surface.SetDrawColor(Color(col.r * 0.15, col.g * 0.15, col.b * 0.15, color_alpha))
					xdefm_CutBox(w2 / 10, x2 - 1, y2 - 1, w2 + 2, h2 + 2, false, false, true, false)

					surface.SetDrawColor(col.r * 0.25 * color_alpha / 255, col.g * 0.25 * color_alpha / 255, col.b * 0.25 * color_alpha / 255, color_alpha)
					surface.SetMaterial(ICON_BACK)
					surface.DrawTexturedRect(xx - 7.5, yy - 7.5, 265, math.min(50, hh))

					markup_obj:Draw(xx, yy, nil, nil, color_alpha)
					render.SetScissorRect(0, 0, 0, 0, false)

					if IsValid(ent) and item_data ~= "_" and ent:GetClass() == "xdefm_base" and not vgui.CursorVisible() and animation_state > 0 and (xdefm_CanInteract(LocalPlayer(), ent) or (GetConVar("xdefmod_animui"):GetInt() > 0 and xdefmod.util.key_ler > 0)) then
						xdefmod.util.key_ler = Lerp(0.1, xdefmod.util.key_ler, xdefm_CanInteract(LocalPlayer(), ent) and 1 or 0)

						local hei = markup_obj:GetHeight() * animation_state + 15
						local alp = GetConVar("xdefmod_animui"):GetInt() > 0 and math.Clamp(xdefmod.util.key_ler / 1 * 255, 0, 255) or 255
						local k1 = input.LookupBinding("+use", true)
						if isstring(bb.HelperUse) and isstring(k1) and bb.HelperUse ~= "" then
							local kk = string.Explode("", k1)
							if not istable(kk) then
								k1 = string.upper(k1)
							else
								kk[1] = string.upper(kk[1])
								k1 = table.concat(kk, "")
							end

							surface.SetFont("xdefm_Font5")
							local x1, y1 = surface.GetTextSize(k1)

							xx, yy = math.Round(xx), math.Round(yy)
							draw.RoundedBox(0, xx - 4, yy + hei, x1 + 8, y1, ply:KeyDown(IN_USE) and Color(155, 155, 155, alp) or Color(55, 55, 55, alp))

							surface.SetDrawColor(Color(255, 255, 255, alp))
							surface.DrawOutlinedRect(xx - 4, yy + hei, x1 + 8, y1, 2)
							surface.SetDrawColor(Color(0, 0, 0, alp))
							surface.DrawOutlinedRect(xx - 4, yy + hei, x1 + 8, y1, 1)

							draw.TextShadow({
								text = k1,
								pos = { xx + x1 / 2 - 2, yy + hei + y1 / 2 },
								font = "xdefm_Font1",
								xalign = TEXT_ALIGN_CENTER,
								yalign = TEXT_ALIGN_CENTER,
								color = ply:KeyDown(IN_USE) and Color(255, 255, 0, alp) or Color(255, 255, 255, alp)
							}, 1, alp)

							draw.TextShadow({
								text = language.GetPhrase(bb.HelperUse),
								pos = { xx + x1 + 12, yy + hei + y1 / 2 },
								font = "xdefm_Font2",
								xalign = TEXT_ALIGN_LEFT,
								yalign = TEXT_ALIGN_CENTER,
								color = Color(255, 255, 255, alp)
							}, 1, alp)

							hei = hei + y1 + 5
						end

						local k2 = input.LookupBinding("+reload", true)

						if isstring(k1) and isstring(k2) then
							local kk1 = string.Explode("", k1)
							if not istable(kk1) then
								k1 = string.upper(k1)
							else
								kk1[1] = string.upper(kk1[1])
								k1 = table.concat(kk1, "")
							end

							local kk2 = string.Explode("", k2)
							if not istable(kk2) then
								k2 = string.upper(k2)
							else
								kk2[1] = string.upper(kk2[1])
								k2 = table.concat(kk2, "")
							end

							surface.SetFont("xdefm_Font5")
							local x1, y1 = surface.GetTextSize(k2)
							local x2, y2 = surface.GetTextSize(k1) -- FIXME: "x2" and "y2" shadow existing bindings!
							draw.RoundedBox(0, xx - 4, yy + hei, x1 + 8, y1, ply:KeyDown(IN_RELOAD) and Color(155, 155, 155, alp) or Color(55, 55, 55, alp))

							surface.SetDrawColor(Color(255, 255, 255, alp))
							surface.DrawOutlinedRect(xx - 4, yy + hei, x1 + 8, y1, 2)
							surface.SetDrawColor(Color(0, 0, 0, alp))
							surface.DrawOutlinedRect(xx - 4, yy + hei, x1 + 8, y1, 1)
							draw.RoundedBox(0, xx - 4 + x1 + 28, yy + hei, x2 + 8, y2, ply:KeyDown(IN_USE) and Color(155, 155, 155, alp) or Color(55, 55, 55, alp))

							surface.SetDrawColor(Color(255, 255, 255, alp))
							surface.DrawOutlinedRect(xx - 4 + x1 + 28, yy + hei, x2 + 8, y2, 2)
							surface.SetDrawColor(Color(0, 0, 0, alp))
							surface.DrawOutlinedRect(xx - 4 + x1 + 28, yy + hei, x2 + 8, y2, 1)

							local dst = (bb.Price > 0 and "xdefm.Sell" or "xdefm.Destroy")
							if bb.Carryable and ((bb.Type == "Bait" or bb.Type == "Recipe") or GetConVar("xdefmod_tempmode"):GetInt() <= 0) then
								dst = "xdefm.Store"
							end

							draw.TextShadow({
								text = k2,
								pos = { xx + x1 / 2 - 2, yy + hei + y1 / 2 },
								font = "xdefm_Font1",
								xalign = TEXT_ALIGN_CENTER,
								yalign = TEXT_ALIGN_CENTER,
								color = ply:KeyDown(IN_RELOAD) and Color(255, 255, 0, alp) or Color(255, 255, 255, alp)
							}, 1, alp)

							draw.TextShadow({
								text = k1,
								pos = { xx + x1 + x2 / 2 + 28 - 2, yy + hei + y1 / 2 },
								font = "xdefm_Font1",
								xalign = TEXT_ALIGN_CENTER,
								yalign = TEXT_ALIGN_CENTER,
								color = ply:KeyDown(IN_USE) and Color(255, 255, 0, alp) or Color(255, 255, 255, alp)
							}, 1, alp)

							draw.TextShadow({
								text = "+",
								pos = { xx + x1 + 14, yy + hei + y1 / 2 },
								font = "xdefm_Font4",
								xalign = TEXT_ALIGN_CENTER,
								yalign = TEXT_ALIGN_CENTER,
								color = Color(255, 255, 255, alp)
							}, 1, alp)

							draw.TextShadow({
								text = language.GetPhrase(dst),
								pos = { xx + x1 + x2 + 40, yy + hei + y1 / 2 },
								font = "xdefm_Font2",
								xalign = TEXT_ALIGN_LEFT,
								yalign = TEXT_ALIGN_CENTER,
								color = Color(255, 255, 255, alp)
							}, 1, alp)
						end
					elseif xdefmod.util.key_ler ~= 0 then
						xdefmod.util.key_ler = 0
					end
				end
			end
		end
	end)

	hook.Add("Think", "xdefm_TKCL", function()
		-- Smoothly transition between different FOV values
		if xdefmod.util.fov ~= xdefmod.util.lfov then
			xdefmod.util.fov = Lerp(0.1, xdefmod.util.fov, xdefmod.util.lfov)
		end

		-- Calculate visibility of notes (only last 6 shown) with smooth fade-in / fade-out
		-- Remove all notes past their duration after fully faded-out
		local ply = LocalPlayer()
		if IsValid(ply) and istable(xdefmod.util.notes) and #xdefmod.util.notes > 0 then
			-- local hei = 0 -- Unused?
			for note_index, note_data in pairs(xdefmod.util.notes) do
				if istable(note_data) and #note_data == 4 and (note_data[1] >= SysTime() or math.Round(note_data[4], 2) ~= 0) then
					if note_data[1] >= SysTime() and note_index >= #xdefmod.util.notes - 6 then
						note_data[4] = Lerp(0.2, note_data[4], 1)
					else
						note_data[4] = Lerp(0.1, note_data[4], 0)
					end
				else
					table.remove(xdefmod.util.notes, note_index)
				end
			end
		end
	end)

	-- Prevents HUD from drawing player info with trading weapon in hand
	hook.Add("HUDDrawTargetID", "xdefm_Info", function()
		local ply = LocalPlayer()
		if IsValid(ply) and IsValid(ply:GetActiveWeapon()) and ply:GetActiveWeapon():GetClass() == "weapon_xdefm_trade" then
			return false
		end
	end)

	-- Prevents changing weapons in 3rd person with fishing rod in hand
	hook.Add("PlayerBindPress", "xdefm_WheelView", function(ply, bind, pressed)
		local ply_weapon = ply:GetActiveWeapon()
		if IsValid(ply_weapon) and ply_weapon:GetClass() == "weapon_xdefm_rod" and GetConVar("xdefmod_fps"):GetInt() ~= 1 and (string.find(bind, "invprev") or string.find(bind, "invnext")) then
			return true
		end
	end)

	-- Net messages

	-- Receives and opens menu type with specific menu data
	net.Receive("NET_xdefm_Menu", function()
		local ply = LocalPlayer()
		local menu_type = tonumber(net.ReadString())
		local menu_data = util.JSONToTable(net.ReadString())
		if menu_type ~= nil and menu_data ~= nil then
			xdefm_OpenMenu(ply, menu_type, menu_data)
		end
	end)

	--- NOTE: Only use is currently for playing "ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE" on casting the fishing rod
	-- Receives and plays specified activity (act) in gesture slot for attack and reload
	net.Receive("NET_xdefm_Anim", function()
		local ply = net.ReadEntity()
		local act = net.ReadFloat()
		if IsValid(ply) and isnumber(act) and ply:IsPlayer() then
			ply:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, math.Round(act), true)
		end
	end)

	-- Receives and updates the local player profile data
	net.Receive("NET_xdefm_Profile", function()
		local ply_profile_data = net.ReadString()
		if not isstring(ply_profile_data) or ply_profile_data == "" then return end

		local ply_profile = util.JSONToTable(ply_profile_data)
		if not istable(ply_profile) then return end

		LocalPlayer().xdefm_Profile = ply_profile
	end)

	-- Receives and shows a note for duration (in seconds) with specified text, sound and icon
	net.Receive("NET_xdefm_SendNote", function()
		local note_text = net.ReadString()
		local note_sound = net.ReadString()
		local note_duration = net.ReadFloat()
		local note_icon = net.ReadString()
		xdefm_AddNote(LocalPlayer(), note_text, note_sound, note_icon, note_duration)
	end)

	-- Receives and plays sound directly on client (e.g. UI sounds)
	net.Receive("NET_xdefm_SendSnd", function()
		--local ply = LocalPlayer() -- Unused?
		local snd = net.ReadString()
		if isstring(snd) and snd ~= "" and snd ~= "!V" then
			surface.PlaySound(snd)
		end
	end)

	-- Receives and plays break effect with specified material type
	net.Receive("NET_xdefm_BreakEF", function()
		local ent = net.ReadEntity()
		local material_type = net.ReadFloat()
		if IsEntity(ent) and isnumber(material_type) then
			xdefm_BreakEffect(ent, material_type)
		end
	end)

	--- Receives and updates the menu data of specified menu type
	net.Receive("NET_xdefm_MenuUpdate", function()
		local menu_type = net.ReadFloat()
		local menu_data_json = net.ReadString()
		if not isnumber(menu_type) or not isstring(menu_data_json) or menu_data_json == "" then return end

		menu_type = math.Round(menu_type)
		local menu_data = util.JSONToTable(menu_data_json)
		if not istable(menu_data) then return end

		if istable(xdefmod.util.menus) then
			for _, menu_panel in pairs(xdefmod.util.menus) do
				if ispanel(menu_panel) and isfunction(menu_panel.XDEFM_Update) then
					menu_panel:XDEFM_Update(menu_type, menu_data)
				end
			end
		end
	end)

	-- Receives and plays effect with specified data
	net.Receive("NET_xdefm_CLEffect", function()
		local effect_name = net.ReadString()
		local effect_data = util.JSONToTable(net.ReadString())
		if not istable(effect_data) then return end
		xdefm_BroadEffect(effect_name, effect_data)
	end)

	-- Receives and updates leaderboard data
	net.Receive("NET_xdefm_Leaderboard", function()
		local leaderboard_data_json = net.ReadString()
		local leaderboard_data = util.JSONToTable(leaderboard_data_json)
		if not istable(leaderboard_data) then return end

		xdefmod.leader = leaderboard_data

		if IsValid(xdefmod.util.menus["Inventory"]) then
			xdefmod.util.menus["Inventory"]:XDEFM_Update(7, leaderboard_data)
		end

		-- REVIEW: Does the leaderboard really need to be saved client-side over sessions?
		file.Write("xdefishmod/leaderboard.txt", leaderboard_data_json)
	end)

	-- Receives and registers an item in bestiary record
	net.Receive("NET_xdefm_BestiaryRecord", function()
		local item_name = net.ReadString()
		local ply = LocalPlayer()
		if not IsValid(ply) or not istable(ply.xdefm_Profile) or not isnumber(ply.xdefm_Profile.UpdA) then return end

		if istable(xdefmod.bestiary) and not isnumber(xdefmod.bestiary[item_name]) then
			xdefm_AddNote(ply, "xdefm.Besti4&" .. xdefm_ItemMark(item_name), "npc/scanner/scanner_photo1.wav", "camera_add", 5)
			xdefmod.bestiary[item_name] = 0
			xdefm_BestiarySave()
		end
	end)

	-- Receives and either unlocks (1) or clears (2) all bestiary records (superadmin only)
	net.Receive("NET_xdefm_BestiaryAll", function()
		local cmd_mode = math.Round(net.ReadFloat())
		xdefmod.bestiary = {}

		if cmd_mode == 1 then
			for item_name, _ in pairs(xdefmod.items) do
				xdefmod.bestiary[item_name] = 0
			end
		end

		xdefm_BestiarySave()
	end)

	-- Receives and updates shop items (with current sales, if enabled)
	net.Receive("NET_xdefm_UpdateShop", function()
		local tab = util.JSONToTable(net.ReadString())
		if not istable(tab) then return end

		for item_name, sale_value in pairs(tab) do
			if istable(xdefmod.shop[item_name]) then
				xdefmod.shop[item_name][1] = sale_value
			end
		end
	end)

	-- Receives and sets current quest data
	net.Receive("NET_xdefm_Quest", function()
		xdefmod.quests = util.JSONToTable(net.ReadString())
		if IsValid(xdefmod.util.menus["Quest"]) then
			xdefmod.util.menus["Quest"]:XDEFM_Update(10, xdefmod.quests)
		end
	end)

	-- Receives and closes menu type
	net.Receive("NET_xdefm_MenuClose", function()
		xdefm_CloseMenu(LocalPlayer(), net.ReadString())
	end)
end

if SERVER then -- Server only
	xdefmod.quests = {}
	xdefmod.skips = {}
	xdefmod.pools = {}
	xdefmod.util.SaleTime = 0
	xdefmod.util.ShutDown = false
	xdefmod.util.LeadTime = 0

	local leaderboard_timer = "xdefm_leaderboardupdate"

	util.AddNetworkString("NET_xdefm_Anim")
	util.AddNetworkString("NET_xdefm_Profile")
	util.AddNetworkString("NET_xdefm_Menu")
	util.AddNetworkString("NET_xdefm_Cmd")
	util.AddNetworkString("NET_xdefm_SendNote")
	util.AddNetworkString("NET_xdefm_SendSnd")
	util.AddNetworkString("NET_xdefm_BreakEF")
	util.AddNetworkString("NET_xdefm_UpdateShop")
	util.AddNetworkString("NET_xdefm_NeedProfile")
	util.AddNetworkString("NET_xdefm_MenuUpdate")
	util.AddNetworkString("NET_xdefm_MenuClose")
	util.AddNetworkString("NET_xdefm_SendFriends")
	util.AddNetworkString("NET_xdefm_ConsoleCmd")
	util.AddNetworkString("NET_xdefm_CLEffect")
	util.AddNetworkString("NET_xdefm_Pickup")
	util.AddNetworkString("NET_xdefm_Leaderboard")
	util.AddNetworkString("NET_xdefm_BestiaryRecord")
	util.AddNetworkString("NET_xdefm_BestiaryAll")
	util.AddNetworkString("NET_xdefm_Quest")

	--- Adds an item group to the pools, assigning it to pools based on the baits specified in the chances data.
	--- @param item_group_data table: Defines the item group with attributes including Items, Level, Exp, DepthMin, DepthMax, GroundOnly, and Chances.
	--- @return boolean: True if the item group was successfully added to the pool, false otherwise.
	function xdefm_PoolAdd(item_group_data)
		if not istable(item_group_data) then
			return false
		end

		local item_group = {}
		item_group.Items = {} -- For hooked items, only use characters, no spaces allowed

		if isstring(item_group_data.Items) then
			item_group.Items = { item_group_data.Items }
		elseif istable(item_group_data.Items) then
			item_group.Items = item_group_data.Items
		else
			return false
		end

		item_group.Level      = isnumber(item_group_data.Level) and math.Clamp(math.Round(item_group_data.Level), 0, 1000) or 0 -- Level limit, maximum is 1000 (unlikely to be achieved)
		item_group.Exp        = isnumber(item_group_data.Exp) and math.Clamp(math.Round(item_group_data.Exp), 0, 2147483647) or 0 -- Successful fishing gains experience
		item_group.DepthMin   = isnumber(item_group_data.DepthMin) and math.Clamp(math.Round(item_group_data.DepthMin), 0, 2147483647) or 0 -- Minimum depth in meters, 0 is water surface
		item_group.DepthMax   = isnumber(item_group_data.DepthMax) and math.Clamp(math.Round(item_group_data.DepthMax), item_group.DepthMin, 2147483647) or 2147483647 -- Maximum depth in meters, can not be smaller than minimum depth
		item_group.GroundOnly = isbool(item_group_data.GroundOnly) and item_group_data.GroundOnly or false -- Limited to riverbeds, works better with depth effects

		-- TODO: Check if this can be replaced with an easier method of supplying different bait chances to an item group
		item_group.Chances    = {} -- Hook probability: Higher equals lower chance, 0 is certain. "_" is bare hook, "*" is universal bait. No blank bait allowed. Efficiency proportionally reduces this value.
		if isnumber(item_group_data.Chances) then
			if istable(item_group_data.Baits) then
				for _, bait in pairs(item_group_data.Baits) do
					item_group.Chances[bait] = math.max(0, math.Round(item_group_data.Chances))
				end
			elseif isstring(item_group_data.Baits) then
				item_group.Chances = { [item_group_data.Baits] = math.max(0, math.Round(item_group_data.Chances)) }
			else
				item_group.Chances = { ["_"] = math.max(0, math.Round(item_group_data.Chances)) }
			end
		elseif istable(item_group_data.Chances) then
			for bait, chance in pairs(item_group_data.Chances) do
				if isstring(bait) and isnumber(chance) then
					item_group.Chances[bait] = math.max(0, math.Round(chance))
				end
			end
		end

		if #item_group.Items <= 0 then
			return false
		end

		if item_group.DepthMin > item_group.DepthMax then
			item_group.DepthMin = item_group.DepthMax
		end

		local chances = item_group.Chances
		for bait, _ in pairs(item_group.Chances) do
			if not istable(xdefmod.pools[bait]) then
				xdefmod.pools[bait] = {}
			end

			item_group.Chances = chances[bait] -- Overwrites chances table to only the number for its specific bait
			table.insert(xdefmod.pools[bait], item_group) -- Overwrites item group in pools table with modified, bait specific table
		end

		return true
	end

	--- Selects an item from a pool based on input parameters.
	--- @param depth number: Fishing depth, at least 0.
	--- @param level number: Player level, between 0 and 1000.
	--- @param bait string: Bait used, defaults to "_".
	--- @param efficiency number: Efficiency (0-100%).
	--- @param ground boolean: True if ground-only.
	--- @return string|nil: The selected item name, or nil.
	--- @return number|nil: Optional experience, or nil.
	function xdefm_PoolGet(depth, level, bait, efficiency, ground)
		local no_depth = (GetConVar("xdefmod_nodepth"):GetInt() > 0)
		-- REVIEW: Introduce a max value for depth?
		-- Round depth and make sure it is at least 0
		depth = isnumber(depth) and math.max(0, math.Round(depth, 1)) or 0
		-- TODO: Replace hard-coded max level with configurable variable
		-- Round level (why?) and limit between 0 and max level
		level = isnumber(level) and math.Clamp(math.Round(level), 0, 1000) or 0
		bait = isstring(bait) and bait or "_"
		-- FIXME: Fix efficiency calculation
		-- TODO: Replace hard-coded max efficiency with configurable variable
		-- REVIEW: Change efficiency calculation to a logarithmic function based on upgrade level?
		-- Round efficiency (why?) and limit between 0 and 100 percent
		efficiency = isnumber(efficiency) and math.Clamp(math.Round(efficiency), 0, 100) or 0
		ground = isbool(ground) and ground or false

		-- TODO: Replace hard-coded chance with configurable variable
		-- Roll for random chance to pick generic bait pool
		if istable(xdefmod.pools["*"]) and math.random(1, 3) == 1 then
			bait = "*"
		end

		local pool = xdefmod.pools[bait]
		-- When "ba_gmod" bait is used, roll one from all available pools
		if bait == "ba_gmod" then
			local tab = {}
			for k, v in pairs(xdefmod.pools) do
				table.insert(tab, v)
			end

			pool = tab[math.random(#tab)]
		end

		if not istable(pool) then
			return nil, nil
		end

		-- Roll a random item group from the pool
		local item_group = pool[math.random(#pool)]
		if not istable(item_group) or not isnumber(item_group.Chances) then
			return nil, nil
		end

		local chance = item_group.Chances
		-- Roll a random value between chance, minus smaller value of either rounded up depth or half of chance,
		-- then multiply roll with efficiency percentage reduction and round everything up
		local roll = math.ceil(math.random(chance - math.min(math.ceil(depth / 0.01905), chance * 0.5)) * (1 - efficiency / 100))
		-- Roll can not be 0 or negative
		if roll <= 0 then
			return nil, nil
		end

		-- Check level requirements, minimum and maximum depth and ground-only flag
		if level < item_group.Level or (not no_depth and (depth < item_group.DepthMin or depth > item_group.DepthMax)) or (item_group.GroundOnly and not ground) then
			return nil, nil
		end

		-- Get list of items from item group
		local item_list = item_group.Items
		if not istable(item_list) then
			return nil, nil
		end

		-- Roll a random item from item list
		local item = item_list[math.random(#item_list)]
		if not isstring(item) then
			return nil, nil
		end

		-- Only on exactly 1, the roll will succeed and a random item from the list is picked
		return roll == 1 and item, item_group.Exp or nil, nil
	end

	--- Updates the server-side shop with new sales (if enabled) and sends updated shop to clients
	function xdefm_UpdateShop()
		local sales = {}
		for name, _ in pairs(xdefmod.shop) do
			if GetConVar("xdefmod_salecool"):GetInt() > 0 then
				sales[name] = math.Round(math.Rand(0.5, 1), 2)
				xdefmod.shop[name][1] = sales[name]
			else
				sales[name] = 1
				xdefmod.shop[name][1] = 1
			end
		end

		net.Start("NET_xdefm_UpdateShop")
		net.WriteString(util.TableToJSON(sales))
		net.Broadcast()
	end

	--- Creates a fire spot entity at `pos` with `size` and `power`. Optionally attaches to `parent`.
	--- @param pos Vector: Position of the fire spot.
	--- @param size number: Size (0-100, default 5).
	--- @param power number: Power (default is size).
	--- @param parent Entity?: Parent entity.
	--- @return Entity|nil: The created fire spot entity.
	function xdefm_FireSpot(pos, size, power, parent)
		if not isvector(pos) then
			return nil
		end

		size = isnumber(size) and math.Clamp(size, 0, 100) or 5
		power = isnumber(power) and math.max(power, 0) or size

		local ent = ents.Create("xdefm_firespot")
		ent:SetPos(pos)
		ent:SetAngles(Angle(0, 0, 0))
		ent.Owner = Entity(0)

		if IsEntity(parent) then
			ent:SetParent(parent)
			ent:SetAngles(parent:GetAngles())
		end

		ent:Spawn()
		ent:Activate()
		ent:SetFMod_Strength(size)
		ent:SetFMod_Enable(false)
		parent:DeleteOnRemove(ent)

		timer.Simple(0, function()
			if IsValid(ent) then
				ent.xdefm_Power = power
			end
		end)

		return ent
	end

	--- Updates a player's friend list from a file or provided data.
	--- @param ply Entity: The player whose friends list is updated.
	--- @param friends_data table?: Table of friends data, loads from file if nil.
	function xdefm_SetupFriends(ply, friends_data)
		if not IsValid(ply) or not ply:IsPlayer() or not isstring(ply:SteamID()) or ply:IsBot() then return end

		local friends_file = "xdefishmod/f_" .. string.Replace(ply:SteamID(), ":", "_") .. ".txt"
		if not istable(friends_data) then
			if file.Exists(friends_file, "DATA") then
				ply.xdefm_Friends = util.JSONToTable(file.Read(friends_file, "DATA"))
			else
				ply.xdefm_Friends = {}
				file.Write(friends_file, util.TableToJSON({}, true))
			end
		else
			-- Limit maximum number of friends to 16
			local updated_friends_data = {}
			local friends_count = 0
			for friend_id, friend_info in pairs(friends_data) do
				if friends_count > 16 then break end
				if isnumber(tonumber(friend_info[2])) and (tonumber(friend_info[2]) == 1 or tonumber(friend_info[2]) == 0) then
					updated_friends_data[friend_id] = friend_info
					friends_count = friends_count + 1
				end
			end

			-- Overwrite existing friend data
			ply.xdefm_Friends = updated_friends_data
			file.Write(friends_file, util.TableToJSON(updated_friends_data, true))

			xdefm_UpdateMenu(ply, 2, ply.xdefm_Friends)
			xdefm_AddNote(ply, "xdefm.FriendAd5", "buttons/combine_button1.wav", "group", 5)
		end
	end

	--- Checks if a player is allowed to interact with items owned by another player.
	--- @param ply Entity: The player attempting to interact.
	--- @param other_id string: The SteamID of the owner of the items to interact with.
	--- @return boolean: True if interaction is allowed, false otherwise.
	function xdefm_FriendAllow(ply, other_id)
		if not IsValid(ply) or not ply:IsPlayer() or ply:IsBot() or not isstring(ply:SteamID()) then
			return false
		end

		if ply:IsAdmin() or not isstring(other_id) or (other_id == "" or ply:SteamID() == other_id) then
			return true
		end

		local friends_file_path = "xdefishmod/f_" .. string.Replace(other_id, ":", "_") .. ".txt"
		local permission_value = 0
		local ply_id = ply:SteamID()
		local other = player.GetBySteamID(other_id)
		if IsValid(other) and istable(other.xdefm_Friends) then
			if istable(other.xdefm_Friends[ply_id]) then
				permission_value = other.xdefm_Friends[ply_id][2]
			end
		elseif file.Exists(friends_file_path, "DATA") then
			local dat = util.JSONToTable(file.Read(friends_file_path, "DATA"))
			if not istable(dat) or not istable(tab[ply_id]) or #tab[ply_id] ~= 2 then
				permission_value = 0
			else
				permission_value = tonumber(tab[ply_id][2])
			end
		end

		if not isnumber(permission_value) then
			permission_value = tonumber(permission_value)
		end

		if not isnumber(permission_value) or permission_value ~= 1 then
			return false
		end

		return true
	end

	--- NADMOD integration. Checks if a player can interact with an entity.
	--- @param ply Entity: The player.
	--- @param ent Entity: The entity.
	--- @return boolean: True if allowed, false otherwise.
	function xdefm_NadAllow(ply, ent)
		if not NADMOD or not IsValid(ply) or not IsValid(ent) then
			return false
		end

		return NADMOD.PlayerCanTouch(ply, ent)
	end

	--- Sends a sound to a player.
	--- @param ply Entity: The target player.
	--- @param snd string: The sound file path.
	function xdefm_SendSnd(ply, snd)
		if not IsValid(ply) or not ply:IsPlayer() or not isstring(snd) or snd == "" or snd == "!V" then return end

		net.Start("NET_xdefm_SendSnd")
		net.WriteString(snd)
		net.Send(ply)
	end

	--- Restricts tool access / pickup ability on an entity.
	--- @param ent Entity: The target entity.
	--- @param revert boolean: If true, reverts the restriction.
	function xdefm_NoTool(ent, revert)
		if not IsValid(ent) then return end

		if isbool(revert) and revert == true then
			ent.xdefm_NoTool = false
		else
			ent.xdefm_NoTool = true
		end

		if revert then
			ent:SetUnFreezable(false)

			if IsValid(ent:GetPhysicsObject()) then
				ent:GetPhysicsObject():ClearGameFlag(FVPHYSICS_NO_PLAYER_PICKUP)
			end

			return
		end

		ent:SetUnFreezable(true)

		if IsValid(ent:GetPhysicsObject()) then
			ent:GetPhysicsObject():AddGameFlag(FVPHYSICS_NO_PLAYER_PICKUP)
		end
	end

	--- Loads or initializes a player's profile data.
	--- @param ply Entity: The target player.
	function xdefm_ProfileLoad(ply)
		if not IsValid(ply) or not ply:IsPlayer() or not isstring(ply:SteamID()) or ply:IsBot() then return end

		local ply_file_name = string.lower(string.Replace(ply:SteamID(), ":", "_"))
		if not file.IsDir("xdefishmod", "DATA") then
			file.CreateDir("xdefishmod")
		end

		local ply_file_path = ("xdefishmod/p_" .. ply_file_name .. ".txt")
		local ply_profile = {}
		if not istable(ply.xdefm_Friends) then
			xdefm_SetupFriends(ply)
		end

		if file.Exists(ply_file_path, "DATA") then
			ply_profile = util.JSONToTable(file.Read(ply_file_path, "DATA"))
			if not ply_profile.UpdG then
				ply_profile.UpdG = 0
			end

			for slot_index, item_info in pairs(ply_profile.Items) do
				if isstring(item_info) and item_info ~= "_" and not xdefmod.items[xdefm_GetClass(item_info)] then
					ply_profile.Items[slot_index] = (slot_index == 21 and "ba_junk" or "it_error")
				end
			end

			for slot_index, item_info in pairs(ply_profile.Bnk) do
				if isstring(item_info) and item_info ~= "_" and not xdefmod.items[xdefm_GetClass(item_info)] then
					ply_profile.Bnk[slot_index] = "it_error"
				end
			end
		else
			ply_profile = {
				Level = 0,
				Money = 0,
				Exp = 0,
				-- TODO: Replace hard-coded default inventory with configurable one
				Items = { "it_bait1", "re_basic|25", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_" },
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

		ply.xdefm_Profile = ply_profile
		xdefm_ProfileUpdate(ply, ply_profile)
	end

	--- Gives an item to a player, updating their inventory and profile.
	--- @param ply Player: The player receiving the item.
	--- @param item_info string: Information about the item to give.
	--- @param no_message boolean?: If true, suppresses notification.
	--- @return boolean: True if the item was successfully given, false otherwise.
	function xdefm_ItemGive(ply, item_info, no_message)
		if not IsValid(ply) or not isstring(item_info) or not istable(ply.xdefm_Profile) then
			return false
		end

		local item_info_table, item = xdefm_ItemGet(item_info)
		if not istable(item_info_table) or not istable(item) then
			return false
		end

		local ply_inventory = ply.xdefm_Profile.Items
		if not istable(ply_inventory) then
			return false
		end

		if item.Type == "Creature" and isnumber(item.MinSize) and isnumber(item.MaxSize) and (not istable(item_info_table) or #item_info_table < 2 or item_info_table[2] == 0) then
			local creature_size = math.Round(math.Rand(item.MinSize, item.MaxSize), 1)
			table.insert(item_info_table, 2, creature_size)
			item_info = table.concat(item_info_table, "|")
		elseif item.Type == "Recipe" and isnumber(item.Durability) and (not istable(item_info_table) or #item_info_table < 2 or item_info_table[2] == 0) then
			local dur = math.ceil(math.Rand(item.Durability / 2, item.Durability))
			table.insert(item_info_table, 2, dur)
			item_info = table.concat(item_info_table, "|")
		end

		item_info_table, item = xdefm_ItemGet(item_info)

		for slot_index, slot_info in pairs(ply_inventory) do
			if slot_info == "_" and (slot_index ~= 21 or item.Type == "Bait") and (item.Type ~= "Bait" or slot_index ~= 21 or item.Level <= ply.xdefm_Profile.Level) then
				ply.xdefm_Profile.Items[slot_index] = item_info
				xdefm_ProfileUpdate(ply)

				local cls = xdefm_GetClass(item_info)
				net.Start("NET_xdefm_BestiaryRecord")
				net.WriteString(cls)
				net.Send(ply)

				if not isbool(no_message) or no_message == false then
					xdefm_AddNote(ply, "xdefm.Pickup&: " .. xdefm_ItemMark(item_info), "items/ammo_pickup.wav", "basket_put", 5)
				end

				return true
			end
		end

		xdefm_AddNote(ply, "xdefm.FullInv", "resource/warning.wav", "cross", 5)

		return false
	end

	--- Spawns an item entity at a specified position and angle.
	--- @param item_name string: The name of the item to spawn.
	--- @param pos Vector: The position where the item will be spawned.
	--- @param ang Angle: The angle/rotation of the spawned item.
	--- @param owner Player|Entity: The owner of the item (player or default entity if invalid).
	--- @param model string?: The model for the item, if provided and valid.
	--- @return Entity|nil: The spawned item entity, or nil if spawning failed.
	function xdefm_ItemSpawn(item_name, pos, ang, owner, model)
		if not isstring(item_name) or item_name == "" or item_name == "_" then
			return nil
		end

		if not isvector(pos) then
			pos = Vector(0, 0, 0)
		end

		if not isangle(ang) then
			ang = Angle(0, 0, 0)
		end

		local item_info_table, item = xdefm_ItemGet(item_name)
		if not istable(item_info_table) or not istable(item) then
			return nil
		end

		local ent = ents.Create("xdefm_base")
		ent:SetPos(pos)
		ent:SetAngles(ang)
		ent:SetFMod_DT(tostring(item_name))

		if isstring(model) and util.IsValidModel(model) then
			ent.xdefm_Mdl = model
		end

		if not IsValid(owner) or not owner:IsPlayer() then
			owner = Entity(0)
		else
			ent:SetFMod_OI(owner:SteamID())
			if NADMOD then
				NADMOD.PlayerMakePropOwner(owner, ent)
			end
		end

		ent:SetNWEntity("Owner", owner)
		ent:SetFMod_OW(owner)
		ent.Owner = owner

		local hook_result = hook.Run("XDEFM_ItemSpawn", ent, item_name, owner)
		if isbool(hook_result) and hook_result == false then
			ent:Remove()
			return nil
		end

		ent:Spawn()
		ent:Activate()

		return ent
	end

	--- Spawns a dummy entity with specified attributes.
	--- @param item_name string: The name of the item for the dummy entity.
	--- @param pos Vector: The position where the dummy entity will be spawned.
	--- @param ang Angle: The angle/rotation of the dummy entity.
	--- @param owner Player|Entity: The owner of the dummy entity (player or default entity if invalid).
	--- @param model string?: Optional model for the dummy entity, if valid.
	--- @return Entity|nil: The spawned dummy entity, or nil if spawning failed.
	function xdefm_DummySpawn(item_name, pos, ang, owner, model)
		if not isstring(item_name) or item_name == "" or item_name == "_" then
			return nil
		end

		if not isvector(pos) then
			pos = Vector(0, 0, 0)
		end

		if not isangle(ang) then
			ang = Angle(0, 0, 0)
		end

		local item_info_table, item = xdefm_ItemGet(item_name)
		if not istable(item_info_table) or not istable(item) then
			return nil
		end

		local ent = ents.Create("xdefm_dummy")
		ent:SetPos(pos)
		ent:SetAngles(ang)
		ent:SetFMod_DT(tostring(item_name))

		if isstring(model) and util.IsValidModel(model) then
			ent:SetModel(model)
			ent.xdefm_Mdl = model
		else
			ent:SetModel(item.Model[math.random(#item.Model)])
		end

		if not IsValid(owner) or not owner:IsPlayer() then
			owner = Entity(0)
		else
			ent:SetFMod_OI(owner:SteamID())
		end

		local hook_result = hook.Run("XDEFM_DummySpawn", ent, item_name, owner)
		if isbool(hook_result) and hook_result == false then
			ent:Remove()
			return
		end

		ent:SetFMod_OW(owner)
		ent.Owner = owner
		ent:Spawn()
		ent:Activate()

		return ent
	end

	--- Adds experience points to a player and handles level-ups.
	--- @param ply Player: The player receiving experience points.
	--- @param amount number: The amount of experience points to add.
	--- @return nil: No return value.
	function xdefm_GiveExp(ply, amount)
		if not IsValid(ply) or not istable(ply.xdefm_Profile) or not isnumber(amount) or amount <= 0 then return end
		amount = math.max(0, math.Round(amount))

		local fex, lex = ply.xdefm_Profile.Exp, xdefm_LevelExp(ply.xdefm_Profile.Level)
		ply.xdefm_Profile.Exp = ply.xdefm_Profile.Exp + amount

		if ply.xdefm_Profile.Level >= 1000 then
			ply.xdefm_Profile.Exp = 0
			xdefm_ProfileUpdate(ply)
			ply.xdefm_Profile.TExp = ply.xdefm_Profile.TExp + amount
			return
		end

		if ply.xdefm_Profile.Exp >= lex then
			ply.xdefm_Profile.Exp = 0
			ply.xdefm_Profile.Level = ply.xdefm_Profile.Level + 1

			if ply.xdefm_Profile.Level <= 1000 then
				ply.xdefm_Profile.Skp = ply.xdefm_Profile.Skp + 1
			end

			xdefm_AddNote(ply, "xdefm.Uplevel", "garrysmod/save_load4.wav", "arrow_up", 5)
			ply.xdefm_Profile.TExp = ply.xdefm_Profile.TExp + math.max(0, lex - fex)
		else
			xdefm_SendSnd(ply, "garrysmod/content_downloaded.wav")
			ply.xdefm_Profile.TExp = ply.xdefm_Profile.TExp + amount
		end

		xdefm_ProfileUpdate(ply)
	end

	--- Adds money to a player's profile and optionally updates total earnings.
	--- @param ply Player: The player receiving the money.
	--- @param amount number: The amount of money to give.
	--- @param dont_update_total boolean?: If true, total earnings are not updated.
	--- @return nil
	function xdefm_GiveMoney(ply, amount, dont_update_total)
		if not IsValid(ply) or not istable(ply.xdefm_Profile) or not isnumber(amount) or amount <= 0 then return end

		amount = math.max(0, math.Round(amount))
		ply.xdefm_Profile.Money = ply.xdefm_Profile.Money + amount

		if not dont_update_total then
			ply.xdefm_Profile.TEarn = ply.xdefm_Profile.TEarn + amount
		end

		xdefm_ProfileUpdate(ply)
		xdefm_SendSnd(ply, "physics/metal/chain_impact_soft" .. math.random(1, 3) .. ".wav")
	end

	--- Sends a menu update to the player.
	--- @param ply Player: The player receiving the update.
	--- @param menu_type number: Type of menu to update.
	--- @param menu_specific_data table: Data specific to the menu.
	--- @return nil
	function xdefm_UpdateMenu(ply, menu_type, menu_specific_data)
		if not IsValid(ply) or not istable(ply.xdefm_Profile) or not isnumber(menu_type) or not istable(menu_specific_data) then return end

		net.Start("NET_xdefm_MenuUpdate")
		net.WriteFloat(math.Round(menu_type))
		net.WriteString(util.TableToJSON(menu_specific_data))
		net.Send(ply)
	end

	--- Cleans up entities and refunds their value to players.
	--- @return nil
	function xdefm_CleanupRefund()
		if GetConVar("xdefmod_refund"):GetInt() <= 0 then return end

		xdefmod.refund = {}

		for _, ent in pairs(ents.FindByClass("xdefm_base")) do
			if IsValid(ent) and istable(ent.xdefm_T2) and isstring(ent:GetFMod_OI()) and ent:GetFMod_OI() ~= "" and ent:GetFMod_DT() then
				local ply_id = ent:GetFMod_OI()
				local price = xdefm_GetPrice(ent:GetFMod_DT())
				if (xdefm_ItemGet(ent) ~= "cr_seagull" and xdefm_ItemGet(ent) ~= "cr_crow" and xdefm_GetClass(ent) ~= "cr_seagull2") or ent.xdefm_Killed then
					-- local aa, bb = xdefm_ItemGet( v ) -- Unused?
					if istable(ent.xdefm_T3) and not table.IsEmpty(ent.xdefm_T3) then
						for _, item_info in pairs(ent.xdefm_T3) do
							if isstring(item_info) and item_info ~= "_" then
								price = price + xdefm_GetPrice(item_info)
							end
						end
					end

					if not isnumber(xdefmod.refund[ply_id]) then
						xdefmod.refund[ply_id] = price
					else
						xdefmod.refund[ply_id] = xdefmod.refund[ply_id] + price
					end

					ent:Remove()
				end
			end
		end

		for ply_id, amount in pairs(xdefmod.refund) do
			if isstring(ply_id) and isnumber(amount) and amount > 0 then
				local ply = player.GetBySteamID(ply_id)
				if IsValid(ply) and ply:IsPlayer() and not ply:IsBot() and istable(ply.xdefm_Profile) then
					xdefm_AddNote(ply, "xdefm.CleanRefund&: " .. amount, "!V", "coins", 5)
					xdefm_GiveMoney(ply, amount)
				else
					local ply_file_path = "xdefishmod/p_" .. ply_id .. ".txt"
					if not file.Exists(ply_file_path, "DATA") then return end

					local ply_data = util.JSONToTable(file.Read(ply_file_path, "DATA"))
					if not istable(ply_data) then return end

					ply_data.Money = tonumber(math.Round(ply_data.Money)) + amount
					file.Write(ply_file_path, util.TableToJSON(ply_data, true))
				end
			end
		end

		xdefmod.refund = nil
	end

	--- Drops a loot item based on weighted chances.
	--- @param loot_table table: Loot names with their chances.
	--- @param ent Entity: Entity to drop loot from.
	--- @return Entity|string|nil: Spawned loot entity, loot name, or nil.
	function xdefm_LootDrop(loot_table, ent)
		if not istable(loot_table) then return
			nil
		end

		-- Maps cumulative chances to loot names for weighted random selection.
		local total_chance = 0
		local chance_map = {}
		for loot_name, loot_chance in pairs(loot_table) do
			if isstring(loot_name) and isnumber(loot_chance) then
				total_chance = total_chance + loot_chance
				chance_map[total_chance] = loot_name
			end
		end

		if total_chance < 1 then return end

		-- Selects a loot item based on a weighted random roll using cumulative chances.
		local item_name = "_"
		local roll = math.random(1, math.ceil(total_chance))
		for cumulative_chance, loot_name in SortedPairs(chance_map) do
			if roll <= cumulative_chance then
				item_name = loot_name
				break
			end
		end

		if IsEntity(ent) and not IsUselessModel(ent:GetModel()) then
			-- local cen = ent:OBBCenter() -- Unused?
			local pos_min = ent:OBBMins() * 0.5
			local pos_max = ent:OBBMaxs() * 0.5
			local ang = Angle(math.Rand(0, 360), math.Rand(0, 360), 0)
			local pos = Vector(math.Rand(pos_min.x, pos_max.x), math.Rand(pos_min.y, pos_max.y), math.Rand(pos_min.z, pos_max.z))
			local own = Entity(0)
			if ent:GetClass() == "xdefm_base" then
				own = ent:GetFMod_OW()
			end

			local item_ent = xdefm_ItemSpawn(item_name, ent:LocalToWorld(pos / 4), ang, own)
			if item_ent and IsValid(item_ent) then
				item_ent:SetFMod_OI(ent:GetFMod_OI())
				return item_ent
			end
		end

		return item_name
	end

	--- Registers a new quest with level, requirement, and reward.
	--- @param level number: Quest level, defaults to 0 if invalid.
	--- @param needed string: Requirement for the quest, must be a non-empty string.
	--- @param reward string: Reward for completing the quest, must be a non-empty string.
	function xdefm_QuestRegister(level, needed, reward)
		if not isstring(needed) or needed == "_" or needed == "" then return end
		if not isstring(reward) or reward == "_" or reward == "" then return end

		level = isnumber(level) and math.max(math.Round(level), 0) or 0
		table.insert(xdefmod.quests, { level, needed, reward })
	end

	--- Picks a quest based on player level or clears the quest if level is -1.
	--- @param level number: Player level or -1 to clear quest.
	--- @param ply Player: The player to receive the quest.
	--- @return table|nil: Selected quest or nil.
	function xdefm_QuestPick(level, ply)
		if not isnumber(level) then
			return nil
		end

		if table.IsEmpty(xdefmod.quests) then
			return nil
		end

		-- If level is -1, it clears the quest instead
		if level ~= -1 then
			local quest = {} -- FIXME: "tab" shadows existing binding!
			for _, random_quest in RandomPairs(xdefmod.quests) do
				if random_quest[1] <= level then
					quest = random_quest
					break
				end
			end

			if IsValid(ply) and ply:IsPlayer() and not ply:IsBot() then
				net.Start("NET_xdefm_Quest")
				net.WriteString(util.TableToJSON(quest))
				net.Send(ply)
				ply.xdefm_Quest = quest
			end

			return quest
		elseif IsValid(ply) and ply:IsPlayer() and not ply:IsBot() then
			net.Start("NET_xdefm_Quest")
			net.WriteString(util.TableToJSON({}))
			net.Send(ply)
			ply.xdefm_Quest = {}
		end

		return nil
	end

	-- Hooks

	-- Prevents flagged fishing entities to be interacted with by phys gun
	hook.Add("PhysgunPickup", "xdefm_NoTool", function(ply, ent)
		if ent.xdefm_NoTool then return false end
		if ent:GetClass() == "xdefm_base" then return false end
	end)

	-- Prevents flagged fishing entities to have their properties changed
	hook.Add("CanProperty", "xdefm_NoTool", function(ply, property, ent)
		if ent.xdefm_NoTool then return false end
		if ent:GetClass() == "xdefm_base" then return false end
	end)

	-- Prevents flagged fishing entities to be targeted by tools
	hook.Add("CanTool", "xdefm_NoTool", function(ply, trace_table, toolname, tool, button)
		if IsValid(trace_table.Entity) and trace_table.Entity.xdefm_NoTool then return false end
		if IsValid(trace_table.Entity) and trace_table.Entity:GetClass() == "xdefm_base" then return false end
	end)

	-- Prevents flagged fishing entities to be picked up by players
	hook.Add("AllowPlayerPickup", "xdefm_NoTool", function(ply, ent)
		if ent.xdefm_NoTool then return false end
	end)

	-- Prevents flagged fishing entities to be picked up by gravity gun
	hook.Add("GravGunPickupAllowed", "xdefm_NoTool", function(ply, ent)
		if ent.xdefm_NoTool then return false end
	end)

	-- Prevents players from picking up fishing weapons they already have on them
	hook.Add("PlayerCanPickupWeapon", "xdefm_NoPickup", function(ply, weapon)
		if IsValid(weapon) and isstring(weapon:GetClass()) then
			local find_index, _ = string.find(weapon:GetClass():lower(), "weapon_xdefm_")
			if find_index and ply:HasWeapon(weapon:GetClass()) then
				return false
			end
		end
	end)

	-- Hook for regular updates:
	-- 1. Removes certain entities if submerged in water.
	-- 2. Manages sale cooldown and triggers shop updates.
	-- 3. Periodically updates the leaderboard based on player files, saving and broadcasting it. 
	hook.Add("Think", "xdefm_TK", function()
		-- Check all props that should be killed in water if they are submerged and delete them with small splash effect if they are
		for _, fishing_ent in pairs(ents.FindByClass("xdefm_base")) do
			if IsValid(fishing_ent) and istable(fishing_ent.xdefm_T2) and not fishing_ent:IsPlayerHolding() and not constraint.FindConstraint(fishing_ent, "Weld") and fishing_ent:WaterLevel() > 0 and fishing_ent.xdefm_T2.KillInWater then
				SafeRemoveEntity(fishing_ent)
				local effect = EffectData()
				effect:SetOrigin(fishing_ent:WorldSpaceCenter())
				effect:SetScale(math.Round(fishing_ent:OBBMins():Distance(fishing_ent:OBBMaxs()) * 0.1, 2))
				util.Effect("watersplash", effect)
			end
		end

		-- Calculates if the next sale started, by comparing the current time rounded to the closest interval of cooldown in seconds,
		-- and if the interval is not the same as the current sale time, set it as the new sale time and update the shop with a new sale.
		local sale_cooldown = math.max(math.Round(GetConVar("xdefmod_salecool"):GetInt()), 0) * 60
		local sale_time = math.Round(os.time() / sale_cooldown) * sale_cooldown
		if sale_cooldown > 0 and sale_time ~= xdefmod.util.SaleTime then
			xdefmod.util.SaleTime = sale_time
			xdefm_UpdateShop()
		end

		-- Do the same with the leaderboard delay and update leaderboard, if interval changed or leaderboard is empty yet.
		-- If leaderboard delay is set to 0, it will only updated once every restart / map change.
		local leaderboard_delay = math.max(math.Round(GetConVar("xdefmod_lbdelay"):GetInt()), 0) * 60
		local leaderboard_time = math.Round(os.time() / leaderboard_delay) * leaderboard_delay

		if not istable(xdefmod.leader) or (leaderboard_delay > 0 and leaderboard_time ~= xdefmod.util.LeadTime) then
			xdefmod.util.LeadTime = leaderboard_time

			if not timer.Exists(leaderboard_timer) then
				local all_ply_files, _ = file.Find("xdefishmod/p_*.txt", "DATA")
				if not istable(all_ply_files) or #all_ply_files <= 0 then return end

				local ply_file_index = 0
				-- local ply_file_count = #all_ply_files -- REVIEW: Unused?
				local updated_leaderboard = {}
				-- Repeating timer for updating the leaderboard not with all player files at once
				timer.Create(leaderboard_timer, 0, 0, function()
					-- Run for 5 player files on each tick
					for i = 1, 5 do
						ply_file_index = ply_file_index + 1

						local ply_file = all_ply_files[ply_file_index]
						-- Check if all player files have been processed
						if not isstring(ply_file) then
							-- Write updated leaderboard to disk
							local leaderboard_json = util.TableToJSON(updated_leaderboard, true)
							file.Write("xdefishmod/leaderboard.txt", leaderboard_json)
							xdefmod.leader = updated_leaderboard

							-- Broadcast updated leaderboard to players
							net.Start("NET_xdefm_Leaderboard")
							net.WriteString(leaderboard_json)
							net.Broadcast()

							-- Update menu view of all online players
							for _, ply in pairs(player.GetAll()) do
								xdefm_UpdateMenu(ply, 7, updated_leaderboard)
							end

							-- Remove timer to finishg update process
							timer.Remove(leaderboard_timer)
							break
						end

						-- Check players experience against the current leaderboard, by checking the experience against each leader top-to-bottom,
						-- and inserts player into list, if a leader has less experience than the player, removes the pushed out player and breaks the loop.
						local ply_data = util.JSONToTable(file.Read("xdefishmod/" .. ply_file, "DATA"))
						if istable(ply_data) and not istable(updated_leaderboard[10]) or updated_leaderboard[10][1] <= ply_data.TExp then
							for leader_index = 1, 10 do
								local leader_data = updated_leaderboard[leader_index]
								if (not istable(leader_data) or leader_data[1] < ply_data.TExp) and isstring(ply_data.SID64) then
									table.insert(updated_leaderboard, leader_index, { ply_data.TExp, ply_data.SID64, ply_data.Nick, ply_data.Level, ply_data.Money })
									if #updated_leaderboard > 10 then
										table.remove(updated_leaderboard, 11)
									end

									break
								end
							end
						end
					end
				end)
			end
		end
	end)

	-- Custom damage handling logic:
	-- 1. Corrects damage from specific projectiles (like rocket launchers) to their owner and restricts it to living entities (players, NPCs, nextbots).
	-- 2. Bypasses damage restrictions for fishing entities if "xdefmod_noprophurt" convar is set to 0 (or less).
	-- 3. Ensures that creatures can always be damaged by players and can damage players without restrictions.
	-- 4. Prevents players from damaging fishing entities owned by others unless they have permission.
	-- 5. Prevents fishing entities from damaging players unless permission is granted.
	hook.Add("EntityTakeDamage", "xdefm_Hurt", function(target, dmg)
		-- Correct projectile / indirect damage for rocket launcher items to only be able to target living entities
		if IsValid(dmg:GetInflictor()) and dmg:GetInflictor():GetNWBool("XDEFM_HO") and IsValid(dmg:GetInflictor():GetOwner()) then
			dmg:SetInflictor(dmg:GetInflictor():GetOwner())

			if IsValid(dmg:GetInflictor():GetOwner()) then
				dmg:SetAttacker(dmg:GetInflictor():GetOwner())
			end

			if not target:IsPlayer() and not target:IsNPC() and not target:IsNextBot() then
				return true
			end
		end

		-- Always allow damage to / from fishing entities if convar is set to <= 0 (skips permission checks)
		--local inflictor = dmg:GetInflictor() -- REVIEW: Unused?
		local attacker = dmg:GetAttacker()
		if not IsValid(attacker) or GetConVar("xdefmod_noprophurt"):GetInt() <= 0 then
			return false
		end

		-- Always allow creatures to be damaged by other players / to damage other players
		if target:GetClass() == "xdefm_base" then
			local _, item = xdefm_ItemGet(target:GetFMod_DT())
			if istable(item) and item.Type == "Creature" then
				return false
			end
		end

		-- Prevent players damage to fishing entities of other players they do not have permissions from
		if attacker:IsPlayer() and target:GetClass() == "xdefm_base" and not xdefm_FriendAllow(attacker, target:GetFMod_OI()) and not xdefm_NadAllow(attacker, target) then
			return true
		end

		-- Prevent fishing entities damage to other players which they do not have permissions from
		if attacker:GetClass() == "xdefm_base" and target:IsPlayer() and not xdefm_FriendAllow(attacker:GetFMod_OW(), target:SteamID()) and not xdefm_NadAllow(target, attacker) then
			return true
		end
	end)

	-- Runs refund for all items currently on map, if a cleanup is executed
	hook.Add("PreCleanupMap", "xdefm_Refund", function()
		xdefm_CleanupRefund()
	end)

	-- Sets the shutdown state and refunds all items currently still on map
	hook.Add("ShutDown", "xdefm_Refund", function()
		if xdefmod.util.ShutDown then return end
		xdefmod.util.ShutDown = true
		xdefm_CleanupRefund()
	end)

	-- Sets the network variable for the entity of who is currently carrying it, when picked up by a player
	hook.Add("OnPlayerPhysicsPickup", "xdefm_LastTake", function(ply, ent)
		if IsValid(ply) and IsValid(ent) and ent:GetClass() == "xdefm_base" then
			ent:SetFMod_LU(ply)
		end
	end)

	-- Unsets the network variable for the entity of who is carrying it and runs OnDrop(), when being dropped or thrown by a player
	hook.Add("OnPlayerPhysicsDrop", "xdefm_LastDrop", function(ply, ent, thrown)
		if IsValid(ply) and IsValid(ent) and ent:GetClass() == "xdefm_base" then
			ent:SetFMod_LU(nil)
			if istable(ent.xdefm_T2) then
				ent.xdefm_T2:OnDrop(ent, ply, thrown)
			end
		end
	end)

	-- Net messages

	-- Receives command from a player and runs it with specified command data
	net.Receive("NET_xdefm_Cmd", function(length, ply)
		if not IsValid(ply) or length > 512 then return end

		local cmd = net.ReadString()
		local cmd_data = net.ReadString()
		if isstring(cmd) and isstring(cmd_data) and cmd ~= "" and cmd_data ~= "" then
			xdefm_Command(ply, cmd, cmd_data)
		end
	end)

	-- Receives and setups / updates player friends data
	net.Receive("NET_xdefm_SendFriends", function(len, ply)
		if not IsValid(ply) or len > 8192 then return end
		if isnumber(ply.xdefm_Cool) and ply.xdefm_Cool > CurTime() then return end

		ply.xdefm_Cool = CurTime() + 0.9

		local friends_data = {}
		if len > 0 then
			local str = net.ReadString()
			if not isstring(str) or str == "" then return end

			friends_data = util.JSONToTable(str)

			if not istable(friends_data) then
				return
			end
		else
			friends_data = ply.xdefm_Friends
		end

		xdefm_SetupFriends(ply, friends_data)
	end)

	-- Receives console command from player and executes it with specified paremeters
	net.Receive("NET_xdefm_ConsoleCmd", function(length, ply)
		if not IsValid(ply) or length > 1024 or length <= 0 then return end
		if isnumber(ply.xdefm_Cool) and ply.xdefm_Cool > CurTime() then return end

		ply.xdefm_Cool = CurTime() + 0.1

		local cmd = net.ReadString()
		local cmd_json = net.ReadString()
		local cmd_data = util.JSONToTable(cmd_json)
		xdefm_ConsoleCmd(cmd, cmd_data, ply)
	end)

	-- Handles item pickup requests from players:
	-- 1. Validates the player and checks for action cooldown.
	-- 2. Check if the player is allowed to interact with the entity and it is not already flagged trashed.
	-- 3. Depending on the item type and if "tempmode" is enabled, either add it to the player's inventory or sell it directly.
	-- 4. Notifies the player if the item can't be picked up or isn't theirs.
	net.Receive("NET_xdefm_Pickup", function(length, ply)
		if not IsValid(ply) or length <= 0 or length >= 128 or not ply:Alive() then return end
		if isnumber(ply.xdefm_Cool) and ply.xdefm_Cool > CurTime() then return end

		local ply_received = net.ReadEntity()
		if ply_received ~= ply then return end

		ply.xdefm_Cool = CurTime() + 0.1

		local ent = ply:GetEyeTrace().Entity
		if IsValid(ent) and ent:GetClass() == "xdefm_base" and not ent:IsConstrained() and xdefm_CanInteract(ply, ent) and not ent.xdefm_Trashed then
			ply.xdefm_Cool = CurTime() + 0.1

			local item_info, item = xdefm_ItemGet(ent:GetFMod_DT())
			if istable(item_info) and istable(item) then
				--local ent_owner = ent:GetFMod_OW() -- REVIEW: Unused?
				local ent_owner_id = ent:GetFMod_OI()
				if item:OnStore(ent, ply) == false then return end

				ply.xdefm_Cool = CurTime() + 0.1

				-- Check permissions for entity
				if xdefm_FriendAllow(ply, ent_owner_id) or xdefm_NadAllow(ply, ent) then
					-- Check if entity is a storage and if there is still items inside
					if istable(ent.xdefm_T3) and not table.IsEmpty(ent.xdefm_T3) then
						local result = false
						for _, stored_item in pairs(ent.xdefm_T3) do
							if isstring(stored_item) and stored_item ~= "_" then
								xdefm_AddNote(ply, xdefm_ItemMark(ent:GetFMod_DT()) .. "& &xdefm.NotEmpty", "resource/warning.wav", "cross", 5)
								result = true
								break
							end
						end

						if result then
							return
						end
					end

					local hook_result = hook.Run("XDEFM_PlayerTake", ply, ent)
					if isbool(hook_result) and hook_result == false then return end

					-- Check if items is carryable or a bait or a recipe, insert it into players inventory and delete the entity
					-- If "xdefmod_tempmode" is 1 (or greater), then all items will be immediately sold instead
					if item.Carryable and (GetConVar("xdefmod_tempmode"):GetInt() <= 0 or item.Type == "Bait" or item.Type == "Recipe") then
						if xdefm_ItemGive(ply, ent:GetFMod_DT()) then
							ent.xdefm_Trashed = true
							ent:Remove()
						end
					else
						ent.xdefm_Trashed = true
						ent:Remove()

						local price = xdefm_GetPrice(ent)
						net.Start("NET_xdefm_BestiaryRecord")
						net.WriteString(xdefm_GetClass(ent))
						net.Send(ply)
						if price > 0 then
							xdefm_GiveMoney(ply, price, true)
							xdefm_AddNote(ply, "xdefm.GetMoney&: " .. price, "!V", "coins", 5)
						else
							xdefm_AddNote(ply, "xdefm.Trashed&: " .. xdefm_ItemMark(ent:GetFMod_DT()), "physics/cardboard/cardboard_box_impact_bullet1.wav", "bin_empty", 5)
						end
					end
				else
					xdefm_AddNote(ply, "xdefm.NotMine", "resource/warning.wav", "cross", 5)
				end
			end
		end
	end)

	-- Handles request from a player for their server-side profile
	net.Receive("NET_xdefm_NeedProfile", function(length, ply)
		if not IsValid(ply) or length > 0 or istable(ply.xdefm_Profile) then return end

		-- Checks if player already has a quest, sets it to failed and refreshes quest time
		if isnumber(xdefmod.skips[ply:SteamID()]) then
			ply:SetNWFloat("XDEFM_QC", CurTime() + GetConVar("xdefmod_qsttime"):GetInt() * 60)
			ply:SetNWBool("XDEFM_QD", true)
		end

		xdefm_ProfileLoad(ply)
		ply.xdefm_Cool = 0

		-- Re-assign player entity to owned entities
		local id = ply:SteamID()
		for _, ent in pairs(ents.FindByClass("xdefm_base")) do
			if IsValid(ent) and ent:GetFMod_OI() == id then
				ent:SetFMod_OW(ply)
			end
		end
	end)
end

if SERVER or CLIENT then -- Shared
	local Zom = Material("vgui/zoom")
	function xdefm_AddShop(name, level, price)
		if not isstring(name) then return end

		level = isnumber(level) and math.max(0, math.Round(level)) or 0
		price = isnumber(price) and math.max(0, math.Round(price)) or 0

		local _, item = xdefm_ItemGet(name)
		if not item or not istable(item) or item.Type ~= "Bait" then return end

		xdefmod.shop[name] = { 1, level, price }
	end

	function xdefm_GetPrice( ite )
		if IsEntity( ite ) and ite:GetClass() == "xdefm_base" then
			ite = ite:GetFMod_DT()
		end
		if not isstring( ite ) or ite == "" or ite == "_" then return 0 end
		local aa, bb = xdefm_ItemGet( ite )
		if not istable( bb ) then return 0 end
		local prc = bb.Price
		if bb.Type == "Creature" and isnumber( tonumber( aa[ 2 ] ) ) then
			prc = math.ceil( prc * tonumber( aa[ 2 ] ) )
		end
		if bb.Type == "Bait" then
			return prc
		elseif bb.Type == "Recipe" then
			return isnumber( tonumber( aa[ 2 ] ) ) and math.ceil( prc * tonumber( aa[ 2 ] ) / bb.Durability ) or prc
		else
			local cm = xdefm_CookMeter( ite )
			if cm ~= 0 then
				return cm > 0 and math.ceil( prc + prc * cm * 4 ) or math.ceil( prc * math.abs( 1 + cm ) * 5 )
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
		if not isstring( cmd ) or cmd == "" or not istable( var ) or not IsValid( ply ) or not ply:IsPlayer() or ply:IsBot() then return end
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
				--local v = table.concat( var, "" ) -- Unused?
				local ite = xdefm_ItemSpawn( table.concat( var, "" ), ply:GetEyeTrace().HitPos, Angle( 0, ply:EyeAngles().yaw, 0 ), ply )
				if not IsValid( ite ) then return end
				ite:SetPos( ite:GetPos() + Vector( 0, 0, ite:OBBMaxs():Distance( ite:OBBMins() ) / 2 ) )
				local aa, bb = xdefm_ItemGet( ite:GetFMod_DT() )
				if not istable( aa ) or not istable( bb ) then return end
				undo.Create( bb.Name )
				undo.AddEntity( ite )
				undo.SetPlayer( ply )
				undo.Finish()
			end
			if ply:IsSuperAdmin() and cmd == "xdefmod_firespot" and ply:CheckLimit( "xdefmod_items" ) then
				local v = tonumber( table.concat( var, "" ) )
				if not isnumber( v ) then return end
				local spo = xdefm_FireSpot( ply:GetEyeTrace().HitPos + ply:GetEyeTrace().HitNormal, v, v )
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
				if not istable( ply.xdefm_Trade ) then
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
		if not isnumber( lvl ) then return 0 end
		return math.ceil( 100 + lvl ^ 1.5 )
	end
	function xdefm_AddNote( ply, txt, snd, ico, dur )
		if CLIENT then
			ply = LocalPlayer()
			if isstring( snd ) and snd ~= "" and snd ~= "!V" then
				surface.PlaySound( snd )
			end
			dur = isnumber( dur ) and dur or 5
			if string.find( string.lower( txt ), "&" ) ~= nil then
				local tab = string.Explode( "&", txt ) -- FIXME: "tab" shadows existing binding!
				for k, v in pairs( tab ) do
					if v ~= "" and v ~= " " and string.find( string.lower( v ), "xdefm." ) ~= nil then
						tab[ k ] = language.GetPhrase( v )
					end
				end
				txt = table.concat( tab, "" )
			elseif txt ~= "!V" and string.find( string.lower( txt ), "xdefm." ) then
				txt = language.GetPhrase( txt )
			end
			if not isstring( ico ) or ico == "" or ico == "!V" then
				ico = "information"
			end
			if GetConVar( "xdefmod_printnote" ):GetInt() > 0 then
				MsgC( Color( 255, 255, 255 ), "[", Color( 0, 255, 255 ), "xdefmod", Color( 255, 255, 255 ), "]" .. txt .. "\n" )
			end
			if txt ~= "!V" then
				table.insert( xdefmod.util.notes, { SysTime() + tonumber( string.Left( tostring( dur ), 4 ) ), txt, Material( "icon16/" .. ico .. ".png" ), 0 } )
			end
		else
			if not isstring( txt ) or txt == "" then
				txt = "!V"
			end
			if not isstring( snd ) or snd == "" then
				snd = "!V"
			end
			if not isstring( ico ) or ico == "" then
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
		if not isstring( str ) or str == "" or str == "_" then return 0 end
		local aa, bb = xdefm_ItemGet( str )
		if not istable( aa ) or not istable( bb ) or bb.Type == "Bait" or bb.Type == "Recipe" then return 0 end
		local met = tonumber( aa[ #aa ] )
		if not isnumber( met ) or met == 0 then return 0 end
		local mex = math.ceil( bb.Rarity * 100 )
		local me2 = math.ceil( mex * 0.1 )
		if met <= mex then
			return math.Clamp( met / mex, 0, 1 )
		else
			return -math.Clamp( ( met-mex ) / me2, 0, 1 )
		end
	end
	function xdefm_CookAdd( tar, met )
		if not IsEntity( tar ) and not isstring( tar ) or ( IsEntity( tar ) and tar:GetClass() ~= "xdefm_base" ) then return nil end
		if not isnumber( met ) then
			met = 0
		else
			met = math.max( 0, math.ceil( met ) )
		end
		if IsEntity( tar ) and SERVER then
			local str = tar:GetFMod_DT()
			if not isstring( str ) or str == "_" then return nil end
			local aa, bb = xdefm_ItemGet( str )
			if not istable( bb ) or bb.Type == "Bait" or bb.Type == "Recipe" or bb.CantCook then return nil end
			local med, mex = tonumber( aa[ #aa ] ), bb.Rarity * 110
			if not isnumber( med ) or med >= mex then return end
			med = math.min( med + met, mex )
			if med >= mex and not tar:IsOnFire() then
				tar:Ignite( math.Rand( 3, 6 ) )
			end
			aa[ #aa ] = med
			tar:SetFMod_DT( table.concat( aa, "|" ) )
			return tar:GetFMod_DT()
		elseif isstring( tar ) then
			local aa, bb = xdefm_ItemGet( str )
			if not istable( bb ) or bb.Type == "Bait" or bb.CantCook then return nil end
			local med, mex = tonumber( aa[ #aa ] ), bb.Rarity * 110
			if not isnumber( med ) or med >= mex then return nil end
			med = math.min( med + met, mex )
			aa[ #aa ] = med
			return table.concat( aa, "|" )
		end
	end
	function xdefm_CloseMenu( ply, str ) -- FIXME: "str" shadows existing binding!
		if not isstring( str ) then return end
		if SERVER and IsValid( ply ) and ply:IsPlayer() and not ply:IsBot() then
			net.Start( "NET_xdefm_MenuClose" )
			net.WriteString( str )
			net.Send( ply )
			return
		end
		if CLIENT and IsValid( xdefmod.util.menus[ str ] ) then xdefmod.util.menus[ str ]:Remove() end
	end
	function xdefm_OpenMenu( ply, typ, tab ) -- FIXME: "tab" shadows existing binding!
		if not isnumber( typ ) and ( tab ~= nil and not istable( tab ) ) then return end
		if SERVER and IsValid( ply ) and ply:IsPlayer() and not ply:IsBot() then
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
			if not yes then return end
			xdefmod.COLOR_BACKGROUND = Color( GetConVar( "xdefmod_bgr" ):GetInt(), GetConVar( "xdefmod_bgg" ):GetInt(), GetConVar( "xdefmod_bgb" ):GetInt(), GetConVar( "xdefmod_bga" ):GetInt() )
			xdefmod.COLOR_BORDER = Color( GetConVar( "xdefmod_brr" ):GetInt(), GetConVar( "xdefmod_brg" ):GetInt(), GetConVar( "xdefmod_brb" ):GetInt(), GetConVar( "xdefmod_bra" ):GetInt() )
if typ == 0 then -- Inventory menu
	if IsValid( xdefmod.util.menus[ "Inventory" ] ) then return end
	local pan = vgui.Create( "DFrame" )  xdefmod.util.menus.Inventory = pan  pan.T_Data = tab  pan.T_Slots = {}
	pan:SetPos( ScrW() / 2 -500, ScrH() / 2 - 500 / 2 ) pan:SetSize( 450, 550 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:ParentToHUD() pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW() / 2 -500, ScrH() / 2 - 550 / 2, 0.2 ) ply.xdefm_Profile = tab  function pan:OnRemove()
		if ispanel( xdefmod.util.menus.Double ) then xdefmod.util.menus.Double:Remove() end
		if ispanel( xdefmod.util.menus.Bank ) then xdefmod.util.menus.Bank:Remove() end
		if ispanel( xdefmod.util.menus.Trade ) then xdefmod.util.menus.Trade:Remove() end
		if ispanel( xdefmod.util.menus.Craft ) then xdefmod.util.menus.Craft:Remove() end
		if ispanel( xdefmod.util.menus.Struct ) then xdefmod.util.menus.Struct:Remove() end
	end function pan:Paint( w, h )
		local tab = pan.T_Data -- FIXME: "tab" shadows existing binding!
		surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated( w / 2, h / 2, w, h, 0 )
		surface.DrawTexturedRectRotated( w / 2, h / 2, w, h, 180 )
		surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.TextShadow( { text = ply:Nick(), pos = { 80, 24 }, font = "xdefm_Font5",
		xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		draw.TextShadow( { text = language.GetPhrase( "#xdefm.Money" ) .. ": " .. tab.Money, pos = { 80, 54 }, font = "xdefm_Font1",
		xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 ) end
	if true then -- Avatar image
		pan.P_AIcon = pan:Add( "AvatarImage" )  local pax = pan.P_AIcon
		pax:SetPos( 8, 8 ) pax:SetSize( 64, 64 ) pax:SetPlayer( ply, 128 ) pax:SetMouseInputEnabled( false )
		pan.P_AFrame = pan:Add( "DPanel" )  pax = pan.P_AFrame
		pax:SetText( "" ) pax:SetPos( 8, 8 ) pax:SetSize( 64, 64 ) pax:SetMouseInputEnabled( false )
		function pax:Paint( w, h ) surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h ) end end
	if true then -- Close button
		pan.P_Close = pan:Add( "DButton" )  local pax = pan.P_Close
		pax:SetText( "" ) pax:SetPos( 410, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint( w, h ) draw.TextShadow( {
				text = "×", pos = { w / 2, h / 2 }, font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER,
				color = pax.B_Hover and Color( 255, 0, 0 ) or Color( 255, 255, 255 )
		}, 2, 255 ) end function pax:DoClick() pan:Close() end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end
	if true then -- Level panel
		pan.P_Level = pan:Add( "DPanel" )  local pax = pan.P_Level
		pax:SetPos( 8, 80 ) pax:SetSize( 434, 75 )
		function pax:Paint( w, h )
			local tab = pan.T_Data -- FIXME: "tab" shadows existing binding!
			local pp = xdefm_LevelExp( tab.Level )  local ee = math.Round( math.min( pp, math.Round( tab.Exp ) ) )
			surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawRect( 0, 0, w, h )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h )
			draw.TextShadow( { text = language.GetPhrase( "#xdefm.Level" ) .. ": " .. tab.Level, pos = { 12, 18 }, font = "xdefm_Font1",
			xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
			local xx, yy = pax:GetPos()  local x2, y2 = pan:GetPos()  xx = xx + x2  yy = yy + y2  local per = math.Clamp(ee / pp,0,1)
			surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawRect( 8, 32, 416, 30 )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 8, 32, 416, 30, 2 )
			surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 8, 32, 416, 30 )
			render.SetScissorRect( xx + 8, yy + 32, xx + 8 + 416 * per, yy + 58, true )
			draw.RoundedBox( 4, 4 + 8, 4 + 32, 416 - 8, 30 - 8, Color( 0, 155, 200 ) )
			render.SetScissorRect( 0, 0, 0, 0, false )
			local txt = ""  if self.B_Hover then txt = ee .. " / " .. pp else txt = tostring(math.floor(per * 100)) .. " %" end
			draw.TextShadow( { text = txt, pos = { w / 2, 46 }, font = "xdefm_Font2",
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		end
		function pax:OnCursorEntered() self.B_Hover = true end function pax:OnCursorExited() self.B_Hover = false end end
	if true then -- Inventory/Upgrade/Stats/Leaderbord/Shop tabs
		pan.P_Invent = vgui.Create( "DPropertySheet", pan )  local pax = pan.P_Invent
		pax:SetPos( 8, 165 ) pax:SetSize( 434, 377 ) function pax:Paint( w, h )
			surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 18, w, h -18, 2 )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 18, w, h -18, 1 )
		end pax:SetPadding( 1 )
		local function AddASheetFM( tit, ico, hel ) local pae = vgui.Create( "DPanel" ) function pae:Paint( w, h ) end
			local ttt = pax:AddSheet( tit, pae, ico ) if isstring( hel ) then ttt.Tab:SetTooltip( hel ) end function ttt.Tab:Paint( w, h )
				local alp = ttt.Tab:IsActive() and 1 or 0.5  local rr, gg, bb = xdefmod.COLOR_BACKGROUND.r, xdefmod.COLOR_BACKGROUND.g, xdefmod.COLOR_BACKGROUND.b
				draw.RoundedBoxEx( 4, 0, 0, w, 20, xdefmod.COLOR_BORDER, true, true, false, false )
				draw.RoundedBoxEx( 4, 1, 1, w -2, 20, xdefmod.COLOR_LINE, true, true, false, false )
				draw.RoundedBoxEx( 4, 3, 3, w -4, 20, Color( rr * alp, gg * alp, bb * alp, 255 ), true, true, false, false )
			end ttt.Tab.xdefm_DC = ttt.Tab.DoClick
			function ttt.Tab:DoClick() ttt.Tab:xdefm_DC() end return pae end
		pan.P_Menu1 = AddASheetFM( language.GetPhrase( "xdefm.M1" ), "icon16/basket.png", language.GetPhrase( "xdefm.M11" ) )
		pan.P_Menu5 = AddASheetFM( language.GetPhrase( "xdefm.M5" ), "icon16/cart.png", language.GetPhrase( "xdefm.M55" ) )
		pan.P_Menu2 = AddASheetFM( language.GetPhrase( "xdefm.M2" ), "icon16/lightning.png", language.GetPhrase( "xdefm.M22" ) )
		pan.P_Menu3 = AddASheetFM( language.GetPhrase( "xdefm.M3" ), "icon16/star.png", language.GetPhrase( "xdefm.M33" ) )
		if GetConVar( "xdefmod_lbdelay" ):GetInt() > 0 and not game.SinglePlayer() then
			pan.P_Menu4 = AddASheetFM( language.GetPhrase( "xdefm.M4" ), "icon16/chart_bar.png", language.GetPhrase( "xdefm.M44" ) )
		end
		for k, v in pairs( { pan.P_Menu2, pan.P_Menu3, pan.P_Menu4, pan.P_Menu5 } ) do
			if IsValid( v ) then
				function v:Paint( w, h )
					surface.SetDrawColor( Color( xdefmod.COLOR_BACKGROUND.r * 0.5, xdefmod.COLOR_BACKGROUND.g * 0.5, xdefmod.COLOR_BACKGROUND.b * 0.5, xdefmod.COLOR_BACKGROUND.a * 0.5 ) )
					surface.DrawRect( 0, 0, w, h )
				end
			end
		end
		for k, v in pairs( { pan.P_Menu1, pan.P_Menu2, pan.P_Menu3, pan.P_Menu5 } ) do
			if IsValid( v ) then
				v.P_Scroll = v:Add( "DScrollPanel" )  v.P_Scroll:Dock( FILL )  local vba = v.P_Scroll:GetVBar()
				vba:SetHideButtons( true )  vba:SetSize( 0, 0 )

				function vba.btnGrip:Paint( w, h )
					surface.SetDrawColor( 125, 125, 125, 255 ) surface.DrawRect( 0, 0, w, h )
					surface.SetDrawColor( 0, 0, 0, 255 ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
				end

				function vba:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, Color( 45, 45, 45, 255 ) )
				end
			end
		end
		-- Inventory panel
		if true then
			local pax = pan.P_Menu1 -- FIXME: "pax" shadows existing binding!
			pax.P_Hold = pax.P_Scroll:Add( "DIconLayout" )  local pa2 = pax.P_Hold  pa2:Dock( FILL )
			pa2:SetSpaceX( 1.75 ) pa2:SetSpaceY( 2 ) function pa2:Paint( w, h ) end local inv = pan.T_Data.Items
			for i = 1, 21 do local siz = ( i == 21 and 64 or 85 )
			local slo = xdefm_SlotBox( 0, 0, siz, siz, i, i == 21 and language.GetPhrase( "xdefm.Bait" ) or tostring( i ) )
			if i == 21 then pan:Add( slo ) slo:SetPos( 336, 10 ) else pax.P_Hold:Add( slo ) end
			slo.S_Type = "Inventory"  slo:F_SetupItem( inv[i] ) pan.T_Slots[ i ] = slo
				function slo:DoRightClick( Pnl ) if slo.T_Item == nil or slo:IsDragging() then return end
					if IsValid( pan.P_DMenu ) then pan.P_DMenu:Remove() end pan.P_DMenu = DermaMenu( false, nil )  local dnm = pan.P_DMenu
					local prc = xdefm_GetPrice( slo.S_Item )  local des = ( prc > 0 and "#xdefm.Sell" or "#xdefm.Destroy" )
					local ico = ( prc > 0 and "icon16/coins.png" or "icon16/bin_closed.png" )
					local O_Drop = dnm:AddOption( "#xdefm.Drop", function() if not slo.B_OnMove then xdefm_Command( LocalPlayer(), "DropInv", slo.S_Place ) end end )
					local O_Destroy = dnm:AddOption( des, function() if not slo.B_OnMove then xdefm_Command( LocalPlayer(), "DestroyInv", slo.S_Place ) end end )
					O_Drop:SetIcon( "icon16/basket_remove.png" ) O_Destroy:SetIcon( ico )
					if IsValid( xdefmod.util.menus[ "Bank" ] ) then
						local O_Store = dnm:AddOption( "#xdefm.Store", function()
						if not slo.B_OnMove and IsValid( xdefmod.util.menus[ "Bank" ] ) then local num = 0
						for k, v in pairs( LocalPlayer().xdefm_Profile.Bnk ) do if k > ply.xdefm_Profile.UpdF then break end
						if isstring( v ) and v == "_" then num = k break end end if num > 0 then
						xdefm_Command( LocalPlayer(), "MoveBank", slo.S_Place .. "|" .. num )
						else xdefm_AddNote( ply, "!V", "resource/warning.wav", "cross", 5 ) end end end )
						O_Store:SetIcon( "icon16/basket_go.png" )
					elseif IsValid( xdefmod.util.menus[ "Struct" ] ) and xdefmod.util.menus[ "Struct" ].N_SType == 1 then
						local O_Store = dnm:AddOption( "#xdefm.Store", function()
						if not slo.B_OnMove and IsValid( xdefmod.util.menus[ "Struct" ] ) and xdefmod.util.menus[ "Struct" ].N_SType == 1 then local num = 0
						for k, v in pairs( xdefmod.util.menus[ "Struct" ].T_Items ) do
						if isstring( v ) and v == "_" then num = k break end end if num > 0 then
						xdefm_Command( LocalPlayer(), "Struct", slo.S_Place .. "|" .. num )
						else xdefm_AddNote( ply, "!V", "resource/warning.wav", "cross", 5 ) end end end )
						O_Store:SetIcon( "icon16/basket_go.png" )
					end
					if slo.T_Item.Type == "Bait" then
						if slo.S_Place ~= "21" then
							local O_Equip = dnm:AddOption( "#xdefm.Equip", function()
							if not slo.B_OnMove then xdefm_Command( LocalPlayer(), "MoveInv", slo.S_Place .. "|21" ) end end )
							O_Equip:SetIcon( "icon16/bug_go.png" ) else
							local O_Dequip = dnm:AddOption( "#xdefm.Dequip", function() if slo.B_OnMove then return end
							local num = 0  for k, v in pairs( LocalPlayer().xdefm_Profile.Items ) do if k ~= 21 and v == "_" then num = k break end end
							if num > 0 then xdefm_Command( LocalPlayer(), "MoveInv", "21|" .. num ) end end ) O_Dequip:SetIcon( "icon16/bug_go.png" )
						end
					end
					if slo.T_Item.Type == "Recipe" and IsValid( xdefmod.util.menus[ "Craft" ] ) then
						local O_Store = dnm:AddOption( "#xdefm.Store", function()
						if not slo.B_OnMove and IsValid( xdefmod.util.menus[ "Craft" ] ) then
							xdefm_Command( LocalPlayer(), "MoveCraft", slo.S_Place )
						else xdefm_AddNote( ply, "!V", "resource/warning.wav", "cross", 5 ) end end )
						O_Store:SetIcon( "icon16/script_go.png" )
					end
					if IsValid( xdefmod.util.menus[ "Trade" ] ) then
						local O_Store = dnm:AddOption( "#xdefm.Weapon_Trade", function()
						if not slo.B_OnMove and IsValid( xdefmod.util.menus[ "Trade" ] ) and istable( xdefmod.util.menus[ "Trade" ].T_Slo1 ) then
						local num = 0  for k, v in pairs( xdefmod.util.menus[ "Trade" ].T_Slo1 ) do
						if isstring( v.S_Item ) and v.S_Item == "_" then num = k break end end if num > 0 then
						xdefm_Command( LocalPlayer(), "MoveTrade", slo.S_Place .. "|" .. num )
						else xdefm_AddNote( ply, "!V", "resource/warning.wav", "cross", 5 ) end end end )
						O_Store:SetIcon( "icon16/basket_go.png" )
					end
					dnm:Open()
				end
			end end
		-- Uprade panel
		if true then
			local pax = pan.P_Menu2 -- FIXME: "pax" shadows existing binding!
			local skp = pax.P_Scroll:Add( "DPanel" ) skp:SetSize( 0, 30 ) skp:Dock( TOP )
			function skp:Paint( w, h )
				local tab = xdefmod.util.menus.Inventory.T_Data -- FIXME: "tab" shadows existing binding!
				draw.TextShadow( { text = language.GetPhrase( "xdefm.Skp" ) .. ": " .. tab.Skp, pos = { 8, h / 2 }, font = "xdefm_Font7",
				xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
			end local MatA = Material( "gui/gradient_up" )
			local function AddASkillTab( ski ) local num = xdefmod.util.UPGRADE_COSTS[ ski ]  if not isnumber( num ) or not tab[ "Upd" .. ski ] then return end
				local pan = pax.P_Scroll:Add( "DPanel" ) -- FIXME: "pan" shadows existing binding!
				pan:SetSize( 0, 38 ) pan:Dock( TOP ) pan.N_Goto = math.Clamp( tab[ "Upd" .. ski ] / 100, 0, 1 )
				function pan:Paint( w, h )
					local tab = xdefmod.util.menus.Inventory.T_Data -- FIXME: "tab" shadows existing binding!
					pan.N_Goto = Lerp( 0.1, pan.N_Goto, math.Clamp( tab[ "Upd" .. ski ] / ( ski == "G" and 5 or 100 ), 0, 1 ) )
					surface.SetDrawColor( Color( 0, 155, 155, 55 ) ) surface.DrawRect( 8, 4, w -16, h -8 )
					local col = xdefmod.COLOR_BORDER  if ski == "G" and GetConVar( "xdefmod_nomorehook" ):GetInt() >= 1 then col = Color( 255 - col.r, 255 - col.g, 255 - col.b ) end
					draw.RoundedBox( 0, 8, 2, 415 * pan.N_Goto, h - 4, col )
					surface.SetMaterial( MatA ) surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawTexturedRect( 8, 2, w - 16, h -4 )
					surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 8, 2, w - 16, h - 4, 2 )
					surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 8, 2, w - 16, h - 4, 1 )
					draw.TextShadow( { text = language.GetPhrase( "xdefm.Upd" .. ski ) .. ( ski == "G" and GetConVar( "xdefmod_nomorehook" ):GetInt() >= 1 and " ※" or "" ),
					pos = { 16, h / 2 }, font = "xdefm_Font5", xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
					draw.TextShadow( { text = "Lv." .. ( ( ski == "G" and tab[ "Upd" .. ski ] >= 5 or tab[ "Upd" .. ski ] >= 100 ) and "Max" or tab[ "Upd" .. ski ] ),
					pos = { w -160, h / 2 }, font = "xdefm_Font5", xalign = TEXT_ALIGN_RIGHT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
					draw.TextShadow( { text = "±" .. tostring( num ), pos = { w - 72, h / 2 }, font = "xdefm_Font1",
					xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
				end for i = 1, 2 do
					local but = pan:Add( "DButton" ) but:SetSize( 30, 20 ) but:SetPos( 305 + (i - 1) * 80, 10 ) but:SetText( "" )
						but.B_Hover = false  but.N_Lerp = 0  function but:Paint( w, h ) but.N_Lerp = Lerp( 0.2, but.N_Lerp, but.B_Hover and 1 or 0 )
						col = Color( 100 + 55 * but.N_Lerp, 100 + 100 * but.N_Lerp, 100 + 100 * but.N_Lerp ) local skl = xdefmod.util.menus.Inventory.T_Data[ "Upd" .. ski ]
						local mmm = ( ski == "G" and skl >= 5 or skl >= 100 )
						if ( i == 2 and mmm ) or ( i == 1 and skl <= 0 ) or ( i == 2 and xdefmod.util.menus.Inventory.T_Data[ "Skp" ] < num ) then return end
						draw.RoundedBox( 0, 1, 1, w - 2, h - 2, col ) draw.TextShadow( { text = i == 2 and "+" or "-", pos = { w / 2, h / 2 }, font = "xdefm_Font4",
						xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
						surface.SetDrawColor( 0, 0, 0, 255 ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
						surface.SetDrawColor( 255, 255, 255, 255 ) surface.DrawOutlinedRect( 0, 0, w, h, 1 ) end
					function but:OnCursorEntered() self.B_Hover = true end function but:OnCursorExited() self.B_Hover = false end
					function but:DoClick() local skl = xdefmod.util.menus.Inventory.T_Data[ "Upd" .. ski ]
						local skl = xdefmod.util.menus.Inventory.T_Data[ "Upd" .. ski ] -- FIXME: "skl" shadows existing binding!
						local mmm = ( ski == "G" and skl >= 5 or skl >= 100 )
						if ( i == 2 and mmm ) or ( i == 1 and skl <= 0 ) or ( i == 2 and xdefmod.util.menus.Inventory.T_Data[ "Skp" ] < num ) then return end
						xdefm_Command( LocalPlayer(), i == 1 and "Downgrade" or "Upgrade", ski .. "|" .. 1 ) end
					function but:DoRightClick() if IsValid( pan.P_DMenu ) then pan.P_DMenu:Remove() end
						local skl = xdefmod.util.menus.Inventory.T_Data[ "Upd" .. ski ]  local mmm = ( ski == "G" and skl >= 5 or skl >= 100 )
						if ( i == 2 and mmm ) or ( i == 1 and skl <= 0 ) or ( i == 2 and xdefmod.util.menus.Inventory.T_Data[ "Skp" ] < num ) then return end
						pan.P_DMenu = DermaMenu( false, nil )  local dnm = pan.P_DMenu  local wt = ( i == 2 and "+" or "-" )
						local O_X1 = dnm:AddOption( wt .. "1", function() -- REVIEW: "O_X1" unused?
							if not IsValid( xdefmod.util.menus.Inventory ) then return end
							xdefm_Command( LocalPlayer(), i == 1 and "Downgrade" or "Upgrade", ski .. "|" .. 1 )
						end)
						local O_X5 = dnm:AddOption( wt .. "5", function() -- REVIEW: "O_X5" unused?
							if not IsValid( xdefmod.util.menus.Inventory ) then return end
							xdefm_Command( LocalPlayer(), i == 1 and "Downgrade" or "Upgrade", ski .. "|" .. 5 )
						end)
						if ski ~= "G" then
							local O_X10 = dnm:AddOption( wt .. "10", function() -- REVIEW: "O_X10" unused?
								if not IsValid( xdefmod.util.menus.Inventory ) then return end
							xdefm_Command( LocalPlayer(), i == 1 and "Downgrade" or "Upgrade", ski .. "|" .. 10 )
							end)
						local O_X50 = dnm:AddOption( wt .. "50", function() -- REVIEW: "O_X50" unused?
							if not IsValid( xdefmod.util.menus.Inventory ) then return end
							xdefm_Command( LocalPlayer(), i == 1 and "Downgrade" or "Upgrade", ski .. "|" .. 50 )
						end)
						local O_X100 = dnm:AddOption( wt .. "100", function() -- REVIEW: "O_X100" unused?
							if not IsValid( xdefmod.util.menus.Inventory ) then return end
							xdefm_Command( LocalPlayer(), i == 1 and "Downgrade" or "Upgrade", ski .. "|" .. 100 )
						end) end
						dnm:Open() end
				end
			end
			--local MaX = Material( "gui/center_gradient" ) -- Unused?
			AddASkillTab( "A" ) AddASkillTab( "B" ) AddASkillTab( "C" ) AddASkillTab( "D" ) AddASkillTab( "E" ) AddASkillTab( "F" ) AddASkillTab( "G" )
			-- Inventory button
			if true then
				local ppp = pax.P_Scroll:Add( "DPanel" ) ppp:SetSize( 0, 75 ) ppp:Dock( TOP ) function ppp:Paint( w, h ) end ppp.N_Lerp = 0
				local but = ppp:Add( "DButton" ) but:SetSize( 150, 28 ) but:SetPos( 274, 8 ) but:SetText( "" ) but.B_Hover = false function but:Paint( w, h )
					ppp.N_Lerp = Lerp( 0.2, ppp.N_Lerp, but.B_Hover and 1 or 0 )
					col = Color( 100 + 55 * ppp.N_Lerp, 100 + 100 * ppp.N_Lerp, 100 + 100 * ppp.N_Lerp )
					if xdefmod.util.skill_reset_cooldown > CurTime() then col = Color( 55, 55, 55 ) end
					surface.SetDrawColor( col ) surface.DrawRect( 0, 0, w, h ) local txt = language.GetPhrase( "xdefm.ResetSkp" )
					if xdefmod.util.skill_reset_cooldown > CurTime() then txt = math.Round( xdefmod.util.skill_reset_cooldown-CurTime() ) .. "s"
						local per = math.Clamp( (xdefmod.util.skill_reset_cooldown-CurTime()) / GetConVar( "xdefmod_skpcool" ):GetInt(), 0, 1 )
						surface.SetDrawColor( 255, 55, 55 ) surface.DrawRect( 0, 0, w * per, h )
					end surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
					surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 1 ) draw.TextShadow( { text = txt,
					pos = { w / 2, h / 2 - 1 }, font = "xdefm_Font2", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
				end function but:OnCursorEntered() self.B_Hover = true end function but:OnCursorExited() self.B_Hover = false end
				function but:DoClick() if xdefmod.util.skill_reset_cooldown > CurTime() then return end
					if IsValid( pan.P_DMenu ) then pan.P_DMenu:Remove() end pan.P_DMenu = DermaMenu( false, nil )  local dnm = pan.P_DMenu
					local O_Yes = dnm:AddOption( "#xdefm.Confirm", function() if xdefmod.util.skill_reset_cooldown <= CurTime() and IsValid( xdefmod.util.menus[ "Inventory" ] ) then
						xdefmod.util.skill_reset_cooldown = CurTime() + GetConVar( "xdefmod_skpcool" ):GetInt() xdefm_Command( LocalPlayer(), "ResetSkp", "_" )
					end end ) O_Yes:SetIcon( "icon16/tick.png" ) dnm:Open()
				end
			end end
		-- Collection panel
		if true then
			local pax = pan.P_Menu3 -- FIXME: "pax" shadows existing binding!
			local function AddAStatTab( stt, aba )
				local pan = pax.P_Scroll:Add( "DPanel" ) -- FIXME: "pan" shadows existing binding!
				pan:SetSize( 0, stt == "!V" and 9 or 30 ) pan:Dock( TOP )
				function pan:Paint( w, h ) if stt == "!V" then return end
				local tab = xdefmod.util.menus.Inventory.T_Data -- FIXME: "tab" shadows existing binding!
					local dat, num = stt, 0  if isnumber( xdefmod.util.UPGRADE_COSTS[ stt ] )
					then dat = "Upd" .. stt  num = xdefm_GetUpValue( tab[ dat ], stt ) else num = tab[ stt ] or 0 end
					draw.TextShadow( { text = language.GetPhrase( "xdefm." .. dat ) .. ": " .. num,
					pos = { 16, h / 2 }, font = "xdefm_Font1", xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
				end
			end
			AddAStatTab( "!V" ) AddAStatTab( "TCatch" ) AddAStatTab( "TEarn" ) AddAStatTab( "TExp" )
			AddAStatTab( "TBuy" ) AddAStatTab( "TCraft" ) AddAStatTab( "TQuest" ) end end
		-- Shop panel
		if true then local pax = pan.P_Menu5
			pax.P_Scroll:Dock( NODOCK ) pax.P_Scroll:SetPos( 2, 2 ) pax.P_Scroll:SetSize( 434, 347 )
			pax.P_Hold = pax.P_Scroll:Add( "DIconLayout" )  local pa2 = pax.P_Hold  pa2:SetSize( 434, 347 )
			pa2:SetSpaceX( 3 ) pa2:SetSpaceY( 3 ) pa2:SetPos( 3, 2 ) local MaX = Material( "gui/center_gradient" )
			for k, v in SortedPairsByMemberValue( xdefmod.shop, 2 ) do
				local Item = pax.P_Hold:Add( "DButton" ) Item:SetSize( 210, 75 ) Item.N_Clicked = 0  Item:SetCursor( "blank" )
				local _, bb = xdefm_ItemGet( k ) if not istable( bb ) or bb.Type ~= "Bait" then Item:Remove() return end  Item.N_Lerp = 0.3
				Item.S_Name = bb.Name  Item.N_Rarity = bb.Rarity  Item.S_Item = k  Item.N_Level = v[ 2 ]  Item.N_Cost = math.ceil( v[ 1 ] * v[ 3 ] )
				function Item:OnCursorEntered() xdefmod.util.aim_pan = Item  xdefmod.util.marker = Item.S_Item  Item.B_OnMove = true  xdefmod.util.lc = false end
				function Item:OnCursorExited() if xdefmod.util.aim_pan == Item then xdefmod.util.aim_pan = nil  xdefmod.util.marker = nil end Item.B_OnMove = false end
				function Item:DoClick() Item.N_Clicked = CurTime() + 0.2
					local yes = true -- FIXME: "yes" shadows existing binding!
					local pro = LocalPlayer().xdefm_Profile
					if pro.Money < Item.N_Cost then xdefm_AddNote( ply, "xdefm.NoMoney", "resource/warning.wav", "cross", 5 ) yes = false end
					if yes and pro.Level < Item.N_Level then xdefm_AddNote( ply, "xdefm.NoLevel", "resource/warning.wav", "cross", 5 ) yes = false end
					if yes then xdefm_Command( LocalPlayer(), "BuyBait", Item.S_Item ) end end
				function Item:OnRemove() Item:OnCursorExited() end
				function Item:Paint( w, h )
					local col = xdefmod.util.RARITY_COLORS[ Item.N_Rarity + 1 ] -- FIXME: "col" shadows existing binding!
					local tab = xdefmod.shop[ k ] -- FIXME: "tab" shadows existing binding!
					Item.N_Cost = math.ceil( tab[ 1 ] * tab[ 3 ] )
					draw.RoundedBox( 0, 0, 0, w, h, col )  local pro = LocalPlayer().xdefm_Profile  if not istable( pro ) then return end
					Item.N_Lerp = Lerp( 0.2, Item.N_Lerp, Item.N_Clicked > CurTime() and 0.1 or ( xdefmod.util.aim_pan == Item and 0.5 or 0.3 ) )
					local ccc = Item.N_Lerp  draw.RoundedBox( 0, 1, 1, w -2, h -2, Color( col.r * ccc, col.g * ccc, col.b * ccc ) )
					surface.SetMaterial( MaX ) surface.SetDrawColor( col.r * ccc * 1.5, col.g * ccc * 1.5, col.b * ccc * 1.5 ) surface.DrawTexturedRect( 1, 1, w -2, h -2 )
					local co1, co2 = Color( 255, 0, 0 ), Color( 0, 255, 0 )
					draw.TextShadow( {
						text = language.GetPhrase( Item.S_Name ), pos = { 75, 15 }, font = "xdefm_Font2",
						xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = col
					}, 1, 255 )
					draw.TextShadow( {
						text = language.GetPhrase( "xdefm.Price" ) .. ": " .. Item.N_Cost, pos = { 75, 35 }, font = "xdefm_Font2",
						xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = pro.Money >= Item.N_Cost and co2 or co1
					}, 1, 255 )
					draw.TextShadow( {
						text = language.GetPhrase( "xdefm.Level" ) .. ": " .. Item.N_Level, pos = { 75, 55 }, font = "xdefm_Font2",
						xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = pro.Level >= Item.N_Level and co2 or co1
					}, 1, 255 ) end
				Item.P_Frame = Item:Add( "DPanel" )  Item:SetText( "" )
				Item.P_Frame:SetSize( 64, 64 ) Item.P_Frame:SetPos( 6, 6 )
				Item.P_Frame:SetMouseInputEnabled( false )  function Item.P_Frame:Paint( w, h )
					local col = xdefmod.util.RARITY_COLORS[ Item.N_Rarity + 1 ] -- FIXME: "col" shadows existing binding!
					surface.SetDrawColor( Color( col.r * 0.2, col.g * 0.2, col.b * 0.2 ) )  surface.DrawRect( 0, 0, w, h )
					surface.SetDrawColor( col )  surface.DrawOutlinedRect( 0, 0, w, h, 2 )
					surface.SetDrawColor( xdefmod.COLOR_LINE )  surface.DrawOutlinedRect( 0, 0, w, h, 1 ) end
				Item.P_Icon = Item.P_Frame:Add( "ModelImage" ) Item.P_Icon:DockMargin( 5, 5, 5, 5 )
				Item.P_Icon:Dock( FILL ) Item.P_Icon:SetModel( bb.Model[ 1 ] ) Item.P_Icon:SetMouseInputEnabled( false )
			end end
		-- Leaderboard menu
		if GetConVar( "xdefmod_lbdelay" ):GetInt() > 0 and not game.SinglePlayer() then local pax = pan.P_Menu4
			local ldb = pax:Add( "DPanel" ) ldb:SetSize( 0, 355 ) ldb:Dock( TOP ) pax.T_Leader = xdefmod.Leader
			function ldb:Paint( w, h )
				--local tab = xdefmod.util.menus.Inventory.T_Data -- Unused?
				if not istable( pax.T_Leader ) or #pax.T_Leader <= 0 then
					draw.TextShadow( { text = language.GetPhrase( "xdefm.NoInfo" ), pos = { w / 2, h / 2 }, font = "xdefm_Font5",
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
			function pax:UpdateLbd( tab ) -- FIXME: "tab" shadows existing binding!
				pax.T_Leader = tab  scr:Clear() if not istable( tab ) then return end
				for k, v in pairs( tab ) do
					local plc = scr:Add( "DPanel" ) plc:Dock( TOP ) plc:SetSize( 0, 40 ) plc:DockMargin( 0, 4, 0, 0 )
					plc.N_Place = k  plc.T_Data = v  plc.S_Sid = v[ 2 ]
					local avt = plc:Add( "AvatarImage" ) avt:SetPos( 33, 4 ) avt:SetSize( 32, 32 ) avt:SetSteamID( plc.S_Sid, 64 )
					plc:SetToolTip( plc.S_Sid ) -- DEPRECATED: Use :SetTooltip instead, notice the lowercase t
					function plc:Paint( w, h )
						local col = xdefmod.COLOR_BORDER -- FIXME: "col" shadows existing binding!
						local npl = plc.N_Place  if npl == 1 then col = Color( 255, 255, 55 ) elseif npl == 2 then col = Color( 255, 255, 255 )
						elseif npl == 3 then col = Color( 255, 155, 55 ) end local co2 = Color( col.r * 0.3, col.g * 0.3, col.b * 0.3 )  local co3 = Color( col.r * 0.6, col.g * 0.6, col.b * 0.6 )
						surface.SetDrawColor( co2 ) surface.DrawRect( 0, 0, w, h )
						surface.SetDrawColor( co3 ) surface.SetMaterial( Ma2 ) surface.DrawTexturedRect( 0, 0, w, h )
						local bb, si = ( LocalPlayer():SteamID64() == plc.S_Sid ), ( 0.5 + 0.5 * math.abs( math.sin( CurTime() * 4 ) ) )
						surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, bb and 3 or 2 )
						surface.SetDrawColor( bb and Color( col.r * si, col.g * si, col.b * si ) or col ) surface.DrawOutlinedRect( 0, 0, w, h, bb and 2 or 1 )
						draw.TextShadow( { text = k .. ".", pos = { 16, h  / 2 }, font = "xdefm_Font7",
						xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = col }, 1, 255 )
						surface.SetMaterial( Mat ) surface.SetDrawColor( 255, 255, 255 ) surface.DrawTexturedRect( 32, 3, 33, 33 )
						surface.SetDrawColor( col ) surface.DrawOutlinedRect( 32, 3, 34, 34, 2 )
						draw.TextShadow( { text = plc.T_Data[ 3 ], pos = { 72, h / 2 }, font = "xdefm_Font2",
						xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = col }, 1, 255 )
						draw.TextShadow( { text = plc.T_Data[ 4 ], pos = { 240, h / 2 }, font = "xdefm_Font2",
						xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = col }, 1, 255 )
						draw.TextShadow( { text = plc.T_Data[ 5 ], pos = { 340, h / 2 }, font = "xdefm_Font2",
						xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = col }, 1, 255 )
					end
				end
			end pax:UpdateLbd( xdefmod.leader ) end
	-- Bait slot
	if true then
		pan.P_AFrame = pan:Add( "DPanel" )  pax = pan.P_AFrame
		pax:SetText( "" ) pax:SetPos( 336 - 4, 9 - 3 ) pax:SetSize( 64 + 8, 64 + 8 ) pax:SetMouseInputEnabled( false )
		function pax:Paint( w, h ) surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 1 ) end end
	function pan:XDEFM_Update( id, dt ) if id == 7 and IsValid( pan.P_Menu4 ) then pan.P_Menu4:UpdateLbd( dt ) end
		if id == 0 then pan.T_Data = dt  for k, v in pairs( pan.T_Slots ) do v:F_SetupItem( dt.Items[ k ] ) end end
	end
-- Quest menu
elseif typ == 1 then
	if IsValid( xdefmod.util.menus[ "Quest" ] ) then return end local Aro = Material( "gui/arrow" )
	local pan = vgui.Create( "DFrame" )  xdefmod.util.menus.Quest = pan
	pan:SetPos( ScrW() / 2 - 300, ScrH() / 2 - 300 ) pan:SetSize( 600, 400 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:ParentToHUD() pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW() / 2 - 300, ScrH() / 2 - 300, 0.2 ) pan.T_Require = {} pan.T_Reward = {}
	pan.B_1 = false  pan.B_2 = false  pan.B_3 = false  pan.N_Total = 0
	function pan:Paint( w, h )
		--local tab = pan.T_Data -- Unused?
		surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated( w / 2, h / 2, w, h, 0 )
		surface.DrawTexturedRectRotated( w / 2, h / 2, w, h, 180 )
		surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.TextShadow( {
			text = language.GetPhrase( "xdefm.Quest" ) .. " #" .. pan.N_Total, font = "xdefm_Font6", pos = { w / 2, 24 },
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 )
		}, 1, 255 )
		draw.TextShadow( {
			text = language.GetPhrase( "xdefm.Require" ), font = "xdefm_Font5", pos = { w / 2 -160, 50 },
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 )
		}, 1, 255 )
		draw.TextShadow( {
			text = language.GetPhrase( "xdefm.Reward" ), font = "xdefm_Font5", pos = { w / 2 + 160, 50 },
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 )
		}, 1, 255 ) surface.SetMaterial( Aro )
		surface.SetDrawColor( pan.B_2 and Color( 0, 255, 0 ) or Color( 255, 0, 0 ) ) surface.DrawTexturedRectRotated( w / 2, h / 2 - 15, 60, 60, 90 )
		surface.SetDrawColor( pan.B_1 and Color( 0, 255, 0 ) or Color( 255, 0, 0 ) ) surface.DrawTexturedRectRotated( w / 2, h / 2 + 15, 60, 60, 270 ) end
	if true then -- Close button
		pan.P_Close = pan:Add( "DButton" )
		local pax = pan.P_Close -- FIXME: "pax" shadows existing binding!
		pax:SetText( "" ) pax:SetPos( 560, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint( w, h ) draw.TextShadow( {
				text = "×", pos = { w / 2, h / 2 }, font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER,
				color = pax.B_Hover and Color( 255, 0, 0 ) or Color( 255, 255, 255 )
		}, 2, 255 ) end function pax:DoClick() pan:Close() end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end --
	for i = 1, 2 do -- Requirements / Reward panel
		local pax = pan:Add( "DPanel" ) -- FIXME: "pax" shadows existing binding!
		pax:SetPos( 300 -110 -175 + 320 * ( i - 1 ), 75 ) pax:SetSize( 250, 250 )
		function pax:Paint( w, h )
			surface.SetDrawColor( Color( xdefmod.COLOR_BACKGROUND.r * 0.5, xdefmod.COLOR_BACKGROUND.g * 0.5, xdefmod.COLOR_BACKGROUND.b * 0.5 ) ) surface.DrawRect( 0, 0, w, h )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h )
		end
		pax.P_Scroll = pax:Add( "DScrollPanel" ) pax.P_Scroll:SetSize( 246, 246 ) pax.P_Scroll:SetPos( 1, 2 )
		local vba = pax.P_Scroll:GetVBar()  vba:SetHideButtons( true )  vba:SetSize( 0, 0 )
		function vba.btnGrip:Paint( w, h ) end function vba:Paint( w, h ) end function pax.P_Scroll:Paint( w, h ) end
		pax.P_Hold = pax.P_Scroll:Add( "DIconLayout" )  local pa2 = pax.P_Hold  pa2:SetSize( 246, 0 )
		pa2:DockMargin( 4, 4, 4, 4 ) pa2:SetSpaceX( 3 ) pa2:SetSpaceY( 3 ) pa2:SetPos( 4, 2 ) function pa2:Paint( w, h ) end
		if i == 1 then pan.P_1 = pax.P_Hold else pan.P_2 = pax.P_Hold end
	end
	for i = 1, 2 do -- Skip button
		local but = pan:Add( "DButton" ) but:SetPos( 300 -75 -( i == 1 and -100 or 100 ), 340 ) but:SetSize( 150, 45 )
		but:SetText( "" )  but.B_Hover = false  but.N_Lerp = 0  but.N_Clicked = 0
		function but:Paint( w, h ) local col = Color( 0, 155, 0 )
			but.N_Lerp = Lerp( 0.2, but.N_Lerp, but.N_Clicked > CurTime() and -1 or ( but.B_Hover and 1 or 0 ) )
			if ( i == 1 and ( not pan.B_1 or not pan.B_2 ) ) or ( i == 2 and not pan.B_3 ) then col = Color( 155, 0, 0 ) end
			col = Color( col.r + col.r * 0.5 * but.N_Lerp, col.g + col.g * 0.5 * but.N_Lerp, col.b + col.b * 0.5 * but.N_Lerp )
			surface.SetDrawColor( col ) surface.DrawRect( 0, 0, w, h )
			draw.TextShadow( { text = i == 1 and "#xdefm.Finish" or "#xdefm.Skip", pos = { w / 2, h / 2 }, font = "xdefm_Font4",
			color = Color( 255, 255, 255 ), xalign = TEXT_ALIGN_CENTER, yalign =  TEXT_ALIGN_CENTER }, 1, 200 )
			surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		end
		function but:OnCursorEntered() but.B_Hover = true end
		function but:OnCursorExited() but.B_Hover = false end
		function but:DoClick() if but.N_Clicked > CurTime() then return end
			but.N_Clicked = CurTime() + 0.25
			if i == 1 then
				if not pan.B_1 then
					xdefm_AddNote( ply, "xdefm.Deny1", "resource/warning.wav", "cross", 5 )
				elseif not pan.B_2 then
					xdefm_AddNote( ply, "xdefm.Deny2", "resource/warning.wav", "cross", 5 )
				else
					pan.P_Close:DoClick()
					xdefm_Command( LocalPlayer(), "Quest", "_" )
				end
			elseif not pan.B_3 then
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
			pan.N_Total = ( dt.TQuest or 0 ) + 1
			local tem = {}
			for k, v in pairs( pan.T_Require ) do
				local yes = false -- FIXME: "yes" shadows existing binding!
				for m, n in pairs( dt.Items ) do
					if m ~= 21 and not tem[ m ] and xdefm_GetClass( n ) == v then
						tem[ m ] = 0
						yes = true
						break
					end
				end
				if not yes then pan.B_1 = false break end
			end
			local emp = 0
			for k, v in pairs( dt.Items ) do
				if k ~= 21 and ( v == "_" or tem[ k ] ) then emp = emp + 1 end
			end
			pan.B_2 = ( emp >= #pan.T_Reward )
		elseif id == 10 then
			pan.P_1:Clear() pan.P_2:Clear() pan.T_Require = {} pan.T_Reward = {}
			for i = 1, 2 do
				local tab = dt[ i + 1 ] -- FIXME: "tab" shadows existing binding!
				if not isstring( tab ) then break end
				tab = string.Explode( "&", tab ) or { tab }
				for k, v in pairs( tab ) do
					local _, bb = xdefm_ItemGet( v )
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
elseif typ == 2 then -- Exchange menu
	if IsValid( xdefmod.util.menus[ "Exchange" ] ) then xdefmod.util.menus[ "Exchange" ]:Remove() return end
	local pan = vgui.Create( "DFrame" )  xdefmod.util.menus.Exchange = pan  pan.T_Data = tab  pan.N_Enter = 0
	pan:SetPos( ScrW() / 2 -300, ScrH() / 2 - 150 ) pan:SetSize( 600, 275 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:ParentToHUD() pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW() / 2 -300, ScrH() / 2 - 275 / 2, 0.2 ) ply.xdefm_Profile = tab  pan.N_Clicked = 0
	function pan:Paint( w, h )
		local tab = pan.T_Data -- FIXME: "tab" shadows existing binding!
		surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated( w / 2, h / 2, w, h, 0 )
		surface.DrawTexturedRectRotated( w / 2, h / 2, w, h, 180 )
		surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.TextShadow( { text = ply:Nick(), pos = { 115, 25 }, font = "xdefm_Font4",
		xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		draw.TextShadow( { text = language.GetPhrase( "#xdefm.FMoney" ) .. ": " .. tab.Money, pos = { 115, 55 }, font = "xdefm_Font1",
		xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		draw.TextShadow( { text = language.GetPhrase( "#xdefm.DMoney" ) .. ": " .. ( ply.getDarkRPVar and ply:getDarkRPVar("money") or "Currency Not Found!" ), pos = { 115, 78 }, font = "xdefm_Font1",
		xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		local rat = math.Round( 0.99 * GetConVar( "xdefmod_darkrp" ):GetFloat() * 100, 2 ) .. "%"
		draw.TextShadow( { text = language.GetPhrase( "#xdefm.DRate" ) .. ": " .. rat, pos = { 115, 101 }, font = "xdefm_Font1",
		xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 8, 115, 582, 150, 2 )
		surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 8, 115, 582, 150 )
		surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 16, 126, 564, 43 )
		surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 16, 126, 564, 43 ) end
	if true then -- Avatar image
		pan.P_AIcon = pan:Add( "AvatarImage" )
		local pax = pan.P_AIcon -- FIXME: "pax" shadows existing binding!
		pax:SetPos( 8, 10 ) pax:SetSize( 100, 100 ) pax:SetPlayer( ply, 128 ) pax:SetMouseInputEnabled( false )
		pan.P_AFrame = pan:Add( "DPanel" )  pax = pan.P_AFrame
		pax:SetText( "" ) pax:SetPos( 8, 10 ) pax:SetSize( 100, 100 ) pax:SetMouseInputEnabled( false )
		function pax:Paint( w, h ) surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 3 )
		surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 2 ) end end
	if true then -- Close button
		pan.P_Close = pan:Add( "DButton" )
		local pax = pan.P_Close -- FIXME: "pax" shadows existing binding!
		pax:SetText( "" ) pax:SetPos( 560, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint( w, h ) draw.TextShadow( {
				text = "×", pos = { w / 2, h / 2 }, font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER,
				color = pax.B_Hover and Color( 255, 0, 0 ) or Color( 255, 255, 255 )
		}, 2, 255 ) end function pax:DoClick() pan:Close() end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end
	if true then -- Value
		pan.P_Entry = vgui.Create( "DTextEntry", pan )
		pan.P_Entry:SetSize( 555, 35 ) pan.P_Entry:SetPos( 20, 130 ) pan.P_Entry:SetFont( "xdefm_Font4" )
		pan.P_Entry:SetUpdateOnType( true ) pan.P_Entry:SetNumeric( true ) pan.P_Entry:SetMultiline( false )
		pan.P_Entry:SetTextColor( Color( 0, 0, 0 ) )
		pan.P_Entry:SetPlaceholderText( "#xdefm.DEnter" )
		function pan.P_Entry:OnValueChange( val )
			local num = isnumber( tonumber( val ) ) and tonumber( val ) or 0
			if not isnumber( num ) or num < 0 or num > 2147483647 then
				num = math.Clamp( not isnumber( num ) and 0 or num, 0, 2147483647 )
				pan.P_Entry:SetText( num ) surface.PlaySound( "resource/warning.wav" )
			end
			pan.N_Enter = num
		end end
	for i = 1, 2 do -- Convert button
		if not ply.getDarkRPVar then break end
		local but = vgui.Create( "DButton", pan )  but:SetText( "" )  but.B_Hover = false  but.N_Lerp = 0
		but:SetSize( 200, 60 ) but:SetPos( -180 + i * 250, 190 ) but.N_Num = 0
		function but:Paint( w, h )
			local rat = GetConVar( "xdefmod_darkrp" ):GetFloat()
			local num = math.max( i == 1 and math.floor( pan.N_Enter * rat * 0.99 ) or math.floor( pan.N_Enter / rat * 0.99 ), 0 )
			local col = Color(155, 0, 0) -- FIXME: "col" shadows existing binding!
			if num > 0 and ((i == 1 and pan.T_Data.Money >= pan.N_Enter) or (i == 2 and LocalPlayer():canAfford(pan.N_Enter))) then
				col = Color(0, 155, 0)
			end
			but.N_Num = Lerp( 0.2, but.N_Num, num )
			but.N_Lerp = Lerp( 0.2, but.N_Lerp, pan.N_Clicked > CurTime() and -1 or ( but.B_Hover and 1 or 0 ) )
			col = Color(col.r + col.r * 0.5 * but.N_Lerp, col.g + col.g * 0.5 * but.N_Lerp, col.b + col.b * 0.5 * but.N_Lerp)
			surface.SetDrawColor( col ) surface.DrawRect( 0, 0, w, h )
			draw.TextShadow({
				text = i == 1 and "#xdefm.Conv1" or "#xdefm.Conv2",
				pos = {w / 2, 16},
				font = "xdefm_Font5",
				color = Color(255, 255, 255),
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER
			}, 1, 200)
			draw.TextShadow({
				text = math.Round(but.N_Num),
				pos = {w / 2, 45},
				font = "xdefm_Font5",
				color = Color(255, 255, 255),
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER
			}, 1, 200)
			surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		end
		function but:OnCursorEntered() but.B_Hover = true end
		function but:OnCursorExited() but.B_Hover = false end
		function but:DoClick() if pan.N_Clicked > CurTime() then return end
			local rat = GetConVar( "xdefmod_darkrp" ):GetFloat()
			local num = math.max(i == 1 and math.floor(pan.N_Enter * rat * 0.99) or math.floor(pan.N_Enter / rat * 0.99), 0)
			if num > 0 and ( ( i == 1 and pan.T_Data.Money >= pan.N_Enter ) or ( i == 2 and LocalPlayer():canAfford( pan.N_Enter ) ) ) then
				xdefm_Command( ply, "Convert", pan.N_Enter .. "|" .. i )
				pan.N_Clicked = CurTime() + 0.5
			else
				surface.PlaySound( "resource/warning.wav" )
				pan.N_Clicked = CurTime() + 0.25
			end
		end end
	function pan:XDEFM_Update( id, dt ) if id == 0 then pan.T_Data = dt end end
elseif typ == 3 then -- NPC menu
	if IsValid( xdefmod.util.menus[ "NPC" ] ) then return end
	local pan = vgui.Create( "DFrame" )  xdefmod.util.menus.NPC = pan  pan.T_Data = tab  pan.N_Enter = 0
	pan:SetPos(ScrW() / 2 - 250, ScrH() / 2 - 150)
	pan:SetSize(500, 345)
	pan:ShowCloseButton(false)
	pan:SetAnimationEnabled(false)
	pan:SetVisible(true)
	pan:SetScreenLock(true)
	pan:SetDraggable(true)
	pan:SetTitle("")
	pan:ParentToHUD()
	pan:SetAlpha(255)
	pan:MakePopup()
	pan:MoveTo(ScrW() / 2 - 250, ScrH() / 2 - 275 / 2, 0.2)
	ply.xdefm_Profile = tab
	pan.N_Clicked = 0
	function pan:Paint(w, h)
		local tab = pan.T_Data -- FIXME: "tab" shadows existing binding!
		surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated(w / 2, h / 2, w, h, 0)
		surface.DrawTexturedRectRotated(w / 2, h / 2, w, h, 180)
		surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.TextShadow({
			text = "#xdefm.DarkNPC2",
			pos = {w / 2, 24},
			font = "xdefm_Font4",
			xalign = TEXT_ALIGN_CENTER,
			yalign = TEXT_ALIGN_CENTER,
			color = Color(255, 255, 255)
		}, 1, 255)
		surface.SetDrawColor(Color(xdefmod.COLOR_BACKGROUND.r * 0.5, xdefmod.COLOR_BACKGROUND.g * 0.5, xdefmod.COLOR_BACKGROUND.b * 0.5, xdefmod.COLOR_BACKGROUND.a * 0.5))
		surface.DrawRect(8, 45, 484, 290)
		surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 8, 45, 484, 290, 2 )
		surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 8, 45, 484, 290 ) end
	if true then -- Close button
		pan.P_Close = pan:Add("DButton")
		local pax = pan.P_Close -- FIXME: "pax" shadows existing binding!
		pax:SetText( "" ) pax:SetPos( 460, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint(w, h)
			draw.TextShadow({
				text = "×",
				pos = {w / 2, h / 2},
				font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER,
				color = pax.B_Hover and Color(255, 0, 0) or Color(255, 255, 255)
			}, 2, 255)
		end

		function pax:DoClick()
			pan:Close()
		end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end
	local icos = { "box", "coins", "basket", "wrench", "camera", "script", "arrow_refresh" }
	for i = 1, 7 do -- Interaction buttons
		local but = vgui.Create( "DButton", pan )  but:SetText( "" )  but.B_Hover = false  but.N_Lerp = 0
		but:SetSize(472, 36)
		but:SetPos(14, 12 + 40 * i)
		but:SetIcon("icon16/" .. icos[i] .. ".png")
		but.N_Clicked = 0
		function but:Paint(w, h)
			local col = Color(100, 100, 100) -- FIXME: "col" shadows existing binding!
			but.N_Lerp = Lerp( 0.2, but.N_Lerp, but.N_Clicked > CurTime() and -1 or ( but.B_Hover and 1 or 0 ) )
			col = Color(col.r + col.r * 0.5 * but.N_Lerp, col.g + col.g * 0.5 * but.N_Lerp, col.b + col.b * 0.5 * but.N_Lerp)
			surface.SetDrawColor( col ) surface.DrawRect( 0, 0, w, h )
			draw.TextShadow({
				text = "#xdefm.NPC" .. i,
				pos = {36, h / 2},
				font = "xdefm_Font5",
				color = Color(255, 255, 255),
				xalign = TEXT_ALIGN_LEFT,
				yalign = TEXT_ALIGN_CENTER
			}, 1, 200)
			surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 1 ) end
		function but:OnCursorEntered() but.B_Hover = true end
		function but:OnCursorExited() but.B_Hover = false end
		function but:DoClick() if but.N_Clicked > CurTime() then return end
			surface.PlaySound("buttons/lightswitch2.wav")
			but.N_Clicked = CurTime() + 0.3
			xdefm_Command( LocalPlayer(), "NPC", tostring( i ) )
		end end
	function pan:XDEFM_Update( id, dt ) if id == 0 then pan.T_Data = dt end end
elseif typ == 4 then -- Structure menu
	if IsValid( xdefmod.util.menus[ "Struct" ] ) then return end  local MaR = Material( "gui/gradient" )
	local pan = vgui.Create( "DFrame" )  xdefmod.util.menus.Struct = pan  pan.T_Data = ply.xdefm_Profile  pan.S_Recipe = "_"
	pan:SetPos( ScrW() / 2 -40, ScrH() / 2 - 550 / 2 ) pan:SetSize( 600, 550 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW() / 2 -40, ScrH() / 2 - 500 / 2, 0.2 ) pan.S_Struct = "_"  pan.N_Num = -1  pan.N_Max = -1  pan.N_SType = 0
	function pan:Paint( w, h )
		surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated(w / 2, h / 2, w, h, 0)
		surface.DrawTexturedRectRotated(w / 2, h / 2, w, h, 180)
		surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		local rec, col = "xdefm.Struct", Color(200, 200, 200) -- FIXME: "col" shadows existing binding!
		if isstring( pan.S_Struct ) and pan.S_Struct ~= "_" then
			local aa, bb = xdefm_ItemGet( pan.S_Struct )
			if istable( aa ) and istable( bb ) then
				rec = bb.Name
				col = xdefmod.util.RARITY_COLORS[bb.Rarity + 1]
				local nam = language.GetPhrase( "xdefm.ST" .. pan.N_SType )
				if pan.N_Num ~= -1 then nam = nam .. ( pan.N_Max ~= -1 and " ( " .. pan.N_Num .. " / " .. pan.N_Max .. " )" or " ( " .. pan.N_Num .. " )" ) end
				draw.TextShadow({
					text = nam,
					pos = {w / 2, 52},
					font = "xdefm_Font7",
					xalign = TEXT_ALIGN_CENTER,
					yalign = TEXT_ALIGN_CENTER,
					color = Color(128, 128, 128)
				}, 1, 255)
			end
		end
		draw.TextShadow({
			text = language.GetPhrase(rec),
			pos = {w / 2, 25},
			font = "xdefm_Font6",
			xalign = TEXT_ALIGN_CENTER,
			yalign = TEXT_ALIGN_CENTER,
			color = col
		}, 1, 255)
	end
	function pan:OnRemove() xdefm_Command( LocalPlayer(), "StructExit", "_" ) xdefmod.util.lc = false end
	if true then -- Structure panel
		pan.P_Base = pan:Add("DPanel")
		local pax = pan.P_Base -- FIXME: "pax" shadows existing binding!
		pax.N_Type = 0
		pan.T_Slots = {}
		pax:SetPos( 8, 70 ) pax:SetSize( 582, 470 ) function pax:Paint( w, h ) end
		function pax:Paint( w, h )
			surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawRect( 0, 0, w, h )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h )
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
	if true then -- Close button
		pan.P_Close = pan:Add("DButton")
		local pax = pan.P_Close -- FIXME: "pax" shadows existing binding!
		pax:SetText( "" ) pax:SetPos( 560, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint(w, h)
			draw.TextShadow({
				text = "×",
				pos = {w / 2, h / 2},
				font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER,
				color = pax.B_Hover and Color(255, 0, 0) or Color(255, 255, 255)
			}, 2, 255)
		end

		function pax:DoClick()
			pan:Close()
		end
		function pax:OnCursorEntered() pax.B_Hover = true end
		function pax:OnCursorExited() pax.B_Hover = false end
	end --
	function pan:XDEFM_Update( id, dt ) if id == 0 then pan.T_Data = dt end
		if id == 3 then if not istable( dt ) or not istable( pan.T_Items ) or pan.N_SType ~= 1 then return end
			for k, v in pairs( dt ) do
				if isnumber( k ) and pan.T_Items[ k ] and pan.T_Slots[ k ] then
					if pan.T_Items[ k ] == "_" and v ~= "_" then pan.N_Num = pan.N_Num + 1
					elseif pan.T_Items[ k ] ~= "_" and v == "_" then pan.N_Num = pan.N_Num -1 end
					pan.T_Items[ k ] = v  pan.T_Slots[ k ]:F_SetupItem( v )
				end
			end
		elseif id == 2 then if not istable( dt ) or #dt < 1 then return end
			local str = dt[1] -- FIXME: "str" shadows existing binding!
			local aa, bb = xdefm_ItemGet( str )
			if istable( aa ) and istable( bb ) and bb.Type == "Struct" then
				pan.S_Struct = str
				local stp = bb.SType
				local pax = pan.P_Base -- FIXME: "pax" shadows existing binding!
				pan.N_SType = stp
				if stp == 1 then table.remove( dt, 1 )  pan.T_Slots = {}  pan.N_Max = 0  pan.N_Num = 0  pan.T_Items = {}
					for k, v in pairs( dt ) do
						local slo = xdefm_SlotBox( 0, 0, 94, 94, k, tostring( k ) )  pax.P_Hold:Add( slo )
						pan.T_Slots[ k ] = slo  slo.S_Type = "Storage"  slo:F_SetupItem( v )  pan.N_Max = pan.N_Max + 1
						if v ~= "_" then pan.N_Num = pan.N_Num + 1 end  pan.T_Items[ k ] = v
						function slo:DoRightClick( Pnl ) if slo.T_Item == nil or slo:IsDragging() or not IsValid( xdefmod.util.menus[ "Inventory" ] ) then return end
							if IsValid( pan.P_DMenu ) then pan.P_DMenu:Remove() end pan.P_DMenu = DermaMenu( false, nil )  local dnm = pan.P_DMenu
							local O_Take = dnm:AddOption( "#xdefm.Take", function() if not slo.B_OnMove and IsValid( xdefmod.util.menus[ "Inventory" ] ) then
							local num = 0
							for k, v in pairs(LocalPlayer().xdefm_Profile.Items) do -- FIXME: "k" and "v" shadow existing bindings!
								if isstring(v) and v == "_" then
									num = k
									break
								end
							end if num > 0 then xdefm_Command( LocalPlayer(), "Struct", num .. "|" .. k )
							else xdefm_AddNote( ply, "xdefm.FullInv", "resource/warning.wav", "cross", 5 ) end end end )
							O_Take:SetIcon( "icon16/basket_put.png" ) dnm:Open()
						end
					end
				elseif stp == 2 then pan.N_Num = 0
					local function xdefm_AddCraft(tab) -- FIXME: "tab" shadows existing binding!
						pan.N_Num = pan.N_Num + 1
					local cc = string.Explode( "&", tab ) if not istable( cc ) or #cc < 2 then return end
					local slo = vgui.Create( "DButton", pax.P_Hold ) slo:SetSize( 50, 80 ) slo:Dock( TOP ) slo:SetText( "" ) slo:SetCursor( "blank" )
					local aa, bb = xdefm_ItemGet(cc[#cc]) -- FIXME: "aa" and "bb" shadow existing bindings!
					if not istable( aa ) or not istable( bb ) then slo:Remove() return end
					local col = xdefmod.util.RARITY_COLORS[bb.Rarity + 1] -- FIXME: "col" shadows existing binding!
					local icc = xdefmod.util.ITEM_ICONS[ bb.Type ]  slo.S_Item = cc[ #cc ]
					slo.B_Hover = false  slo.N_Num = pan.N_Num  slo.N_Clk = 0  slo.N_Lerp = 0 if icc ~= nil then
					pax.P_Sprite = vgui.Create( "DPanel", slo ) local spr = pax.P_Sprite
					spr:SetPos( 79, 23 ) spr:SetSize( 16, 16 ) spr:SetMouseInputEnabled( false )
					function spr:Paint( w, h ) surface.SetMaterial( icc )
						surface.SetDrawColor( Color( 255, 255, 255, 255 ) ) surface.DrawTexturedRect( 0, 0, w, h )
					end end slo.T_Craft = cc function slo:Paint( w, h )
					local coc = slo.B_Hover and 0.4 or 0.2
					local co2 = Color(col.r * coc, col.g * coc, col.b * coc)
					slo.N_Lerp = Lerp( 0.1, slo.N_Lerp, ( slo.N_Clk <= CurTime() and slo.B_Hover ) and 0 or 1 )
					local co3 = Color(col.r * coc * 2, col.g * coc * 2, col.b * coc * 2, 55 + slo.N_Lerp * 100)
					draw.RoundedBox(0, 2 + 3, 2, w - 1 - 8, h - 2, co2)
					surface.SetDrawColor(co3)
					surface.SetMaterial(MaR)
					surface.DrawTexturedRect(2 + 5, 2, w - 5 - 8, h - 2 - 2)
					surface.SetDrawColor(xdefmod.COLOR_BORDER)
					surface.DrawOutlinedRect(2 + 3, 2, w - 1 - 8, h - 2, 2)
					surface.SetDrawColor(xdefmod.COLOR_LINE)
					surface.DrawOutlinedRect(2 + 3, 2, w - 1 - 8, h - 2)
					draw.TextShadow( { text = bb.Name, pos = { 102, 30 }, font = "xdefm_Font5",
					xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = col }, 1, 255 )
					draw.TextShadow( { text = language.GetPhrase( "xdefm.Materials" ) .. ": " .. tostring( #cc -1 ),
					pos = { 80, 60 }, font = "xdefm_Font1", xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
					draw.TextShadow( { text = "#" .. slo.N_Num,
					pos = { 540, 40 }, font = "xdefm_Font4", xalign = TEXT_ALIGN_RIGHT, yalign = TEXT_ALIGN_CENTER, color = Color( 200, 200, 200 ) }, 1, 255 ) end
					function slo:OnCursorEntered() slo.B_Hover = true  xdefmod.util.craft = cc  pan.P_Select = slo  xdefmod.util.aim_pan = slo
					xdefmod.util.ings = {}  xdefmod.util.ing2 = {}  xdefmod.util.marker = slo.S_Item  xdefmod.util.lc = true end
					function slo:OnCursorExited() slo.B_Hover = false  if xdefmod.util.aim_pan == slo then xdefmod.util.aim_pan = nil end
					if pan.P_Select == slo then xdefmod.util.marker = nil
					pan.P_Select = nil  xdefmod.util.marker = nil end end
					function slo:DoClick() if slo.N_Clk > CurTime() then return end slo.N_Clk = CurTime() + 0.25
					xdefm_Command( LocalPlayer(), "Struct", tostring( slo.N_Num ) ) end
					local ico = xdefm_SlotBox( 13, 11, 60, 60, 1 ) slo:Add( ico ) ico:F_SetupItem( cc[ #cc ] )
					ico.P_Txt:Remove() ico:SetMouseInputEnabled( false )
					end for k, v in pairs( bb.Crafts ) do xdefm_AddCraft( v ) end
				elseif stp == 3 then pan.N_Num = 0  local MaX = Material( "gui/center_gradient" )
					for k, v in SortedPairsByMemberValue( bb.Shop, 1 ) do
						local Item = pax.P_Hold:Add( "DButton" ) Item:SetSize( 286, 75 ) Item.N_Clicked = 0  Item:SetCursor( "blank" )
						local aa, bb = xdefm_ItemGet(k) -- FIXME: "aa" and "bb" shadow existing bindings!
						if not istable(bb) then
							Item:Remove()
							return
						end

						Item.N_Lerp = 0.3
						pan.N_Num = pan.N_Num + 1
						Item.S_Name = bb.Name  Item.N_Rarity = bb.Rarity  Item.N_Cost = v[ 1 ]  Item.N_Level = v[ 2 ]
						function Item:OnCursorEntered() xdefmod.util.aim_pan = Item  xdefmod.util.marker = k  Item.B_OnMove = true  xdefmod.util.lc = false end
						function Item:OnCursorExited() if xdefmod.util.aim_pan == Item then xdefmod.util.aim_pan = nil  xdefmod.util.marker = nil end Item.B_OnMove = false end
						function Item:DoClick()
							Item.N_Clicked = CurTime() + 0.2
							local yes = true -- FIXME: "yes" shadows existing binding!
							local pro = LocalPlayer().xdefm_Profile
							if pro.Money < Item.N_Cost then xdefm_AddNote( ply, "xdefm.NoMoney", "resource/warning.wav", "cross", 5 ) yes = false end
							if pro.Level < Item.N_Level then xdefm_AddNote( ply, "xdefm.NoLevel", "resource/warning.wav", "cross", 5 ) yes = false end
							if yes then xdefm_Command( LocalPlayer(), "Struct", k ) end end
						function Item:OnRemove() Item:OnCursorExited() end
						function Item:Paint(w, h)
							local col = xdefmod.util.RARITY_COLORS[Item.N_Rarity + 1] -- FIXME: "col" shadows existing binding!
							draw.RoundedBox( 0, 0, 0, w, h, col )  local pro = LocalPlayer().xdefm_Profile  if not istable( pro ) then return end
							Item.N_Lerp = Lerp( 0.2, Item.N_Lerp, Item.N_Clicked > CurTime() and 0.1 or ( xdefmod.util.aim_pan == Item and 0.5 or 0.3 ) )
							local ccc = Item.N_Lerp
							draw.RoundedBox(0, 1, 1, w - 2, h - 2, Color(col.r * ccc, col.g * ccc, col.b * ccc))
							surface.SetMaterial(MaX)
							surface.SetDrawColor(col.r * ccc * 1.5, col.g * ccc * 1.5, col.b * ccc * 1.5)
							surface.DrawTexturedRect(1, 1, w - 2, h - 2)
							local co1, co2 = Color( 255, 0, 0 ), Color( 0, 255, 0 )
							draw.TextShadow( {
								text = language.GetPhrase( Item.S_Name ), pos = { 75, 15 }, font = "xdefm_Font2",
								xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = col
							}, 1, 255 )
							draw.TextShadow( {
								text = language.GetPhrase( "xdefm.Price" ) .. ": " .. Item.N_Cost, pos = { 75, 35 }, font = "xdefm_Font2",
								xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = pro.Money >= Item.N_Cost and co2 or co1
							}, 1, 255 )
							draw.TextShadow( {
								text = language.GetPhrase( "xdefm.Level" ) .. ": " .. Item.N_Level, pos = { 75, 55 }, font = "xdefm_Font2",
								xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = pro.Level >= Item.N_Level and co2 or co1
							}, 1, 255 ) end
						Item.P_Frame = Item:Add( "DPanel" )  Item:SetText( "" )
						Item.P_Frame:SetSize( 64, 64 ) Item.P_Frame:SetPos( 6, 6 )
						Item.P_Frame:SetMouseInputEnabled(false)
						function Item.P_Frame:Paint(w, h)
							local col = xdefmod.util.RARITY_COLORS[Item.N_Rarity + 1] -- FIXME: "col" shadows existing binding!
							surface.SetDrawColor(Color(col.r * 0.2, col.g * 0.2, col.b * 0.2))
							surface.DrawRect(0, 0, w, h)
							surface.SetDrawColor(col)
							surface.DrawOutlinedRect(0, 0, w, h, 2)
							surface.SetDrawColor(xdefmod.COLOR_LINE)
							surface.DrawOutlinedRect(0, 0, w, h, 1)
						end
						Item.P_Icon = Item.P_Frame:Add( "ModelImage" ) Item.P_Icon:DockMargin( 5, 5, 5, 5 )
						Item.P_Icon:Dock( FILL ) Item.P_Icon:SetModel( bb.Model[ 1 ] ) Item.P_Icon:SetMouseInputEnabled( false )
					end
				end
			end
		end
	end
	pan:XDEFM_Update( 2, tab )
elseif typ == 5 then -- Bank menu
	if IsValid( xdefmod.util.menus[ "Bank" ] ) then return end
	local pan = vgui.Create( "DFrame" )  xdefmod.util.menus.Bank = pan  pan.T_Data = tab  pan.T_Slots = {}  pan.N_Store = 0
	pan:SetPos( ScrW() / 2 - 40, ScrH() / 2 - 550 / 2 ) pan:SetSize( 800, 600 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:ParentToHUD() pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW() / 2 - 40, ScrH() / 2 - 500 / 2, 0.2 )
	function pan:Paint( w, h )
		local tab = pan.T_Data -- FIXME: "tab" shadows existing binding!
		local pro = LocalPlayer().xdefm_Profile
		surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated( w / 2, h / 2, w, h, 0 )
		surface.DrawTexturedRectRotated( w / 2, h / 2, w, h, 180 )
		surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.TextShadow( {
			text = language.GetPhrase( "xdefm.Bank" ) .. " ( " .. pan.N_Store .. " / " .. pro.UpdF .. " )", pos = { w/2, 25 }, font = "xdefm_Font6",
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 )
		}, 1, 255 ) end
	if true then -- Close button
		pan.P_Close = pan:Add( "DButton" )
		local pax = pan.P_Close -- FIXME: "pax" shadows existing binding!
		pax:SetText( "" ) pax:SetPos( 760, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint(w, h)
			draw.TextShadow({
				text = "×",
				pos = {w / 2, h / 2},
				font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER,
				color = pax.B_Hover and Color(255, 0, 0) or Color(255, 255, 255)
			}, 2, 255)
		end

		function pax:DoClick()
			pan:Close()
		end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end --
	if true then -- Bank inventory panel
		local bck = pan:Add( "DPanel" ) bck:SetSize( 784, 541 ) bck:SetPos( 8, 50 )
		pan.P_Scroll = pan:Add( "DScrollPanel" )
		pan.P_Scroll:SetSize( 784, 534 ) pan.P_Scroll:SetPos( 9, 53 )  pan.N_Sto = 0
		local vba = pan.P_Scroll:GetVBar()  vba:SetHideButtons( true )  vba:SetSize( 0, 0 )
		function vba.btnGrip:Paint( w, h ) end function vba:Paint( w, h ) end
		function pan.P_Scroll:Paint( w, h ) end
		function bck:Paint( w, h )
			surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawRect( 0, 0, w, h )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h )
		end pan.P_Hold = pan.P_Scroll:Add( "DIconLayout" )  local pa2 = pan.P_Hold  pa2:SetSize( 784, 0 )
		pa2:DockMargin( 4, 4, 4, 4 ) pa2:SetSpaceX( 3 ) pa2:SetSpaceY( 3 ) pa2:SetPos( 4, 2 ) function pa2:Paint( w, h ) end end
	function pan:XDEFM_Update( id, dt ) if id == 0 then local pro = dt  pan.N_Store = 0
			for k, v in pairs( pan.T_Slots ) do
				if IsValid( v ) and k > pro.UpdF then v:Remove() pan.T_Slots[ k ] = nil end
			end if pro.UpdF <= 0 then pan.T_Slots = {} return end
			for i = 1, pro.UpdF do
				local ite = pro.Bnk[ i ]
				if isstring( ite ) then
					local slo = nil  if IsValid( pan.T_Slots[ i ] ) then slo = pan.T_Slots[ i ] else
						slo = xdefm_SlotBox( 0, 0, 108, 108, i, tostring( i ) )  pan.P_Hold:Add( slo )
						pan.T_Slots[ i ] = slo  slo.S_Type = "Bank"
					end slo:F_SetupItem( ite )  if ite ~= "_" then pan.N_Store = pan.N_Store + 1 end
					function slo:DoRightClick( Pnl ) if slo.T_Item == nil or slo:IsDragging() or not IsValid( xdefmod.util.menus[ "Inventory" ] ) then return end
						if IsValid( pan.P_DMenu ) then pan.P_DMenu:Remove() end pan.P_DMenu = DermaMenu( false, nil )  local dnm = pan.P_DMenu
						local O_Take = dnm:AddOption( "#xdefm.Take", function() if not slo.B_OnMove and IsValid( xdefmod.util.menus[ "Inventory" ] ) then
						local num = 0  for k, v in pairs( LocalPlayer().xdefm_Profile.Items ) do
							if isstring( v ) and v == "_" then num = k break end
						end if num > 0 then xdefm_Command( LocalPlayer(), "MoveBank", num .. "|" .. i )
						else xdefm_AddNote( ply, "xdefm.FullInv", "resource/warning.wav", "cross", 5 ) end end end )
						O_Take:SetIcon( "icon16/basket_put.png" ) dnm:Open()
					end
				end
			end
		end
	end pan:XDEFM_Update( 0, LocalPlayer().xdefm_Profile )
elseif typ == 6 then -- Friends menu
	if IsValid( xdefmod.util.menus[ "Friends" ] ) then return end
	local pan = vgui.Create("DFrame")
	xdefmod.util.menus.Friends = pan
	pan.T_Data = tab
	pan.N_Count = 0
	pan.B_Edited = false
	pan:SetPos(ScrW() / 2 - 200, ScrH() / 2 - 550 / 2)
	pan:SetSize(400, 550)
	pan:ShowCloseButton(false)
	pan:SetAnimationEnabled(false)
	pan:SetVisible(true)
	pan:SetScreenLock(true)
	pan:SetDraggable(true)
	pan:SetTitle("")
	pan:ParentToHUD()
	pan:SetAlpha(255)
	pan:MakePopup()
	pan:MoveTo(ScrW() / 2 - 200, ScrH() / 2 - 500 / 2, 0.2)
	pan.N_Clicked = 0
	function pan:Paint(w, h)
		local tab = pan.T_Data -- FIXME: "tab" shadows existing binding!
		surface.SetDrawColor(xdefmod.COLOR_BACKGROUND)
		surface.DrawRect(0, 0, w, h)
		surface.SetMaterial(Zom)
		surface.SetDrawColor(0, 0, 0, 96)
		surface.DrawTexturedRectRotated(w / 2, h / 2, w, h, 0)
		surface.DrawTexturedRectRotated(w / 2, h / 2, w, h, 180)
		surface.SetDrawColor(xdefmod.COLOR_BORDER)
		surface.DrawOutlinedRect(0, 0, w, h, 2)
		surface.SetDrawColor(xdefmod.COLOR_LINE)
		surface.DrawOutlinedRect(0, 0, w, h, 1)
		draw.TextShadow({
			text = language.GetPhrase("xdefm.FList"),
			font = "xdefm_Font6",
			pos = {w / 2, 24},
			xalign = TEXT_ALIGN_CENTER,
			yalign = TEXT_ALIGN_CENTER,
			color = Color(255, 255, 255)
		}, 1, 255)

		draw.RoundedBox(0, 8 + 0, 50 + 0, 382, 420, xdefmod.COLOR_LINE)
		draw.RoundedBox(0, 8 + 1, 50 + 1, 382 - 2, 420 - 2, xdefmod.COLOR_BORDER)
		draw.RoundedBox(0, 8 + 2, 50 + 2, 382 - 4, 420 - 4, xdefmod.COLOR_BACKGROUND)
		draw.RoundedBox(0, 8 + 0, 474 + 0, 382, 30, xdefmod.COLOR_LINE)
		draw.RoundedBox(0, 8 + 1, 474 + 1, 382 - 2, 30 - 2, xdefmod.COLOR_BORDER)
		draw.RoundedBox(0, 8 + 2, 474 + 2, 382 - 4, 30 - 4, xdefmod.COLOR_BACKGROUND)
	end
	if true then -- Close button
		pan.P_Close = pan:Add("DButton")

		local pax = pan.P_Close -- FIXME: "pax" shadows existing binding!

		pax:SetText("")
		pax:SetPos(360, 8)
		pax:SetSize(32, 32)
		pax.B_Hover = false
		pax:SetTooltip("#xdefm.Close")

		function pax:Paint(w, h)
			draw.TextShadow({
				text = "×",
				pos = {w / 2, h / 2},
				font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER,
				color = pax.B_Hover and Color(255, 0, 0) or Color(255, 255, 255)
			}, 2, 255)
		end

		function pax:DoClick()
			pan:Close()
		end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end --
	if true then -- Friend list
		pan.P_List = vgui.Create( "DListView", pan )
		pan.P_List:SetPos( 11, 53 ) pan.P_List:SetSize( 376, 414 )
		pan.P_List:SetMultiSelect( false )
		local p1 = pan.P_List:AddColumn( language.GetPhrase( "xdefm.Player" ) )
		--local p2 = pan.P_List:AddColumn(language.GetPhrase("xdefm.Friend")) -- REVIEW: Unused?
		p1:SetWidth( 180 )
		function pan.P_List:RefreshPlayerS() pan.P_List:Clear()
			for k, v in pairs( pan.T_Data ) do if not isnumber( tonumber( v[ 2 ] ) ) then return end
				--local aa = false -- REVIEW: Unused?
				local cc = tonumber(v[2])
				local dd = player.GetBySteamID(k)
				local nn = k
				if IsValid( dd ) and dd:IsPlayer() then nn = dd:Nick() else nn = v[ 1 ] end
				local ee = ( cc > 0 and language.GetPhrase( "xdefm.Allow" ) or language.GetPhrase( "xdefm.Disallow" ) )
				local pnl = pan.P_List:AddLine( nn, ee )  pnl.N_RightStat = cc  pnl.S_SteamID = k  pnl.S_Name = nn
				pnl:SetToolTip(k) -- DEPRECATED: Use :SetTooltip instead, notice the lowercase t
				pan.N_Count = pan.N_Count + 1
			end
		end
		function pan.P_List:OnRowSelected( id, pnl ) local stt = pnl.N_RightStat  pan.P_List:ClearSelection()
			if IsValid( pan.P_DMenu ) then pan.P_DMenu:Remove() end pan.P_DMenu = DermaMenu( false, nil )  local dnm = pan.P_DMenu
			local aa = stt > 0 and true or false
			local O_ = dnm:AddOption(pnl.S_Name, function() -- REVIEW: Unused?
				xdefm_AddNote(ply, "xdefm.CopiedID", "weapons/pistol/pistol_empty.wav", "tick", 5)
				SetClipboardText(pnl:GetTooltip())
			end)
			local O_aa = dnm:AddOption( language.GetPhrase( aa and "xdefm.Disallow" or "xdefm.Allow" ) .. " " .. language.GetPhrase( "xdefm.Friend" ), function()
				if not IsValid( pan ) or not istable( pan.T_Data ) then return end
				if not IsValid(pnl) or not istable(pan.T_Data[pnl.S_SteamID]) or not isnumber(pnl.N_RightStat) then return end
				local stt = math.Clamp(math.Round(pnl.N_RightStat), 0, 1) -- FIXME: "stt" shadows existing binding!
				if aa then if stt > 0 then pnl.N_RightStat = 0 end else if stt == 0 then pnl.N_RightStat = 1 end end
				pnl:SetColumnText( 2, language.GetPhrase( aa and "xdefm.Disallow" or "xdefm.Allow" ) )  pan.B_Edited = true
				pan.T_Data[ pnl.S_SteamID ][ 2 ] = pnl.N_RightStat
			end )
			O_aa:SetIcon( aa and "icon16/cross.png" or "icon16/tick.png" )
			local O_cc = dnm:AddOption( language.GetPhrase( "xdefm.Delete" ), function()
				if not IsValid( pan ) or not istable( pan.T_Data ) then return end
				if not IsValid( pnl ) or not istable( pan.T_Data[ pnl.S_SteamID ] ) or not isnumber( pnl.N_RightStat ) then return end
				pan.T_Data[ pnl.S_SteamID ] = nil  pan.P_List:RemoveLine( id ) pan.B_Edited = true
			end )
			O_cc:SetIcon( "icon16/group_delete.png" ) dnm:Open()
		end
		pan.P_List:RefreshPlayerS() end
	if true then -- Add friend
		pan.P_Entry = vgui.Create( "DTextEntry", pan )
		pan.P_Entry:SetSize( 376, 24 ) pan.P_Entry:SetPos( 11, 477 )
		pan.P_Entry:SetUpdateOnType( true ) pan.P_Entry:SetNumeric( false ) pan.P_Entry:SetMultiline( false )
		pan.P_Entry:SetTextColor( Color( 0, 0, 0 ) ) pan.P_Entry.S_Enter = ""
		pan.P_Entry:SetPlaceholderText( "#xdefm.FriendAdd" )
		function pan.P_Entry:FindTheFriend()
			local ply = nil -- FIXME: "ply" shadows existing binding!
			local str = pan.P_Entry.S_Enter -- FIXME: "str" shadows existing binding!
			if pan.N_Count >= 16 then xdefm_AddNote( ply, "xdefm.FriendAd5", "resource/warning.wav", "cross", 5 ) return end
			if str == "" then xdefm_AddNote( ply, "xdefm.FriendAd3", "resource/warning.wav", "cross", 5 ) return end
			for k, v in pairs( player.GetAll() ) do
				if IsValid( v ) and not v:IsBot() and v ~= LocalPlayer() and not istable( pan.T_Data[ v:SteamID() ] ) then
					if v:SteamID() == str then ply = v break end
					local st, ed = string.find( string.lower( v:Nick() ), string.lower( str ) )
					if st then ply = v break end
				end
			end
			if not IsValid( ply ) then xdefm_AddNote( ply, "xdefm.FriendAd3", "resource/warning.wav", "cross", 5 ) return end
			local pnl = pan.P_List:AddLine( ply:Nick(), language.GetPhrase( "xdefm.Disallow" ), language.GetPhrase( "xdefm.Disallow" ) )  pnl.N_RightStat = 0
			pnl.S_SteamID = ply:SteamID()
			pnl.S_Name = ply:Nick()
			pnl:SetToolTip(ply:SteamID()) -- DEPRECATED: Use :SetTooltip instead, notice the lowercase t
			xdefm_AddNote( ply, language.GetPhrase( "xdefm.FriendAd4" ) .. ": " .. ply:Nick(), "buttons/button15.wav", "group_add", 5 ) pnl.S_SteamID = ply:SteamID()
			pan.N_Count = pan.N_Count + 1
			pan.T_Data[ply:SteamID()] = {ply:Nick(), 0}
			pan.P_Entry.S_Enter = ""  pan.P_Entry:SetText( "" )  pan.B_Edited = true
		end
		function pan.P_Entry:OnEnter() pan.P_Entry.FindTheFriend() end
		function pan.P_Entry:OnValueChange( val ) if string.len( val ) >= 64 then
			pan.P_Entry:SetText( pan.P_Entry.S_Enter ) surface.PlaySound( "resource/warning.wav" )
			else pan.P_Entry.S_Enter = val end
		end
		pan.P_Search = vgui.Create("DImageButton", pan.P_Entry)
		local pax = pan.P_Search -- FIXME: "pax" shadows existing binding!
		pax:SetImage("icon16/add.png")
		pax:SetToolTip("#xdefm.FriendAd2") -- DEPRECATED: Use :SetTooltip instead, notice the lowercase t
		pax:SetPos( 356, 4 ) pax:SetSize( 16, 16 ) end function pan.P_Search:DoClick() pan.P_Entry.FindTheFriend() end
	for i = 1, 2 do -- Reset / Confirm buttons
		local but = vgui.Create( "DButton", pan )  but:SetText( "" )  but.B_Hover = false  but.N_Lerp = 0
		but:SetSize( 120, 30 )  but:SetPos( -100 + i * 160, 510 ) but:SetIcon( i == 1 and "icon16/group_go.png" or "icon16/group_edit.png" )
		function but:Paint(w, h)
			local col = Color(100, 100, 100) -- FIXME: "col" shadows existing binding!
			but.N_Lerp = Lerp( 0.2, but.N_Lerp, pan.N_Clicked > CurTime() and -1 or ( but.B_Hover and 1 or 0 ) )
			if pan.B_Edited then col = Color( 155, 0, 0 ) end
			col = Color(col.r + col.r * 0.5 * but.N_Lerp, col.g + col.g * 0.5 * but.N_Lerp, col.b + col.b * 0.5 * but.N_Lerp)
			surface.SetDrawColor( col ) surface.DrawRect( 0, 0, w, h )
			draw.TextShadow({
				text = i == 1 and "#xdefm.Reset" or "#xdefm.Apply",
				pos = {w / 2, h / 2},
				font = "xdefm_Font1",
				color = Color(255, 255, 255),
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER
			}, 1, 200)
			surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		end
		function but:OnCursorEntered() but.B_Hover = true end
		function but:OnCursorExited() but.B_Hover = false end
		function but:DoClick() if pan.N_Clicked > CurTime() then return end
			pan.N_Clicked = CurTime() + 1
			pan.B_Edited = false
			local str = util.TableToJSON(pan.T_Data, true) -- FIXME: "str" shadows existing binding!
			net.Start( "NET_xdefm_SendFriends" ) if i == 2 then net.WriteString( str ) end net.SendToServer()
		end
	end
	function pan:XDEFM_Update( id, dt ) if id == 2 then pan.T_Data = dt  pan.P_List:RefreshPlayerS() end end
elseif typ == 7 then -- Trade menu
	if IsValid( xdefmod.util.menus[ "Trade" ] ) then return end
	local pan = vgui.Create( "DFrame" )  xdefmod.util.menus.Trade = pan
	pan.T_PlyA = { LocalPlayer():Nick(), LocalPlayer():SteamID64(), LocalPlayer():GetNWFloat( "XDEFMod_RTT" ) }
	pan.T_PlyB = { "_", nil, false }  pan.T_Slo1 = {}  pan.T_Slo2 = {}
	pan.T_TabA = tab  pan.T_TabB = { "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", 0 }
	pan:SetPos( ScrW() / 2 - 40, ScrH() / 2 - 750 / 2 ) pan:SetSize( 500, 685 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:ParentToHUD() pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW() / 2 - 40, ScrH() / 2 - 700 / 2, 0.2 )
	if true then -- Close button
		pan.P_Close = pan:Add( "DButton" )
		local pax = pan.P_Close -- FIXME: "pax" shadows existing binding!
		pax:SetText( "" ) pax:SetPos( 455, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint(w, h)
			draw.TextShadow({
				text = "×",
				pos = {w / 2, h / 2},
				font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER,
				color = pax.B_Hover and Color(255, 0, 0) or Color(255, 255, 255)
			}, 2, 255)
		end

		function pax:DoClick()
			pan:Close()
		end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end --
	function pan:Paint(w, h)
		--local tab = pan.T_Data -- REVIEW: Unused?
		--local pro = LocalPlayer().xdefm_Profile -- REVIEW: Unused?
		surface.SetDrawColor(xdefmod.COLOR_BACKGROUND)
		surface.DrawRect(0, 0, w, h)
		surface.SetMaterial(Zom)
		surface.SetDrawColor(0, 0, 0, 96)
		surface.DrawTexturedRectRotated(w / 2, h / 2, w, h, 0)
		surface.DrawTexturedRectRotated(w / 2, h / 2, w, h, 180)
		surface.SetDrawColor(xdefmod.COLOR_BORDER)
		surface.DrawOutlinedRect(0, 0, w, h, 2)
		surface.SetDrawColor(xdefmod.COLOR_LINE)
		surface.DrawOutlinedRect(0, 0, w, h, 1)
		draw.TextShadow({
			text = language.GetPhrase("xdefm.Weapon_Trade"),
			pos = {w / 2, 25},
			font = "xdefm_Font6",
			xalign = TEXT_ALIGN_CENTER,
			yalign = TEXT_ALIGN_CENTER,
			color = Color(255, 255, 255)
		}, 1, 255)
	end
	for i = 1, 2 do -- Own / Other side panel
		local pax = vgui.Create("DPanel", pan) -- FIXME: "pax" shadows existing binding!
		pax:SetPos( 8, 50 + (i - 1) * 315 ) pax:SetSize( 484, 310 ) pax.N_Clicked = 0
		function pax:Paint( w, h )
			--local bb = ( i == 1 and true or false ) -- REVIEW: Unused?
			local tab = i == 1 and pan.T_PlyA or pan.T_PlyB -- FIXME: "tab" shadows existing binding!
			local ta2 = ( i == 1 and pan.T_TabA or pan.T_TabB )
			surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawRect( 0, 0, w, h )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h )
			draw.TextShadow( {
				text = tab[ 1 ], pos = { 80, 24 }, font = "xdefm_Font4",
				xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 )
			}, 1, 255 )
			surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 10, 77, 464, 188, 2 )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 10, 77, 464, 188, 1 )
			draw.TextShadow( {
				text = language.GetPhrase( "xdefm.Money" ) .. ": ", pos = { 8, 285 }, font = "xdefm_Font1",
				xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 )
			}, 1, 255 )
			if IsValid( pax.P_Entry ) and i ~= 2 then
				--local col = pax.P_Entry:IsEditing() and Color(150, 150, 150) or Color(75, 75, 75) -- REVIEW: Unused?
				if not pax.P_Entry:IsEditing() and ta2[ 11 ] ~= pax.P_Entry.N_Enter then col = Color( 150, 25, 25 ) end
				surface.SetDrawColor(Color(xdefmod.COLOR_BACKGROUND.r * 0.5, xdefmod.COLOR_BACKGROUND.g * 0.5, xdefmod.COLOR_BACKGROUND.b * 0.5, xdefmod.COLOR_BACKGROUND.a * 0.5))
				surface.DrawRect(80, 272, 215 + 6, 30)
				surface.SetDrawColor(xdefmod.COLOR_BORDER)
				surface.DrawOutlinedRect(80, 272, 215 + 6, 30, 2)
				surface.SetDrawColor(xdefmod.COLOR_LINE)
				surface.DrawOutlinedRect(80, 272, 215 + 6, 30)
			end
		end
		if true then -- Confirm button
			local but = vgui.Create( "DButton", pax )  but:SetText( "" )  but.B_Hover = false
			but:SetSize( 150, 25 )  but:SetPos( 84, 42 )
			function but:Paint( w, h )
				local col = Color( 100, 100, 100 ) -- FIXME: "col" shadows existing binding!
				local ply = LocalPlayer() -- FIXME: "ply" shadows existing binding!
				if not ply:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() or ply:GetNWEntity( "XDEFMod_TPL" ):GetNWEntity( "XDEFMod_TPL" ) ~= ply then return end
				local rd = false  if i == 1 then rd = ( LocalPlayer():GetNWFloat( "XDEFMod_RTT" ) == 1 )
				elseif i == 2 then rd = ( pan.T_PlyB[ 3 ] == 1 ) end
				col = ( rd and Color( 55, 155, 55 ) or Color( 155, 55, 55 ) )
				if pax.N_Clicked <= CurTime() and but.B_Hover then col = Color( col.r * 1.5, col.g * 1.5, col.b * 1.5 ) end
				if pax.N_Clicked > CurTime() then col = Color( col.r * 0.25, col.g * 0.25, col.b * 0.25 ) end
				surface.SetDrawColor( col ) surface.DrawRect( 0, 0, w, h )
				draw.TextShadow( { text = rd and "#xdefm.ReadyY" or "#xdefm.ReadyN", pos = { w / 2, h / 2 -2 }, font = "xdefm_Font1",
				color = Color( 255, 255, 255 ), xalign = TEXT_ALIGN_CENTER, yalign =  TEXT_ALIGN_CENTER }, 1, 200 )
				if i == 1 then surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
				surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 1 ) end
			end if i == 2 then but:SetMouseInputEnabled( false ) end if i == 1 then pan.P_ButA = but else pan.P_ButB = but end
			function but:OnCursorEntered() but.B_Hover = true end function but:OnCursorExited() but.B_Hover = false end
			function but:DoClick() if pax.N_Clicked > CurTime() then return end
				pax.N_Clicked = CurTime() + 1
				xdefm_Command(LocalPlayer(), "TradeToggle", "_")
			end end
		if true then -- Money amount
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
			local tab = ( i == 1 and pan.T_TabA or pan.T_TabB ) -- FIXME: "tab" shadows existing binding!
			pax.P_Entry.N_Enter = tab[ 11 ]
			pax.P_Entry:SetText( tostring( pax.P_Entry.N_Enter ) )
			pax.P_Entry:SetPlaceholderText( "#xdefm.PutMoney" )
			pax.P_Entry:SetToolTip( tab[ 11 ] ) -- DEPRECATED: Use :SetTooltip instead, notice the lowercase t
			function pax.P_Entry:OnEnter() xdefm_Command( LocalPlayer(), "TradeMoney", tostring( pax.P_Entry.N_Enter ) ) end
			function pax.P_Entry:OnValueChange( val ) local tum, vat, fce = tonumber( val ), 0, false  if val ~= "" and ( not isnumber( tum ) or string.len( val ) >= 64 or tum < 0 or tum > 2147483647 ) then
				if isnumber( tum ) and tum > 2147483647 then vat = 2147483647  fce = true elseif isnumber( tum ) and tum < 0 then vat = 0  fce = true else vat = pax.P_Entry.N_Enter
				pax.P_Entry:SetText( tostring( pax.P_Entry.N_Enter ) ) end surface.PlaySound( "resource/warning.wav" )
				else vat = tum  if val == "" then vat = 0  fce = true end end if pax.P_Entry.N_Enter ~= vat then pax.P_Entry.N_Enter = vat end
				if fce then pax.P_Entry:SetText( tostring( pax.P_Entry.N_Enter ) ) end
			end if i == 2 then pax.P_Entry:SetEnabled( false )  pax.P_Entry:SetMouseInputEnabled( false ) else
				pax.P_Confirm = vgui.Create( "DImageButton", pax.P_Entry ) local pa2 = pax.P_Confirm
				pa2:SetImage("icon16/cog.png")
				pa2:SetToolTip("#xdefm.PutMone2") -- DEPRECATED: Use :SetTooltip instead, notice the lowercase t
				pa2:SetPos( 173, 4 ) pa2:SetSize( 16, 16 ) function pa2:DoClick() xdefm_Command( LocalPlayer(), "TradeMoney", tostring( pax.P_Entry.N_Enter ) ) end
				pax.P_Take = vgui.Create( "DImageButton", pax.P_Entry ) local pa3 = pax.P_Take
				pa3:SetImage("icon16/coins.png")
				pa3:SetToolTip("#xdefm.PutMone3") -- DEPRECATED: Use :SetTooltip instead, notice the lowercase t
				pa3:SetPos( 193, 4 ) pa3:SetSize( 16, 16 ) function pa3:DoClick() xdefm_Command( LocalPlayer(), "TradeMoney", "0" ) end
			end end
		if true then -- Avatar image
			pax.P_AIcon = pax:Add( "AvatarImage" )  local pa2 = pax.P_AIcon
			pa2:SetPos( 8, 8 ) pa2:SetSize( 64, 64 ) pa2:SetMouseInputEnabled( false )
			pax.P_AFrame = pax:Add( "DPanel" )  pa2 = pax.P_AFrame
			local tab = i == 1 and pan.T_PlyA or pan.T_PlyB -- FIXME: "tab" shadows existing binding!
			if tab[ 2 ] ~= nil then pax.P_AIcon:SetSteamID( tab[ 2 ], 128 ) end
			pa2:SetText( "" ) pa2:SetPos( 8, 8 ) pa2:SetSize( 64, 64 ) pa2:SetMouseInputEnabled( false )
			function pa2:Paint( w, h ) surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 1 ) end end
		if true then -- Item panel
			pax.P_Hold = pax:Add( "DIconLayout" )  pax.P_Hold:SetPos( 13, 80 ) pax.P_Hold:SetSize( 484-16, 180 )
			pax.P_Hold:SetSpaceX( 2 ) pax.P_Hold:SetSpaceY( 2 )
			local tab = nil -- FIXME: "tab" shadows existing binding!
			if i == 1 then tab = pan.T_Slo1 else tab = pan.T_Slo2 end
			for x = 1, 10 do local slo = xdefm_SlotBox( 0, 0, 90, 90, x, tostring( x ), nil, i == 2 and true or false )
			if i == 1 then slo.S_Type = "Trade"
				function slo:DoRightClick( Pnl ) if slo.T_Item == nil or slo:IsDragging() or not IsValid( xdefmod.util.menus[ "Inventory" ] ) then return end
					if IsValid( pan.P_DMenu ) then pan.P_DMenu:Remove() end pan.P_DMenu = DermaMenu( false, nil )  local dnm = pan.P_DMenu
					local O_Take = dnm:AddOption( "#xdefm.Take", function() if not slo.B_OnMove and IsValid( xdefmod.util.menus[ "Inventory" ] ) then
					local num = 0  for k, v in pairs( LocalPlayer().xdefm_Profile.Items ) do
						if isstring( v ) and v == "_" then num = k break end
					end if num > 0 then xdefm_Command( LocalPlayer(), "MoveTrade", num .. "|" .. x )
					else xdefm_AddNote( ply, "xdefm.FullInv", "resource/warning.wav", "cross", 5 ) end end end )
					O_Take:SetIcon( "icon16/basket_remove.png" ) dnm:Open()
				end
			end pax.P_Hold:Add( slo ) table.insert( tab, slo ) end end
		if i == 1 then pan.P_PanA = pax else pan.P_PanB = pax end end
	if true then -- Hide bottom panel, while there is no trade partner
		pan.P_NoTrade = vgui.Create("DPanel", pan)
		pan.P_NoTrade:SetPos(8, 365)
		pan.P_NoTrade:SetSize(484, 310)
		function pan.P_NoTrade:Paint(w, h)
			surface.SetDrawColor(Color(xdefmod.COLOR_BACKGROUND.r * 0.5, xdefmod.COLOR_BACKGROUND.g * 0.5, xdefmod.COLOR_BACKGROUND.b * 0.5, 255))
			surface.DrawRect(0, 0, w, h)
			surface.SetDrawColor(xdefmod.COLOR_BORDER)
			surface.DrawOutlinedRect(0, 0, w, h, 2)
			surface.SetDrawColor(xdefmod.COLOR_LINE)
			surface.DrawOutlinedRect(0, 0, w, h)
			draw.TextShadow({
				text = language.GetPhrase("xdefm.Trade17"),
				pos = {w / 2, h / 2},
				font = "xdefm_Font6",
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER,
				color = Color(255, 255, 255)
			}, 1, 255)
		end
	end
	pan.P_NoTrade:SetMouseInputEnabled( true ) pan.P_NoTrade:SetAlpha( 255 )
	pan.P_PanB:SetMouseInputEnabled( false ) pan.P_PanB:SetAlpha( 0 )
	function pan:XDEFM_Update( id, dt )
		if id == 4 then
			pan.T_TabA = dt
			for i = 1, 10 do
				pan.T_Slo1[i]:F_SetupItem(dt[i])
			end

			pan.P_PanA.P_Entry.N_Enter = dt[11]
			pan.P_PanA.P_Entry:SetText(tostring(dt[11]))
			pan.P_PanA.P_Entry:SetToolTip(dt[11]) -- DEPRECATED: Use :SetTooltip instead, notice the lowercase t
		end
		if id == 5 then
			pan.T_TabB = dt
			for i = 1, 10 do
				pan.T_Slo2[i]:F_SetupItem(dt[i])
			end

			pan.P_PanB.P_Entry.N_Enter = dt[11]
			pan.P_PanB.P_Entry:SetText(tostring(dt[11]))
			pan.P_PanB.P_Entry:SetToolTip(dt[11]) -- DEPRECATED: Use :SetTooltip instead, notice the lowercase t
		end
		if id == 6 then pan.T_PlyB = dt  local sid = dt[ 2 ]
			if sid ~= nil then
				pan.P_NoTrade:SetMouseInputEnabled( false ) pan.P_NoTrade:SetAlpha( 0 )
				pan.P_PanB:SetMouseInputEnabled( true ) pan.P_PanB:SetAlpha( 255 )
				pan.P_PanB.P_AIcon:SetSteamID( sid, 128 )
			else pan.P_NoTrade:SetMouseInputEnabled( true ) pan.P_NoTrade:SetAlpha( 255 )
			pan.P_PanB:SetMouseInputEnabled( false ) pan.P_PanB:SetAlpha( 0 ) end
		end
	end pan:XDEFM_Update( 4, tab )
elseif typ == 8 then -- Collection menu
	if IsValid( xdefmod.util.menus[ "Bestiary" ] ) then return end
	local pan = vgui.Create( "DFrame" )  xdefmod.util.menus.Bestiary = pan  pan.T_Items = {}  pan.N_Total = 0  pan.N_All = 0
	for k, v in pairs( xdefmod.items ) do pan.N_All = pan.N_All + 1 end pan.N_Bing = -1
	pan.T_Typs = { ["Creature"] = true, ["Bait"] = true, ["Useless"] = true, ["Recipe"] = true, ["Struct"] = true }
	pan.T_Rars = { true, true, true, true, true }  pan.T_Buts = {}  pan.T_But2 = {}  pan.T_Dats = { PagO = 0, PagT = 0, Num = 0 }
	local Typs = { "Creature", "Bait", "Useless", "Recipe", "Struct" }
	local cvar = string.Explode( "", GetConVar( "xdefmod_collection" ):GetString() )
	if not istable( cvar ) or #cvar ~= 11 then RunConsoleCommand( "xdefmod_collection", "11111111111" )
	else
		for k, v in pairs( cvar ) do
			v = tonumber( v )
			if isnumber( v ) then
				if k <= 5 then pan.T_Typs[ Typs[ k ] ] = ( v ~= 0 )
				elseif k ~= 11 then pan.T_Rars[ k-5 ] = ( v ~= 0 )
				else pan.T_Dats.PagO = v end
			end
		end
	end
	if istable( xdefmod.bestiary ) then for k, v in pairs( xdefmod.bestiary ) do if xdefmod.items[ k ] then table.insert( pan.T_Items, k ) pan.N_Total = pan.N_Total +1 end end end
	pan:SetPos( ScrW() / 2 - 750 / 2, ScrH() / 2 - 700 / 2 ) pan:SetSize( 750, 700 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:ParentToHUD() pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW() / 2 - 750 / 2, ScrH() / 2 - 750 / 2, 0.2 ) pan.B_Hover = false
	if ply:IsSuperAdmin() then pan:SetIcon( "icon16/shield.png" ) end
	local Ma2 = Material( "vgui/gradient_up" )
	if true then -- Close button
		pan.P_Close = pan:Add( "DButton" )
		local pax = pan.P_Close -- FIXME: "pax" shadows existing binding!
		pax:SetText( "" ) pax:SetPos( 710, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint(w, h)
			draw.TextShadow({
				text = "×",
				pos = {w / 2, h / 2},
				font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER,
				color = pax.B_Hover and Color(255, 0, 0) or Color(255, 255, 255)
			}, 2, 255)
		end

		function pax:DoClick()
			pan:Close()
		end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end --
	function pan:Paint( w, h )
		--local pro = LocalPlayer().xdefm_Profile -- Unused?
		surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated( w / 2, h / 2, w, h, 0 )
		surface.DrawTexturedRectRotated( w / 2, h / 2, w, h, 180 )
		surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.RoundedBox( 0, 24 + 0, 45 + 0, -52 + w, 80, xdefmod.COLOR_LINE )
		draw.RoundedBox( 0, 24 + 1, 45 + 1, -52 + w - 2, 80 -2, xdefmod.COLOR_BORDER )
		draw.RoundedBox( 0, 24 + 2, 45 + 2, -52 + w - 4, 80 -4, xdefmod.COLOR_BACKGROUND )
		local per = math.Clamp( pan.N_Total / pan.N_All, 0, 1 )
		local col = Color(0, 155, 200) -- FIXME: "col" shadows existing binding!
		if per >= 1 then col = Color( 200, 155, 0 ) end
		draw.RoundedBox( 0, 8 + 0, 650 + 0, -16 + w, 40, xdefmod.COLOR_LINE )
		draw.RoundedBox( 0, 8 + 1, 650 + 1, -16 + w - 2, 40 - 2, xdefmod.COLOR_BORDER )
		draw.RoundedBox( 0, 8 + 2, 650 + 2, -16 + w - 4, 40 - 4, xdefmod.COLOR_BACKGROUND )
		draw.RoundedBox( 0, 8 + 4, 650 + 4, ( w - 24 ) * per, 40 - 8, col )
		pan.N_Bing = Lerp( 0.05, pan.N_Bing, pan.B_Hover and 0.25 or 0 )
		draw.RoundedBox( 0, 8 + 4, 650 + 4, ( w - 24 ) * per, 40 - 8, Color( 255, 255, 255, 255 * pan.N_Bing ) )
		surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 7, 163, w -14, h -277, 2 )
		surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 7, 163, w -14, h -277, 1 )
		if not pan.B_Hover then local ppp = math.Round( per, 4 ) * 100
			draw.TextShadow({
				text = language.GetPhrase("xdefm.Progress") .. ": " .. ppp .. "%",
				pos = {w / 2, 670},
				font = "xdefm_Font4",
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER,
				color = Color(255, 255, 255)
			}, 1, 255)
		else draw.TextShadow( { text = language.GetPhrase( "xdefm.Progress" ) .. ": " .. pan.N_Total .. "/" .. pan.N_All, pos = { w / 2, 670 },
			font = "xdefm_Font4", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		end draw.TextShadow( {
			text = language.GetPhrase( "xdefm.Collection" ), pos = { w / 2, 25 }, font = "xdefm_Font6",
			xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		draw.TextShadow( { text = language.GetPhrase( "xdefm.Total" ) .. ": " .. pan.T_Dats.Num, pos = { 150 + w / 2, 145 },
		font = "xdefm_Font5", xalign = TEXT_ALIGN_CENTER,
		yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		if pan.T_Dats.PagT > 0 then
			draw.TextShadow({
				text = language.GetPhrase("xdefm.Page") .. ": " .. pan.T_Dats.PagO .. "/" .. pan.T_Dats.PagT,
				pos = {-150 + w / 2, 145},
				font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER,
				color = Color(255, 255, 255)
			}, 1, 255)
		else draw.TextShadow( { text = language.GetPhrase( "xdefm.Page" ) .. ": 0", pos = { -150 + w / 2, 145 },
			font = "xdefm_Font5", xalign = TEXT_ALIGN_CENTER, yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 ) }, 1, 255 )
		end end
	local function AddTickButton(x, y, typ) -- FIXME: "typ" shadows existing binding!
		if not isstring( typ ) then typ = "Useless" end
		local but = pan:Add( "DButton" ) but:SetPos( x, y ) but:SetSize( 160, 32 ) but:SetText( "" )
		but.B_Hover = false  but.N_Ho = 0  but.N_In = 0  pan.T_Buts[ typ ] = but
		function but:Paint( w, h ) local pe3 = 0
			if but.B_Hover then pe3 = math.Clamp( but.N_Ho -SysTime(), 0, 1 )
			else pe3 = 1-math.Clamp( but.N_Ho -SysTime(), 0, 1 ) end
			surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawRect( 0, 0, w, h )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h )
			if but.N_In > SysTime() then local per = ( 1-math.Clamp( ( but.N_In -SysTime() ) / 0.4, 0, 1 ) )
				local pe2 = math.Clamp( per * 2, 0, 1 )
				draw.RoundedBox( 0, 2, 2, ( w -4 ) * pe2, ( h - 4 ) * pe2, Color( 255, 255, 255, 255 * (1-per) ) ) end
			draw.RoundedBox( 0, 2, 2, w -4, h -4, Color( 255, 255, 255, 50 * (1-pe3) ) )
			draw.TextShadow( { text = language.GetPhrase( "xdefm." .. typ ), pos = { 32, h / 2 },
			font = "xdefm_Font1", xalign = TEXT_ALIGN_LEFT,
			yalign = TEXT_ALIGN_CENTER, color = Color( 255, 255, 255 * pe3 ) }, 1, 255 )
			surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawRect( w -20 -8, 5, 22, 22 )
			surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( w -20 -8, 5, 22, 22, 3 )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( w -20 -8, 5, 22, 22, 1 )
			if pan.T_Typs[ typ ] then draw.TextShadow( { text = "●", pos = { w -18, 16 },
				font = "xdefm_Font2", xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER, color = Color( 0, 255, 0 ) }, 1, 255 ) end end
		function but:OnCursorEntered() but.B_Hover = true  but.N_Ho = SysTime() + 0.5 end
		function but:OnCursorExited() but.B_Hover = false  but.N_Ho = SysTime() + 0.5 end
		function but:DoClick() pan.T_Typs[ typ ] = not pan.T_Typs[ typ ]  but.N_In = SysTime() + 0.4
		if input.IsShiftDown() then local ref = pan.T_Typs[ typ ]
			for k, v in pairs(pan.T_Typs) do
				if k ~= typ and v ~= ref then
					pan.T_Typs[k] = ref
					pan.T_Buts[k].N_In = SysTime() + 0.4
				end
			end
		end pan:RefreshDatItems() end
		function but:DoRightClick() local ref = false
			if pan.T_Typs[ typ ] == false then pan.T_Typs[ typ ] = true  but.N_In = SysTime() + 0.4  ref = true end
			for k, v in pairs( pan.T_Typs ) do if k ~= typ and v == true then pan.T_Typs[ k ] = false  ref = true
			if pan.T_Buts[ k ] then pan.T_Buts[ k ].N_In = SysTime() + 0.4 end end end
			if ref then pan:RefreshDatItems() end end
		local ico = xdefmod.util.ITEM_ICONS[ typ ]  local spr = but:Add( "DImage" ) spr:SetPos( 8, 8 )
		spr:SetSize( 16, 16 ) spr:SetMaterial( ico ) return but end local ba = 30
	AddTickButton( ba, 50, "Useless" ) AddTickButton( ba + 175, 50, "Creature" )
	AddTickButton( ba + 175 * 2, 50, "Bait" ) AddTickButton( ba + 175 * 3, 50, "Recipe" ) AddTickButton( ba, 86, "Struct" )
	pan.P_Select = pan:Add( "DPanel" )
	local pax = pan.P_Select -- FIXME: "pax" shadows existing binding!
	pax:SetSize( 734 - 6, 420 - 6 )
	pax:SetPos( 8 + 3, 165 + 3 )
	--local Mat = Material( "gui/center_gradient" ) -- Unused?
	function pax:Paint( w, h ) surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawRect( 0, 0, w, h ) end
	pan.P_Items = pax:Add( "DIconLayout" ) local pa2 = pan.P_Items  pa2:Dock( FILL )
	pa2:SetSpaceX( 4.5 ) pa2:SetSpaceY( 4.5 ) function pa2:Paint( w, h ) end
	for i = 1, 5 do
		local but = pan:Add("DButton")
		but:SetSize(20, 45)
		but:SetText("")
		pan.T_But2[i] = but
		but:SetPos(8 + (i - 1) * 30, 596)
		but:SetToolTip("#xdefm.T" .. i) -- DEPRECATED: Use :SetTooltip instead, notice the lowercase t
		function but:Paint(w, h)
			local col = xdefmod.util.RARITY_COLORS[i + 1] -- FIXME: "col" shadows existing binding!
			surface.SetDrawColor(col)
			surface.DrawRect(0, 0, w, h)
			surface.SetMaterial(Ma2)
			surface.SetDrawColor(col.r * 0.5, col.g * 0.5, col.b * 0.5)
			surface.DrawTexturedRect(0, 0, w, h)
			surface.SetDrawColor(xdefmod.COLOR_LINE)
			surface.DrawOutlinedRect(0, 0, w, h, 2)
			if pan.T_Rars[i] == true then
				surface.SetDrawColor(xdefmod.COLOR_BORDER)
				surface.DrawOutlinedRect(0, 0, w, h, 1)
			end
		end function but:DoClick() pan.T_Rars[ i ] = not pan.T_Rars[ i ]
		if input.IsShiftDown() then local ref = pan.T_Rars[ i ]
			for k, v in pairs( pan.T_Rars ) do if k ~= i and v ~= ref then pan.T_Rars[ k ] = ref end end
		end pan:RefreshDatItems( pag ) end
		function but:DoRightClick() local ref = false
			if pan.T_Rars[ i ] == false then pan.T_Rars[ i ] = true  ref = true end
			for k, v in pairs( pan.T_Rars ) do if k ~= i and v == true then pan.T_Rars[ k ] = false  ref = true end end
		if ref then pan:RefreshDatItems() end end end
	for i = 1, 4 do
		local but = pan:Add("DButton")
		but:SetSize(75, 30)
		but:SetText("")
		but.B_Hover = false
		but.N_Clicked = 0
		but.N_Bing = 0
		but:SetPos(366 + (i - 1) * 100, 606)
		function but:Paint( w, h )
			local col = xdefmod.util.RARITY_COLORS[i + 1]
			local pgo, pgt = pan.T_Dats.PagO, pan.T_Dats.PagT
			but.N_Bing = Lerp(0.2, but.N_Bing, but.N_Clicked > CurTime() and -1 or (but.B_Hover and 1 or 0))
			surface.SetDrawColor(Color(100 + 55 * but.N_Bing, 100 + 100 * but.N_Bing, 100 + 100 * but.N_Bing))
			if pgt <= 0 or ( i == 1 and ( pgo <= 1 or pgt <= 2 ) ) or ( i == 2 and pgo <= 1 ) or ( i == 3 and pgo >= pgt )
			or ( i == 4 and ( pgo >= pgt or pgt <= 2 ) ) then surface.SetDrawColor( Color( 25, 25, 25 ) ) end
			surface.DrawRect( 0, 0, w, h ) surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 1 ) local txt = ""
			if i == 1 then txt = "A" elseif i == 2 then txt = "B" elseif i == 3 then txt = "C" elseif i == 4 then txt = "D" end
			draw.TextShadow({
				text = language.GetPhrase("xdefm.Page" .. txt),
				pos = {w / 2, h / 2 - 2},
				font = "xdefm_Font4",
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER,
				color = Color(255, 255, 255)
			}, 1, 255)
		end function but:OnCursorEntered() self.B_Hover = true end function but:OnCursorExited() self.B_Hover = false end
		function but:DoClick()
			if but.N_Clicked > CurTime() or pan.T_Dats.PagT <= 0 then return end
			but.N_Clicked = CurTime() + 0.1
			local pgo, pgt = pan.T_Dats.PagO, pan.T_Dats.PagT
			if ( i == 1 and ( pgo <= 1 or pgt <= 2 ) ) or ( i == 2 and pgo <= 1 ) or ( i == 3 and pgo >= pgt )
			or ( i == 4 and ( pgo >= pgt or pgt <= 2 ) ) then return end
			if i == 1 then
				pan.T_Dats.PagO = 1
			elseif i == 2 then
				pan.T_Dats.PagO = math.max(pan.T_Dats.PagO - 1, 0)
			elseif i == 3 then
				pan.T_Dats.PagO = math.min(pan.T_Dats.PagO + 1, pgt)
			elseif i == 4 then
				pan.T_Dats.PagO = pgt
			end

			pan:RefreshDatItems()
		end end
	pan.P_Prog = pan:Add( "DPanel" ) pan.P_Prog:SetSize( 734, 40 ) pan.P_Prog:SetPos( 8, 650 ) function pan.P_Prog:Paint( w, h ) end
	function pan.P_Prog:OnCursorEntered() pan.B_Hover = true end function pan.P_Prog:OnCursorExited() pan.B_Hover = false end
	function pan:RefreshDatItems() pa2:Clear() local ite = {}
		local ttl = 0
		for k, v in pairs( pan.T_Items ) do
			local tab = xdefmod.items[v] -- FIXME: "tab" shadows existing binding!
			if istable(tab) and isstring(tab.Type) and pan.T_Typs[tab.Type] and pan.T_Typs[tab.Type] == true and pan.T_Rars[tab.Rarity] and pan.T_Rars[tab.Rarity] == true then
				table.insert(ite, v)
				ttl = ttl + 1
			end
		end
		pan.T_Dats.Num = ttl  pan.T_Dats.PagT = math.ceil( ttl / 28 )
		local pag = pan.T_Dats.PagO -- FIXME: "pag" shadows existing binding!
		if pag > pan.T_Dats.PagT then pan.T_Dats.PagO = pan.T_Dats.PagT
		elseif pag <= 0 and ttl > 0 then pan.T_Dats.PagO = 1 end pag = pan.T_Dats.PagO  local st = 1 + (pag - 1) * 28
		for i = st, st + 27 do
			if not isstring( ite[ i ] ) then break end local cls = ite[ i ]
			local tab = xdefmod.items[ cls ] -- FIXME: "tab" shadows existing binding!
			if istable( tab ) and isstring( tab.Type ) and pan.T_Typs[ tab.Type ] and pan.T_Typs[ tab.Type ] == true and pan.T_Rars[ tab.Rarity ] and pan.T_Rars[ tab.Rarity ] == true then
				local slo = xdefm_SlotBox( 0, 0, 100, 100, 0, nil, xdefmod.util.ITEM_ICONS[ tab.Type ], true )
				if slo then slo:F_SetupItem( ite[ i ] ) pa2:Add( slo )
					function slo:DoClick() if not ply:IsAdmin() then return end local it = cls
						if tab.Type == "Food" then it = it .. "|" .. tab.BestCook
						elseif tab.Type == "Creature" then it = it .. "|" .. tab.MaxSize
						elseif tab.Type == "Recipe" then it = it .. "|" .. tab.Durability end
						surface.PlaySound( "garrysmod/ui_click.wav" )
						RunConsoleCommand( "xdefmod_spawn", it )
					end
					function slo:DoRightClick() if not ply:IsAdmin() then return end local it = cls
						if tab.Type == "Food" then it = it .. "|" .. tab.BestCook
						elseif tab.Type == "Creature" then it = it .. "|" .. tab.MaxSize
						elseif tab.Type == "Recipe" then it = it .. "|" .. tab.Durability end
						surface.PlaySound( "garrysmod/ui_return.wav" )
						RunConsoleCommand( "xdefmod_give", it )
					end
				end
			end
		end
		local cvar = {} -- FIXME: "cvar" shadows existing binding!
		for k, v in pairs( Typs ) do table.insert( cvar, pan.T_Typs[ v ] == true and 1 or 0 ) end
		for k, v in pairs( pan.T_Rars ) do table.insert( cvar, v == true and 1 or 0 ) end
		table.insert( cvar, pan.T_Dats.PagO )
		RunConsoleCommand( "xdefmod_collection", table.concat( cvar, "" ) )
	end pan:RefreshDatItems()
elseif typ == 9 then -- Craft menu
	if IsValid( xdefmod.util.menus[ "Craft" ] ) then return end  local MaR = Material( "gui/gradient" )
	local pan = vgui.Create( "DFrame" )  xdefmod.util.menus.Craft = pan  pan.T_Data = ply.xdefm_Profile  pan.S_Recipe = "_"
	pan:SetPos( ScrW() / 2 - 40, ScrH() / 2 - 550 / 2 ) pan:SetSize( 600, 550 ) pan:ShowCloseButton( false ) pan:SetAnimationEnabled( false )
	pan:SetVisible( true ) pan:SetScreenLock( true ) pan:SetDraggable( true ) pan:SetTitle( "" ) pan:SetAlpha( 255 ) pan:MakePopup()
	pan:MoveTo( ScrW() / 2 -40, ScrH() / 2 - 500 / 2, 0.2 )
	function pan:Paint( w, h )
		surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawRect( 0, 0, w, h )
		surface.SetMaterial( Zom ) surface.SetDrawColor( 0, 0, 0, 96 )
		surface.DrawTexturedRectRotated(w / 2, h / 2, w, h, 0)
		surface.DrawTexturedRectRotated(w / 2, h / 2, w, h, 180)
		surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
		surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.TextShadow({
			text = language.GetPhrase("xdefm.Weapon_Craft"),
			pos = {w / 2, 25},
			font = "xdefm_Font6",
			xalign = TEXT_ALIGN_CENTER,
			yalign = TEXT_ALIGN_CENTER,
			color = Color(255, 255, 255)
		}, 1, 255)
	end
	function pan:OnRemove()
		xdefmod.util.lc = false  local num = 0
		for k, v in pairs( pan.T_Data.Items ) do
			if v == "_" and k ~= 21 then num = k break end
		end if num > 0 then xdefm_Command( LocalPlayer(), "MoveCraft", num ) end
	end
	if true then -- Close button
		pan.P_Close = pan:Add( "DButton" )
		local pax = pan.P_Close -- FIXME: "pax" shadows existing binding!
		pax:SetText( "" ) pax:SetPos( 560, 8 ) pax:SetSize( 32, 32 )
		pax.B_Hover = false  pax:SetTooltip( "#xdefm.Close" )
		function pax:Paint(w, h)
			draw.TextShadow({
				text = "×",
				pos = {w / 2, h / 2},
				font = "xdefm_Font5",
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER,
				color = pax.B_Hover and Color(255, 0, 0) or Color(255, 255, 255)
			}, 2, 255)
		end

		function pax:DoClick()
			pan:Close()
		end
		function pax:OnCursorEntered() pax.B_Hover = true end function pax:OnCursorExited() pax.B_Hover = false end end --
	if true then -- Crafting panel
		pan.P_Base = pan:Add( "DPanel" )
		local pax = pan.P_Base -- FIXME: "pax" shadows existing binding!
		pax.N_Type = 0  pan.T_Slots = {}
		pax:SetPos( 8, 50 ) pax:SetSize( 582, 490 ) function pax:Paint( w, h ) end pax.N_Type = typ
		function pax:Paint( w, h )
			local rec = "xdefm.NeedRecipe"
			--local slo = pan.T_Slots[ 1 ] -- Unused?
			local dur = 0
			local yes = false -- FIXME: "yes" shadows existing binding!
			local col = Color(200, 200, 200) -- FIXME: "col" shadows existing binding!
			local pro, dum = 0, 0
			if isstring( pan.T_Slots[ 1 ].S_Item ) and pan.T_Slots[ 1 ].S_Item ~= "_" then
				local aa, bb = xdefm_ItemGet( pan.T_Slots[ 1 ].S_Item )
				if istable( aa ) and istable( bb ) and bb.Type == "Recipe" then
					rec = bb.Name
					dur = aa[2]
					yes = true
					col = xdefmod.util.RARITY_COLORS[bb.Rarity + 1]
					dum = bb.Durability
					pro = #bb.Crafts
				end
			end
			surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawRect( 0, 0, w, 80 )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, 80, 2 )
			surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, 80 )
			draw.TextShadow( { text = language.GetPhrase( rec ), pos = { 80, 20 }, font = "xdefm_Font1",
			xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = col }, 1, 255 )
			if yes and dur and dum then draw.TextShadow( { text = language.GetPhrase( "xdefm.Durability" ) .. ": " .. dur .. " / " .. dum,
				pos = { 80, 40 }, font = "xdefm_Font2", xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = xdefmod.COLOR_BORDER }, 1, 255 )
				draw.TextShadow( { text = language.GetPhrase( "xdefm.Product" ) .. ": " .. pro,
				pos = { 80, 60 }, font = "xdefm_Font2", xalign = TEXT_ALIGN_LEFT, yalign = TEXT_ALIGN_CENTER, color = xdefmod.COLOR_BORDER }, 1, 255 )
			end
		end
		local res = xdefm_SlotBox( 8, 8, 64, 64, 1, "#xdefm.Recipe", nil ) pax:Add( res ) res.S_Type = "Recipe"  pan.P_Slot = res
		function res:DoRightClick( Pnl ) if res.T_Item == nil or res:IsDragging() or not IsValid( xdefmod.util.menus[ "Inventory" ] ) then return end
			if IsValid( pan.P_DMenu ) then pan.P_DMenu:Remove() end pan.P_DMenu = DermaMenu( false, nil )  local dnm = pan.P_DMenu
			local O_Take = dnm:AddOption( "#xdefm.Take", function() if not res.B_OnMove and IsValid( xdefmod.util.menus[ "Inventory" ] ) then
			local num = 0  for k, v in pairs( LocalPlayer().xdefm_Profile.Items ) do
				if isstring( v ) and v == "_" and k ~= 21 then num = k break end
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
			surface.SetDrawColor( xdefmod.COLOR_BACKGROUND ) surface.DrawRect( 0, 0, w, h )
			surface.SetDrawColor( xdefmod.COLOR_BORDER ) surface.DrawOutlinedRect( 0, 0, w, h, 2 )
			surface.SetDrawColor( xdefmod.COLOR_LINE ) surface.DrawOutlinedRect( 0, 0, w, h )
		end  pan.T_Slots[ 1 ] = res
		pax.P_Hold = pax.P_Scroll:Add( "DIconLayout" )  local pa2 = pax.P_Hold  pa2:SetSize( 582, 1000 )
		pa2:SetSpaceX( 1 ) pa2:SetSpaceY( 0 ) function pa2:Paint( w, h ) end
		function pax:OnCursorEntered() self.B_Hover = true end function pax:OnCursorExited() self.B_Hover = false end
		pax.P_Hold.N_Num = 0
	end
	function pan:XDEFM_Update( id, dt )
		if id == 0 then pan.T_Data = dt end if id ~= 9 then return end
		pan.P_Slot:F_SetupItem(dt[1])
		pan.S_Recipe = dt[1]
		local pax = pan.P_Base -- FIXME: "pax" shadows existing binding!
		pax.P_Hold:Clear()
		local _, bb = xdefm_ItemGet(dt[1])
		if not istable( bb ) or bb.Type ~= "Recipe" or #bb.Crafts <= 0
		then xdefmod.util.craft = nil  xdefmod.util.marker = nil return end pax.P_Hold.N_Num = 0
		local function xdefm_AddCraft(tab) -- FIXME: Shadows existing binding!
			pax.P_Hold.N_Num = pax.P_Hold.N_Num + 1
			local cc = string.Explode( "&", tab ) if not istable( cc ) or #cc < 2 then return end
			local slo = vgui.Create( "DButton", pax.P_Hold ) slo:SetSize( 50, 80 ) slo:Dock( TOP ) slo:SetText( "" ) slo:SetCursor( "blank" )
			local aa, bb = xdefm_ItemGet(cc[#cc]) -- FIXME: "bb" shadows existing binding!
			if not istable( aa ) or not istable( bb ) then slo:Remove() return end
			local col = xdefmod.util.RARITY_COLORS[bb.Rarity + 1] -- FIXME: "col" shadows existing binding!
			local icc = xdefmod.util.ITEM_ICONS[ bb.Type ]  slo.S_Item = cc[ #cc ]
			slo.B_Hover = false  slo.N_Num = pax.P_Hold.N_Num  slo.N_Clk = 0  slo.N_Lerp = 0 if icc ~= nil then
				pax.P_Sprite = vgui.Create( "DPanel", slo ) local spr = pax.P_Sprite  
				spr:SetPos( 79, 23 ) spr:SetSize( 16, 16 ) spr:SetMouseInputEnabled( false )
				function spr:Paint( w, h ) surface.SetMaterial( icc )
					surface.SetDrawColor( Color( 255, 255, 255, 255 ) ) surface.DrawTexturedRect( 0, 0, w, h )
				end end slo.T_Craft = cc
				function slo:Paint(w, h)
					local coc = slo.B_Hover and 0.4 or 0.2
					local co2 = Color(col.r * coc, col.g * coc, col.b * coc)
					slo.N_Lerp = Lerp(0.1, slo.N_Lerp, (slo.N_Clk <= CurTime() and slo.B_Hover) and 0 or 1)
					local co3 = Color(col.r * coc * 2, col.g * coc * 2, col.b * coc * 2, 55 + slo.N_Lerp * 100)
					draw.RoundedBox(0, 2 + 3, 2, w - 1 - 8, h - 2, co2)
					surface.SetDrawColor(co3)
					surface.SetMaterial(MaR)
					surface.DrawTexturedRect(2 + 5, 2, w - 5 - 8, h - 2 - 2)
					surface.SetDrawColor(xdefmod.COLOR_BORDER)
					surface.DrawOutlinedRect(2 + 3, 2, w - 1 - 8, h - 2, 2)
					surface.SetDrawColor(xdefmod.COLOR_LINE)
					surface.DrawOutlinedRect(2 + 3, 2, w - 1 - 8, h - 2)
					draw.TextShadow({
						text = bb.Name,
						pos = {102, 30},
						font = "xdefm_Font5",
						xalign = TEXT_ALIGN_LEFT,
						yalign = TEXT_ALIGN_CENTER,
						color = col
					}, 1, 255)

					draw.TextShadow({
						text = language.GetPhrase("xdefm.Materials") .. ": " .. tostring(#cc - 1),
						pos = {80, 60},
						font = "xdefm_Font1",
						xalign = TEXT_ALIGN_LEFT,
						yalign = TEXT_ALIGN_CENTER,
						color = Color(255, 255, 255)
					}, 1, 255)

					draw.TextShadow({
						text = "#" .. slo.N_Num,
						pos = {540, 40},
						font = "xdefm_Font4",
						xalign = TEXT_ALIGN_RIGHT,
						yalign = TEXT_ALIGN_CENTER,
						color = Color(200, 200, 200)
					}, 1, 255)
				end
			function slo:OnCursorEntered() slo.B_Hover = true  xdefmod.util.craft = cc  pan.P_Select = slo  xdefmod.util.aim_pan = slo
			xdefmod.util.ings = {}  xdefmod.util.ing2 = {}  xdefmod.util.marker = slo.S_Item  xdefmod.util.lc = true end
			function slo:OnCursorExited() slo.B_Hover = false  if xdefmod.util.aim_pan == slo then xdefmod.util.aim_pan = nil end
			if pan.P_Select == slo then xdefmod.util.marker = nil
			pan.P_Select = nil  xdefmod.util.marker = nil end end
			function slo:DoClick() if slo.N_Clk > CurTime() then return end slo.N_Clk = CurTime() + 0.25
			xdefm_Command( LocalPlayer(), "Craft", tostring( slo.N_Num ) ) end
			local ico = xdefm_SlotBox( 13, 11, 60, 60, 1 ) slo:Add( ico ) ico:F_SetupItem( cc[ #cc ] )
			ico.P_Txt:Remove() ico:SetMouseInputEnabled( false )
		end for k, v in pairs( bb.Crafts ) do xdefm_AddCraft( v ) end
	end pan:XDEFM_Update( 9, tab )
end end end
	function xdefm_ProfileUpdate(ply, tab) -- FIXME: "tab" shadows existing binding!
		if not IsValid( ply ) or not ply:IsPlayer() or not isstring( ply:SteamID() ) or ply:IsBot() then return end
		if not istable( tab ) then tab = ply.xdefm_Profile end
		if SERVER then
			tab.Nick = ply:Nick()
			tab.SID64 = ply:SteamID64()
			local dat = util.TableToJSON( tab, true )
			if not isstring( dat ) or dat == "" then
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
			if not file.IsDir( "xdefishmod", "DATA" ) then
				file.CreateDir( "xdefishmod" )
			end
			file.Write( "xdefishmod/p_" .. name .. ".txt", dat )
			net.Start( "NET_xdefm_Profile" )
			net.WriteString( util.TableToJSON( ply.xdefm_Profile ) )
			net.Send( ply )
			xdefm_UpdateMenu( ply, 0, ply.xdefm_Profile )
		end
	end
	function xdefm_GetUpValue(lvl, ele)
		if not isnumber(lvl) or not isstring(ele) then return nil end
		lvl = math.Clamp(math.Round(lvl), 0, 100)
		if ele == "A" then return 0.5 + lvl * 0.025 end
		if ele == "B" then return 210 + lvl * 90 end
		if ele == "C" then return 0.8 + lvl * 0.192 end
		if ele == "D" then return 200 + lvl * 50 end
		if ele == "E" then return lvl * 0.01 end
		if ele == "F" then return 0 + lvl end
		if ele == "G" then return 1 + lvl end
		return nil
	end
	function xdefm_CanInteract( fr, to )
		if not IsValid( fr ) or not IsValid( to ) or not fr:IsPlayer() then return false end
		local siz = to:OBBMins():Distance( to:OBBMaxs() )
		return fr:WorldSpaceCenter():Distance(to:WorldSpaceCenter()) <= math.max(64, math.ceil(siz * 1.5))
	end
	function xdefm_ItemMark( str, aco ) -- FIXME: "str" shadows existing binding!
		if not isstring( str ) or str == "" or str == "_" then return "" end
		local aa, bb = xdefm_ItemGet( str )
		if not istable( aa ) or not istable( bb ) then return "" end
		local ext = ""
		if bb.Type == "Creature" and aa[2] then
			ext = " (x" .. aa[2] .. ")"
		end
		if bb.Type == "Recipe" and aa[2] then
			local per = math.Round( ( aa[2] / bb.Durability ) * 100 )
			ext = " (" .. per .. "%)"
		end
		local nam = bb.Name
		if CLIENT then
			nam = language.GetPhrase( nam )
		end
		if aco then
			return nam .. ext
		else
			local col = xdefmod.util.RARITY_COLORS[bb.Rarity + 1] -- FIXME: "col" shadows existing binding!
			return "&<color=" .. col.r .. "," .. col.g .. "," .. col.b .. ">&" .. nam .. "&" .. ext .. "&</color>&"
		end
	end
	function xdefm_ItemRegister( nam, dat )
		if not isstring( nam ) or nam == "" or nam == "_" or nam == "!V" or not istable( dat ) then return false end
		local inp = {}
		inp.Name 		= isstring( dat.Name ) and dat.Name or language.GetPhrase( "xdefm.BaseItem" ) -- Item name
		inp.Type 		= ( isstring( dat.Type ) and isnumber( xdefmod.util.ITEM_TYPES[ dat.Type ] ) ) and dat.Type or "Useless" -- Category, refer to xdefm.miscs.Types
		inp.Model 		= { "models/props_junk/popcan01a.mdl" } -- Model, only pick choose from available content, first model is selected for icon, non-model paths will cause errors
		inp.Helper 		= isstring( dat.Helper ) and dat.Helper or "" -- Help text
		inp.Rarity 		= isnumber( dat.Rarity ) and math.Clamp( math.Round( dat.Rarity ), 1, 5 ) or 1 -- Rarity: 1 = White, 2 = Green, 3 = Blue, 4 = Purple, 5 = Orange
		inp.Price 		= isnumber( dat.Price ) and math.max( math.Round( dat.Price ), 0 ) or 0 -- Price, selling price is calculated separately
		inp.Carryable 	= true  if isbool( dat.Carryable ) then inp.Carryable = dat.Carryable end -- Can be put into inventory
		inp.Secret 		= true  if isbool( dat.Secret ) then inp.Secret = dat.Secret end -- Set to disable spawning item with commands
		inp.TickRate 	= isnumber( dat.TickRate ) and math.max( dat.TickRate, 0 ) or 60 -- Items tick interval (in seconds)
		inp.KillInWater = false  if isbool( dat.KillInWater ) then inp.KillInWater = dat.KillInWater end -- Disappears in water, default is false
		inp.Constants 	= {}  if istable( dat.Constants ) then inp.Constants = dat.Constants end -- Item specific constants
		inp.PhysSound	= isstring( dat.PhysSound ) and dat.PhysSound or nil -- Collision sound
		inp.CantCook	= isbool( dat.CantCook ) and dat.CantCook or nil -- Disables ability to cook item with furnace type structures
		if SERVER then
			-- FIXME: All "inp" below shadow existing binding!
			inp.OnTouch = function( inp, ent, usr, typ ) end if isfunction( dat.OnTouch ) then inp.OnTouch = dat.OnTouch end -- Touch, usr: entity that touched, typ: 1 starts, 0 continues, -1 stops
			inp.OnUse = function( inp, ent, usr ) return true end if isfunction( dat.OnUse ) then inp.OnUse = dat.OnUse end -- Use, usr: entity that used, return false prevents picking up item
			inp.OnThink = function( inp, ent ) end if isfunction( dat.OnThink ) then inp.OnThink = dat.OnThink end
			inp.OnCollide = function( inp, ent, dat ) end if isfunction( dat.OnCollide ) then inp.OnCollide = dat.OnCollide end -- Collision, dat: data
			inp.OnInit = function( inp, ent ) return false end if isfunction( dat.OnInit ) then inp.OnInit = dat.OnInit end -- Init, executed after OnDrop, return false to cancel default settings
			inp.OnReady = function( inp, ent ) end if isfunction( dat.OnReady ) then inp.OnReady = dat.OnReady end -- Ready, 0.1 seconds after OnInit
			inp.OnDamaged = function( inp, ent, dmg ) return true end if isfunction( dat.OnDamaged ) then inp.OnDamaged = dat.OnDamaged end -- Damage, return false to prevent any damage
			inp.OnDrop = function( inp, ent, usr, typ ) end if isfunction( dat.OnDrop ) then inp.OnDrop = dat.OnDrop end -- E picks up items, typ: false for items on ground, true for items ejected.
			inp.OnStore = function( inp, ent, usr ) return true end if isfunction( dat.OnStore ) then inp.OnStore = dat.OnStore end -- R stores items, return false to prevent, inp.Carryable toggles option
			inp.OnPhysSimulate = function( inp, ent, phy, del ) end if isfunction( dat.OnPhysSimulate ) then inp.OnPhysSimulate = dat.OnPhysSimulate end -- Physics simulation
			inp.OnRemove = function( inp, ent ) end if isfunction( dat.OnRemove ) then inp.OnRemove = dat.OnRemove end -- Deletion
			inp.OnPlayerDrop = function( inp, ent ) end if isfunction( dat.OnPlayerDrop ) then inp.OnPlayerDrop = dat.OnPlayerDrop end -- Dropped by player
			inp.OnCaught = function( inp, ent, ply ) end if isfunction( dat.OnCaught ) then inp.OnCaught = dat.OnCaught end -- Caught (out of water), fishing successful and experience gained
		else
			inp.OnDraw = function( inp, ent ) end if isfunction( dat.OnDraw ) then inp.OnDraw = dat.OnDraw end -- Entity rendering
			inp.HelperUse = "xdefm.U1"  if isstring( dat.HelperUse ) then inp.HelperUse = dat.HelperUse end -- Use key text, default is "Pick up"
		end
		if isstring( dat.Model ) then inp.Model = { dat.Model } elseif istable( dat.Model ) and #dat.Model > 0 then inp.Model = dat.Model end local typ = dat.Type
		if typ == "Creature" then
			inp.MaxSize = ( isnumber( dat.MaxSize ) and math.max( math.Round( dat.MaxSize, 1 ), 0 ) or 1 ) -- Maximum creature size
			inp.MinSize = ( isnumber( dat.MinSize ) and math.max( math.Round( dat.MinSize, 1 ), 0 ) or 1 ) -- Minimum creature size
			if inp.MinSize > inp.MaxSize then inp.MinSize = inp.MaxSize end
		elseif typ == "Bait" then
			inp.Consume = ( isnumber( dat.Consume ) and math.max( dat.Consume, 0 ) or 0 ) -- Bait consumption probability, higher value = less chance, 1 = single-use, 0 = never consumed
			inp.Level = ( isnumber( dat.Level ) and math.Clamp( dat.Level, 0, 1000 ) or 0 ) -- Bait level requirement
		elseif typ == "Recipe" then
			inp.Durability = ( isnumber( dat.Durability ) and math.max( math.Round( dat.Durability ), 1 ) or 1 ) -- Durability, equals how many times a blueprint can be used
			if istable( dat.Crafts ) or isstring( dat.Crafts ) then inp.Crafts = dat.Crafts else return false end -- Blueprint materials & results, can be a table of multiple
			if isstring( inp.Crafts ) then inp.Crafts = { inp.Crafts } end for k, v in pairs( inp.Crafts ) do if not isstring( v ) then return false end
			local dec = string.Explode( "&", v ) if not istable( dec ) or #dec < 2 then return false end end
			-- Required blueprint format: "material_a&material_b&material_c&product_item"
			-- Can be a table of multiple strings. The "product_item" must be the last item separated by leading '&'.
			-- Material types can be crossed, and there are no restrictions on item categories.
			-- Creature size is not restricted, but cooked / burned items can not be used in crafting.
		elseif typ == "Struct" then
			inp.SType = isnumber( dat.SType ) and math.Clamp( math.Round( dat.SType ), 0, 3 ) or 0 -- Structure types: 0 = Other, 1 = Storage, 2 = Crafting, 3 = Shop
			if inp.SType == 1 then
				inp.Accepted = istable( dat.Accepted ) and dat.Accepted or nil -- Storage restriction to specific item types, leave blank for no restriction
				inp.Amount = isnumber( dat.Amount ) and math.max( 0, math.Round( dat.Amount ) ) or 0 -- Storage capacity (item amount)
			elseif inp.SType == 2 then
				if istable( dat.Crafts ) or isstring( dat.Crafts ) then inp.Crafts = dat.Crafts else return false end -- Crafting format is the same as blueprints, but with unlimited uses
				if isstring( inp.Crafts ) then inp.Crafts = { inp.Crafts } end for k, v in pairs( inp.Crafts ) do if not isstring( v ) then return false end
				local dec = string.Explode( "&", v ) if not istable( dec ) or #dec < 2 then return false end end
			elseif inp.SType == 3 then
				if istable( dat.Shop ) then inp.Shop = dat.Shop else return false end -- Items & prices, can be a table of multiple. Prices will not decrease.
				for k, v in pairs( inp.Shop ) do if not istable( v ) then return false end end
			end
			inp.OnInteract =  isfunction( dat.OnInteract ) and dat.OnInteract or nil -- typ: 1 = enter, 0 = interact, -1 = exit
			inp.StartSound = isstring( dat.StartSound ) and dat.StartSound or nil -- Starts sound effect
			inp.ExitSound  = isstring( dat.ExitSound ) and dat.ExitSound or nil -- Ends sound effect
		end
		nam = string.Replace( nam, " ", "_" )
		xdefmod.items[ nam ] = inp
		return true
	end
	function xdefm_ItemBased( bas, nam, dat )
		if not isstring( nam ) or nam == "" or nam == "_" or not istable( dat ) or string.find( nam, "|" ) ~= nil or string.find( nam, "&" ) ~= nil then return false end
		local _, bb = xdefm_ItemGet(bas)
		if not istable( bb ) then return false end
		local inp = {}
		for k, v in pairs( bb ) do
			inp[ k ] = ( dat[ k ] ~= nil and dat[ k ] or v )
		end
		if isstring( inp.Model ) then
			inp.Model = { inp.Model }
		end
		nam = string.Replace( nam, " ", "_" )
		xdefmod.items[ nam ] = inp
		return true
	end

	--- Retrieves item information and its associated data.
	--- @param obj string|Entity: The item identifier or entity.
	--- @return string[]|nil: The item info (string table) if valid, otherwise nil.
	--- @return table|nil: The item object (table) if valid, otherwise nil.
	function xdefm_ItemGet(obj)
		if IsEntity(obj) and obj:GetClass() == "xdefm_base" then
			obj = obj:GetFMod_DT()
		end

		if not isstring(obj) or obj == "" or obj == "_" then
			return nil, nil
		end

		local item_info = string.Explode("|", obj)
		if istable(item_info) then
			obj = xdefm_GetClass(obj)
		end

		local item = xdefmod.items[obj]
		if not istable(item) then
			return nil, nil
		end

		if not istable(item_info) then
			item_info = { obj }
		end

		return item_info, table.Inherit(item, {})
	end

	function xdefm_Command( ply, cmd, dat )
		if isnumber( dat ) then dat = tostring( dat ) end
		if not isstring( dat ) or dat == "" or not isstring( cmd ) or ( isnumber( ply.XDEFM_Cool ) and ply.XDEFM_Cool > CurTime() )
		or not istable( ply.xdefm_Profile ) then return false end
		if CLIENT then
			net.Start( "NET_xdefm_Cmd" )
			net.WriteString( cmd )
			net.WriteString( dat )
			net.SendToServer()
			if GetConVar( "xdefmod_printcmd" ):GetInt() > 0 then
				MsgC( Color( 255, 255, 255 ), "[", Color( 0, 255, 255 ), "xdefmod", Color( 255, 255, 255 ), "]Command: " .. cmd .. " " .. dat .. "\n" )
			end
		else
			ply.XDEFM_Cool = CurTime() + 0.2
			local wep = ply:GetActiveWeapon()
			--local usi = ply:GetNWEntity( "XDEFM_Using" ) -- Unused?
			local hk = hook.Run( "XDEFM_Command", ply, cmd, dat )
			if isbool( hk ) and hk == false then return false end
if cmd == "StructExit" then local usi = ply.xdefm_Struct  if not IsValid( ply.xdefm_Struct ) then return false end
	local _, bb = xdefm_ItemGet(usi)
	if not istable(bb) then return false end
	if bb.ExitSound then usi:EmitSound( bb.ExitSound ) end ply.xdefm_Struct = nil
	if bb.OnInteract then local yes = true
		for k, v in pairs( player.GetHumans() ) do if v.xdefm_Struct == usi then yes = false end end
		if yes then bb:OnInteract( usi, ply, -1 ) end
	end return true
elseif cmd == "Struct" then
	local usi = ply.xdefm_Struct
	if not IsValid(ply.xdefm_Struct) then return false end
	local usi = ply.xdefm_Struct -- FIXME: "usi" shadows existing binding!
	local cls = xdefm_GetClass(usi)
	if ( not xdefm_FriendAllow( ply, usi ) and not xdefm_NadAllow( ply, usi ) ) then return end
	if not isstring( cls ) then return false end local aa, bb = xdefm_ItemGet( cls )  if not istable( bb ) or bb.Type ~= "Struct" then return false end local stp = bb.SType
	if stp == 1 then local ab = string.Explode( "|", dat ) if not istable( ab ) or #ab ~= 2 then return false end
		if isfunction( bb.OnInteract ) and bb:OnInteract( usi, ply, 0, unpack( ab ) ) == false then
		xdefm_AddNote( ply, "!V", "resource/warning.wav", "cross", 5 ) return end
		local aa = tonumber( ab[ 1 ] ) -- FIXME: "aa" shadows existing binding!
		local bb = tonumber( ab[ 2 ] ) -- FIXME: "bb" shadows existing binding!
		if not isnumber( aa ) or not isnumber( bb ) then return false end
		local wep = ply:GetWeapon( "weapon_xdefm_rod" ) -- FIXME: "wep" shadows existing binding!
		if aa == 21 and IsValid( wep ) then
			local rd = wep.FMod_Rod
			--local bb = wep.FMod_Bobber -- REVIEW: Unused?
			local hk = wep.FMod_Hook -- FIXME: "hk" shadows existing binding!
			if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
		end local a1 = ply.xdefm_Profile.Items[ aa ]  local b1 = usi.xdefm_T3[ bb ]
		if not isstring( a1 ) or not isstring( b1 ) or ( a1 == "_" and b1 == "_" ) then return false end
		local _, a3 = xdefm_ItemGet(a1)
		local _, b3 = xdefm_ItemGet(b1)
		if aa == 21 and b3 and istable( b3 ) and b3.Type ~= "Bait" then
		xdefm_AddNote( ply, "xdefm.NotBait& " .. xdefm_ItemMark( b1 ) .. " &xdefm.NotBai2", "resource/warning.wav", "cross", 5 ) return false end
		if ( not istable( a3 ) and not istable( b3 ) ) then return end
		if istable( b3 ) and b3.Type == "Bait" and aa == 21 and b3.Level > ply.xdefm_Profile.Level then	
		xdefm_AddNote( ply, "xdefm.NoLevel", "resource/warning.wav", "cross", 5 ) return false end
		ply.xdefm_Profile.Items[ aa ] = b1  usi.xdefm_T3[ bb ] = a1
		if isstring( b1 ) and b1 ~= "_" then net.Start( "NET_xdefm_BestiaryRecord" ) net.WriteString( xdefm_GetClass( b1 ) ) net.Send( ply ) end xdefm_ProfileUpdate( ply )
		for k, v in pairs( player.GetHumans() ) do if v.xdefm_Struct and v.xdefm_Struct == usi then xdefm_UpdateMenu( v, 3, { [ bb ] = a1 } ) end end return true
	elseif stp == 2 then local slo = bb.Crafts[ tonumber( dat ) ]  if not isstring( slo ) then return false end
		if isfunction(bb.OnInteract) and bb:OnInteract(usi, ply, 0, slo) == false then
			xdefm_AddNote(ply, "!V", "resource/warning.wav", "cross", 5)
			return
		end
		ply.XDEFM_Cool = CurTime() + 0.1
		local ing = string.Explode("&", slo)
		if not istable(ing) or #ing < 2 then return false end
		local wep = ply:GetWeapon( "weapon_xdefm_rod" ) -- FIXME: "wep" shadows existing binding!
		if IsValid( wep ) then
			local rd = wep.FMod_Rod
			--local bb = wep.FMod_Bobber -- REVIEW: Unused?
			local hk = wep.FMod_Hook -- FIXME: "hk" shadows existing binding!
			if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
		end local ite, ned = ply.xdefm_Profile.Items, {}
		for k, v in pairs( ing ) do if k == #ing then break end
			local yes = false
			for m, n in pairs( ite ) do
				if n ~= "_" and ned[ m ] == nil and xdefm_GetClass( n ) == v then
					yes = true  ned[ m ] = 0 break
				end
			end
			if not yes then xdefm_AddNote( ply, "xdefm.NeedMat", "resource/warning.wav", "cross", 5 ) return false end
		end
		for k, v in pairs( ned ) do ply.xdefm_Profile.Items[ k ] = "_" end
		if xdefm_ItemGive( ply, ing[ #ing ], true ) then aa[ 2 ] = tonumber( aa[ 2 ] )
			xdefm_AddNote( ply, "xdefm.Crafted&: &" .. xdefm_ItemMark( ing[ #ing ] ), "buttons/lever7.wav", "wrench", 5 )
			ply.xdefm_Profile.TCraft = isnumber(ply.xdefm_Profile.TCraft) and ply.xdefm_Profile.TCraft + 1 or 0
			xdefm_ProfileUpdate( ply )
		end return true
	elseif stp == 3 then
		local pro = ply.xdefm_Profile  local mon, lvl = ply.xdefm_Profile.Money, ply.xdefm_Profile.Level
		local slo = bb.Shop[ dat ] if not istable( slo ) then return false end
		if isfunction(bb.OnInteract) and bb:OnInteract(usi, ply, 0, dat) == false then
			xdefm_AddNote(ply, "!V", "resource/warning.wav", "cross", 5)
			return
		end
		local prc = math.ceil(slo[1])
		if mon < prc or lvl < slo[2] then return false end
		local slo = 0 -- FIXME: "slo" shadows existing binding!
		for k, v in pairs( pro.Items ) do if v == "_" then slo = k break end end
		if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" and slo == 21 then
			local rd = wep.FMod_Rod
			--local bb = wep.FMod_Bobber -- REVIEW: Unused?
			local hk = wep.FMod_Hook -- FIXME: "hk" shadows existing binding!
			if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end end
		if xdefm_ItemGive(ply, dat) then
			ply.xdefm_Profile.Money = mon - prc
			ply.xdefm_Profile.TBuy = ply.xdefm_Profile.TBuy + 1
			xdefm_ProfileUpdate(ply)
			return true
		end
		end return true
elseif cmd == "StructOuter" then
	local usi = ply.xdefm_Struct
	if not IsValid(ply.xdefm_Struct) then return false end
	local usi = ply.xdefm_Struct -- FIXME: "usi" shadows existing binding!
	local cls = xdefm_GetClass(usi)
	if not isstring(cls) then return false end
	local _, bb = xdefm_ItemGet(cls)
	if not istable(bb) or bb.Type ~= "Struct" then return false end
	local stp = bb.SType
	if stp == 1 then local ab = string.Explode( "|", dat ) if not istable( ab ) or #ab ~= 2 then return false end
		if isfunction(bb.OnInteract) and bb:OnInteract(usi, ply, 0, unpack(ab)) == false then
			xdefm_AddNote(ply, "!V", "resource/warning.wav", "cross", 5)
			return
		end
		local aa = tonumber(ab[1])
		local bb = tonumber(ab[2]) -- FIXME: "bb" shadows existing binding!
		if not isnumber(aa) or not isnumber(bb) then return false end
		local a1 = usi.xdefm_T3[ aa ]  local b1 = usi.xdefm_T3[ bb ]
		if not isstring( a1 ) or not isstring( b1 ) or ( a1 == "_" and b1 == "_" ) then return false end
		usi.xdefm_T3[ aa ] = b1  usi.xdefm_T3[ bb ] = a1
		if isstring( b1 ) and b1 ~= "_" then net.Start( "NET_xdefm_BestiaryRecord" ) net.WriteString( xdefm_GetClass( b1 ) ) net.Send( ply ) end xdefm_ProfileUpdate( ply )
		for k, v in pairs( player.GetHumans() ) do if v.xdefm_Struct and v.xdefm_Struct == usi then xdefm_UpdateMenu( v, 3, { [ bb ] = a1, [ aa ] = b1 } ) end end return true
	end
elseif cmd == "MoveInv" then local ab = string.Explode( "|", dat ) if not istable( ab ) or #ab ~= 2 then return false end
	local aa, bb = tonumber( ab[1] ), tonumber( ab[2] ) if not isnumber( aa ) or not isnumber( bb ) or aa <= 0 or bb <= 0 then return false end
	aa = math.Clamp( math.Round( aa ), 1, 21 )  bb = math.Clamp( math.Round( bb ), 1, 21 )  local inv = ply.xdefm_Profile.Items
	local a1, a2 = inv[ aa ], inv[ bb ]  if a1 == "_" and a2 == "_" or aa == bb or a1 == a2 then return false end
	local c1, t1 = xdefm_ItemGet( a1 )  local c2, t2 = xdefm_ItemGet( a2 )  if not istable( c1 ) and not istable( c2 ) then return false end
	if ( istable( t1 ) and t1.Type ~= "Bait" and bb == 21 ) or ( istable( t2 ) and t2.Type ~= "Bait" and aa == 21 ) then local bai = ""
	if istable( t1 ) and t1.Type ~= "Bait" then bai = a1 elseif istable( t2 ) and t2.Type ~= "Bait" then bai = a2 end
	xdefm_AddNote( ply, "xdefm.NotBait& " .. xdefm_ItemMark( bai ) .. " &xdefm.NotBai2", "resource/warning.wav", "cross", 5 ) return false end
	if istable( t2 ) and t2.Type == "Bait" and aa == 21 and t2.Level > ply.xdefm_Profile.Level then
	xdefm_AddNote( ply, "xdefm.NoLevel", "resource/warning.wav", "cross", 5 ) return false end
	if istable( t1 ) and t1.Type == "Bait" and bb == 21 and t1.Level > ply.xdefm_Profile.Level then
	xdefm_AddNote( ply, "xdefm.NoLevel", "resource/warning.wav", "cross", 5 ) return false end
	local wep = ply:GetWeapon("weapon_xdefm_rod") -- FIXME: "wep" shadows existing binding!
	if (aa == 21 or bb == 21) and IsValid(wep) then
		local rd = wep.FMod_Rod
		--local bb = wep.FMod_Bobber -- REVIEW: Unused?
		local hk = wep.FMod_Hook -- FIXME: "hk" shadows existing binding!
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end ply.xdefm_Profile.Items[ aa ] = a2  ply.xdefm_Profile.Items[ bb ] = a1  xdefm_ProfileUpdate( ply ) return true
elseif cmd == "DestroyInv" then local aa = tonumber( dat )  if not isnumber( aa ) then return false end aa = math.Clamp( math.Round( aa ), 1, 21 )  local inv = ply.xdefm_Profile.Items
	local a1 = inv[aa]
	if not isstring(a1) or a1 == "_" then return false end
	local _, cc = xdefm_ItemGet(a1)
	local prc = xdefm_GetPrice(a1)
	local wep = ply:GetWeapon("weapon_xdefm_rod") -- FIXME: "wep" shadows existing binding!
	if aa == 21 and IsValid(wep) then
		local rd = wep.FMod_Rod
		--local bb = wep.FMod_Bobber -- Review: Unused?
		local hk = wep.FMod_Hook -- FIXME: "hk" shadows existing binding!
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end if istable( cc ) and prc > 0 then xdefm_GiveMoney( ply, prc ) xdefm_AddNote( ply, "xdefm.GetMoney&: " .. prc, "!V", "coins", 5 )
	else xdefm_AddNote( ply, "xdefm.Trashed&: " .. xdefm_ItemMark( a1 ), "physics/cardboard/cardboard_box_impact_bullet1.wav", "bin_empty", 5 ) end
	ply.xdefm_Profile.Items[ aa ] = "_"  xdefm_ProfileUpdate( ply ) return true
elseif cmd == "DropInv" then local aa = tonumber( dat )  if not isnumber( aa ) then return false end aa = math.Clamp( math.Round( aa ), 1, 21 )  local inv = ply.xdefm_Profile.Items
	local a1 = inv[ aa ]  if not isstring( a1 ) or a1 == "_" then return false end
	if not ply:CheckLimit( "xdefmod_items" ) or ( URS and URS.Check( ply, "xdefmod_item", "_" ) == false ) or not ply:IsInWorld() then return false end
	local yes = xdefm_ItemSpawn( a1, ply:WorldSpaceCenter(), Angle( 0, ply:EyeAngles().yaw, 0 ), ply )
	if IsValid(yes) then
		ply.xdefm_Profile.Items[aa] = "_"
		xdefm_ProfileUpdate(ply)
		--local siz = yes:OBBMins():Distance(yes:OBBMaxs()) -- Unused?
		local tr = util.QuickTrace(ply:EyePos(), ply:EyeAngles():Forward() * yes:OBBMins():Distance(yes:OBBMaxs()) * 4, {yes, ply})
		yes:SetPos(tr.HitPos + (tr.Hit and tr.HitNormal or Vector(0, 0, 1)) * math.abs(yes:OBBMins().z - yes:OBBMaxs().z))
	end
	local wep = ply:GetWeapon( "weapon_xdefm_rod" ) -- FIXME: "wep" shadows existing binding!
	if aa == 21 and IsValid( wep ) then
		local rd = wep.FMod_Rod
		--local bb = wep.FMod_Bobber -- REVIEW: Unused?
		local hk = wep.FMod_Hook -- FIXME: "hk" shadows existing binding!
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end
	local aa, bb = xdefm_ItemGet(a1) -- FIXME: "aa" shadows existing binding!
	if istable(aa) and istable(bb) then
		bb:OnPlayerDrop(yes, ply)
		ply:AddCount("xdefmod_items", yes)
	xdefm_AddNote( ply, "xdefm.Dropped&: " .. xdefm_ItemMark( a1 ), "weapons/iceaxe/iceaxe_swing1.wav", "basket_remove", 5 ) end return true
elseif cmd == "Upgrade" then local pro = ply.xdefm_Profile  local skp = pro.Skp  local exp = string.Explode( "|", dat )
	local d1, d2  if istable( exp ) and #exp == 2 then d1, d2 = exp[ 1 ], exp[ 2 ] else d1, d2 = dat, 1 end
	d2 = tonumber( d2 ) if not isnumber( d2 ) or d2 <= 0 then return false end d2 = math.ceil( d2 )
	local maxx = ( d1 == "G" and 5 or 100 )  local max2 = maxx -ply.xdefm_Profile[ "Upd" .. d1 ]  d2 = math.min( max2, d2 )
	if not isnumber( xdefmod.util.UPGRADE_COSTS[ d1 ] ) or ply.xdefm_Profile[ "Upd" .. d1 ] >= maxx or max2 <= 0 then return false end
	local co1 = xdefmod.util.UPGRADE_COSTS[d1]
	local co2 = co1 * d2
	if skp < co2 then d2 = math.floor(skp / co1) end
	if d2 <= 0 then xdefm_AddNote( ply, "xdefm.NoEnoughSkp", "resource/warning.wav", "cross", 5 ) return false end
	co2 = co1 * d2
	if IsValid(wep) and wep:GetClass() == "weapon_xdefm_rod" then
		local rd = wep.FMod_Rod
		--local bb = wep.FMod_Bobber -- REVIEW: Unused?
		local hk = wep.FMod_Hook -- FIXME: "hk" shadows existing binding!
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end
	if d1 == "F" then
		for i = 1, d2 do
			if not isstring(ply.xdefm_Profile["Bnk"][ply.xdefm_Profile["UpdF"] + i]) then ply.xdefm_Profile["Bnk"][ply.xdefm_Profile["UpdF"] + i] = "_" end
		end
	end

	ply.xdefm_Profile["Upd" .. d1] = ply.xdefm_Profile["Upd" .. d1] + d2
	ply.xdefm_Profile[ "Skp" ] = ply.xdefm_Profile[ "Skp" ] -co2  xdefm_ProfileUpdate( ply )
	if d1 == "G" and GetConVar( "xdefmod_nomorehook" ):GetInt() >= 1 then
		xdefm_AddNote( ply, "xdefm.NoMoreHook", "resource/warning.wav", "cross", 5 )
	else
		xdefm_AddNote( ply, "xdefm.Upgraded&: &xdefm.Upd" .. d1, "ui/buttonclick.wav", "lightning_add", 5 )
	end
	if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" and IsValid( wep.FMod_Rod ) then wep.FMod_Rod:Remove() end return true
elseif cmd == "Downgrade" then
	local pro = ply.xdefm_Profile
	--local skp = pro.Skp -- REVIEW: Unused?
	local exp = string.Explode("|", dat)
	local d1, d2  if istable( exp ) and #exp == 2 then d1, d2 = exp[ 1 ], exp[ 2 ] else d1, d2 = dat, 1 end
	d2 = tonumber( d2 ) if not isnumber( d2 ) or d2 <= 0 then return false end d2 = math.ceil( d2 )
	if not isnumber( xdefmod.util.UPGRADE_COSTS[ d1 ] ) or ply.xdefm_Profile[ "Upd" .. d1 ] <= 0 then return false end
	d2 = math.min( ply.xdefm_Profile[ "Upd" .. d1 ], d2 )  local co1 = xdefmod.util.UPGRADE_COSTS[ d1 ]  local co2 = co1*d2
	if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" then
		local rd = wep.FMod_Rod
		--local bb = wep.FMod_Bobber -- REVIEW: Unused?
		local hk = wep.FMod_Hook -- FIXME: "hk" shadows existing binding!
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end ply.xdefm_Profile[ "Upd" .. d1 ] = ply.xdefm_Profile[ "Upd" .. d1 ] -d2
	ply.xdefm_Profile["Skp"] = ply.xdefm_Profile["Skp"] + co2
	xdefm_ProfileUpdate(ply)
	xdefm_AddNote( ply, "xdefm.Downgraded&: &xdefm.Upd" .. d1, "ui/buttonclick.wav", "lightning_delete", 5 )
	if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" and IsValid( wep.FMod_Rod ) then wep.FMod_Rod:Remove() end return true
elseif cmd == "MoveBank" then local sls = ply.xdefm_Profile.Bnk
	local ab = string.Explode( "|", dat ) if not istable( ab ) or #ab ~= 2 then return false end
	local aa, bb = tonumber( ab[ 1 ] ), tonumber( ab[ 2 ] )  if not isnumber( aa ) or not isnumber( bb ) then return false end
	local wep = ply:GetWeapon("weapon_xdefm_rod") -- FIXME: "wep" shadows existing binding!
	if aa == 21 and IsValid( wep ) then
		local rd = wep.FMod_Rod
		--local bb = wep.FMod_Bobber -- REVIEW: Unused?
		local hk = wep.FMod_Hook -- FIXME: "hk" shadows existing binding!
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end local a1 = ply.xdefm_Profile.Items[ aa ]  local b1 = sls[ bb ]
	if not isstring( a1 ) or not isstring( b1 ) or ( a1 == "_" and b1 == "_" ) then return false end
	local _, a3 = xdefm_ItemGet(a1)
	local _, b3 = xdefm_ItemGet(b1)
	if aa == 21 and b3 and istable( b3 ) and b3.Type ~= "Bait" then
	xdefm_AddNote( ply, "xdefm.NotBait& " .. xdefm_ItemMark( b1 ) .. " &xdefm.NotBai2", "resource/warning.wav", "cross", 5 ) return false end
	if ( not istable( a3 ) and not istable( b3 ) ) or bb > ply.xdefm_Profile.UpdF then return end
	if istable( b3 ) and b3.Type == "Bait" and aa == 21 and b3.Level > ply.xdefm_Profile.Level then
	xdefm_AddNote( ply, "xdefm.NoLevel", "resource/warning.wav", "cross", 5 ) return false end
	ply.xdefm_Profile.Items[ aa ] = b1  ply.xdefm_Profile.Bnk[ bb ] = a1
	if isstring( b1 ) and b1 ~= "_" then net.Start( "NET_xdefm_BestiaryRecord" ) net.WriteString( xdefm_GetClass( b1 ) ) net.Send( ply ) end
	xdefm_ProfileUpdate( ply ) return true
elseif cmd == "MoveBankOuter" then local sls = ply.xdefm_Profile.Bnk
	local ab = string.Explode( "|", dat ) if not istable( ab ) or #ab ~= 2 then return false end
	local aa, bb = tonumber( ab[ 1 ] ), tonumber( ab[ 2 ] )  if not isnumber( aa ) or not isnumber( bb ) then return false end
	local a1 = sls[ aa ]  local b1 = sls[ bb ]
	if not isstring( a1 ) or not isstring( b1 ) or ( a1 == "_" and b1 == "_" ) then return false end
	local _, a3 = xdefm_ItemGet(a1)
	local _, b3 = xdefm_ItemGet(b1)
	if ( not istable( a3 ) and not istable( b3 ) ) or aa > ply.xdefm_Profile.UpdF or bb > ply.xdefm_Profile.UpdF then return end
	ply.xdefm_Profile.Bnk[ aa ] = b1  ply.xdefm_Profile.Bnk[ bb ] = a1
	xdefm_ProfileUpdate( ply ) return true
elseif cmd == "MoveTrade" and istable( ply.xdefm_Trade ) then
	local ab = string.Explode( "|", dat ) if not istable( ab ) or #ab ~= 2 then return false end
	local aa, bb = tonumber( ab[ 1 ] ), tonumber( ab[ 2 ] )  if not isnumber( aa ) or not isnumber( bb ) then return false end
	aa = math.Clamp( math.Round( aa ), 1, 21 )  bb = math.Clamp( math.Round( bb ), 1, 10 )
	local a1 = ply.xdefm_Profile.Items[ aa ]  local b1 = ply.xdefm_Trade[ bb ]
	if not isstring( a1 ) or not isstring( b1 ) or ( a1 == "_" and b1 == "_" ) then return false end
	local _, a3 = xdefm_ItemGet(a1)
	local _, b3 = xdefm_ItemGet(b1)
	if not istable(a3) and not istable(b3) then return false end
	local wep = ply:GetWeapon("weapon_xdefm_rod") -- FIXME: "wep" shadows existing binding!
	if aa == 21 and IsValid(wep) then
		local rd = wep.FMod_Rod
		--local bb = wep.FMod_Bobber -- REVIEW: Unused?
		local hk = wep.FMod_Hook -- FIXME: "hk" shadows existing binding!
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end if not ( not istable( a3 ) and istable( b3 ) ) and not ( ply:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() and ply:GetNWEntity( "XDEFMod_TPL" ):GetNWEntity( "XDEFMod_TPL" ) == ply ) then
	xdefm_AddNote( ply, "xdefm.NotTrading", "resource/warning.wav", "cross", 5 ) return false end
	if istable( b3 ) and b3.Type == "Bait" and aa == 21 and b3.Level > ply.xdefm_Profile.Level then
	xdefm_AddNote( ply, "xdefm.NoLevel", "resource/warning.wav", "cross", 5 ) return false end
	ply.xdefm_Profile.Items[ aa ] = b1  ply.xdefm_Trade[ bb ] = a1
	if isstring( b1 ) and b1 ~= "_" then net.Start( "NET_xdefm_BestiaryRecord" ) net.WriteString( xdefm_GetClass( b1 ) ) net.Send( ply ) end
	if ply:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() and ply:GetNWEntity( "XDEFMod_TPL" ):GetNWEntity( "XDEFMod_TPL" ) == ply then
		xdefm_UpdateMenu( ply:GetNWEntity( "XDEFMod_TPL" ), 5, ply.xdefm_Trade )
	end xdefm_ProfileUpdate( ply ) xdefm_UpdateMenu( ply, 4, ply.xdefm_Trade ) return true
elseif cmd == "MoveTradeOuter" and istable( ply.xdefm_Trade ) then
	local ab = string.Explode( "|", dat ) if not istable( ab ) or #ab ~= 2 then return false end
	local aa, bb = tonumber( ab[ 1 ] ), tonumber( ab[ 2 ] )  if not isnumber( aa ) or not isnumber( bb ) then return false end
	aa = math.Clamp( math.Round( aa ), 1, 10 )  bb = math.Clamp( math.Round( bb ), 1, 10 )
	local a1 = ply.xdefm_Trade[ aa ]  local b1 = ply.xdefm_Trade[ bb ]
	if not isstring( a1 ) or not isstring( b1 ) or ( a1 == "_" and b1 == "_" ) then return false end
	local _, a3 = xdefm_ItemGet(a1)
	local _, b3 = xdefm_ItemGet(b1)
	if not istable(a3) and not istable(b3) then return false end
	ply.xdefm_Trade[ aa ] = b1  ply.xdefm_Trade[ bb ] = a1
	if ply:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() and ply:GetNWEntity( "XDEFMod_TPL" ):GetNWEntity( "XDEFMod_TPL" ) == ply then
		xdefm_UpdateMenu( ply:GetNWEntity( "XDEFMod_TPL" ), 5, ply.xdefm_Trade )
	end xdefm_ProfileUpdate( ply ) xdefm_UpdateMenu( ply, 4, ply.xdefm_Trade ) return true
elseif cmd == "TradeMoney" and istable( ply.xdefm_Trade ) then
	local ab = tonumber( dat ) if not isnumber( ab ) or ab < 0 or ab > 2147483647 then return false end
	ab = math.Clamp(math.Round(ab), 0, 2147483647)
	local mn = ply.xdefm_Profile.Money
	--local dl = ply.xdefm_Trade[11] -- REVIEW: Unused?
	ab = ab -ply.xdefm_Trade[ 11 ]  if ab == 0 then return false end
	if ab > 0 then if not ply:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() or ply:GetNWEntity( "XDEFMod_TPL" ):GetNWEntity( "XDEFMod_TPL" ) ~= ply then
		xdefm_AddNote( ply, "xdefm.NotTrading", "resource/warning.wav", "cross", 5 ) return false end
		ab = math.min(mn, ab)
		ply.xdefm_Trade[11] = ply.xdefm_Trade[11] + ab
		ply.xdefm_Profile.Money = ply.xdefm_Profile.Money -ab
		xdefm_ProfileUpdate( ply ) xdefm_UpdateMenu( ply, 4, ply.xdefm_Trade )
		if ply:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() and ply:GetNWEntity( "XDEFMod_TPL" ):GetNWEntity( "XDEFMod_TPL" ) == ply then
			xdefm_UpdateMenu( ply:GetNWEntity( "XDEFMod_TPL" ), 5, ply.xdefm_Trade )
		end
	else ab = math.abs( ab )  ply.xdefm_Trade[ 11 ] = ply.xdefm_Trade[ 11 ] -ab
		ply.xdefm_Profile.Money = ply.xdefm_Profile.Money + ab
		xdefm_ProfileUpdate( ply ) xdefm_UpdateMenu( ply, 4, ply.xdefm_Trade )
		if ply:GetNWEntity( "XDEFMod_TPL" ):IsPlayer() and ply:GetNWEntity( "XDEFMod_TPL" ):GetNWEntity( "XDEFMod_TPL" ) == ply then
			xdefm_UpdateMenu( ply:GetNWEntity( "XDEFMod_TPL" ), 5, ply.xdefm_Trade )
		end
	end return true
elseif cmd == "TradeToggle" and istable( ply.xdefm_Trade ) then local tar = ply:GetNWEntity( "XDEFMod_TPL" )  ply.xdefm_Cool = CurTime() + 0.9
	if not tar:IsPlayer() or tar:GetNWEntity( "XDEFMod_TPL" ) ~= ply then ply:SetNWFloat( "XDEFMod_RTT", 0 )
	else ply:SetNWFloat( "XDEFMod_RTT", ply:GetNWFloat( "XDEFMod_RTT" ) ~= 1 and 1 or 0 ) end local tpl = ply:GetNWEntity( "XDEFMod_TPL" )
	if tpl:IsPlayer() and tpl:GetNWEntity( "XDEFMod_TPL" ) == ply then
		xdefm_UpdateMenu( tpl, 6, { ply:Nick(), ply:SteamID64(), ply:GetNWFloat( "XDEFMod_RTT" ) } )
		xdefm_SendSnd( tpl, "buttons/lightswitch2.wav" ) end return true
elseif cmd == "ResetSkp" then
	ply.xdefm_SkpCool = CurTime() + GetConVar("xdefmod_skpcool"):GetInt() - 0.5
	local pro = ply.xdefm_Profile  local skp = pro.Skp  if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" then
		local rd = wep.FMod_Rod
		--local bb = wep.FMod_Bobber -- REVIEW: Unused?
		local hk = wep.FMod_Hook -- FIXME: "hk" shadows existing binding!
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end
	for k, v in pairs( xdefmod.util.UPGRADE_COSTS ) do
		local pts = pro[ "Upd" .. k ]
		if isnumber( pts ) and pts > 0 then
			skp = skp + v * pts
			ply.xdefm_Profile["Upd" .. k] = 0
		end
	end
	xdefm_AddNote( ply, "xdefm.ClearedP", "buttons/button15.wav", "lightning_go", 5 )
	if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" and IsValid( wep.FMod_Rod ) then wep.FMod_Rod:Remove() end
	ply.xdefm_Profile[ "Skp" ] = skp  xdefm_ProfileUpdate( ply ) return true
elseif cmd == "BuyBait" then
	local pro = ply.xdefm_Profile  local mon, lvl = ply.xdefm_Profile.Money, ply.xdefm_Profile.Level  local slo = xdefmod.shop[ dat ] if not istable( slo ) then return false end
	local prc = math.ceil(slo[1] * slo[3])
	if mon < prc or lvl < slo[2] then return false end
	local slo = 0 -- FIXME: "slo" shadows existing binding!
	for k, v in pairs( pro.Items ) do if v == "_" then slo = k break end end
	if IsValid( wep ) and wep:GetClass() == "weapon_xdefm_rod" and slo == 21 then
		local rd = wep.FMod_Rod
		--local bb = wep.FMod_Bobber -- REVIEW: Unused?
		local hk = wep.FMod_Hook -- FIXME: "hk" shadows existing binding!
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end end
	if xdefm_ItemGive( ply, dat ) then ply.xdefm_Profile.Money = mon -prc
		ply.xdefm_Profile.TBuy = ply.xdefm_Profile.TBuy + 1
		xdefm_ProfileUpdate(ply)
	return true end
elseif cmd == "MoveCraft" then local aa = tonumber( dat )  if not isnumber( aa ) then return end
	local wep = ply:GetWeapon("weapon_xdefm_rod") -- FIXME: "wep" shadows existing binding!
	if aa == 21 and IsValid(wep) then
		local rd = wep.FMod_Rod
		--local bb = wep.FMod_Bobber -- REVIEW: Unused?
		local hk = wep.FMod_Hook -- FIXME: "hk" shadows existing binding!
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end local a1, b1 = ply.xdefm_Profile.Items[ aa ], ply.xdefm_Recipe or "_"
	if not isstring( a1 ) or ( a1 == "_" and b1 == "_" ) then return end
	local _, a3 = xdefm_ItemGet(a1)
	if istable( a3 ) and a3.Type ~= "Recipe" then
		xdefm_AddNote( ply, "xdefm.NotRecipe& " .. xdefm_ItemMark( a1 ) .. " &xdefm.NotRecip2", "resource/warning.wav", "cross", 5 ) return false end
	ply.xdefm_Recipe = a1
	ply.xdefm_Profile.Items[ aa ] = b1
	if isstring( b1 ) and b1 ~= "_" then net.Start( "NET_xdefm_BestiaryRecord" ) net.WriteString( xdefm_GetClass( b1 ) ) net.Send( ply ) end
	xdefm_ProfileUpdate( ply ) xdefm_UpdateMenu( ply, 9, { ply.xdefm_Recipe } ) return true
elseif cmd == "Craft" then
	local ab = tonumber( dat ) if not isnumber( ab ) then return false end local re = ply.xdefm_Recipe or "_"
	local aa, bb = xdefm_ItemGet( re )  if not istable( bb ) or bb.Type ~= "Recipe" or not bb.Crafts or not isstring( bb.Crafts[ ab ] ) then return false end
	ply.XDEFM_Cool = CurTime() + 0.1
	local ing = string.Explode("&", bb.Crafts[ab])
	if not istable(ing) or #ing < 2 then return false end
	local wep = ply:GetWeapon( "weapon_xdefm_rod" ) -- FIXME: "wep" shadows existing binding!
	if IsValid(wep) then
		local rd = wep.FMod_Rod
		--local bb = wep.FMod_Bobber -- REVIEW: Unused?
		local hk = wep.FMod_Hook -- FIXME: "hk" shadows existing binding!
		if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
	end local ite, ned = ply.xdefm_Profile.Items, {}
	for k, v in pairs( ing ) do if k == #ing then break end
		local yes = false
		for m, n in pairs( ite ) do
			if n ~= "_" and ned[m] == nil and xdefm_GetClass(n) == v then
				yes = true  ned[m] = 0
				break
			end
		end
		if not yes then xdefm_AddNote( ply, "xdefm.NeedMat", "resource/warning.wav", "cross", 5 ) return false end
	end
	for k, v in pairs( ned ) do ply.xdefm_Profile.Items[ k ] = "_" end
	if xdefm_ItemGive( ply, ing[ #ing ], true ) then aa[ 2 ] = tonumber( aa[ 2 ] )
		xdefm_AddNote( ply, "xdefm.Crafted&: &" .. xdefm_ItemMark( ing[ #ing ] ), "buttons/lever7.wav", "wrench", 5 )
		ply.xdefm_Profile.TCraft = isnumber(ply.xdefm_Profile.TCraft) and ply.xdefm_Profile.TCraft + 1 or 0
		xdefm_ProfileUpdate( ply )
		if not isnumber( aa[ 2 ] ) or aa[ 2 ] <= 1 then ply.xdefm_Recipe = "_" else ply.xdefm_Recipe = aa[ 1 ] .. "|" .. ( aa[ 2 ] -1 ) end
		xdefm_UpdateMenu( ply, 9, { ply.xdefm_Recipe } )
	end return true
elseif cmd == "Quest" then local dt = ply.xdefm_Quest  if not istable( dt ) or table.IsEmpty( dt ) then return false end
	local rq, rw = ( string.Explode( "&", dt[ 2 ] ) or { dt[ 2 ] } ), ( string.Explode( "&", dt[ 3 ] ) or { dt[ 3 ] } )
	local dl, em, pr, ot = {}, 0, ply.xdefm_Profile.Items, {}
	ply.XDEFM_Cool = CurTime() + 0.5
	local yes = false
	for k, v in pairs( ents.FindInSphere( ply:GetPos(), 512 ) ) do
		if v:GetClass() == "sent_xdefm_quest" or v:GetClass() == "sent_xdefm_darknpc" then yes = true break end
	end if not yes then return false end
	for k, v in pairs( rq ) do
		local yes = false -- FIXME: "yes" shadows existing binding!
		for m, n in pairs( pr ) do
			if m ~= 21 and not dl[ m ] and xdefm_GetClass( n ) == v then
				dl[ m ] = 0
				yes = true
				break
			end
		end if not yes then return false end
	end
	for k, v in pairs( pr ) do
		if k ~= 21 and ( v == "_" or dl[ k ] ) then
			em = em + 1
			table.insert(ot, k)
		end
	end if em < #rw then return false end
	for k, v in pairs( dl ) do ply.xdefm_Profile.Items[ k ] = "_" end
	for k, v in pairs( rw ) do
		ply.xdefm_Profile.Items[ ot[ k ] ] = v
		if v ~= "_" then net.Start( "NET_xdefm_BestiaryRecord" ) net.WriteString( xdefm_GetClass( v ) )
		net.Send( ply ) end
	end
	xdefm_QuestPick( -1, ply ) xdefm_AddNote( ply, "xdefm.Complete", "ui/achievement_earned.wav", "page", 5 )
	ply.xdefm_Profile.TQuest = ply.xdefm_Profile.TQuest and ply.xdefm_Profile.TQuest + 1 or 1
	xdefm_ProfileUpdate( ply ) return true
elseif cmd == "Skip" then local dt = ply.xdefm_Quest  if not istable( dt ) or table.IsEmpty( dt ) then return false end
	if xdefmod.skips[ply:SteamID()] or ply:GetNWFloat("XDEFM_QC") > CurTime() then return false end
	ply.XDEFM_Cool = CurTime() + 0.5
	xdefmod.skips[ ply:SteamID() ] = 0
	local yes = false  for k, v in pairs( ents.FindInSphere( ply:GetPos(), 512 ) ) do
		if v:GetClass() == "sent_xdefm_quest" or v:GetClass() == "sent_xdefm_darknpc" then yes = true break end
	end if not yes then return false end
	ply:SetNWFloat("XDEFM_QC", CurTime() + GetConVar("xdefmod_qsttime"):GetInt() * 60)
	xdefm_QuestPick( -1, ply ) xdefm_AddNote( ply, "xdefm.Skipped", "npc/vort/claw_swing1.wav", "page_red", 5 )
	ply.xdefm_Profile.TQuest = ( ply.xdefm_Profile.TQuest or 0 )
	xdefm_ProfileUpdate( ply ) return true
elseif cmd == "Convert" then if not DarkRP then xdefm_AddNote( ply, "xdefm.NotRP", "resource/warning.wav", "cross", 5 ) return false end
	local ab = string.Explode( "|", dat ) if not istable( ab ) or #ab ~= 2 then return false end
	local aa, bb = tonumber( ab[ 1 ] ), tonumber( ab[ 2 ] )
	if not isnumber( aa ) or not isnumber( bb ) or ( bb ~= 1 and bb ~= 2 ) or aa <= 0 or aa >= 2147483647 then return false end
	if ( bb == 1 and ply.xdefm_Profile.Money < aa ) or ( bb == 2 and not ply:canAfford( aa ) ) then return false end
	local rat = GetConVar( "xdefmod_darkrp" ):GetFloat()
	local num = math.max(bb == 1 and math.floor(aa * rat * 0.99) or math.floor(aa / rat * 0.99), 0)
	if bb == 1 then
		ply.xdefm_Profile.Money = ply.xdefm_Profile.Money -aa
		ply:addMoney( num )
	else
		ply:addMoney( -aa )
		ply.xdefm_Profile.Money = ply.xdefm_Profile.Money + num
	end
	xdefm_AddNote( ply, "xdefm.Exchanged&: " .. ( bb == 1 and "-" or "+" ) .. num, "garrysmod/ui_return.wav", "calculator", 5 )
	xdefm_ProfileUpdate( ply ) return true
elseif cmd == "NPC" then
	local num = tonumber(dat)
	if not isnumber(num) or num < 1 or num > 7 then return false end
	ply.xdefm_Cool = CurTime() + 0.2
	if num == 1 then
		local tak, weps = false, { "inventory", "rod", "trade" }
		for k, v in pairs( weps ) do local www = ( "weapon_xdefm_" .. v )
			if not ply:HasWeapon( www ) then ply:Give( www, true ) tak = true end end
		if tak then ply:EmitSound( "AmmoCrate.Open" ) return true else
		for k, v in pairs( weps ) do local www = ( "weapon_xdefm_" .. v )
			if ply:HasWeapon( www ) then ply:StripWeapon( www ) end end ply:EmitSound( "AmmoCrate.Close" ) return true end
	elseif num == 2 then
		local prc = 0
		local wep = ply:GetWeapon("weapon_xdefm_rod") -- FIXME: "wep" shadows existing binding!
		if aa == 21 and IsValid(wep) then
			local rd = wep.FMod_Rod
			--local bb = wep.FMod_Bobber -- REVIEW: Unused?
			local hk = wep.FMod_Hook -- FIXME: "hk" shadows existing binding!
			if IsValid( rd ) and IsValid( hk ) then xdefm_AddNote( ply, "xdefm.StillFishing", "resource/warning.wav", "cross", 5 ) return false end
		end for k, v in pairs( ply.xdefm_Profile.Items ) do
			prc = prc + xdefm_GetPrice(v)
			ply.xdefm_Profile.Items[k] = "_"
		end if prc > 0 then xdefm_GiveMoney( ply, prc ) xdefm_AddNote( ply, "xdefm.GetMoney&: " .. prc, "!V", "coins", 5 ) end
		xdefm_ProfileUpdate( ply ) return true
	elseif num == 3 then xdefm_OpenMenu( ply, 0, ply.xdefm_Profile ) xdefm_OpenMenu( ply, 5, ply.xdefm_Profile ) return true
	elseif num == 4 then xdefm_OpenMenu( ply, 0, ply.xdefm_Profile ) xdefm_OpenMenu( ply, 9, { ply.xdefm_Recipe or "_" } ) return true
	elseif num == 5 then xdefm_OpenMenu( ply, 8, ply.xdefm_Profile ) return true
	elseif num == 6 then
		if ply:GetNWBool( "XDEFM_QD" ) then xdefm_AddNote( ply, "xdefm.Failed", "resource/warning.wav", "cross", 5 ) return true end local lvl = ( ply.xdefm_Profile.Level or 0 )
		if not istable( ply.xdefm_Quest ) or table.IsEmpty( ply.xdefm_Quest ) then local qst = xdefm_QuestPick( lvl, ply )
		if qst then xdefm_AddNote( ply, "xdefm.QuestSt", "friends/friend_online.wav", "page_add", 5 ) end
		end xdefm_OpenMenu( ply, 1, ply.xdefm_Quest or {} ) xdefm_UpdateMenu( ply, 0, ply.xdefm_Profile ) return true
	elseif num == 7 then
		xdefm_OpenMenu( ply, 2, ply.xdefm_Profile ) return true end return false end
end end
	function xdefm_BreakEffect( ent, typ )
		if not IsEntity( ent ) or not isnumber( typ ) or ent == Entity( 0 ) then return end
		typ = math.max( 0, math.Round( typ ) )
		if SERVER then
			net.Start( "NET_xdefm_BreakEF" )
			net.WriteEntity( ent )
			net.WriteFloat( typ )
			net.Broadcast()
		else
			if not IsValid( ent ) then return end
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
		if not IsValid( ply ) or not istable( ply.xdefm_Profile ) then return end
		amo = isnumber( amo ) and math.Round( amo ) or 0
		if not isbool( add ) then
			add = true
		end
		local def = ply.xdefm_Profile.Money
		if not add then
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
		if not isstring( nam ) or not istable( dat ) then return end
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
			if CLIENT and cmd:GetMouseWheel() ~= 0 then
				xdefmod.util.lfov = math.Clamp( xdefmod.util.lfov -cmd:GetMouseWheel()/10, 0.25, 5 )
			end
		end
		if SERVER and IsValid( ply ) then
			if IsValid( ply.xdefm_Struct ) and ply.xdefm_Struct:GetClass() == "xdefm_base" and ply:GetPos():Distance( ply.xdefm_Struct:GetPos() ) > 300 then local usi = ply.xdefm_Struct
				xdefm_CloseMenu( v, "Struct" )
			end
			if ply:GetNWFloat( "XDEFM_QC" ) > 0 and ply:GetNWFloat( "XDEFM_QC" ) <= CurTime() then
				ply:SetNWFloat( "XDEFM_QC", 0 ) ply:SetNWBool( "XDEFM_QD", false ) xdefmod.skips[ ply:SteamID() ] = nil
			end
			local usi, usn = ply:GetNWEntity( "XDEFM_Using" ), ply.xdefm_Using
			local trd = ply:GetNWEntity( "XDEFMod_TPL" )
			if IsValid( trd ) and trd:IsPlayer() and trd:Alive() and trd:HasWeapon( "weapon_xdefm_trade" ) and trd:GetNWEntity( "XDEFMod_TPL" ) == ply and
			trd:WorldSpaceCenter():DistToSqr( ply:WorldSpaceCenter() ) < 70000 and ply:HasWeapon( "weapon_xdefm_trade" ) and not ply:GetNWBool( "XDEFMod_BTD" ) and not trd:GetNWBool( "XDEFMod_BTD" ) then
				if not ply.xdefm_HasTPL then
					ply.xdefm_HasTPL = true
					xdefm_UpdateMenu( ply, 6, { trd:Nick(), trd:SteamID64(), false } )
					xdefm_AddNote( ply, "xdefm.Trade15&" .. trd:Nick() .. "&xdefm.Trade16", "garrysmod/content_downloaded.wav", "arrow_refresh", 5 )
					if not istable( ply.xdefm_Trade ) then ply.xdefm_Trade = { "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", 0 } end
					if not istable( trd.xdefm_Trade ) then trd.xdefm_Trade = { "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", 0 } end
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
		if IsValid( tr.Entity ) and ( tr.Entity:GetNWString( "xdefm_Data" ) ~= "" or string.find( tr.Entity:GetClass():lower(), "xdefm_" ) ) then
			return true
		end
	end )
	hook.Add( "PlayerButtonDown", "xdefm_QuickInv", function( ply, key )
		if ( CLIENT or game.SinglePlayer() ) and key == GetConVar( "xdefmod_quickinv" ):GetInt() then
			xdefm_ConsoleCmd( "xdefmod_openinv", {}, ply )
		end
	end )
end

concommand.Add("xdefmod_note", function(ply, cmd, var) xdefm_ConsoleCmd(cmd, var, ply) end)
concommand.Add("xdefmod_give", function(ply, cmd, var) xdefm_ConsoleCmd(cmd, var, ply) end)
concommand.Add("xdefmod_spawn", function(ply, cmd, var) xdefm_ConsoleCmd(cmd, var, ply) end)
concommand.Add("xdefmod_firespot", function(ply, cmd, var) xdefm_ConsoleCmd(cmd, var, ply) end)
concommand.Add("xdefmod_openinv", function(ply, cmd, var) xdefm_ConsoleCmd(cmd, {}, ply) end)
concommand.Add("xdefmod_openbnk", function(ply, cmd, var) xdefm_ConsoleCmd(cmd, {}, ply) end)
concommand.Add("xdefmod_openfri", function(ply, cmd, var) xdefm_ConsoleCmd(cmd, {}, ply) end)
concommand.Add("xdefmod_opentrd", function(ply, cmd, var) xdefm_ConsoleCmd(cmd, {}, ply) end)
concommand.Add("xdefmod_openbes", function(ply, cmd, var) xdefm_ConsoleCmd(cmd, {}, ply) end)
concommand.Add("xdefmod_opencft", function(ply, cmd, var) xdefm_ConsoleCmd(cmd, {}, ply) end)
concommand.Add("xdefmod_opendrp", function(ply, cmd, var) xdefm_ConsoleCmd(cmd, {}, ply) end)
concommand.Add("xdefmod_collectall", function(ply, cmd, var) xdefm_ConsoleCmd(cmd, {}, ply) end, nil, nil, FCVAR_PROTECTED)
concommand.Add("xdefmod_collectclear", function(ply, cmd, var) xdefm_ConsoleCmd(cmd, {}, ply) end, nil, nil, FCVAR_PROTECTED)

concommand.Add("xdefmod_count", function(ply, cmd, var)
	local num = 0
	for k, v in pairs(xdefmod.items) do
		num = num + 1
	end

	print(num)
end)

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
		local Mag = data:GetMagnitude() if not istable( Gibs[ tostring( Mag ) ] ) then return end local gg = Gibs[ tostring( Mag ) ]
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
	function EFFECT:Think() if not self.xdefm_Allow then return false end local own = self.Entity
		if self.LifeTime < CurTime() then  self.LifeAlp = Lerp( 0.05, self.LifeAlp, 0 )
			self.Entity:SetColor( Color( own:GetColor().r, own:GetColor().g, own:GetColor().b, self.LifeAlp ) )
			if self.LifeAlp <= 1 then return false end
		end return true
	end
	function EFFECT:Render() if self.xdefm_Allow then self.Entity:DrawModel() end end
	effects.Register( EFFECT, "xdefm_gib" )
end

if true then -- xdefm_base
	local ENT = {}  ENT.Base = "base_anim"  ENT.PrintName = ""  ENT.Spawnable = false  ENT.xdefm_Hold = {}
	ENT.RenderGroup = RENDERGROUP_BOTH  ENT.Owner = nil  ENT.xdefm_T1 = {}  ENT.xdefm_T2 = {}  ENT.xdefm_OnLook = false  ENT.xdefm_Cur = 0
	function ENT:SetupDataTables() self:NetworkVar( "Entity", 0, "FMod_OW" ) self:NetworkVar( "String", 0, "FMod_OI" )
	self:NetworkVar( "String", 1, "FMod_DT" ) self:NetworkVar( "Entity", 1, "FMod_LU" ) end
	function ENT:Initialize() if not SERVER then return end self:SetCollisionGroup( COLLISION_GROUP_NONE ) self:SetUseType( SIMPLE_USE )
		if not isstring( self:GetFMod_DT() ) or self:GetFMod_DT() == "" then self:Remove() return end
		local aa, bb = xdefm_ItemGet( self:GetFMod_DT() )  if not istable( aa ) or not istable( bb ) then self:Remove() return end
		self.xdefm_T1 = aa  self.xdefm_T2 = bb  local tab = string.Explode( "|", self:GetFMod_DT() )
		if bb.Type == "Creature" and isnumber( bb.MinSize ) and isnumber( bb.MaxSize ) and ( not istable( tab ) or #tab < 2 or tab[ 2 ] == 0 ) then
			local siz = math.Round( math.Rand( bb.MinSize, bb.MaxSize ), 1 ) if not istable( tab ) then tab = { self:GetFMod_DT() } end
			table.insert( tab, 2, siz ) self:SetFMod_DT( table.concat( tab, "|" ) )
		elseif bb.Type == "Recipe" and isnumber( bb.Durability ) and ( not istable( tab ) or #tab < 2 or tab[ 2 ] == 0 ) then
			local dur = math.ceil( math.Rand( bb.Durability/2, bb.Durability ) ) if not istable( tab ) then tab = { self:GetFMod_DT() } end
			table.insert( tab, 2, dur ) self:SetFMod_DT( table.concat( tab, "|" ) )
		elseif bb.Type == "Struct" and bb.SType == 1 and bb.Amount > 0 then self.xdefm_T3 = {}
			for i=1, bb.Amount do self.xdefm_T3[ i ] = "_" end
		end local tab = string.Explode( "|", self:GetFMod_DT() )
		if bb.Type ~= "Bait" and ( not istable( tab ) or #tab ~= xdefmod.util.ITEM_TYPES[ bb.Type ] ) then self:SetFMod_DT( self:GetFMod_DT() .. "|0" ) end
		if bb.Type == "Creature" and istable( tab ) and isnumber( tonumber( tab[ 2 ] ) ) then self:SetModelScale( tonumber( tab[ 2 ] ), 0.01 ) end
		if isstring( self.xdefm_Mdl ) then self:SetModel( self.xdefm_Mdl ) else
		self:SetModel( bb.Model[ math.random( #bb.Model ) ] ) end local ovrd = self.xdefm_T2:OnInit( self )
		if not ovrd then self:PhysicsInit( SOLID_VPHYSICS ) self:SetMoveType( MOVETYPE_VPHYSICS )
			self:SetRenderMode( RENDERMODE_TRANSCOLOR )  if IsValid( self:GetPhysicsObject() ) then self:GetPhysicsObject():Wake()
				self:GetPhysicsObject():AddGameFlag( FVPHYSICS_NO_IMPACT_DMG )
				self:GetPhysicsObject():AddGameFlag( FVPHYSICS_NO_NPC_IMPACT_DMG ) end
		end timer.Simple( 0.1, function() if IsValid( self ) then bb:OnReady( self ) end end ) self:Activate()
	end
	function ENT:HandleAnimEvent() return true end
	function ENT:OnRemove() if CLIENT or not istable( self.xdefm_T2 ) then return end self.xdefm_T2:OnRemove( self )
		if self.xdefm_T2.Type == "Struct" then
			for k, v in pairs( player.GetHumans() ) do if v.xdefm_Struct == self then xdefm_CloseMenu( v, "Struct" ) end end
		end
	end
	function ENT:OnDuplicated() SafeRemoveEntity( self ) end
	function ENT:OnRestore() if SERVER then SafeRemoveEntity( self ) end end
	function ENT:OnTakeDamage( dmg ) if not istable( self.xdefm_T2 ) or dmg:GetDamage() <= 0 then return end local aa, bb = xdefm_ItemGet( self:GetFMod_DT() )
		local yes = self.xdefm_T2:OnDamaged( self, dmg ) if not isbool( yes ) or yes == true then self:TakePhysicsDamage( dmg ) end
	end
	function ENT:TurnToDummy() if CLIENT then return nil end
		local dum = ents.Create( "xdefm_dummy" )  dum:SetModel( self:GetModel() )
		dum:SetAngles( self:GetAngles() ) dum:SetPos( self:GetPos() ) dum:SetFMod_DT( self:GetFMod_DT() ) dum:Spawn() dum:Activate()
		self.OnRemove = function() end dum:SetFMod_OW( self:GetFMod_OW() ) dum:SetFMod_OI( self:GetFMod_OI() )
		SafeRemoveEntity( self ) return dum
	end
	function ENT:Use( ent ) if not IsValid( ent ) or not istable( self.xdefm_T2 ) or not ent:IsPlayer() or ent:KeyDown( IN_RELOAD ) then return end local owi = self:GetFMod_OI()
		if not xdefm_CanInteract( ent, self ) or ( not xdefm_FriendAllow( ent, owi ) and not xdefm_NadAllow( ent, self ) ) then return end
		if self.xdefm_T2.Type == "Struct" and self.xdefm_T2.SType ~= 0 and not ent:IsBot() then
			local act = self.xdefm_T2.OnInteract and self.xdefm_T2:OnInteract( self, ent, 1 ) or nil
			if act == false or IsValid( ent.xdefm_Struct ) then return end local ttt, dat = self.xdefm_T2.SType, {}
			if not ent:KeyDown( IN_SPEED ) then
				if ttt == 1 then dat = { xdefm_GetClass( self ), unpack( self.xdefm_T3 ) } else dat = { xdefm_GetClass( self ) } end
				xdefm_OpenMenu( ent, 0, ent.xdefm_Profile ) xdefm_OpenMenu( ent, 4, dat ) ent.xdefm_Struct = self
				if self.xdefm_T2.StartSound then self:EmitSound( self.xdefm_T2.StartSound ) end if act ~= true then return end
			end
		end
		local use = self.xdefm_T2:OnUse( self, ent )  local typ = self.xdefm_T2.Type
		if ( not isbool( use ) or use ~= false ) and not ent:IsPlayerHolding() then
			if not constraint.FindConstraint( self, "Weld" ) and IsValid( self:GetPhysicsObject() ) and not self:IsPlayerHolding()
			and self:GetPhysicsObject():IsMotionEnabled() and ( not ent.xdefm_Cool or ent.xdefm_Cool <= CurTime() ) then ent:PickupObject( self ) end
		end
	end
	function ENT:StartTouch( ent ) if not IsValid( ent ) or not istable( self.xdefm_T2 ) then return end local tab = self.xdefm_T2
		tab:OnTouch( self, ent, 1 )
	end
	function ENT:Touch( ent ) if not IsValid( ent ) or not istable( self.xdefm_T2 ) then return end
		if ent:GetClass() == "xdefm_base" and not xdefm_FriendAllow( ent:GetFMod_OW(), self:GetFMod_OI() ) and not xdefm_NadAllow( ent:GetFMod_OW(), self ) then return end
		self.xdefm_T2:OnTouch( self, ent, 0 )
	end
	function ENT:EndTouch( ent ) if not IsValid( ent ) or not istable( self.xdefm_T2 ) then return end
		self.xdefm_T2:OnTouch( self, ent, -1 )
	end
	function ENT:PhysicsCollide( dat, phy ) if not istable( self.xdefm_T2 ) or not IsValid( self:GetPhysicsObject() ) then return end
		local col = self.xdefm_T2:OnCollide( self, dat )  if isbool( col ) and col == false then return end
		if isstring( self.xdefm_T2.PhysSound ) and dat.Speed >= 60 and dat.DeltaTime > 0.2 then
			self:StopSound( self.xdefm_T2.PhysSound ) self:EmitSound( self.xdefm_T2.PhysSound )
		end
	end
	function ENT:PhysicsSimulate( phy, del ) if not istable( self.xdefm_T2 ) then return end
		self.xdefm_T2:OnPhysSimulate( self, phy, del )
	end
	function ENT:Think() if not istable( self.xdefm_T2 ) then return end
		if CLIENT then local ply = LocalPlayer()  self:NextThink( CurTime() +0.1 )  if not IsValid( ply ) then return end
			self:NextThink( CurTime() +0.1 )
			if self.xdefm_OnLook ~= self:BeingLookedAtByLocalPlayer() then
				self.xdefm_OnLook = self:BeingLookedAtByLocalPlayer()
				self.xdefm_Cur = SysTime() +0.25
			end
			local aa, bb = xdefm_ItemGet( self:GetFMod_DT() )
			if istable( bb ) and self.xdefm_OnLook or self.xdefm_Cur > SysTime() then
				local alp = math.Clamp( ( self.xdefm_Cur -SysTime() )/0.25, 0, 1 )
				if self.xdefm_OnLook then alp = 1-alp end
				local col = xdefmod.util.RARITY_COLORS[ bb.Rarity+1 ]
				halo.Add( { self }, Color( col.r, col.g, col.b, 255*alp ), 2*alp, 2*alp, 2*alp, true, true )
			end
		else self.xdefm_T2:OnThink( self ) self:NextThink( CurTime() +self.xdefm_T2.TickRate ) local tab = self.xdefm_T2 end
		return true
	end
	if CLIENT then local Mat = Material( "models/shiny" )
		function ENT:Draw() if isstring( self:GetFMod_DT() ) and self:GetFMod_DT() ~= "" and self:GetFMod_DT() ~= "_" then
			local aa, bb = xdefm_ItemGet( self:GetFMod_DT() ) if istable( bb ) then local dis = GetConVar( "xdefmod_renderdist" ):GetInt()
			local ply, wep = LocalPlayer(), LocalPlayer():GetActiveWeapon()
			if not IsValid( LocalPlayer() ) or dis <= 0 or LocalPlayer():GetPos():DistToSqr( self:GetPos() ) <= dis^2 then self:DrawModel()
			if bb.Type ~= "Bait" and not bb.CantCook then local me2, per = xdefm_CookMeter( self:GetFMod_DT() ), 0
				if me2 > 0 then render.SetColorModulation( 1, 1, 0 ) per = me2*0.4 elseif me2 < 0 then per = 0.4 +math.abs( me2 )*0.5
					local aaa = math.abs( 1 +me2 ) render.SetColorModulation( aaa, aaa, 0 )
				end if per > 0 then render.SetBlend( per ) render.MaterialOverride( Mat )
				self:DrawModel() render.SetBlend( 1 ) render.MaterialOverride() render.SetColorModulation( 1, 1, 1 ) end
			end bb:OnDraw( self ) end
		end end end
		function ENT:BeingLookedAtByLocalPlayer() local ply = LocalPlayer() if not IsValid( ply ) or not ply:Alive() then return false end
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
	function ENT:Initialize() if not SERVER then return end
		if not isstring( self:GetFMod_DT() ) or self:GetFMod_DT() == "" then self:Remove() return end
		local aa, bb = xdefm_ItemGet( self:GetFMod_DT() )  if not istable( aa ) or not istable( bb ) then self:Remove() return end
		self.xdefm_T1 = aa  self.xdefm_T2 = bb  local tab = string.Explode( "|", self:GetFMod_DT() )
		if bb.Type == "Creature" and isnumber( bb.MinSize ) and isnumber( bb.MaxSize ) and ( not istable( tab ) or #tab < 2 or tab[ 2 ] == 0 ) then
			local siz = math.Round( math.Rand( bb.MinSize, bb.MaxSize ), 1 ) if not istable( tab ) then tab = { self:GetFMod_DT() } end
			table.insert( tab, 2, siz ) self:SetFMod_DT( table.concat( tab, "|" ) )
		elseif bb.Type == "Recipe" and isnumber( bb.Durability ) and ( not istable( tab ) or #tab < 2 or tab[ 2 ] == 0 ) then
			local dur = math.ceil( math.Rand( bb.Durability/2, bb.Durability ) ) if not istable( tab ) then tab = { self:GetFMod_DT() } end
			table.insert( tab, 2, dur ) self:SetFMod_DT( table.concat( tab, "|" ) )
		elseif bb.Type == "Struct" and bb.SType == 1 and bb.Amount > 0 then self.xdefm_T3 = {}
			for i=1, bb.Amount do self.xdefm_T3[ i ] = "_" end
		end local tab = string.Explode( "|", self:GetFMod_DT() )
		if bb.Type ~= "Bait" and ( not istable( tab ) or #tab ~= xdefmod.util.ITEM_TYPES[ bb.Type ] ) then self:SetFMod_DT( self:GetFMod_DT() .. "|0" ) end
		if bb.Type == "Creature" and istable( tab ) and isnumber( tonumber( tab[ 2 ] ) ) then self:SetModelScale( tonumber( tab[ 2 ] ), 0.01 ) end
		self:SetNotSolid( true ) self:Activate()
	end
	function ENT:OnDuplicated() SafeRemoveEntity( self ) end
	function ENT:OnRestore() if SERVER then SafeRemoveEntity( self ) end end
	function ENT:Think() if CLIENT then return end if not istable( self.xdefm_T2 ) then self:Remove() return false end
		if not self:IsInWorld() then self:Remove() return false end self:NextThink( CurTime() +0.1 ) return true
	end
	function ENT:TurnToItem()
		local ite = xdefm_ItemSpawn( self:GetFMod_DT(), self:GetPos(), self:GetAngles(), own, self:GetModel() )
		if IsValid( ite ) then ite:SetFMod_OW( self:GetFMod_OW() ) ite:SetFMod_OI( self:GetFMod_OI() )
			if NADMOD and self:GetFMod_OW():IsPlayer() then NADMOD.PlayerMakePropOwner( self:GetFMod_OW(), ent ) end
			ite:SetNWEntity( "Owner", self:GetFMod_OW() )  ite.Owner = self:GetFMod_OW()
			self:Remove() return ite end self:Remove()
	end
	if CLIENT then local Mat = Material( "models/shiny" )
		function ENT:Draw() if isstring( self:GetFMod_DT() ) and self:GetFMod_DT() ~= "" and self:GetFMod_DT() ~= "_" then
			local aa, bb = xdefm_ItemGet( self:GetFMod_DT() ) if istable( bb ) then local dis = GetConVar( "xdefmod_renderdist" ):GetInt()
			local ply, wep = LocalPlayer(), LocalPlayer():GetActiveWeapon()  self:DrawModel()
			if not IsValid( LocalPlayer() ) or dis <= 0 or LocalPlayer():GetPos():DistToSqr( self:GetPos() ) <= dis^2 then
			if bb.Type ~= "Bait" and not bb.CantCook then local me2, per = xdefm_CookMeter( self:GetFMod_DT() ), 0
				if me2 > 0 then render.SetColorModulation( 1, 1, 0 ) per = me2*0.4 elseif me2 < 0 then per = 0.4 +math.abs( me2 )*0.5
					local aaa = math.abs( 1 +me2 ) render.SetColorModulation( aaa, aaa, 0 )
				end if per > 0 then render.SetBlend( per ) render.MaterialOverride( Mat )
				self:DrawModel() render.SetBlend( 1 ) render.MaterialOverride() render.SetColorModulation( 1, 1, 1 ) end
			end bb:OnDraw( self ) end
		end end end
		function ENT:BeingLookedAtByLocalPlayer() local ply = LocalPlayer() if not IsValid( ply ) or not ply:Alive() then return false end
			local view = ply:GetViewEntity()  local dist = math.Clamp( math.ceil( GetConVar( "xdefmod_tagdist" ):GetInt() )^2, -1, 2147483647 )
			if view:IsPlayer() then return ( ( view:EyePos():DistToSqr( self:GetPos() ) <= dist or dist == -1 ) and view:GetEyeTrace().Entity == self ) end return false
		end
	end
	scripted_ents.Register( ENT, "xdefm_dummy" ) end
if true then -- xdefm_firespot
	local ENT = {}  ENT.Base = "base_anim"  ENT.PrintName = ""  ENT.Spawnable = false
	ENT.RenderGroup = RENDERGROUP_TRANSLUCENT  ENT.xdefm_NextBurn = 0  ENT.xdefm_Power = -1
	function ENT:SetupDataTables() self:NetworkVar( "Bool", 0, "FMod_Enable" ) self:NetworkVar( "Float", 0, "FMod_Strength" ) end
	function ENT:Initialize() if not SERVER then return end self:SetModel( "models/hunter/plates/plate.mdl" )
		self:SetNotSolid( true ) self:SetFMod_Enable( false ) self:SetMoveType( MOVETYPE_NONE )
		self:DrawShadow( false ) self:SetFMod_Strength( 5 ) self:Activate()
	end
	function ENT:OnDuplicated() SafeRemoveEntity( self ) end
	function ENT:OnRestore() if SERVER then SafeRemoveEntity( self ) end end
	function ENT:OnTakeDamage( dmg ) end function ENT:Use( ent ) end
	function ENT:Think() if CLIENT or not self:GetFMod_Enable() then return end self:NextThink( CurTime() +0.1 )
		if self.xdefm_NextBurn <= CurTime() and self.xdefm_Power > 0 then self.xdefm_NextBurn = CurTime() +math.Rand( 0.1, 0.5 )
			local own = ( IsValid( self:GetParent() ) and self:GetParent() or Entity( 0 ) )
			local siz = math.Clamp( self:GetFMod_Strength(), 1, 100 )  local tr = util.TraceHull( {
				start = self:WorldSpaceCenter() +Vector( 0, 0, siz ), endpos = self:WorldSpaceCenter() +Vector( 0, 0, siz*3 ),
				filter = { own, self }, mask = MASK_SHOT, mins = Vector( -siz, -siz, -siz ), maxs = Vector( siz, siz, siz )
			} ) local ent = tr.Entity  if IsValid( ent ) and not ent:IsWorld() and util.IsValidModel( ent:GetModel() ) then
				if ent:GetClass() ~= "xdefm_base" or not istable( ent.xdefm_T2 ) or ent.xdefm_T2.Type == "Bait" or ent:Health() > 0 then
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
			if not ( not IsValid( LocalPlayer() ) or dis <= 0 or LocalPlayer():GetPos():DistToSqr( self:GetPos() ) <= dis^2 ) then return end
			if GetConVar( "developer" ):GetInt() > 0 then
				cam.IgnoreZ( true ) render.SetMaterial( Mat2 )
				render.DrawBox( self:GetPos(), self:GetAngles(), self:OBBMins(), self:OBBMaxs(), Color( 255, 255, 0 ) )
				render.DrawBox( self:GetPos(), self:GetAngles(), self:OBBMaxs(), self:OBBMins(), Color( 255, 255, 0 ) )
				cam.IgnoreZ( false )
			end
			if self.xdefm_Emitter == nil then self.xdefm_Emitter = ParticleEmitter( self:WorldSpaceCenter() ) end
			if self.xdefm_Emitter ~= nil and self:GetFMod_Enable() and self:GetFMod_Strength() > 0 then
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
				local particle = emt:Add( "effects/fire_cloud" .. math.random( 1, 2 ), self:WorldSpaceCenter() )
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
				local particle = emt:Add( "particle/smokesprites_000" .. math.random( 1, 9 ), self:WorldSpaceCenter() +VectorRand():GetNormal()*siz/2 )
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
local fil, dir = file.Find( "xdefishmod/*.lua", "LUA" ) if not fil or not dir then return end
for _, out in pairs( fil ) do if SERVER then AddCSLuaFile( "xdefishmod/" .. out ) end include( "xdefishmod/" .. out ) end
if SERVER then xdefm_UpdateShop() end