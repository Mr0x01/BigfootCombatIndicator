local C = LibStub("AceAddon-3.0"):NewAddon("CombatIndicator", "AceEvent-3.0",
                                           "AceHook-3.0")
MAX_INDICATOR_COUNT = 6;
COMBAT_INDICATOR_WARNING_RATE = 0.25;
local Current_Indicator_Number = 1;
local config = {spell = 1, leaveCombat = 1, comboPoint = 1, status = 1};
if (GetLocale() == "zhCN") then
    COMBAT_INDICATOR_ENTER_COMBAT = "进入战斗!"
    COMBAT_INDICATOR_LEAVE_COMBAT = "离开战斗!"
    COMBAT_INDICATOR_COMBO_TEXT = "%d 连击";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f = {};
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["MISS"] = "未击中!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["EVADE"] = "闪避!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["DODGE"] = "躲闪!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["PARRY"] = "招架!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["BLOCK"] = "格挡!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["STUN"] = "眩晕!"
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["INTERRUPT"] = "打断!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["IMMUNE"] = "免疫!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["RESIST"] = "抵抗!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["ABSORB"] = "吸收!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66 = {};
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["NONE"] = nil;
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["PHYSICAL"] = "未击中!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["RESIST"] = "抵抗!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["IMMUNE"] = "免疫!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["EVADED"] = "偏斜!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["DODGED"] = "躲闪!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["BLOCKED"] = "格挡!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["TEMPIMMUNE"] = "免疫!";
    CombatIndicator_b79481ac170934000821d225b3f051f1 =
        {
            CombatIndicator_a8858383576d7634cceceaf04a2ddb29 = "(.*)充满恐惧地想要转身逃跑！",
            CombatIndicator_ae27b57da3355d3813132c7a240a3a39 = 0,
            CombatIndicator_9241e39fd6a722e645ec9f43ea6cb401 = "开始逃跑！"
        }
    CombatIndicator_fc5eab31006a7701948f217806bc9f5c = "%s开始施放%s！";
elseif (GetLocale() == "zhTW") then
    COMBAT_INDICATOR_ENTER_COMBAT = "進入戰鬥!"
    COMBAT_INDICATOR_LEAVE_COMBAT = "離開戰鬥!"
    COMBAT_INDICATOR_COMBO_TEXT = "%d 連擊";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f = {};
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["MISS"] = "未擊中!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["EVADE"] = "閃避!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["DODGE"] = "躲閃!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["PARRY"] = "招架!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["BLOCK"] = "格擋!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["STUN"] = "眩暈!"
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["INTERRUPT"] = "打斷!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["IMMUNE"] = "免疫!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["RESIST"] = "抵抗!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["ABSORB"] = "吸收!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66 = {};
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["NONE"] = nil;
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["PHYSICAL"] = "未擊中!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["RESIST"] = "抵抗!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["IMMUNE"] = "免疫!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["EVADED"] = "偏斜!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["DODGED"] = "躲閃!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["BLOCKED"] = "格擋!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["TEMPIMMUNE"] = "免疫!";
    CombatIndicator_b79481ac170934000821d225b3f051f1 =
        {
            CombatIndicator_a8858383576d7634cceceaf04a2ddb29 = "(.*)充满恐惧地想要转身逃跑！",
            CombatIndicator_ae27b57da3355d3813132c7a240a3a39 = 0,
            CombatIndicator_9241e39fd6a722e645ec9f43ea6cb401 = "开始逃跑！"
        }
    CombatIndicator_fc5eab31006a7701948f217806bc9f5c = "%s開始施放%s！";
