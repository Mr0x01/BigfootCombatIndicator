BIGFOOT_ANIM_INTERVAL = 0.1;
BigFoot_AnimManager = {};
BigFootAnim_LastUpdated = 0;
BigFoot_ActionList = {};
BigFoot_ActionList["SHOW"] = "BigFoot_AnimShow";
BigFoot_ActionList["HIDE"] = "BigFoot_AnimHide";
BigFoot_ActionList["SLIDE"] = "BigFoot_AnimSlide";
BigFoot_ActionList["SHOCK"] = "BigFoot_AnimShock";
BigFoot_ActionList["WAIT"] = "BigFoot_AnimWait";
BigFoot_ActionList["SEQUENCE"] = "BigFoot_AnimSequence";
function BigFoot_PlayAnim(BFAnim_bf33df4d3598f65863aeb7e29bf0862d)
    if (BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]) then
        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d].status =
            "running";
    end
end
function BigFoot_StopAnim(BFAnim_bf33df4d3598f65863aeb7e29bf0862d)
    if (BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]) then
        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d].status =
            "stopped";
        for __index, BFAnim_2361bab8b48b1041ad740bb561b21aee in
            pairs(BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                      .actions) do
            BFAnim_2361bab8b48b1041ad740bb561b21aee.passFlag = nil;
            BFAnim_2361bab8b48b1041ad740bb561b21aee.runningFlag = nil;
        end
    end
end
function BigFoot_PauseAnim(BFAnim_bf33df4d3598f65863aeb7e29bf0862d)
    if (BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]) then
        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d].status =
            "stopped";
    end
end
function BigFoot_ReplayAnim(BFAnim_bf33df4d3598f65863aeb7e29bf0862d)
    if (BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]) then
        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d].status =
            "stopped";
        for __index, BFAnim_2361bab8b48b1041ad740bb561b21aee in
            pairs(BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                      .actions) do
            BFAnim_2361bab8b48b1041ad740bb561b21aee.passFlag = nil;
            BFAnim_2361bab8b48b1041ad740bb561b21aee.runningFlag = nil;
        end
        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d].status =
            "running";
    end
end
function BigFoot_SetAnimControl(BFAnim_bf33df4d3598f65863aeb7e29bf0862d,
                                BFAnim_b2c23ab16b0644a1e9658bc5c6a4fea9,
                                BFAnim_2361bab8b48b1041ad740bb561b21aee)
    BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]["control"][BFAnim_b2c23ab16b0644a1e9658bc5c6a4fea9] =
        BFAnim_2361bab8b48b1041ad740bb561b21aee;
end
function BigFoot_DeleteAnim(BFAnim_bf33df4d3598f65863aeb7e29bf0862d)
    BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d] = nil;
end
function BigFoot_CreateAnim(BFAnim_bf33df4d3598f65863aeb7e29bf0862d,
                            BFAnim_411b8aa6d5954c6020f0b9c9e80e847a)
    BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d] = {};
    BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]["frame"] =
        BFAnim_411b8aa6d5954c6020f0b9c9e80e847a;
    BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]["status"] =
        "stopped";
    BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]["control"] = {};
    return BFAnim_bf33df4d3598f65863aeb7e29bf0862d;
