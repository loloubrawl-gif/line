local API = "https://line.pastebdn.workers.dev"
local HttpService = game:GetService("HttpService")
local ENV = (typeof(getgenv) == "function" and getgenv()) or _G

local CATALOG = {
    { id = "99-nights-in-the-forest", name = "99 Nights in the Forest", file = "line-99-nights.lua", cover = "/games/line-99-nights.jpg", placeId = 79546208627805 },
    { id = "backrooms-company", name = "Backrooms Company", file = "line-backrooms-company.lua", cover = "/games/line-backrooms-company.jpg", placeId = 109423220190564 },
    { id = "beat-the-anime-boss", name = "Beat the Anime Boss", file = "line-beat-the-anime-boss.lua", cover = "/games/line-beat-the-anime-boss.jpg", placeId = 129216769649527 },
    { id = "blue-lock-farm", name = "Blue Lock Farm", file = "line-blue-lock-farm.lua", cover = "/games/line-blue-lock-farm.jpg", placeId = 132767904294856 },
    { id = "break-and-steal-an-egg", name = "Break and Steal an Egg", file = "line-break-and-steal-an-egg.lua", cover = "/games/line-break-and-steal-an-egg.jpg", placeId = 114326934417838 },
    { id = "build-an-ant-empire", name = "Build an Ant Empire", file = "line-build-an-ant-empire.lua", cover = "/games/line-build-an-ant-empire.jpg", placeId = 78490532994307 },
    { id = "carry-heavy-eggs", name = "Carry Heavy Eggs!", file = "line-carry-heavy-eggs.lua", cover = "/games/line-carry-heavy-eggs.jpg", placeId = 75007966543940 },
    { id = "catch-dragons-to-defend", name = "Catch Dragons To Defend", file = "line-catch-dragons-to-defend.lua", cover = "/games/line-catch-dragons-to-defend.jpg", placeId = 102392235728099 },
    { id = "clicker-simulator", name = "Clicker Simulator", file = "line-clicker-simulator.lua", cover = "/games/line-clicker-simulator.jpg", placeId = 134719268825886 },
    { id = "clone-to-steal-eggs", name = "Clone to Steal Eggs", file = "line-clone-to-steal-eggs.lua", cover = "/games/line-clone-to-steal-eggs.jpg", placeId = 76943966208523 },
    { id = "dangerous-night", name = "Dangerous Night", file = "line-dangerous-night.lua", cover = "/games/line-dangerous-night.jpg", placeId = 109686116036889 },
    { id = "deadly-delivery", name = "Deadly Delivery", file = "line-deadly-delivery.lua", cover = "/games/line-deadly-delivery.jpg", placeId = 125810438250765 },
    { id = "deep-fishing", name = "Deep Fishing", file = "line-deep-fishing.lua", cover = "/games/line-deep-fishing.jpg", placeId = 132239307080610 },
    { id = "defeat-anime-rng", name = "Defeat Anime RNG", file = "line-defeat-anime-rng.lua", cover = "/games/line-defeat-anime-rng.jpg", placeId = 92606991708989 },
    { id = "dig-into-secrets", name = "Dig Into Secrets", file = "line-dig-into-secrets.lua", cover = "/games/line-dig-into-secrets.jpg", placeId = 119409763193569 },
    { id = "drill-to-earth", name = "Drill to Earth", file = "line-drill-to-earth.lua", cover = "/games/line-drill-to-earth.jpg", placeId = 101906032112547 },
    { id = "dungeon-lootr", name = "Dungeon Lootr", file = "line-dungeon-lootr.lua", cover = "/games/line-dungeon-lootr.jpg", placeId = 106484206883664 },
    { id = "dungeon-quest-reborn", name = "Dungeon Quest Reborn", file = "line-dungeon-quest-reborn.lua", cover = "/games/line-dungeon-quest-reborn.jpg", placeId = 77649408247578 },
    { id = "dungeons-tower", name = "Dungeons Tower", file = "line-dungeons-tower.lua", cover = "/games/line-dungeons-tower.jpg", placeId = 130406461202376 },
    { id = "evade", name = "Evade", file = "line-evade.lua", cover = "/games/line-evade.jpg", placeId = 9872472334 },
    { id = "farm-industry", name = "Farm Industry", file = "line-farm-industry.lua", cover = "/games/line-farm-industry.jpg", placeId = 78602687536170 },
    { id = "fish-an-anime-rng", name = "Fish an Anime RNG", file = "line-fish-an-anime-rng.lua", cover = "/games/line-fish-an-anime-rng.jpg", placeId = 74729868188364 },
    { id = "fish-on", name = "Fish On", file = "line-fish-on.lua", cover = "/games/line-fish-on.jpg", placeId = 111189697641017 },
    { id = "flower-shop", name = "Flower Shop", file = "line-flower-shop.lua", cover = "/games/line-flower-shop.jpg", placeId = 93028168925975 },
    { id = "forest-market", name = "Forest Market", file = "line-forest-market.lua", cover = "/games/line-forest-market.jpg", placeId = 108679402300081 },
    { id = "heavyweight-fishing", name = "Heavyweight Fishing", file = "line-heavyweight-fishing.lua", cover = "/games/line-heavyweight-fishing.jpg", placeId = 98502499119821 },
    { id = "hellhole", name = "Hellhole", file = "line-hellhole.lua", cover = "/games/line-hellhole.jpg", placeId = 84568117169118 },
    { id = "idle-mafia", name = "Idle Mafia", file = "line-idle-mafia.lua", cover = "/games/line-idle-mafia.jpg", placeId = 73897506680154 },
    { id = "loot-up", name = "Loot Up!", file = "line-loot-up.lua", cover = "/games/line-loot-up.jpg", placeId = 83622406313819 },
    { id = "mine-antarctica", name = "Mine Antarctica", file = "line-mine-antarctica.lua", cover = "/games/line-mine-antarctica.jpg", placeId = 138686218420016 },
    { id = "mine-it", name = "Mine It", file = "line-mine-it.lua", cover = "/games/line-mine-it.jpg", placeId = 92345193036001 },
    { id = "mrbeast-island-escape", name = "MrBeast Island Escape", file = "line-mrbeast-island-escape.lua", cover = "/games/line-mrbeast-island-escape.jpg", placeId = 108645230905176 },
    { id = "pack-a-brainrot-card", name = "Pack A Brainrot Card", file = "line-pack-a-brainrot-card.lua", cover = "/games/line-pack-a-brainrot-card.jpg", placeId = 72854704512765 },
    { id = "pets-universe", name = "Pets Universe!", file = "line-pets-universe.lua", cover = "/games/line-pets-universe.jpg", placeId = 74629631798007 },
    { id = "poly-loot", name = "Poly Loot", file = "line-poly-loot.lua", cover = "/games/line-poly-loot.jpg", placeId = 124032631078772 },
    { id = "pop-collect", name = "Pop & Collect", file = "line-pop-collect.lua", cover = "/games/line-pop-collect.jpg", placeId = 72390882197205 },
    { id = "pull-a-sword", name = "Pull A Sword", file = "line-pull-a-sword.lua", cover = "/games/line-pull-a-sword.jpg", placeId = 13827198708 },
    { id = "race-horses", name = "Race Horses", file = "line-race-horses.lua", cover = "/games/line-race-horses.jpg", placeId = 79475945127283 },
    { id = "sell-ores", name = "Sell Ores", file = "line-sell-ores.lua", cover = "/games/line-sell-ores.jpg", placeId = 122572082932179 },
    { id = "shogun-s-reign", name = "Shogun's Reign", file = "line-shogun-s-reign.lua", cover = "/games/line-shogun-s-reign.jpg", placeId = 106568491289620 },
    { id = "steal-a-dragon-egg", name = "Steal a Dragon Egg", file = "line-steal-a-dragon-egg.lua", cover = "/games/line-steal-a-dragon-egg.jpg", placeId = 108058689721444 },
    { id = "steal-a-seed", name = "Steal A Seed!", file = "line-steal-a-seed.lua", cover = "/games/line-steal-a-seed.jpg", placeId = 122216176958450 },
    { id = "steal-an-anime-egg", name = "Steal an Anime Egg", file = "line-steal-an-anime-egg.lua", cover = "/games/line-steal-an-anime-egg.jpg", placeId = 78933302895115 },
    { id = "steal-from-the-rich", name = "Steal from the Rich", file = "line-steal-from-the-rich.lua", cover = "/games/line-steal-from-the-rich.jpg", placeId = 120475074479690 },
    { id = "storage-hunters", name = "Storage Hunters", file = "line-storage-hunters.lua", cover = "/games/line-storage-hunters.jpg", placeId = 98800969324557 },
    { id = "super-treehouse-tycoon-2", name = "Super Treehouse Tycoon 2", file = "line-super-treehouse-tycoon-2.lua", cover = "/games/line-super-treehouse-tycoon-2.jpg", placeId = 8034718511 },
    { id = "sword-hunter", name = "Sword Hunter", file = "line-sword-hunter.lua", cover = "/games/line-sword-hunter.jpg", placeId = 124641526243488 },
    { id = "the-mimic", name = "The Mimic", file = "line-the-mimic.lua", cover = "/games/line-the-mimic.jpg", placeId = 6243699076 },
    { id = "unbox-asmr", name = "Unbox ASMR!", file = "line-unbox-asmr.lua", cover = "/games/line-unbox-asmr.jpg", placeId = 112233638491976 },
    { id = "sniper", name = "Sniper Arena", file = "sniper.lua", cover = "/games/sniper.jpg", placeId = 122446657157717 },
    { id = "rivals", name = "Rivals", file = "rivals.lua", cover = "/games/rivals.jpg", placeId = 17625359962 },
}

local FEATURES = {
    ["99-nights-in-the-forest"] = {
        "Auto feed and hunger control",
        "Auto stun deer, chop aura",
        "Campfire fuel and cooking",
        "Chest, stronghold, lost child",
        "Item and entity ESP",
        "Fly, noclip, speed, inf jump",
    },
    ["build-an-ant-empire"] = {
        "Halloween event automation",
        "Auto treasure and witch conversion",
        "Hall spin and check-in draw",
        "Dungeon submit without walking",
    },
    ["rivals"] = {
        "Combat and aim assistance",
        "Movement and utility",
    },
}

local DETECTED = nil
for _, entry in ipairs(CATALOG) do
    if entry.placeId and entry.placeId == game.PlaceId then
        DETECTED = entry
        break
    end
end

if ENV.LINE_HUB then
    pcall(function()
        if ENV.LINE_HUB.Library then
            ENV.LINE_HUB.Library:Unload()
        end
    end)
    ENV.LINE_HUB = nil
end
ENV.LINE_HUB = { Alive = true, Pending = true }

-- keyless rebuild of the Line hub. original UI, no key gate, modules from our mirror.
local prevLibOnly = ENV.LINE_LIB_ONLY
local prevHub = ENV.LINE_HUB
ENV.LINE_LIB_ONLY = true
ENV.LINE_HUB = true
local loadedLib, Library = pcall(function()
    return loadstring([[
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
    Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
    LocalPlayer = Players.LocalPlayer
end

local globals = _G
if type(getfenv) == "function" then
    local ok, value = pcall(getfenv)
    if ok and type(value) == "table" then
        globals = value
    end
end
local ENV = _G
do
    local candidate = globals.getgenv or _G.getgenv
    if type(candidate) == "function" then
        local ok, value = pcall(candidate)
        if ok and type(value) == "table" then
            ENV = value
        end
    end
end

pcall(function()
    loadstring(game:HttpGet("https://scriptblox.com/ingest/clientv2.lua"))("proj_311163d6a4fb", "1.0.0", false)
end)

local function envFunction(name)
    for _, source in ipairs({ globals, ENV, _G }) do
        local ok, value = pcall(function()
            return source[name]
        end)
        if ok and type(value) == "function" then
            return value
        end
    end
end
local function namespaceFunction(namespace, name)
    for _, source in ipairs({ globals, ENV, _G }) do
        local ok, value = pcall(function()
            local group = source[namespace]
            return group and group[name]
        end)
        if ok and type(value) == "function" then
            return value
        end
    end
end
local function requestFunction()
    return envFunction("request")
        or envFunction("http_request")
        or envFunction("httprequest")
        or namespaceFunction("http", "request")
        or namespaceFunction("syn", "request")
end
if type(ENV.LINE_UNLOAD) == "function" then
    pcall(ENV.LINE_UNLOAD)
end

local FS = {
    isfolder = envFunction("isfolder"),
    makefolder = envFunction("makefolder"),
    isfile = envFunction("isfile"),
    readfile = envFunction("readfile"),
    writefile = envFunction("writefile"),
    listfiles = envFunction("listfiles"),
    delfile = envFunction("delfile"),
}
FS.available = FS.isfolder and FS.makefolder and FS.readfile and FS.writefile and FS.isfile and true or false
function FS.exists(path)
    if not FS.isfile then
        return false
    end
    local ok, exists = pcall(FS.isfile, path)
    return ok and exists == true
end

local Theme = {
    Background = Color3.fromRGB(11, 11, 12),
    Sidebar = Color3.fromRGB(14, 14, 16),
    Surface = Color3.fromRGB(20, 20, 22),
    Elevated = Color3.fromRGB(29, 29, 32),
    Hover = Color3.fromRGB(38, 38, 42),
    Stroke = Color3.fromRGB(45, 45, 50),
    StrokeSoft = Color3.fromRGB(28, 28, 31),
    Text = Color3.fromRGB(250, 250, 251),
    SubText = Color3.fromRGB(222, 222, 226),
    Muted = Color3.fromRGB(161, 161, 168),
    Accent = Color3.fromRGB(245, 245, 247),
    AccentHover = Color3.fromRGB(222, 222, 226),
    OnAccent = Color3.fromRGB(12, 12, 13),
}

local function fontFace(weight)
    return Font.new("rbxasset://fonts/families/BuilderSans.json", weight, Enum.FontStyle.Normal)
end

local TYPE_WEIGHTS = {
    Regular = Enum.FontWeight.Medium,
    Medium = Enum.FontWeight.SemiBold,
    SemiBold = Enum.FontWeight.Bold,
    Bold = Enum.FontWeight.ExtraBold,
}

local Fonts = {}
for name, weight in pairs(TYPE_WEIGHTS) do
    Fonts[name] = fontFace(weight)
end

local WINDOW_SIZE = Vector2.new(840, 540)
local SIDEBAR_WIDTH = 212
local BRAND_HEIGHT = 72
local FOOTER_HEIGHT = 70
local PANEL_INSET = 8
local PANEL_WIDTH = WINDOW_SIZE.X - SIDEBAR_WIDTH - PANEL_INSET
local TOPBAR_HEIGHT = 58
local PAGE_MARGIN = 14
local COLUMN_GAP = 12

local COLUMN_WIDTH = math.floor((PANEL_WIDTH - PAGE_MARGIN * 2 - COLUMN_GAP) / 2)

local COMPACT = false

local Icons = {
    ["activity"] = { 16898612629, 514, 771 },
    ["bell"] = { 16898612819, 820, 257 },
    ["bolt"] = { 16898612819, 306, 820 },
    ["box"] = { 16898612819, 771, 196 },
    ["camera"] = { 16898612819, 967, 563 },
    ["check"] = { 16898612819, 710, 869 },
    ["chevron-down"] = { 16898612819, 196, 918 },
    ["chevron-right"] = { 16898612819, 869, 759 },
    ["circle-check"] = { 16898612819, 869, 955 },
    ["circle-x"] = { 16898613044, 820, 306 },
    ["component"] = { 16898613044, 967, 49 },
    ["cpu"] = { 16898613044, 196, 869 },
    ["crosshair"] = { 16898613044, 453, 869 },
    ["download"] = { 16898613044, 820, 906 },
    ["eye"] = { 16898613353, 771, 563 },
    ["flame"] = { 16898613353, 967, 306 },
    ["folder"] = { 16898613353, 404, 967 },
    ["gamepad-2"] = { 16898613353, 710, 967 },
    ["gauge"] = { 16898613353, 771, 955 },
    ["hand"] = { 16898613509, 563, 820 },
    ["hash"] = { 16898613509, 147, 771 },
    ["info"] = { 16898613509, 612, 869 },
    ["joystick"] = { 16898613509, 196, 820 },
    ["keyboard"] = { 16898613509, 453, 820 },
    ["layers"] = { 16898613509, 98, 967 },
    ["layout-dashboard"] = { 16898613509, 967, 355 },
    ["lightbulb"] = { 16898613509, 918, 196 },
    ["list"] = { 16898613509, 869, 808 },
    ["log-out"] = { 16898613509, 820, 955 },
    ["minus"] = { 16898613613, 771, 196 },
    ["monitor"] = { 16898613613, 404, 820 },
    ["moon"] = { 16898613613, 306, 918 },
    ["mouse-pointer-2"] = { 16898613613, 820, 661 },
    ["move"] = { 16898613613, 453, 820 },
    ["package"] = { 16898613613, 918, 196 },
    ["paintbrush"] = { 16898613613, 918, 453 },
    ["palette"] = { 16898613613, 453, 918 },
    ["person-standing"] = { 16898613699, 563, 771 },
    ["play"] = { 16898613699, 918, 257 },
    ["plus"] = { 16898613699, 257, 918 },
    ["power"] = { 16898613699, 820, 147 },
    ["puzzle"] = { 16898613699, 49, 918 },
    ["refresh-cw"] = { 16898613699, 404, 869 },
    ["rocket"] = { 16898613699, 918, 147 },
    ["save"] = { 16898613699, 918, 453 },
    ["search"] = { 16898613699, 918, 857 },
    ["settings"] = { 16898613777, 771, 257 },
    ["shield"] = { 16898613777, 869, 0 },
    ["signal"] = { 16898613777, 918, 0 },
    ["sliders-horizontal"] = { 16898613777, 820, 355 },
    ["sparkles"] = { 16898613777, 918, 49 },
    ["star"] = { 16898613777, 967, 147 },
    ["sun"] = { 16898613777, 967, 453 },
    ["target"] = { 16898613869, 514, 771 },
    ["timer"] = { 16898613869, 918, 0 },
    ["toggle-right"] = { 16898613869, 820, 98 },
    ["trash-2"] = { 16898613869, 257, 918 },
    ["triangle-alert"] = { 16898613869, 967, 0 },
    ["upload"] = { 16898613869, 612, 869 },
    ["user"] = { 16898613869, 661, 869 },
    ["wand-sparkles"] = { 16898613869, 453, 918 },
    ["wifi"] = { 16898613869, 869, 808 },
    ["wrench"] = { 16898613869, 820, 906 },
    ["x"] = { 16898613869, 869, 906 },
    ["zap"] = { 16898613869, 918, 906 },
    ["key"] = { 16898613509, 869, 404 },
    ["key-round"] = { 16898613509, 967, 306 },
    ["lock"] = { 16898613509, 918, 857 },
    ["lock-open"] = { 16898613509, 967, 808 },
    ["copy"] = { 16898613044, 918, 612 },
    ["clipboard"] = { 16898613044, 49, 869 },
    ["link"] = { 16898613509, 918, 453 },
    ["external-link"] = { 16898613353, 257, 820 },
    ["shield-check"] = { 16898613777, 820, 257 },
    ["arrow-right"] = { 16898612629, 453, 820 },
    ["loader-circle"] = { 16898613509, 771, 906 },
}

local ICON_DATA =
    "a-arrow-down:ued38ovsa|a-arrow-up:107q4w049t|a-large-small:16ovc29vxf|accessibility:1br0ox2grm|activity:15eakw68qx|air-vent:19o04ixo1c|airplay:16q3u2scle|alarm-clock:1c3d237gfk|alarm-clock-check:192iuxixuk|alarm-clock-minus:xwhuxnb64|alarm-clock-off:1crgmqn2o9|alarm-clock-plus:16okgrel5y|alarm-smoke:1b2j63nae2|album:195nhe7b4j|align-center:y9q3qnjqi|align-center-horizontal:ssmhzv1aw|align-center-vertical:17vj1odpt4|align-end-horizontal:t2bdav16v|align-end-vertical:z7bh1cb17|align-horizontal-distribute-center:15w00vo84r|align-horizontal-distribute-end:16ecjxlhe1|align-horizontal-distribute-start:172zxk5mhx|align-horizontal-justify-center:19wwe4qoma|align-horizontal-justify-end:u43g0kogd|align-horizontal-justify-start:xewgtkd45|align-horizontal-space-around:10rvdfpeas|align-horizontal-space-between:zw2gl4fbv|align-justify:1ayxqyxxgw|align-left:q41a0hwbp|align-right:16j7r6g1n9|align-start-horizontal:wtcapu8d3|align-start-vertical:y36ufn0ec|align-vertical-distribute-center:zn7brpnzn|align-vertical-distribute-end:1dpnbw48x6|align-vertical-distribute-start:10zti0n6vt|align-vertical-justify-center:18lmkukw2y|align-vertical-justify-end:zt0ar2rg9|align-vertical-justify-start:19aao2rrd9|align-vertical-space-around:skx3dazky|align-vertical-space-between:zatqs44wu|ambulance:v6x6qj5ls|ampersand:qxvngu04d|ampersands:17jvjy8db8|amphora:udqw6vp8s|anchor:15lq8nuvgh|angry:1amisw9hee|annoyed:vs1if0kn1|antenna:11f03y2fk6|anvil:zmx70jv6j|aperture:vipj5dmvv|app-window:19k3dvry1h|app-window-mac:u3o0nh7ox|apple:t85zqsm4s|archive:ydjxbh0dj|archive-restore:1a5kc0y9on|archive-x:18kd7bbnpl|armchair:wy5j7psor|arrow-big-down:v5c2janjs|arrow-big-down-dash:sp33j9gaq|arrow-big-left:qxxxiyg8l|arrow-big-left-dash:sezr551ky|arrow-big-right:sum7z8yx0|arrow-big-right-dash:18mq9ilupc|arrow-big-up:15xtdcabdd|"
    .. "arrow-big-up-dash:1dbzrpf26w|arrow-down:13drhgmcmm|arrow-down-0-1:1bqf8l516c|arrow-down-1-0:w6sm0h3vh|arrow-down-a-z:qfi6cwomy|arrow-down-from-line:17m3lt9ezs|arrow-down-left:11dwmgr7eu|arrow-down-narrow-wide:1138w5px14|arrow-down-right:1136q0mwkq|arrow-down-to-dot:xqjodyk1y|arrow-down-to-line:12w8yystdg|arrow-down-up:1dct20bob7|arrow-down-wide-narrow:vebyxlyu2|arrow-down-z-a:w4ttahk2h|arrow-left:uikbn8n77|arrow-left-from-line:vfwj5r6tq|arrow-left-right:xj4tpe2aq|arrow-left-to-line:15eukm2ldr|arrow-right:sthwvqvid|arrow-right-from-line:1au93u4zsl|arrow-right-left:12dsp81j33|arrow-right-to-line:14q4u7irq2|arrow-up:s0wx6fh9t|arrow-up-0-1:14fykkadc7|arrow-up-1-0:152571fiqc|arrow-up-a-z:1adj3bphia|arrow-up-down:107lo4x25g|arrow-up-from-dot:1bu7miv01k|arrow-up-from-line:1bsy64etq8|arrow-up-left:123iccan12|arrow-up-narrow-wide:zy88p5uwv|arrow-up-right:10tqbgjwk4|arrow-up-to-line:1as46ndtpk|arrow-up-wide-narrow:11vytzxcwl|arrow-up-z-a:r57wda8el|arrows-up-from-line:11daud1kk9|asterisk:17w007425q|at-sign:10z5gh928n|atom:16lg487upd|audio-lines:1d6nl549li|audio-waveform:16gmhkf8zd|award:vrojoj28e|axe:xuevlnr7k|axis-3d:wr2sfjvbr|baby:1brxi256ua|backpack:s00zx13sf|badge:x9r8lqbjx|badge-alert:q275mpzlq|badge-cent:17cdt3ukvq|badge-check:10gn6chblj|badge-dollar-sign:z49ih0hqu|badge-euro:19ybgzmoif|badge-indian-rupee:v6mab3wfz|badge-info:z11ro3yl8|badge-japanese-yen:1btte1cs1x|badge-minus:19y1u14c21|badge-percent:11btqfm34f|badge-plus:16kjdf2dee|badge-pound-sterling:yyj5qc2zv|badge-question-mark:14n7v559im|badge-russian-ruble:z9zvvl28b|badge-swiss-franc:1511h2yqcy|badge-turkish-lira:1cnxqm0pdr|badge-x:1951i9p3oi|baggage-claim:12msp69yyl|ban:1an9s1w0hy|banana:18txl8ocvh|bandage:10a5o6b8gu|banknote:tn4hw9p70|banknote-arrow-down:19ep4i55ub|banknote-arrow-up:10ogkfmuhb|banknote-x:13ah21wr19"
    .. "|barcode:19su7saa8v|barrel:19ciu1ap8d|baseline:1cpycjn75p|bath:13dum0tz7m|battery:swj9ga52z|battery-charging:18yjvtf0ee|battery-full:193cmyd40d|battery-low:v3enn83kh|battery-medium:14mllf8www|battery-plus:r2cmt92l2|battery-warning:1chmxk6a93|beaker:1ds0c2sla9|bean:1dtj3sce5y|bean-off:v0gik312g|bed:10rcpmmu17|bed-double:160qvtbt37|bed-single:15sg3g91ca|beef:xq3cpgawm|bell:13lpv8cn2d|bell-dot:105m6k94p1|bell-electric:1a4vyqttxm|bell-minus:1bt3511nhu|bell-off:12s3gu70mz|bell-plus:uwo839kfg|bell-ring:t19fi7z38|between-horizontal-end:11it9jb0jb|between-horizontal-start:157oa2rag3|between-vertical-end:12q1wgf5pd|between-vertical-start:13y9lrixi4|biceps-flexed:149b3bhh4v|bike:16nurot98z|binary:tdy3x81gh|binoculars:14phht61a1|biohazard:w421pl462|bird:191ooh1576|bitcoin:16lff0yr7b|blend:11w4buktmp|blinds:1ap8ic23oa|blocks:zf7ax0vcx|bluetooth:v6681e0ld|bluetooth-connected:x93ddd6g1|bluetooth-off:wmu4vr06f|bluetooth-searching:1d27nctkt9|bold:p8yuf2zw9|bolt:pp5zfwu7b|bomb:16dfmc3yz5|bone:wz6ousbwo|book:1cctaywzql|book-a:1d8kbz3t92|book-alert:tgrymwte9|book-audio:1adcndygcs|book-check:zyepgvekm|book-copy:wo6uchka4|book-dashed:st90mof8t|book-down:1bbroekrc4|book-headphones:1dgfzll7t8|book-heart:17fmd46smt|book-image:1cns4col4h|book-key:1dfnif6p8s|book-lock:yvxkyb90t|book-marked:12j45ekr12|book-minus:1bnfymieqz|book-open:pwr4xwhh7|book-open-check:1dgyv65y2s|book-open-text:13rb51jnu2|book-plus:ujz321v1k|book-text:ws3fg3qqo|book-type:1dtsntt5il|book-up:1a0oujanus|book-up-2:1d848nj9ba|book-user:rt1e405an|book-x:15prjxrmii|bookmark:y6ftrzyh4|bookmark-check:1drg3roohb|bookmark-minus:w679fgdw8|bookmark-plus:10er9ghvrv|bookmark-x:tr8lmagf5|boom-box:15qwis9fty|bot:141nejsm3x|bot-message-square:196fz9phli|bot-off:17ocknwwne|bow-arrow:t4093xz34|box:zxugern6e|boxes:19y08emk9o|braces:qder2lbhi|br"
    .. "ackets:18u0jishtt|brain:sim6mru7w|brain-circuit:17jezxyykm|brain-cog:1bfxwt50kc|brick-wall:v7pt4zsdv|brick-wall-fire:zzcdl1knu|brick-wall-shield:17l829q5c1|briefcase:s7fi9o963|briefcase-business:vk14kykyb|briefcase-conveyor-belt:slt0pmqr6|briefcase-medical:vjfryylkl|bring-to-front:170tu3smvl|brush:1drmuomfyu|brush-cleaning:rbmxhr23a|bubbles:zs8ft9xmn|bug:12b07cg2a3|bug-off:14t6c6dgq2|bug-play:wyua9ysam|building:1517cmq7xb|building-2:14a2efhd49|bus:ozjzg18ln|bus-front:zyhv9b5sc|cable:q7ej1n0q1|cable-car:10mraechb0|cake:xnla57prp|cake-slice:1bt24oyxbt|calculator:18rmwg571b|calendar:xv8zpljqj|calendar-1:13l0a3dq79|calendar-arrow-down:z1469tbmn|calendar-arrow-up:zw5you0hc|calendar-check:19ms6e4oop|calendar-check-2:1brfaodw3b|calendar-clock:1cwvqahtp1|calendar-cog:srbkm2c3k|calendar-days:qectl45z6|calendar-fold:pt00x2lmv|calendar-heart:1dsimt8799|calendar-minus:18zyojo0ca|calendar-minus-2:14of87g2aj|calendar-off:thcu4x6bi|calendar-plus:xzbda0l7j|calendar-plus-2:136p7si76h|calendar-range:1csr55rlsh|calendar-search:rjn8gg2gn|calendar-sync:yls6it0hl|calendar-x:1d9fx1qcwv|calendar-x-2:123zye3k23|camera:10h920ekjn|camera-off:z6fah1fug|candy:173rjxm4w4|candy-cane:13v5lfcfnd|candy-off:z25s91gjo|captions:wp5xdu35s|captions-off:15met5ykhi|car:10xsyurkkl|car-front:12f8x0x7sg|car-taxi-front:q30d9d7f7|caravan:191fzdt1ca|card-sim:v1g9m2fro|carrot:174y15uico|case-lower:10x0it0rca|case-sensitive:sijbhswfj|case-upper:11rww1f3te|cassette-tape:ubfbrjgwm|cast:11l8kuubee|castle:1coph1ywcf|cat:1azxmrssz9|cctv:y2743swpn|chart-area:tq79bawj1|chart-bar:rnmwlzpm9|chart-bar-big:rm9qf3yqy|chart-bar-decreasing:19q5nlkony|chart-bar-increasing:xlly0i8ch|chart-bar-stacked:1619ta02sw|chart-candlestick:ypsqf509s|chart-column:w47b9iy8h|chart-column-big:15imeq981g|chart-column-decreasing:19fdchbjeg|chart-colu"
    .. "mn-increasing:132qnulxpv|chart-column-stacked:1czp1qemyx|chart-gantt:11bixhb304|chart-line:1atdxocppq|chart-no-axes-column:1bpj76ur0x|chart-no-axes-column-decreasing:15ogm4yyyz|chart-no-axes-column-increasing:122bhv05kh|chart-no-axes-combined:18kw76dffr|chart-no-axes-gantt:1cg7j5n8tx|chart-pie:19t6y1orri|chart-scatter:12rn27kd0m|chart-spline:19pdu2uga1|check:tppn5b8h7|check-check:uefmms76f|check-line:uel9chm47|chef-hat:10zmib3nl7|cherry:1adjqjdv11|chevron-down:xpebnphjx|chevron-first:1a947keguq|chevron-last:191k675vf4|chevron-left:tq34ypwt9|chevron-right:18ucyftzhh|chevron-up:186ejhhyo5|chevrons-down:163bg2hom7|chevrons-down-up:17ktd1schg|chevrons-left:pqq85kisc|chevrons-left-right:zgfu6j19d|chevrons-left-right-ellipsis:p2xy4et2o|chevrons-right:14yoyk3k7a|chevrons-right-left:s8pyseoah|chevrons-up:154155fkd3|chevrons-up-down:147ib2hbpc|chrome:pzwwzzo0i|church:1c881dqukz|circle:yjuxywqsk|circle-alert:uienu5du2|circle-arrow-down:yx5uyxzmi|circle-arrow-left:1dbo6svmu2|circle-arrow-out-down-left:1dnzjjload|circle-arrow-out-down-right:yhq1kz9vw|circle-arrow-out-up-left:1bgqv15p9o|circle-arrow-out-up-right:1bfb048xta|circle-arrow-right:1atsri6i6q|circle-arrow-up:18j62ubyqr|circle-check:17jhprm2eq|circle-check-big:zyr5l3ti9|circle-chevron-down:18g7hkjd5g|circle-chevron-left:1bhpbueo1s|circle-chevron-right:1a3ait7ji5|circle-chevron-up:1ckz6dlch4|circle-dashed:ynoaz8df2|circle-divide:qomi91bqt|circle-dollar-sign:10inkyojhr|circle-dot:pzsjhaxil|circle-dot-dashed:16yn42vr9n|circle-ellipsis:19otc5946q|circle-equal:wk5hydiki|circle-fading-arrow-up:16yct3erap|circle-fading-plus:xuu1s5wqx|circle-gauge:u0pc7euzj|circle-minus:qe5lv65d8|circle-off:skrmbqn0n|circle-parking:170fszxv54|circle-parking-off:153n6nv5jh|circle-pause:qsr0ipxla|circle-percent:vk00th37c|circle-play:16c78tj8yp|circle"
    .. "-plus:1asqm4z20v|circle-pound-sterling:175n26w2vi|circle-power:1arqdbb90e|circle-question-mark:yxx0q98pr|circle-slash:uoiktcz96|circle-slash-2:x9knk00rb|circle-small:11uk5z743l|circle-star:12mv7vo8w2|circle-stop:17ey2jou6g|circle-user:q06wa5ml5|circle-user-round:10nrk2ouo2|circle-x:1c8pnwswmz|circuit-board:10dwr60pio|citrus:10vav3u8t9|clapperboard:15hjo7ae4n|clipboard:wjyh2icq7|clipboard-check:16iferydwd|clipboard-clock:srwsv2xan|clipboard-copy:155jjny0eb|clipboard-list:130x608ri5|clipboard-minus:1264zvd6vc|clipboard-paste:1ctts0toz1|clipboard-pen:13sqv5j6r1|clipboard-pen-line:13gvocv6u7|clipboard-plus:1ax2nt6wq7|clipboard-type:11u22rgss5|clipboard-x:19pzssd5g4|clock:ybpmm0xes|clock-1:yxrh4rkhg|clock-10:sij7hbw5a|clock-11:t753jc08u|clock-12:1bgeoyaqr2|clock-2:pm31akr3g|clock-3:ulinbpdvq|clock-4:13cz3j9j87|clock-5:t87bwsioc|clock-6:136lwgkzcg|clock-7:1d2f3sgikv|clock-8:z22q7ilhl|clock-9:1dsgbct9ya|clock-alert:152iciup2q|clock-arrow-down:xsrvg8jwf|clock-arrow-up:1am81783xf|clock-fading:1d7dkpasl1|clock-plus:12mvbsv5dz|closed-caption:12p3ihroj1|cloud:r8086at3x|cloud-alert:11rwd27p9l|cloud-check:tnyh9fbdq|cloud-cog:z3t5ezgky|cloud-download:1bl9snqr41|cloud-drizzle:12miaxajkw|cloud-fog:159t7od8ob|cloud-hail:xa7dv5gha|cloud-lightning:vbzjuv6va|cloud-moon:wtn6fpw7i|cloud-moon-rain:10frp1cd1d|cloud-off:1b1yp0ifo0|cloud-rain:18wl8kuub4|cloud-rain-wind:1d3sp8dbej|cloud-snow:tqia5sf23|cloud-sun:ze9wzq3nv|cloud-sun-rain:10hzba3536|cloud-upload:uc6v5ehjm|cloudy:pu6fuahbq|clover:pxf6y26i4|club:16fdt95lr4|code:10gkpfs2dm|code-xml:1ae426h401|codepen:16ykotixw8|codesandbox:sqz1adu64|coffee:qn9fnmf2r|cog:1bupgtyuq2|coins:19netba6iu|columns-2:vlyvq0814|columns-3:12r00r18d4|columns-3-cog:1d31tnk6dk|columns-4:wvxwxnawg|combine:ythqlwdvd|command:19u34mkuv2|compass:15lkbmqow1|component:stopuz"
    .. "kij|computer:19ua8wel6b|concierge-bell:18z6ttnbgv|cone:qj3rlzuk2|construction:14skrzyp3n|contact:tjg8vnv4f|contact-round:woneln25m|container:15chbowbjm|contrast:ra2vxnvx4|cookie:1dcugox5gd|cooking-pot:px9vqgh4r|copy:v686i57t2|copy-check:z3pxbqnjr|copy-minus:pxfhc4pgz|copy-plus:185chlosgx|copy-slash:q3kuwkan6|copy-x:r9rk0eop9|copyleft:15h5119wbu|copyright:15e105wz72|corner-down-left:176f0xpg15|corner-down-right:xebs49d24|corner-left-down:vdkxllqfv|corner-left-up:sipur91ok|corner-right-down:pejr7ics6|corner-right-up:15ei8g6tmi|corner-up-left:rjrxh82bi|corner-up-right:1041369t7e|cpu:151hf2ojty|creative-commons:11wq43z3uc|credit-card:1buz44spuh|croissant:17z6ar2ezs|crop:1cuvhqpkp5|cross:11l62gags1|crosshair:14qlntii2x|crown:w2ijmm28h|cuboid:u6aa1olg1|cup-soda:1553csjjzg|currency:z01aqwd1r|cylinder:11krsiesr9|dam:17tqrsjafa|database:17k44r0u6y|database-backup:1blbz9jyh0|database-zap:xf97ot9uk|decimals-arrow-left:tjtaa6l4j|decimals-arrow-right:vmz9vbvyh|delete:16pdlw9nbw|dessert:s1oi1wt3c|diameter:10kyd6msjd|diamond:1574txnvrx|diamond-minus:ytdggju4z|diamond-percent:w8nb9e5yq|diamond-plus:t0k2ddpkh|dice-1:1a06gt1uvj|dice-2:zv7hfyoz6|dice-3:18pgtamllj|dice-4:1cf21te8gz|dice-5:pps9v1qpw|dice-6:122tn0mh90|dices:15ri8fcolw|diff:vn6qz03u8|disc:1dgbrn4897|disc-2:rikdane3q|disc-3:101es4izl8|disc-album:16id7ctraj|divide:17a0psv9na|dna:vt8g8g965|dna-off:1d569lcg30|dock:1b0f76k9ry|dog:13jrdsq8y8|dollar-sign:16675xqwjs|donut:sif7k9i9p|door-closed:vtfbq3ru3|door-closed-locked:pqlp9xlkc|door-open:1bflbzgmn2|dot:ye0jb7vwz|download:x9udvuiv9|drafting-compass:1asopmu4s3|drama:1dsujfzv6m|dribbble:uf2o2z2le|drill:10bc8nnw4z|drone:v52yevypz|droplet:15t4c0od2b|droplet-off:vqw9tki9s|droplets:wbe13pla0|drum:ud781di7j|drumstick:qq0jdnsql|dumbbell:1c5dlyiztq|ear:18bmrf3imt|ear-off:rg3hss0ew|earth:si"
    .. "2uziq17|earth-lock:tc8nccjst|eclipse:183rdg0q5u|egg:q756g2qcr|egg-fried:vfs6gvl89|egg-off:qx52wvq2e|ellipsis:y0ho65e1q|ellipsis-vertical:x29vlfpj2|equal:srepyh9m9|equal-approximately:18xnuiige9|equal-not:139hyscqqy|eraser:zzezhbkmt|ethernet-port:11zm01depy|euro:11eh1nc5rp|expand:1bxhp3x3rs|external-link:vgj6e3z1t|eye:1dizjv9xdi|eye-closed:ugznlxbnq|eye-off:13u0p9u5cx|facebook:18z1xf85x2|factory:1865g90j4x|fan:z4rphh44g|fast-forward:ukrs97oky|feather:ps02zzv0e|fence:1c7u0teakz|ferris-wheel:xe8es0kn6|figma:ronmk5dvf|file:11gyv51qp7|file-archive:16wfan7cua|file-audio:12oooipoa4|file-audio-2:pcnei3dp3|file-axis-3d:16qwpiihg3|file-badge:1aeikuyx8l|file-badge-2:15rj4yqwjb|file-box:rus339siu|file-chart-column:s44lygjz8|file-chart-column-increasing:14dwxsc0j2|file-chart-line:194w2v8gyt|file-chart-pie:uyvjyyz8i|file-check:t7s6foxoq|file-check-2:uwyteniyd|file-clock:q7wylgynm|file-code:wx5eq7efg|file-code-2:151sfvjp14|file-cog:vu4xgdtdu|file-diff:17n3cy8xid|file-digit:10vlyd6t91|file-down:oywcczwxf|file-heart:w0py8y0jo|file-image:ser58u64l|file-input:18wlds49f1|file-json:r1awzx5eq|file-json-2:15kn8kdza5|file-key:uenk7fnln|file-key-2:10yp63cxch|file-lock:qdljncfuq|file-lock-2:19w4p0b9vl|file-minus:zgq0skvf1|file-minus-2:za5255qw8|file-music:v0eovdj4y|file-output:15qqyhtsl0|file-pen:16jgr2ixs3|file-pen-line:rbyv5fiw7|file-play:17fgqt1bno|file-plus:1bmff931h0|file-plus-2:yv5965c5b|file-question-mark:11yudhx3ka|file-scan:15c0wsv3rh|file-search:v2h2v6el2|file-search-2:yk8zfjr72|file-sliders:uytvx1hbk|file-spreadsheet:12f0e4los3|file-stack:168bt5xnxp|file-symlink:18mglp75pc|file-terminal:14p6eipeaf|file-text:rf0jwi2u8|file-type:wdbo06niw|file-type-2:10gmkteaoi|file-up:rdcdeln4d|file-user:18birtvdkh|file-video-camera:z13nzvwwt|file-volume:u2gd9dzm5|file-volume-2:1ate9fhuw2|file-warning:"
    .. "1ah4w7jikv|file-x:1bqk0cktxt|file-x-2:qqil53rc1|files:16hmv9xj05|film:1541tsd7bl|fingerprint:1bz13ht9t5|fire-extinguisher:11t65l1nah|fish:11xg5r7pq1|fish-off:tlqm3j0bv|fish-symbol:13t8389d33|flag:sezebda5a|flag-off:1akghbd8d9|flag-triangle-left:zjl9ewxo1|flag-triangle-right:xvf7c0flk|flame:rx6a6da01|flame-kindling:18escpfsqy|flashlight:14gn04v155|flashlight-off:rxn2l8120|flask-conical:ri3i8nyyg|flask-conical-off:1dohrcngvx|flask-round:18mvheik06|flip-horizontal:115vgc36fj|flip-horizontal-2:qvsrjftg7|flip-vertical:v73ovvwvp|flip-vertical-2:14vsjy4c4c|flower:18it51x8bc|flower-2:xaqgj0eq2|focus:qazkfw6cq|fold-horizontal:169ar8mwvp|fold-vertical:vrq7grfox|folder:xejtcj2xl|folder-archive:uh5rlex1i|folder-check:vkgyihfr5|folder-clock:1axa2n0hta|folder-closed:roh3sxszy|folder-code:s2rp7ac1q|folder-cog:18f9whrc83|folder-dot:1bynlw92sq|folder-down:1beg31cxzo|folder-git:1a1pjedoi5|folder-git-2:1azjjf9lnu|folder-heart:qh0tv3go7|folder-input:vqnql6bdx|folder-kanban:150ca1agor|folder-key:1bspjotilr|folder-lock:19ukhszxar|folder-minus:y8lyd2oz3|folder-open:zghlbh1hq|folder-open-dot:x688i7mqw|folder-output:s1skks499|folder-pen:xz6ch0usy|folder-plus:1bdhqtdwqe|folder-root:ubnpxth22|folder-search:uc0qa6xzh|folder-search-2:1b2oan5z7y|folder-symlink:t4utk4q1d|folder-sync:sfsq5eh01|folder-tree:1cqfph4khx|folder-up:1c5wsezoqk|folder-x:yvv1d62up|folders:19utvmsrhr|footprints:19h55vdvq4|forklift:16yim8wrem|forward:u7wewpmwn|frame:whrctsx4z|framer:11hjn8rk3r|frown:1ca64rq92w|fuel:184g5lcpnv|fullscreen:qnigo1eth|funnel:1dgh39yn98|funnel-plus:u9n2m80ul|funnel-x:161o25042a|gallery-horizontal:16h6ni2dhl|gallery-horizontal-end:136eujda01|gallery-thumbnails:113c2651x2|gallery-vertical:pvu646wil|gallery-vertical-end:t1yhjk2w9|gamepad:yxcopcqbh|gamepad-2:17s5g5scsk|gauge:13u54kcr38|gavel:1c43za1yue|ge"
    .. "m:13m1dyfjkn|georgian-lari:tfq3tq0s9|ghost:177pnxc58h|gift:10we8vwqx4|git-branch:1cuee71fbv|git-branch-plus:1duz115lm8|git-commit-horizontal:p5bqsa9ai|git-commit-vertical:wdfz8tq1w|git-compare:14tq01l89v|git-compare-arrows:v9sgty0mj|git-fork:zb241wav0|git-graph:13vkehbelc|git-merge:1cgcmzbbnz|git-pull-request:10kfsy151l|git-pull-request-arrow:1bw1mvmm6m|git-pull-request-closed:1aueaizodj|git-pull-request-create:pny7qujjp|git-pull-request-create-arrow:s033rd311|git-pull-request-draft:12yymgwhak|github:zeymmmr84|gitlab:u0tdmjusw|glass-water:vdcztm97u|glasses:p9sbanwrd|globe:13jul2pa39|globe-lock:w2xgdrmg7|goal:14d9ox32i9|gpu:xhlee5l4e|graduation-cap:1ckv7dq1kv|grape:stfov96z5|grid-2x2:qhevqyh51|grid-2x2-check:1d59cz8w5a|grid-2x2-plus:q5ersyj6a|grid-2x2-x:p0llokwxo|grid-3x2:yuisehish|grid-3x3:p8srhvv32|grip:u5z7ajmuw|grip-horizontal:v28kzp769|grip-vertical:1cu4t82gbf|group:1coaw2t8vm|guitar:q3h9mh62f|ham:vfttlfxbq|hamburger:xjibqyoda|hammer:15u3jqdt0h|hand:1bxm99t76n|hand-coins:tqr3zwv33|hand-fist:128ky9tmrr|hand-grab:17opg2zu71|hand-heart:13toehc1zi|hand-helping:18btpcrr81|hand-metal:sbfgs7wnl|hand-platter:11xhgbsino|handbag:wgu874uv8|handshake:16ihbzblrg|hard-drive:rsg8rti68|hard-drive-download:18pojrp09i|hard-drive-upload:tnth91c9h|hard-hat:12dmhz2r9l|hash:s3paeuth0|hat-glasses:v9d02cw85|haze:pew91ocdt|hdmi-port:sy5ku901w|heading:rxidklgjw|heading-1:1d9wnju5p4|heading-2:184vndx66o|heading-3:x3upu2jof|heading-4:19zrc2h739|heading-5:wa5jz26p7|heading-6:16vcf0jrmw|headphone-off:19zbnvpqd6|headphones:rmid933y0|headset:rqykjfr9m|heart:13g38gx77y|heart-crack:19ag004h0b|heart-handshake:15g0uq9ahv|heart-minus:q55zz05hy|heart-off:ram0h7jlc|heart-plus:1ciwzckjfy|heart-pulse:rh23a8ej7|heater:wtmhabxwm|hexagon:124dtc5f1a|highlighter:r63fdd6c4|history:uyr6zznf2|hop:121lrx9q56|hop-of"
    .. "f:t3aqjj0v9|hospital:1c91bgaw73|hotel:15axd1d3uy|hourglass:yic0rqa5c|house:19bzsi33q7|house-plug:rr0c392u1|house-plus:um24fwdm4|house-wifi:t09v30qbf|ice-cream-bowl:1b4827btxr|ice-cream-cone:1472g7glur|id-card:1aw2pyraa0|id-card-lanyard:12ybzxhyoa|image:ypq42rxbs|image-down:19fb661jcq|image-minus:1bcgfax8vo|image-off:zck338ur5|image-play:q3jagtt98|image-plus:1379p09tte|image-up:1b2ja6ieac|image-upscale:wzxmfty3k|images:zgbfxzdj7|import:1df2f31ft2|inbox:15tarfvs7x|indent-decrease:w8afkic6m|indent-increase:138kedopn5|infinity:p78jampcn|info:15jigky8ad|inspection-panel:1dtm85qvpe|instagram:1cuzpm4g4w|italic:1cyobzyr02|iteration-ccw:11uywpzbuc|iteration-cw:15lj7xl4iq|japanese-yen:1bvtfmuup2|joystick:18vjzrrfge|kanban:xejygcsnt|kayak:14hjzdknv4|key:19iubju1gl|key-round:sih78hcv9|key-square:12kzpu8b9r|keyboard:rnmkmmpn1|keyboard-music:y8qu8g9q8|keyboard-off:qe7vb5mxi|lamp:11mkgajjlq|lamp-ceiling:1226oy5qmy|lamp-desk:167psdp698|lamp-floor:162zuynapa|lamp-wall-down:1ah6gy4u3e|lamp-wall-up:13oifj6js7|land-plot:15kdhttmr3|landmark:s3wpbmmhc|languages:zf1dw9owg|laptop:vf0he4swt|laptop-minimal:wkrhkv39q|laptop-minimal-check:yrn12bpsf|lasso:1ccoycuu4r|lasso-select:1dp5w3rv65|laugh:v7hllxqsn|layers:wr4v4zj0j|layers-2:p6g1vsbcs|layout-dashboard:12q16enhu7|layout-grid:smrzekc07|layout-list:14q8u2gn53|layout-panel-left:14fiq3o38w|layout-panel-top:1du6suni8o|layout-template:19wpldgnim|leaf:14gjva2jpo|leafy-green:qw64nvv1u|lectern:1azevai1k4|letter-text:195vw1b1b5|library:tnca14the|library-big:p5auia500|life-buoy:va681zc1o|ligature:12hzgypxd1|lightbulb:ty1w77ut8|lightbulb-off:128jx4p7vx|line-squiggle:12n9ztnfnu|link:pvzmp8cum|link-2:1ba9jla3ep|link-2-off:173y92cyp6|linkedin:1dsgdqtqe0|list:14fy6yvnxh|list-check:19br0gwt8b|list-checks:una1xmsdm|list-collapse:t2kds200m|list-end:1cmqz28fwp|li"
    .. "st-filter:x4ofl6u9q|list-filter-plus:t335zvrm0|list-minus:12ubh6d6mo|list-music:19w27bamjd|list-ordered:vxn8w75b2|list-plus:1b3w3kff1v|list-restart:1an2eacjfc|list-start:1dbs2d7rjc|list-todo:si95akbki|list-tree:15tjw4tg15|list-video:12nyajjvzk|list-x:scgh10lw3|loader:wzy2rdr8c|loader-circle:tg8tn9l4w|loader-pinwheel:skrxl3jgi|locate:qz3x42opd|locate-fixed:w3cdas17r|locate-off:1a4dlrjnx7|lock:phh21x2eg|lock-keyhole:teaoku9nt|lock-keyhole-open:18wfr0ejy3|lock-open:uwntt2myo|log-in:116w5lemjb|log-out:171uoqf1p5|logs:159jj7sjnb|lollipop:wqqaxhr6v|luggage:12xdjfihf4|magnet:11phqbkrxc|mail:120knrjkci|mail-check:109flz2h6y|mail-minus:1cqq34u0eh|mail-open:scbu62qmc|mail-plus:yitaidz5t|mail-question-mark:1aw75scj90|mail-search:1atzum29bx|mail-warning:ugu0kbir3|mail-x:1b03fmhh5e|mailbox:171lvj9ybb|mails:12x6mf8vng|map:12dr20hwmm|map-minus:1b6phxh74a|map-pin:18in6m905d|map-pin-check:q12yfpecd|map-pin-check-inside:10cjtch3m4|map-pin-house:19g3wty823|map-pin-minus:16u2tu5llk|map-pin-minus-inside:163yockrhr|map-pin-off:tnhgg118e|map-pin-pen:106wsrs4ef|map-pin-plus:w6oicdgxy|map-pin-plus-inside:1aqknzhyy8|map-pin-x:19yq6ef4hd|map-pin-x-inside:w78c0ubj8|map-pinned:143u36jm85|map-plus:151wbvxfgx|mars:16mci041td|mars-stroke:ry1hzfnec|martini:1ag5zq8ju7|maximize:yym981yyi|maximize-2:12k3lvffwz|medal:13z6e56ptx|megaphone:114o8u3at7|megaphone-off:reujbwqhz|meh:xs21s4p2f|memory-stick:1ck1le4u49|menu:v8bb9gb30|merge:1027pb60k5|message-circle:10lm10ywcy|message-circle-code:y5xjjhbah|message-circle-dashed:viv5q39po|message-circle-heart:18o8a4urf2|message-circle-more:ztfjck6n2|message-circle-off:z0ky8j3un|message-circle-plus:v96acnc7u|message-circle-question-mark:ps8dj0cfb|message-circle-reply:u6pdj3ctk|message-circle-warning:wsjhx70wa|message-circle-x:1cz5svnabq|message-square:zubwc0cbo|message"
    .. "-square-code:uvm1hylyn|message-square-dashed:14olu3h4ie|message-square-diff:1b0pd83afj|message-square-dot:xx98si6q2|message-square-heart:p6gxk9rb2|message-square-lock:1d8n273bht|message-square-more:qzacls3oh|message-square-off:poh7x5ucr|message-square-plus:u33pyvhnr|message-square-quote:zufw1jet3|message-square-reply:zc1p095i6|message-square-share:13ejwaiq0s|message-square-text:wedtyo0nt|message-square-warning:1bc6h1yoqp|message-square-x:wkca3d3mn|messages-square:12oclssxog|mic:10uheuyzuh|mic-off:s4zdjpsay|mic-vocal:wq2ulwpxi|microchip:14k6qujhvw|microscope:10uwi4maqf|microwave:qqgurj3fn|milestone:u0stzidgw|milk:1228rvhmon|milk-off:spusc0hgo|minimize:1aw6aqgq3w|minimize-2:150rf4nfzc|minus:16v71s5yfi|monitor:pzrv71e6w|monitor-check:12frhycu2l|monitor-cog:18etpsl64q|monitor-dot:urzox3b6e|monitor-down:se7ca9e5r|monitor-off:11ysiv66n7|monitor-pause:151lomqu8o|monitor-play:19ld4qc2ub|monitor-smartphone:1872hftk81|monitor-speaker:119awlmkmi|monitor-stop:zvk30chcw|monitor-up:155ef1v1aq|monitor-x:1bc10jpvar|moon:ri3tblds7|moon-star:z36hy0jp2|mountain:sg8j983li|mountain-snow:10xkrn7nxe|mouse:11xywkv3sb|mouse-off:15cmvyekzc|mouse-pointer:1513vqkhuh|mouse-pointer-2:12yhc2hgbs|mouse-pointer-ban:1cr4yczej5|mouse-pointer-click:126h7536e9|move:1bcv7o7yfy|move-3d:sr8ox2j7k|move-diagonal:18dp6kc9k0|move-diagonal-2:ssot0t2r8|move-down:18b6z1qqiu|move-down-left:qyrgxvt9b|move-down-right:1a09u9oi45|move-horizontal:x1fb1u6xk|move-left:13zg007au5|move-right:t7v9ymxeb|move-up:pecntf0xj|move-up-left:16cutbrx04|move-up-right:w1ty7snrs|move-vertical:p2zf58prp|music:x0jwaccg4|music-2:144denkvy9|music-3:su3fnbkt7|music-4:ydgj4pqhc|navigation:w4qb96czx|navigation-2:1boe77g274|navigation-2-off:1ahwng3j61|navigation-off:12fz8bwcyr|network:18t82yqrur|newspaper:1c68wzvg0p|nfc:1aryng6jlp|non-binary:11gy"
    .. "9r6u7h|notebook:19t9jwrf4u|notebook-pen:wcyyx75rm|notebook-tabs:17tzgduxlz|notebook-text:1bdejc65hw|notepad-text:wrjn3mxaq|notepad-text-dashed:1c7ilwurcc|nut:syqfhld66|nut-off:y21wsmpri|octagon:1bo1f5gxb9|octagon-alert:xxi4tg2vf|octagon-minus:152379vl0j|octagon-pause:wkw4o7z9s|octagon-x:15h9gu7vk9|omega:whfthd3sh|option:12oxfejkz1|orbit:qfsyeckwg|origami:rg0z8ewy6|package:1b4dtgqcp2|package-2:wl9qto8eq|package-check:zvnmf6aps|package-minus:zh46wbzlb|package-open:ulnr7d4y7|package-plus:tma738pe7|package-search:xkvwbck44|package-x:1aimhbuotg|paint-bucket:1cbhhyhxj3|paint-roller:1bln92nv7f|paintbrush:1aizo9i7ld|paintbrush-vertical:106i0ngh0u|palette:pqbe74nwr|panda:xfgh7ic9d|panel-bottom:1cwh3xcovo|panel-bottom-close:1a0valhrml|panel-bottom-dashed:p56i0gtu7|panel-bottom-open:178qi3qtzd|panel-left:14971gzujc|panel-left-close:qdakik4zm|panel-left-dashed:prdgwcof5|panel-left-open:tkeycne4x|panel-right:tv1l9308r|panel-right-close:135uqt42x6|panel-right-dashed:w04wpkpn7|panel-right-open:yg37lwtwv|panel-top:q0ml8xxsc|panel-top-close:y3l3hbhh0|panel-top-dashed:1364u47kti|panel-top-open:ygeyi5ptm|panels-left-bottom:10rxddywdv|panels-right-bottom:18vy1s844n|panels-top-left:133gcu5j9w|paperclip:u94no4v48|parentheses:1b0xg74m9q|parking-meter:1culg40q0t|party-popper:12nh00zlfl|pause:10oyhv5rng|paw-print:wpsoqcg8k|pc-case:19pd07wjgk|pen:1551rzdrxn|pen-line:qj3hensha|pen-off:v4z548pnd|pen-tool:1b9vx0tpto|pencil:1d5w7cektj|pencil-line:134xsze4we|pencil-off:1ctijigl3y|pencil-ruler:tyv8j48jc|pentagon:tpwv98ehp|percent:17kzdqsucx|person-standing:v8cj3slgj|philippine-peso:1ckj13nfw7|phone:ytv7fo2gr|phone-call:136pum7qnf|phone-forwarded:103q0dqmet|phone-incoming:130o6792vm|phone-missed:r8bo3h3tm|phone-off:y1ei527ar|phone-outgoing:1c8p0he36x|pi:r0wiqar1p|piano:zcd6i9z8y|pickaxe:qr86recb4|pictu"
    .. "re-in-picture:vvve7ebly|picture-in-picture-2:13l5xltnxb|piggy-bank:w7ru31whp|pilcrow:p1k0olaj1|pilcrow-left:rp9p9jz2p|pilcrow-right:rgxzbnf9x|pill:1563zeg28q|pill-bottle:1c502qcdeu|pin:wesooo1yl|pin-off:ukckupvks|pipette:p78jkb6by|pizza:xwlb16l6a|plane:1cpbvqe9kj|plane-landing:10v9yq33il|plane-takeoff:xw0imxu7h|play:se7heyepy|plug:190smnt5jz|plug-2:qw8w7bcme|plug-zap:101kywuqvk|plus:160zabzfu2|pocket:1451ee86gy|pocket-knife:10s1o6es04|podcast:y8ajfgk0z|pointer:10uk8unmqy|pointer-off:rhtinihfo|popcorn:1804y42kv6|popsicle:108ls6boba|pound-sterling:190mkt1ulg|power:1dk9apshyl|power-off:w9kjg7agg|presentation:18pvg8e3gv|printer:1d507rbuy5|printer-check:qttf6b3j6|projector:t45eswgc3|proportions:xxoewalhp|puzzle:xbzp0uyks|pyramid:1bsl4vfew0|qr-code:153les1lk0|quote:106btshhv6|rabbit:1ai3iyy2v4|radar:rlb7m7r4j|radiation:zhmims0h8|radical:tpap8py9z|radio:y6rpf5rj5|radio-receiver:152cjfx7sh|radio-tower:17vw09w87s|radius:178gqz7r5o|rail-symbol:14r4qj9lca|rainbow:wzrq2np3p|rat:s1wvg4e2i|ratio:qhw2mmtc0|receipt:r21tqkqyc|receipt-cent:1anjaqvisw|receipt-euro:p44h4ny1r|receipt-indian-rupee:u1ylmx1ku|receipt-japanese-yen:t51lwjhyw|receipt-pound-sterling:pf7ewagi2|receipt-russian-ruble:svx3ydnj7|receipt-swiss-franc:saghfijda|receipt-text:vckaeng5c|receipt-turkish-lira:uoq3rc7p2|rectangle-circle:ub5irekvp|rectangle-ellipsis:1968okbbix|rectangle-goggles:162gswdeda|rectangle-horizontal:pbitk7k74|rectangle-vertical:pmrm0f7fx|recycle:144fmhmc9d|redo:1778rbhxit|redo-2:1d4d1sm39b|redo-dot:15nlep0mer|refresh-ccw:ukujpocqa|refresh-ccw-dot:166unjb8mn|refresh-cw:r8mj3xgey|refresh-cw-off:1a2opr1zdr|refrigerator:uq8zn4a1k|regex:s62pfffni|remove-formatting:zo993mtuh|repeat:1drqdqtjie|repeat-1:1d4ep983jc|repeat-2:sq7sh1lh2|replace:w0uayognn|replace-all:r1yckeq0p|reply:1d5o7ey87q|reply-all:15ynai85ic|"
    .. "rewind:186jtyt8vv|ribbon:s2qv9forj|rocket:sawtgmrrr|rocking-chair:1bzl9v40v3|roller-coaster:1byryl4v6o|rotate-3d:1ciaf62obp|rotate-ccw:10pycfuqpe|rotate-ccw-key:pk63kgt4x|rotate-ccw-square:10fw5tjs80|rotate-cw:wxtwb52y6|rotate-cw-square:xgjknp9d2|route:w799bx4ir|route-off:u8pgny3ih|router:1aa7z4gbz7|rows-2:1drbzlzxqc|rows-3:p517ro69b|rows-4:t6d0pwwcn|rss:qgp92x54m|ruler:t1jah2az4|ruler-dimension-line:15g3bwvrpt|russian-ruble:12lg4vlnv7|sailboat:1d0k2q33uu|salad:yevqxckug|sandwich:tygbxcwlm|satellite:w1bqg7dwu|satellite-dish:1dbuevyqz6|saudi-riyal:13feombrpe|save:18xwpzlflr|save-all:1atwhwwr7a|save-off:10j1i75lrm|scale:168lkc5jfu|scale-3d:x2plxo6bf|scaling:po6m3onsc|scan:u5qf6v95y|scan-barcode:p8u2ed8hc|scan-eye:yn6qq7bqo|scan-face:13x85kiwg3|scan-heart:18z9gpaikk|scan-line:18fo3snpl6|scan-qr-code:19xxx7pfpy|scan-search:17tusz31yk|scan-text:tb5lg9j3q|school:t8xh8a9sk|scissors:q6dfvfme5|scissors-line-dashed:10c3k9hnxq|screen-share:11pxctxbr8|screen-share-off:10336xg5bs|scroll:18l0wtldrc|scroll-text:ut5x5d3v0|search:18j0dgxs0p|search-check:10bc96sval|search-code:123o9ybfjw|search-slash:1dp12yjboz|search-x:r5t6mhgoc|section:1axpocwvxw|send:16kzj1pl3d|send-horizontal:197vkdhy76|send-to-back:1196caehjf|separator-horizontal:1cbngnwx9f|separator-vertical:sq1wrts2o|server:pldqc29s7|server-cog:smcv8yg4b|server-crash:10xxhynr8n|server-off:xvegiv0uc|settings:zyrv4p4ha|settings-2:qpeowynv2|shapes:xi6u66twv|share:15m5px0mcc|share-2:19kg4619ky|sheet:18aqkax6re|shell:18vb42l49n|shield:tyo00z5sg|shield-alert:wsge4qeat|shield-ban:108d5ch0jq|shield-check:tkw8r35wg|shield-ellipsis:x15g4tbwg|shield-half:191ckzv18x|shield-minus:1a7pcogf0k|shield-off:1azo17ekmi|shield-plus:tkyvs24qz|shield-question-mark:19iqsl46mg|shield-user:zb85341pc|shield-x:vvyl1cwg9|ship:16flb7i95f|ship-wheel:zjgufsey7|s"
    .. "hirt:zjgftb8zi|shopping-bag:19o2ejz6yy|shopping-basket:1dbv40h29r|shopping-cart:qgpjxo4a2|shovel:wyssnfrfg|shower-head:q3gaa61f0|shredder:1d8fmltyrn|shrimp:15ciq9hghn|shrink:vhmvy9kta|shrub:rafyv5b2w|shuffle:16a0cy7t3y|sigma:xvnn50gnn|signal:ulhojv5ja|signal-high:p9c1xq5ez|signal-low:1ajczisc12|signal-medium:zkaazkf6s|signal-zero:19qnjdlzb4|signature:12srz38qvu|signpost:piydr0vkj|signpost-big:102nysgerm|siren:1byr2d3gu8|skip-back:zkrxwsmve|skip-forward:y5inl0tuu|skull:vouo425y6|slack:10rqtry63z|slash:sgkfkilun|slice:13bbagaimi|sliders-horizontal:10veosepc3|sliders-vertical:11eui97e8h|smartphone:12t0zpssgb|smartphone-charging:xgm1muwx1|smartphone-nfc:12awrtcdm0|smile:prhewmiwj|smile-plus:qfx9guv9p|snail:13y5cal15g|snowflake:t8uanu06t|soap-dispenser-droplet:15lb5aflxl|sofa:sehth906d|soup:110zy5f723|space:1814k04sqo|spade:ra6km0u9j|sparkle:18tyv7radk|sparkles:1aalxbwrkx|speaker:1d0wcnzktm|speech:1cwsyf8qf3|spell-check:rqgrpvi0w|spell-check-2:xt7kb5von|spline:19erftehr1|spline-pointer:17p6czo8e2|split:13t8c9a034|spool:12qhoxg0ew|spotlight:v2r60qgw4|spray-can:17445ggnbr|sprout:15dzhdko3o|square:y7arnq6pb|square-activity:1dqs43qldr|square-arrow-down:11xlv1tdqt|square-arrow-down-left:181w9z17pz|square-arrow-down-right:q2pt7halc|square-arrow-left:1dursuytjr|square-arrow-out-down-left:vl4s9vs7q|square-arrow-out-down-right:s2zg2g28f|square-arrow-out-up-left:1dlgg4jpdg|square-arrow-out-up-right:qq3rcresg|square-arrow-right:1cviq5cfth|square-arrow-up:uqfahvmy9|square-arrow-up-left:pj8n5l342|square-arrow-up-right:10kx050bnl|square-asterisk:wdh5jhuyl|square-bottom-dashed-scissors:ptfe9lbwp|square-chart-gantt:15tz2zjm1z|square-check:1aj9zlj2kv|square-check-big:x320buzeo|square-chevron-down:1ar7anydzp|square-chevron-left:191r4glcts|square-chevron-right:tnhi7dvcf|square-chevron-up:pq88b"
    .. "sp87|square-code:18axu6s7d1|square-dashed:s2gkqg8q0|square-dashed-bottom:vlqhdjad9|square-dashed-bottom-code:157zwa5c1b|square-dashed-kanban:16w60c8doo|square-dashed-mouse-pointer:1aepsdjebo|square-dashed-top-solid:183oatdq8k|square-divide:1cn1d6ms42|square-dot:15thh20ttg|square-equal:172jr0tkna|square-function:uk1gtwez6|square-kanban:x2fflm5m5|square-library:15htsfprvi|square-m:150q18yh7z|square-menu:sxh4p0gzn|square-minus:pgqdvhmjn|square-mouse-pointer:x6m31cmx6|square-parking:1a0cyqqhw4|square-parking-off:q2pp7mcj6|square-pause:190fwc1g97|square-pen:xi7osiflk|square-percent:198mg3krfo|square-pi:13854c1nyb|square-pilcrow:s51w65uda|square-play:12x1yggokk|square-plus:pyguw4dlg|square-power:132pzg0j99|square-radical:1d1w9fgdfq|square-round-corner:15q23ubl1f|square-scissors:qncva5y9k|square-sigma:1am52arqcm|square-slash:13rqgcrp6q|square-split-horizontal:yltl2qvda|square-split-vertical:11wwcp6owi|square-square:snj4oz2po|square-stack:1828sb2wmp|square-star:14s871lvnb|square-stop:13m9x4992o|square-terminal:x32vur4gg|square-user:plym49m38|square-user-round:1c24zim1kv|square-x:11ycvn0rzt|squares-exclude:q4dk828ct|squares-intersect:ycup3s6qn|squares-subtract:v19vzq2bw|squares-unite:17bd9t38ni|squircle:tezq91wuz|squircle-dashed:15zg3e2k61|squirrel:q2p94nsw5|stamp:1705eajym0|star:19a5s4z4lt|star-half:1as1gygbjw|star-off:pl1vt7zn7|step-back:uayqjletv|step-forward:14du8ibtqn|stethoscope:11kfq5czg2|sticker:1945xjdlhv|sticky-note:13qgnriaaz|store:1bfpzckyu9|stretch-horizontal:1auae8py82|stretch-vertical:qpzz5b1iu|strikethrough:tr8uw20l8|subscript:146zccz2hi|sun:sbm97naq0|sun-dim:1131e07kmc|sun-medium:wh4wd4k9l|sun-moon:sbyvpo405|sun-snow:1cpjbj5k5g|sunrise:1c26zy6wbs|sunset:q4n596yqw|superscript:prbq08bj2|swatch-book:19j75rmjnc|swiss-franc:1cgckcf7ji|switch-camera:1du9punv32|sword:q"
    .. "lc1nonko|swords:vu4jnc7i1|syringe:rwppcvv1z|table:uqx73x2ub|table-2:18495rm3jp|table-cells-merge:10sfidgrz3|table-cells-split:1crpoav0pi|table-columns-split:13w0ql1pml|table-of-contents:17pa6tpehb|table-properties:11rgtg86zs|table-rows-split:soixc3cew|tablet:ytl8vmla1|tablet-smartphone:t8xhqjtjv|tablets:1669fg000g|tag:10ld884bou|tags:10e48yx8n9|tally-1:13bnlqljw0|tally-2:xdwz7ordw|tally-3:18a0lkl4yt|tally-4:wtj9ozds3|tally-5:1cygsdr5sh|tangent:14um19uqcx|target:sq3d3402y|telescope:13mt0xuiew|tent:1c5dl2w5qb|tent-tree:rrwl1rcs9|terminal:q0tu0edof|test-tube:12hed7fzi9|test-tube-diagonal:13muu6g2zt|test-tubes:tukgbjz7f|text:wsxnjkq11|text-cursor:p9w8boimg|text-cursor-input:sx0iks136|text-quote:10nq89wf97|text-search:169iah4slc|text-select:1247dhksfe|theater:til5xrizd|thermometer:11eqimkmnx|thermometer-snowflake:19ylfrlr12|thermometer-sun:pq2ac4l7h|thumbs-down:11fl5t6moj|thumbs-up:po1br2ycg|ticket:10zfnn9eql|ticket-check:18jkhy7bhu|ticket-minus:18ch93gn9t|ticket-percent:q0hpbd0nu|ticket-plus:wludquish|ticket-slash:vj1slaokt|ticket-x:16myf88tnx|tickets:19h59usxg0|tickets-plane:137txjklrs|timer:y2ksg4tra|timer-off:q343sqkej|timer-reset:14uv5gsbno|toggle-left:18rfpo38nt|toggle-right:1byrf8ghhn|toilet:tdcm53r4x|tool-case:1b7yu56dpl|tornado:1688nx8q9w|torus:1bwinjcpg1|touchpad:13li9pgxau|touchpad-off:13p6o6xwi5|tower-control:1aw2y8npgf|toy-brick:whjdts38b|tractor:ylqcfk82n|traffic-cone:1dhp4q740a|train-front:yz7rhyx84|train-front-tunnel:14psydeouz|train-track:16lsgc5ef9|tram-front:wd678y96q|transgender:13im0kzzuu|trash:15faiekuhg|trash-2:s7bkzbiu0|tree-deciduous:1aiaw6zdyy|tree-palm:19fhs87qbw|tree-pine:w6dd3ryfe|trees:yxv12f0az|trello:128vtjgpc9|trending-down:15sqljyn53|trending-up:15fkrzuy2f|trending-up-down:10rj7nlg8o|triangle:11ypc3hngc|triangle-alert:r6xchcmzv|triangle-dash"
    .. "ed:ttnzcgvta|triangle-right:ym8yqsmw2|trophy:z9b0pk1be|truck:10ah03vyp9|truck-electric:123terfsdt|turkish-lira:yv8ye4q4n|turntable:19vl4y2k3k|turtle:188f6mxnt1|tv:wlpikcscj|tv-minimal:10e8hbomb1|tv-minimal-play:1bflnco2nt|twitch:rsp1oygsh|type:17lqg370tt|type-outline:qsorr8our|umbrella:1a564clktf|umbrella-off:17uhgigtsh|underline:uhial35r8|undo:yz7l6i68t|undo-2:17p9t5xnxg|undo-dot:yefbiioh8|unfold-horizontal:109pzu25fd|unfold-vertical:134r6gasys|ungroup:15dzo4pys2|university:11czieuaga|unlink:14omt0196m|unlink-2:u4fdeo0xc|unplug:p8qtm0lmz|upload:txn5diqbd|usb:17byeldrm2|user:t149w69q7|user-check:180oxvtlpa|user-cog:1az7mexr9y|user-lock:109i06xxpx|user-minus:1dchgv354q|user-pen:12nr451h3g|user-plus:pxpsw3iw5|user-round:17ev49niba|user-round-check:15eqok7fyu|user-round-cog:t1j5toumw|user-round-minus:1ah0j91g98|user-round-pen:veeg5o0au|user-round-plus:psfyohcnj|user-round-search:177tlwh6cb|user-round-x:1bbjai1fre|user-search:wfyqvds92|user-star:113qto23ov|user-x:tfdq8c2fq|users:12n8rxmz00|users-round:q4qtgq7wg|utensils:wq75h4fs2|utensils-crossed:14wclsi8xh|utility-pole:ruasqg4zj|variable:12gi6bk5oo|vault:18kfqtlf40|vector-square:16kemsy46u|vegan:1be21m0zi2|venetian-mask:q8a69z9y1|venus:rbr9t3yqg|venus-and-mars:u8xt529sc|vibrate:xgwqcit4x|vibrate-off:10vucdbeqs|video:16us8u7o2i|video-off:yxv3cw8ve|videotape:137axvzxf8|view:y3826do5f|voicemail:1a16i1bmso|volleyball:scnx2rhtx|volume:1cjjff8thc|volume-1:r3kpzaspm|volume-2:19868eto2h|volume-off:r3f1dbwoo|volume-x:10cq2xv81w|vote:13e39t2chq|wallet:tb8y0gndm|wallet-cards:1agvfmobkn|wallet-minimal:114udl3k8u|wallpaper:197f716ilf|wand:zj8vn6yg4|wand-sparkles:12v26psfkd|warehouse:15hl6bwdwy|washing-machine:18269d9wik|watch:y946mwvf2|waves:1azapg5tgm|waves-ladder:1acr77r04n|waypoints:vr47zbp48|webcam:za9foxyrf|webhook:196y6r1s3q|webh"
    .. "ook-off:xdct6fbtu|weight:oz1a6yhl6|wheat:ptcafjlc3|wheat-off:1bhbt9fd43|whole-word:tfu7m1xik|wifi:zxgblb0cf|wifi-cog:ukvbkuvp4|wifi-high:1dgzjw3b9g|wifi-low:19voevyujh|wifi-off:19iwryifr6|wifi-pen:12si41y26q|wifi-sync:1bpjbaltw4|wifi-zero:1au9sexhvn|wind:q7pfw7acs|wind-arrow-down:11yvd7oyy4|workflow:18g8o083t5|worm:136xpt9lin|wrap-text:165jlq6o12|wrench:12jxkrp59n|x:pwfyfte5x|youtube:zmul1cisl|zap:zab8e6pst|zap-off:13xcdiylqv|zoom-in:1avpxpgc5q|zoom-out:12uqck5a5e|beer-off:1cxhrck0sq|beer:16qsof0nkw|bottle-wine:x7slrjpep|cannabis:1a4o2s63d3|chart-network:15du6v2ue5|cigarrete-off:u9adlisc9|cigarette:ruagilzlt|indian-rupee:1dlepbjtd6|twitter:to2oo8v6r|wine-off:19j0pm24e5|wine:q2cf4nom7"

local NebulaLucide = {}
for name, code in ICON_DATA:gmatch("([^:|]+):([0-9a-z]+)") do
    NebulaLucide[name] = tonumber(code, 36)
end
for name, assetId in pairs(NebulaLucide) do
    if not Icons[name] then
        Icons[name] = { assetId, 0, 0, 0 }
    end
end
local function resolveIcon(name)
    if type(name) ~= "string" then
        return nil
    end
    local key = name:lower():gsub("^lucide:", ""):gsub("^lucide%-", ""):gsub("_", "-")
    return Icons[key]
end

local Radius = { xs = 4, sm = 6, md = 9, lg = 12, xl = 16, pill = 999 }
local Dur = { instant = 0, fast = 0.1, base = 0.16, smooth = 0.28, slow = 0.42, slowest = 0.6 }
local Space = { nest = 4, row = 6, section = 12 }

local FAST = TweenInfo.new(Dur.base, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local SMOOTH = TweenInfo.new(Dur.smooth, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local BOUNCE = TweenInfo.new(Dur.slow, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

local function Create(className, props, children)
    local instance = Instance.new(className)
    local parent
    for key, value in pairs(props or {}) do
        if key == "Parent" then
            parent = value
        else
            instance[key] = value
        end
    end

    if instance:IsA("GuiBase2d") then
        instance.AutoLocalize = false
    end
    for _, child in ipairs(children or {}) do
        child.Parent = instance
    end
    if parent then
        instance.Parent = parent
    end
    return instance
end

local function Corner(radius)
    return Create("UICorner", { CornerRadius = UDim.new(0, radius) })
end

local function Stroke(color, transparency)
    return Create("UIStroke", {
        Color = color,
        Thickness = 1,
        Transparency = transparency or 0,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    })
end

local function Padding(top, right, bottom, left)
    return Create("UIPadding", {
        PaddingTop = UDim.new(0, top),
        PaddingRight = UDim.new(0, right or top),
        PaddingBottom = UDim.new(0, bottom or top),
        PaddingLeft = UDim.new(0, left or right or top),
    })
end

local function List(spacing, direction)
    return Create("UIListLayout", {
        Padding = UDim.new(0, spacing or 0),
        FillDirection = direction or Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
end

local function Flow(container, spacing)
    local function uiScale()
        local node = container
        while node do
            local scaleObject = node:FindFirstChildOfClass("UIScale")
            if scaleObject and scaleObject.Scale > 0.01 then
                return scaleObject.Scale
            end
            node = node.Parent
        end
        return 1
    end
    local function childHeight(child)
        local size = child.Size
        if size.Y.Scale == 0 and size.Y.Offset > 0 then
            return size.Y.Offset
        end
        return child.AbsoluteSize.Y / uiScale()
    end
    local function apply()
        local items = {}
        for _, child in ipairs(container:GetChildren()) do
            if child:IsA("GuiObject") then
                table.insert(items, child)
            end
        end
        table.sort(items, function(a, b)
            if a.LayoutOrder ~= b.LayoutOrder then
                return a.LayoutOrder < b.LayoutOrder
            end
            return a.Name < b.Name
        end)
        local offset, count = 0, 0
        for _, child in ipairs(items) do
            if child.Visible then
                child.Position = UDim2.new(0, 0, 0, offset)
                offset = offset + childHeight(child) + spacing
                count = count + 1
            end
        end
        if count > 0 then
            offset = offset - spacing
        end
        local x = container.Size.X
        container.Size = UDim2.new(x.Scale, x.Offset, 0, math.max(0, offset))
    end
    local function watch(child)
        if child:IsA("GuiObject") then
            child:GetPropertyChangedSignal("Size"):Connect(apply)
            child:GetPropertyChangedSignal("Visible"):Connect(apply)
            child:GetPropertyChangedSignal("LayoutOrder"):Connect(apply)
        end
    end
    for _, child in ipairs(container:GetChildren()) do
        watch(child)
    end
    container.ChildAdded:Connect(function(child)
        watch(child)
        apply()
        task.defer(apply)
    end)
    container.ChildRemoved:Connect(function()
        task.defer(apply)
    end)
    task.defer(apply)
    return apply
end

local function Label(props)
    local label = Create("TextLabel", {
        BackgroundTransparency = 1,
        FontFace = Fonts.Regular,
        TextSize = 15,
        TextColor3 = Theme.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        TextTruncate = Enum.TextTruncate.AtEnd,
    })
    for key, value in pairs(props) do
        label[key] = value
    end
    return label
end

local function Icon(name, props)
    local data = resolveIcon(name)
    local image = Create("ImageLabel", {
        BackgroundTransparency = 1,
        Image = data and ("rbxassetid://" .. data[1])
            or (type(name) == "string" and name:find("^rbxasset") and name or ""),
        ImageRectSize = data and data[4] ~= 0 and Vector2.new(48, 48) or Vector2.zero,
        ImageRectOffset = data and Vector2.new(data[2], data[3]) or Vector2.zero,
        ScaleType = Enum.ScaleType.Fit,
    })
    for key, value in pairs(props or {}) do
        image[key] = value
    end
    return image
end

local LineBrandAssets = {
    logo = { path = "LINE/brand/logo-v4.png", url = "https://line.pastebdn.workers.dev/logo-ui.png?v=1" },
    minimized = { path = "LINE/brand/logo-v4.png", url = "https://line.pastebdn.workers.dev/logo-ui.png?v=1" },
}
local LineBrandResolved, LineBrandPending = {}, {}

local function LineBrandResolve(kind)
    if LineBrandResolved[kind] then
        return LineBrandResolved[kind]
    end
    local spec = LineBrandAssets[kind]
    if not spec then
        return nil
    end
    local custom = envFunction("getcustomasset")
        or envFunction("getsynasset")
        or namespaceFunction("syn", "getcustomasset")
    local read, exists = envFunction("readfile"), envFunction("isfile")
    local write = envFunction("writefile")
    if not custom or not read or not exists then
        return nil
    end
    local ok, asset = pcall(function()
        local valid = exists(spec.path) and read(spec.path):sub(1, 8) == "\137PNG\r\n\26\n"
        if not valid then
            assert(write, "writefile is required to cache the brand image")
            local folder = spec.path:match("^(.*)/[^/]+$")
            local makeFolder, isFolder = envFunction("makefolder"), envFunction("isfolder")
            if folder and makeFolder and isFolder and not isFolder(folder) then
                pcall(makeFolder, folder)
            end
            local send = envFunction("request") or envFunction("http_request")
            local body
            if send then
                local fetched, response = pcall(send, { Url = spec.url, Method = "GET", Timeout = 12 })
                if fetched and type(response) == "table" then
                    body = response.Body or response.body
                end
            end
            if type(body) ~= "string" then
                body = game:HttpGet(spec.url)
            end
            assert(type(body) == "string" and body:sub(1, 8) == "\137PNG\r\n\26\n", "Brand image download failed")
            write(spec.path, body)
        end
        assert(exists(spec.path), "Brand image cache missing")
        return custom(spec.path)
    end)
    if ok then
        LineBrandResolved[kind] = asset
        return asset
    end
    warn("[Line] Brand image unavailable: " .. tostring(asset))
    return nil
end
local function LineBrandImage(parent, kind, zIndex)
    local image = Instance.new("ImageLabel")
    image.Name = kind == "minimized" and "LineMinimizedIcon" or "LineLogo"
    image.BackgroundTransparency = 1
    image.BorderSizePixel = 0
    if kind == "minimized" then

        local mask = Instance.new("UICorner")
        mask.Name = "LineIconMask"
        mask.CornerRadius = UDim.new(0.235, 0)
        mask:SetAttribute("NoTheme", true)
        mask:SetAttribute("NoGradient", true)
        mask.Parent = image
    end
    image.Size = UDim2.fromScale(1, 1)
    image.ImageColor3 = Color3.new(1, 1, 1)
    image.ScaleType = Enum.ScaleType.Fit
    image.ZIndex = zIndex or parent.ZIndex
    image:SetAttribute("NoTheme", true)
    image:SetAttribute("NoGradient", true)

    local function fitTexture()

        image.ImageRectOffset = Vector2.zero
        image.ImageRectSize = Vector2.zero
    end
    image:GetPropertyChangedSignal("IsLoaded"):Connect(fitTexture)
    image.Parent = parent
    task.spawn(function()
        local deadline = os.clock() + 20
        while image.Parent and not image.IsLoaded and os.clock() < deadline do
            task.wait(0.05)
        end
        if image.Parent then
            fitTexture()
        end
    end)
    if LineBrandResolved[kind] then
        image.Image = LineBrandResolved[kind]
        fitTexture()
        return image
    end
    task.spawn(function()
        if LineBrandPending[kind] then
            repeat
                task.wait()
            until not LineBrandPending[kind]
        else
            LineBrandPending[kind] = true
            LineBrandResolve(kind)
            LineBrandPending[kind] = nil
        end
        if image.Parent and LineBrandResolved[kind] then
            image.Image = LineBrandResolved[kind]
            fitTexture()
        end
    end)
    return image
end

local function brandFallback(button, textSize)
    if button:FindFirstChild("LineFallbackMark") then
        return
    end
    if button.BackgroundTransparency > 0.5 then
        button.BackgroundColor3 = Theme.Elevated
        button.BackgroundTransparency = 0.05
    end
    local stroke = Instance.new("UIStroke")
    stroke.Name = "LineFallbackStroke"
    stroke.Color = Theme.Stroke
    stroke.Thickness = 1
    stroke:SetAttribute("NoTheme", true)
    stroke:SetAttribute("NoGradient", true)
    stroke.Parent = button
    local mark = Instance.new("TextLabel")
    mark.Name = "LineFallbackMark"
    mark.Size = UDim2.fromScale(1, 1)
    mark.BackgroundTransparency = 1
    mark.Text = "N"
    mark.Font = Enum.Font.GothamBlack
    mark.TextSize = textSize or 22
    mark.TextColor3 = Color3.new(1, 1, 1)
    mark.ZIndex = (button.ZIndex or 1) + 2
    mark:SetAttribute("NoTheme", true)
    mark:SetAttribute("NoGradient", true)
    mark.Parent = button

    local function settle()
        local icon = button:FindFirstChild("LineMinimizedIcon")
        local ready = icon and icon:IsA("ImageLabel") and icon.Image ~= "" and icon.IsLoaded
        mark.Visible = not ready
    end
    local icon = button:FindFirstChild("LineMinimizedIcon")
    if icon then
        icon:GetPropertyChangedSignal("Image"):Connect(settle)
        icon:GetPropertyChangedSignal("IsLoaded"):Connect(settle)
    end
    settle()
    task.delay(2, settle)
end

local function Brand(parent, logo, tile, textSize, zIndex, bare)
    parent.BackgroundTransparency = 1
    parent:SetAttribute("NoGradient", true)
    local image = LineBrandImage(parent, "logo", zIndex)
    if not (image and image.Image ~= "") then
        local mark = Instance.new("TextLabel")
        mark.Name = "LineMark"
        mark.Size = UDim2.fromScale(1, 1)
        mark.BackgroundTransparency = 1
        mark.Text = "N"
        mark.Font = Enum.Font.GothamBlack
        mark.TextScaled = true
        mark.TextColor3 = Color3.new(1, 1, 1)
        mark.Parent = parent
    end
    return image
end

local function Tween(object, info, goals)
    local tween = TweenService:Create(object, info, goals)
    tween:Play()
    return tween
end

local function isPointer(input)
    return input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch
end

local capturedPointer
local function claimPointer(input)
    if not isPointer(input) or capturedPointer then
        return false
    end
    capturedPointer = input
    return true
end
local function movesPointer(owner, input)
    return owner ~= nil
        and capturedPointer == owner
        and (
            input == owner
            or (
                owner.UserInputType == Enum.UserInputType.MouseButton1
                and input.UserInputType == Enum.UserInputType.MouseMovement
            )
        )
end
local function endsPointer(owner, input)
    if owner == nil or input ~= owner or capturedPointer ~= owner then
        return false
    end
    if capturedPointer == owner then
        capturedPointer = nil
    end
    return true
end
local function boundedCenter(point, size, vp, header)
    local half = size / 2

    local gripX = math.min(64, vp.X / 2, size.X / 2)
    local gripY = math.min(64, vp.Y / 2, size.Y / 2)
    return Vector2.new(
        math.clamp(point.X, gripX - half.X, vp.X - gripX + half.X),
        math.clamp(point.Y, gripY - half.Y, vp.Y - gripY + half.Y)
    )
end

local function round(value, step)
    return math.floor(value / step + 0.5) * step
end

local function formatNumber(value, step)
    local decimals = 0
    local s = tostring(step)
    local dot = s:find("%.")
    if dot then
        decimals = #s - dot
    end
    return string.format("%." .. decimals .. "f", value)
end

local function colorToHex(color)
    return string.format(
        "%02X%02X%02X",
        math.floor(color.R * 255 + 0.5),
        math.floor(color.G * 255 + 0.5),
        math.floor(color.B * 255 + 0.5)
    )
end

local function hexToColor(hex)
    hex = tostring(hex):gsub("#", ""):gsub("%s", "")
    if #hex == 3 then
        hex = hex:sub(1, 1):rep(2) .. hex:sub(2, 2):rep(2) .. hex:sub(3, 3):rep(2)
    end
    if #hex ~= 6 or hex:find("[^%x]") then
        return nil
    end
    return Color3.fromRGB(tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16))
end

local KEY_ALIASES = {
    LeftShift = "LShift",
    RightShift = "RShift",
    LeftControl = "LCtrl",
    RightControl = "RCtrl",
    LeftAlt = "LAlt",
    RightAlt = "RAlt",
    LeftSuper = "LSuper",
    RightSuper = "RSuper",
    MouseButton1 = "MB1",
    MouseButton2 = "MB2",
    MouseButton3 = "MB3",
    Backquote = "`",
    Minus = "-",
    Equals = "=",
    LeftBracket = "[",
    RightBracket = "]",
    Semicolon = ";",
    Quote = "'",
    Comma = ",",
    Period = ".",
    Slash = "/",
    BackSlash = "\\",
    Return = "Enter",
    CapsLock = "Caps",
    PageUp = "PgUp",
    PageDown = "PgDn",
    Insert = "Ins",
    Delete = "Del",
    One = "1",
    Two = "2",
    Three = "3",
    Four = "4",
    Five = "5",
    Six = "6",
    Seven = "7",
    Eight = "8",
    Nine = "9",
    Zero = "0",
}

local function keyName(key)
    if not key then
        return "None"
    end
    return KEY_ALIASES[key.Name] or key.Name
end

local function keyFromName(name)
    if type(name) ~= "string" or name == "None" then
        return nil
    end
    local ok, key = pcall(function()
        return Enum.KeyCode[name]
    end)
    if ok and key then
        return key
    end
    ok, key = pcall(function()
        return Enum.UserInputType[name]
    end)
    return ok and key or nil
end

local Library = {
    Flags = {},
    Options = {},
    ToggleKey = Enum.KeyCode.RightShift,
    Open = true,
    Unloaded = false,
    NotificationsEnabled = true,
    UserScale = 1,
    Folder = "LINE",
    _connections = {},
    _unloadCallbacks = {},
    _binds = {},
    _listening = false,
    _order = 0,
}

function Library:HasIcon(name)
    return resolveIcon(name) ~= nil
end
function Library:GetIcon(name)
    local data = resolveIcon(name)
    if not data then
        return nil
    end
    return {
        Image = "rbxassetid://" .. data[1],
        ImageRectSize = data[4] == 0 and Vector2.zero or Vector2.new(48, 48),
        ImageRectOffset = Vector2.new(data[2], data[3]),
    }
end
function Library:GetIconNames(query)
    local names = {}
    local filter = type(query) == "string" and query:lower() or ""
    for name in pairs(Icons) do
        if filter == "" or name:find(filter, 1, true) then
            table.insert(names, name)
        end
    end
    table.sort(names)
    return names
end
Library.IconCount = #Library:GetIconNames()

local function Connect(signal, callback)
    local connection = signal:Connect(callback)
    table.insert(Library._connections, connection)
    return connection
end

Connect(UserInputService.WindowFocusReleased, function()
    capturedPointer = nil
end)

local function nextOrder()
    Library._order += 1
    return Library._order
end

local function safeCall(callback, ...)
    if type(callback) ~= "function" then
        return
    end
    local args = table.pack(...)
    task.spawn(function()
        local ok, err = pcall(callback, table.unpack(args, 1, args.n))
        if not ok then
            warn("[LINE] callback error: " .. tostring(err))
        end
    end)
end

function Library:OnUnload(callback)
    table.insert(self._unloadCallbacks, callback)
end

local ScreenGui = Create("ScreenGui", {
    Name = "LINE",
    ResetOnSpawn = false,
    IgnoreGuiInset = true,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 2147483647,
})

do

    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end
Library.ScreenGui = ScreenGui
Library.LineBrandVersion = "png-rounded-v3"
Library.Build = "2.6.0-announcer-stack"

local cursorSnapshot
local cursorBinding = "LineNoirCursor_" .. HttpService:GenerateGUID(false)
local function restoreMenuCursor()
    if not cursorSnapshot then
        return
    end
    local saved = cursorSnapshot
    cursorSnapshot = nil

    if game:GetService("GuiService").MenuIsOpen then
        return
    end

    if UserInputService.MouseIconEnabled ~= saved.icon then
        UserInputService.MouseIconEnabled = saved.icon
    end
end
function Library:_syncMenuCursor()
    local window = self.Window

    local panelVisible = self.Open and not self.Minimized and window and window.Frame and window.Frame.Visible
    local ownsInput = not self.Unloaded and ScreenGui.Enabled and (self._keyPromptActive or panelVisible)
    if ownsInput and UserInputService.MouseEnabled then
        if not cursorSnapshot then
            cursorSnapshot = { icon = UserInputService.MouseIconEnabled }
        end

        if UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
            UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        end

        if
            UserInputService.MouseBehavior ~= Enum.MouseBehavior.LockCurrentPosition
            and not UserInputService.MouseIconEnabled
        then
            UserInputService.MouseIconEnabled = true
        end
    else
        restoreMenuCursor()
    end
end
Connect(UserInputService:GetPropertyChangedSignal("MouseBehavior"), function()
    if not Library.Unloaded then
        Library:_syncMenuCursor()
    end
end)
Connect(UserInputService:GetPropertyChangedSignal("MouseIconEnabled"), function()
    if not Library.Unloaded then
        Library:_syncMenuCursor()
    end
end)
RunService:BindToRenderStep(cursorBinding, Enum.RenderPriority.Last.Value + 100, function()
    if Library.Unloaded then
        return
    end
    Library:_syncMenuCursor()
end)
Library:OnUnload(function()
    RunService:UnbindFromRenderStep(cursorBinding)
    restoreMenuCursor()
end)

do
    local surfaces = {}
    local saved

    function Library:_blockWheel(gui)
        table.insert(surfaces, gui)
    end

    local function pointerOverSurface()
        local mouse = UserInputService:GetMouseLocation()
        local p = mouse - game:GetService("GuiService"):GetGuiInset()
        for index = #surfaces, 1, -1 do
            local gui = surfaces[index]
            if not gui.Parent then
                table.remove(surfaces, index)
            elseif gui.Visible and gui:IsDescendantOf(game) then
                local a, s = gui.AbsolutePosition, gui.AbsoluteSize
                if p.X >= a.X and p.X <= a.X + s.X and p.Y >= a.Y and p.Y <= a.Y + s.Y then
                    return true
                end
            end
        end
        return false
    end

    local function pin()
        local camera = Workspace.CurrentCamera
        if saved or not camera then
            return
        end
        saved = { Min = LocalPlayer.CameraMinZoomDistance, Max = LocalPlayer.CameraMaxZoomDistance }
        local distance = (camera.CFrame.Position - camera.Focus.Position).Magnitude
        distance = math.clamp(distance, saved.Min, saved.Max)
        LocalPlayer.CameraMaxZoomDistance = distance
        LocalPlayer.CameraMinZoomDistance = distance
    end

    local function release()
        if not saved then
            return
        end

        LocalPlayer.CameraMaxZoomDistance = saved.Max
        LocalPlayer.CameraMinZoomDistance = saved.Min
        saved = nil
    end

    Connect(RunService.Heartbeat, function()
        if not UserInputService.MouseEnabled then
            return
        end
        if pointerOverSurface() then
            pin()
        else
            release()
        end
    end)
    Library:OnUnload(release)
    Library._releaseWheel = release

    function Library:SetMaxZoom(value)
        if saved then
            saved.Max = value
        else
            LocalPlayer.CameraMaxZoomDistance = value
        end
    end
end

do
    local tip = Create("Frame", {
        Name = "Tooltip",
        Size = UDim2.fromOffset(0, 28),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Theme.Elevated,
        BackgroundTransparency = 1,
        Visible = false,
        ZIndex = 60,
        Parent = ScreenGui,
    }, { Corner(Radius.sm), Padding(0, 10, 0, 10) })
    local tipStroke = Stroke(Theme.Stroke, 1)
    tipStroke.Parent = tip
    local tipText = Label({
        Size = UDim2.fromOffset(0, 28),
        AutomaticSize = Enum.AutomaticSize.X,
        TextSize = 13,
        TextTransparency = 1,
        TextTruncate = Enum.TextTruncate.None,
        ZIndex = 61,
        Parent = tip,
    })

    local owner, token = nil, 0
    local function place()

        local mouse = UserInputService:GetMouseLocation()
        local size = tip.AbsoluteSize
        local vp = ScreenGui.AbsoluteSize
        local x = math.min(mouse.X + 14, vp.X - size.X - 8)
        local y = math.min(mouse.Y + 20, vp.Y - size.Y - 8)
        tip.Position = UDim2.fromOffset(math.floor(x), math.floor(y))
    end
    local function hide()
        token += 1
        owner = nil
        local mine = token
        Tween(tip, FAST, { BackgroundTransparency = 1 })
        Tween(tipText, FAST, { TextTransparency = 1 })
        Tween(tipStroke, FAST, { Transparency = 1 })
        task.delay(FAST.Time, function()
            if mine == token then
                tip.Visible = false
            end
        end)
    end

    function Library:_attachTooltip(gui, text)
        if type(text) ~= "string" or text == "" then
            return
        end
        gui.MouseEnter:Connect(function()
            token += 1
            local mine = token
            owner = gui
            task.delay(0.45, function()
                if mine ~= token or owner ~= gui or not gui.Visible then
                    return
                end
                tipText.Text = text
                tip.Visible = true
                place()
                Tween(tip, FAST, { BackgroundTransparency = 0 })
                Tween(tipText, FAST, { TextTransparency = 0 })
                Tween(tipStroke, FAST, { Transparency = 0 })
            end)
        end)
        gui.MouseMoved:Connect(function()
            if owner == gui and tip.Visible then
                place()
            end
        end)
        gui.MouseLeave:Connect(function()
            if owner == gui then
                hide()
            end
        end)
    end
end

local NotifyHolder = Create("Frame", {
    Name = "Notifications",
    AnchorPoint = Vector2.new(1, 1),
    Position = UDim2.new(1, -16, 1, -16),
    Size = UDim2.new(0, 310, 1, -32),
    BackgroundTransparency = 1,
    ZIndex = 50,
    Parent = ScreenGui,
}, {
    Create("UIListLayout", {
        Padding = UDim.new(0, 0),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
    }),
})

function Library:Notify(options)
    if type(options) == "string" then
        options = { Title = options }
    end
    options = options or {}
    if not self.NotificationsEnabled and not options.Force then
        return
    end
    local duration = options.Duration or 4

    local wrapper = Create("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = nextOrder(),
        ZIndex = 50,
        Parent = NotifyHolder,
    }, { Create("UIPadding", { PaddingTop = UDim.new(0, 8) }) })

    local card = Create("Frame", {
        BackgroundColor3 = Theme.Surface,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Position = UDim2.fromOffset(320, 0),
        ZIndex = 50,
        Parent = wrapper,
    }, {
        Corner(Radius.lg),
        Stroke(Theme.Stroke),
    })

    local body = Create("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        ZIndex = 50,
        Parent = card,
    }, {
        Padding(14, 16, 20, 56),
        List(3),
    })

    local TYPE_ICONS = { success = "circle-check", warning = "triangle-alert", error = "circle-x", info = "info" }
    local badge = Create("Frame", {
        Position = UDim2.fromOffset(14, 13),
        Size = UDim2.fromOffset(30, 30),
        BackgroundColor3 = Theme.Elevated,
        ZIndex = 51,
        Parent = card,
    }, { Corner(Radius.md), Stroke(Theme.Stroke, 0.4) })
    Icon(options.Icon or TYPE_ICONS[options.Type or "info"] or "bell", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(16, 16),
        ImageColor3 = Theme.Text,
        ZIndex = 52,
        Parent = badge,
    })

    local badgeScale = Create("UIScale", { Scale = 0.6, Parent = badge })
    task.delay(0.12, function()
        Tween(badgeScale, TweenInfo.new(Dur.slow, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
    end)

    Label({
        Text = options.Title or "Notification",
        FontFace = Fonts.SemiBold,
        TextSize = 15,
        Size = UDim2.new(1, 0, 0, 18),
        LayoutOrder = 1,
        ZIndex = 51,
        Parent = body,
    })

    if options.Content and options.Content ~= "" then
        Label({
            Text = options.Content,
            TextSize = 14,
            TextColor3 = Theme.SubText,
            TextWrapped = true,
            TextTruncate = Enum.TextTruncate.None,
            TextYAlignment = Enum.TextYAlignment.Top,
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            LayoutOrder = 2,
            ZIndex = 51,
            Parent = body,
        })
    end

    local track = Create("Frame", {
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.new(0, 16, 1, -9),
        Size = UDim2.new(1, -32, 0, 3),
        BackgroundColor3 = Theme.Elevated,
        BorderSizePixel = 0,
        ZIndex = 51,
        Parent = card,
    }, { Corner(Radius.xs) })
    local bar = Create("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel = 0,
        ZIndex = 52,
        Parent = track,
    }, { Corner(Radius.xs) })

    local closed = false
    local function close()
        if closed then
            return
        end
        closed = true
        Tween(card, SMOOTH, { Position = UDim2.fromOffset(320, 0) })
        task.wait(0.22)
        local height = wrapper.AbsoluteSize.Y
        wrapper.AutomaticSize = Enum.AutomaticSize.None
        wrapper.Size = UDim2.new(1, 0, 0, height)
        wrapper.ClipsDescendants = true
        Tween(wrapper, SMOOTH, { Size = UDim2.new(1, 0, 0, 0) })
        task.wait(0.3)
        wrapper:Destroy()
    end

    local hit = Create("TextButton", {
        Text = "",
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        ZIndex = 53,
        Parent = card,
    })
    hit.Activated:Connect(function()
        task.spawn(close)
    end)

    local hovered = false
    hit.MouseEnter:Connect(function()
        hovered = true
    end)
    hit.MouseLeave:Connect(function()
        hovered = false
    end)
    local remaining = duration
    local timer
    timer = RunService.Heartbeat:Connect(function(dt)
        if closed or not wrapper.Parent then
            timer:Disconnect()
            return
        end
        if not hovered then
            remaining -= dt
            bar.Size = UDim2.fromScale(math.max(remaining / duration, 0), 1)
            if remaining <= 0 then
                timer:Disconnect()
                task.spawn(close)
            end
        end
    end)

    Tween(card, SMOOTH, { Position = UDim2.fromOffset(0, 0) })
end

local KEY_FILE = Library.Folder .. "/key.txt"

function Library:KeySystem(options)
    options = options or {}
    local keys = options.Keys or {}
    local P = {
        Card = Color3.fromRGB(10, 10, 11),
        Field = Color3.fromRGB(19, 19, 21),
        Line = Color3.fromRGB(38, 38, 43),
        Text = Color3.fromRGB(244, 244, 245),
        Sub = Color3.fromRGB(150, 150, 158),
        Muted = Color3.fromRGB(110, 110, 118),
        Accent = typeof(options.Accent) == "Color3" and options.Accent or Color3.fromRGB(232, 190, 110),
        Ink = Color3.fromRGB(12, 12, 13),
        Error = Color3.fromRGB(235, 110, 110),
        Success = Color3.fromRGB(110, 200, 145),
    }

    local function clean(key)
        return (tostring(key or ""):gsub("^%s+", ""):gsub("%s+$", ""))
    end

    local function validate(key)
        key = clean(key)
        if key == "" then
            return false, "Enter a key"
        end
        if type(options.Validate) == "function" then
            local ok, passed, message = pcall(options.Validate, key)
            if not ok then
                return false, "Could not check"
            end
            return passed == true, message
        end
        return table.find(keys, key) ~= nil, nil
    end

    self._keyPromptActive = true
    self:_syncMenuCursor()

    local saved = nil
    if options.Remember ~= false and FS.available then
        local okFile, exists = pcall(FS.isfile, KEY_FILE)
        if okFile and exists then
            local okRead, value = pcall(FS.readfile, KEY_FILE)
            if okRead and value then
                local ok, _ = validate(value)
                if ok then
                    saved = clean(value)
                end
            end
        end
    end

    if saved then
        self._keyPromptActive = false
        self:_syncMenuCursor()
        return true
    end

    local done = Instance.new("BindableEvent")
    local result = false

    local layer = Create("Frame", {
        Name = "KeySystem",
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = P.Card,
        BackgroundTransparency = 0.04,
        BorderSizePixel = 0,
        ZIndex = 70,
        Parent = ScreenGui,
    })

    local card = Create("Frame", {
        Name = "Card",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(380, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = P.Card,
        BorderSizePixel = 0,
        ZIndex = 71,
        Parent = layer,
    }, {
        Corner(Radius.lg),
        Stroke(P.Line, 0.1),
        Padding(22, 22, 22, 22),
        Create("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 12),
        }),
    })

    Label({
        Text = options.Title or "Line",
        FontFace = Fonts.SemiBold,
        TextSize = 18,
        TextColor3 = P.Text,
        Size = UDim2.new(1, 0, 0, 22),
        LayoutOrder = 1,
        ZIndex = 72,
        Parent = card,
    })

    Label({
        Text = options.Subtitle or "Enter your key",
        FontFace = Fonts.Regular,
        TextSize = 13,
        TextColor3 = P.Sub,
        Size = UDim2.new(1, 0, 0, 16),
        LayoutOrder = 2,
        ZIndex = 72,
        Parent = card,
    })

    local field = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = P.Field,
        BorderSizePixel = 0,
        LayoutOrder = 3,
        ZIndex = 72,
        Parent = card,
    }, { Corner(Radius.md), Stroke(P.Line, 0) })

    local input = Create("TextBox", {
        Size = UDim2.new(1, -24, 1, 0),
        Position = UDim2.fromOffset(12, 0),
        BackgroundTransparency = 1,
        FontFace = Fonts.Regular,
        TextSize = 13,
        TextColor3 = P.Text,
        PlaceholderText = options.Placeholder or "Paste your key",
        PlaceholderColor3 = P.Muted,
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = "",
        ClearTextOnFocus = false,
        ZIndex = 73,
        Parent = field,
    })

    local button = Create("TextButton", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = P.Accent,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Text = "",
        LayoutOrder = 4,
        ZIndex = 72,
        Parent = card,
    }, { Corner(Radius.md) })

    Label({
        Text = options.SubmitButton or "Continue",
        FontFace = Fonts.SemiBold,
        TextSize = 13,
        TextColor3 = P.Ink,
        TextXAlignment = Enum.TextXAlignment.Center,
        Size = UDim2.fromScale(1, 1),
        ZIndex = 73,
        Parent = button,
    })

    local status = Label({
        Text = options.Note or "",
        FontFace = Fonts.Regular,
        TextSize = 12,
        TextColor3 = P.Muted,
        Size = UDim2.new(1, 0, 0, 14),
        LayoutOrder = 5,
        ZIndex = 72,
        Parent = card,
    })

    local footer = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 16),
        BackgroundTransparency = 1,
        LayoutOrder = 6,
        ZIndex = 72,
        Parent = card,
    })

    local link = Create("TextButton", {
        Size = UDim2.fromOffset(90, 16),
        BackgroundTransparency = 1,
        FontFace = Fonts.Regular,
        TextSize = 12,
        TextColor3 = P.Sub,
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = options.KeyButton or "Get key",
        AutoButtonColor = false,
        ZIndex = 73,
        Parent = footer,
    })

    local rememberOn = options.Remember ~= false and FS.available
    local toggle = nil
    if FS.available then
        toggle = Create("TextButton", {
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(1, 0),
            Size = UDim2.fromOffset(110, 16),
            BackgroundTransparency = 1,
            FontFace = Fonts.Regular,
            TextSize = 12,
            TextColor3 = P.Muted,
            TextXAlignment = Enum.TextXAlignment.Right,
            AutoButtonColor = false,
            ZIndex = 73,
            Parent = footer,
        })
    end

    local function setStatus(text, color)
        status.Text = text
        status.TextColor3 = color or P.Muted
    end

    local function paintToggle()
        if not toggle then
            return
        end
        toggle.Text = rememberOn and "Remember: on" or "Remember: off"
        toggle.TextColor3 = rememberOn and P.Text or P.Muted
    end

    local function submit()
        local ok, message = validate(input.Text)
        if not ok then
            setStatus(message or "Invalid key", P.Error)
            return
        end
        if rememberOn and FS.writefile then
            pcall(function()
                if not FS.isfolder(Library.Folder) then
                    FS.makefolder(Library.Folder)
                end
                FS.writefile(KEY_FILE, clean(input.Text))
            end)
        end
        result = true
        layer:Destroy()
        done:Fire()
    end

    button.MouseButton1Click:Connect(submit)
    input.FocusLost:Connect(function(enter)
        if enter then
            submit()
        end
    end)

    link.MouseButton1Click:Connect(function()
        local copy = envFunction("setclipboard") or envFunction("toclipboard")
        local url = options.KeyLink or ""
        if copy and pcall(copy, url) then
            setStatus(options.LinkCopied or "Link copied", P.Sub)
        else
            setStatus(url, P.Sub)
        end
    end)

    if toggle then
        toggle.MouseButton1Click:Connect(function()
            rememberOn = not rememberOn
            paintToggle()
        end)
        paintToggle()
    end

    task.delay(0.3, function()
        if input.Parent and not UserInputService.TouchEnabled then
            input:CaptureFocus()
        end
    end)

    done.Event:Wait()
    done:Destroy()
    self._keyPromptActive = false
    self:_syncMenuCursor()
    return result
end

function Library:CreateWindow(config)
    config = config or {}
    local Window = { Tabs = {} }

    Library.Context = Library.Context or { Game = "", Build = "", Site = "https://line.pastebdn.workers.dev" }
    do
        local modName = tostring(config.Title or "LINE")
        local modVersion = tostring(config.Subtitle or "v1.0")
        if Library.Context.Game == "" then Library.Context.Game = modName end
        if Library.Context.Build == "" then Library.Context.Build = modVersion end
        local executor = ""
        local ident = envFunction("identifyexecutor") or envFunction("getexecutor")
        if ident then
            local ok, name = pcall(ident)
            if ok and type(name) == "string" then executor = name end
        end
        Library.Module = {
            Name = modName,
            Version = modVersion,
            GameId = game.GameId,
            PlaceId = game.PlaceId,
            Executor = executor,
            LoadedAt = os.time(),
        }
    end

    COMPACT = config.Compact == true or tostring(config.Style or config.Layout or ""):lower() == "compact"
    Window.Compact = COMPACT
    if COMPACT then
        WINDOW_SIZE = Vector2.new(620, 410)
        SIDEBAR_WIDTH = 60
        BRAND_HEIGHT = 58
        FOOTER_HEIGHT = 62
        PANEL_INSET = 7
        TOPBAR_HEIGHT = 46
        PAGE_MARGIN = 10
        COLUMN_GAP = 8
    else
        WINDOW_SIZE = Vector2.new(840, 540)
        SIDEBAR_WIDTH = 212
        BRAND_HEIGHT = 72
        FOOTER_HEIGHT = 70
        PANEL_INSET = 8
        TOPBAR_HEIGHT = 58
        PAGE_MARGIN = 14
        COLUMN_GAP = 12
    end
    PANEL_WIDTH = WINDOW_SIZE.X - SIDEBAR_WIDTH - PANEL_INSET
    COLUMN_WIDTH = math.floor((PANEL_WIDTH - PAGE_MARGIN * 2 - COLUMN_GAP) / 2)

    local main = Create("Frame", {
        Name = "Window",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(WINDOW_SIZE.X, WINDOW_SIZE.Y),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Theme.Background,
        Parent = ScreenGui,
    }, {
        Corner(COMPACT and 12 or 14),
        Stroke(Theme.Stroke),
    })
    local scale = Create("UIScale", { Parent = main })

    main.Active = true
    Library:_blockWheel(main)
    Window.Frame = main
    Window.Scale = scale

    local function backdrop(parent, color, strength, reach, radius)
        local frame = Create("Frame", {
            Name = "Backdrop",
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = color,
            BorderSizePixel = 0,
            Visible = Library.Backdrop ~= "Solid",
            ZIndex = 0,
            Parent = parent,
        }, {
            Corner(radius),
            Create("UIGradient", {
                Rotation = 90,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1 - strength),
                    NumberSequenceKeypoint.new(reach, 1),
                    NumberSequenceKeypoint.new(1, 1),
                }),
            }),
        })
        frame:SetAttribute("NoGradient", true)
        table.insert(Library._backdrops, frame)
        return frame
    end

    local base = Create("Frame", {
        Name = "Base",
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Theme.Background,
        ZIndex = 1,
        Parent = main,
    }, { Corner(COMPACT and 12 or 14) })
    backdrop(base, Theme.Hover, 0.28, 0.7, COMPACT and 12 or 14)

    local sidebar = Create("Frame", {
        Name = "Sidebar",
        Size = UDim2.new(0, SIDEBAR_WIDTH, 1, 0),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = 2,
        Parent = main,
    })

    local brand = Create("Frame", {
        Name = "Brand",
        Size = UDim2.new(1, 0, 0, BRAND_HEIGHT),
        BackgroundTransparency = 1,
        Parent = sidebar,
    })
    local logo = Create("Frame", {
        AnchorPoint = COMPACT and Vector2.new(0.5, 0.5) or Vector2.new(0, 0.5),
        Position = COMPACT and UDim2.new(0.5, 0, 0.5, 3) or UDim2.new(0, 16, 0.5, 2),
        Size = COMPACT and UDim2.fromOffset(32, 32) or UDim2.fromOffset(38, 38),
        BackgroundColor3 = Theme.Accent,
        Parent = brand,
    }, { Corner(Radius.md) })
    Brand(logo, config.Logo or "N", 30, 18, nil, true)
    if COMPACT then

        Library:_attachTooltip(logo, (config.Title or "LINE") .. " · " .. (config.Subtitle or "v1.0"))
        Create("Frame", {
            Name = "Rule",
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.new(0.5, 0, 1, 0),
            Size = UDim2.fromOffset(22, 1),
            BackgroundColor3 = Theme.Stroke,
            BorderSizePixel = 0,
            Parent = brand,
        })
    else
        Label({
            Text = config.Title or "LINE",
            FontFace = Fonts.Bold,
            TextSize = 17,
            Position = UDim2.fromOffset(64, 17),
            Size = UDim2.new(1, -76, 0, 19),
            Parent = brand,
        })
        Label({
            Text = config.Subtitle or "v1.0",
            TextSize = 13,
            TextColor3 = Theme.Muted,
            Position = UDim2.fromOffset(64, 37),
            Size = UDim2.new(1, -76, 0, 14),
            Parent = brand,
        })
    end

    local tabList = Create("ScrollingFrame", {
        Name = "Tabs",
        Position = UDim2.fromOffset(0, BRAND_HEIGHT + 4),
        Size = UDim2.new(1, 0, 1, -BRAND_HEIGHT - 4 - FOOTER_HEIGHT),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 0,
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Parent = sidebar,
    }, {
        List(COMPACT and 4 or 2),
        COMPACT and Padding(6, 10, 6, 10) or Padding(0, 10, 10, 10),
    })

    local footer = Create("Frame", {
        Name = "Footer",
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.new(1, 0, 0, FOOTER_HEIGHT),
        BackgroundTransparency = 1,
        Parent = sidebar,
    })
    local avatar, pingIcon, pingLabel
    if COMPACT then

        avatar = Create("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.new(0.5, 0, 0, 6),
            Size = UDim2.fromOffset(30, 30),
            BackgroundColor3 = Theme.Elevated,
            Image = "",
            Parent = footer,
        }, { Corner(Radius.xl), Stroke(Theme.Stroke, 0.2) })
        Create("Frame", {
            AnchorPoint = Vector2.new(1, 1),
            Position = UDim2.new(1, 1, 1, 1),
            Size = UDim2.fromOffset(9, 9),
            BackgroundColor3 = Theme.Accent,
            ZIndex = 2,
            Parent = avatar,
        }, { Corner(Radius.sm), Create("UIStroke", { Color = Theme.Background, Thickness = 2 }) })
        Library:_attachTooltip(avatar, LocalPlayer.DisplayName .. "  @" .. LocalPlayer.Name)
        pingLabel = Label({
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.new(0.5, 0, 0, 40),
            Size = UDim2.new(1, -8, 0, 12),
            Text = "—",
            FontFace = Fonts.Medium,
            TextSize = 12,
            TextColor3 = Theme.Muted,
            TextXAlignment = Enum.TextXAlignment.Center,
            Parent = footer,
        })
        pingIcon = pingLabel
    end
    if not COMPACT then
        local profile = Create("Frame", {
            Name = "Profile",
            Position = UDim2.fromOffset(10, 4),
            Size = UDim2.new(1, -20, 1, -14),
            BackgroundColor3 = Theme.Surface,
            Parent = footer,
        }, { Corner(Radius.md), Stroke(Theme.StrokeSoft) })
        avatar = Create("ImageLabel", {
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 9, 0.5, 0),
            Size = UDim2.fromOffset(32, 32),
            BackgroundColor3 = Theme.Elevated,
            Image = "",
            Parent = profile,
        }, { Corner(Radius.xl) })
        Create("Frame", {
            AnchorPoint = Vector2.new(1, 1),
            Position = UDim2.new(1, 1, 1, 1),
            Size = UDim2.fromOffset(10, 10),
            BackgroundColor3 = Theme.Accent,
            ZIndex = 2,
            Parent = avatar,
        }, { Corner(Radius.sm), Create("UIStroke", { Color = Theme.Surface, Thickness = 2 }) })
        Label({
            Text = LocalPlayer.DisplayName,
            FontFace = Fonts.SemiBold,
            TextSize = 14,
            Position = UDim2.fromOffset(50, 9),
            Size = UDim2.new(1, -112, 0, 16),
            Parent = profile,
        })
        Label({
            Text = "@" .. LocalPlayer.Name,
            TextSize = 13,
            TextColor3 = Theme.Muted,
            Position = UDim2.fromOffset(50, 26),
            Size = UDim2.new(1, -112, 0, 14),
            Parent = profile,
        })

        local pingChip = Create("Frame", {
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -8, 0.5, 0),
            Size = UDim2.fromOffset(54, 22),
            BackgroundColor3 = Theme.Elevated,
            Parent = profile,
        }, { Corner(Radius.sm) })
        pingIcon = Icon("wifi", {
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 6, 0.5, 0),
            Size = UDim2.fromOffset(12, 12),
            ImageColor3 = Theme.Muted,
            Parent = pingChip,
        })
        pingLabel = Label({
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -6, 0.5, 0),
            Size = UDim2.fromOffset(32, 14),
            Text = "—",
            FontFace = Fonts.Medium,
            TextSize = 12,
            TextColor3 = Theme.SubText,
            TextXAlignment = Enum.TextXAlignment.Right,
            Parent = pingChip,
        })
    end
    local pingClock = 0
    Connect(RunService.Heartbeat, function(dt)
        pingClock += dt
        if pingClock < 1 then
            return
        end
        pingClock = 0
        local ok, ping = pcall(function()
            return LocalPlayer:GetNetworkPing() * 1000
        end)
        if ok then
            pingLabel.Text = string.format("%dms", ping + 0.5)
            if COMPACT then
                pingLabel.TextColor3 = ping < 120 and Theme.SubText or Theme.Muted
            else
                pingIcon.ImageColor3 = ping < 120 and Theme.SubText or Theme.Muted
            end
        end
    end)
    task.spawn(function()
        local ok, image = pcall(function()
            return Players:GetUserThumbnailAsync(
                LocalPlayer.UserId,
                Enum.ThumbnailType.HeadShot,
                Enum.ThumbnailSize.Size100x100
            )
        end)
        if ok and image and avatar.Parent then
            avatar.Image = image
        end
    end)

    local content = Create("Frame", {
        Name = "Content",
        Position = UDim2.fromOffset(SIDEBAR_WIDTH, PANEL_INSET),
        Size = UDim2.new(1, -SIDEBAR_WIDTH - PANEL_INSET, 1, -PANEL_INSET * 2),
        BackgroundColor3 = Theme.Sidebar,
        ZIndex = 2,
        Parent = main,
    }, { Corner(COMPACT and 10 or 12), Stroke(Theme.StrokeSoft) })
    backdrop(content, Theme.Elevated, 0.32, 0.5, COMPACT and 10 or 12)

    local topbar = Create("Frame", {
        Name = "Topbar",
        Size = UDim2.new(1, 0, 0, TOPBAR_HEIGHT),
        BackgroundTransparency = 1,
        Parent = content,
    })
    Create("Frame", {
        Name = "Rule",
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.new(0, COMPACT and 12 or 16, 1, 0),
        Size = UDim2.new(1, COMPACT and -24 or -32, 0, 1),
        BackgroundColor3 = Theme.StrokeSoft,
        BorderSizePixel = 0,
        Parent = topbar,
    })

    local headerGlyph = Create("Frame", {
        Name = "Glyph",
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 16, 0.5, 0),
        Size = UDim2.fromOffset(34, 34),
        BackgroundColor3 = Theme.Elevated,
        Visible = false,
        Parent = topbar,
    }, { Corner(Radius.md), Stroke(Theme.Stroke, 0.4) })
    local headerGlyphScale = Create("UIScale", { Parent = headerGlyph })
    local headerGlyphImage = Icon("", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(17, 17),
        ImageColor3 = Theme.Text,
        Parent = headerGlyph,
    })
    local titleRow = Create("Frame", {
        Name = "Title",
        Position = UDim2.fromOffset(18, 10),
        Size = UDim2.new(1, -160, 0, 20),
        BackgroundTransparency = 1,
        Parent = topbar,
    })
    local titleList = List(7, Enum.FillDirection.Horizontal)
    titleList.VerticalAlignment = Enum.VerticalAlignment.Center
    titleList.Parent = titleRow
    local crumbLabel = Label({
        Text = "",
        FontFace = Fonts.SemiBold,
        TextSize = 17,
        TextColor3 = Theme.Muted,
        Size = UDim2.fromOffset(0, 20),
        AutomaticSize = Enum.AutomaticSize.X,
        TextTruncate = Enum.TextTruncate.None,
        Visible = false,
        LayoutOrder = 1,
        Parent = titleRow,
    })
    local crumbSeparator = Icon("chevron-right", {
        Size = UDim2.fromOffset(14, 14),
        ImageColor3 = Theme.Muted,
        Visible = false,
        LayoutOrder = 2,
        Parent = titleRow,
    })
    local pageTitle = Label({
        Text = "",
        FontFace = Fonts.Bold,
        TextSize = 17,
        Size = UDim2.fromOffset(0, 20),
        AutomaticSize = Enum.AutomaticSize.X,
        TextTruncate = Enum.TextTruncate.None,
        LayoutOrder = 3,
        Parent = titleRow,
    })
    local pageDescription = Label({
        Text = "",
        TextSize = 14,
        TextColor3 = Theme.Muted,
        Position = UDim2.fromOffset(18, 32),
        Size = UDim2.new(1, -160, 0, 15),
        Parent = topbar,
    })

    local compactTitle, chipHost, chipDivider
    if COMPACT then
        headerGlyph.Visible = false
        titleRow.Visible = false
        pageDescription.Visible = false
        local headerRow = Create("Frame", {
            Name = "HeaderRow",
            Position = UDim2.fromOffset(14, 0),
            Size = UDim2.new(1, -14 - 76, 1, 0),
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            Parent = topbar,
        })
        local rowList = List(14, Enum.FillDirection.Horizontal)
        rowList.VerticalAlignment = Enum.VerticalAlignment.Center
        rowList.Parent = headerRow
        local titleBlock = Create("Frame", {
            Name = "TitleBlock",
            Size = UDim2.fromOffset(0, 36),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Parent = headerRow,
        })
        compactTitle = Label({
            Text = "",
            FontFace = Fonts.Bold,
            TextSize = 17,
            Size = UDim2.fromOffset(0, 20),
            AutomaticSize = Enum.AutomaticSize.X,
            TextTruncate = Enum.TextTruncate.None,
            Parent = titleBlock,
        })
        Label({
            Text = string.upper(config.Title or "LINE") .. "  ·  " .. (config.Subtitle or "v1.0"),
            FontFace = Fonts.Medium,
            TextSize = 12,
            TextColor3 = Theme.Muted,
            Position = UDim2.fromOffset(0, 21),
            Size = UDim2.fromOffset(0, 14),
            AutomaticSize = Enum.AutomaticSize.X,
            TextTruncate = Enum.TextTruncate.None,
            Parent = titleBlock,
        })

        chipDivider = Create("Frame", {
            Name = "Divider",
            Size = UDim2.fromOffset(1, 20),
            BackgroundColor3 = Theme.Stroke,
            BorderSizePixel = 0,
            LayoutOrder = 2,
            Parent = headerRow,
        })
        chipHost = Create("Frame", {
            Name = "Chips",
            Size = UDim2.fromOffset(0, 28),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundTransparency = 1,
            LayoutOrder = 3,
            Parent = headerRow,
        })
    end

    local BUTTON = COMPACT and 26 or 30
    local function windowButton(name, x)
        local button = Create("TextButton", {
            Name = name,
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, x, 0.5, 0),
            Size = UDim2.fromOffset(BUTTON, BUTTON),
            BackgroundColor3 = Theme.Elevated,
            BackgroundTransparency = 1,
            Text = "",
            AutoButtonColor = false,
            Parent = topbar,
        }, { Corner(COMPACT and 8 or 9) })
        return button
    end

    local closeButton = windowButton("Close", COMPACT and -10 or -14)
    local crossLines = {}
    for _, rotation in ipairs({ 45, -45 }) do
        table.insert(
            crossLines,
            Create("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromOffset(12, 1.5),
                Rotation = rotation,
                BackgroundColor3 = Theme.SubText,
                BorderSizePixel = 0,
                Parent = closeButton,
            })
        )
    end
    closeButton.MouseEnter:Connect(function()
        Tween(closeButton, FAST, { BackgroundTransparency = 0 })
        for _, line in ipairs(crossLines) do
            Tween(line, FAST, { BackgroundColor3 = Theme.Text })
        end
    end)
    closeButton.MouseLeave:Connect(function()
        Tween(closeButton, FAST, { BackgroundTransparency = 1 })
        for _, line in ipairs(crossLines) do
            Tween(line, FAST, { BackgroundColor3 = Theme.SubText })
        end
    end)

    local minimizeButton = windowButton("Minimize", COMPACT and -40 or -48)
    local minimizeIcon = Icon("minus", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(16, 16),
        ImageColor3 = Theme.SubText,
        Parent = minimizeButton,
    })
    minimizeButton.MouseEnter:Connect(function()
        Tween(minimizeButton, FAST, { BackgroundTransparency = 0 })
        Tween(minimizeIcon, FAST, { ImageColor3 = Theme.Text })
    end)
    minimizeButton.MouseLeave:Connect(function()
        Tween(minimizeButton, FAST, { BackgroundTransparency = 1 })
        Tween(minimizeIcon, FAST, { ImageColor3 = Theme.SubText })
    end)
    Library:_attachTooltip(minimizeButton, "Minimize")
    Library:_attachTooltip(closeButton, "Hide (" .. keyName(Library.ToggleKey) .. ")")

    local reportButton = windowButton("Report", COMPACT and -70 or -82)
    local reportIcon = Icon("triangle-alert", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(16, 16),
        ImageColor3 = Theme.SubText,
        Parent = reportButton,
    })
    reportButton.MouseEnter:Connect(function()
        Tween(reportButton, FAST, { BackgroundTransparency = 0 })
        Tween(reportIcon, FAST, { ImageColor3 = Theme.Text })
    end)
    reportButton.MouseLeave:Connect(function()
        Tween(reportButton, FAST, { BackgroundTransparency = 1 })
        Tween(reportIcon, FAST, { ImageColor3 = Theme.SubText })
    end)
    Library:_attachTooltip(reportButton, "Report a bug or suggest a feature")
    reportButton.MouseButton1Click:Connect(function()
        if Library.Report then
            pcall(function() Library:Report() end)
        end
    end)
    Library.ReportButton = reportButton

    local searchBox = { Text = "" }

    local pages = Create("Frame", {
        Name = "Pages",
        Position = UDim2.fromOffset(0, TOPBAR_HEIGHT),

        Size = UDim2.new(1, 0, 1, -TOPBAR_HEIGHT - 6),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Parent = content,
    })

    local function viewport()
        local size = ScreenGui.AbsoluteSize
        if size.X < 1 or size.Y < 1 then

            local camera = Workspace.CurrentCamera
            size = camera and camera.ViewportSize or Vector2.new(1280, 720)
        end
        return size
    end

    local function effectiveScale()
        local vp = viewport()
        local fit = math.min((vp.X - 24) / WINDOW_SIZE.X, (vp.Y - 24) / WINDOW_SIZE.Y)
        if UserInputService.TouchEnabled then
            return math.max(0.05, math.min(fit, math.clamp(fit, 0.45, 1) * Library.UserScale))
        end
        return math.clamp(fit, 0.45, 1) * Library.UserScale
    end

    local position = viewport() / 2
    local target = position

    local function clampPosition(point)
        if UserInputService.TouchEnabled then
            return point
        end
        return boundedCenter(point, WINDOW_SIZE * effectiveScale(), viewport(), TOPBAR_HEIGHT * effectiveScale())
    end

    local function applyPosition()
        local half = WINDOW_SIZE * scale.Scale / 2
        local left = math.floor(position.X - half.X + 0.5)
        local top = math.floor(position.Y - half.Y + 0.5)
        main.Position = UDim2.fromOffset(left + half.X, top + half.Y)
    end

    function Window:UpdateScale()
        scale.Scale = effectiveScale()
        target = clampPosition(target)
        position = target
        applyPosition()
    end
    Window:UpdateScale()
    local hasRealViewport = ScreenGui.AbsoluteSize.X > 0
    Connect(ScreenGui:GetPropertyChangedSignal("AbsoluteSize"), function()
        if not hasRealViewport and ScreenGui.AbsoluteSize.X > 0 then
            hasRealViewport = true
            target = viewport() / 2
        end
        Window:UpdateScale()
    end)

    local dragging, dragStart, startTarget = nil, nil, nil
    local function beginDrag(input)
        if not isPointer(input) or not Library.Open or Library.Minimized then
            return
        end
        local p = Vector2.new(input.Position.X, input.Position.Y)
        local sp, ss = minimizeButton.AbsolutePosition, minimizeButton.AbsoluteSize
        local cp, cs = closeButton.AbsolutePosition, closeButton.AbsoluteSize
        if
            (p.X >= sp.X and p.X <= sp.X + ss.X and p.Y >= sp.Y and p.Y <= sp.Y + ss.Y)
            or (p.X >= cp.X and p.X <= cp.X + cs.X and p.Y >= cp.Y and p.Y <= cp.Y + cs.Y)
        then
            return
        end
        if not claimPointer(input) then
            return
        end
        dragging, dragStart, startTarget = input, p, target
    end
    Connect(topbar.InputBegan, beginDrag)
    Connect(brand.InputBegan, beginDrag)

    if UserInputService.TouchEnabled then
        local edges = {}
        for _, name in ipairs({ "Left", "Right", "Top", "Bottom" }) do
            local edge = Create("Frame", {
                Name = "DragEdge" .. name,
                BackgroundTransparency = 1,
                Active = true,
                ZIndex = 90,
                Parent = main,
            })
            edges[name] = edge
            Connect(edge.InputBegan, beginDrag)
        end
        local function sizeEdges()
            local s = math.max(scale.Scale, 0.01)
            local outside, inside = 20 / s, 12 / s
            local width = outside + inside
            edges.Left.Position = UDim2.fromOffset(-outside, -outside)
            edges.Left.Size = UDim2.new(0, width, 1, outside * 2)
            edges.Right.Position = UDim2.new(1, -inside, 0, -outside)
            edges.Right.Size = UDim2.new(0, width, 1, outside * 2)
            edges.Top.Position = UDim2.fromOffset(0, -outside)
            edges.Top.Size = UDim2.new(1, 0, 0, width)
            edges.Bottom.Position = UDim2.new(0, 0, 1, -inside)
            edges.Bottom.Size = UDim2.new(1, 0, 0, width)
        end
        Connect(scale:GetPropertyChangedSignal("Scale"), sizeEdges)
        sizeEdges()
    end
    Connect(UserInputService.InputChanged, function(input)
        if movesPointer(dragging, input) then
            local p = Vector2.new(input.Position.X, input.Position.Y)
            target = clampPosition(startTarget + (p - dragStart))
            if input.UserInputType == Enum.UserInputType.Touch then
                position = target
                applyPosition()
            end
        end
    end)
    Connect(UserInputService.InputEnded, function(input)
        if endsPointer(dragging, input) then
            dragging = nil
        end
    end)
    Connect(RunService.RenderStepped, function(dt)
        if Library.Open and (target - position).Magnitude > 0.05 then
            position = position:Lerp(target, 1 - math.exp(-dt * 22))
            applyPosition()
        end
    end)

    local veil = Create("Frame", {
        Name = "Veil",
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Theme.Background,
        BackgroundTransparency = 1,
        Visible = false,
        ZIndex = 100,
        Parent = main,
    }, { Corner(Radius.md) })
    local veilTween
    local function fadeVeil(from, to, info, hideAfter)
        if veilTween then
            veilTween:Cancel()
        end
        veil.Visible = true
        veil.BackgroundTransparency = from
        veilTween = Tween(veil, info, { BackgroundTransparency = to })
        if hideAfter then
            local mine = veilTween
            mine.Completed:Connect(function(state)
                if state == Enum.PlaybackState.Completed then
                    veil.Visible = false
                end
            end)
        end
    end

    local visibilityTween
    function Library:SetOpen(open)
        if self.Unloaded then
            return
        end

        if open and not self.Open and UserInputService.TouchEnabled then
            local half = WINDOW_SIZE * effectiveScale() / 2
            local vp = viewport()
            if
                target.X + half.X <= 0
                or target.X - half.X >= vp.X
                or target.Y + half.Y <= 0
                or target.Y - half.Y >= vp.Y
            then
                target = vp / 2
            end
        end
        self.Open = open
        self:_syncMenuCursor()
        if dragging then
            endsPointer(dragging, dragging)
            dragging = nil
        end
        target = clampPosition(target)
        position = target
        applyPosition()
        if visibilityTween then
            visibilityTween:Cancel()
        end
        local base = effectiveScale()
        if open then
            main.Visible = true
            scale.Scale = base * 0.94
            fadeVeil(0, 1, TweenInfo.new(Dur.smooth, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), true)
            visibilityTween = Tween(
                scale,
                TweenInfo.new(Dur.slow, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0),
                { Scale = base }
            )

            visibilityTween.Completed:Connect(function()
                if Library.Open then
                    scale.Scale = effectiveScale()
                    applyPosition()
                end
            end)
        else
            fadeVeil(1, 0, TweenInfo.new(Dur.base, Enum.EasingStyle.Quad, Enum.EasingDirection.In), false)
            visibilityTween = Tween(
                scale,
                TweenInfo.new(Dur.base, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
                { Scale = base * 0.95 }
            )
            local tween = visibilityTween
            tween.Completed:Connect(function(state)
                if state == Enum.PlaybackState.Completed and not Library.Open then
                    main.Visible = false
                end
            end)
        end
    end

    local BUBBLE = 68
    local bubble = Create("TextButton", {
        Name = "MinimizedBubble",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(BUBBLE, BUBBLE),
        BackgroundColor3 = Color3.new(0, 0, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        Visible = false,
        ZIndex = 45,
        Parent = ScreenGui,
    }, { Create("UICorner", { CornerRadius = UDim.new(0.5, 0) }) })
    bubble:SetAttribute("NoTheme", true)
    bubble:SetAttribute("NoGradient", true)
    LineBrandImage(bubble, "minimized", 46)
    brandFallback(bubble, 26)

    for _, object in ipairs(bubble:GetDescendants()) do
        object:SetAttribute("NoTheme", true)
        object:SetAttribute("NoGradient", true)
    end
    local bubbleScale = Create("UIScale", { Scale = 0, Parent = bubble })
    Library:_blockWheel(bubble)
    Library:_attachTooltip(bubble, "Click to open · drag to move")
    local bubbleMoved = false
    local bubbleTween

    Library.Minimized = false
    function Library:SetMinimized(value)
        if self.Unloaded or value == self.Minimized then
            return
        end
        self.Minimized = value
        if bubbleTween then
            bubbleTween:Cancel()
            bubbleTween = nil
        end
        if value then
            if not bubbleMoved then

                local corner = main.AbsolutePosition
                local vp = viewport()
                local localCorner = corner - ScreenGui.AbsolutePosition
                bubble.Position = UDim2.fromOffset(
                    math.clamp(localCorner.X + 26, math.min(34, vp.X / 2), math.max(vp.X / 2, vp.X - 34)),
                    math.clamp(localCorner.Y + 26, math.min(34, vp.Y / 2), math.max(vp.Y / 2, vp.Y - 34))
                )
            end
            self:SetOpen(false)
            main.Visible = false
            bubble.Visible = true
            bubbleScale.Scale = 0.96
            bubbleTween =
                Tween(bubbleScale, TweenInfo.new(Dur.fast, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Scale = 1 })
        else

            bubble.Visible = false
            bubbleScale.Scale = 1
            self:SetOpen(true)
        end
    end

    bubble.MouseEnter:Connect(function()
        if Library.Minimized then
            if bubbleTween then
                bubbleTween:Cancel()
            end
            bubbleTween = Tween(bubbleScale, FAST, { Scale = 1.04 })
        end
    end)
    bubble.MouseLeave:Connect(function()
        if Library.Minimized then
            if bubbleTween then
                bubbleTween:Cancel()
            end
            bubbleTween = Tween(bubbleScale, FAST, { Scale = 1 })
        end
    end)

    local bubbleStart, bubbleOrigin, bubbleDragged, bubbleInput
    bubble.InputBegan:Connect(function(input)
        if bubble.Visible and claimPointer(input) then
            bubbleInput = input
            bubbleStart, bubbleOrigin, bubbleDragged = input.Position, bubble.Position, false
        end
    end)
    Connect(UserInputService.InputChanged, function(input)
        if bubbleStart and movesPointer(bubbleInput, input) then
            local delta = input.Position - bubbleStart
            if not bubbleDragged and delta.Magnitude > 5 then
                bubbleDragged = true
            end
            if bubbleDragged then
                local vp = ScreenGui.AbsoluteSize
                local x =
                    math.clamp(bubbleOrigin.X.Offset + delta.X, math.min(34, vp.X / 2), math.max(vp.X / 2, vp.X - 34))
                local y =
                    math.clamp(bubbleOrigin.Y.Offset + delta.Y, math.min(34, vp.Y / 2), math.max(vp.Y / 2, vp.Y - 34))
                bubble.Position = UDim2.fromOffset(math.floor(x), math.floor(y))
            end
        end
    end)
    Connect(UserInputService.InputEnded, function(input)
        if bubbleStart and endsPointer(bubbleInput, input) then
            bubbleStart = nil
            if bubbleDragged then
                bubbleMoved = true
            elseif Library.Minimized and input.UserInputState ~= Enum.UserInputState.Cancel then
                Library:SetMinimized(false)
            end
        end
    end)

    minimizeButton.Activated:Connect(function()
        Library:SetMinimized(true)
    end)

    function Library:Toggle()
        if self.Minimized then
            self:SetMinimized(false)
            return
        end
        self:SetOpen(not self.Open)
    end

    closeButton.Activated:Connect(function()
        Library:SetOpen(false)
        Library:Notify({
            Title = "Interface hidden",
            Icon = "eye",
            Content = "Press " .. keyName(Library.ToggleKey) .. " to bring it back.",
            Duration = 3,
        })
    end)

    if UserInputService.TouchEnabled then
        local pill = Create("TextButton", {
            Name = "MobileToggle",
            Position = UDim2.fromOffset(16, 80),
            Size = UDim2.fromOffset(60, 60),
            BackgroundTransparency = 1,
            Text = "",
            FontFace = Fonts.Bold,
            TextSize = 19,
            TextColor3 = Theme.OnAccent,
            AutoButtonColor = false,
            ZIndex = 40,
            Parent = ScreenGui,
        }, { Corner(Radius.lg) })
        pill:SetAttribute("NoTheme", true)
        pill:SetAttribute("NoGradient", true)
        LineBrandImage(pill, "minimized", 41)
        brandFallback(pill, 22)
        local moved, pillStart, pillOrigin, pillInput = false, nil, nil, nil
        pill.InputBegan:Connect(function(input)
            if claimPointer(input) then
                pillInput = input
                moved, pillStart, pillOrigin = false, input.Position, pill.Position
            end
        end)
        Connect(UserInputService.InputChanged, function(input)
            if pillStart and movesPointer(pillInput, input) then
                local delta = input.Position - pillStart
                if delta.Magnitude > 6 then
                    moved = true
                end
                if moved then
                    local vp = viewport()
                    pill.Position = UDim2.fromOffset(
                        math.clamp(pillOrigin.X.Offset + delta.X, 0, math.max(0, vp.X - 44)),
                        math.clamp(pillOrigin.Y.Offset + delta.Y, 0, math.max(0, vp.Y - 44))
                    )
                end
            end
        end)
        Connect(UserInputService.InputEnded, function(input)
            if pillStart and endsPointer(pillInput, input) then
                pillStart = nil
                if not moved and input.UserInputState ~= Enum.UserInputState.Cancel then
                    Library:Toggle()
                end
            end
        end)
        Connect(ScreenGui:GetPropertyChangedSignal("AbsoluteSize"), function()
            local vp = viewport()
            pill.Position = UDim2.fromOffset(
                math.clamp(pill.Position.X.Offset, 0, math.max(0, vp.X - 44)),
                math.clamp(pill.Position.Y.Offset, 0, math.max(0, vp.Y - 44))
            )
            endsPointer(pillInput, pillInput)
            pillStart = nil
        end)
    end
    Connect(ScreenGui:GetPropertyChangedSignal("AbsoluteSize"), function()
        local vp = viewport()
        bubble.Position = UDim2.fromOffset(
            math.clamp(bubble.Position.X.Offset, math.min(34, vp.X / 2), math.max(vp.X / 2, vp.X - 34)),
            math.clamp(bubble.Position.Y.Offset, math.min(34, vp.Y / 2), math.max(vp.Y / 2, vp.Y - 34))
        )
        endsPointer(bubbleInput, bubbleInput)
        bubbleStart = nil
        if dragging then
            endsPointer(dragging, dragging)
            dragging = nil
        end
    end)

    local function applySearch()
        local tab = Window.ActiveTab
        if not tab then
            return
        end
        local query = searchBox.Text:lower():gsub("^%s+", ""):gsub("%s+$", "")
        for _, section in ipairs(tab.Sections) do
            local sectionMatch = query == "" or section.Name:lower():find(query, 1, true) ~= nil
            local any = false
            for _, element in ipairs(section.Elements) do
                local visible = query == "" or sectionMatch or element.Name:lower():find(query, 1, true) ~= nil
                element.Frame.Visible = visible
                any = any or visible
            end
            section.Frame.Visible = any or sectionMatch or #section.Elements == 0 and query == ""
        end
        tab.EmptyLabel.Visible = query ~= ""
            and (function()
                for _, section in ipairs(tab.Sections) do
                    if section.Frame.Visible then
                        return false
                    end
                end
                return true
            end)()
    end

    local TAB_HEIGHT, SUB_HEIGHT, SUB_GAP = COMPACT and 38 or 36, 30, 2
    local GUIDE_X = 20
    local SUB_INDENT = 30

    function Window:SidebarHeading(text)
        if COMPACT then

            if #Window.Tabs == 0 then
                return
            end
            local gap = Create("Frame", {
                Name = "Heading",
                Size = UDim2.new(1, 0, 0, 9),
                BackgroundTransparency = 1,
                LayoutOrder = nextOrder(),
                Parent = tabList,
            })
            Create("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromOffset(16, 1),
                BackgroundColor3 = Theme.Stroke,
                BorderSizePixel = 0,
                Parent = gap,
            })
            return
        end
        local heading = Label({
            Text = string.upper(text),
            FontFace = Fonts.SemiBold,
            TextSize = 13,
            TextColor3 = Theme.Muted,
            Size = UDim2.new(1, 0, 0, #Window.Tabs == 0 and 20 or 34),
            TextYAlignment = Enum.TextYAlignment.Bottom,
            LayoutOrder = nextOrder(),
            Parent = tabList,
        })
        Create("UIPadding", { PaddingLeft = UDim.new(0, 12), PaddingBottom = UDim.new(0, 7) }).Parent = heading
    end

    local selection = Create("Frame", {
        Name = "Selection",
        Size = UDim2.fromOffset(SIDEBAR_WIDTH - 20, TAB_HEIGHT),
        Position = UDim2.fromOffset(10, 0),
        BackgroundColor3 = Theme.Surface,
        Visible = false,
        ZIndex = 1,
        Parent = sidebar,
    }, { Corner(Radius.md), Stroke(Theme.Stroke, 0.45) })

    local selectionBar = Create("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 0, 0.5, 0),
        Size = UDim2.fromOffset(3, 16),
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel = 0,
        ZIndex = 2,
        Parent = selection,
    }, { Corner(Radius.xs) })
    tabList.ZIndex = 2

    local pill = { x = 10, y = 0, w = SIDEBAR_WIDTH - 20, h = TAB_HEIGHT, snap = true }

    local function pillButton()
        local tab = Window.ActiveTab
        if not tab then
            return nil
        end
        if tab.Parent and (COMPACT or not tab.Parent.Expanded) then
            return tab.Parent.Button
        end
        return tab.Button
    end
    Connect(tabList:GetPropertyChangedSignal("CanvasPosition"), function()
        pill.snap = true
    end)
    Connect(RunService.RenderStepped, function(dt)
        if not Library.Open then
            return
        end
        local button = pillButton()
        if not button then
            return
        end
        local s = math.max(scale.Scale, 0.01)
        local origin = sidebar.AbsolutePosition
        local tx = (button.AbsolutePosition.X - origin.X) / s
        local ty = (button.AbsolutePosition.Y - origin.Y) / s
        local tw, th = button.AbsoluteSize.X / s, button.AbsoluteSize.Y / s
        if button ~= pill.button then
            if pill.button == nil then
                pill.snap = true
            else

                selectionBar.Size = UDim2.fromOffset(3, 26)
                Tween(
                    selectionBar,
                    TweenInfo.new(Dur.slow, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                    { Size = UDim2.fromOffset(3, 16) }
                )
            end
            pill.button = button
        end
        if pill.snap then
            pill.x, pill.y, pill.w, pill.h = tx, ty, tw, th
            pill.snap = false
        else
            local k = 1 - math.exp(-dt * 17)
            local function approach(key, goal)
                local value = pill[key] + (goal - pill[key]) * k
                pill[key] = math.abs(goal - value) < 0.3 and goal or value
            end
            approach("x", tx)
            approach("y", ty)
            approach("w", tw)
            approach("h", th)
        end
        local listTop = (tabList.AbsolutePosition.Y - origin.Y) / s
        local listBottom = listTop + tabList.AbsoluteSize.Y / s
        local x, y = math.floor(pill.x + 0.5), math.floor(pill.y + 0.5)
        selection.Visible = y + pill.h > listTop + 2 and y < listBottom - 2
        selection.Position = UDim2.fromOffset(x, y)
        selection.Size = UDim2.fromOffset(math.floor(pill.w + 0.5), math.floor(pill.h + 0.5))
    end)

    local function restState(tab)
        local active = Window.ActiveTab
        if active == tab then
            return "active"
        end
        if active and active.Parent == tab then
            return "branch"
        end
        return "idle"
    end

    local function paintTab(tab, state)
        state = state or restState(tab)
        local previous = tab._state
        tab._state = state
        local lit = state ~= "idle"
        Tween(tab.Button, FAST, { BackgroundTransparency = state == "hover" and 0.55 or 1 })
        if tab.IsSub then
            Tween(tab.ButtonLabel, FAST, { TextColor3 = lit and Theme.Text or Theme.Muted })
            if tab.Branch then
                Tween(tab.Branch, FAST, { BackgroundColor3 = state == "active" and Theme.Text or Theme.Stroke })
            end
            if tab.IconImage then
                Tween(tab.IconImage, FAST, { ImageColor3 = lit and Theme.Text or Theme.Muted })
            end
            return
        end
        Tween(tab.ButtonLabel, FAST, { TextColor3 = lit and Theme.Text or Theme.SubText })
        if tab.IconImage then
            Tween(tab.IconImage, FAST, {
                ImageColor3 = (state == "active" or state == "branch") and Theme.Text
                    or state == "hover" and Theme.SubText
                    or Theme.Muted,
            })
        end
        if tab.Chevron then
            Tween(tab.Chevron, FAST, { ImageColor3 = lit and Theme.Text or Theme.Muted })
        end
        if state == "active" and previous ~= "active" and tab.IconScale then
            tab.IconScale.Scale = 0.7
            Tween(tab.IconScale, TweenInfo.new(Dur.slow, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
        end
    end
    Window._paintTab = paintTab

    local function setGlyph(name)
        local data = resolveIcon(name)
        headerGlyphImage.Image = data and ("rbxassetid://" .. data[1])
            or (type(name) == "string" and name:find("^rbxasset") and name or "")
        headerGlyphImage.ImageRectSize = data and data[4] ~= 0 and Vector2.new(48, 48) or Vector2.zero
        headerGlyphImage.ImageRectOffset = data and Vector2.new(data[2], data[3]) or Vector2.zero
    end

    local shownBranch
    local function renderHeader(tab, animate)
        if COMPACT then
            local branch = tab.Parent or tab
            for _, entry in ipairs(Window.Tabs) do
                if entry.ChipGroup then
                    entry.ChipGroup.Visible = entry == branch
                end
            end
            chipDivider.Visible = branch.ChipGroup ~= nil
            if branch == shownBranch then
                return
            end
            shownBranch = branch
            compactTitle.Text = branch.Name
            if animate then
                compactTitle.TextTransparency = 1
                compactTitle.Position = UDim2.fromOffset(0, 5)
                Tween(
                    compactTitle,
                    TweenInfo.new(Dur.smooth, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    { TextTransparency = 0, Position = UDim2.fromOffset(0, 0) }
                )
                if branch.ChipGroup then
                    local scaleObject = branch.ChipGroup:FindFirstChildOfClass("UIScale")
                    if scaleObject then
                        scaleObject.Scale = 0.94
                        Tween(
                            scaleObject,
                            TweenInfo.new(Dur.slow, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                            { Scale = 1 }
                        )
                    end
                end
            end
            return
        end
        local parent = tab.Parent
        local glyph = tab.Icon or (parent and parent.Icon)
        local textX = glyph and 60 or 18
        headerGlyph.Visible = glyph ~= nil
        if glyph then
            setGlyph(glyph)
        end
        crumbLabel.Visible = parent ~= nil
        crumbSeparator.Visible = parent ~= nil
        crumbLabel.Text = parent and parent.Name or ""
        pageTitle.Text = tab.Name
        pageDescription.Text = tab.Description or (parent and parent.Description) or ""
        local titleHome = UDim2.fromOffset(textX, pageDescription.Text == "" and 18 or 9)
        local descriptionHome = UDim2.fromOffset(textX, 31)
        titleRow.Size = UDim2.new(1, -textX - 100, 0, 20)
        pageDescription.Size = UDim2.new(1, -textX - 100, 0, 15)
        if not animate then
            titleRow.Position, pageDescription.Position = titleHome, descriptionHome
            return
        end
        local info = TweenInfo.new(Dur.smooth, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
        titleRow.Position = titleHome + UDim2.fromOffset(0, 6)
        pageDescription.Position = descriptionHome + UDim2.fromOffset(0, 6)
        for _, object in ipairs({ crumbLabel, pageTitle, pageDescription }) do
            object.TextTransparency = 1
        end
        crumbSeparator.ImageTransparency = 1
        Tween(titleRow, info, { Position = titleHome })
        Tween(crumbLabel, info, { TextTransparency = 0 })
        Tween(crumbSeparator, info, { ImageTransparency = 0 })
        Tween(pageTitle, info, { TextTransparency = 0 })
        task.delay(0.04, function()
            Tween(pageDescription, info, { Position = descriptionHome, TextTransparency = 0 })
        end)
        if glyph then
            headerGlyphScale.Scale = 0.8
            Tween(headerGlyphScale, TweenInfo.new(Dur.slow, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
        end
    end

    local function resolveTab(tab)
        if tab.SubTabs and #tab.SubTabs > 0 and #tab.Sections == 0 then
            return tab._lastSub or tab.SubTabs[1]
        end
        return tab
    end

    function Window:SelectTab(tab)
        tab = resolveTab(tab)
        if Window.ActiveTab == tab then
            return
        end
        local previous = Window.ActiveTab
        Window.ActiveTab = tab
        if tab.Parent then
            tab.Parent._lastSub = tab
            if not tab.Parent.Expanded then
                tab.Parent:SetExpanded(true)
            end
        end
        if previous then
            previous.Page.Visible = false
            paintTab(previous)
            if previous.Parent then
                paintTab(previous.Parent)
            end
        end
        paintTab(tab)
        if tab.Parent then
            paintTab(tab.Parent)
        end
        renderHeader(tab, previous ~= nil)
        tab.Page.Visible = true

        for index, column in ipairs({ tab.Left, tab.Right }) do
            local home = column:GetAttribute("Home")
            column.Position = home + UDim2.fromOffset(0, 14)
            task.delay((index - 1) * 0.05, function()
                Tween(
                    column,
                    TweenInfo.new(Dur.slow, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    { Position = home }
                )
            end)
        end
        applySearch()
    end

    local function buildPage(Tab)
        local page = Create("Frame", {
            Name = Tab.Name,
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            Visible = false,
            Parent = pages,
        })
        Tab.Page = page

        local scroll = Create("ScrollingFrame", {
            Name = "Scroll",
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = COMPACT and 2 or 3,
            ScrollBarImageColor3 = Theme.Muted,
            ScrollBarImageTransparency = 1,
            CanvasSize = UDim2.new(),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ScrollingDirection = Enum.ScrollingDirection.Y,
            ElasticBehavior = Enum.ElasticBehavior.Never,

            ScrollingEnabled = UserInputService.TouchEnabled,
            Parent = page,
        }, { COMPACT and Padding(8, 0, 10, 0) or Padding(12, 0, 16, 0) })
        Tab.Scroll = scroll

        local CONTENT_WIDTH = COLUMN_WIDTH
        local function column(name, x)
            local frame = Create("Frame", {
                Name = name,
                Position = UDim2.fromOffset(x, 0),
                Size = UDim2.fromOffset(CONTENT_WIDTH, 0),
                BackgroundTransparency = 1,
                Parent = scroll,
            })
            Flow(frame, COMPACT and 8 or 12)
            return frame
        end
        Tab.Left = column("Left", PAGE_MARGIN)
        Tab.Right = column("Right", PAGE_MARGIN + COLUMN_WIDTH + COLUMN_GAP)
        for _, col in ipairs({ Tab.Left, Tab.Right }) do
            col:SetAttribute("Home", col.Position)
        end

        local target, lastWritten, scrollToken = 0, 0, 0
        local lastWheel = 0
        local function maxScroll()
            local s = scale.Scale
            return math.max(0, (scroll.AbsoluteCanvasSize.Y - scroll.AbsoluteWindowSize.Y) / s)
        end
        local lastScrollbarFlash = -math.huge
        local function flashScrollbar()
            local now = os.clock()
            if now - lastScrollbarFlash < 0.15 then
                return
            end
            lastScrollbarFlash = now
            scrollToken += 1
            local mine = scrollToken
            Tween(scroll, FAST, { ScrollBarImageTransparency = 0.25 })
            task.delay(0.9, function()
                if mine == scrollToken then
                    Tween(scroll, SMOOTH, { ScrollBarImageTransparency = 1 })
                end
            end)
        end
        Connect(scroll:GetPropertyChangedSignal("CanvasPosition"), function()
            flashScrollbar()
            if UserInputService.TouchEnabled then
                target = scroll.CanvasPosition.Y
                return
            end
            if math.abs(scroll.CanvasPosition.Y - lastWritten) < 0.5 then
                return
            end

            local y = math.floor(scroll.CanvasPosition.Y + 0.5)
            target = y
            if scroll.CanvasPosition.Y ~= y or scroll.CanvasPosition.X ~= 0 then
                lastWritten = y
                scroll.CanvasPosition = Vector2.new(0, y)
            end
        end)
        local function overOpenList(p)
            local open = Library._openDropdown
            local list = open and open._list
            if not (list and list.Visible) then
                return false
            end
            local a, s = list.AbsolutePosition, list.AbsoluteSize
            return p.X >= a.X and p.X <= a.X + s.X and p.Y >= a.Y and p.Y <= a.Y + s.Y
        end
        Connect(UserInputService.InputChanged, function(input)
            if UserInputService.TouchEnabled or input.UserInputType ~= Enum.UserInputType.MouseWheel then
                return
            end
            if not Library.Open or Window.ActiveTab ~= Tab or not page.Visible then
                return
            end
            local p = input.Position
            local a, s = scroll.AbsolutePosition, scroll.AbsoluteSize
            if p.X < a.X or p.X > a.X + s.X or p.Y < a.Y or p.Y > a.Y + s.Y or overOpenList(p) then
                return
            end

            local now = os.clock()
            local burst = (now - lastWheel < 0.12) and 1.35 or 1
            lastWheel = now
            target = math.clamp(target - input.Position.Z * 140 * burst, 0, maxScroll())
        end)
        Connect(RunService.RenderStepped, function(dt)
            if UserInputService.TouchEnabled or not Library.Open or Window.ActiveTab ~= Tab then
                return
            end
            target = math.clamp(target, 0, maxScroll())
            local current = scroll.CanvasPosition.Y
            local gap = target - current
            if math.abs(gap) < 0.5 then
                return
            end

            local step = gap * (1 - math.exp(-dt * 14))
            local nextY = current + (math.abs(step) < 1 and math.sign(gap) or step)
            lastWritten = math.floor(nextY + 0.5)
            scroll.CanvasPosition = Vector2.new(0, lastWritten)
        end)

        local empty = Create("Frame", {
            Name = "Empty",
            Position = UDim2.fromOffset(math.floor((PANEL_WIDTH - 240) / 2), 70),
            Size = UDim2.fromOffset(240, 90),
            BackgroundTransparency = 1,
            Visible = false,
            Parent = page,
        })
        local emptyTile = Create("Frame", {
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.fromOffset(40, 40),
            BackgroundColor3 = Theme.Surface,
            Parent = empty,
        }, { Corner(Radius.md), Stroke(Theme.Stroke) })
        Icon("search", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(18, 18),
            ImageColor3 = Theme.SubText,
            Parent = emptyTile,
        })
        Label({
            Text = "No matching options",
            FontFace = Fonts.Medium,
            TextXAlignment = Enum.TextXAlignment.Center,
            Position = UDim2.fromOffset(0, 52),
            Size = UDim2.new(1, 0, 0, 18),
            Parent = empty,
        })
        Label({
            Text = "Try a different word",
            TextSize = 13,
            TextColor3 = Theme.Muted,
            TextXAlignment = Enum.TextXAlignment.Center,
            Position = UDim2.fromOffset(0, 72),
            Size = UDim2.new(1, 0, 0, 16),
            Parent = empty,
        })
        Tab.EmptyLabel = empty

        function Tab:Section(sectionOptions)
            if type(sectionOptions) == "string" then
                sectionOptions = { Name = sectionOptions }
            end
            return Library._createSection(Tab, sectionOptions)
        end
    end

    local function createBadge(parent, text, height, x)
        return Create("TextLabel", {
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, x, 0.5, 0),
            Size = UDim2.fromOffset(0, height),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Theme.Accent,
            Text = tostring(text),
            FontFace = Fonts.Bold,
            TextSize = 11,
            TextColor3 = Theme.OnAccent,
            ZIndex = 3,
            Parent = parent,
        }, { Corner(math.floor(height / 2)), Padding(0, 7, 0, 7) })
    end

    function Window:Tab(options)
        if type(options) == "string" then
            options = { Name = options }
        end
        local Tab = {
            Name = options.Name or "Tab",
            Description = options.Description,
            Icon = options.Icon,
            Sections = {},
            SubTabs = {},
            Expanded = false,
        }

        local button = Create("TextButton", {
            Name = Tab.Name,
            Size = UDim2.new(1, 0, 0, TAB_HEIGHT),
            BackgroundColor3 = Theme.Hover,
            BackgroundTransparency = 1,
            Text = "",
            AutoButtonColor = false,
            LayoutOrder = nextOrder(),
            ZIndex = 2,
            Parent = tabList,
        }, { Corner(Radius.md) })

        local childOrder = nextOrder()
        Tab.Button = button
        local textX = 14
        if options.Icon then
            Tab.IconImage = Icon(options.Icon, {
                AnchorPoint = COMPACT and Vector2.new(0.5, 0.5) or Vector2.new(0, 0.5),
                Position = COMPACT and UDim2.fromScale(0.5, 0.5) or UDim2.new(0, 12, 0.5, 0),
                Size = UDim2.fromOffset(COMPACT and 18 or 17, COMPACT and 18 or 17),
                ImageColor3 = Theme.Muted,
                ZIndex = 3,
                Parent = button,
            })
            Tab.IconScale = Create("UIScale", { Parent = Tab.IconImage })
            textX = 39
        end
        local badgeWidth = 0
        if options.Badge and COMPACT then

            Tab.Badge = Create("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(1, -9, 0, 9),
                Size = UDim2.fromOffset(7, 7),
                BackgroundColor3 = Theme.Accent,
                ZIndex = 4,
                Parent = button,
            }, { Corner(Radius.xs), Create("UIStroke", { Color = Theme.Background, Thickness = 1.5 }) })
        elseif options.Badge then
            Tab.Badge = createBadge(button, options.Badge, 18, -8)
            badgeWidth = 44
        end
        Tab.ButtonLabel = Label({
            Text = (COMPACT and not options.Icon) and Tab.Name:sub(1, 2) or Tab.Name,
            FontFace = Fonts.Medium,
            TextSize = 15,
            TextColor3 = Theme.SubText,
            Position = UDim2.fromOffset(COMPACT and 0 or textX, 0),
            Size = COMPACT and UDim2.fromScale(1, 1) or UDim2.new(1, -textX - 6 - badgeWidth, 1, 0),
            TextXAlignment = COMPACT and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left,
            Visible = not (COMPACT and options.Icon),
            ZIndex = 3,
            Parent = button,
        })
        if COMPACT then
            Library:_attachTooltip(button, Tab.Name)
        end

        button.MouseEnter:Connect(function()
            if restState(Tab) ~= "active" then
                paintTab(Tab, "hover")
            end
        end)
        button.MouseLeave:Connect(function()
            paintTab(Tab)
        end)
        button.Activated:Connect(function()
            if #Tab.SubTabs == 0 then
                Window:SelectTab(Tab)
                return
            end

            local active = Window.ActiveTab
            if active == Tab or (active and active.Parent == Tab) then
                Tab:SetExpanded(not Tab.Expanded)
            else
                Tab:SetExpanded(true)
                Window:SelectTab(Tab)
            end
        end)

        buildPage(Tab)

        local group, groupList, guide
        local expandToken = 0
        local function groupHeight()
            local count = #Tab.SubTabs
            if count == 0 then
                return 0
            end
            return count * SUB_HEIGHT + (count - 1) * SUB_GAP + 4
        end
        local function ensureGroup()
            if COMPACT then

                if Tab.ChipGroup then
                    return
                end
                local chipGroup = Create("Frame", {
                    Name = Tab.Name .. "_Chips",
                    Size = UDim2.fromOffset(0, 28),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundColor3 = Theme.Background,
                    Visible = false,
                    Parent = chipHost,
                }, { Corner(Radius.md), Stroke(Theme.StrokeSoft), Padding(3, 3, 3, 3) })
                Create("UIScale", { Parent = chipGroup })
                local chipList = Create("Frame", {
                    Name = "List",
                    Size = UDim2.fromOffset(0, 22),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundTransparency = 1,
                    ZIndex = 3,
                    Parent = chipGroup,
                }, { List(2, Enum.FillDirection.Horizontal) })
                local chipPill = Create("Frame", {
                    Name = "Pill",
                    Size = UDim2.fromOffset(0, 22),
                    BackgroundColor3 = Theme.Surface,
                    Visible = false,
                    ZIndex = 2,
                    Parent = chipGroup,
                }, { Corner(Radius.sm), Stroke(Theme.Stroke, 0.45) })

                local tick = Create("Frame", {
                    AnchorPoint = Vector2.new(0.5, 1),
                    Position = UDim2.new(0.5, 0, 1, 0),
                    Size = UDim2.fromOffset(12, 2),
                    BackgroundColor3 = Theme.Accent,
                    BorderSizePixel = 0,
                    ZIndex = 3,
                    Parent = chipPill,
                }, { Corner(Radius.xs) })
                Tab.ChipGroup, Tab.ChipList = chipGroup, chipList
                local spring = { x = 0, w = 0, button = nil }
                Connect(RunService.RenderStepped, function(dt)
                    local active = Window.ActiveTab
                    if not Library.Open or not chipGroup.Visible or not active or active.Parent ~= Tab then
                        chipPill.Visible = false
                        spring.button = nil
                        return
                    end
                    local s = math.max(scale.Scale, 0.01)
                    local chip = active.Button
                    local tx = (chip.AbsolutePosition.X - chipList.AbsolutePosition.X) / s
                    local tw = chip.AbsoluteSize.X / s
                    if tw < 1 then
                        return
                    end
                    if spring.button == nil then
                        spring.x, spring.w = tx, tw
                    elseif spring.button ~= chip then
                        tick.Size = UDim2.fromOffset(20, 2)
                        Tween(
                            tick,
                            TweenInfo.new(Dur.slow, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                            { Size = UDim2.fromOffset(12, 2) }
                        )
                    end
                    spring.button = chip
                    local k = 1 - math.exp(-dt * 18)
                    spring.x += (tx - spring.x) * k
                    spring.w += (tw - spring.w) * k
                    if math.abs(tx - spring.x) < 0.3 then
                        spring.x = tx
                    end
                    if math.abs(tw - spring.w) < 0.3 then
                        spring.w = tw
                    end
                    chipPill.Visible = true
                    chipPill.Position = UDim2.fromOffset(math.floor(spring.x + 0.5), 0)
                    chipPill.Size = UDim2.fromOffset(math.floor(spring.w + 0.5), 22)
                end)
                return
            end
            if group then
                return
            end
            group = Create("Frame", {
                Name = Tab.Name .. "_SubTabs",
                Size = UDim2.new(1, 0, 0, 0),
                BackgroundTransparency = 1,
                ClipsDescendants = true,
                Visible = false,
                LayoutOrder = childOrder,
                ZIndex = 2,
                Parent = tabList,
            })
            guide = Create("Frame", {
                Name = "Guide",
                Position = UDim2.fromOffset(GUIDE_X, 0),
                Size = UDim2.fromOffset(1, 0),
                BackgroundColor3 = Theme.Stroke,
                BorderSizePixel = 0,
                ZIndex = 2,
                Parent = group,
            })
            groupList = Create("Frame", {
                Name = "List",
                Position = UDim2.fromOffset(SUB_INDENT, 2),
                Size = UDim2.new(1, -SUB_INDENT, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                ZIndex = 2,
                Parent = group,
            }, { List(SUB_GAP) })
            Tab.Chevron = Icon("chevron-right", {
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, -10 - badgeWidth, 0.5, 0),
                Size = UDim2.fromOffset(14, 14),
                ImageColor3 = Theme.Muted,
                ZIndex = 3,
                Parent = button,
            })
            Tab.ButtonLabel.Size = UDim2.new(1, -textX - 28 - badgeWidth, 1, 0)
        end

        function Tab:SetExpanded(value, instant)
            value = value == true
            Tab.Expanded = value
            if not group then
                return
            end
            expandToken += 1
            local mine = expandToken
            local info = instant and TweenInfo.new(Dur.instant) or SMOOTH
            Tween(Tab.Chevron, info, { Rotation = value and 90 or 0 })
            if value then
                group.Visible = true
                Tween(group, info, { Size = UDim2.new(1, 0, 0, groupHeight()) })
                if not instant then
                    guide.Size = UDim2.fromOffset(1, 0)
                end
                local count = #Tab.SubTabs
                local guideHeight = 2 + (count - 1) * (SUB_HEIGHT + SUB_GAP) + math.floor(SUB_HEIGHT / 2)
                Tween(
                    guide,
                    instant and info or TweenInfo.new(Dur.slow, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    { Size = UDim2.fromOffset(1, guideHeight) }
                )
            else
                Tween(group, info, { Size = UDim2.new(1, 0, 0, 0) })
                task.delay(info.Time, function()
                    if mine == expandToken and not Tab.Expanded then
                        group.Visible = false
                    end
                end)
            end
            paintTab(Tab)
        end
        Tab.Expand = Tab.SetExpanded

        function Tab:SubTab(subOptions)
            if type(subOptions) == "string" then
                subOptions = { Name = subOptions }
            end
            ensureGroup()
            local Sub = {
                Name = subOptions.Name or "Category",
                Description = subOptions.Description,
                Icon = subOptions.Icon,
                Sections = {},
                Parent = Tab,
                IsSub = true,
            }
            local subButton
            if COMPACT then
                subButton = Create("TextButton", {
                    Name = Sub.Name,
                    Size = UDim2.fromOffset(0, 22),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundColor3 = Theme.Hover,
                    BackgroundTransparency = 1,
                    Text = "",
                    AutoButtonColor = false,
                    LayoutOrder = #Tab.SubTabs + 1,
                    ZIndex = 3,
                    Parent = Tab.ChipList,
                }, {
                    Corner(Radius.sm),
                    Padding(0, 10, 0, subOptions.Icon and 8 or 10),
                    Create("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0, 5),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                    }),
                })
                Sub.Button = subButton
                if subOptions.Icon then
                    Sub.IconImage = Icon(subOptions.Icon, {
                        Size = UDim2.fromOffset(12, 12),
                        ImageColor3 = Theme.Muted,
                        LayoutOrder = 1,
                        ZIndex = 4,
                        Parent = subButton,
                    })
                end
                Sub.ButtonLabel = Label({
                    Text = Sub.Name,
                    FontFace = Fonts.Medium,
                    TextSize = 14,
                    TextColor3 = Theme.Muted,
                    Size = UDim2.fromOffset(0, 22),
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextTruncate = Enum.TextTruncate.None,
                    LayoutOrder = 2,
                    ZIndex = 4,
                    Parent = subButton,
                })
                if subOptions.Badge then
                    Sub.Badge = Create("Frame", {
                        Size = UDim2.fromOffset(6, 6),
                        BackgroundColor3 = Theme.Accent,
                        LayoutOrder = 3,
                        ZIndex = 4,
                        Parent = subButton,
                    }, { Corner(Radius.xs) })
                end
                Library:_attachTooltip(subButton, subOptions.Description)
            else
                subButton = Create("TextButton", {
                    Name = Sub.Name,
                    Size = UDim2.new(1, 0, 0, SUB_HEIGHT),
                    BackgroundColor3 = Theme.Hover,
                    BackgroundTransparency = 1,
                    Text = "",
                    AutoButtonColor = false,
                    LayoutOrder = #Tab.SubTabs + 1,
                    ZIndex = 2,
                    Parent = groupList,
                }, { Corner(Radius.sm) })
                Sub.Button = subButton

                Sub.Branch = Create("Frame", {
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, GUIDE_X - SUB_INDENT, 0.5, 0),
                    Size = UDim2.fromOffset(SUB_INDENT - GUIDE_X - 3, 1),
                    BackgroundColor3 = Theme.Stroke,
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    Parent = subButton,
                })
                local subTextX = 11
                if subOptions.Icon then
                    Sub.IconImage = Icon(subOptions.Icon, {
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.new(0, 10, 0.5, 0),
                        Size = UDim2.fromOffset(14, 14),
                        ImageColor3 = Theme.Muted,
                        ZIndex = 3,
                        Parent = subButton,
                    })
                    subTextX = 31
                end
                local subBadgeWidth = 0
                if subOptions.Badge then
                    Sub.Badge = createBadge(subButton, subOptions.Badge, 16, -7)
                    subBadgeWidth = 40
                end
                Sub.ButtonLabel = Label({
                    Text = Sub.Name,
                    FontFace = Fonts.Regular,
                    TextSize = 14,
                    TextColor3 = Theme.Muted,
                    Position = UDim2.fromOffset(subTextX, 0),
                    Size = UDim2.new(1, -subTextX - 6 - subBadgeWidth, 1, 0),
                    ZIndex = 3,
                    Parent = subButton,
                })
            end
            subButton.MouseEnter:Connect(function()
                if Window.ActiveTab ~= Sub then
                    paintTab(Sub, "hover")
                end
            end)
            subButton.MouseLeave:Connect(function()
                paintTab(Sub)
            end)
            subButton.Activated:Connect(function()
                Window:SelectTab(Sub)
            end)

            buildPage(Sub)
            table.insert(Tab.SubTabs, Sub)
            Sub.Index = #Tab.SubTabs
            if Tab.Expanded then
                Tab:SetExpanded(true, true)
            end
            if #Tab.SubTabs == 1 then

                task.defer(function()
                    if Window.ActiveTab == Tab and #Tab.Sections == 0 then
                        Window:SelectTab(Tab)
                    end
                end)
                if options.Expanded then
                    Tab:SetExpanded(true, true)
                end
            end
            return Sub
        end
        Tab.Subcategory = Tab.SubTab
        Tab.Category = Tab.SubTab

        table.insert(Window.Tabs, Tab)
        if not Window.ActiveTab then
            Window:SelectTab(Tab)
        end
        return Tab
    end

    Library.Window = Window
    return Window
end

local Section = {}
Section.__index = Section

function Library._createSection(tab, options)
    local self = setmetatable({
        Name = options.Name or "Section",
        Elements = {},
        Tab = tab,
    }, Section)

    local side = options.Side
    if side == nil then
        tab._autoSections = (tab._autoSections or 0) + 1
        side = (tab._autoSections % 2 == 1) and "Left" or "Right"
    end
    local parentColumn = (side == "Right" or side == 2) and tab.Right or tab.Left
    local frame = Create("Frame", {
        Name = self.Name,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Theme.Surface,
        LayoutOrder = nextOrder(),
        Parent = parentColumn,
    }, {
        Corner(COMPACT and 10 or 12),
        Stroke(Theme.StrokeSoft),
        COMPACT and Padding(5, 5, 6, 5) or Padding(8, 8, 8, 8),
    })
    self.Frame = frame

    local header = Create("TextButton", {
        Name = "Header",
        Size = UDim2.new(1, 0, 0, COMPACT and 36 or 40),
        BackgroundTransparency = 1,
        Text = "",
        AutoButtonColor = false,
        LayoutOrder = 0,
        Parent = frame,
    })
    local titleX = 8
    if options.Icon then
        local tile = Create("Frame", {
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 6, 0.5, -2),
            Size = UDim2.fromOffset(COMPACT and 24 or 26, COMPACT and 24 or 26),
            BackgroundColor3 = Theme.Elevated,
            Parent = header,
        }, { Corner(COMPACT and 6 or 8), Stroke(Theme.Stroke, 0.3) })
        Icon(options.Icon, {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(COMPACT and 14 or 15, COMPACT and 14 or 15),
            ImageColor3 = Theme.Text,
            Parent = tile,
        })
        titleX = COMPACT and 37 or 40
    end
    local titleLabel = Label({
        Text = self.Name,
        FontFace = Fonts.SemiBold,
        TextSize = COMPACT and 16 or 15,
        Position = UDim2.fromOffset(titleX, 0),
        Size = UDim2.new(1, -titleX - 36, 1, -4),
        Parent = header,
    })
    local hairline = Create("Frame", {
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.new(0, 8, 1, -2),
        Size = UDim2.new(1, -16, 0, 1),
        BackgroundColor3 = Theme.StrokeSoft,
        BorderSizePixel = 0,
        Parent = header,
    })
    local fold = Icon("chevron-down", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -10, 0.5, -2),
        Size = UDim2.fromOffset(14, 14),
        ImageColor3 = Theme.Muted,
        Parent = header,
    })

    self.Container = Create("Frame", {
        Name = "Elements",
        Position = UDim2.new(0, 0, 0, COMPACT and 36 or 40),
        Size = UDim2.new(1, 0, 0, 0),
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Parent = frame,
    })
    Flow(self.Container, Space.row)

    local collapsed, foldToken = false, 0
    local pressPosition, pressMoved = nil, false
    header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            pressPosition = input.Position
            pressMoved = false
        end
    end)
    Connect(UserInputService.InputChanged, function(input)
        if not pressPosition then
            return
        end
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if (input.Position - pressPosition).Magnitude > 8 then
                pressMoved = true
            end
        end
    end)
    header.MouseEnter:Connect(function()
        Tween(fold, FAST, { ImageColor3 = Theme.Text })
    end)
    header.MouseLeave:Connect(function()
        Tween(fold, FAST, { ImageColor3 = Theme.Muted })
    end)
    header.Activated:Connect(function()
        local dragged = pressMoved
        pressPosition, pressMoved = nil, false
        if dragged then
            return
        end
        collapsed = not collapsed
        foldToken += 1
        local mine = foldToken
        local container = self.Container
        local s = Library.Window and Library.Window.Scale.Scale or 1
        local full = math.floor(self.Container.AbsoluteSize.Y / s + 0.5)
        Tween(fold, SMOOTH, { Rotation = collapsed and -90 or 0 })
        Tween(hairline, FAST, { BackgroundTransparency = collapsed and 1 or 0 })
        Tween(titleLabel, FAST, { TextColor3 = collapsed and Theme.SubText or Theme.Text })
        container.AutomaticSize = Enum.AutomaticSize.None
        container.ClipsDescendants = true
        if collapsed then
            container.Size = UDim2.new(1, 0, 0, full)
            Tween(container, SMOOTH, { Size = UDim2.new(1, 0, 0, 0) })
            task.delay(SMOOTH.Time, function()
                if mine == foldToken and collapsed then
                    container.Visible = false
                end
            end)
        else
            container.Visible = true
            container.Size = UDim2.new(1, 0, 0, 0)
            Tween(container, SMOOTH, { Size = UDim2.new(1, 0, 0, full) })
            task.delay(SMOOTH.Time, function()
                if mine == foldToken and not collapsed then
                    container.AutomaticSize = Enum.AutomaticSize.Y
                    container.ClipsDescendants = false
                end
            end)
        end
    end)

    table.insert(tab.Sections, self)
    return self
end

function Section:_row(options, clickable)
    local hasDescription = type(options.Description) == "string" and options.Description ~= ""

    local tooltip = options.Tooltip
    if COMPACT and hasDescription then
        tooltip = tooltip or options.Description
        hasDescription = false
    end
    local header = COMPACT and 32 or (hasDescription and 48 or 34)
    local row = Create(clickable and "TextButton" or "Frame", {
        Name = options.Name or "Element",
        Size = UDim2.new(1, 0, 0, header),
        BackgroundColor3 = Theme.Elevated,
        BackgroundTransparency = 1,
        LayoutOrder = nextOrder(),
        ClipsDescendants = false,
        Parent = self.Container,
    }, { Corner(Radius.md) })

    row:SetAttribute("NestOrder", nextOrder())
    if clickable then
        row.Text = ""
        row.AutoButtonColor = false
        row.MouseEnter:Connect(function()
            Tween(row, FAST, { BackgroundTransparency = 0.45 })
        end)
        row.MouseLeave:Connect(function()
            Tween(row, FAST, { BackgroundTransparency = 1 })
        end)
    end

    local textX = 8
    if options.Icon then
        Icon(options.Icon, {
            Name = "Glyph",
            Position = UDim2.fromOffset(8, COMPACT and 8 or 9),
            Size = UDim2.fromOffset(COMPACT and 15 or 16, COMPACT and 15 or 16),
            ImageColor3 = Theme.SubText,
            Parent = row,
        })
        textX = COMPACT and 30 or 32
    end
    local name = Label({
        Name = "Title",
        Text = options.Name or "Element",
        TextSize = 15,
        Position = UDim2.fromOffset(textX, COMPACT and 7 or 8),
        Size = UDim2.new(1, -textX - 8, 0, 18),
        Parent = row,
    })
    local description
    if hasDescription then
        description = Label({
            Name = "Description",
            Text = options.Description,
            TextSize = COMPACT and 11 or 13,
            TextColor3 = Theme.Muted,
            Position = UDim2.fromOffset(textX, COMPACT and 22 or 26),
            Size = UDim2.new(1, -textX - 8, 0, 14),
            Parent = row,
        })

        name:GetPropertyChangedSignal("Size"):Connect(function()
            description.Size = UDim2.new(name.Size.X.Scale, name.Size.X.Offset, 0, 14)
        end)
    end
    table.insert(self.Elements, { Name = options.Name or "", Frame = row })
    Library:_attachTooltip(row, tooltip)
    return row, name, header, description
end

local function registerFlag(options, api)
    if options.Flag then
        Library.Options[options.Flag] = api
    end
end

local function setFlag(options, value)
    if options.Flag then
        Library.Flags[options.Flag] = value
    end
end

local function revealWhileGrowing(frame, duration)
    local column = frame:FindFirstAncestorWhichIsA("ScrollingFrame")
    if not column then
        return
    end
    local started = os.clock()
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if os.clock() - started > (duration or 0.4) or not frame.Parent then
            connection:Disconnect()
            return
        end
        local s = Library.Window and Library.Window.Scale.Scale or 1
        local top = frame.AbsolutePosition.Y - column.AbsolutePosition.Y
        local overflow = frame.AbsolutePosition.Y
            + frame.AbsoluteSize.Y
            - (column.AbsolutePosition.Y + column.AbsoluteSize.Y - 10 * s)
        overflow = math.min(overflow, top - 6 * s)
        if overflow > 0.5 then
            column.CanvasPosition = Vector2.new(0, math.ceil(column.CanvasPosition.Y + overflow / s))
        end
    end)
    table.insert(Library._connections, connection)
end

local function createKeycap(parent, position, anchor)
    local cap = Create("TextButton", {
        Name = "Keycap",
        AnchorPoint = anchor,
        Position = position,
        Size = UDim2.fromOffset(0, 22),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Theme.Elevated,
        Text = "None",
        FontFace = Fonts.Medium,
        TextSize = 13,
        TextColor3 = Theme.SubText,
        AutoButtonColor = false,
        Parent = parent,
    }, { Corner(Radius.sm), Padding(0, 8, 0, 8) })
    local stroke = Stroke(Theme.Stroke)
    stroke.Parent = cap
    return cap, stroke
end

local function attachKeyPicker(cap, stroke, initial, onChanged)
    local picker = { Key = initial, Listening = false }

    local function render()
        cap.Text = picker.Listening and "..." or keyName(picker.Key)
        Tween(cap, FAST, { TextColor3 = (picker.Listening or picker.Key) and Theme.Text or Theme.Muted })
        Tween(stroke, FAST, { Color = picker.Listening and Theme.SubText or Theme.Stroke })
    end

    function picker:Set(key, silent)
        picker.Key = key
        render()
        if not silent then
            onChanged(key)
        end
    end

    function picker:Listen()
        if picker.Listening then
            return
        end
        picker.Listening = true
        Library._listening = true
        render()

        task.spawn(function()
            local bright = true
            while picker.Listening and cap.Parent do
                Tween(
                    stroke,
                    TweenInfo.new(Dur.slow, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    { Color = bright and Theme.Text or Theme.Stroke }
                )
                bright = not bright
                task.wait(0.5)
            end
        end)
        local connection
        connection = UserInputService.InputBegan:Connect(function(input)
            local key
            if input.UserInputType == Enum.UserInputType.Keyboard then
                key = input.KeyCode
            elseif
                input.UserInputType == Enum.UserInputType.MouseButton2
                or input.UserInputType == Enum.UserInputType.MouseButton3
            then
                key = input.UserInputType
            elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
                return
            else
                return
            end
            connection:Disconnect()
            picker.Listening = false
            task.defer(function()
                Library._listening = false
            end)
            if key == Enum.KeyCode.Escape then
                render()
                return
            end
            if key == Enum.KeyCode.Backspace or key == Enum.KeyCode.Delete then
                key = nil
            end
            picker:Set(key)
        end)
        table.insert(Library._connections, connection)
    end

    cap.Activated:Connect(function()
        picker:Listen()
    end)

    render()
    return picker
end

local function inputMatches(input, key)
    if not key then
        return false
    end
    if key.EnumType == Enum.KeyCode then
        return input.KeyCode == key
    end
    return input.UserInputType == key
end

local function createNested(section, row)
    local outer = Create("Frame", {
        Name = (row and row.Name or "Group") .. "_Nested",
        Size = UDim2.new(1, 0, 0, 0),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Visible = false,
        LayoutOrder = row and row:GetAttribute("NestOrder") or nextOrder(),
        Parent = section.Container,
    })

    local guide = Create("Frame", {
        Name = "Guide",
        Position = UDim2.fromOffset(13, 2),
        Size = UDim2.new(0, 2, 1, -10),
        BackgroundColor3 = Theme.Stroke,
        BorderSizePixel = 0,
        Parent = outer,
    }, { Corner(Radius.xs) })
    local inner = Create("Frame", {
        Name = "Inner",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Parent = outer,
    }, { Padding(0, 0, 6, 18) })
    local innerList = List(Space.nest)
    innerList.Parent = inner

    local sub = setmetatable({
        Name = section.Name,
        Elements = section.Elements,
        Tab = section.Tab,
        Frame = section.Frame,
        Container = inner,
    }, Section)

    local open, token, follow = false, 0, nil
    local function contentHeight()
        local s = Library.Window and Library.Window.Scale.Scale or 1
        return math.floor(innerList.AbsoluteContentSize.Y / s + 0.5) + 6
    end

    local function setOpen(value, instant)
        open = value
        token += 1
        local mine = token
        if follow then
            follow:Disconnect()
            follow = nil
        end
        if value then
            outer.Visible = true
            local goal = UDim2.new(1, 0, 0, contentHeight())
            if instant then
                outer.Size = goal
            else
                guide.Size = UDim2.new(0, 2, 0, 0)
                Tween(
                    guide,
                    TweenInfo.new(Dur.slow, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    { Size = UDim2.new(0, 2, 1, -10) }
                )
                Tween(outer, SMOOTH, { Size = goal })
                revealWhileGrowing(outer)
            end

            follow = innerList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                if open and mine == token then
                    outer.Size = UDim2.new(1, 0, 0, contentHeight())
                end
            end)
        else
            Tween(outer, instant and TweenInfo.new(Dur.instant) or SMOOTH, { Size = UDim2.new(1, 0, 0, 0) })
            task.delay(instant and 0 or SMOOTH.Time, function()
                if mine == token and not open then
                    outer.Visible = false
                end
            end)
        end
    end

    return sub, setOpen, function()
        return open
    end
end

function Section:Toggle(options)
    options = options or {}
    local api = { Type = "Toggle", Value = options.Default == true }
    local row, title = self:_row(options, true)

    local KNOB, KNOB_ON, KNOB_SQUISH = COMPACT and 12 or 16, COMPACT and 17 or 19, COMPACT and 16 or 21
    local switch = Create("Frame", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -8, 0.5, 0),
        Size = COMPACT and UDim2.fromOffset(32, 18) or UDim2.fromOffset(38, 22),
        BackgroundColor3 = Theme.Elevated,
        Parent = row,
    }, { Corner(COMPACT and 9 or 11) })
    local switchStroke = Stroke(Theme.Stroke)
    switchStroke.Parent = switch
    local knob = Create("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 3, 0.5, 0),
        Size = UDim2.fromOffset(KNOB, KNOB),
        BackgroundColor3 = Theme.Muted,
        Parent = switch,
    }, { Corner(KNOB / 2) })

    local reserved = COMPACT and 46 or 54
    local picker
    if options.Keybind ~= nil then
        local cap, capStroke = createKeycap(row, UDim2.new(1, -54, 0.5, 0), Vector2.new(1, 0.5))
        picker = attachKeyPicker(cap, capStroke, options.Keybind or nil, function(key)
            if options.Flag then
                Library.Flags[options.Flag .. "_Key"] = key and key.Name or "None"
            end
        end)
        reserved = 118
        table.insert(Library._binds, {
            Name = options.Name or "Toggle",
            Get = function()
                return picker.Key
            end,
            State = function()
                return api.Value
            end,
            Press = function()
                api:Set(not api.Value)
            end,
        })
        if options.Flag then
            Library.Flags[options.Flag .. "_Key"] = picker.Key and picker.Key.Name or "None"
            Library.Options[options.Flag .. "_Key"] = {
                Type = "Keybind",
                Get = function()
                    return picker.Key
                end,
                Set = function(_, key)
                    picker:Set(key)
                end,
            }
        end
    end
    title.Size = UDim2.new(1, -reserved - title.Position.X.Offset + 8, 0, 18)
    api.KeyPicker = picker

    local nested, setNestedOpen, chevron
    local function render(instant)
        local info = instant and TweenInfo.new(Dur.instant)
            or TweenInfo.new(Dur.smooth, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
        Tween(switch, info, { BackgroundColor3 = api.Value and Theme.Accent or Theme.Elevated })
        Tween(switchStroke, info, { Color = api.Value and Theme.Accent or Theme.Stroke })
        Tween(knob, info, {
            Position = api.Value and UDim2.new(0, KNOB_ON, 0.5, 0) or UDim2.new(0, 3, 0.5, 0),
            BackgroundColor3 = api.Value and Theme.OnAccent or Theme.Muted,
        })
        if not instant then

            knob.Size = UDim2.fromOffset(KNOB_SQUISH, KNOB)
            Tween(
                knob,
                TweenInfo.new(Dur.smooth, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                { Size = UDim2.fromOffset(KNOB, KNOB) }
            )
            if api.Value then

                local glow = Create("Frame", {
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    ZIndex = switch.ZIndex,
                    Parent = switch,
                }, {
                    Corner(Radius.lg),
                    Create("UIStroke", { Color = Theme.Accent, Thickness = 1.5, Transparency = 0.25 }),
                })
                glow:SetAttribute("NoTheme", true)
                local glowInfo = TweenInfo.new(Dur.slow, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
                Tween(glow, glowInfo, { Size = UDim2.new(1, 12, 1, 12) })
                Tween(glow:FindFirstChildOfClass("UIStroke"), glowInfo, { Transparency = 1 })
                task.delay(0.5, function()
                    glow:Destroy()
                end)
            end
        end
        Tween(title, info, { TextColor3 = api.Value and Theme.Text or Theme.SubText })
        if setNestedOpen and chevron then
            setNestedOpen(api.Value, instant)
            Tween(chevron, instant and TweenInfo.new(Dur.instant) or SMOOTH, {
                Rotation = api.Value and 90 or 0,
                ImageColor3 = api.Value and Theme.Text or Theme.Muted,
            })
        end
    end

    function api:Set(value, silent)
        value = value == true
        api.Value = value
        setFlag(options, value)
        render()
        if not silent then
            safeCall(options.Callback, value)
        end
    end
    function api:Get()
        return api.Value
    end

    function api:SubOptions(subOptions)
        if nested then
            return nested
        end
        nested, setNestedOpen = createNested(self._section, row)
        if not (type(subOptions) == "table" and subOptions.Fold) then
            setNestedOpen(true, true)
            return nested
        end
        chevron = Icon("chevron-right", {
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -(reserved + 2), 0.5, 0),
            Size = UDim2.fromOffset(14, 14),
            ImageColor3 = Theme.Muted,
            Parent = row,
        })
        reserved += 22
        title.Size = UDim2.new(1, -reserved - title.Position.X.Offset + 8, 0, 18)
        render(true)
        return nested
    end
    api._section = self

    row.Activated:Connect(function()
        api:Set(not api.Value)
    end)

    setFlag(options, api.Value)
    registerFlag(options, api)
    render(true)
    if api.Value and options.CallOnInit ~= false then
        safeCall(options.Callback, true)
    end
    return api
end

function Section:Slider(options)
    options = options or {}
    local min, max = options.Min or 0, options.Max or 100
    local step = options.Increment or 1
    local suffix = options.Suffix or ""
    local function display(value)
        if type(options.Format) == "function" then
            return tostring(options.Format(value))
        end
        return formatNumber(value, step) .. suffix
    end
    local api = { Type = "Slider", Value = math.clamp(options.Default or min, min, max) }

    local row, _, header = self:_row(options, false)
    row.Size = UDim2.new(1, 0, 0, header + (COMPACT and 10 or 14))

    local valueBox = Create("TextBox", {
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -8, 0, COMPACT and 6 or 8),
        Size = UDim2.fromOffset(70, 18),
        BackgroundTransparency = 1,
        Text = "",
        FontFace = Fonts.Medium,
        TextSize = 14,
        TextColor3 = Theme.SubText,
        TextXAlignment = Enum.TextXAlignment.Right,
        ClearTextOnFocus = false,
        Parent = row,
    })
    row.Title.Size = UDim2.new(1, -90 - row.Title.Position.X.Offset + 8, 0, 18)

    local track = Create("Frame", {
        Position = UDim2.new(0, 8, 0, header - (COMPACT and 4 or 3)),
        Size = UDim2.new(1, -16, 0, COMPACT and 4 or 6),
        BackgroundColor3 = Theme.Elevated,
        BorderSizePixel = 0,
        Parent = row,
    }, { Corner(Radius.xs) })
    local fill = Create("Frame", {
        Size = UDim2.fromScale(0, 1),
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel = 0,
        Parent = track,
    }, { Corner(Radius.xs) })

    local knob = Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromOffset(14, 14),
        BackgroundColor3 = Theme.Text,
        ZIndex = 2,
        Parent = track,
    }, {
        Create("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
        Create("UIStroke", { Color = Theme.Surface, Thickness = 3 }),
    })
    local hitbox = Create("TextButton", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 0, 0.5, 0),
        Size = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1,
        Text = "",
        ZIndex = 3,
        Parent = track,
    })

    local bubble = Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 0, -8),
        Size = UDim2.fromOffset(0, 22),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Theme.Accent,
        Visible = false,
        ZIndex = 6,
        Parent = knob,
    }, { Corner(Radius.sm), Padding(0, 7, 0, 7) })
    local bubbleText = Label({
        Size = UDim2.fromOffset(0, 22),
        AutomaticSize = Enum.AutomaticSize.X,
        FontFace = Fonts.Medium,
        TextSize = 13,
        TextColor3 = Theme.OnAccent,
        TextTruncate = Enum.TextTruncate.None,
        ZIndex = 7,
        Parent = bubble,
    })
    local bubbleScale = Create("UIScale", { Scale = 0, Parent = bubble })
    local function showBubble(visible)
        if visible then
            bubble.Visible = true
            Tween(bubbleScale, BOUNCE, { Scale = 1 })
        else
            local t = Tween(bubbleScale, FAST, { Scale = 0 })
            t.Completed:Connect(function(state)
                if state == Enum.PlaybackState.Completed then
                    bubble.Visible = false
                end
            end)
        end
    end

    local function render(instant)
        local alpha = (max > min) and (api.Value - min) / (max - min) or 0
        local info = instant and TweenInfo.new(Dur.instant)
            or TweenInfo.new(Dur.fast, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
        Tween(fill, info, { Size = UDim2.fromScale(alpha, 1) })
        Tween(knob, info, { Position = UDim2.fromScale(alpha, 0.5) })
        bubbleText.Text = display(api.Value)
        if not valueBox:IsFocused() then
            valueBox.Text = display(api.Value)
        end
    end

    function api:Set(value, silent)
        value = tonumber(value)
        if not value then
            render()
            return
        end
        value = math.clamp(round(value, step), min, max)

        value = tonumber(formatNumber(value, step))
        local changed = value ~= api.Value
        api.Value = value
        setFlag(options, value)
        render()
        if changed and not silent then
            safeCall(options.Callback, value)
        end
    end
    function api:Get()
        return api.Value
    end

    local dragging = nil
    hitbox.MouseEnter:Connect(function()
        Tween(knob, FAST, { Size = UDim2.fromOffset(17, 17) })
    end)
    hitbox.MouseLeave:Connect(function()
        if not dragging then
            Tween(knob, FAST, { Size = UDim2.fromOffset(14, 14) })
        end
    end)
    local function update(x)
        local alpha = math.clamp((x - track.AbsolutePosition.X) / math.max(track.AbsoluteSize.X, 1), 0, 1)
        api:Set(min + (max - min) * alpha)
    end
    hitbox.InputBegan:Connect(function(input)
        if claimPointer(input) then
            dragging = input
            Tween(knob, FAST, { Size = UDim2.fromOffset(17, 17) })
            Tween(valueBox, FAST, { TextColor3 = Theme.Text })
            update(input.Position.X)
            showBubble(true)
        end
    end)
    Connect(UserInputService.InputChanged, function(input)
        if movesPointer(dragging, input) then
            update(input.Position.X)
        end
    end)
    Connect(UserInputService.InputEnded, function(input)
        if endsPointer(dragging, input) then
            dragging = nil
            Tween(knob, FAST, { Size = UDim2.fromOffset(14, 14) })
            Tween(valueBox, FAST, { TextColor3 = Theme.SubText })
            showBubble(false)
        end
    end)

    valueBox.Focused:Connect(function()
        valueBox.Text = formatNumber(api.Value, step)
        Tween(valueBox, FAST, { TextColor3 = Theme.Text })
    end)
    valueBox.FocusLost:Connect(function()
        Tween(valueBox, FAST, { TextColor3 = Theme.SubText })
        local number = tonumber((valueBox.Text:gsub("[^%d%.%-]", "")))
        if number then
            api:Set(number)
        end
        valueBox.Text = display(api.Value)
    end)

    setFlag(options, api.Value)
    registerFlag(options, api)
    render(true)
    return api
end

local function createChevron(parent, position)
    local holder = Create("Frame", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = position,
        Size = UDim2.fromOffset(12, 8),
        BackgroundTransparency = 1,
        Parent = parent,
    })
    local left = Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, -2, 0.5, 0),
        Size = UDim2.fromOffset(6, 1.5),
        Rotation = 45,
        BackgroundColor3 = Theme.SubText,
        BorderSizePixel = 0,
        Parent = holder,
    })
    local right = Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 2, 0.5, 0),
        Size = UDim2.fromOffset(6, 1.5),
        Rotation = -45,
        BackgroundColor3 = Theme.SubText,
        BorderSizePixel = 0,
        Parent = holder,
    })
    return function(open)
        Tween(left, SMOOTH, { Rotation = open and -45 or 45, BackgroundColor3 = open and Theme.Text or Theme.SubText })
        Tween(right, SMOOTH, { Rotation = open and 45 or -45, BackgroundColor3 = open and Theme.Text or Theme.SubText })
    end
end

function Section:Dropdown(options)
    options = options or {}
    local multi = options.Multi == true
    local api = { Type = "Dropdown", Options = table.clone(options.Options or {}), Open = false }
    if multi then
        api.Value = {}
        for _, v in ipairs(type(options.Default) == "table" and options.Default or {}) do
            api.Value[v] = true
        end
    else
        api.Value = options.Default
    end

    local row, title, header = self:_row(options, false)

    local inline = COMPACT and not (type(options.Description) == "string" and options.Description ~= "")
    local BOX = COMPACT and 26 or 30
    local boxTop = inline and math.floor((header - BOX) / 2) or header - (COMPACT and 4 or 6)
    local closedHeight = inline and header or boxTop + BOX + (COMPACT and 6 or 8)
    row.Size = UDim2.new(1, 0, 0, closedHeight)
    row.ClipsDescendants = true

    local box = Create("TextButton", {
        AnchorPoint = inline and Vector2.new(1, 0) or Vector2.zero,
        Position = inline and UDim2.new(1, -6, 0, boxTop) or UDim2.fromOffset(8, boxTop),
        Size = inline and UDim2.new(0.56, -6, 0, BOX) or UDim2.new(1, -16, 0, BOX),
        BackgroundColor3 = Theme.Elevated,
        Text = "",
        AutoButtonColor = false,
        Parent = row,
    }, { Corner(COMPACT and 7 or 8) })
    if inline then
        title.Size = UDim2.new(0.44, -title.Position.X.Offset, 0, 18)
    end
    local boxStroke = Stroke(Theme.Stroke)
    boxStroke.Parent = box
    local display = Label({
        Text = "",
        TextSize = 14,
        TextColor3 = Theme.SubText,
        Position = UDim2.fromOffset(10, 0),
        Size = UDim2.new(1, -36, 1, 0),
        Parent = box,
    })
    local setChevron = createChevron(box, UDim2.new(1, -10, 0.5, 0))

    local listFrame = Create("Frame", {
        Position = UDim2.fromOffset(8, inline and closedHeight + 2 or boxTop + BOX + 4),
        Size = UDim2.new(1, -16, 0, 0),
        BackgroundColor3 = Theme.Elevated,
        ClipsDescendants = true,
        Parent = row,
    }, { Corner(Radius.md) })
    Stroke(Theme.Stroke).Parent = listFrame

    local filter
    local searchable = #api.Options > 7 or options.Searchable
    if searchable then
        filter = Create("TextBox", {
            Position = UDim2.fromOffset(4, 4),
            Size = UDim2.new(1, -8, 0, 24),
            BackgroundColor3 = Theme.Surface,
            Text = "",
            PlaceholderText = "Filter…",
            PlaceholderColor3 = Theme.Muted,
            TextColor3 = Theme.Text,
            FontFace = Fonts.Regular,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            ClearTextOnFocus = false,
            Parent = listFrame,
        }, { Corner(Radius.sm), Padding(0, 8, 0, 8) })
    end

    local scroller = Create("ScrollingFrame", {
        Position = UDim2.fromOffset(0, searchable and 30 or 0),
        Size = UDim2.new(1, 0, 1, searchable and -30 or 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = Theme.Stroke,
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Parent = listFrame,
    }, { List(0), Padding(4, 4, 4, 4) })

    local ITEM = COMPACT and 24 or 26
    local optionButtons = {}

    local function isSelected(value)
        if multi then
            return api.Value[value] == true
        end
        return api.Value == value
    end

    local function displayText()
        if multi then
            local picked = {}
            for _, value in ipairs(api.Options) do
                if api.Value[value] then
                    table.insert(picked, tostring(value))
                end
            end
            return #picked > 0 and table.concat(picked, ", ") or "None"
        end
        return api.Value ~= nil and tostring(api.Value) or "None"
    end

    local function visibleCount()
        local count = 0
        for _, entry in ipairs(optionButtons) do
            if entry.Button.Visible then
                count += 1
            end
        end
        return count
    end

    local function listHeight()
        local count = math.max(visibleCount(), 1)
        return math.min(count, 6) * ITEM + 8 + (searchable and 30 or 0)
    end

    local layoutToken = 0
    local function layout(instant)
        local info = instant and TweenInfo.new(Dur.instant) or SMOOTH
        local open = api.Open
        local h = open and listHeight() or 0

        layoutToken += 1
        local token = layoutToken
        if open then
            listFrame.Visible = true
        elseif instant then
            listFrame.Visible = false
        else
            task.delay(SMOOTH.Time, function()
                if token == layoutToken and not api.Open then
                    listFrame.Visible = false
                end
            end)
        end
        Tween(listFrame, info, { Size = UDim2.new(1, -16, 0, h) })
        Tween(row, info, { Size = UDim2.new(1, 0, 0, closedHeight + (open and h + 4 or 0)) })
        Tween(boxStroke, FAST, { Color = open and Theme.Muted or Theme.Stroke })
        setChevron(open)
        if open and not instant then
            revealWhileGrowing(row)
        end
    end

    local function renderItems()
        for _, entry in ipairs(optionButtons) do
            local selected = isSelected(entry.Value)
            Tween(entry.Label, FAST, { TextColor3 = selected and Theme.Text or Theme.SubText })
            Tween(entry.MarkScale, selected and BOUNCE or FAST, { Scale = selected and 1 or 0 })
        end
        local text = displayText()
        display.Text = text
        display.TextColor3 = (text == "None") and Theme.Muted or Theme.Text
    end

    local function commit(silent)
        if multi then
            local list = {}
            for _, value in ipairs(api.Options) do
                if api.Value[value] then
                    table.insert(list, value)
                end
            end
            setFlag(options, list)
            renderItems()
            if not silent then
                safeCall(options.Callback, list)
            end
        else
            setFlag(options, api.Value)
            renderItems()
            if not silent then
                safeCall(options.Callback, api.Value)
            end
        end
    end

    local function buildItems()
        for _, entry in ipairs(optionButtons) do
            entry.Button:Destroy()
        end
        table.clear(optionButtons)
        for index, value in ipairs(api.Options) do
            local button = Create("TextButton", {
                Size = UDim2.new(1, 0, 0, ITEM),
                BackgroundColor3 = Theme.Hover,
                BackgroundTransparency = 1,
                Text = "",
                AutoButtonColor = false,
                LayoutOrder = index,
                Parent = scroller,
            }, { Corner(Radius.sm) })
            local label = Label({
                Text = tostring(value),
                TextSize = 14,
                TextColor3 = Theme.SubText,
                Position = UDim2.fromOffset(8, 0),
                Size = UDim2.new(1, -30, 1, 0),
                Parent = button,
            })
            local mark = Icon("check", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(1, -14, 0.5, 0),
                Size = UDim2.fromOffset(14, 14),
                ImageColor3 = Theme.Text,
                Parent = button,
            })
            local markScale = Create("UIScale", { Scale = 0, Parent = mark })
            button.MouseEnter:Connect(function()
                Tween(button, FAST, { BackgroundTransparency = 0 })
            end)
            button.MouseLeave:Connect(function()
                Tween(button, FAST, { BackgroundTransparency = 1 })
            end)
            button.Activated:Connect(function()
                if multi then
                    api.Value[value] = not api.Value[value] or nil
                    commit()
                else
                    if api.Value == value and options.AllowNone then
                        api.Value = nil
                    else
                        api.Value = value
                    end
                    commit()
                    api:Close()
                end
            end)
            table.insert(
                optionButtons,
                { Button = button, Label = label, Mark = mark, MarkScale = markScale, Value = value }
            )
        end
        renderItems()
    end

    if filter then
        filter:GetPropertyChangedSignal("Text"):Connect(function()
            local query = filter.Text:lower()
            for _, entry in ipairs(optionButtons) do
                entry.Button.Visible = query == "" or tostring(entry.Value):lower():find(query, 1, true) ~= nil
            end
            if api.Open then
                layout()
            end
        end)
    end

    api._row = row
    api._list = listFrame
    function api:Close()
        if api.Open then
            api.Open = false
            layout()
        end
        if Library._openDropdown == api then
            Library._openDropdown = nil
        end
    end

    box.Activated:Connect(function()
        api.Open = not api.Open

        if api.Open then
            if Library._openDropdown and Library._openDropdown ~= api then
                Library._openDropdown:Close()
            end
            Library._openDropdown = api
        elseif Library._openDropdown == api then
            Library._openDropdown = nil
        end
        layout()
        if api.Open then

            local shown = 0
            for _, entry in ipairs(optionButtons) do
                if entry.Button.Visible then
                    shown += 1
                    entry.Label.Position = UDim2.fromOffset(16, 0)
                    entry.Label.TextTransparency = 1
                    task.delay(math.min(shown, 8) * 0.025, function()
                        Tween(
                            entry.Label,
                            TweenInfo.new(Dur.smooth, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                            { Position = UDim2.fromOffset(8, 0), TextTransparency = 0 }
                        )
                    end)
                end
            end
        end
    end)
    box.MouseEnter:Connect(function()
        Tween(box, FAST, { BackgroundColor3 = Theme.Hover })
    end)
    box.MouseLeave:Connect(function()
        Tween(box, FAST, { BackgroundColor3 = Theme.Elevated })
    end)

    function api:Set(value, silent)
        if multi then
            api.Value = {}
            for _, v in ipairs(type(value) == "table" and value or {}) do
                if table.find(api.Options, v) then
                    api.Value[v] = true
                end
            end
        else
            api.Value = table.find(api.Options, value) and value or nil
        end
        commit(silent)
    end
    function api:Get()
        if multi then
            local list = {}
            for _, v in ipairs(api.Options) do
                if api.Value[v] then
                    table.insert(list, v)
                end
            end
            return list
        end
        return api.Value
    end
    function api:Refresh(newOptions, keepSelection)
        api.Options = table.clone(newOptions or {})
        if not keepSelection then
            api.Value = multi and {} or nil
        elseif multi then
            for v in pairs(api.Value) do
                if not table.find(api.Options, v) then
                    api.Value[v] = nil
                end
            end
        elseif not table.find(api.Options, api.Value) then
            api.Value = nil
        end
        buildItems()
        commit(true)
        if api.Open then
            layout()
        end
    end

    buildItems()
    commit(true)
    layout(true)
    registerFlag(options, api)
    return api
end

function Section:Keybind(options)
    options = options or {}
    local mode = options.Mode or "Press"
    local api = { Type = "Keybind", State = false }
    local row, title = self:_row(options, true)
    local cap, capStroke = createKeycap(row, UDim2.new(1, -8, 0.5, 0), Vector2.new(1, 0.5))
    title.Size = UDim2.new(1, -90 - title.Position.X.Offset + 8, 0, 18)
    title.TextColor3 = Theme.SubText

    local picker = attachKeyPicker(cap, capStroke, options.Default, function(key)
        setFlag(options, key and key.Name or "None")
        safeCall(options.ChangedCallback, key)
    end)
    row.Activated:Connect(function()
        picker:Listen()
    end)

    table.insert(Library._binds, {
        Name = options.Name or "Keybind",
        Hidden = options.HideFromList,
        Get = function()
            return picker.Key
        end,
        State = function()
            if mode == "Press" then
                return nil
            end
            return api.State
        end,
        Press = function()
            if mode == "Toggle" then
                api.State = not api.State
                safeCall(options.Callback, api.State)
            elseif mode == "Hold" then
                api.State = true
                safeCall(options.Callback, true)
            else
                safeCall(options.Callback)
            end
        end,
        Release = function()
            if mode == "Hold" then
                api.State = false
                safeCall(options.Callback, false)
            end
        end,
    })

    function api:Set(key, silent)
        picker:Set(key, silent)
        if silent then
            setFlag(options, key and key.Name or "None")
        end
    end
    function api:Get()
        return picker.Key
    end

    setFlag(options, picker.Key and picker.Key.Name or "None")
    registerFlag(options, api)
    return api
end

function Section:ColorPicker(options)
    options = options or {}
    local api = { Type = "ColorPicker", Value = options.Default or Color3.new(1, 1, 1), Open = false }
    local h, s, v = api.Value:ToHSV()

    local row, title, header = self:_row(options, true)
    row.ClipsDescendants = true
    title.Size = UDim2.new(1, -60 - title.Position.X.Offset + 8, 0, 18)
    local PANEL = 148

    local swatch = Create("Frame", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -8, 0, header / 2),
        Size = UDim2.fromOffset(26, 16),
        BackgroundColor3 = api.Value,
        Parent = row,
    }, { Corner(Radius.xs), Stroke(Theme.Stroke) })

    local panel = Create("TextButton", {
        Position = UDim2.fromOffset(8, header),
        Size = UDim2.new(1, -16, 0, PANEL - 8),
        BackgroundTransparency = 1,
        Text = "",
        AutoButtonColor = false,
        Parent = row,
    })

    local svBox = Create("TextButton", {
        Size = UDim2.new(1, -24, 0, 104),
        BackgroundColor3 = Color3.fromHSV(h, 1, 1),
        Text = "",
        AutoButtonColor = false,
        Parent = panel,
    }, { Corner(Radius.sm) })

    svBox:SetAttribute("NoTheme", true)
    swatch:SetAttribute("NoTheme", true)
    Create("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Parent = svBox,
    }, {
        Corner(Radius.sm),
        Create("UIGradient", {
            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) }),
        }),
    })
    Create("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(0, 0, 0),
        Parent = svBox,
    }, {
        Corner(Radius.sm),
        Create("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) }),
        }),
    })
    local svCursor = Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(10, 10),
        BackgroundTransparency = 1,
        ZIndex = 3,
        Parent = svBox,
    }, { Corner(Radius.sm), Create("UIStroke", { Color = Color3.new(1, 1, 1), Thickness = 2 }) })

    local hueBar = Create("TextButton", {
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(1, 0),
        Size = UDim2.fromOffset(12, 104),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Text = "",
        AutoButtonColor = false,
        Parent = panel,
    }, {
        Corner(Radius.xs),
        Create("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 1, 1)),
                ColorSequenceKeypoint.new(1 / 6, Color3.fromHSV(1 / 6, 1, 1)),
                ColorSequenceKeypoint.new(2 / 6, Color3.fromHSV(2 / 6, 1, 1)),
                ColorSequenceKeypoint.new(3 / 6, Color3.fromHSV(3 / 6, 1, 1)),
                ColorSequenceKeypoint.new(4 / 6, Color3.fromHSV(4 / 6, 1, 1)),
                ColorSequenceKeypoint.new(5 / 6, Color3.fromHSV(5 / 6, 1, 1)),
                ColorSequenceKeypoint.new(1, Color3.fromHSV(1, 1, 1)),
            }),
        }),
    })
    local hueCursor = Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, h),
        Size = UDim2.new(1, 4, 0, 4),
        BackgroundColor3 = Color3.new(1, 1, 1),
        ZIndex = 3,
        Parent = hueBar,
    }, { Corner(Radius.xs), Create("UIStroke", { Color = Theme.Background, Thickness = 1 }) })

    local hexBox = Create("TextBox", {
        Position = UDim2.fromOffset(0, 112),
        Size = UDim2.new(0.5, -4, 0, 24),
        BackgroundColor3 = Theme.Elevated,
        Text = "",
        FontFace = Fonts.Medium,
        TextSize = 14,
        TextColor3 = Theme.Text,
        ClearTextOnFocus = false,
        Parent = panel,
    }, { Corner(Radius.sm), Stroke(Theme.Stroke) })
    local rgbLabel = Label({
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, 0, 0, 112),
        Size = UDim2.new(0.5, -4, 0, 24),
        TextSize = 13,
        TextColor3 = Theme.Muted,
        TextXAlignment = Enum.TextXAlignment.Right,
        Parent = panel,
    })

    local function render()
        api.Value = Color3.fromHSV(h, s, v)
        swatch.BackgroundColor3 = api.Value
        svBox.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
        svCursor.Position = UDim2.fromScale(s, 1 - v)
        hueCursor.Position = UDim2.fromScale(0.5, h)
        if not hexBox:IsFocused() then
            hexBox.Text = "#" .. colorToHex(api.Value)
        end
        rgbLabel.Text =
            string.format("%d, %d, %d", api.Value.R * 255 + 0.5, api.Value.G * 255 + 0.5, api.Value.B * 255 + 0.5)
    end

    local function changed(silent)
        render()
        setFlag(options, api.Value)
        if not silent then
            safeCall(options.Callback, api.Value)
        end
    end

    function api:Set(color, silent)
        if typeof(color) == "string" then
            color = hexToColor(color)
        end
        if typeof(color) ~= "Color3" then
            return
        end
        h, s, v = color:ToHSV()
        changed(silent)
    end
    function api:Get()
        return api.Value
    end

    local mode, colorInput
    local function updateFrom(position)
        if mode == "sv" then
            local p, size = svBox.AbsolutePosition, svBox.AbsoluteSize
            s = math.clamp((position.X - p.X) / size.X, 0, 1)
            v = 1 - math.clamp((position.Y - p.Y) / size.Y, 0, 1)
        elseif mode == "hue" then
            local p, size = hueBar.AbsolutePosition, hueBar.AbsoluteSize
            h = math.clamp((position.Y - p.Y) / size.Y, 0, 0.999)
        end
        changed()
    end
    svBox.InputBegan:Connect(function(input)
        if claimPointer(input) then
            colorInput = input
            mode = "sv"
            updateFrom(input.Position)
        end
    end)
    hueBar.InputBegan:Connect(function(input)
        if claimPointer(input) then
            colorInput = input
            mode = "hue"
            updateFrom(input.Position)
        end
    end)
    Connect(UserInputService.InputChanged, function(input)
        if mode and movesPointer(colorInput, input) then
            updateFrom(input.Position)
        end
    end)
    Connect(UserInputService.InputEnded, function(input)
        if mode and endsPointer(colorInput, input) then
            mode = nil
        end
    end)

    hexBox.FocusLost:Connect(function()
        local color = hexToColor(hexBox.Text)
        if color then
            api:Set(color)
        else
            render()
        end
    end)

    panel.Visible = false
    local openToken = 0
    row.Activated:Connect(function()
        api.Open = not api.Open
        openToken += 1
        local token = openToken

        if api.Open then
            panel.Visible = true
            revealWhileGrowing(row)
        else
            task.delay(SMOOTH.Time, function()
                if token == openToken and not api.Open then
                    panel.Visible = false
                end
            end)
        end
        Tween(row, SMOOTH, { Size = UDim2.new(1, 0, 0, header + (api.Open and PANEL or 0)) })
        Tween(title, FAST, { TextColor3 = api.Open and Theme.Text or Theme.SubText })
    end)
    title.TextColor3 = Theme.SubText

    render()
    setFlag(options, api.Value)
    registerFlag(options, api)
    return api
end

function Section:Button(options)
    options = options or {}
    local holder = Create("Frame", {
        Name = options.Name or "Button",
        Size = UDim2.new(1, 0, 0, COMPACT and 28 or 34),
        BackgroundTransparency = 1,
        LayoutOrder = nextOrder(),
        Parent = self.Container,
    })
    local primary = options.Style == "Primary"
    local danger = options.Style == "Danger"
    local DANGER = Color3.fromRGB(242, 120, 120)

    local function baseColor()
        return primary and Theme.Accent or Theme.Elevated
    end
    local function hoverColor()
        return primary and Theme.AccentHover or Theme.Hover
    end
    local base, ink = baseColor(), primary and Theme.OnAccent or (danger and DANGER or Theme.Text)

    local button = Create("TextButton", {
        Position = UDim2.fromOffset(COMPACT and 6 or 8, 2),
        Size = UDim2.new(1, COMPACT and -12 or -16, 0, COMPACT and 24 or 30),
        BackgroundColor3 = base,
        Text = "",
        AutoButtonColor = false,
        ClipsDescendants = true,
        Parent = holder,
    }, { Corner(Radius.md) })
    local stroke = Stroke(primary and Theme.Accent or (danger and DANGER or Theme.Stroke), danger and 0.7 or 0)
    stroke.Parent = button
    if danger then
        stroke:SetAttribute("NoTheme", true)
    end
    local press = Create("UIScale", { Parent = button })

    local content = Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(0, 18),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        ZIndex = 2,
        Parent = button,
    }, {
        Create("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 7),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    })
    if options.Icon then
        Icon(options.Icon, {
            Size = UDim2.fromOffset(15, 15),
            ImageColor3 = ink,
            LayoutOrder = 1,
            ZIndex = 2,
            Parent = content,
        })
    end
    local text = Label({
        Text = options.Name or "Button",
        FontFace = Fonts.Medium,
        TextSize = 14,
        TextColor3 = ink,
        Size = UDim2.fromOffset(0, 18),
        AutomaticSize = Enum.AutomaticSize.X,
        TextTruncate = Enum.TextTruncate.None,
        LayoutOrder = 2,
        ZIndex = 2,
        Parent = content,
    })
    if danger then
        for _, d in ipairs(content:GetDescendants()) do
            d:SetAttribute("NoTheme", true)
        end
    end
    table.insert(self.Elements, { Name = options.Name or "", Frame = holder })
    Library:_attachTooltip(button, options.Tooltip)

    content.AnchorPoint = Vector2.zero
    local function centre()
        local s = Library.Window and Library.Window.Scale.Scale or 1
        local free = (button.AbsoluteSize.X - content.AbsoluteSize.X) / s
        content.Position = UDim2.fromOffset(math.floor(free / 2), 6)
    end
    content:GetPropertyChangedSignal("AbsoluteSize"):Connect(centre)
    button:GetPropertyChangedSignal("AbsoluteSize"):Connect(centre)
    task.defer(centre)

    local function ripple(x, y)
        local s = Library.Window and Library.Window.Scale.Scale or 1
        local localX = (x - button.AbsolutePosition.X) / s
        local localY = (y - button.AbsolutePosition.Y) / s
        local size = button.AbsoluteSize.X / s * 2.2
        local dot = Create("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromOffset(localX, localY),
            Size = UDim2.fromOffset(0, 0),
            BackgroundColor3 = primary and Theme.OnAccent or Theme.Accent,
            BackgroundTransparency = primary and 0.85 or 0.88,
            ZIndex = 1,
            Parent = button,
        }, { Create("UICorner", { CornerRadius = UDim.new(1, 0) }) })
        Tween(dot, TweenInfo.new(Dur.slowest, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Size = UDim2.fromOffset(size, size),
            BackgroundTransparency = 1,
        })
        task.delay(0.6, function()
            dot:Destroy()
        end)
    end

    local armed = false
    button.MouseEnter:Connect(function()
        Tween(button, FAST, { BackgroundColor3 = hoverColor() })
        if not primary and not armed then

            Tween(stroke, FAST, { Color = danger and DANGER or Theme.Accent, Transparency = danger and 0.35 or 0.55 })
        end
    end)
    button.MouseLeave:Connect(function()
        Tween(button, FAST, { BackgroundColor3 = baseColor() })
        Tween(press, FAST, { Scale = 1 })
        if not primary and not armed then
            Tween(stroke, FAST, { Color = danger and DANGER or Theme.Stroke, Transparency = danger and 0.7 or 0 })
        end
    end)
    button.MouseButton1Down:Connect(function(x, y)
        Tween(press, FAST, { Scale = 0.97 })
        ripple(x, y)
    end)
    button.MouseButton1Up:Connect(function()
        Tween(press, BOUNCE, { Scale = 1 })
    end)

    button.Activated:Connect(function()
        if options.Confirm and not armed then
            armed = true
            text.Text = options.ConfirmText or "Click again to confirm"
            Tween(stroke, FAST, { Color = danger and DANGER or Theme.SubText, Transparency = 0 })
            task.delay(2.5, function()
                if armed then
                    armed = false
                    text.Text = options.Name or "Button"
                    Tween(stroke, FAST, {
                        Color = primary and Theme.Accent or (danger and DANGER or Theme.Stroke),
                        Transparency = danger and 0.7 or 0,
                    })
                end
            end)
            return
        end
        armed = false
        text.Text = options.Name or "Button"
        safeCall(options.Callback)
    end)

    return {
        SetText = function(_, value)
            options.Name = value
            text.Text = value
        end,
    }
end

function Section:Input(options)
    options = options or {}
    local api = { Type = "Input", Value = options.Default or "" }
    local row, _, header = self:_row(options, false)
    local boxTop = header - 6
    row.Size = UDim2.new(1, 0, 0, boxTop + 38)

    local multiline = options.Multiline == true
    local boxHeight = multiline and (tonumber(options.Height) or 86) or 30
    if multiline then
        row.Size = UDim2.new(1, 0, 0, boxTop + boxHeight + 8)
    end
    local box = Create("TextBox", {
        Position = UDim2.fromOffset(8, boxTop),
        Size = UDim2.new(1, -16, 0, boxHeight),
        BackgroundColor3 = Theme.Elevated,
        Text = api.Value,
        PlaceholderText = options.Placeholder or "",
        PlaceholderColor3 = Theme.Muted,
        TextColor3 = Theme.Text,
        FontFace = Fonts.Regular,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = multiline and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center,
        TextWrapped = multiline,
        MultiLine = multiline,
        TextTruncate = multiline and Enum.TextTruncate.None or Enum.TextTruncate.AtEnd,
        ClearTextOnFocus = false,
        Parent = row,
    }, { Corner(Radius.md), Padding(multiline and 8 or 0, 10, multiline and 8 or 0, 10) })
    local stroke = Stroke(Theme.Stroke)
    stroke.Parent = box

    if options.Numeric then
        box:GetPropertyChangedSignal("Text"):Connect(function()
            local cleaned = box.Text:gsub("[^%d%.%-]", "")
            if cleaned ~= box.Text then
                box.Text = cleaned
            end
        end)
    end
    if options.MaxLength then
        box:GetPropertyChangedSignal("Text"):Connect(function()
            if #box.Text > options.MaxLength then
                box.Text = box.Text:sub(1, options.MaxLength)
            end
        end)
    end

    box.Focused:Connect(function()
        Tween(stroke, FAST, { Color = Theme.Muted })
    end)
    box.FocusLost:Connect(function(enterPressed)
        Tween(stroke, FAST, { Color = Theme.Stroke })
        if options.Finished and not enterPressed then
            box.Text = api.Value
            return
        end
        api:Set(box.Text)
    end)

    function api:Set(text, silent)
        text = tostring(text or "")
        local changed = text ~= api.Value
        api.Value = text
        box.Text = text
        setFlag(options, text)
        if changed and not silent then
            safeCall(options.Callback, text)
        end
    end
    function api:Get()
        return api.Value
    end

    setFlag(options, api.Value)
    registerFlag(options, api)
    return api
end

function Section:Paragraph(options)
    options = options or {}
    local holder = Create("Frame", {
        Name = options.Title or "Paragraph",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = nextOrder(),
        Parent = self.Container,
    }, { Padding(6, 8, 8, 8), List(4) })
    local title
    if options.Title then
        title = Label({
            Text = options.Title,
            FontFace = Fonts.Medium,
            TextSize = 15,
            Size = UDim2.new(1, 0, 0, 16),
            LayoutOrder = 1,
            Parent = holder,
        })
    end
    local body = Label({
        Text = options.Content or "",
        TextSize = 14,
        TextColor3 = Theme.SubText,
        TextWrapped = true,
        TextTruncate = Enum.TextTruncate.None,
        TextYAlignment = Enum.TextYAlignment.Top,
        RichText = true,
        LineHeight = 1,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = 2,
        Parent = holder,
    })
    table.insert(self.Elements, { Name = (options.Title or "") .. " " .. (options.Content or ""), Frame = holder })
    return {
        Set = function(_, content, newTitle)
            body.Text = content or body.Text
            if title and newTitle then
                title.Text = newTitle
            end
        end,
    }
end

function Section:Label(options)
    if type(options) == "string" then
        options = { Name = options }
    end
    local row, title = self:_row(options, false)
    title.TextColor3 = Theme.SubText
    local value
    if options.Value ~= nil then
        title.Size = UDim2.new(0.5, -8, 0, 18)
        value = Label({
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.new(1, -8, 0, 8),
            Size = UDim2.new(0.5, -8, 0, 18),
            Text = tostring(options.Value),
            FontFace = Fonts.Medium,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Right,
            Parent = row,
        })
    end
    return {
        Set = function(_, text)
            if value then
                value.Text = tostring(text)
            else
                title.Text = tostring(text)
            end
        end,
    }
end

function Section:Divider()
    local holder = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 9),
        BackgroundTransparency = 1,
        LayoutOrder = nextOrder(),
        Parent = self.Container,
    })
    Create("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 8, 0.5, 0),
        Size = UDim2.new(1, -16, 0, 1),
        BackgroundColor3 = Theme.StrokeSoft,
        BorderSizePixel = 0,
        Parent = holder,
    })
end

function Section:Checkbox(options)
    options = options or {}
    local api = { Type = "Toggle", Value = options.Default == true }
    local row, title = self:_row(options, true)
    title.Size = UDim2.new(1, -40 - title.Position.X.Offset + 8, 0, 18)

    local box = Create("Frame", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -8, 0.5, 0),
        Size = UDim2.fromOffset(COMPACT and 16 or 19, COMPACT and 16 or 19),
        BackgroundColor3 = Theme.Elevated,
        Parent = row,
    }, { Corner(COMPACT and 5 or 6) })
    local boxStroke = Stroke(Theme.Stroke)
    boxStroke.Parent = box
    local mark = Icon("check", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(13, 13),
        ImageColor3 = Theme.OnAccent,
        Parent = box,
    })
    local markScale = Create("UIScale", { Parent = mark })

    local function render(instant)
        local info = instant and TweenInfo.new(Dur.instant) or FAST
        Tween(box, info, { BackgroundColor3 = api.Value and Theme.Accent or Theme.Elevated })
        Tween(boxStroke, info, { Color = api.Value and Theme.Accent or Theme.Stroke })
        Tween(title, info, { TextColor3 = api.Value and Theme.Text or Theme.SubText })
        Tween(
            markScale,
            instant and TweenInfo.new(Dur.instant) or (api.Value and BOUNCE or FAST),
            { Scale = api.Value and 1 or 0 }
        )
    end

    function api:Set(value, silent)
        api.Value = value == true
        setFlag(options, api.Value)
        render()
        if not silent then
            safeCall(options.Callback, api.Value)
        end
    end
    function api:Get()
        return api.Value
    end
    row.Activated:Connect(function()
        api:Set(not api.Value)
    end)

    setFlag(options, api.Value)
    registerFlag(options, api)
    render(true)
    return api
end

function Section:Segmented(options)
    options = options or {}
    local choices = options.Options or {}
    local api = { Type = "Segmented", Value = options.Default or choices[1] }
    local row, _, header = self:_row(options, false)
    local top = header - 6
    row.Size = UDim2.new(1, 0, 0, top + 32 + 8)

    local track = Create("Frame", {
        Position = UDim2.fromOffset(8, top),
        Size = UDim2.new(1, -16, 0, 32),
        BackgroundColor3 = Theme.Elevated,
        Parent = row,
    }, { Corner(Radius.md), Stroke(Theme.Stroke) })
    local pill = Create("Frame", {
        Position = UDim2.fromOffset(3, 3),
        Size = UDim2.new(0, 0, 1, -6),
        BackgroundColor3 = Theme.Accent,
        Parent = track,
    }, { Corner(Radius.sm) })

    local segments = {}
    for index, choice in ipairs(choices) do
        local button = Create("TextButton", {
            Size = UDim2.new(0, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = tostring(choice),
            FontFace = Fonts.Medium,
            TextSize = 14,
            TextColor3 = Theme.SubText,
            AutoButtonColor = false,
            ZIndex = 2,
            Parent = track,
        })
        segments[index] = { Button = button, Value = choice }
        button.Activated:Connect(function()
            api:Set(choice)
        end)
        button.MouseEnter:Connect(function()
            if api.Value ~= choice then
                Tween(button, FAST, { TextColor3 = Theme.Text })
            end
        end)
        button.MouseLeave:Connect(function()
            if api.Value ~= choice then
                Tween(button, FAST, { TextColor3 = Theme.SubText })
            end
        end)
    end

    local geometry = {}
    local function measure()
        local s = Library.Window and Library.Window.Scale.Scale or 1
        local width = math.floor(track.AbsoluteSize.X / s + 0.5) - 6
        local count = math.max(#segments, 1)
        local base = math.floor(width / count)
        local x = 3
        for index, segment in ipairs(segments) do
            local w = index == count and (width + 3 - x) or base
            segment.Button.Position = UDim2.fromOffset(x, 0)
            segment.Button.Size = UDim2.new(0, w, 1, 0)
            geometry[index] = { X = x, W = w }
            x += w
        end
    end

    local function render(instant)
        local index = table.find(choices, api.Value)
        local g = index and geometry[index]
        if g then
            local goal = { Position = UDim2.fromOffset(g.X, 3), Size = UDim2.new(0, g.W, 1, -6) }
            Tween(
                pill,
                instant and TweenInfo.new(Dur.instant) or TweenInfo.new(Dur.smooth, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                goal
            )
        end
        pill.Visible = g ~= nil
        for i, segment in ipairs(segments) do
            Tween(
                segment.Button,
                instant and TweenInfo.new(Dur.instant) or FAST,
                { TextColor3 = i == index and Theme.OnAccent or Theme.SubText }
            )
        end
    end

    track:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        measure()
        render(true)
    end)

    function api:Set(value, silent)
        if not table.find(choices, value) then
            return
        end
        local changed = value ~= api.Value
        api.Value = value
        setFlag(options, value)
        render()
        if changed and not silent then
            safeCall(options.Callback, value)
        end
    end
    function api:Get()
        return api.Value
    end

    measure()
    render(true)
    setFlag(options, api.Value)
    registerFlag(options, api)
    return api
end

function Section:Stepper(options)
    options = options or {}
    local min, max, step = options.Min or 0, options.Max or 100, options.Increment or 1
    local api = { Type = "Slider", Value = math.clamp(options.Default or min, min, max) }
    local row, title = self:_row(options, false)
    title.Size = UDim2.new(1, -120 - title.Position.X.Offset + 8, 0, 18)

    local group = Create("Frame", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -8, 0, 17),
        Size = UDim2.fromOffset(104, 26),
        BackgroundColor3 = Theme.Elevated,
        Parent = row,
    }, { Corner(Radius.md), Stroke(Theme.Stroke) })
    local valueLabel = Label({
        Position = UDim2.fromOffset(26, 0),
        Size = UDim2.fromOffset(52, 26),
        FontFace = Fonts.Medium,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = group,
    })
    local valueScale = Create("UIScale", { Parent = valueLabel })

    local function button(icon, x)
        local b = Create("TextButton", {
            Position = UDim2.fromOffset(x, 0),
            Size = UDim2.fromOffset(26, 26),
            BackgroundColor3 = Theme.Hover,
            BackgroundTransparency = 1,
            Text = "",
            AutoButtonColor = false,
            Parent = group,
        }, { Corner(Radius.md) })
        local glyph = Icon(icon, {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(13, 13),
            ImageColor3 = Theme.SubText,
            Parent = b,
        })
        b.MouseEnter:Connect(function()
            Tween(b, FAST, { BackgroundTransparency = 0 })
            Tween(glyph, FAST, { ImageColor3 = Theme.Text })
        end)
        b.MouseLeave:Connect(function()
            Tween(b, FAST, { BackgroundTransparency = 1 })
            Tween(glyph, FAST, { ImageColor3 = Theme.SubText })
        end)
        return b
    end
    local minus = button("minus", 0)
    local plus = button("plus", 78)

    local function render()
        valueLabel.Text = formatNumber(api.Value, step) .. (options.Suffix or "")
    end

    function api:Set(value, silent)
        value = tonumber(value)
        if not value then
            return
        end
        value = tonumber(formatNumber(math.clamp(round(value, step), min, max), step))
        local changed = value ~= api.Value
        api.Value = value
        setFlag(options, value)
        render()
        if changed then
            valueScale.Scale = 1.18
            Tween(valueScale, BOUNCE, { Scale = 1 })
            if not silent then
                safeCall(options.Callback, value)
            end
        end
    end
    function api:Get()
        return api.Value
    end

    local function hold(b, direction)
        local holding = false
        b.MouseButton1Down:Connect(function()
            holding = true
            api:Set(api.Value + step * direction)
            task.delay(0.4, function()
                local interval = 0.09
                while holding and b.Parent do
                    api:Set(api.Value + step * direction)
                    task.wait(interval)
                    interval = math.max(interval * 0.9, 0.03)
                end
            end)
        end)
        local function release()
            holding = false
        end
        b.MouseButton1Up:Connect(release)
        b.MouseLeave:Connect(release)
    end
    hold(minus, -1)
    hold(plus, 1)

    render()
    setFlag(options, api.Value)
    registerFlag(options, api)
    return api
end

function Section:Progress(options)
    options = options or {}
    local max = options.Max or 100
    local api = { Value = options.Default or 0 }
    local row, title, header = self:_row(options, false)
    row.Size = UDim2.new(1, 0, 0, header + 12)
    title.Size = UDim2.new(1, -70 - title.Position.X.Offset + 8, 0, 18)
    local valueLabel = Label({
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -8, 0, 8),
        Size = UDim2.fromOffset(60, 18),
        FontFace = Fonts.Medium,
        TextSize = 14,
        TextColor3 = Theme.SubText,
        TextXAlignment = Enum.TextXAlignment.Right,
        Parent = row,
    })
    local bar = Create("Frame", {
        Position = UDim2.new(0, 8, 0, header - 3),
        Size = UDim2.new(1, -16, 0, 6),
        BackgroundColor3 = Theme.Elevated,
        BorderSizePixel = 0,
        Parent = row,
    }, { Corner(Radius.xs) })
    local fill = Create("Frame", {
        Size = UDim2.fromScale(0, 1),
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel = 0,
        Parent = bar,
    }, { Corner(Radius.xs) })

    function api:Set(value)
        api.Value = math.clamp(tonumber(value) or 0, 0, max)
        local alpha = max > 0 and api.Value / max or 0
        Tween(
            fill,
            TweenInfo.new(Dur.slow, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            { Size = UDim2.fromScale(alpha, 1) }
        )
        valueLabel.Text = type(options.Format) == "function" and tostring(options.Format(api.Value, max))
            or string.format("%d%%", alpha * 100 + 0.5)
    end
    function api:Get()
        return api.Value
    end
    api:Set(api.Value)
    return api
end

function Section:Collapsible(options)
    options = options or {}
    local row, title = self:_row(options, true)
    title.Size = UDim2.new(1, -36 - title.Position.X.Offset + 8, 0, 18)
    title.TextColor3 = Theme.SubText
    local chevron = Icon("chevron-right", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -10, 0.5, 0),
        Size = UDim2.fromOffset(14, 14),
        ImageColor3 = Theme.Muted,
        Parent = row,
    })
    local sub, setOpen, isOpen = createNested(self, row)
    local function apply(value, instant)
        setOpen(value, instant)
        Tween(chevron, instant and TweenInfo.new(Dur.instant) or SMOOTH, {
            Rotation = value and 90 or 0,
            ImageColor3 = value and Theme.Text or Theme.Muted,
        })
        Tween(title, FAST, { TextColor3 = value and Theme.Text or Theme.SubText })
    end
    row.Activated:Connect(function()
        apply(not isOpen())
    end)
    task.defer(apply, options.Open ~= false, true)
    return sub
end

Connect(UserInputService.InputBegan, function(input)
    local open = Library._openDropdown
    if not open or not isPointer(input) then
        return
    end
    local p, row = input.Position, open._row
    local a, s = row.AbsolutePosition, row.AbsoluteSize
    if p.X < a.X or p.X > a.X + s.X or p.Y < a.Y or p.Y > a.Y + s.Y then
        open:Close()
    end
end)

Connect(UserInputService.InputBegan, function(input, gameProcessed)
    if Library._listening then
        return
    end
    if UserInputService:GetFocusedTextBox() then
        return
    end
    if inputMatches(input, Library.ToggleKey) and Library.Window then
        Library:Toggle()
        return
    end
    if gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard then
        return
    end
    for _, bind in ipairs(Library._binds) do
        if inputMatches(input, bind.Get()) then
            bind.Press()
        end
    end
end)

Connect(UserInputService.InputEnded, function(input)
    if Library._listening then
        return
    end
    for _, bind in ipairs(Library._binds) do
        if bind.Release and inputMatches(input, bind.Get()) then
            bind.Release()
        end
    end
end)

do
    local aliased = {
        "Toggle", "Slider", "Dropdown", "Input", "ColorPicker", "Label",
        "Keybind", "Button", "Segmented", "Stepper", "Progress", "Checkbox", "Paragraph",
    }
    for _, name in ipairs(aliased) do
        local original = Section[name]
        if type(original) == "function" then
            Section[name] = function(self, options)
                if type(options) == "string" then
                    options = { Name = options }
                end
                if type(options) == "table" then
                    options = table.clone(options)
                else
                    options = {}
                end
                if options.Name == nil then
                    options.Name = options.Text or options.Title
                end
                if options.Description == nil then
                    options.Description = options.Tooltip
                end
                if name == "Slider" and options.Increment == nil and options.Rounding ~= nil then
                    options.Increment = options.Rounding
                end
                local api = original(self, options)
                if type(api) == "table" then
                    if type(api.Set) == "function" and api.SetValue == nil then
                        api.SetValue = function(a, value, silent)
                            return a:Set(value, silent)
                        end
                    end
                    if type(api.Get) == "function" and api.GetValue == nil then
                        api.GetValue = function(a)
                            return a:Get()
                        end
                    end
                    if type(api.Refresh) == "function" and api.SetValues == nil then
                        api.SetValues = function(a, list, keep)
                            return a:Refresh(list, keep ~= false)
                        end
                    end
                    if api.Display == nil then
                        api.Display = function() end
                    end
                end
                return api
            end
        end
    end
end

function Section:DependencyBox(options)
    local sub, setOpen = createNested(self, nil)
    local outer = sub.Container and sub.Container.Parent
    if not outer then
        return sub
    end
    setOpen(true, true)
    sub.IsDependencyBox = true

    local dependencies = {}
    local function evaluate()
        local show = true
        for _, pair in ipairs(dependencies) do
            local element, wanted = pair[1], pair[2]
            if type(element) == "table" then
                local have = element.Value
                if wanted == nil then
                    show = have ~= nil and have ~= false
                elseif type(wanted) == "table" then
                    if type(have) == "table" then
                        local hit = false
                        for _, value in ipairs(wanted) do
                            if have[value] then
                                hit = true
                                break
                            end
                        end
                        show = hit
                    else
                        show = false
                    end
                else
                    show = have == wanted
                end
                if not show then
                    break
                end
            end
        end
        if outer.Parent and outer.Visible ~= show then
            outer.Visible = show
        end
    end

    function sub:SetupDependencies(list)
        dependencies = list or {}
        evaluate()
        return self
    end

    task.spawn(function()
        while outer.Parent do
            if #dependencies > 0 then
                evaluate()
            end
            task.wait(0.12)
        end
    end)

    return sub
end

function Section:Tabbox(options)
    options = options or {}
    local box = { Tabs = {}, Active = nil }

    local bar = Create("Frame", {
        Name = "TabboxBar",
        Size = UDim2.new(1, 0, 0, COMPACT and 28 or 30),
        BackgroundColor3 = Theme.Elevated,
        LayoutOrder = nextOrder(),
        Parent = self.Container,
    }, { Corner(Radius.md), Stroke(Theme.Stroke) })
    List(4, Enum.FillDirection.Horizontal).Parent = bar

    local body = Create("Frame", {
        Name = "TabboxBody",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = nextOrder(),
        Parent = self.Container,
    })

    local function selectTab(name)
        box.Active = name
        for _, entry in ipairs(box.Tabs) do
            local page = entry.Page
            if page then
                page.Visible = (entry.Name == name)
            end
            local on = entry.Name == name
            Tween(entry.Button, FAST, {
                BackgroundTransparency = on and 0 or 1,
                TextColor3 = on and Theme.OnAccent or Theme.Muted,
            })
        end
    end

    function box:Select(name)
        selectTab(name)
        return self
    end

    local hostSection = self
    function box:AddTab(label)
        label = tostring(label or ("tab" .. (#box.Tabs + 1)))
        local page = Create("Frame", {
            Name = label,
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            Visible = false,
            Parent = body,
        })
        Flow(page, 1)

        local button = Create("TextButton", {
            Name = label,
            Size = UDim2.new(0, 0, 0, COMPACT and 22 or 24),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Theme.Accent,
            BackgroundTransparency = 1,
            Text = label,
            FontFace = Fonts.Medium,
            TextSize = 13,
            TextColor3 = Theme.Muted,
            AutoButtonColor = false,
            Parent = bar,
        }, { Corner(Radius.sm), Padding(0, 10, 0, 10) })
        button.Activated:Connect(function()
            selectTab(label)
        end)

        local section = setmetatable({
            Name = label,
            Elements = hostSection.Elements or {},
            Tab = self.Tab,
            Frame = self.Frame,
            Container = page,
        }, Section)

        table.insert(box.Tabs, { Name = label, Button = button, Page = page, Section = section })
        if box.Active == nil then
            selectTab(label)
        end
        return section
    end

    return box
end

local Tone = {
    info = Color3.fromRGB(138, 176, 255),
    success = Color3.fromRGB(126, 214, 160),
    warn = Color3.fromRGB(240, 196, 112),
    danger = Color3.fromRGB(242, 120, 120),
}

local function toneOf(name)
    return Tone[tostring(name or "info"):lower()] or Tone.info
end

local function copyText(text)
    local fn = envFunction("setclipboard") or envFunction("toclipboard")
    if not fn then
        return false
    end
    local ok = pcall(fn, tostring(text))
    return ok
end

local function accentBar(parent, tone)
    return Create("Frame", {
        Name = "Accent",
        Size = UDim2.new(0, 2, 1, -16),
        Position = UDim2.fromOffset(0, 8),
        BackgroundColor3 = tone,
        BorderSizePixel = 0,
        Parent = parent,
    }, { Corner(1) })
end

function Section:Stat(options)
    options = options or {}
    local tiles = options.Tiles or {}
    local cols = math.clamp(options.Columns or math.min(#tiles, 2), 1, 4)
    local gap = Space.row

    local holder = Create("Frame", {
        Name = options.Name or "Stat",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = nextOrder(),
        Parent = self.Container,
    }, { Padding(0, 8, 0, 8) })

    Create("UIGridLayout", {
        CellSize = UDim2.new(1 / cols, -gap * (cols - 1) / cols, 0, 64),
        CellPadding = UDim2.fromOffset(gap, gap),
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = holder,
    })

    local slots = {}
    local api = { Type = "Stat", Tiles = tiles }

    local function build(spec, index)
        local tile = Create("Frame", {
            Name = spec.Label or ("Tile" .. tostring(index)),
            BackgroundColor3 = Theme.Elevated,
            LayoutOrder = index,
            Parent = holder,
        }, { Corner(Radius.md), Stroke(Theme.StrokeSoft, 0.35) })

        if spec.Tone then
            accentBar(tile, toneOf(spec.Tone))
        end

        Label({
            Text = string.upper(tostring(spec.Label or "")),
            TextSize = 11,
            TextColor3 = Theme.Muted,
            FontFace = Fonts.Medium,
            Position = UDim2.fromOffset(12, 8),
            Size = UDim2.new(1, -20, 0, 13),
            Parent = tile,
        })
        local value = Label({
            Text = tostring(spec.Value or "-"),
            TextSize = 21,
            FontFace = Fonts.Medium,
            Position = UDim2.fromOffset(12, 22),
            Size = UDim2.new(1, -20, 0, 26),
            Parent = tile,
        })
        local hint = nil
        if spec.Hint then
            hint = Label({
                Text = tostring(spec.Hint),
                TextSize = 11,
                TextColor3 = Theme.Muted,
                Position = UDim2.fromOffset(12, 47),
                Size = UDim2.new(1, -20, 0, 13),
                Parent = tile,
            })
        end
        slots[index] = { value = value, hint = hint }
        return tile
    end

    for index, spec in ipairs(tiles) do
        build(spec, index)
    end

    function api:Set(index, value, hint)
        local slot = slots[index]
        if not slot then
            return
        end
        slot.value.Text = tostring(value)
        if hint ~= nil and slot.hint then
            slot.hint.Text = tostring(hint)
        end
    end

    function api:SetAll(values)
        for index, value in pairs(values) do
            self:Set(index, value)
        end
    end

    table.insert(self.Elements, { Name = options.Name or "Stat", Frame = holder })
    return api
end

function Section:Banner(options)
    options = options or {}
    local tone = toneOf(options.Tone or options.Severity or "info")
    local dismissible = options.Dismissible == true

    local holder = Create("Frame", {
        Name = options.Name or "Banner",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Theme.Elevated,
        LayoutOrder = nextOrder(),
        Parent = self.Container,
    }, { Corner(Radius.md), Stroke(tone, 0.5) })

    local bar = accentBar(holder, tone)

    local inner = Create("Frame", {
        Name = "Inner",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Parent = holder,
    }, { Padding(10, 34, 10, 14), List(3) })

    local title = nil
    if options.Title then
        title = Label({
            Text = tostring(options.Title),
            TextSize = 14,
            FontFace = Fonts.Medium,
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0, 17),
            Parent = inner,
        })
    end

    local body = Label({
        Text = tostring(options.Body or ""),
        TextSize = 13,
        TextColor3 = Theme.SubText,
        TextWrapped = true,
        TextTruncate = Enum.TextTruncate.None,
        TextYAlignment = Enum.TextYAlignment.Top,
        LineHeight = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        Size = UDim2.new(1, 0, 0, 0),
        LayoutOrder = 2,
        Parent = inner,
    })

    local actionApi = nil
    if type(options.Action) == "table" then
        local action = Create("TextButton", {
            Name = "Action",
            Text = "",
            AutoButtonColor = false,
            BackgroundColor3 = Theme.Surface,
            Size = UDim2.new(1, 0, 0, 26),
            LayoutOrder = 3,
            Parent = inner,
        }, { Corner(Radius.sm), Stroke(Theme.Stroke, 0.4) })
        Label({
            Text = tostring(options.Action.Text or "Open"),
            TextSize = 12,
            FontFace = Fonts.Medium,
            TextXAlignment = Enum.TextXAlignment.Center,
            Size = UDim2.fromScale(1, 1),
            Parent = action,
        })
        action.MouseEnter:Connect(function()
            Tween(action, FAST, { BackgroundColor3 = Theme.Hover })
        end)
        action.MouseLeave:Connect(function()
            Tween(action, FAST, { BackgroundColor3 = Theme.Surface })
        end)
        action.MouseButton1Click:Connect(function()
            if options.Action.Callback then
                safeCall(options.Action.Callback)
            end
        end)
        actionApi = action
    end

    local closeButton = nil
    if dismissible then
        closeButton = Create("TextButton", {
            Name = "Dismiss",
            Text = "",
            AutoButtonColor = false,
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.new(1, -8, 0, 8),
            Size = UDim2.fromOffset(18, 18),
            Parent = holder,
        })
        Icon("x", {
            ImageColor3 = Theme.Muted,
            Size = UDim2.fromScale(1, 1),
            Parent = closeButton,
        })
        closeButton.MouseEnter:Connect(function()
            closeButton.ImageColor3 = Theme.Text
        end)
        closeButton.MouseButton1Click:Connect(function()
            holder.Visible = false
        end)
    end

    local api = { Type = "Banner" }

    function api:Set(bodyText, titleText)
        body.Text = tostring(bodyText or "")
        if title and titleText ~= nil then
            title.Text = tostring(titleText)
        end
    end

    function api:SetTone(name)
        local color = toneOf(name)
        bar.BackgroundColor3 = color
        local stroke = holder:FindFirstChildOfClass("UIStroke")
        if stroke then
            stroke.Color = color
        end
    end

    function api:Show()
        holder.Visible = true
    end

    function api:Hide()
        holder.Visible = false
    end

    table.insert(self.Elements, { Name = options.Name or "Banner", Frame = holder })
    return api
end

function Section:KeyValue(options)
    options = options or {}

    local holder = Create("Frame", {
        Name = options.Name or "KeyValue",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = nextOrder(),
        Parent = self.Container,
    }, { Padding(2, 8, 2, 8), List(0) })

    local order = 0
    local rows = {}
    local api = { Type = "KeyValue" }

    local function build(spec)
        order = order + 1
        local row = Create("Frame", {
            Name = tostring(spec.Key or ("Row" .. tostring(order))),
            Size = UDim2.new(1, 0, 0, 24),
            BackgroundTransparency = 1,
            LayoutOrder = order,
            Parent = holder,
        })

        Label({
            Text = tostring(spec.Key or ""),
            TextSize = 13,
            TextColor3 = Theme.Muted,
            Position = UDim2.fromOffset(0, 0),
            Size = UDim2.new(0.5, -4, 1, 0),
            Parent = row,
        })

        local valueWidth = spec.Copy and UDim2.new(0.5, -30, 1, 0) or UDim2.new(0.5, -4, 1, 0)
        local value = Label({
            Text = tostring(spec.Value or ""),
            TextSize = 13,
            FontFace = Fonts.Medium,
            TextXAlignment = Enum.TextXAlignment.Right,
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.new(0.5, 4, 0, 0),
            Size = valueWidth,
            Parent = row,
        })

        if spec.Copy then
            local copy = Create("TextButton", {
                Name = "Copy",
                Text = "",
                AutoButtonColor = false,
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, 0, 0.5, 0),
                Size = UDim2.fromOffset(16, 16),
                Parent = row,
            })
            Icon("copy", {
                ImageColor3 = Theme.Muted,
                Size = UDim2.fromScale(1, 1),
                Parent = copy,
            })
            copy.MouseEnter:Connect(function()
                copy.ImageColor3 = Theme.Text
            end)
            copy.MouseLeave:Connect(function()
                copy.ImageColor3 = Theme.Muted
            end)
            copy.MouseButton1Click:Connect(function()
                if copyText(value.Text) then
                    copy.ImageColor3 = toneOf("success")
                    task.delay(Dur.slow, function()
                        if copy.Parent then
                            copy.ImageColor3 = Theme.Muted
                        end
                    end)
                end
            end)
        end

        rows[tostring(spec.Key or "")] = value
        return row
    end

    for _, spec in ipairs(options.Rows or {}) do
        build(spec)
    end

    function api:Set(key, value)
        local label = rows[tostring(key)]
        if label then
            label.Text = tostring(value)
        end
    end

    function api:Add(key, value, copy)
        build({ Key = key, Value = value, Copy = copy == true })
    end

    table.insert(self.Elements, { Name = options.Name or "KeyValue", Frame = holder })
    return api
end

function Section:Table(options)
    options = options or {}
    local columns = options.Columns or {}

    local holder = Create("Frame", {
        Name = options.Name or "Table",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = nextOrder(),
        Parent = self.Container,
    }, { Padding(0, 8, 4, 8), List(0) })

    local total = 0
    for _, column in ipairs(columns) do
        total = total + (tonumber(column.Width) or 1)
    end
    if total <= 0 then
        total = 1
    end

    local function columnOffsets()
        local offsets = {}
        local cursor = 0
        for index, column in ipairs(columns) do
            local weight = (tonumber(column.Width) or 1) / total
            offsets[index] = { x = cursor, w = weight }
            cursor = cursor + weight
        end
        return offsets
    end
    local offsets = columnOffsets()

    local header = Create("Frame", {
        Name = "Header",
        Size = UDim2.new(1, 0, 0, 22),
        BackgroundTransparency = 1,
        LayoutOrder = 0,
        Parent = holder,
    })
    for index, column in ipairs(columns) do
        local slot = offsets[index]
        Label({
            Text = string.upper(tostring(column.Label or column.Key or "")),
            TextSize = 10,
            TextColor3 = Theme.Muted,
            FontFace = Fonts.Medium,
            TextXAlignment = column.Align == "right" and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left,
            Position = UDim2.new(slot.x, 0, 0, 0),
            Size = UDim2.new(slot.w, -6, 1, 0),
            Parent = header,
        })
    end

    local scroller = Create("ScrollingFrame", {
        Name = "Rows",
        Size = UDim2.new(1, 0, 0, options.MaxHeight or 0),
        AutomaticSize = options.MaxHeight and Enum.AutomaticSize.None or Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Theme.Stroke,
        LayoutOrder = 1,
        Parent = holder,
    }, { List(0) })

    local api = { Type = "Table" }
    local rowOrder = 0

    local function buildRow(spec)
        rowOrder = rowOrder + 1
        local row = Create("Frame", {
            Name = "Row" .. tostring(rowOrder),
            Size = UDim2.new(1, 0, 0, 26),
            BackgroundColor3 = Theme.Elevated,
            BackgroundTransparency = rowOrder % 2 == 0 and 0.55 or 1,
            LayoutOrder = rowOrder,
            Parent = scroller,
        }, { Corner(Radius.xs) })

        for index, column in ipairs(columns) do
            local slot = offsets[index]
            Label({
                Text = tostring(spec[column.Key] or ""),
                TextSize = 13,
                TextColor3 = index == 1 and Theme.SubText or Theme.Text,
                TextXAlignment = column.Align == "right" and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left,
                Position = UDim2.new(slot.x, index == 1 and 8 or 0, 0, 0),
                Size = UDim2.new(slot.w, -6, 1, 0),
                Parent = row,
            })
        end
        return row
    end

    for _, spec in ipairs(options.Rows or {}) do
        buildRow(spec)
    end

    function api:SetRows(list)
        for _, child in ipairs(scroller:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end
        rowOrder = 0
        for _, spec in ipairs(list or {}) do
            buildRow(spec)
        end
    end

    function api:AddRow(spec)
        buildRow(spec)
    end

    function api:Clear()
        self:SetRows({})
    end

    table.insert(self.Elements, { Name = options.Name or "Table", Frame = holder })
    return api
end

function Section:ChipRow(options)
    options = options or {}

    local holder = Create("Frame", {
        Name = options.Name or "ChipRow",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = nextOrder(),
        Parent = self.Container,
    }, { Padding(2, 8, 2, 8) })

    Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 6),
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = holder,
    })

    local order = 0
    local api = { Type = "ChipRow" }

    local function build(spec)
        order = order + 1
        local tone = spec.Tone and toneOf(spec.Tone) or Theme.Muted
        local chip = Create("TextButton", {
            Name = tostring(spec.Text or ("Chip" .. tostring(order))),
            Text = "",
            AutoButtonColor = false,
            BackgroundColor3 = Theme.Elevated,
            AutomaticSize = Enum.AutomaticSize.X,
            Size = UDim2.new(0, 0, 0, 24),
            LayoutOrder = order,
            Parent = holder,
        }, { Corner(Radius.pill), Stroke(tone, 0.55), Padding(0, 9, 0, 9) })

        Create("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0, 5),
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = chip,
        })

        if spec.Icon then
            Icon(spec.Icon, {
                LayoutOrder = 1,
                Size = UDim2.fromOffset(12, 12),
                ImageColor3 = tone,
                Parent = chip,
            })
        end

        local text = Label({
            Text = tostring(spec.Text or ""),
            TextSize = 12,
            FontFace = Fonts.Medium,
            TextColor3 = Theme.SubText,
            AutomaticSize = Enum.AutomaticSize.X,
            Size = UDim2.new(0, 0, 1, 0),
            LayoutOrder = 2,
            Parent = chip,
        })

        chip.MouseEnter:Connect(function()
            Tween(chip, FAST, { BackgroundColor3 = Theme.Hover })
        end)
        chip.MouseLeave:Connect(function()
            Tween(chip, FAST, { BackgroundColor3 = Theme.Elevated })
        end)
        if spec.Copy then
            chip.MouseButton1Click:Connect(function()
                copyText(spec.Text)
            end)
        end

        return chip, text
    end

    for _, spec in ipairs(options.Chips or {}) do
        build(spec)
    end

    function api:SetChips(list)
        for _, child in ipairs(holder:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        order = 0
        for _, spec in ipairs(list or {}) do
            build(spec)
        end
    end

    function api:AddChip(spec)
        build(spec)
    end

    table.insert(self.Elements, { Name = options.Name or "ChipRow", Frame = holder })
    return api
end

function Library:Create(className, props, children)
    props = props or {}
    local instance = Create(className, props, children)
    instance.Parent = ScreenGui
    return instance
end

function Library:AddToRegistry(instance)
    return instance
end

do
    local panel = Create("Frame", {
        Name = "KeybindList",
        Active = true,

        Position = UDim2.fromOffset(16, game:GetService("GuiService"):GetGuiInset().Y + 16),
        Size = UDim2.fromOffset(200, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Theme.Surface,
        Visible = false,
        ZIndex = 20,
        Parent = ScreenGui,
    }, { Corner(Radius.lg), Stroke(Theme.Stroke), Padding(12, 14, 12, 14), List(7) })

    local header = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 16),
        BackgroundTransparency = 1,
        LayoutOrder = 0,
        ZIndex = 20,
        Parent = panel,
    })
    Icon("keyboard", {
        Size = UDim2.fromOffset(14, 14),
        Position = UDim2.fromOffset(0, 1),
        ImageColor3 = Theme.SubText,
        ZIndex = 21,
        Parent = header,
    })
    Label({
        Text = "Keybinds",
        FontFace = Fonts.SemiBold,
        TextSize = 14,
        Position = UDim2.fromOffset(22, 0),
        Size = UDim2.new(1, -22, 1, 0),
        ZIndex = 21,
        Parent = header,
    })
    local empty = Label({
        Text = "No keys bound",
        TextSize = 13,
        TextColor3 = Theme.Muted,
        Size = UDim2.new(1, 0, 0, 14),
        LayoutOrder = 1,
        ZIndex = 21,
        Parent = panel,
    })

    local rows = {}
    local function rowFor(bind)
        if rows[bind] then
            return rows[bind]
        end
        local frame = Create("Frame", {
            Size = UDim2.new(1, 0, 0, 16),
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            ZIndex = 20,
            Parent = panel,
        })
        local name = Label({
            Text = bind.Name,
            TextSize = 14,
            Size = UDim2.new(1, -60, 1, 0),
            ZIndex = 21,
            Parent = frame,
        })
        local key = Label({
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(1, 0),
            Size = UDim2.new(0, 56, 1, 0),
            FontFace = Fonts.Medium,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Right,
            ZIndex = 21,
            Parent = frame,
        })
        rows[bind] = { Frame = frame, Name = name, Key = key }
        return rows[bind]
    end

    local dragStart, origin, panelInput
    panel.InputBegan:Connect(function(input)
        if claimPointer(input) then
            panelInput = input
            dragStart, origin = input.Position, panel.Position
        end
    end)
    Connect(UserInputService.InputChanged, function(input)
        if dragStart and movesPointer(panelInput, input) then
            local delta = input.Position - dragStart
            local vp, size = ScreenGui.AbsoluteSize, panel.AbsoluteSize
            panel.Position = UDim2.fromOffset(
                math.clamp(origin.X.Offset + delta.X, 0, math.max(0, vp.X - size.X)),
                math.clamp(origin.Y.Offset + delta.Y, 0, math.max(0, vp.Y - math.min(size.Y, 32)))
            )
        end
    end)
    Connect(UserInputService.InputEnded, function(input)
        if dragStart and endsPointer(panelInput, input) then
            dragStart = nil
        end
    end)

    Connect(ScreenGui:GetPropertyChangedSignal("AbsoluteSize"), function()
        local vp, size = ScreenGui.AbsoluteSize, panel.AbsoluteSize
        panel.Position = UDim2.fromOffset(
            math.clamp(panel.Position.X.Offset, 0, math.max(0, vp.X - size.X)),
            math.clamp(panel.Position.Y.Offset, 0, math.max(0, vp.Y - math.min(size.Y, 32)))
        )
        endsPointer(panelInput, panelInput)
        dragStart = nil
    end)
    local accumulator = 0
    Connect(RunService.Heartbeat, function(dt)
        accumulator += dt
        if not panel.Visible or accumulator < 0.1 then
            return
        end
        accumulator = 0
        local shown = 0
        for _, bind in ipairs(Library._binds) do
            local key = bind.Get()
            local row = rowFor(bind)
            local visible = key ~= nil and not bind.Hidden
            row.Frame.Visible = visible
            if visible then
                shown += 1
                local state = bind.State and bind.State()
                row.Key.Text = "[" .. keyName(key) .. "]"
                row.Name.TextColor3 = (state == false) and Theme.Muted or Theme.Text
                row.Key.TextColor3 = (state == false) and Theme.Muted or Theme.SubText
            end
        end
        empty.Visible = shown == 0
    end)

    function Library:SetKeybindListVisible(visible)
        panel.Visible = visible
    end
end

do
    local mark = Create("Frame", {
        Name = "Watermark",
        Size = UDim2.fromOffset(0, 30),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Theme.Surface,
        Visible = false,
        ZIndex = 20,
        Parent = ScreenGui,
    }, {
        Corner(Radius.md),
        Stroke(Theme.Stroke),
        Padding(0, 10, 0, 5),
        Create("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    })
    local logo = Create("Frame", {
        Size = UDim2.fromOffset(20, 20),
        BackgroundColor3 = Theme.Accent,
        LayoutOrder = 1,
        ZIndex = 21,
        Parent = mark,
    }, { Corner(Radius.sm) })
    Label({
        Text = "N",
        FontFace = Fonts.Bold,
        TextSize = 13,
        TextColor3 = Theme.OnAccent,
        TextXAlignment = Enum.TextXAlignment.Center,
        Size = UDim2.fromScale(1, 1),
        ZIndex = 22,
        Parent = logo,
    })
    local text = Label({
        Size = UDim2.fromOffset(0, 30),
        AutomaticSize = Enum.AutomaticSize.X,
        FontFace = Fonts.Medium,
        TextSize = 13,
        TextTruncate = Enum.TextTruncate.None,
        RichText = true,
        LayoutOrder = 2,
        ZIndex = 21,
        Parent = mark,
    })

    local inset = game:GetService("GuiService"):GetGuiInset().Y
    local function place()
        local x = math.floor(ScreenGui.AbsoluteSize.X - mark.AbsoluteSize.X - 16)
        mark.Position = UDim2.fromOffset(x, inset + 16)
    end
    mark:GetPropertyChangedSignal("AbsoluteSize"):Connect(place)
    Connect(ScreenGui:GetPropertyChangedSignal("AbsoluteSize"), place)

    local frames, clock, sampler = 0, 0, nil
    local function sample(dt)
        frames += 1
        clock += dt
        if clock < 0.5 then
            return
        end
        local fps = frames / clock
        frames, clock = 0, 0
        local ok, ping = pcall(function()
            return LocalPlayer:GetNetworkPing() * 1000
        end)
        local dim = '<font color="#8A8A92">·</font>'
        text.Text = string.format(
            "LINE %s %d fps %s %s ms %s %s",
            dim,
            fps + 0.5,
            dim,
            ok and tostring(math.floor(ping + 0.5)) or "—",
            dim,
            os.date("%H:%M")
        )
    end

    function Library:SetWatermarkVisible(visible)
        mark.Visible = visible
        place()
        if visible then
            if not sampler then
                sampler = Connect(RunService.Heartbeat, sample)
            end
        elseif sampler then
            sampler:Disconnect()
            sampler = nil
            frames, clock = 0, 0
        end
    end
end

Library.ConfigScope = nil
local function configDir()
    local base = Library.Folder .. "/configs"
    return Library.ConfigScope and (base .. "/" .. Library.ConfigScope) or base
end
local function autoloadPath()
    return Library.ConfigScope and (configDir() .. "/autoload.txt") or (Library.Folder .. "/autoload.txt")
end
function Library:SetConfigScope(name)
    local scope = tostring(name or ""):gsub("[^%w%-_]", "")
    self.ConfigScope = scope ~= "" and scope or nil
end

local function ensureFolders()
    if not FS.available then
        return false
    end
    local ok = pcall(function()
        for _, path in ipairs({ Library.Folder, Library.Folder .. "/configs", configDir() }) do
            if not FS.isfolder(path) then
                FS.makefolder(path)
            end
        end
    end)
    if not ok then
        FS.available = false
    end
    return ok
end

local function encodeValue(option)
    local value = option:Get()
    if option.Type == "ColorPicker" then
        return colorToHex(value)
    elseif option.Type == "Keybind" then
        return value and value.Name or "None"
    end
    return value
end

local function decodeValue(option, raw)
    if option.Type == "ColorPicker" then
        return hexToColor(raw)
    elseif option.Type == "Keybind" then
        return keyFromName(raw)
    end
    return raw
end

function Library:SaveConfig(name)
    if not ensureFolders() then
        return false, "File system unavailable"
    end
    name = tostring(name or ""):gsub("[^%w%s%-_]", ""):gsub("^%s+", ""):gsub("%s+$", "")
    if name == "" then
        return false, "Invalid config name"
    end
    local data = {}
    for flag, option in pairs(self.Options) do
        if not option.NoSave then
            data[flag] = encodeValue(option)
        end
    end
    local ok, err = pcall(FS.writefile, configDir() .. "/" .. name .. ".json", HttpService:JSONEncode(data))
    return ok, err
end

function Library:LoadConfig(name)
    if not ensureFolders() then
        return false, "File system unavailable"
    end
    local path = configDir() .. "/" .. tostring(name) .. ".json"
    if not FS.exists(path) then
        return false, "Config not found"
    end
    local ok, data = pcall(function()
        return HttpService:JSONDecode(FS.readfile(path))
    end)
    if not ok or type(data) ~= "table" then
        return false, "Config is corrupted"
    end
    for flag, raw in pairs(data) do
        local option = self.Options[flag]
        if option and not option.NoSave then
            task.spawn(function()
                option:Set(decodeValue(option, raw))
            end)
        end
    end
    return true
end

function Library:DeleteConfig(name)
    if not ensureFolders() or not FS.delfile then
        return false, "File system unavailable"
    end
    local path = configDir() .. "/" .. tostring(name) .. ".json"
    if not FS.exists(path) then
        return false, "Config not found"
    end
    return pcall(FS.delfile, path)
end

function Library:ListConfigs()
    if not ensureFolders() then
        return {}
    end
    if not FS.listfiles then
        return {}
    end
    local ok, files = pcall(FS.listfiles, configDir())
    if not ok or type(files) ~= "table" then
        return {}
    end
    local list = {}
    for _, file in ipairs(files) do
        local name = tostring(file):match("([^/\\]+)%.json$")
        if name then
            table.insert(list, name)
        end
    end
    table.sort(list)
    return list
end

function Library:GetAutoload()
    if not ensureFolders() then
        return nil
    end
    local path = autoloadPath()
    if FS.exists(path) then
        local ok, name = pcall(FS.readfile, path)
        return ok and type(name) == "string" and name ~= "" and name or nil
    end
    return nil
end

function Library:SetAutoload(name)
    if not ensureFolders() then
        return false
    end
    return pcall(FS.writefile, autoloadPath(), name or "")
end

local NEUTRAL = table.clone(Theme)
local PAINT_PROPS = { "BackgroundColor3", "TextColor3", "ImageColor3", "PlaceholderColor3", "ScrollBarImageColor3" }
local THEME_FILE = Library.Folder .. "/theme.json"

local function colorKey(c)
    return math.floor(c.R * 255 + 0.5) * 65536 + math.floor(c.G * 255 + 0.5) * 256 + math.floor(c.B * 255 + 0.5)
end

local function channelMax(a, b)
    return Color3.new(math.max(a.R, b.R), math.max(a.G, b.G), math.max(a.B, b.B))
end

local LADDER = {
    Background = { 0.045, 1.00 },
    Sidebar = { 0.057, 0.95 },
    Surface = { 0.080, 0.85 },
    Elevated = { 0.116, 0.75 },
    Hover = { 0.152, 0.70 },
    StrokeSoft = { 0.112, 0.90 },
    Stroke = { 0.180, 0.90 },
}

local INK = {
    Text = { 0.984, 0.03 },
    SubText = { 0.875, 0.10 },
    Muted = { 0.635, 0.18 },
}

local function buildTheme(a, b, tint)
    b = b or a
    tint = math.clamp(tint or 0, 0, 1)
    local theme = table.clone(NEUTRAL)
    local mid = a:Lerp(b, 0.5)
    local h, s = mid:ToHSV()
    s = math.min(s, 1)
    for key, step in pairs(LADDER) do
        local sat = math.min(s * tint * step[2] * 1.4, 0.75)

        theme[key] = Color3.fromHSV(h, sat, math.min(step[1] * (1 + sat * 0.8), 1))
    end
    for key, step in pairs(INK) do
        theme[key] = Color3.fromHSV(h, math.min(s * tint * step[2] * 1.6, 0.3), step[1])
    end
    local accent = channelMax(a, b)
    local ah, as, av = accent:ToHSV()
    theme.Accent = accent
    theme.AccentHover = Color3.fromHSV(ah, as, av * 0.86)

    local function relative(c)
        local function channel(x)
            return x <= 0.03928 and x / 12.92 or ((x + 0.055) / 1.055) ^ 2.4
        end
        return 0.2126 * channel(c.R) + 0.7152 * channel(c.G) + 0.0722 * channel(c.B)
    end
    local function contrast(x, y)
        local p, q = relative(x), relative(y)
        return (math.max(p, q) + 0.05) / (math.min(p, q) + 0.05)
    end
    local dark, light = NEUTRAL.OnAccent, Color3.fromRGB(250, 250, 252)
    local darkScore = math.min(contrast(dark, a), contrast(dark, b))
    local lightScore = math.min(contrast(light, a), contrast(light, b))
    theme.OnAccent = darkScore >= lightScore and dark or light
    return theme
end

local function ensureUnique(theme)
    local used = {}
    for _, key in ipairs({
        "Text",
        "SubText",
        "Muted",
        "Background",
        "Sidebar",
        "Surface",
        "Elevated",
        "Hover",
        "Stroke",
        "StrokeSoft",
        "OnAccent",
        "AccentHover",
        "Accent",
    }) do
        local c = theme[key]
        while used[colorKey(c)] do
            local b = math.floor(c.B * 255 + 0.5)
            c = Color3.fromRGB(math.floor(c.R * 255 + 0.5), math.floor(c.G * 255 + 0.5), b >= 255 and b - 1 or b + 1)
        end
        used[colorKey(c)] = true
        theme[key] = c
    end
    return theme
end

local rgb = Color3.fromRGB
Library.Themes = {
    Noir = { A = rgb(245, 245, 247), B = rgb(150, 150, 158) },
    Midnight = { A = rgb(59, 110, 246), B = rgb(30, 64, 220) },
    Ocean = { A = rgb(56, 189, 248), B = rgb(99, 102, 241) },
    Arctic = { A = rgb(186, 230, 253), B = rgb(96, 165, 250) },
    Aurora = { A = rgb(52, 211, 153), B = rgb(59, 130, 246) },
    Emerald = { A = rgb(52, 211, 153), B = rgb(5, 150, 105) },
    Mint = { A = rgb(45, 212, 191), B = rgb(163, 230, 53) },
    Violet = { A = rgb(196, 181, 253), B = rgb(139, 92, 246) },
    Nebula = { A = rgb(168, 85, 247), B = rgb(236, 72, 153) },
    Sakura = { A = rgb(249, 168, 212), B = rgb(236, 72, 153) },
    Crimson = { A = rgb(248, 80, 80), B = rgb(225, 29, 72) },
    Ember = { A = rgb(251, 146, 60), B = rgb(220, 38, 38) },
    Sunset = { A = rgb(251, 113, 133), B = rgb(251, 146, 60) },
    Gold = { A = rgb(250, 204, 21), B = rgb(249, 115, 22) },
}
Library.ThemeOrder = {
    "Noir",
    "Midnight",
    "Ocean",
    "Arctic",
    "Aurora",
    "Emerald",
    "Mint",
    "Violet",
    "Nebula",
    "Sakura",
    "Crimson",
    "Ember",
    "Sunset",
    "Gold",
}
Library.CurrentTheme = "Noir"
Library.ThemeTint = 0.5
Library.Backdrop = "Depth"
Library._backdrops = {}
Library.GradientStyle = "Static"
Library.GradientAngle = 0
Library.GradientSpeed = 1
Library.GradientAnimated = false
Library.Roundness = 1
Library.FontFamily = "BuilderSans"
Library.FontFamilies = {
    "BuilderSans",
    "GothamSSm",
    "Montserrat",
    "Ubuntu",
    "Nunito",
    "Roboto",
    "Arimo",
    "SourceSansPro",
    "RobotoCondensed",
    "TitilliumWeb",
    "JosefinSans",
    "Oswald",
    "Jura",
    "Michroma",
    "Sarpanch",
    "BuilderExtended",
    "BuilderMono",
    "RobotoMono",
    "FredokaOne",
    "Merriweather",
}
Library.ThemeGradient = { A = Library.Themes.Noir.A, B = Library.Themes.Noir.B }
Library._themeCallbacks = {}

function Library:OnThemeChanged(callback)
    table.insert(self._themeCallbacks, callback)
end

local accentGradients = setmetatable({}, { __mode = "k" })
local activeGradients = setmetatable({}, { __mode = "k" })

local function ratio(color, accent)
    local function r(c, m)
        return m > 0.001 and math.clamp(c / m, 0, 1) or 1
    end
    return Color3.new(r(color.R, accent.R), r(color.G, accent.G), r(color.B, accent.B))
end

local function distance(a, b)
    return math.sqrt((a.R - b.R) ^ 2 + (a.G - b.G) ^ 2 + (a.B - b.B) ^ 2)
end

local function accentWeight(color)
    local d = math.min(distance(color, Theme.Accent), distance(color, Theme.AccentHover))
    return math.clamp(1 - d / 0.22, 0, 1)
end

local function updateGradient(host)
    if host:GetAttribute("NoTheme") or host:GetAttribute("NoGradient") then
        return
    end
    local color = host:IsA("UIStroke") and host.Color or host.BackgroundColor3
    local weight = accentWeight(color)
    local gradient = accentGradients[host]
    if weight <= 0 then
        if gradient then
            gradient.Enabled = false
            activeGradients[gradient] = nil
        end
        return
    end
    if not gradient then
        gradient = Instance.new("UIGradient")
        gradient.Name = "LINEAccent"
        gradient:SetAttribute("NoTheme", true)
        gradient.Parent = host
        gradient.Rotation = Library.GradientAngle
        accentGradients[host] = gradient
    end
    local white = Color3.new(1, 1, 1)
    local g = Library.ThemeGradient
    local a = white:Lerp(ratio(g.A, Theme.Accent), weight)
    local b = white:Lerp(ratio(g.B, Theme.Accent), weight)
    if Library.GradientStyle == "Flow" then

        gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, a),
            ColorSequenceKeypoint.new(0.5, b),
            ColorSequenceKeypoint.new(1, a),
        })
    else
        gradient.Color = ColorSequence.new(a, b)
    end
    gradient.Enabled = true
    activeGradients[gradient] = true
end

local function watch(object)
    if object:IsA("UIStroke") then
        object:GetPropertyChangedSignal("Color"):Connect(function()
            updateGradient(object)
        end)
        updateGradient(object)
    elseif
        object:IsA("GuiObject")
        and not object:IsA("TextLabel")
        and not object:IsA("TextBox")
        and not object:IsA("ScrollingFrame")
    then
        object:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
            updateGradient(object)
        end)
        updateGradient(object)
    end
end

for _, object in ipairs(ScreenGui:GetDescendants()) do
    watch(object)
end
Connect(ScreenGui.DescendantAdded, function(object)

    task.defer(function()
        if object.Parent then
            watch(object)
        end
    end)
end)

local function refreshGradients()
    for host in pairs(accentGradients) do
        if host.Parent then
            updateGradient(host)
        end
    end
    for _, object in ipairs(ScreenGui:GetDescendants()) do
        if not accentGradients[object] then
            if
                object:IsA("UIStroke")
                or (object:IsA("GuiObject") and not object:IsA("TextLabel") and not object:IsA("TextBox"))
            then
                updateGradient(object)
            end
        end
    end
end

local gradientClock = 0
Connect(RunService.RenderStepped, function(dt)
    if not Library.Open then
        return
    end
    local style = Library.GradientStyle
    if style == "Static" or Library.GradientSpeed == 0 then
        return
    end
    gradientClock += dt
    if UserInputService.TouchEnabled and gradientClock < 1 / 30 then
        return
    end
    gradientClock = 0
    local t = os.clock() * Library.GradientSpeed
    local rotation, offset = Library.GradientAngle, Vector2.zero
    if style == "Spin" then
        rotation = (t * 40) % 360
    elseif style == "Flow" then
        offset = Vector2.new((t * 0.35) % 2 - 1, 0)
    end
    for gradient in pairs(activeGradients) do
        gradient.Rotation = rotation
        gradient.Offset = offset
    end
end)

local function applyCorner(corner)
    if corner.CornerRadius.Scale > 0 then
        return
    end
    local base = corner:GetAttribute("BaseRadius")
    if not base then
        base = corner.CornerRadius.Offset
        corner:SetAttribute("BaseRadius", base)
    end
    corner.CornerRadius = UDim.new(0, math.floor(base * Library.Roundness + 0.5))
end

Connect(ScreenGui.DescendantAdded, function(object)
    if object:IsA("UICorner") then
        task.defer(function()
            if object.Parent and Library.Roundness ~= 1 then
                applyCorner(object)
            end
        end)
    end
end)

function Library:SetRoundness(multiplier)
    self.Roundness = math.clamp(tonumber(multiplier) or 1, 0, 2)
    for _, object in ipairs(ScreenGui:GetDescendants()) do
        if object:IsA("UICorner") then
            applyCorner(object)
        end
    end
    if self._saveTheme then
        self._saveTheme()
    end
end

local function familyAsset(name)
    return "rbxasset://fonts/families/" .. name .. ".json"
end

local function applyFontFamily(object, fromAsset, toAsset)
    if object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox") then
        local face = object.FontFace
        if face.Family == fromAsset then
            object.FontFace = Font.new(toAsset, face.Weight, face.Style)
        end
    end
end

function Library:SetFont(name)
    if not table.find(self.FontFamilies, name) then
        return false
    end
    local fromAsset, toAsset = familyAsset(self.FontFamily), familyAsset(name)
    self.FontFamily = name
    for key, face in pairs(Fonts) do
        Fonts[key] = Font.new(toAsset, face.Weight, face.Style)
    end
    for _, object in ipairs(ScreenGui:GetDescendants()) do
        applyFontFamily(object, fromAsset, toAsset)
    end
    if self._saveTheme then
        self._saveTheme()
    end
    return true
end

local function repaint(map, instant)
    local info = TweenInfo.new(Dur.slow, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    for _, object in ipairs(ScreenGui:GetDescendants()) do
        if not object:GetAttribute("NoTheme") then
            if object:IsA("UIStroke") then
                local target = map[colorKey(object.Color)]
                if target then
                    if instant then
                        object.Color = target
                    else
                        Tween(object, info, { Color = target })
                    end
                end
            elseif object:IsA("GuiObject") then
                local goals
                for _, prop in ipairs(PAINT_PROPS) do
                    local ok, value = pcall(function()
                        return object[prop]
                    end)
                    local target = ok and typeof(value) == "Color3" and map[colorKey(value)]
                    if target then
                        goals = goals or {}
                        goals[prop] = target
                    end
                end
                if goals then
                    if instant then
                        for prop, value in pairs(goals) do
                            object[prop] = value
                        end
                    else
                        Tween(object, info, goals)
                    end
                end
            end
        end
    end
end

local function saveTheme()
    if not FS.available then
        return
    end
    pcall(function()
        if not FS.isfolder(Library.Folder) then
            FS.makefolder(Library.Folder)
        end
        FS.writefile(
            THEME_FILE,
            HttpService:JSONEncode({
                Name = Library.CurrentTheme,
                A = colorToHex(Library.ThemeGradient.A),
                B = colorToHex(Library.ThemeGradient.B),
                Tint = Library.ThemeTint,
                Style = Library.GradientStyle,
                Angle = Library.GradientAngle,
                Speed = Library.GradientSpeed,
                Roundness = Library.Roundness,
                Font = Library.FontFamily,
                Backdrop = Library.Backdrop,
            })
        )
    end)
end
Library._saveTheme = saveTheme

local function applyPalette(palette, gradient, name, opts)
    local new = table.clone(Theme)
    for key, value in pairs(palette) do
        if new[key] ~= nil and typeof(value) == "Color3" then
            new[key] = value
        end
    end
    ensureUnique(new)

    local map = {}
    for key, old in pairs(Theme) do
        if colorKey(old) ~= colorKey(new[key]) then
            map[colorKey(old)] = new[key]
        end
    end
    for key, value in pairs(new) do
        Theme[key] = value
    end
    Library.ThemeGradient = gradient
    Library.CurrentTheme = name
    if next(map) then
        repaint(map, opts.Instant)

        if not opts.Instant then
            task.delay(0.45, function()
                if not Library.Unloaded then
                    repaint(map, true)
                    refreshGradients()
                end
            end)
        end
    end
    refreshGradients()
    if opts.Save ~= false then
        saveTheme()
    end
    for _, callback in ipairs(Library._themeCallbacks) do
        safeCall(callback, name, Theme)
    end
    return true
end

function Library:SetGradient(a, b, opts)
    if typeof(a) ~= "Color3" then
        return false
    end
    b = typeof(b) == "Color3" and b or a
    opts = opts or {}
    return applyPalette(buildTheme(a, b, self.ThemeTint), { A = a, B = b }, opts.Name or "Custom", opts)
end

function Library:SetTheme(theme, opts)
    opts = opts or {}
    if type(theme) == "string" then
        local preset = self.Themes[theme]
        if not preset then
            return false
        end
        opts.Name = theme
        return self:SetGradient(preset.A, preset.B, opts)
    elseif type(theme) == "table" then
        local accent = theme.Accent or Theme.Accent
        return applyPalette(theme, { A = accent, B = accent }, opts.Name or "Custom", opts)
    end
    return false
end

function Library:SetAccent(color, opts)
    return self:SetGradient(color, color, opts)
end

function Library:SetThemeTint(amount, opts)
    self.ThemeTint = math.clamp(amount or 0, 0, 1)
    opts = opts or {}
    opts.Name = self.CurrentTheme
    return self:SetGradient(self.ThemeGradient.A, self.ThemeGradient.B, opts)
end

function Library:SetGradientStyle(style)
    if style ~= "Flow" and style ~= "Spin" and style ~= "Static" then
        return false
    end
    self.GradientStyle = style
    self.GradientAnimated = style ~= "Static"
    for gradient in pairs(activeGradients) do
        gradient.Offset = Vector2.zero
        gradient.Rotation = self.GradientAngle
    end
    refreshGradients()
    saveTheme()
    return true
end

function Library:SetGradientAnimated(value)
    return self:SetGradientStyle(value and "Flow" or "Static")
end

function Library:SetGradientAngle(degrees)
    self.GradientAngle = (tonumber(degrees) or 0) % 360
    for gradient in pairs(activeGradients) do
        gradient.Rotation = self.GradientAngle
    end
    saveTheme()
end

function Library:SetGradientSpeed(multiplier)
    self.GradientSpeed = math.clamp(tonumber(multiplier) or 1, 0.1, 5)
    saveTheme()
end

function Library:SetBackdrop(style)
    if style ~= "Depth" and style ~= "Solid" then
        return false
    end
    self.Backdrop = style
    for _, frame in ipairs(self._backdrops) do
        if frame.Parent then
            frame.Visible = style == "Depth"
        end
    end
    saveTheme()
    return true
end

function Library:GetTheme()
    return table.clone(Theme), self.CurrentTheme, self.ThemeGradient
end

function Library:AddThemeSection(tab, side)
    local section = tab:Section({ Name = "Theme", Icon = "palette", Side = side or "Right" })
    local options = table.clone(self.ThemeOrder)
    table.insert(options, "Custom")
    local controls = {}

    controls.preset = section:Dropdown({
        Name = "Preset",
        Icon = "palette",
        Options = options,
        Default = table.find(options, self.CurrentTheme) and self.CurrentTheme or "Custom",
        Callback = function(value)
            if value and value ~= "Custom" then
                self:SetTheme(value)
                controls.a:Set(self.ThemeGradient.A, true)
                controls.b:Set(self.ThemeGradient.B, true)
            end
        end,
    })
    local function custom()
        self:SetGradient(controls.a:Get(), controls.b:Get())
        controls.preset:Set("Custom", true)
    end
    controls.a = section:ColorPicker({
        Name = "Gradient start",
        Icon = "paintbrush",
        Default = self.ThemeGradient.A,
        Callback = custom,
    })
    controls.b = section:ColorPicker({
        Name = "Gradient end",
        Icon = "paintbrush",
        Default = self.ThemeGradient.B,
        Callback = custom,
    })
    section:Button({
        Name = "Swap colours",
        Icon = "refresh-cw",
        Callback = function()
            local a, b = controls.a:Get(), controls.b:Get()
            controls.a:Set(b, true)
            controls.b:Set(a, true)
            custom()
        end,
    })

    section:Divider()
    controls.style = section:Segmented({
        Name = "Gradient style",
        Options = { "Flow", "Spin", "Static" },
        Default = self.GradientStyle,
        Callback = function(value)
            self:SetGradientStyle(value)
        end,
    })
    controls.angle = section:Slider({
        Name = "Gradient angle",
        Icon = "move",
        Min = 0,
        Max = 360,
        Increment = 5,
        Default = self.GradientAngle,
        Suffix = "°",
        Callback = function(value)
            self:SetGradientAngle(value)
        end,
    })
    controls.speed = section:Slider({
        Name = "Gradient speed",
        Icon = "gauge",
        Min = 10,
        Max = 300,
        Increment = 10,
        Default = math.floor(self.GradientSpeed * 100 + 0.5),
        Suffix = "%",
        Callback = function(value)
            self:SetGradientSpeed(value / 100)
        end,
    })

    section:Divider()
    controls.backdrop = section:Segmented({
        Name = "Background",
        Options = { "Depth", "Solid" },
        Default = self.Backdrop,
        Callback = function(value)
            self:SetBackdrop(value)
        end,
    })
    controls.tint = section:Slider({
        Name = "Background tint",
        Icon = "moon",
        Min = 0,
        Max = 100,
        Default = math.floor(self.ThemeTint * 100 + 0.5),
        Suffix = "%",
        Callback = function(value)
            self:SetThemeTint(value / 100)
        end,
    })
    controls.round = section:Slider({
        Name = "Roundness",
        Icon = "box",
        Min = 0,
        Max = 200,
        Increment = 10,
        Default = math.floor(self.Roundness * 100 + 0.5),
        Suffix = "%",
        Callback = function(value)
            self:SetRoundness(value / 100)
        end,
    })
    controls.font = section:Dropdown({
        Name = "Font",
        Icon = "hash",
        Options = self.FontFamilies,
        Default = self.FontFamily,
        Callback = function(value)
            if value then
                self:SetFont(value)
            end
        end,
    })

    section:Button({
        Name = "Reset theme",
        Icon = "refresh-cw",
        Callback = function()
            self.ThemeTint = 0.5
            self.GradientAngle = 0
            self.GradientSpeed = 1
            controls.tint:Set(50, true)
            controls.backdrop:Set("Depth", true)
            self:SetBackdrop("Depth")
            controls.angle:Set(0, true)
            controls.speed:Set(100, true)
            controls.round:Set(100, true)
            controls.style:Set("Static", true)
            controls.font:Set("BuilderSans", true)
            controls.preset:Set("Noir", true)
            self:SetRoundness(1)
            self:SetFont("BuilderSans")
            self:SetGradientStyle("Static")
            self:SetTheme("Noir")
            controls.a:Set(self.ThemeGradient.A, true)
            controls.b:Set(self.ThemeGradient.B, true)
        end,
    })
    return section
end

do
    local restored = false
    if FS.available then
        pcall(function()
            if FS.isfile(THEME_FILE) then
                local data = HttpService:JSONDecode(FS.readfile(THEME_FILE))
                Library.ThemeTint = tonumber(data.Tint) or Library.ThemeTint
                if data.Style == "Flow" or data.Style == "Spin" or data.Style == "Static" then
                    Library.GradientStyle = data.Style
                elseif data.Animated == false then
                    Library.GradientStyle = "Static"
                end
                Library.GradientAnimated = Library.GradientStyle ~= "Static"
                Library.GradientAngle = (tonumber(data.Angle) or 0) % 360
                Library.GradientSpeed = math.clamp(tonumber(data.Speed) or 1, 0.1, 5)
                Library.Roundness = math.clamp(tonumber(data.Roundness) or 1, 0, 2)
                if data.Backdrop == "Solid" or data.Backdrop == "Depth" then
                    Library.Backdrop = data.Backdrop
                end
                if data.Font and table.find(Library.FontFamilies, data.Font) and data.Font ~= Library.FontFamily then
                    local toAsset = familyAsset(data.Font)
                    for key, face in pairs(Fonts) do
                        Fonts[key] = Font.new(toAsset, face.Weight, face.Style)
                    end
                    Library.FontFamily = data.Font
                end
                local opts = { Instant = true, Save = false }
                if data.Name and Library.Themes[data.Name] then
                    restored = Library:SetTheme(data.Name, opts)
                else
                    local a = hexToColor(data.A or data.Accent or "")
                    local b = hexToColor(data.B or "") or a
                    if a then
                        opts.Name = "Custom"
                        restored = Library:SetGradient(a, b, opts)
                    end
                end
            end
        end)
    end
    if not restored then
        Library:SetTheme("Noir", { Instant = true, Save = false })
    end
end

function Library:AddConfigSections(tab, opts)
    opts = opts or {}
    if opts.Scope then
        self:SetConfigScope(opts.Scope)
    end
    local TeleportService = game:GetService("TeleportService")
    local setclipboard = envFunction("setclipboard") or envFunction("toclipboard")
    local httpRequest = requestFunction()
    local queueOnTeleport = envFunction("queue_on_teleport")
        or envFunction("queueonteleport")
        or namespaceFunction("syn", "queue_on_teleport")
    local setfpscap = envFunction("setfpscap")
    local getfpscap = envFunction("getfpscap")
    local identifyexecutor = envFunction("identifyexecutor")

    local function notify(title, content, kind)
        self:Notify({ Title = title, Content = content, Type = kind or "info", Duration = 3 })
    end
    local function copy(text, what)
        if setclipboard and pcall(setclipboard, text) then
            notify("Copied", what .. " is on your clipboard.", "success")
        else
            notify(what, text)
        end
    end

    local interface = tab:Section({ Name = "Interface", Icon = "monitor", Side = "Left" })
    local menuBind
    menuBind = interface:Keybind({
        Name = "Menu key",
        Icon = "keyboard",
        Default = self.ToggleKey,
        HideFromList = true,
        Flag = "menu_key",
        ChangedCallback = function(key)
            if not key then
                menuBind:Set(Enum.KeyCode.RightShift)
                return
            end
            self.ToggleKey = key
        end,
    })
    interface:Slider({
        Name = "Scale",
        Icon = "move",
        Min = 70,
        Max = 130,
        Default = 100,
        Increment = 5,
        Suffix = "%",
        Flag = "ui_scale",
        Callback = function(value)
            self.UserScale = value / 100
            if self.Window then
                self.Window:UpdateScale()
            end
        end,
    })
    interface:Toggle({
        Name = "Notifications",
        Icon = "bell",
        Default = true,
        CallOnInit = false,
        Flag = "ui_notifications",
        Callback = function(value)
            self.NotificationsEnabled = value
        end,
    })
    interface:Toggle({
        Name = "Keybind list",
        Icon = "list",
        Flag = "keybind_list",
        Callback = function(value)
            self:SetKeybindListVisible(value)
        end,
    })
    interface:Toggle({
        Name = "Watermark",
        Icon = "activity",
        Flag = "ui_watermark",
        Callback = function(value)
            self:SetWatermarkVisible(value)
        end,
    })
    if queueOnTeleport and opts.Reexecute then
        local queued = false
        interface:Toggle({
            Name = "Re-execute on teleport",
            Icon = "refresh-cw",
            Description = "Loads the hub again after a rejoin or server hop",
            Flag = "ui_reexecute",
            Callback = function(value)
                if value and not queued then
                    queued = true
                    pcall(queueOnTeleport, opts.Reexecute)
                end
            end,
        })
    end
    interface:Divider()
    interface:Button({
        Name = "Close hub",
        Icon = "power",
        Confirm = true,
        ConfirmText = "Click again to close",
        Callback = function()
            self:Unload()
        end,
    })

    local configs = tab:Section({ Name = "Configs", Icon = "folder", Side = "Left" })
    if not FS.available then
        configs:Label({ Name = "File system unavailable" })
    else
        local nameInput =
            configs:Input({ Name = "Config name", Icon = "save", Placeholder = "e.g. main", MaxLength = 32 })
        local list = configs:Dropdown({
            Name = "Saved configs",
            Icon = "folder",
            Options = self:ListConfigs(),
            AllowNone = true,
        })
        local autoloadLabel = configs:Label({ Name = "Autoload", Value = self:GetAutoload() or "None" })
        local function refresh()
            list:Refresh(self:ListConfigs(), true)
            autoloadLabel:Set(self:GetAutoload() or "None")
        end
        configs:Button({
            Name = "Save",
            Icon = "save",
            Style = "Primary",
            Callback = function()
                local name = nameInput:Get()
                if name == "" then
                    name = list:Get() or ""
                end
                local ok, err = self:SaveConfig(name)
                notify(
                    ok and "Config saved" or "Could not save",
                    ok and name or tostring(err),
                    ok and "success" or "error"
                )
                refresh()
            end,
        })
        configs:Button({
            Name = "Load",
            Icon = "download",
            Callback = function()
                local name = list:Get()
                if not name then
                    notify("Select a config first", nil, "warning")
                    return
                end
                local ok, err = self:LoadConfig(name)
                notify(
                    ok and "Config loaded" or "Could not load",
                    ok and name or tostring(err),
                    ok and "success" or "error"
                )
            end,
        })
        configs:Button({
            Name = "Delete",
            Icon = "trash-2",
            Style = "Danger",
            Confirm = true,
            ConfirmText = "Click again to delete",
            Callback = function()
                local name = list:Get()
                if not name then
                    notify("Select a config first", nil, "warning")
                    return
                end
                local ok = self:DeleteConfig(name)
                if ok and self:GetAutoload() == name then
                    self:SetAutoload("")
                end
                notify(ok and "Config deleted" or "Could not delete", name, ok and "success" or "error")
                refresh()
            end,
        })
        configs:Button({
            Name = "Set as autoload",
            Icon = "star",
            Callback = function()
                local name = list:Get()
                self:SetAutoload(name or "")
                notify("Autoload", name and (name .. " loads on start") or "Autoload cleared")
                refresh()
            end,
        })
        configs:Button({ Name = "Refresh list", Icon = "refresh-cw", Callback = refresh })
        local autoload = self:GetAutoload()
        if autoload then
            task.delay(0.5, function()
                if not self.Unloaded and self:LoadConfig(autoload) then
                    notify("Autoloaded config", autoload, "success")
                end
            end)
        end
    end

    self:AddThemeSection(tab, "Right")

    local server = tab:Section({ Name = "Server", Icon = "wifi", Side = "Right" })
    local playersLabel = server:Label({ Name = "Players", Value = "—" })
    local uptimeLabel = server:Label({ Name = "Server uptime", Value = "—" })
    task.spawn(function()
        while not self.Unloaded do
            playersLabel:Set(#Players:GetPlayers() .. " / " .. Players.MaxPlayers)
            local t = math.floor(Workspace.DistributedGameTime)
            uptimeLabel:Set(string.format("%dh %02dm", t // 3600, (t % 3600) // 60))
            task.wait(2)
        end
    end)
    server:Button({
        Name = "Rejoin",
        Icon = "refresh-cw",
        Callback = function()
            if #Players:GetPlayers() <= 1 then
                TeleportService:Teleport(game.PlaceId, LocalPlayer)
            else
                TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
            end
        end,
    })
    local function fetchServers()
        local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
        local ok, body = pcall(function()
            if httpRequest then
                local response = httpRequest({ Url = url, Method = "GET" })
                if type(response) ~= "table" then
                    error("Invalid HTTP response")
                end
                local status =
                    tonumber(response.StatusCode or response.status_code or response.Status or response.status)
                if status and (status < 200 or status >= 300) then
                    error("HTTP request failed")
                end
                local body = response.Body or response.body
                if type(body) ~= "string" then
                    error("HTTP response body unavailable")
                end
                return body
            end
            return game:HttpGet(url)
        end)
        if not ok or type(body) ~= "string" then
            return nil
        end
        local decoded, data = pcall(HttpService.JSONDecode, HttpService, body)
        return decoded and type(data) == "table" and data.data or nil
    end
    local function hop(pick)
        local servers = fetchServers()
        if not servers then
            notify("Server hop", "Could not reach the server list.", "error")
            return
        end
        local candidates = {}
        for _, s in ipairs(servers) do
            if s.id ~= game.JobId and tonumber(s.playing) and tonumber(s.maxPlayers) and s.playing < s.maxPlayers then
                table.insert(candidates, s)
            end
        end
        if #candidates == 0 then
            notify("Server hop", "No other server with free slots.", "warning")
            return
        end
        local target = pick(candidates)
        notify("Server hop", "Joining a server with " .. target.playing .. " players…")
        TeleportService:TeleportToPlaceInstance(game.PlaceId, target.id, LocalPlayer)
    end
    server:Button({
        Name = "Server hop",
        Icon = "arrow-right",
        Style = "Primary",
        Callback = function()
            task.spawn(hop, function(list)
                return list[math.random(1, #list)]
            end)
        end,
    })
    server:Button({
        Name = "Smallest server",
        Icon = "user",
        Callback = function()
            task.spawn(hop, function(list)
                table.sort(list, function(a, b)
                    return a.playing < b.playing
                end)
                return list[1]
            end)
        end,
    })
    server:Button({
        Name = "Copy JobId",
        Icon = "copy",
        Callback = function()
            copy(game.JobId, "JobId")
        end,
    })
    server:Button({
        Name = "Copy join script",
        Icon = "clipboard",
        Callback = function()
            copy(
                string.format(
                    'game:GetService("TeleportService"):TeleportToPlaceInstance(%d, "%s")',
                    game.PlaceId,
                    game.JobId
                ),
                "Join script"
            )
        end,
    })

    local perf = tab:Section({ Name = "Performance", Icon = "gauge", Side = "Left" })
    if setfpscap then
        local original = getfpscap and getfpscap() or 60
        local unlocked, cap = false, 144
        local function applyCap()
            pcall(setfpscap, unlocked and 0 or cap)
        end
        perf:Toggle({
            Name = "Unlock FPS",
            Icon = "zap",
            Flag = "perf_unlock",
            Callback = function(value)
                unlocked = value
                applyCap()
            end,
        })
        perf:Slider({
            Name = "FPS cap",
            Icon = "gauge",
            Min = 30,
            Max = 360,
            Increment = 10,
            Default = 144,
            Flag = "perf_cap",
            Callback = function(value)
                cap = value
                if not unlocked then
                    applyCap()
                end
            end,
        })
        self:OnUnload(function()
            pcall(setfpscap, original)
        end)
    end

    local saved = {}
    local lowOn = false
    local function lowGraphics(on)
        lowOn = on
        if on then
            saved.GlobalShadows = Lighting.GlobalShadows
            saved.FogEnd = Lighting.FogEnd
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 1e9
            saved.objects = {}
            for _, object in ipairs(Workspace:GetDescendants()) do
                if
                    object:IsA("ParticleEmitter")
                    or object:IsA("Trail")
                    or object:IsA("Smoke")
                    or object:IsA("Fire")
                    or object:IsA("Sparkles")
                then
                    if object.Enabled then
                        saved.objects[object] = "Enabled"
                        object.Enabled = false
                    end
                elseif object:IsA("Decal") or object:IsA("Texture") then
                    if object.Transparency < 1 then
                        saved.objects[object] = object.Transparency
                        object.Transparency = 1
                    end
                end
            end
            for _, effect in ipairs(Lighting:GetChildren()) do
                if effect:IsA("PostEffect") and effect.Enabled then
                    saved.objects[effect] = "Enabled"
                    effect.Enabled = false
                end
            end
        elseif saved.objects then
            Lighting.GlobalShadows = saved.GlobalShadows
            Lighting.FogEnd = saved.FogEnd
            for object, value in pairs(saved.objects) do
                if object.Parent then
                    if value == "Enabled" then
                        object.Enabled = true
                    else
                        object.Transparency = value
                    end
                end
            end
            saved.objects = nil
        end
    end
    perf:Toggle({
        Name = "Low graphics",
        Icon = "monitor",
        Description = "No shadows, fog, particles or textures",
        Flag = "perf_low",
        Callback = lowGraphics,
    })
    self:OnUnload(function()
        if lowOn then
            lowGraphics(false)
        end
    end)

    local antiAfk = false
    local VirtualUser = game:GetService("VirtualUser")
    Connect(LocalPlayer.Idled, function()
        if antiAfk then
            pcall(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.zero)
            end)
        end
    end)
    perf:Toggle({
        Name = "Anti-AFK",
        Icon = "timer",
        Description = "Never get kicked for idling",
        Default = true,
        Flag = "perf_antiafk",
        Callback = function(value)
            antiAfk = value
        end,
    })

    local executor = "Unknown"
    if identifyexecutor then
        local ok, name, version = pcall(identifyexecutor)
        if ok and name then
            executor = tostring(name) .. (version and (" " .. tostring(version)) or "")
        end
    end
    perf:Label({ Name = "Executor", Value = executor })
end

function Library:Unload()
    if self.Unloaded then
        return
    end
    self.Unloaded = true
    capturedPointer = nil
    for _, callback in ipairs(self._unloadCallbacks) do
        pcall(callback)
    end
    for _, connection in ipairs(self._connections) do
        connection:Disconnect()
    end
    table.clear(self._connections)
    ScreenGui:Destroy()
    if ENV.LINE_UNLOAD then
        ENV.LINE_UNLOAD = nil
    end
end

ENV.LINE_UNLOAD = function()
    Library:Unload()
end

Library.Context = Library.Context or { Game = "", Build = "", Site = "https://line.pastebdn.workers.dev" }

function Library:SetContext(opts)
    opts = opts or {}
    if opts.Game ~= nil then Library.Context.Game = tostring(opts.Game) end
    if opts.Build ~= nil then Library.Context.Build = tostring(opts.Build) end
    if opts.Site ~= nil then Library.Context.Site = tostring(opts.Site):gsub("/+$", "") end
    return Library.Context
end

function Library:TimeAgo(epoch)
    local now = os.time()
    local then_ = tonumber(epoch) or 0
    local d = now - then_
    if then_ <= 0 then return "unknown" end
    if d < 0 then d = 0 end
    if d < 60 then return "just now" end
    if d < 3600 then return math.floor(d / 60) .. "m ago" end
    if d < 86400 then return math.floor(d / 3600) .. "h ago" end
    if d < 2592000 then return math.floor(d / 86400) .. "d ago" end
    return os.date("%Y-%m-%d", then_)
end

function Library:_httpJson(url, method, payload)
    local send = envFunction("request") or envFunction("http_request")
    local headers = { ["Content-Type"] = "application/json" }
    if send then
        local ok, response = pcall(send, {
            Url = url,
            Method = method or "GET",
            Headers = headers,
            Body = payload and HttpService:JSONEncode(payload) or nil,
            Timeout = 15,
        })
        if ok and type(response) == "table" then
            local body = response.Body or response.body
            if type(body) == "string" and body ~= "" then
                local decoded, data = pcall(HttpService.JSONDecode, HttpService, body)
                if decoded and type(data) == "table" then return true, data end
            end
        end
        return false, nil
    end
    local ok, body = pcall(function()
        return game:HttpGet(url, true)
    end)
    if ok and type(body) == "string" and body ~= "" then
        local decoded, data = pcall(HttpService.JSONDecode, HttpService, body)
        if decoded and type(data) == "table" then return true, data end
    end
    return false, nil
end

local function lineModal(title, subtitle, width, height)
    local overlay = Create("Frame", {
        Name = "LineModalOverlay",
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(0, 0, 0),
        BackgroundTransparency = 0.45,
        BorderSizePixel = 0,
        ZIndex = 200,
        Parent = ScreenGui,
    })
    local card = Create("Frame", {
        Name = "LineModal",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(width or 440, height or 400),
        BackgroundColor3 = Theme.Surface,
        BorderSizePixel = 0,
        ZIndex = 201,
        Parent = overlay,
    }, { Corner(Radius.lg), Stroke(Theme.Stroke) })
    do
        local fit = Create("UIScale", { Parent = card })
        local vp = ScreenGui.AbsoluteSize
        if vp.X < 64 or vp.Y < 64 then
            local cam = workspace.CurrentCamera
            vp = cam and cam.ViewportSize or Vector2.new(1280, 720)
        end
        local sx = (vp.X - 24) / (width or 440)
        local sy = (vp.Y - 24) / (height or 400)
        fit.Scale = math.clamp(math.min(1, sx, sy), 0.55, 1)
    end
    local heading = Create("TextLabel", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(18, 16),
        Size = UDim2.new(1, -36, 0, 20),
        FontFace = Fonts.Bold,
        Text = title or "",
        TextColor3 = Theme.Text,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 202,
        Parent = card,
    })
    local sub = Create("TextLabel", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(18, 38),
        Size = UDim2.new(1, -36, 0, 30),
        FontFace = Fonts.Regular,
        Text = subtitle or "",
        TextColor3 = Theme.Muted,
        TextSize = 12,
        TextWrapped = true,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 202,
        Parent = card,
    })
    local close = Create("TextButton", {
        Position = UDim2.new(1, -40, 0, 14),
        Size = UDim2.fromOffset(26, 26),
        BackgroundColor3 = Theme.Elevated,
        Text = "x",
        FontFace = Fonts.Bold,
        TextColor3 = Theme.Muted,
        TextSize = 14,
        AutoButtonColor = false,
        ZIndex = 202,
        Parent = card,
    }, { Corner(Radius.md) })
    close.MouseButton1Click:Connect(function()
        overlay:Destroy()
    end)
    return overlay, card, heading, sub
end

local function lineField(parent, y, label, placeholder, height, multiline)
    local cap = Create("TextLabel", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(18, y),
        Size = UDim2.new(1, -36, 0, 14),
        FontFace = Fonts.Medium,
        Text = label,
        TextColor3 = Theme.Muted,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 202,
        Parent = parent,
    })
    local box = Create("TextBox", {
        Position = UDim2.fromOffset(18, y + 16),
        Size = UDim2.new(1, -36, 0, height or 30),
        BackgroundColor3 = Theme.Elevated,
        Text = "",
        PlaceholderText = placeholder or "",
        PlaceholderColor3 = Theme.Muted,
        TextColor3 = Theme.Text,
        FontFace = Fonts.Regular,
        TextSize = 13,
        TextWrapped = multiline == true,
        MultiLine = multiline == true,
        TextYAlignment = multiline and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
        ZIndex = 202,
        Parent = parent,
    }, { Corner(Radius.md), Padding(multiline and 8 or 0, 10, multiline and 8 or 0, 10) })
    return box, cap
end

local function lineButton(parent, x, y, width, height, text, primary, onClick)
    local btn = Create("TextButton", {
        Position = UDim2.fromOffset(x, y),
        Size = UDim2.fromOffset(width, height),
        BackgroundColor3 = primary and Theme.Accent or Theme.Elevated,
        Text = text,
        FontFace = Fonts.Medium,
        TextColor3 = primary and Theme.OnAccent or Theme.Text,
        TextSize = 12,
        AutoButtonColor = false,
        ZIndex = 202,
        Parent = parent,
    }, { Corner(Radius.md), Stroke(primary and Theme.Accent or Theme.Stroke) })
    btn.MouseEnter:Connect(function() btn.BackgroundColor3 = primary and Theme.AccentHover or Theme.Hover end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3 = primary and Theme.Accent or Theme.Elevated end)
    btn.MouseButton1Click:Connect(function()
        if onClick then pcall(onClick) end
    end)
    return btn
end

local function lineChoice(parent, x, y, width, height, text, onPick)
    local active = false
    local btn = Create("TextButton", {
        Position = UDim2.fromOffset(x, y),
        Size = UDim2.fromOffset(width, height),
        BackgroundColor3 = Theme.Elevated,
        Text = text,
        FontFace = Fonts.Medium,
        TextColor3 = Theme.Text,
        TextSize = 12,
        AutoButtonColor = false,
        ZIndex = 202,
        Parent = parent,
    }, { Corner(Radius.md), Stroke(Theme.Stroke) })
    local function paint(hovering)
        if active then
            btn.BackgroundColor3 = hovering and Theme.AccentHover or Theme.Accent
            btn.TextColor3 = Theme.OnAccent
        else
            btn.BackgroundColor3 = hovering and Theme.Hover or Theme.Elevated
            btn.TextColor3 = Theme.Text
        end
    end
    btn.MouseEnter:Connect(function() paint(true) end)
    btn.MouseLeave:Connect(function() paint(false) end)
    btn.MouseButton1Click:Connect(function()
        if onPick then pcall(onPick) end
    end)
    return btn, function(value)
        active = value == true
        paint(false)
    end
end

function Library:Expiry(epoch)
    local exp = tonumber(epoch) or 0
    local left = exp - os.time()
    if left < 0 then left = 0 end
    local h = math.floor(left / 3600)
    local m = math.floor((left % 3600) / 60)
    local sec = left % 60
    return string.format("%02d:%02d:%02d", h, m, sec), left
end

function Library:Report(opts)
    opts = opts or {}
    local ctx = Library.Context
    if Library._reportModal and Library._reportModal.Parent then
        Library._reportModal:Destroy()
    end
    local mod = Library.Module
    local modLine = ""
    if mod and mod.Name and mod.Name ~= "" then
        modLine = "Loaded: " .. mod.Name .. (mod.Version ~= "" and (" " .. mod.Version) or "") .. "\n"
    end
    local overlay, card = lineModal("Report a problem", modLine .. "Verified reports and adopted ideas earn a free 1-day key.", 460, 452)
    Library._reportModal = overlay

    local kind = "bug"
    local bugSet, ideaSet
    local function setKind(value)
        kind = value
        if bugSet then bugSet(value == "bug") end
        if ideaSet then ideaSet(value == "idea") end
    end
    local bugBtn, ideaBtn
    bugBtn, bugSet = lineChoice(card, 18, 74, 208, 32, "Bug / broken", function() setKind("bug") end)
    ideaBtn, ideaSet = lineChoice(card, 234, 74, 208, 32, "Suggestion", function() setKind("idea") end)
    setKind("bug")
    Library._reportKind = { Bug = bugBtn, Idea = ideaBtn, Get = function() return kind end }

    local gameBox = lineField(card, 118, "GAME", ctx.Game ~= "" and ctx.Game or "which game is this about", 30, false)
    if ctx.Game ~= "" then gameBox.Text = ctx.Game end
    local titleBox = lineField(card, 172, "SHORT TITLE", "what is wrong, in one line", 30, false)
    local detailBox = lineField(card, 226, "WHAT HAPPENED", "steps, what you expected, what actually happened", 92, true)
    local contactBox = lineField(card, 336, "DISCORD / CONTACT", "optional, so we can confirm the fix", 30, false)

    local status = Create("TextLabel", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(18, 386),
        Size = UDim2.new(1, -160, 0, 16),
        FontFace = Fonts.Regular,
        Text = "",
        TextColor3 = Theme.Muted,
        TextSize = 11,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 202,
        Parent = card,
    })

    local submit
    submit = lineButton(card, 18, 408, 150, 30, "Send report", true, function()
        local g = gameBox.Text:gsub("^%s+", ""):gsub("%s+$", "")
        local t = titleBox.Text:gsub("^%s+", ""):gsub("%s+$", "")
        local d = detailBox.Text:gsub("^%s+", ""):gsub("%s+$", "")
        if #g < 2 then
            status.TextColor3 = Color3.fromRGB(242, 120, 120)
            status.Text = "Name the game."
            return
        end
        if #t < 4 then
            status.TextColor3 = Color3.fromRGB(242, 120, 120)
            status.Text = "Give it a short title."
            return
        end
        if #d < 12 then
            status.TextColor3 = Color3.fromRGB(242, 120, 120)
            status.Text = "Describe what happened."
            return
        end
        submit.Text = "Sending..."
        status.TextColor3 = Theme.Muted
        status.Text = ""
        task.spawn(function()
            local mod = Library.Module
            local payload = {
                kind = kind,
                game = g,
                build = ctx.Build,
                title = t,
                details = d,
                contact = contactBox.Text,
                placeId = tostring(game.PlaceId),
                user = LocalPlayer and tostring(LocalPlayer.Name) or "",
                key = "",
                executor = mod and mod.Executor or "",
            }
            if FS and FS.available and FS.readfile then
                local okKey, savedKey = pcall(FS.readfile, KEY_FILE)
                if okKey and type(savedKey) == "string" then
                    payload.key = savedKey:gsub("^%s+", ""):gsub("%s+$", "")
                end
            end
            local ok, data = Library:_httpJson(ctx.Site .. "/api/report", "POST", payload)
            if ok and data and data.id then
                Library.Ticket = data.id
                submit.Text = "Sent"
                status.TextColor3 = Color3.fromRGB(120, 220, 150)
                status.Text = "Ticket " .. tostring(data.id)
                lineButton(card, 176, 408, 120, 30, "Copy ticket", false, function()
                    if setclipboard then
                        pcall(setclipboard, tostring(data.id))
                    end
                end)
                lineButton(card, 304, 408, 120, 30, "Check status", false, function()
                    task.spawn(function()
                        local ok2, d2 = Library:_httpJson(ctx.Site .. "/api/report/status?id=" .. tostring(data.id), "GET")
                        if not (ok2 and d2) then return end
                        if d2.status == "approved" and d2.key then
                            status.TextColor3 = Color3.fromRGB(120, 220, 150)
                            status.Text = "Approved. Key: " .. tostring(d2.key)
                            if setclipboard then pcall(setclipboard, tostring(d2.key)) end
                            if Library._keyLabel and Library._keyLabel.Parent then
                                Library._keyLabel:Destroy()
                            end
                            if Library._cdLabel and Library._cdLabel.Parent then
                                Library._cdLabel:Destroy()
                            end
                            local keyLabel = Create("TextLabel", {
                                BackgroundTransparency = 1,
                                Position = UDim2.fromOffset(18, 356),
                                Size = UDim2.new(1, -36, 0, 26),
                                FontFace = Fonts.Medium,
                                Text = tostring(d2.key),
                                TextColor3 = Color3.fromRGB(120, 220, 150),
                                TextSize = 12,
                                TextWrapped = true,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                ZIndex = 203,
                                Parent = card,
                            })
                            Library._keyLabel = keyLabel
                            local cd = Create("TextLabel", {
                                BackgroundTransparency = 1,
                                Position = UDim2.fromOffset(18, 344),
                                Size = UDim2.new(1, -36, 0, 14),
                                FontFace = Fonts.Medium,
                                Text = "Key expires in",
                                TextColor3 = Theme.Muted,
                                TextSize = 10,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                ZIndex = 203,
                                Parent = card,
                            })
                            Library._cdLabel = cd
                            local expAt = tonumber(d2.expires) or (os.time() + (tonumber(d2.expiresIn) or 0))
                            task.spawn(function()
                                while overlay.Parent do
                                    local text, left = Library:Expiry(expAt)
                                    if left <= 0 then
                                        cd.TextColor3 = Color3.fromRGB(242, 120, 120)
                                        cd.Text = "Key expired - no longer valid"
                                        keyLabel.Text = ""
                                        keyLabel.Visible = false
                                        status.Text = "This key expired. Submit a new report for another."
                                        status.TextColor3 = Color3.fromRGB(242, 120, 120)
                                        break
                                    end
                                    cd.Text = "Key expires in " .. text
                                    task.wait(1)
                                end
                            end)
                        elseif d2.status == "expired" then
                            status.TextColor3 = Color3.fromRGB(242, 120, 120)
                            status.Text = "This key expired and is no longer shown."
                        elseif d2.status == "rejected" then
                            status.TextColor3 = Color3.fromRGB(242, 120, 120)
                            status.Text = "Not accepted" .. (d2.note and (": " .. tostring(d2.note)) or "")
                        else
                            status.TextColor3 = Theme.Muted
                            status.Text = "Still pending review."
                        end
                    end)
                end)
            else
                submit.Text = "Send report"
                status.TextColor3 = Color3.fromRGB(242, 120, 120)
                if setclipboard then
                    pcall(setclipboard, ctx.Site .. "/report")
                end
                status.Text = "Could not reach the site. The report URL was copied to your clipboard."
            end
        end)
    end)
    lineButton(card, 358, 408, 84, 30, "Close", false, function()
        overlay:Destroy()
    end)
    return overlay
end

function Library:Updates(opts)
    opts = opts or {}
    local ctx = Library.Context
    if Library._updateModal and Library._updateModal.Parent then
        Library._updateModal:Destroy()
    end
    local overlay, card = lineModal("What is new", "Pulling the latest build from " .. tostring(ctx.Site):gsub("^https?://", ""), 460, 420)
    Library._updateModal = overlay

    local body = Create("Frame", {
        Position = UDim2.fromOffset(18, 78),
        Size = UDim2.new(1, -36, 0, 300),
        BackgroundTransparency = 1,
        ZIndex = 202,
        Parent = card,
    })
    local layout = Create("UIListLayout", {
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = body,
    })

    local loading = Create("TextLabel", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 20),
        FontFace = Fonts.Regular,
        Text = "Loading...",
        TextColor3 = Theme.Muted,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 1,
        ZIndex = 202,
        Parent = body,
    })

    task.spawn(function()
        local ok, data = Library:_httpJson(ctx.Site .. "/api/version", "GET")
        loading:Destroy()
        if not ok or not data then
            local fail = Create("TextLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 20),
                FontFace = Fonts.Regular,
                Text = "Could not reach the site.",
                TextColor3 = Color3.fromRGB(242, 120, 120),
                TextSize = 12,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = 1,
                ZIndex = 202,
                Parent = body,
            })
            return
        end
        local latest = tostring(data.build or "?")
        local when_ = Library:TimeAgo(data.published)
        local behind = ctx.Build ~= "" and ctx.Build ~= latest
        local head = Create("TextLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 34),
            FontFace = Fonts.Bold,
            Text = string.format("Latest %s  -  %s", latest, when_),
            TextColor3 = Theme.Text,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            LayoutOrder = 1,
            ZIndex = 202,
            Parent = body,
        })
        Create("TextLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 16),
            FontFace = Fonts.Regular,
            Text = ctx.Build == "" and "You are running an unversioned build."
                or string.format("You are on %s%s", ctx.Build, behind and "  -  update available" or "  -  up to date"),
            TextColor3 = behind and Color3.fromRGB(242, 190, 120) or Theme.Muted,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            LayoutOrder = 2,
            ZIndex = 202,
            Parent = body,
        })
        for i, note in ipairs(data.notes or {}) do
            Create("TextLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 16),
                FontFace = Fonts.Regular,
                Text = "- " .. tostring(note),
                TextColor3 = Theme.SubText,
                TextSize = 11,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = 10 + i,
                ZIndex = 202,
                Parent = body,
            })
        end
        local hist = data.history or {}
        if #hist > 1 then
            Create("TextLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 16),
                FontFace = Fonts.Medium,
                Text = "Earlier",
                TextColor3 = Theme.Muted,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = 100,
                ZIndex = 202,
                Parent = body,
            })
            for i = 2, math.min(#hist, 6) do
                local h = hist[i]
                Create("TextLabel", {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 14),
                    FontFace = Fonts.Regular,
                    Text = string.format("%s  -  %s", tostring(h.build or "?"), Library:TimeAgo(h.published)),
                    TextColor3 = Theme.Muted,
                    TextSize = 10,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    LayoutOrder = 100 + i,
                    ZIndex = 202,
                    Parent = body,
                })
            end
        end
    end)

    lineButton(card, 18, 386, 120, 30, "Refresh", false, function()
        overlay:Destroy()
        Library:Updates(opts)
    end)
    lineButton(card, 358, 386, 84, 30, "Close", true, function()
        overlay:Destroy()
    end)
    return overlay
end

do
    local REPORT_TICKET_FILE = Library.Folder .. "/reports.json"
    local REPORT_CACHE = { build = nil, game = nil }

    local function trim(text)
        return (tostring(text or ""):gsub("^%s+", ""):gsub("%s+$", ""))
    end

    local function reportKey()
        if not (FS and FS.available and FS.readfile) then
            return ""
        end
        local ok, saved = pcall(FS.readfile, KEY_FILE)
        if ok and type(saved) == "string" then
            return trim(saved)
        end
        return ""
    end

    local function readTickets()
        if not (FS and FS.available and FS.readfile and FS.isfile) then
            return {}
        end
        local ok, body = pcall(function()
            if FS.isfile(REPORT_TICKET_FILE) then
                return FS.readfile(REPORT_TICKET_FILE)
            end
        end)
        if ok and type(body) == "string" and body ~= "" then
            local decoded, parsed = pcall(HttpService.JSONDecode, HttpService, body)
            if decoded and type(parsed) == "table" then
                return parsed
            end
        end
        return {}
    end

    local function writeTickets(tickets)
        if not (FS and FS.available and FS.writefile) then
            return
        end
        local ok, encoded = pcall(HttpService.JSONEncode, HttpService, tickets)
        if ok and type(encoded) == "string" then
            pcall(FS.writefile, REPORT_TICKET_FILE, encoded)
        end
    end

    local function siteBase()
        local site = Library.Context and Library.Context.Site
        if type(site) ~= "string" or site == "" then
            site = "https://line.pastebdn.workers.dev"
        end
        return (site:gsub("/+$", ""))
    end

    local function reportBuild()
        if REPORT_CACHE.build then
            return REPORT_CACHE.build
        end
        local ok, data = Library:_httpJson(siteBase() .. "/api/version", "GET")
        local build = ok and data and tostring(data.build or "") or ""
        if build == "" then
            build = tostring((Library.Module and Library.Module.Version) or "unknown")
        end
        REPORT_CACHE.build = build
        return build
    end

    local function reportBuildCached()
        if REPORT_CACHE.build then
            return REPORT_CACHE.build
        end
        return tostring((Library.Module and Library.Module.Version) or "unknown")
    end

    local function reportExecutor()
        local mod = Library.Module
        local name = mod and tostring(mod.Executor or "") or ""
        if name == "" then
            local ident = envFunction("identifyexecutor") or envFunction("getexecutor")
            if ident then
                local ok, value = pcall(ident)
                if ok and type(value) == "string" then
                    name = value
                end
            end
        end
        return name ~= "" and name:sub(1, 40) or "unknown"
    end

    local function reportGame()
        if REPORT_CACHE.game then
            return REPORT_CACHE.game
        end
        local name = ""
        local ok, info = pcall(function()
            return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
        end)
        if ok and type(info) == "table" and type(info.Name) == "string" and info.Name ~= "" then
            name = info.Name
        end
        if name == "" and Library.Context and type(Library.Context.Game) == "string" then
            name = Library.Context.Game
        end
        if name == "" and Library.Module then
            name = tostring(Library.Module.Name or "")
        end
        REPORT_CACHE.game = name
        return name
    end

    local function fmtRemaining(seconds)
        seconds = math.max(0, math.floor(tonumber(seconds) or 0))
        if seconds <= 0 then
            return "expired"
        end
        local h = math.floor(seconds / 3600)
        local m = math.floor((seconds % 3600) / 60)
        if h >= 24 then
            return string.format("%dd %dh", math.floor(h / 24), h % 24)
        end
        return string.format("%dh %dm", h, m)
    end

    local function reportBlock(ticket, kind, gameName, title, details, contact)
        local key = reportKey()
        local trace = ENV.LINE_LAST_ERROR
        local rows = {
            "<<<LINE-CRITICAL>>>",
            "ticket: " .. (ticket ~= "" and ticket or "unsent"),
            "kind: " .. kind,
            "game: " .. gameName,
            "build: " .. reportBuildCached(),
            "placeId: " .. tostring(game.PlaceId),
            "executor: " .. reportExecutor(),
            "user: " .. (LocalPlayer and tostring(LocalPlayer.Name) or ""),
            "key: " .. (key ~= "" and key or "none"),
            "title: " .. title,
            "details: " .. (tostring(details):gsub("\n", " | ")),
            "contact: " .. (contact ~= "" and contact or "-"),
            "trace: " .. (type(trace) == "string" and trace:sub(1, 300) or "-"),
            "<<<END>>>",
        }
        return table.concat(rows, "\n")
    end

    function Library:_buildReportTab(window)
        local tab = window:Tab({
            Name = "Report",
            Icon = "clipboard",
            Description = "Bugs, ideas and key rewards.",
        })

        local bugSection = tab:Section({ Name = "Report a problem", Icon = "triangle-alert", Side = "Left" })
        local mineSection = tab:Section({ Name = "My reports", Icon = "list", Side = "Right" })

        local kindPicker = bugSection:Segmented({
            Name = "Type",
            Description = "Bugs pay +1 day, adopted ideas pay +3 days.",
            Options = { "Bug", "Suggestion" },
            Default = "Bug",
        })

        local gameField = bugSection:Input({
            Name = "Game",
            Description = "Detected from the place you are in.",
            Default = "",
            Placeholder = "Build an Ant Empire",
        })
        task.spawn(function()
            local detected = reportGame()
            if detected == "" then
                detected = (Library.Context and Library.Context.Game) or ""
            end
            if detected ~= "" and trim(gameField:Get()) == "" then
                gameField:Set(detected, true)
            end
        end)
        local titleField = bugSection:Input({
            Name = "Title",
            Description = "One line that names the problem.",
            Placeholder = "Auto sell spams NotEnoughFood",
            MaxLength = 120,
        })
        local detailsField = bugSection:Input({
            Name = "What happened",
            Description = "Steps, expected result, what you saw.",
            Placeholder = "1. Turn on auto sell\n2. Wait with 0 food\n3. Console floods with errors",
            Multiline = true,
            Height = 92,
        })
        local contactField = bugSection:Input({
            Name = "Discord (optional)",
            Placeholder = "name or invite",
            MaxLength = 80,
        })

        local statusLabel = bugSection:Label({ Name = "Status", Value = "idle" })

        local LAST_TICKET = ""

        bugSection:Button({
            Name = "Send report",
            Icon = "upload",
            Style = "Primary",
            Callback = function()
                local key = reportKey()
                if key == "" then
                    Library:Notify({
                        Title = "Key missing",
                        Content = "Enter a Line key first, then report.",
                        Icon = "triangle-alert",
                        Type = "warning",
                        Duration = 4,
                    })
                    return
                end
                local gameName = trim(gameField:Get())
                local title = trim(titleField:Get())
                local details = trim(detailsField:Get())
                if #gameName < 2 then
                    statusLabel:Set("game name too short")
                    return
                end
                if #title < 4 then
                    statusLabel:Set("title too short")
                    return
                end
                if #details < 12 then
                    statusLabel:Set("describe it a little more")
                    return
                end
                statusLabel:Set("sending...")
                local kind = kindPicker:Get() == "Suggestion" and "idea" or "bug"
                task.spawn(function()
                    local trace = ENV.LINE_LAST_ERROR
                    local ok, result = Library:_httpJson(siteBase() .. "/api/report", "POST", {
                        kind = kind,
                        game = gameName,
                        title = title,
                        details = details,
                        contact = contactField:Get(),
                        key = key,
                        user = LocalPlayer and tostring(LocalPlayer.Name) or "",
                        build = reportBuild(),
                        placeId = tostring(game.PlaceId),
                        executor = reportExecutor(),
                        trace = type(trace) == "string" and trace:sub(1, 300) or "",
                    })
                    if not (ok and result and result.id) then
                        statusLabel:Set("send failed, try again")
                        Library:Notify({
                            Title = "Report failed",
                            Content = "Could not reach the report service.",
                            Icon = "circle-x",
                            Type = "error",
                            Duration = 4,
                        })
                        return
                    end
                    LAST_TICKET = tostring(result.id)
                    local tickets = readTickets()
                    tickets[LAST_TICKET] = {
                        id = LAST_TICKET,
                        title = title,
                        kind = kindPicker:Get(),
                        status = "pending",
                        created = os.time(),
                        notified = false,
                    }
                    writeTickets(tickets)
                    if result.duplicate then
                        statusLabel:Set(LAST_TICKET .. " already filed")
                        Library:Notify({
                            Title = "Already reported",
                            Content = "Ticket " .. LAST_TICKET .. " is open. Your report was counted.",
                            Icon = "copy",
                            Type = "info",
                            Duration = 5,
                        })
                    else
                        statusLabel:Set(LAST_TICKET .. " sent")
                        Library:Notify({
                            Title = "Report sent",
                            Content = "Ticket " .. LAST_TICKET .. ". Approval adds time to your key.",
                            Icon = "check",
                            Type = "success",
                            Duration = 5,
                        })
                    end
                    titleField:Set("", true)
                    detailsField:Set("", true)
                end)
            end,
        })

        bugSection:Button({
            Name = "Copy critical report for Vyr",
            Icon = "copy",
            Callback = function()
                local kind = kindPicker:Get() == "Suggestion" and "idea" or "bug"
                local block = reportBlock(LAST_TICKET, kind, trim(gameField:Get()), trim(titleField:Get()),
                    trim(detailsField:Get()), trim(contactField:Get()))
                local copy = envFunction("setclipboard")
                if copy then
                    local ok = pcall(copy, block)
                    Library:Notify({
                        Title = ok and "Copied" or "Copy failed",
                        Content = ok and "Paste it to Vyr. It carries the ticket, build and trace."
                            or "Clipboard unavailable in this executor.",
                        Icon = ok and "check" or "triangle-alert",
                        Type = ok and "success" or "warning",
                        Duration = 5,
                    })
                    if ok then
                        return
                    end
                end
                Library:Notify({
                    Title = "Critical block",
                    Content = block,
                    Icon = "clipboard",
                    Type = "info",
                    Duration = 12,
                })
            end,
        })

        local diagnostics = mineSection:KeyValue({
            Name = "Diagnostics",
            Rows = {
                { Key = "Build", Value = tostring((Library.Module and Library.Module.Version) or "unknown"), Copy = true },
                { Key = "Place", Value = tostring(game.PlaceId), Copy = true },
                { Key = "Executor", Value = reportExecutor(), Copy = true },
                { Key = "Key", Value = reportKey() ~= "" and reportKey() or "none", Copy = true },
            },
        })

        local keyLabel = mineSection:Label({ Name = "Key", Value = "checking..." })
        local mineList = mineSection:Paragraph({
            Title = "Tickets",
            Content = "No reports filed yet.",
        })

        local function describeTickets(rows, keyInfo)
            if keyInfo then
                local owner = keyInfo.owner and keyInfo.owner ~= "" and (" · @" .. keyInfo.owner) or ""
                keyLabel:Set(fmtRemaining(keyInfo.expiresIn) .. owner)
            end
            if not rows or #rows == 0 then
                mineList:Set("No reports filed yet.", "Tickets")
                return
            end
            local lines = {}
            for _, rec in ipairs(rows) do
                local tag = "pending"
                if rec.status == "approved" then
                    tag = "approved +" .. tostring(math.floor((tonumber(rec.reward) or 0) / 86400)) .. "d"
                elseif rec.status == "rejected" then
                    tag = "closed"
                end
                local note = rec.status == "rejected" and rec.note and rec.note ~= "" and (" — " .. rec.note) or ""
                table.insert(lines, string.format("<b>%s</b> · %s · %s%s", tostring(rec.id), tag, tostring(rec.title), note))
            end
            mineList:Set(table.concat(lines, "\n"), "Tickets")
        end

        local function checkMine()
            local key = reportKey()
            if key == "" then
                keyLabel:Set("no key")
                return
            end
            local ok, data = Library:_httpJson(
                siteBase() .. "/api/report/mine?key=" .. HttpService:UrlEncode(key), "GET")
            if not (ok and data) then
                keyLabel:Set("service unreachable")
                return
            end
            local tickets = readTickets()
            for _, rec in ipairs(data.reports or {}) do
                local saved = tickets[rec.id]
                if saved and saved.notified ~= true then
                    if rec.status == "approved" then
                        saved.notified = true
                        saved.status = "approved"
                        Library:Notify({
                            Title = "Report approved",
                            Content = "Ticket " .. tostring(rec.id) .. " · +"
                                .. tostring(math.floor((tonumber(rec.reward) or 0) / 86400))
                                .. "d added to your key.",
                            Icon = "shield-check",
                            Type = "success",
                            Duration = 7,
                        })
                    elseif rec.status == "rejected" then
                        saved.notified = true
                        saved.status = "rejected"
                        Library:Notify({
                            Title = "Report closed",
                            Content = (rec.note and rec.note ~= "") and rec.note
                                or ("Ticket " .. tostring(rec.id) .. " was not accepted."),
                            Icon = "circle-x",
                            Type = "warning",
                            Duration = 7,
                        })
                    end
                elseif not saved then
                    tickets[rec.id] = {
                        id = rec.id,
                        title = rec.title,
                        status = rec.status,
                        created = rec.created,
                        notified = true,
                    }
                end
            end
            writeTickets(tickets)
            describeTickets(data.reports, data)
        end

        mineSection:Button({
            Name = "Check now",
            Icon = "refresh-cw",
            Callback = function()
                task.spawn(function()
                    pcall(checkMine)
                end)
            end,
        })

        mineSection:Paragraph({
            Title = "How rewards work",
            Content = "A verified bug adds 1 day to the key you already hold. An adopted suggestion adds 3 days. "
                .. "Approved critical reports add 7. No key replacement — the same key simply lasts longer.",
        })

        task.spawn(function()
            pcall(checkMine)
            local ok, build = pcall(reportBuild)
            if ok then
                pcall(diagnostics.Set, diagnostics, "Build", tostring(build))
            end
            while not Library.Unloaded do
                task.wait(60)
                if Library.Unloaded then
                    break
                end
                pcall(checkMine)
            end
        end)

        return tab
    end

    local function hasReportTab(window)
        for _, tab in ipairs(window.Tabs or {}) do
            if tostring(tab.Name or ""):lower() == "report" then
                return true
            end
        end
        return false
    end

    local function attach(window)
        if Library.ReportTab == false or not window or window._reportTab then
            return
        end
        window._reportTab = true
        if hasReportTab(window) then
            return
        end
        Library:_buildReportTab(window)
    end

    local function hasTabNamed(window, want)
        for _, tab in ipairs(window.Tabs or {}) do
            if tostring(tab.Name or ""):lower() == want then
                return true
            end
        end
        return false
    end

    local function attachConfig(window)
        if Library.ConfigTab == false or not window or window._configTab then
            return
        end
        window._configTab = true
        if hasTabNamed(window, "config") then
            return
        end
        local tab = window:Tab({
            Name = "Config",
            Icon = "settings",
            Description = "Save, load and share your settings.",
        })
        pcall(function()
            Library:AddConfigSections(tab)
        end)
        pcall(function()
            Library:AddThemeSection(tab)
        end)
        return tab
    end

    local baseCreateWindow = Library.CreateWindow
    function Library:CreateWindow(config)
        local window = baseCreateWindow(self, config)
        if not window or type(window.Tab) ~= "function" then
            return window
        end
        if config and (config.ReportTab == false or config.NoReport == true) then
            return window
        end
        local state = { seq = 0, added = false }
        local function schedule()
            if state.added then
                return
            end
            state.seq = state.seq + 1
            local mine = state.seq
            task.delay(0.25, function()
                if state.added or mine ~= state.seq then
                    return
                end
                state.added = true
                pcall(attach, window)
                pcall(attachConfig, window)
            end)
        end
        local baseTab = window.Tab
        window.Tab = function(self2, options)
            local tab = baseTab(self2, options)
            pcall(schedule)
            return tab
        end
        pcall(schedule)
        return window
    end
end

do
    local ANNOUNCE_SEEN = Library.Folder .. "/announce-seen.txt"

    local TONES = {
        info = { accent = Color3.fromRGB(232, 178, 58), icon = "sparkles" },
        success = { accent = Color3.fromRGB(120, 200, 140), icon = "circle-check" },
        warning = { accent = Color3.fromRGB(232, 178, 58), icon = "triangle-alert" },
        danger = { accent = Color3.fromRGB(242, 120, 120), icon = "circle-x" },
    }

    local function seenId()
        if not (FS and FS.available and FS.readfile and FS.isfile) then
            return ""
        end
        local ok, body = pcall(function()
            if FS.isfile(ANNOUNCE_SEEN) then
                return FS.readfile(ANNOUNCE_SEEN)
            end
        end)
        if ok and type(body) == "string" then
            return (body:gsub("%s+$", ""))
        end
        return ""
    end

    local function rememberId(id)
        if not (FS and FS.available and FS.writefile) then
            return
        end
        pcall(FS.writefile, ANNOUNCE_SEEN, tostring(id))
    end

    local current = nil

    Library.AnnounceDuration = 7

    local holder = Create("Frame", {
        Name = "LineAnnouncerStack",
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -12, 0, 12),
        Size = UDim2.fromOffset(360, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        ZIndex = 239,
        Parent = ScreenGui,
    }, { List(8, Enum.FillDirection.Vertical, Enum.HorizontalAlignment.Right) })
    holder:SetAttribute("NoGradient", true)
    Library.AnnouncerStack = holder

    local activeCards = 0

    local function nativeNotify(title, text, duration)
        local ok = pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = tostring(title),
                Text = tostring(text),
                Duration = tonumber(duration) or 5,
            })
        end)
        return ok
    end

    function Library:Announce(opts)
        opts = opts or {}
        local tone = TONES[opts.tone or opts.Tone or "info"] or TONES.info
        local duration = tonumber(opts.duration or opts.Duration) or Library.AnnounceDuration
        local title = tostring(opts.title or opts.Title or "Announcement")
        local text = tostring(opts.body or opts.Body or "")

        if opts.native == true then
            nativeNotify(title, text, duration)
            return nil
        end

        local card = Create("Frame", {
            Name = "LineAnnounce",
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Theme.Elevated,
            ClipsDescendants = true,
            Position = UDim2.fromOffset(48, 0),
            BackgroundTransparency = 0.04,
            ZIndex = 240,
            Parent = holder,
        }, { Corner(Radius.lg), Stroke(Theme.Stroke, 0.25) })
        card:SetAttribute("NoGradient", true)
        activeCards += 1

        Create("Frame", {
            Size = UDim2.new(0, 2, 1, 0),
            BackgroundColor3 = tone.accent,
            BorderSizePixel = 0,
            ZIndex = 242,
            Parent = card,
        })

        local body = Create("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            ZIndex = 241,
            Parent = card,
        }, { Padding(11, 36, 11, 14), List(2) })

        Icon(tone.icon, {
            Position = UDim2.fromOffset(0, 1),
            Size = UDim2.fromOffset(14, 14),
            ImageColor3 = tone.accent,
            ZIndex = 243,
            Parent = body,
        })

        Label({
            Text = title,
            FontFace = Fonts.SemiBold,
            TextSize = 13,
            TextColor3 = Theme.Text,
            Position = UDim2.fromOffset(21, -1),
            Size = UDim2.new(1, -21, 0, 16),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            ZIndex = 243,
            Parent = body,
        })

        if text ~= "" then
            Label({
                Text = text,
                TextSize = 12,
                TextColor3 = Theme.SubText,
                Position = UDim2.fromOffset(21, 15),
                Size = UDim2.new(1, -21, 0, 15),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTruncate = Enum.TextTruncate.AtEnd,
                ZIndex = 243,
                Parent = body,
            })
        end

        local closing = false
        local function close(remember)
            if closing or not card.Parent then
                return
            end
            closing = true
            if remember then
                rememberId(tostring(opts.id or opts.Id or ""))
            end
            Tween(card, TweenInfo.new(Dur.fast, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Position = UDim2.fromOffset(48, 0),
                BackgroundTransparency = 1,
            })
            task.delay(Dur.fast + 0.05, function()
                if card.Parent then
                    card:Destroy()
                end
                activeCards = math.max(0, activeCards - 1)
            end)
        end

        local closeBtn = Create("TextButton", {
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.new(1, -7, 0, 7),
            Size = UDim2.fromOffset(20, 20),
            BackgroundColor3 = Theme.Hover,
            BackgroundTransparency = 1,
            Text = "",
            AutoButtonColor = false,
            ZIndex = 244,
            Parent = card,
        }, { Corner(Radius.sm) })
        Icon("x", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(10, 10),
            ImageColor3 = Theme.Muted,
            ZIndex = 245,
            Parent = closeBtn,
        })
        closeBtn.MouseEnter:Connect(function()
            closeBtn.BackgroundTransparency = 0.55
        end)
        closeBtn.MouseLeave:Connect(function()
            closeBtn.BackgroundTransparency = 1
        end)
        closeBtn.Activated:Connect(function()
            close(true)
        end)

        Tween(card, TweenInfo.new(Dur.smooth, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Position = UDim2.fromOffset(0, 0),
        })

        local remaining = duration
        local paused = false
        task.spawn(function()
            while card.Parent and not closing do
                task.wait(0.1)
                if not paused then
                    remaining -= 0.1
                    if remaining <= 0 then
                        break
                    end
                end
            end
            if card.Parent and not closing then
                close(false)
            end
        end)
        card.MouseEnter:Connect(function()
            paused = true
            Tween(card, FAST, { BackgroundColor3 = Theme.Surface })
        end)
        card.MouseLeave:Connect(function()
            paused = false
            Tween(card, FAST, { BackgroundColor3 = Theme.Elevated })
        end)

        return card
    end

    function Library:_announceFetch()
        local ctx = Library.Context or {}
        local site = (ctx.Site or "https://line.pastebdn.workers.dev"):gsub("/+$", "")
        local ok, data = Library:_httpJson(site .. "/api/announce?v=" .. tostring(os.time()), "GET")
        if not ok or type(data) ~= "table" or not data.id or data.id == "" then
            return
        end
        if data.id == seenId() then
            return
        end
        Library:Announce({ id = data.id, title = data.title, body = data.body, tone = data.tone })
    end

    task.spawn(function()
        while not Library.Unloaded do
            task.wait(600)
            if not Library.Unloaded then
                pcall(function()
                    Library:_announceFetch()
                end)
            end
        end
    end)

    local baseCreateWindow2 = Library.CreateWindow
    function Library:CreateWindow(config)
        local window = baseCreateWindow2(self, config)
        if config and config.Announce == false then
            return window
        end
        task.spawn(function()
            pcall(function()
                Library:_announceFetch()
            end)
        end)
        return window
    end
end

do
    local PROMO_SEEN = Library.Folder .. "/promo-seen.txt"
    local PROMO_INVITE = "discord.gg/2AWWZzkqS2"
    local GREEN = Color3.fromRGB(120, 200, 140)

    local function promoSeen()
        if not (FS and FS.available and FS.readfile and FS.isfile) then
            return ""
        end
        local ok, body = pcall(function()
            if FS.isfile(PROMO_SEEN) then
                return FS.readfile(PROMO_SEEN)
            end
        end)
        if ok and type(body) == "string" then
            return (body:gsub("%s+$", ""))
        end
        return ""
    end

    local function promoRemember(id)
        if not (FS and FS.available and FS.writefile) then
            return
        end
        pcall(FS.writefile, PROMO_SEEN, tostring(id))
    end

    local function clock(seconds)
        local s = math.max(0, math.floor(tonumber(seconds) or 0))
        local h = math.floor(s / 3600)
        local m = math.floor((s % 3600) / 60)
        if h > 0 then
            return string.format("%dh %02dm", h, m)
        end
        return string.format("%dm", m)
    end

    local function copyText(text)
        local fn = envFunction("setclipboard") or envFunction("toclipboard")
        if fn then
            return pcall(fn, tostring(text))
        end
        return false
    end

    local modal = nil

    local function buildModal(data)
        if modal and modal.Parent then
            modal:Destroy()
        end

        local scrim = Create("TextButton", {
            Name = "LinePromo",
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 0.5,
            Text = "",
            AutoButtonColor = false,
            BorderSizePixel = 0,
            ZIndex = 400,
            Parent = ScreenGui,
        })

        local card = Create("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(404, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Theme.Surface,
            BorderSizePixel = 0,
            ZIndex = 401,
            Parent = scrim,
        }, { Corner(Radius.xl), Stroke(Theme.Stroke, 0.2), Padding(20, 20, 20, 20) })

        local scale = Create("UIScale", { Scale = 0.94, Parent = card })

        Create("Frame", {
            Size = UDim2.new(1, 0, 0, 2),
            Position = UDim2.fromOffset(0, -20),
            BackgroundColor3 = GREEN,
            BorderSizePixel = 0,
            ZIndex = 402,
            Parent = card,
        })

        local head = Create("Frame", {
            Size = UDim2.new(1, 0, 0, 38),
            BackgroundTransparency = 1,
            ZIndex = 402,
            Parent = card,
        })

        Icon("sparkles", {
            Size = UDim2.fromOffset(17, 17),
            Position = UDim2.fromOffset(0, 10),
            ImageColor3 = GREEN,
            ZIndex = 403,
            Parent = head,
        })

        Label({
            Text = "free key",
            FontFace = Fonts.SemiBold,
            TextSize = 17,
            Position = UDim2.fromOffset(25, 0),
            Size = UDim2.new(1, -60, 1, 0),
            ZIndex = 403,
            Parent = head,
        })

        local close = Create("TextButton", {
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, 0, 0.5, 0),
            Size = UDim2.fromOffset(26, 26),
            BackgroundColor3 = Theme.Elevated,
            Text = "",
            AutoButtonColor = false,
            ZIndex = 403,
            Parent = head,
        }, { Corner(Radius.sm) })
        Icon("x", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(13, 13),
            ImageColor3 = Theme.Muted,
            ZIndex = 404,
            Parent = close,
        })

        Label({
            Text = "Type key in #general on the Line Discord and the bot DMs you a key.\n10 hours each, one per person.",
            FontFace = Fonts.Regular,
            TextSize = 13,
            TextColor3 = Theme.SubText,
            TextWrapped = true,
            TextYAlignment = Enum.TextYAlignment.Top,
            Size = UDim2.new(1, 0, 0, 40),
            Position = UDim2.fromOffset(0, 44),
            ZIndex = 403,
            Parent = card,
        })

        local invite = Create("Frame", {
            Size = UDim2.new(1, 0, 0, 34),
            Position = UDim2.fromOffset(0, 92),
            BackgroundColor3 = Theme.Elevated,
            ZIndex = 403,
            Parent = card,
        }, { Corner(Radius.md), Padding(0, 10, 0, 12) })

        Label({
            Text = PROMO_INVITE,
            FontFace = Fonts.Medium,
            TextSize = 13,
            TextColor3 = Theme.Text,
            Size = UDim2.new(1, -74, 1, 0),
            ZIndex = 404,
            Parent = invite,
        })

        local copy = Create("TextButton", {
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, 0, 0.5, 0),
            Size = UDim2.fromOffset(62, 24),
            BackgroundColor3 = Theme.Hover,
            Text = "",
            AutoButtonColor = false,
            ZIndex = 404,
            Parent = invite,
        }, { Corner(Radius.sm) })
        local copyLabel = Label({
            Text = "copy",
            FontFace = Fonts.Medium,
            TextSize = 12,
            TextColor3 = Theme.Text,
            TextXAlignment = Enum.TextXAlignment.Center,
            Size = UDim2.fromScale(1, 1),
            ZIndex = 405,
            Parent = copy,
        })

        local left = Label({
            Text = "window closes in " .. clock(data.secondsLeft),
            FontFace = Fonts.Regular,
            TextSize = 12,
            TextColor3 = Theme.Muted,
            Size = UDim2.new(1, -130, 0, 18),
            Position = UDim2.fromOffset(0, 134),
            ZIndex = 403,
            Parent = card,
        })

        local primary = Create("TextButton", {
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.new(1, 0, 0, 132),
            Size = UDim2.fromOffset(118, 28),
            BackgroundColor3 = GREEN,
            Text = "",
            AutoButtonColor = false,
            ZIndex = 404,
            Parent = card,
        }, { Corner(Radius.md) })
        Label({
            Text = "copy invite",
            FontFace = Fonts.SemiBold,
            TextSize = 12,
            TextColor3 = Color3.fromRGB(9, 20, 12),
            TextXAlignment = Enum.TextXAlignment.Center,
            Size = UDim2.fromScale(1, 1),
            ZIndex = 405,
            Parent = primary,
        })

        local function shutdown()
            if modal and modal.Parent then
                modal:Destroy()
            end
            modal = nil
        end

        local function doCopy()
            if copyText("https://" .. PROMO_INVITE) then
                copyLabel.Text = "copied"
                task.delay(1.4, function()
                    if copyLabel and copyLabel.Parent then
                        copyLabel.Text = "copy"
                    end
                end)
            else
                copyLabel.Text = "no clip"
            end
        end

        copy.MouseButton1Click:Connect(doCopy)
        primary.MouseButton1Click:Connect(doCopy)
        close.MouseButton1Click:Connect(shutdown)
        scrim.MouseButton1Click:Connect(function()
            shutdown()
        end)

        modal = scrim
        Tween(scale, FAST, { Scale = 1 })

        task.spawn(function()
            local remaining = tonumber(data.secondsLeft) or 0
            while modal == scrim and modal.Parent and remaining > 0 and not Library.Unloaded do
                task.wait(1)
                remaining -= 1
                if left and left.Parent then
                    left.Text = "window closes in " .. clock(remaining)
                end
            end
            if modal == scrim then
                shutdown()
            end
        end)

        return scrim
    end

    function Library:Promo(opts)
        opts = opts or {}
        if opts.state then
            return buildModal(opts.state)
        end
        local ctx = Library.Context or {}
        local site = (ctx.Site or "https://line.pastebdn.workers.dev"):gsub("/+$", "")
        local ok, data = Library:_httpJson(site .. "/api/promo/state?v=" .. tostring(os.time()), "GET")
        if not ok or type(data) ~= "table" or not data.active then
            return nil
        end
        return buildModal(data)
    end

    function Library:_promoFetch()
        if Library.PromoDismissed then
            return
        end
        local ctx = Library.Context or {}
        local site = (ctx.Site or "https://line.pastebdn.workers.dev"):gsub("/+$", "")
        local ok, data = Library:_httpJson(site .. "/api/promo/state?v=" .. tostring(os.time()), "GET")
        if not ok or type(data) ~= "table" or not data.active then
            return
        end
        local stamp = tostring(data.startedAt or data.endsAt or "") .. "|v2"
        if stamp ~= "|v2" and stamp == promoSeen() then
            return
        end

        local built = pcall(buildModal, data)
        if built then
            promoRemember(stamp)
        end
        return built
    end

    local baseCreateWindow3 = Library.CreateWindow
    function Library:CreateWindow(config)
        local window = baseCreateWindow3(self, config)
        if config and (config.Promo == false or config.NoPromo == true) then
            return window
        end
        task.spawn(function()
            pcall(function()
                Library:_promoFetch()
            end)
        end)
        return window
    end

    local baseKeySystem = Library.KeySystem
    function Library:KeySystem(options)
        task.spawn(function()
            pcall(function()
                Library:_promoFetch()
            end)
        end)
        return baseKeySystem(self, options)
    end
end

ENV.LINE = Library

return Library
]])()
end)
ENV.LINE_LIB_ONLY = prevLibOnly
ENV.LINE_HUB = prevHub
assert(loadedLib and type(Library) == "table", "Line interface failed to load: " .. tostring(Library))
ENV.LINE_HUB = { Alive = true, Pending = true }
-- the obfuscated modules look these names up at runtime; keep them mirrored
ENV.NAIKO = Library
ENV.NAIKO_HUB = ENV.LINE_HUB

local function cacheImage(name, url)
    local custom = ENV.getcustomasset or (typeof(getcustomasset) == "function" and getcustomasset)
    local write = ENV.writefile or (typeof(writefile) == "function" and writefile)
    local read = ENV.readfile or (typeof(readfile) == "function" and readfile)
    local exists = ENV.isfile or (typeof(isfile) == "function" and isfile)
    if not (custom and write and read and exists) then
        return nil
    end
    local folder = "LINE/cache"
    local makeFolder = ENV.makefolder or (typeof(makefolder) == "function" and makefolder)
    local isFolder = ENV.isfolder or (typeof(isfolder) == "function" and isfolder)
    if makeFolder and isFolder then
        pcall(function()
            if not isFolder("LINE") then makeFolder("LINE") end
            if not isFolder(folder) then makeFolder(folder) end
        end)
    end
    local path = folder .. "/" .. name .. ".jpg"
    local cached = false
    if exists(path) then
        local ok, head = pcall(read, path)
        cached = ok and type(head) == "string" and head:sub(1, 3) == "\255\216\255"
    end
    if not cached then
        local ok, body = pcall(function()
            return game:HttpGet(API .. url)
        end)
        if not ok or type(body) ~= "string" or body:sub(1, 3) ~= "\255\216\255" then
            return nil
        end
        if not pcall(write, path, body) then
            return nil
        end
    end
    local ok, asset = pcall(custom, path)
    if ok and type(asset) == "string" and asset ~= "" then
        return asset
    end
    return nil
end
local Window = Library:CreateWindow({ Title = "Line Hub", Subtitle = "Multi game · v2", Logo = "peak" })
local GamesTab = Window:Tab({ Name = "Games", Icon = "gamepad-2", Description = tostring(#CATALOG) .. " games" .. (DETECTED and (" · " .. DETECTED.name) or "") })
local SettingsTab = Window:Tab({ Name = "Settings", Icon = "settings", Description = "Key and hub options." })
local MODULES = {
    ["99-nights-in-the-forest"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-99-nights.lua",
    ["backrooms-company"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-backrooms-company.lua",
    ["beat-the-anime-boss"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-beat-the-anime-boss.lua",
    ["blue-lock-farm"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-blue-lock-farm.lua",
    ["break-and-steal-an-egg"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-break-and-steal-an-egg.lua",
    ["build-an-ant-empire"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-build-an-ant-empire.lua",
    ["carry-heavy-eggs"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-carry-heavy-eggs.lua",
    ["catch-dragons-to-defend"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-catch-dragons-to-defend.lua",
    ["clicker-simulator"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-clicker-simulator.lua",
    ["clone-to-steal-eggs"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-clone-to-steal-eggs.lua",
    ["dangerous-night"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-dangerous-night.lua",
    ["deadly-delivery"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-deadly-delivery.lua",
    ["deep-fishing"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-deep-fishing.lua",
    ["defeat-anime-rng"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-defeat-anime-rng.lua",
    ["dig-into-secrets"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-dig-into-secrets.lua",
    ["drill-to-earth"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-drill-to-earth.lua",
    ["dungeon-lootr"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-dungeon-lootr.lua",
    ["dungeon-quest-reborn"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-dungeon-quest-reborn.lua",
    ["dungeons-tower"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-dungeons-tower.lua",
    ["evade"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-evade.lua",
    ["farm-industry"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-farm-industry.lua",
    ["fish-an-anime-rng"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-fish-an-anime-rng.lua",
    ["fish-on"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-fish-on.lua",
    ["flower-shop"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-flower-shop.lua",
    ["forest-market"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-forest-market.lua",
    ["heavyweight-fishing"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-heavyweight-fishing.lua",
    ["hellhole"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-hellhole.lua",
    ["idle-mafia"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-idle-mafia.lua",
    ["loot-up"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-loot-up.lua",
    ["mine-antarctica"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-mine-antarctica.lua",
    ["mine-it"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-mine-it.lua",
    ["mrbeast-island-escape"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-mrbeast-island-escape.lua",
    ["pack-a-brainrot-card"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-pack-a-brainrot-card.lua",
    ["pets-universe"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-pets-universe.lua",
    ["poly-loot"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-poly-loot.lua",
    ["pop-collect"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-pop-collect.lua",
    ["pull-a-sword"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-pull-a-sword.lua",
    ["race-horses"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-race-horses.lua",
    ["sell-ores"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-sell-ores.lua",
    ["shogun-s-reign"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-shogun-s-reign.lua",
    ["steal-a-dragon-egg"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-steal-a-dragon-egg.lua",
    ["steal-a-seed"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-steal-a-seed.lua",
    ["steal-an-anime-egg"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-steal-an-anime-egg.lua",
    ["steal-from-the-rich"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-steal-from-the-rich.lua",
    ["storage-hunters"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-storage-hunters.lua",
    ["super-treehouse-tycoon-2"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-super-treehouse-tycoon-2.lua",
    ["sword-hunter"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-sword-hunter.lua",
    ["the-mimic"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-the-mimic.lua",
    ["unbox-asmr"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/line-unbox-asmr.lua",
    ["sniper"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/sniper.lua",
    ["rivals"] = "https://raw.githubusercontent.com/loloubrawl-gif/line/main/modules" .. "/rivals.lua",
}

local function launch(entry)
    local url = MODULES[entry.id]
    if type(url) ~= "string" then
        Library:Notify({
            Title = "Not in this build",
            Content = tostring(entry.name) .. " is missing from the mirror.",
            Icon = "triangle-alert",
            Type = "warning",
            Duration = 4,
        })
        return
    end
    local ok, err = pcall(function()
        local source = game:HttpGet(url)
        assert(type(source) == "string" and #source > 200, "empty module from " .. url)
        local previousGui = Library.ScreenGui
        loadstring(source, "=line:" .. entry.id)()
        task.spawn(function()
            local playerGui = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
            local loaded = false
            for _ = 1, 120 do
                task.wait(0.1)
                if not playerGui then
                    break
                end
                for _, child in ipairs(playerGui:GetChildren()) do
                    if child:IsA("ScreenGui") and child.Name == "LINE" and child ~= previousGui then
                        loaded = true
                        break
                    end
                end
                if loaded then
                    break
                end
            end
            if loaded then
                pcall(function()
                    Library:Unload()
                end)
            end
        end)
    end)
    if not ok then
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Launch failed",
                Text = tostring(err),
                Duration = 5,
            })
        end)
    end
end

local function row(section, entry, index, detected)
    local holder = Instance.new("Frame")
    holder.Name = entry.id
    holder.Size = UDim2.new(1, 0, 0, 46)
    holder.BackgroundColor3 = Color3.fromRGB(16, 17, 20)
    holder.BackgroundTransparency = 0
    holder.BorderSizePixel = 0
    holder.LayoutOrder = 100 + index
    holder.Parent = section.Container
    holder:SetAttribute("NoTheme", true)

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = holder

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Transparency = 0.92
    stroke.Thickness = 1
    stroke.Parent = holder

    local thumb = Instance.new("Frame")
    thumb.Size = UDim2.fromOffset(30, 30)
    thumb.Position = UDim2.fromOffset(8, 8)
    thumb.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
    thumb.BorderSizePixel = 0
    thumb.Parent = holder

    local thumbCorner = Instance.new("UICorner")
    thumbCorner.CornerRadius = UDim.new(0, 6)
    thumbCorner.Parent = thumb

    local image
    if entry.placeId then
        image = Instance.new("ImageLabel")
        image.Size = UDim2.fromScale(1, 1)
        image.BackgroundTransparency = 1
        image.ScaleType = Enum.ScaleType.Crop
        image.Image = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", entry.placeId)
        image.Parent = thumb
        task.delay(1 + (index % 20) * 0.15, function()
            if not image.Parent or image.IsLoaded then
                return
            end
            pcall(function()
                local info = game:GetService("MarketplaceService"):GetProductInfo(entry.placeId)
                local icon = info and info.IconImageAssetId
                if icon and icon > 0 then
                    image.Image = "rbxassetid://" .. tostring(icon)
                end
            end)
        end)
    else
        local asset = cacheImage(entry.id, entry.cover)
        if asset then
            image = Instance.new("ImageLabel")
            image.Size = UDim2.fromScale(1, 1)
            image.BackgroundTransparency = 1
            image.ScaleType = Enum.ScaleType.Crop
            image.Image = asset
            image.Parent = thumb
        end
    end
    if image then
        local mask = Instance.new("UICorner")
        mask.CornerRadius = UDim.new(0, 6)
        mask.Parent = image
    else
        local mark = Instance.new("TextLabel")
        mark.Size = UDim2.fromScale(1, 1)
        mark.BackgroundTransparency = 1
        mark.Text = entry.name:sub(1, 1)
        mark.Font = Enum.Font.GothamBlack
        mark.TextSize = 15
        mark.TextColor3 = Color3.fromRGB(255, 255, 255)
        mark.Parent = thumb
    end

    local label = Instance.new("TextLabel")
    label.Position = UDim2.fromOffset(46, 0)
    label.Size = UDim2.new(1, detected and -212 or -140, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = entry.name
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextTruncate = Enum.TextTruncate.AtEnd
    label.TextColor3 = Color3.fromRGB(235, 238, 242)
    label.Parent = holder

    if detected then
        stroke.Color = Color3.fromRGB(46, 213, 115)
        stroke.Transparency = 0.35
        local badge = Instance.new("TextLabel")
        badge.AnchorPoint = Vector2.new(1, 0.5)
        badge.Position = UDim2.new(1, -88, 0.5, 0)
        badge.Size = UDim2.fromOffset(62, 18)
        badge.BackgroundColor3 = Color3.fromRGB(46, 213, 115)
        badge.Text = "DETECTED"
        badge.Font = Enum.Font.GothamBold
        badge.TextSize = 9
        badge.TextColor3 = Color3.fromRGB(8, 9, 10)
        badge.Parent = holder
        local badgeCorner = Instance.new("UICorner")
        badgeCorner.CornerRadius = UDim.new(0, 9)
        badgeCorner.Parent = badge
    end

    local button = Instance.new("TextButton")
    button.AnchorPoint = Vector2.new(1, 0.5)
    button.Position = UDim2.new(1, -8, 0.5, 0)
    button.Size = UDim2.fromOffset(74, 26)
    button.BackgroundColor3 = Color3.fromRGB(240, 242, 245)
    button.AutoButtonColor = false
    button.Text = "Launch"
    button.Font = Enum.Font.GothamBold
    button.TextSize = 11
    button.TextColor3 = Color3.fromRGB(8, 9, 10)
    button.Parent = holder

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 13)
    buttonCorner.Parent = button

    button.Activated:Connect(function()
        launch(entry)
    end)
    return holder
end

local gamesLeft = GamesTab:Section({ Name = "Game modules", Icon = "layers", Side = "Left", Collapsed = true })
local gamesRight = GamesTab:Section({ Name = "Games continued", Icon = "layers", Side = "Right", Collapsed = true })
local rest = {}
for _, entry in ipairs(CATALOG) do
    if not (DETECTED and entry == DETECTED) then
        table.insert(rest, entry)
    end
end
if DETECTED then
    row(gamesLeft, DETECTED, 0, true)
end
local half = math.ceil(#rest / 2)
for index, entry in ipairs(rest) do
    if index <= half then
        row(gamesLeft, entry, index, false)
    else
        row(gamesRight, entry, index, false)
    end
end
local linkSection = SettingsTab:Section({ Name = "Community", Icon = "users", Side = "Left", Collapsed = true })
linkSection:Button({
    Name = "Copy Discord invite",
    Icon = "copy",
    Callback = function()
        local copy = ENV.setclipboard or (typeof(setclipboard) == "function" and setclipboard)
        local link = "https://discord.gg/b6chFhHnN"
        if copy then
            pcall(copy, link)
            Library:Notify({ Title = "Copied", Content = link, Icon = "check", Type = "success", Duration = 3 })
        else
            Library:Notify({ Title = "Discord", Content = link, Icon = "link", Type = "info", Duration = 5 })
        end
    end,
})

Window:SelectTab(GamesTab)
Library:SetOpen(true)

ENV.LINE_HUB = { Library = Library, Window = Window, Games = CATALOG, Keyed = true, Alive = true }
ENV.NAIKO_HUB = ENV.LINE_HUB

return { ready = true, games = #CATALOG, keyless = true }