else
    COMBAT_INDICATOR_ENTER_COMBAT = "Enter Combat!"
    COMBAT_INDICATOR_LEAVE_COMBAT = "Leave Combat!"
    COMBAT_INDICATOR_COMBO_TEXT = "%d Combo";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f = {};
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["MISS"] = "Miss!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["EVADE"] = "Evade!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["DODGE"] = "Dodge!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["PARRY"] = "Parry!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["BLOCK"] = "Block!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["STUN"] = "Stun!"
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["INTERRUPT"] = "Interrupt!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["IMMUNE"] = "Immune!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["RESIST"] = "Resist!";
    CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["ABSORB"] = "Absorb!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66 = {};
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["NONE"] = nil;
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["PHYSICAL"] = "Miss!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["RESIST"] = "Resist!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["IMMUNE"] = "Immune!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["EVADED"] = "Evade!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["DODGED"] = "Dodge!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["BLOCKED"] = "Blocked!";
    CombatIndicator_0e0825a98a765bb3b49eec7512df8f66["TEMPIMMUNE"] = "Immune!";
    CombatIndicator_b79481ac170934000821d225b3f051f1 =
        {
            CombatIndicator_a8858383576d7634cceceaf04a2ddb29 = "(.+) attempts to run away in fear!",
            CombatIndicator_ae27b57da3355d3813132c7a240a3a39 = 0,
            CombatIndicator_9241e39fd6a722e645ec9f43ea6cb401 = "attempts to run away!"
        }
    CombatIndicator_fc5eab31006a7701948f217806bc9f5c = "%s Begin to cast %s！";
end
CombatIndicator_7c8f6a474919abae380f8a2b0f3eca0d = {};
CombatIndicator_7c8f6a474919abae380f8a2b0f3eca0d["MISS"] =
    {
        CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027 = 1.0,
        CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1 = 1.0,
        CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7 = 1.0
    };
CombatIndicator_7c8f6a474919abae380f8a2b0f3eca0d["EVADE"] =
    {
        CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027 = 1.0,
        CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1 = 1.0,
        CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7 = 1.0
    };
CombatIndicator_7c8f6a474919abae380f8a2b0f3eca0d["DODGE"] =
    {
        CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027 = 1.0,
        CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1 = 1.0,
        CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7 = 1.0
    };
CombatIndicator_7c8f6a474919abae380f8a2b0f3eca0d["PARRY"] =
    {
        CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027 = 1.0,
        CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1 = 1.0,
        CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7 = 1.0
    };
CombatIndicator_7c8f6a474919abae380f8a2b0f3eca0d["BLOCK"] =
    {
        CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027 = 1.0,
        CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1 = 1.0,
        CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7 = 1.0
    };
CombatIndicator_7c8f6a474919abae380f8a2b0f3eca0d["STUN"] =
    {
        CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027 = 1.0,
        CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1 = 1.0,
        CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7 = 1.0
    };
CombatIndicator_7c8f6a474919abae380f8a2b0f3eca0d["INTERRUPT"] =
    {
        CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027 = 1.0,
        CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1 = 1.0,
        CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7 = 1.0
    };
CombatIndicator_7c8f6a474919abae380f8a2b0f3eca0d["IMMUNE"] =
    {
        CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027 = 1.0,
        CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1 = 1.0,
        CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7 = 1.0
    };
CombatIndicator_7c8f6a474919abae380f8a2b0f3eca0d["RESIST"] =
    {
        CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027 = 1.0,
        CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1 = 1.0,
        CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7 = 1.0
    };
CombatIndicator_7c8f6a474919abae380f8a2b0f3eca0d["ABSORB"] =
    {
        CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027 = 1.0,
        CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1 = 1.0,
        CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7 = 1.0
    };
CombatIndicator_87f223aeb7df6d02f21d55ba551413a9 = {};
CombatIndicator_87f223aeb7df6d02f21d55ba551413a9["NONE"] = nil;
CombatIndicator_87f223aeb7df6d02f21d55ba551413a9["PHYSICAL"] =
    {
        CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027 = 1.0,
        CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1 = 1.0,
        CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7 = 1.0
    };
CombatIndicator_87f223aeb7df6d02f21d55ba551413a9["RESIST"] =
    {
        CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027 = 1.0,
        CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1 = 1.0,
        CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7 = 1.0
    };
CombatIndicator_87f223aeb7df6d02f21d55ba551413a9["IMMUNE"] =
    {
        CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027 = 1.0,
        CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1 = 1.0,
        CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7 = 1.0
    };
CombatIndicator_87f223aeb7df6d02f21d55ba551413a9["EVADED"] =
    {
        CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027 = 1.0,
        CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1 = 1.0,
        CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7 = 1.0
    };
CombatIndicator_87f223aeb7df6d02f21d55ba551413a9["DODGED"] =
    {
        CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027 = 1.0,
        CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1 = 1.0,
        CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7 = 1.0
    };