end
function BigFoot_AddAction(BFAnim_bf33df4d3598f65863aeb7e29bf0862d,
                           BFAnim_c4eb8122d53c6d9ddf505c1480e8cce3,
                           BFAnim_f417b525a1892f289d238283f35ac1ad,
                           BFAnim_876ae3817655938dba8b508a2da65e97,
                           BFAnim_0c668a7a635873c7dc937f959f8fd596,
                           BFAnim_fc5d30bf50d482241be8c5de333fe428,
                           BFAnim_0e2babf2e3097eec96cf9280d1412ab5,
                           BFAnim_00ae4bc475ffbcf97f789256a2e707de,
                           BFAnim_6599f8c6a1b53d0212dfbab04e14e329,
                           BFAnim_18bd17b74c56bfd23801044c9c9e8d4e,
                           BFAnim_a29776f66159eb25625ce8ff4969048f,
                           BFAnim_fe4d4227ea1d91e3a69c7b2a27e8150f,
                           BFAnim_ff9ac8c817fb600a8633bbac91acd135,
                           BFAnim_d2a75f7d621ef7006d92cec86286568b,
                           BFAnim_39d32e6b95d64ca57ea8874610c27a8c)
    if (not BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]) then
        return;
    end
    if (not BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d].actions) then
        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d].actions =
            {};
    end
    local BFAnim_2e00ffac12aadb3a1fd865993ec505b9 = {};
    BFAnim_2e00ffac12aadb3a1fd865993ec505b9.beginHandler =
        BFAnim_0c668a7a635873c7dc937f959f8fd596;
    BFAnim_2e00ffac12aadb3a1fd865993ec505b9.endHandler =
        BFAnim_fc5d30bf50d482241be8c5de333fe428;
    BFAnim_2e00ffac12aadb3a1fd865993ec505b9.actionID =
        BFAnim_c4eb8122d53c6d9ddf505c1480e8cce3;
    BFAnim_2e00ffac12aadb3a1fd865993ec505b9.func =
        getglobal(BigFoot_ActionList[BFAnim_f417b525a1892f289d238283f35ac1ad]);
    BFAnim_2e00ffac12aadb3a1fd865993ec505b9.duration =
        BFAnim_876ae3817655938dba8b508a2da65e97;
    BFAnim_2e00ffac12aadb3a1fd865993ec505b9.elapsed = 0;
    BFAnim_2e00ffac12aadb3a1fd865993ec505b9.arg1 =
        BFAnim_0e2babf2e3097eec96cf9280d1412ab5;
    BFAnim_2e00ffac12aadb3a1fd865993ec505b9.arg2 =
        BFAnim_00ae4bc475ffbcf97f789256a2e707de;
    BFAnim_2e00ffac12aadb3a1fd865993ec505b9.arg3 =
        BFAnim_6599f8c6a1b53d0212dfbab04e14e329;
    BFAnim_2e00ffac12aadb3a1fd865993ec505b9.arg4 =
        BFAnim_18bd17b74c56bfd23801044c9c9e8d4e;
    BFAnim_2e00ffac12aadb3a1fd865993ec505b9.arg5 =
        BFAnim_a29776f66159eb25625ce8ff4969048f;
    BFAnim_2e00ffac12aadb3a1fd865993ec505b9.arg6 =
        BFAnim_fe4d4227ea1d91e3a69c7b2a27e8150f;
    BFAnim_2e00ffac12aadb3a1fd865993ec505b9.arg7 =
        BFAnim_ff9ac8c817fb600a8633bbac91acd135;
    BFAnim_2e00ffac12aadb3a1fd865993ec505b9.arg8 =
        BFAnim_d2a75f7d621ef7006d92cec86286568b;
    BFAnim_2e00ffac12aadb3a1fd865993ec505b9.arg9 =
        BFAnim_39d32e6b95d64ca57ea8874610c27a8c;
    table.insert(BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                     .actions, BFAnim_2e00ffac12aadb3a1fd865993ec505b9);
end
function BigFoot_StepRunAnim(BFAnim_bf33df4d3598f65863aeb7e29bf0862d,
                             BFAnim_e9f09a2766c0ce483b69d1aeb0a7ee9c)
    if (BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d].status ==
        "running") then
        local BFAnim_e914904fab9d05d3f54d52bfc31a0f3f = 1;
        if (BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d].actions) then
            while (BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]) do
                if (not BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                    .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f].passFlag) then
                    if (not BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                        .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                        .runningFlag) then
                        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                            .runningFlag = 1;
                        if (BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                            .beginHandler) then
                            BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                                .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                                .beginHandler(
                                BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                                    .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                                    .actionID);
                        end
                    end
                    BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                        .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f].func(
                        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .frame,
                        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                            .arg1,
                        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                            .arg2,
                        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                            .arg3,
                        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                            .arg4,
                        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                            .arg5,
                        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                            .arg6,
                        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                            .arg7,
                        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                            .arg8,
                        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                            .arg9);
                    BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                        .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                        .elapsed =
                        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                            .elapsed + BFAnim_e9f09a2766c0ce483b69d1aeb0a7ee9c;
                    if (BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                        .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                        .duration == 0 or
                        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                            .elapsed >
                        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                            .duration) then
                        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                            .passFlag = 1;
                        BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                            .runningFlag = nil;
                        if (BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                            .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                            .endHandler) then
                            BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                                .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                                .endHandler(
                                BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
                                    .actions[BFAnim_e914904fab9d05d3f54d52bfc31a0f3f]
                                    .actionID);
                        end
                    end
                    return;
                else
                    BFAnim_e914904fab9d05d3f54d52bfc31a0f3f =
                        BFAnim_e914904fab9d05d3f54d52bfc31a0f3f + 1;
                end
            end
        end
        if (BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d].control
            .recycle) then
            BigFoot_ReplayAnim(BFAnim_bf33df4d3598f65863aeb7e29bf0862d);
            return;
        end
        BigFoot_StopAnim(BFAnim_bf33df4d3598f65863aeb7e29bf0862d);
        if (not BigFoot_AnimManager[BFAnim_bf33df4d3598f65863aeb7e29bf0862d]
            .control.keepAlive) then
            BigFoot_DeleteAnim(BFAnim_bf33df4d3598f65863aeb7e29bf0862d);
            return;
        end
    end