CombatIndicator_87f223aeb7df6d02f21d55ba551413a9["BLOCKED"] =
    {
        CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027 = 1.0,
        CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1 = 1.0,
        CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7 = 1.0
    };
CombatIndicator_87f223aeb7df6d02f21d55ba551413a9["TEMPIMMUNE"] =
    {
        CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027 = 1.0,
        CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1 = 1.0,
        CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7 = 1.0
    };
local function displaySpellText(CombatIndicator_c9bd86bc8bc59457d49315cf5b8c5b88)
    local CombatIndicator_390231f67fc064f33775aafff8fa9629 =
        getglobal("CombatIndicator" ..
                      Current_Indicator_Number);
    local CombatIndicator_cea1f4c93c74cba28822aecdd3d268e9 =
        getglobal(CombatIndicator_390231f67fc064f33775aafff8fa9629:GetName() ..
                      "Text");
    CombatIndicator_cea1f4c93c74cba28822aecdd3d268e9:SetText(
        CombatIndicator_c9bd86bc8bc59457d49315cf5b8c5b88);
    CombatIndicator_cea1f4c93c74cba28822aecdd3d268e9:SetFont(ChatFrame1:GetFont(),24);
    CombatIndicator_cea1f4c93c74cba28822aecdd3d268e9:SetTextColor(0.0, 1.0, 1.0);
    local CombatIndicator_04c0600c1b894c6808bccb7243e44859 =
        BigFoot_CreateAnim("indicator" ..
                               Current_Indicator_Number,
                           CombatIndicator_390231f67fc064f33775aafff8fa9629);
    local CombatIndicator_58be92ecedd8702806a7ba2af475d890 =
        -GetScreenWidth() / 2 - 100;
    local CombatIndicator_29bb5db232a69a0ef4ed0090c9a61caf =
        GetScreenHeight() / 2;
    BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil,
                      "SHOW", 0, nil, nil,
                      CombatIndicator_58be92ecedd8702806a7ba2af475d890,
                      CombatIndicator_29bb5db232a69a0ef4ed0090c9a61caf, 0.5);
    BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil,
                      "SLIDE", 0.1, nil, nil, 20, 20, 0);
    BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil,
                      "SHOCK", 0.2, nil, nil, 2, 2);
    BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil,
                      "WAIT", 0.3, nil, nil);
    BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil,
                      "SLIDE", 2.0, nil, nil, 0, 0, -0.05);
    BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil,
                      "HIDE", 0, nil, nil);
    BigFoot_PlayAnim(CombatIndicator_04c0600c1b894c6808bccb7243e44859);
    Current_Indicator_Number =
        Current_Indicator_Number + 1;
    if (Current_Indicator_Number > MAX_INDICATOR_COUNT) then
        Current_Indicator_Number = 1;
    end
end
local function displayComboText(CombatIndicator_3f50417fb16be9b1078eb68d24fa9c26)
    local CombatIndicator_390231f67fc064f33775aafff8fa9629 =
        getglobal("CombatIndicator" ..
                      Current_Indicator_Number);
    local CombatIndicator_cea1f4c93c74cba28822aecdd3d268e9 =
        getglobal(CombatIndicator_390231f67fc064f33775aafff8fa9629:GetName() ..
                      "Text");
    local CombatIndicator_c9bd86bc8bc59457d49315cf5b8c5b88 =
        string.format(COMBAT_INDICATOR_COMBO_TEXT,
                      CombatIndicator_3f50417fb16be9b1078eb68d24fa9c26);
    CombatIndicator_cea1f4c93c74cba28822aecdd3d268e9:SetText(
        CombatIndicator_c9bd86bc8bc59457d49315cf5b8c5b88);
    CombatIndicator_cea1f4c93c74cba28822aecdd3d268e9:SetFont(ChatFrame1:GetFont(),36);
    CombatIndicator_cea1f4c93c74cba28822aecdd3d268e9:SetTextColor(1.0, 1.0, 0.0);
    local CombatIndicator_04c0600c1b894c6808bccb7243e44859 =
        BigFoot_CreateAnim("indicator" ..
                               Current_Indicator_Number,
                           CombatIndicator_390231f67fc064f33775aafff8fa9629);
    local CombatIndicator_58be92ecedd8702806a7ba2af475d890 =
        -GetScreenWidth() / 2 + 100;
    local CombatIndicator_29bb5db232a69a0ef4ed0090c9a61caf =
        GetScreenHeight() / 2;
    BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil,
                      "SHOW", 0, nil, nil,
                      CombatIndicator_58be92ecedd8702806a7ba2af475d890,
                      CombatIndicator_29bb5db232a69a0ef4ed0090c9a61caf, 0.7);
    BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil,
                      "SLIDE", 0.1, nil, nil, 20, 0, 0);
    BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil,
                      "SHOCK", 0.2, nil, nil, 2, 2);
    BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil,
                      "WAIT", 0.3, nil, nil);
    BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil,
                      "HIDE", 0, nil, nil);
    BigFoot_PlayAnim(CombatIndicator_04c0600c1b894c6808bccb7243e44859);
    Current_Indicator_Number =
        Current_Indicator_Number + 1;
    if (Current_Indicator_Number > MAX_INDICATOR_COUNT) then
        Current_Indicator_Number = 1;
    end
end
local function displayStatusText(
    CombatIndicator_c9bd86bc8bc59457d49315cf5b8c5b88,
    CombatIndicator_b368619f792f6db16858073f805f281f,
    CombatIndicator_b48c6d810781a0aaca7a1daf572bf0a2,
    CombatIndicator_7c039e42ccbb52e606d662dd4d7eb281,
    CombatIndicator_e0e85008d0859db6bb769f09cf1b7b30)
    local CombatIndicator_390231f67fc064f33775aafff8fa9629 =
        getglobal("CombatIndicator" ..
                      Current_Indicator_Number);
    local CombatIndicator_cea1f4c93c74cba28822aecdd3d268e9 =
        getglobal(CombatIndicator_390231f67fc064f33775aafff8fa9629:GetName() ..
                      "Text");
    CombatIndicator_cea1f4c93c74cba28822aecdd3d268e9:SetText(
        CombatIndicator_c9bd86bc8bc59457d49315cf5b8c5b88);
    if (CombatIndicator_b368619f792f6db16858073f805f281f) then
        CombatIndicator_cea1f4c93c74cba28822aecdd3d268e9:SetFont(ChatFrame1:GetFont(),36);
    else
        CombatIndicator_cea1f4c93c74cba28822aecdd3d268e9:SetFont(ChatFrame1:GetFont(),24);
    end
    local health = UnitHealth("player");
    local maxHealth = UnitHealthMax("player");
    if (CombatIndicator_e0e85008d0859db6bb769f09cf1b7b30) then
        CombatIndicator_cea1f4c93c74cba28822aecdd3d268e9:SetTextColor(
            CombatIndicator_e0e85008d0859db6bb769f09cf1b7b30.CombatIndicator_3ae1f2c4b38d5f7c356b4cdb7c6e4027,
            CombatIndicator_e0e85008d0859db6bb769f09cf1b7b30.CombatIndicator_0f402d7ba502a47a51c410aee99b1ff1,
            CombatIndicator_e0e85008d0859db6bb769f09cf1b7b30.CombatIndicator_a0a053cacf1c8c43346fdc3adb684cb7);
    elseif (health < maxHealth * COMBAT_INDICATOR_WARNING_RATE) then
        CombatIndicator_cea1f4c93c74cba28822aecdd3d268e9:SetTextColor(1.0, 0.0,
                                                                      0.0);
    elseif (CombatIndicator_7c039e42ccbb52e606d662dd4d7eb281) then
        CombatIndicator_cea1f4c93c74cba28822aecdd3d268e9:SetTextColor(0.0, 1.0,
                                                                      0.0);
    elseif (CombatIndicator_b48c6d810781a0aaca7a1daf572bf0a2) then
        CombatIndicator_cea1f4c93c74cba28822aecdd3d268e9:SetTextColor(1.0, 0.5,
                                                                      0.0);
    else
        CombatIndicator_cea1f4c93c74cba28822aecdd3d268e9:SetTextColor(1.0, 0.0,
                                                                      0.0);
    end
    local CombatIndicator_04c0600c1b894c6808bccb7243e44859 =
        BigFoot_CreateAnim("indicator" ..
                               Current_Indicator_Number,
                           CombatIndicator_390231f67fc064f33775aafff8fa9629);
    local CombatIndicator_58be92ecedd8702806a7ba2af475d890 =
        -GetScreenWidth() / 2 - 100;
    local CombatIndicator_29bb5db232a69a0ef4ed0090c9a61caf =
        GetScreenHeight() / 2;
    BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil,
                      "SHOW", 0, nil, nil,
                      CombatIndicator_58be92ecedd8702806a7ba2af475d890,
                      CombatIndicator_29bb5db232a69a0ef4ed0090c9a61caf, 0.7);
    BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil,
                      "SLIDE", 0.1, nil, nil, -20, 0, 0);
    BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil,
                      "SHOCK", 0.2, nil, nil, 2, 2);
    BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil,
                      "WAIT", 0.3, nil, nil);
    BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil,
                      "SLIDE", 2.0, nil, nil, -5, -5, -0.05);
    BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil,
                      "HIDE", 0, nil, nil);
    BigFoot_PlayAnim(CombatIndicator_04c0600c1b894c6808bccb7243e44859);
    Current_Indicator_Number =
        Current_Indicator_Number + 1;
    if (Current_Indicator_Number > MAX_INDICATOR_COUNT) then
        Current_Indicator_Number = 1;
    end