end
function BigFoot_AnimSlide(BFAnim_411b8aa6d5954c6020f0b9c9e80e847a,
                           BFAnim_9f652eff74f4ab85c92761b518a48a56,
                           BFAnim_ce7eff166556c4f00b1655de0278b678,
                           BFAnim_315616fc95d16a1f2d915b940f721562)
    if (BFAnim_9f652eff74f4ab85c92761b518a48a56 and
        BFAnim_ce7eff166556c4f00b1655de0278b678) then
        local BFAnim_92fc56267c7e14d288fbcf74f912203d =
            BFAnim_411b8aa6d5954c6020f0b9c9e80e847a:GetLeft();
        local BFAnim_0694c14294eb642e50750f9964155ae0 =
            BFAnim_411b8aa6d5954c6020f0b9c9e80e847a:GetTop();
        BFAnim_92fc56267c7e14d288fbcf74f912203d =
            BFAnim_92fc56267c7e14d288fbcf74f912203d +
                BFAnim_9f652eff74f4ab85c92761b518a48a56;
        BFAnim_0694c14294eb642e50750f9964155ae0 =
            BFAnim_0694c14294eb642e50750f9964155ae0 +
                BFAnim_ce7eff166556c4f00b1655de0278b678;
        BFAnim_411b8aa6d5954c6020f0b9c9e80e847a:SetPoint("TOPLEFT", "UIParent",
                                                         "BOTTOMLEFT",
                                                         BFAnim_92fc56267c7e14d288fbcf74f912203d,
                                                         BFAnim_0694c14294eb642e50750f9964155ae0);
    end
    if (BFAnim_315616fc95d16a1f2d915b940f721562) then
        local BFAnim_bf61cd56adaeb71abb1cdca2566cb62f =
            BFAnim_411b8aa6d5954c6020f0b9c9e80e847a:GetAlpha();
        BFAnim_bf61cd56adaeb71abb1cdca2566cb62f =
            BFAnim_bf61cd56adaeb71abb1cdca2566cb62f +
                BFAnim_315616fc95d16a1f2d915b940f721562;
        if (BFAnim_bf61cd56adaeb71abb1cdca2566cb62f > 1) then
            BFAnim_bf61cd56adaeb71abb1cdca2566cb62f = 1;
        end
        if (BFAnim_bf61cd56adaeb71abb1cdca2566cb62f < 0) then
            BFAnim_bf61cd56adaeb71abb1cdca2566cb62f = 0;
        end
        BFAnim_411b8aa6d5954c6020f0b9c9e80e847a:SetAlpha(
            BFAnim_bf61cd56adaeb71abb1cdca2566cb62f);
    end
end
function BigFoot_AnimShock(BFAnim_411b8aa6d5954c6020f0b9c9e80e847a,
                           BFAnim_a1a789d578fc6369895c0be7d86d6ba2,
                           BFAnim_0996dbfd2919bdc3d83f73299ac8111f)
    local BFAnim_92fc56267c7e14d288fbcf74f912203d =
        BFAnim_411b8aa6d5954c6020f0b9c9e80e847a:GetLeft();
    local BFAnim_0694c14294eb642e50750f9964155ae0 =
        BFAnim_411b8aa6d5954c6020f0b9c9e80e847a:GetTop();
    BFAnim_92fc56267c7e14d288fbcf74f912203d =
        BFAnim_92fc56267c7e14d288fbcf74f912203d +
            math.random(-BFAnim_a1a789d578fc6369895c0be7d86d6ba2,
                        BFAnim_a1a789d578fc6369895c0be7d86d6ba2);
    BFAnim_0694c14294eb642e50750f9964155ae0 =
        BFAnim_0694c14294eb642e50750f9964155ae0 +
            math.random(-BFAnim_0996dbfd2919bdc3d83f73299ac8111f,
                        BFAnim_0996dbfd2919bdc3d83f73299ac8111f);
    BFAnim_411b8aa6d5954c6020f0b9c9e80e847a:SetPoint("TOPLEFT", "UIParent",
                                                     "BOTTOMLEFT",
                                                     BFAnim_92fc56267c7e14d288fbcf74f912203d,
                                                     BFAnim_0694c14294eb642e50750f9964155ae0);