end
local function onUnitCombat(CombatIndicator_d0708241b607c9a9dd1953c812fadfb7,
                            CombatIndicator_8b227d0350467199526e8c4b146b1dfe,
                            CombatIndicator_c57af74df632aac2c797a7c202a55a5b,
                            CombatIndicator_6d5e7d83d8358745ae4dcf61d16bd1f3)
    local CombatIndicator_e6955c64cf39bdb23dc86de1a9ec2117 = "";
    local CombatIndicator_b368619f792f6db16858073f805f281f;
    local CombatIndicator_e0e85008d0859db6bb769f09cf1b7b30;
    local CombatIndicator_7c039e42ccbb52e606d662dd4d7eb281;
    local CombatIndicator_b48c6d810781a0aaca7a1daf572bf0a2;
    if (CombatIndicator_d0708241b607c9a9dd1953c812fadfb7 == "IMMUNE") then
        CombatIndicator_e6955c64cf39bdb23dc86de1a9ec2117 =
            CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["IMMUNE"];
        CombatIndicator_e0e85008d0859db6bb769f09cf1b7b30 =
            CombatIndicator_7c8f6a474919abae380f8a2b0f3eca0d["IMMUNE"];
    elseif (CombatIndicator_d0708241b607c9a9dd1953c812fadfb7 == "WOUND") then
        if (CombatIndicator_8b227d0350467199526e8c4b146b1dfe == "ABSORB") then
            CombatIndicator_e6955c64cf39bdb23dc86de1a9ec2117 =
                CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["ABSORB"];
            CombatIndicator_e0e85008d0859db6bb769f09cf1b7b30 =
                CombatIndicator_7c8f6a474919abae380f8a2b0f3eca0d["ABSORB"];
        elseif (CombatIndicator_c57af74df632aac2c797a7c202a55a5b ~= 0) then
            if (CombatIndicator_8b227d0350467199526e8c4b146b1dfe == "CRITICAL" or
                CombatIndicator_8b227d0350467199526e8c4b146b1dfe == "GLANCING" or
                CombatIndicator_8b227d0350467199526e8c4b146b1dfe == "CRUSHING") then
                CombatIndicator_b368619f792f6db16858073f805f281f = 1;
            end
            if (CombatIndicator_6d5e7d83d8358745ae4dcf61d16bd1f3 > 0) then
                CombatIndicator_b48c6d810781a0aaca7a1daf572bf0a2 = 1;
            end
            CombatIndicator_e6955c64cf39bdb23dc86de1a9ec2117 =
                "-" .. CombatIndicator_c57af74df632aac2c797a7c202a55a5b;
        else
            CombatIndicator_e6955c64cf39bdb23dc86de1a9ec2117 =
                CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["MISS"];
            CombatIndicator_e0e85008d0859db6bb769f09cf1b7b30 =
                CombatIndicator_7c8f6a474919abae380f8a2b0f3eca0d["MISS"];
        end
    elseif (CombatIndicator_d0708241b607c9a9dd1953c812fadfb7 == "BLOCK") then
        CombatIndicator_e6955c64cf39bdb23dc86de1a9ec2117 =
            CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f["BLOCK"];
        CombatIndicator_e0e85008d0859db6bb769f09cf1b7b30 =
            CombatIndicator_7c8f6a474919abae380f8a2b0f3eca0d["BLOCK"];
    elseif (CombatIndicator_d0708241b607c9a9dd1953c812fadfb7 == "HEAL") then
        CombatIndicator_e6955c64cf39bdb23dc86de1a9ec2117 =
            "+" .. CombatIndicator_c57af74df632aac2c797a7c202a55a5b;
        CombatIndicator_7c039e42ccbb52e606d662dd4d7eb281 = 1;
        if (CombatIndicator_8b227d0350467199526e8c4b146b1dfe == "CRITICAL") then
            CombatIndicator_b368619f792f6db16858073f805f281f = 1;
        end
    else
        CombatIndicator_e6955c64cf39bdb23dc86de1a9ec2117 =
            CombatIndicator_e2d7067abe33e0db8f1c61af136fd97f[CombatIndicator_d0708241b607c9a9dd1953c812fadfb7];
        CombatIndicator_e0e85008d0859db6bb769f09cf1b7b30 =
            CombatIndicator_7c8f6a474919abae380f8a2b0f3eca0d[CombatIndicator_d0708241b607c9a9dd1953c812fadfb7];
        if (not CombatIndicator_e6955c64cf39bdb23dc86de1a9ec2117) then
            CombatIndicator_e6955c64cf39bdb23dc86de1a9ec2117 = "";
        end
    end
    displayStatusText(CombatIndicator_e6955c64cf39bdb23dc86de1a9ec2117,
                      CombatIndicator_b368619f792f6db16858073f805f281f,
                      CombatIndicator_b48c6d810781a0aaca7a1daf572bf0a2,
                      CombatIndicator_7c039e42ccbb52e606d662dd4d7eb281,
                      CombatIndicator_e0e85008d0859db6bb769f09cf1b7b30);