end
function BigFoot_AnimShow(BFAnim_411b8aa6d5954c6020f0b9c9e80e847a,
                          BFAnim_58be92ecedd8702806a7ba2af475d890,
                          BFAnim_29bb5db232a69a0ef4ed0090c9a61caf,
                          BFAnim_bf61cd56adaeb71abb1cdca2566cb62f,
                          BFAnim_b3648505cb2d578e4a1080bd97f2c756)
    local BFAnim_45e20bc7f954e889cd7d4f21e31079a0;
    if (BFAnim_b3648505cb2d578e4a1080bd97f2c756) then
        BFAnim_45e20bc7f954e889cd7d4f21e31079a0 =
            BFAnim_b3648505cb2d578e4a1080bd97f2c756;
    else
        BFAnim_45e20bc7f954e889cd7d4f21e31079a0 =
            BFAnim_411b8aa6d5954c6020f0b9c9e80e847a;
    end
    if (BFAnim_58be92ecedd8702806a7ba2af475d890 and
        BFAnim_29bb5db232a69a0ef4ed0090c9a61caf) then
        BFAnim_45e20bc7f954e889cd7d4f21e31079a0:SetPoint("TOPLEFT", "UIParent",
                                                         "BOTTOMRIGHT",
                                                         BFAnim_58be92ecedd8702806a7ba2af475d890,
                                                         BFAnim_29bb5db232a69a0ef4ed0090c9a61caf);
    end
    if (BFAnim_bf61cd56adaeb71abb1cdca2566cb62f) then
        BFAnim_45e20bc7f954e889cd7d4f21e31079a0:SetAlpha(
            BFAnim_bf61cd56adaeb71abb1cdca2566cb62f);
    end
    BFAnim_45e20bc7f954e889cd7d4f21e31079a0:Show();
end
function BigFoot_AnimHide(BFAnim_411b8aa6d5954c6020f0b9c9e80e847a,
                          BFAnim_b3648505cb2d578e4a1080bd97f2c756)
    local BFAnim_45e20bc7f954e889cd7d4f21e31079a0;
    if (BFAnim_b3648505cb2d578e4a1080bd97f2c756) then
        BFAnim_45e20bc7f954e889cd7d4f21e31079a0 =
            BFAnim_b3648505cb2d578e4a1080bd97f2c756;
    else
        BFAnim_45e20bc7f954e889cd7d4f21e31079a0 =
            BFAnim_411b8aa6d5954c6020f0b9c9e80e847a;
    end
    BFAnim_45e20bc7f954e889cd7d4f21e31079a0:Hide();
end
function BigFoot_AnimWait(BFAnim_411b8aa6d5954c6020f0b9c9e80e847a) end
local frame = CreateFrame("Frame")
local function BFAnim_85105c5d8eef23666c1c27b47a8c3af4(self,
                                                       BFAnim_0e2babf2e3097eec96cf9280d1412ab5)
    if (BigFootAnim_LastUpdated) then
        BigFootAnim_LastUpdated = BigFootAnim_LastUpdated +
                                      BFAnim_0e2babf2e3097eec96cf9280d1412ab5;
        if (BigFootAnim_LastUpdated > BIGFOOT_ANIM_INTERVAL) then
            BigFootAnim_LastUpdated = 0;
        else
            for BFAnim_e914904fab9d05d3f54d52bfc31a0f3f,
                BFAnim_5e57ab95c762a48d9a126b104db1056f in
                pairs(BigFoot_AnimManager) do
                BigFoot_StepRunAnim(BFAnim_e914904fab9d05d3f54d52bfc31a0f3f,
                                    BFAnim_0e2babf2e3097eec96cf9280d1412ab5);
            end
        end
    end
end
frame:SetScript("OnUpdate", BFAnim_85105c5d8eef23666c1c27b47a8c3af4)