end
local function onSpellMiss(self,
                           CombatIndicator_d0708241b607c9a9dd1953c812fadfb7, ...)
    if (self and self:GetName() ~= "PlayerFrame") then return; end
    local CombatIndicator_e6955c64cf39bdb23dc86de1a9ec2117 =
        CombatIndicator_0e0825a98a765bb3b49eec7512df8f66[CombatIndicator_d0708241b607c9a9dd1953c812fadfb7];
    local CombatIndicator_e0e85008d0859db6bb769f09cf1b7b30 =
        CombatIndicator_87f223aeb7df6d02f21d55ba551413a9[CombatIndicator_d0708241b607c9a9dd1953c812fadfb7];
    if (CombatIndicator_e6955c64cf39bdb23dc86de1a9ec2117 == nil) then return; end
    displayStatusText(CombatIndicator_e6955c64cf39bdb23dc86de1a9ec2117, nil,
                      nil, nil, CombatIndicator_e0e85008d0859db6bb769f09cf1b7b30);
end
function C:COMBAT_LOG_EVENT_UNFILTERED(...)
    if not config.spell then return end
    local timestamp, event, hideCaster, sourceGUID, sourceName, sourceFlags,
          sourceFlags2, destGUID, destName, destFlags, destFlags2, auraId,
          auraName = CombatLogGetCurrentEventInfo();
    if event == "SPELL_CAST_START" then
        local fromEnemy
        if sourceFlags and
            not CombatLog_Object_IsA(sourceFlags, COMBATLOG_OBJECT_NONE) then
            fromEnemy = CombatLog_Object_IsA(sourceFlags,
                                             COMBATLOG_FILTER_HOSTILE_UNITS)
        end
        if fromEnemy and UnitGUID("target") == sourceGUID and
            UnitIsUnit("targettarget", "player") then
            displaySpellText(
                CombatIndicator_fc5eab31006a7701948f217806bc9f5c:format(
                    sourceName, auraName))
        end
    end
end
function C:CHAT_MSG_MONSTER_EMOTE(...)
    if not config.spell then return end
    if not PlayerFrame.inCombat then return end
    local _, CombatIndicator_0e2babf2e3097eec96cf9280d1412ab5,
          CombatIndicator_00ae4bc475ffbcf97f789256a2e707de = ...
    local CombatIndicator_34ebd5a15904b9caf228566ff45e7556 = {};
    local CombatIndicator_6e4d0db7491d6883f86de390d20dbe5b,
          CombatIndicator_a2f3972c23a0aa3bd7fb0e9823d918f2;
    CombatIndicator_6e4d0db7491d6883f86de390d20dbe5b, CombatIndicator_a2f3972c23a0aa3bd7fb0e9823d918f2, CombatIndicator_34ebd5a15904b9caf228566ff45e7556[0], CombatIndicator_34ebd5a15904b9caf228566ff45e7556[1], CombatIndicator_34ebd5a15904b9caf228566ff45e7556[2], CombatIndicator_34ebd5a15904b9caf228566ff45e7556[3], CombatIndicator_34ebd5a15904b9caf228566ff45e7556[4] =
        string.find(CombatIndicator_0e2babf2e3097eec96cf9280d1412ab5,
                    CombatIndicator_b79481ac170934000821d225b3f051f1.CombatIndicator_a8858383576d7634cceceaf04a2ddb29);
    if (CombatIndicator_6e4d0db7491d6883f86de390d20dbe5b) then
        displaySpellText(CombatIndicator_00ae4bc475ffbcf97f789256a2e707de ..
                             CombatIndicator_b79481ac170934000821d225b3f051f1.CombatIndicator_9241e39fd6a722e645ec9f43ea6cb401);
    end
end
function C:UNIT_COMBAT(...)
    if not config.status then return end
    local _, unit, CombatIndicator_00ae4bc475ffbcf97f789256a2e707de,
          CombatIndicator_6599f8c6a1b53d0212dfbab04e14e329,
          CombatIndicator_18bd17b74c56bfd23801044c9c9e8d4e,
          CombatIndicator_a29776f66159eb25625ce8ff4969048f = ...
    if (unit == "player") then
        onUnitCombat(CombatIndicator_00ae4bc475ffbcf97f789256a2e707de,
                     CombatIndicator_6599f8c6a1b53d0212dfbab04e14e329,
                     CombatIndicator_18bd17b74c56bfd23801044c9c9e8d4e,
                     CombatIndicator_a29776f66159eb25625ce8ff4969048f);
    end
end
function C:PLAYER_REGEN_ENABLED()
    if not config.leaveCombat then return end
    displaySpellText(COMBAT_INDICATOR_LEAVE_COMBAT);
end
function C:PLAYER_REGEN_DISABLED()
    if not config.leaveCombat then return end
    displaySpellText(COMBAT_INDICATOR_ENTER_COMBAT);
end
local old_comboPoints
function C:UNIT_POWER_FREQUENT(...)
    local _, unit = ...
    if unit ~= "player" then return end
    local comboPoints = GetComboPoints(unit, "target");
    if (comboPoints > 0) then
        if not old_comboPoints or old_comboPoints ~= comboPoints then
            old_comboPoints = comboPoints;
            displayComboText(comboPoints);
        end
    end
end
function CombatIndicatorFrame_OnLoad(self) end
function C:OnEnable()
    self:RegisterEvent("PLAYER_REGEN_ENABLED");
    self:RegisterEvent("PLAYER_REGEN_DISABLED");
    self:RegisterEvent("UNIT_COMBAT");
    self:RegisterEvent("UNIT_POWER_FREQUENT");
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
    self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
end
function C:OnDisable()
    self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
    self:UnregisterEvent("PLAYER_REGEN_ENABLED");
    self:UnregisterEvent("PLAYER_REGEN_DISABLED");
    self:UnregisterEvent("UNIT_COMBAT");
    self:UnregisterEvent("UNIT_POWER_FREQUENT");
    self:UnregisterEvent("CHAT_MSG_MONSTER_EMOTE")
end
function CombatIndicator_Enable(flag)
    if flag then
        C:Enable()
    else
        C:Disable()
    end
end
function CombatIndicator_EnableStatus(flag) config.status = 1 end
function CombatIndicator_EnableShowSpell(flag) config.spell = flag end
function CombatIndicator_EnableLeaveCombat(flag) config.leaveCombat = flag end
function CombatIndicator_EnableShowCombo(flag) config.combo = flag end
