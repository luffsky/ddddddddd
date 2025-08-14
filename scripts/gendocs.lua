-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-08-14 07:55:45
-- Luau version 6, Types version 3
-- Time taken: 0.046754 seconds

local new_upvr_2 = CFrame.new
local Angles_upvr = CFrame.Angles
local new_upvr_4 = Vector3.new
local new_upvr_3 = Instance.new
local new_upvr = TweenInfo.new
local module_upvr = {
	Max_Force = Vector3.new(5500, 5500, 5500);
	Speed = new_upvr_2(0, 0, 0);
	Flip_Type = nil;
	Moving_Magnitude = new_upvr_2(0, 0, 0);
	Gas_SFX = nil;
	Mega_Boost_Speed = 0;
	Escaped = {
		State = false;
		Gained = false;
	};
	Usage = {
		Flip = 10;
		Mega_Boost = 25;
		Hook_1 = 2;
		Hook_1_Boost = 3;
		Hook_2 = 3;
		Hook_2_Boost = 5;
	};
	Last_Gas = tick();
	Last_Flip = {
		Type = "";
		Amount = 0;
		Cooldown = false;
	};
	Tips = {};
	Off_Ground = false;
	Grounded = false;
	Gear_Speed = 150;
	Last_Hook = tick();
	M1_Frames = {
		Floor_Hit_1 = {13, 30};
		Floor_Hit_2 = {10, 30};
		Floor_Hit_3 = {5, 30};
		Air_Hit_1 = {11, 30};
		Air_Hit_2 = {5, 30};
		Air_Hit_3 = {5, 30};
		Spear_Hit_1 = {35, 60, 43};
		Spear_Hit_2 = {35, 60, 43};
	};
	Events = {};
}
math.randomseed(tick())
function module_upvr.Rig(arg1, arg2) -- Line 65
	local var19
	if var19 == nil then
		var19 = arg1.Cache.Player.Character
	end
	if var19 ~= nil then
		return var19:FindFirstChild("Rig_"..var19.Name)
	end
end
function module_upvr.Blade_Check(arg1, arg2, arg3) -- Line 85
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local any_Rig_result1_2 = module_upvr.Rig(arg1, arg2)
	local function INLINED() -- Internal function, doesn't exist in bytecode
		local RightHand = any_Rig_result1_2:FindFirstChild("RightHand")
		local LeftHand = any_Rig_result1_2:FindFirstChild("LeftHand")
		return LeftHand ~= nil
	end
	if any_Rig_result1_2 ~= nil and (arg1.Weapon == "Blades" or arg3 == true) or INLINED() and RightHand ~= nil then
		for i = 7, 1, -1 do
			local SOME_2 = LeftHand:FindFirstChild("Blade_"..i)
			local SOME = RightHand:FindFirstChild("Blade_"..i)
			if SOME_2 ~= nil and SOME ~= nil and SOME_2:GetAttribute("Broken") == nil then
				return true, any_Rig_result1_2, SOME_2, SOME
			end
		end
	end
	return nil, any_Rig_result1_2
end
function module_upvr.Spear_Check(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 105
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local any_Rig_result1 = module_upvr.Rig(arg1, arg2)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [14] 11. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [14] 11. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [185] 136. Error Block 54 start (CF ANALYSIS FAILED)
	task.synchronize()
	-- KONSTANTERROR: [185] 136. Error Block 54 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [188] 138. Error Block 45 start (CF ANALYSIS FAILED)
	do
		return nil, nil, any_Rig_result1
	end
	-- KONSTANTERROR: [188] 138. Error Block 45 end (CF ANALYSIS FAILED)
end
function module_upvr.Get_Reload(arg1) -- Line 166
	if arg1 ~= nil then
		for i_2 = 1, 3 do
			local SOME_4 = arg1:FindFirstChild("Left_"..i_2, true)
			local SOME_3 = arg1:FindFirstChild("Right_"..i_2, true)
			if SOME_4 ~= nil and SOME_3 ~= nil and SOME_4:GetAttribute("Used") == nil then
				return SOME_4, SOME_3
			end
		end
	end
end
function module_upvr.Reduced_Gas(arg1, arg2, arg3) -- Line 178
	local Modules_7 = arg1.Modules
	local Stats_3 = arg1.Stats
	local var32
	if arg2 < Stats_3.ODM_Gas then
		Stats_3.ODM_Gas -= arg2
		local function INLINED_2() -- Internal function, doesn't exist in bytecode
			var32 = Modules_7.Effects
			return var32
		end
		if arg3 == nil or not INLINED_2() then
			var32 = nil
		end
		Modules_7.HUD.Update(arg1, var32, "Gas", Stats_3.ODM_Gas, Stats_3.Maximum_ODM_Gas)
		return true
	end
end
function module_upvr.Tasks(arg1, arg2, arg3, arg4, arg5) -- Line 190
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local Modules_3_upvr = arg1.Modules
	local Cache_13_upvr = arg1.Cache
	local Stats_4_upvr = arg1.Stats
	local Effects_upvr_2 = Modules_3_upvr.Effects
	local Variables_3_upvr = Cache_13_upvr.Variables
	local var44 = 1
	for i_3, var50 in pairs(module_upvr.Events) do
		task.cancel(var50)
	end
	module_upvr.Events = {}
	if arg3 == "Full_Reload" then
		i_3 = "Reload"
		var50 = Modules_3_upvr.Zones.Refill_Station
		arg1:Send("Attacks", i_3, var50)
		if table.find(Stats_4_upvr.Talents, '3') ~= nil then
			var44 = 1.35
		end
		for i_4 = 1, 2 do
			var50 = module_upvr.Events
			i_3 = table.insert
			i_3(var50, task.delay(arg2[i_4] / 60 / var44, function() -- Line 208
				--[[ Upvalues[6]:
					[1]: Variables_3_upvr (readonly)
					[2]: arg3 (readonly)
					[3]: Stats_4_upvr (readonly)
					[4]: Modules_3_upvr (readonly)
					[5]: arg1 (readonly)
					[6]: Effects_upvr_2 (readonly)
				]]
				if Variables_3_upvr[arg3] == true then
					Stats_4_upvr.ODM_Gas = math.clamp(Stats_4_upvr.ODM_Gas + Stats_4_upvr.Maximum_ODM_Gas / 2, 0, Stats_4_upvr.Maximum_ODM_Gas)
					Modules_3_upvr.HUD.Update(arg1, Effects_upvr_2, "Gas", Stats_4_upvr.ODM_Gas, Stats_4_upvr.Maximum_ODM_Gas)
				end
			end))
		end
		i_3 = arg2[3]
		task.delay(i_3 / 60 / var44, function() -- Line 217
			--[[ Upvalues[2]:
				[1]: Variables_3_upvr (readonly)
				[2]: arg3 (readonly)
			]]
			Variables_3_upvr[arg3] = false
		end)
	elseif arg3 == "Reload" then
		var50 = arg2[1] / 60
		i_3 = var50 / var44
		function var50() -- Line 221
			--[[ Upvalues[5]:
				[1]: Variables_3_upvr (readonly)
				[2]: arg3 (readonly)
				[3]: arg1 (readonly)
				[4]: Effects_upvr_2 (readonly)
				[5]: arg4 (readonly)
			]]
			task.delay(0.1, function() -- Line 222
				--[[ Upvalues[5]:
					[1]: Variables_3_upvr (copied, readonly)
					[2]: arg3 (copied, readonly)
					[3]: arg1 (copied, readonly)
					[4]: Effects_upvr_2 (copied, readonly)
					[5]: arg4 (copied, readonly)
				]]
				if Variables_3_upvr[arg3] == true then
					arg1:Invoke("Blades", "Reload")
					Effects_upvr_2.Reload(arg1)
					Effects_upvr_2.Sound(arg1, "Refill", arg4)
				end
			end)
		end
		table.insert(module_upvr.Events, task.delay(i_3, var50))
		i_3 = arg2[2]
		task.delay(i_3 / 60 / var44, function() -- Line 225
			--[[ Upvalues[2]:
				[1]: Variables_3_upvr (readonly)
				[2]: arg3 (readonly)
			]]
			Variables_3_upvr[arg3] = false
		end)
	elseif arg3:find("Hit") ~= nil then
		local Slash_upvr_2 = Variables_3_upvr.Slash
		i_3 = "Spear"
		if arg3:find(i_3) == nil then
		end
		local Speed_upvw = Slash_upvr_2.Speed
		local Character_5_upvr = Cache_13_upvr.Character
		local function Continue_upvr() -- Line 232, Named "Continue"
			--[[ Upvalues[11]:
				[1]: module_upvr (copied, readonly)
				[2]: arg2 (readonly)
				[3]: Speed_upvw (read and write)
				[4]: Slash_upvr_2 (readonly)
				[5]: Cache_13_upvr (readonly)
				[6]: arg3 (readonly)
				[7]: arg1 (readonly)
				[8]: Effects_upvr_2 (readonly)
				[9]: Modules_3_upvr (readonly)
				[10]: Character_5_upvr (readonly)
				[11]: arg4 (readonly)
			]]
			table.insert(module_upvr.Events, task.delay((arg2[2] - arg2[1]) / 60 / Speed_upvw, function() -- Line 234
				--[[ Upvalues[5]:
					[1]: Slash_upvr_2 (copied, readonly)
					[2]: Cache_13_upvr (copied, readonly)
					[3]: arg3 (copied, readonly)
					[4]: arg1 (copied, readonly)
					[5]: Effects_upvr_2 (copied, readonly)
				]]
				if Slash_upvr_2.Slashing == true then
					Slash_upvr_2.Slashing = false
					Slash_upvr_2.Holding = false
					Slash_upvr_2.Released = false
					Cache_13_upvr.Animations[arg3]:Stop(1)
					if arg3:find("Spear") ~= nil then
						arg1.Current_Spear = nil
						return
					end
					Effects_upvr_2.Slash(arg1, false, true)
				end
			end))
			if arg3:find("Spear") ~= nil then
				table.insert(module_upvr.Events, task.delay((arg2[3] - arg2[1]) / 60, function() -- Line 246
					--[[ Upvalues[5]:
						[1]: arg1 (copied, readonly)
						[2]: Modules_3_upvr (copied, readonly)
						[3]: module_upvr (copied, readonly)
						[4]: Character_5_upvr (copied, readonly)
						[5]: arg4 (copied, readonly)
					]]
					local Current_Spear = arg1.Current_Spear
					if Current_Spear ~= nil then
						arg1.Sides[Current_Spear.Side] = tick() + 1
						local any_Fire_result1_2, any_Fire_result2_2, any_Fire_result3 = Modules_3_upvr.Spears.Fire(arg1, module_upvr.Rig(arg1, Character_5_upvr), arg4, Current_Spear)
						if any_Fire_result1_2 ~= nil then
							Modules_3_upvr.Spears.Event(arg1, any_Fire_result1_2, any_Fire_result2_2, any_Fire_result3)
						end
					end
				end))
			end
		end
		Slash_upvr_2.Wait = nil
		if arg5 == nil then
			var50 = module_upvr
			i_3 = var50.Events
			var50 = task.delay
			var50 = var50(arg2[1] / 60 / Speed_upvw, function() -- Line 262
				--[[ Upvalues[2]:
					[1]: Slash_upvr_2 (readonly)
					[2]: Continue_upvr (readonly)
				]]
				if Slash_upvr_2.Released == true then
					Continue_upvr()
				else
					Slash_upvr_2.Wait = true
				end
			end)
			table.insert(i_3, var50)
		else
			Continue_upvr()
		end
	end
end
function module_upvr.Blade_Drops(arg1) -- Line 268
	local Effects_3 = arg1.Modules.Effects
	local any_Invoke_result1 = arg1:Invoke("Blades", "Drop")
	if any_Invoke_result1 ~= nil and 0 < #any_Invoke_result1 then
		for _, v_2 in pairs(any_Invoke_result1) do
			Effects_3.Sound(arg1, "Drop", v_2, nil, nil)
		end
	end
end
function module_upvr.Reload(arg1, arg2) -- Line 282
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local _ = arg1.Modules
	local _ = arg1.Cache
	local _, _ = module_upvr.Blade_Check(arg1)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [27] 16. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [27] 16. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [31] 18. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [31] 18. Error Block 3 end (CF ANALYSIS FAILED)
end
function module_upvr.Achievement(arg1) -- Line 328
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if module_upvr.Off_Ground == true then
		if module_upvr.Grounded == false then
			module_upvr.Grounded = true
			arg1:Send("S_Achievements", "Landed")
		end
	end
end
local new_upvr_result1_upvr = new_upvr(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local function Hook(arg1, arg2, arg3, arg4) -- Line 334
	--[[ Upvalues[5]:
		[1]: module_upvr (readonly)
		[2]: new_upvr_2 (readonly)
		[3]: new_upvr_result1_upvr (readonly)
		[4]: Angles_upvr (readonly)
		[5]: new_upvr_3 (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local _ = arg1.Modules
	local Cache_14 = arg1.Cache
	local _ = arg1.Services.W
	local _ = Cache_14.Variables
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [65] 38. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [65] 38. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [66] 39. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [66] 39. Error Block 3 end (CF ANALYSIS FAILED)
end
module_upvr.Hook = Hook
function module_upvr.Swerve(arg1, arg2, arg3) -- Line 655
	--[[ Upvalues[1]:
		[1]: Angles_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local Cache_9 = arg1.Cache
	local Effects = arg1.Modules.Effects
	local Variables_13 = Cache_9.Variables
	local var90 = arg2
	local var91 = Variables_13[var90.."_Swerve"]
	if arg3 == "Active" then
		var90 = true
	else
		var90 = false
	end
	local Left_Hook_2 = Variables_13.Left_Hook
	local Right_Hook_3 = Variables_13.Right_Hook
	if Left_Hook_2.State == true then
		if Left_Hook_2.Destroying ~= false then
		else
		end
	end
	local var94 = false
	if Right_Hook_3.State == true then
		if Right_Hook_3.Destroying ~= false then
			var94 = false
		else
			var94 = true
		end
	end
	if var90 == true and (true == true or var94 == true) or Variables_13.Climbing.State == false then
		if Variables_13.Near_Floor == false then
			Effects.Burst(arg1, Angles_upvr(0, math.pi, 0))
		end
		Effects.Sound(arg1, "Swerve", Cache_9.Character.PrimaryPart, nil, nil)
	end
	var91.Started = var90
	var91.State = var90
	var91.Last = tick()
	var91.Finished = var90
	var91.Holding = var90
end
function module_upvr.Cancel_Actions(arg1, arg2) -- Line 686
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local Variables_12 = arg1.Cache.Variables
	Variables_12.Land = false
	Variables_12.Flipping = false
	Variables_12.Jump_Flip = false
	for _, v_3 in pairs(arg2) do
		Variables_12[v_3].State = false
		Variables_12[v_3].Lose = true
		if v_3 == "Backflip" or v_3 == "Leftflip" or v_3 == "Rightflip" then
			module_upvr.Flip_Type = nil
		end
	end
end
function module_upvr.Boost(arg1, arg2) -- Line 706
	--[[ Upvalues[3]:
		[1]: Angles_upvr (readonly)
		[2]: module_upvr (readonly)
		[3]: new_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local Left_Hook_6 = arg1.Cache.Variables.Left_Hook
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [27] 15. Error Block 62 start (CF ANALYSIS FAILED)
	if Left_Hook_6.Destroying ~= false then
	else
	end
	-- KONSTANTERROR: [27] 15. Error Block 62 end (CF ANALYSIS FAILED)
end
function module_upvr.End_Climb(arg1) -- Line 767
	if arg1.Cache.Variables.Climbing.State == true then
		arg1.Modules.Climb.End(arg1)
	end
end
function module_upvr.Enable_Flip(arg1, arg2, arg3, arg4, arg5, arg6, arg7) -- Line 779
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var104 = false
	local Last_Flip_upvr = module_upvr.Last_Flip
	local var106
	local function INLINED_3() -- Internal function, doesn't exist in bytecode
		local HUD_upvr = Modules_2.HUD
		var106 = arg1.Artifacts
		local Stats = arg1.Stats
		local Modules_2 = arg1.Modules
		return module_upvr.Reduced_Gas(arg1, arg6, true) == true
	end
	if Last_Flip_upvr.Type == "" or Last_Flip_upvr.Type == arg2 and Last_Flip_upvr.Amount < arg3 or Last_Flip_upvr.Cooldown == false and INLINED_3() then
		Last_Flip_upvr.Type = arg2
		Last_Flip_upvr.Amount += 1
		Last_Flip_upvr.Cooldown = true
		if table.find(var106.Equipped, "Scarf") ~= nil then
			if arg4 ~= nil then
			end
		end
		if Last_Flip_upvr.Amount < arg3 then
			task.delay(arg4 * 0.8, function() -- Line 797
				--[[ Upvalues[3]:
					[1]: Last_Flip_upvr (readonly)
					[2]: HUD_upvr (readonly)
					[3]: arg1 (readonly)
				]]
				Last_Flip_upvr.Cooldown = false
				HUD_upvr.Boost(arg1, "No_Cooldown")
			end)
			local Amount_upvr = Last_Flip_upvr.Amount
			task.delay(arg5 * 0.8, function() -- Line 803
				--[[ Upvalues[4]:
					[1]: Last_Flip_upvr (readonly)
					[2]: arg2 (readonly)
					[3]: Amount_upvr (readonly)
					[4]: module_upvr (copied, readonly)
				]]
				if Last_Flip_upvr.Type == arg2 and Last_Flip_upvr.Amount == Amount_upvr then
					Last_Flip_upvr.Type = ""
					Last_Flip_upvr.Amount = 0
					Last_Flip_upvr.Cooldown = false
					module_upvr.Off_Ground = true
				end
			end)
		else
			Amount_upvr = task.delay
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			Amount_upvr(arg5 * 0.8, function() -- Line 810
				--[[ Upvalues[4]:
					[1]: Last_Flip_upvr (readonly)
					[2]: HUD_upvr (readonly)
					[3]: arg1 (readonly)
					[4]: module_upvr (copied, readonly)
				]]
				Last_Flip_upvr.Type = ""
				Last_Flip_upvr.Amount = 0
				Last_Flip_upvr.Cooldown = false
				HUD_upvr.Boost(arg1, "No_Cooldown")
				module_upvr.Off_Ground = true
			end)
		end
		var104 = true
		Amount_upvr = HUD_upvr.Boost
		Amount_upvr(arg1, "Cooldown")
		Amount_upvr = table.find(Stats.Talents, "16")
		if Amount_upvr ~= nil then
			Amount_upvr = task.defer
			local Effects_upvr = Modules_2.Effects
			Amount_upvr(function() -- Line 818
				--[[ Upvalues[3]:
					[1]: arg1 (readonly)
					[2]: arg7 (readonly)
					[3]: Effects_upvr (readonly)
				]]
				if arg1:Invoke("Talents", "Flashstep", arg7) == true then
					Effects_upvr.Flashstep(arg1, arg7)
				end
			end)
		end
		Amount_upvr = table.find(Stats.Passive_Perks, "Black Flash")
		if Amount_upvr ~= nil then
			Amount_upvr = arg1:Send
			Amount_upvr("S_Perks", "Black_Flash", arg7)
			return var104
		end
	end
	return var104
end
function module_upvr.Mega_Boost(arg1) -- Line 833
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: Angles_upvr (readonly)
	]]
	local Cache_7 = arg1.Cache
	local Effects_2_upvr = arg1.Modules.Effects
	local Variables_11_upvr = Cache_7.Variables
	local _ = Cache_7.Objects
	local Mega_Boosting_3_upvr = Variables_11_upvr.Mega_Boosting
	if Mega_Boosting_3_upvr.State == false and module_upvr.Enable_Flip(arg1, "Mega_Boost", 1 + arg1.Stats.Boost_Dashes, 0.5, 2.25, module_upvr.Usage.Mega_Boost, 0.5) == true then
		module_upvr.End_Climb(arg1)
		module_upvr.Hook(arg1, "Left", "Passive")
		module_upvr.Hook(arg1, "Right", "Passive")
		Variables_11_upvr.Sliding.State = false
		Variables_11_upvr.Rolling.State = false
		Variables_11_upvr.Unhook_Type = ""
		Variables_11_upvr.Speedlines.Mega_Boost = true
		Variables_11_upvr.Movement = true
		Mega_Boosting_3_upvr.State = true
		Mega_Boosting_3_upvr.Last = tick()
		Mega_Boosting_3_upvr.Lose = false
		module_upvr.Cancel_Actions(arg1, {"Flip"})
		Effects_2_upvr.Mega_Boost = true
		Effects_2_upvr.Burst(arg1, Angles_upvr(0, (math.pi/2), 0))
		arg1:Send("S_Objectives", "Boost")
		Effects_2_upvr.Sound(arg1, "Mega_Boost", Cache_7.Character.PrimaryPart, nil, nil)
		task.delay(0.45, function() -- Line 873
			--[[ Upvalues[1]:
				[1]: Effects_2_upvr (readonly)
			]]
			Effects_2_upvr.Mega_Boost = false
		end)
		task.delay(0.5, function() -- Line 877
			--[[ Upvalues[2]:
				[1]: Mega_Boosting_3_upvr (readonly)
				[2]: Variables_11_upvr (readonly)
			]]
			Mega_Boosting_3_upvr.Lose = true
			task.delay(0.175, function() -- Line 880
				--[[ Upvalues[1]:
					[1]: Variables_11_upvr (copied, readonly)
				]]
				Variables_11_upvr.Speedlines.Mega_Boost = false
			end)
		end)
	end
end
local var125_upvw
function module_upvr.M1(arg1, arg2) -- Line 893
	--[[ Upvalues[4]:
		[1]: module_upvr (readonly)
		[2]: new_upvr_3 (readonly)
		[3]: new_upvr_2 (readonly)
		[4]: var125_upvw (read and write)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 87 start (CF ANALYSIS FAILED)
	local Modules_6 = arg1.Modules
	local Stats_2 = arg1.Stats
	local Cache_8 = arg1.Cache
	local Events_2 = arg1.Events
	local Weapon_2 = arg1.Weapon
	local Shift_2 = Modules_6.Shift
	local Zones_2 = Modules_6.Zones
	local Character_6_upvr = Cache_8.Character
	local Variables_5 = Cache_8.Variables
	local Slash_upvr = Variables_5.Slash
	local Heavy_2 = Variables_5.Heavy
	local var189 = Slash_upvr.Combo + 1
	local var190 = "ThrowStage"
	local var191
	if Character_6_upvr:GetAttribute(var190) or Events_2.Spear_Stepped ~= nil or Events_2.Spear_Stepped_2 ~= nil then return end
	-- KONSTANTERROR: [0] 1. Error Block 87 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [49] 28. Error Block 7 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [49] 28. Error Block 7 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [57] 32. Error Block 9 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [57] 32. Error Block 9 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [61] 34. Error Block 99 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [61] 34. Error Block 99 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [69] 38. Error Block 13 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [69] 38. Error Block 13 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [73] 40. Error Block 98 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [73] 40. Error Block 98 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [167] 106. Error Block 125 start (CF ANALYSIS FAILED)
	local var192
	if 3 < var189 then
		var191 = 1
	else
		var191 = var189
	end
	local var193 = var191
	if var193 == 3 then
		var191 = 0
		Slash_upvr.Combo = var191
		Slash_upvr.Cooldown = true
		var191 = Character_6_upvr:GetAttribute("Type")
		if var191 then
			var191 = Character_6_upvr:GetAttribute("Type")
			if var191 == "Female_Titan" then
				var192 = 0.5
			end
		end
		var191 = task.delay
		var191(var192, function() -- Line 941
			--[[ Upvalues[1]:
				[1]: Slash_upvr (readonly)
			]]
			Slash_upvr.Cooldown = false
		end)
	end
	var191 = nil
	Heavy_2.Transition = var191
	var191 = {}
	Zones_2.Hit = var191
	Zones_2.Hit_Building = false
	var191 = tick()
	Slash_upvr.Combo = var193
	Slash_upvr.Last = var191
	Slash_upvr.Slashing = true
	Slash_upvr.Continue = nil
	Slash_upvr.Type = var190
	Slash_upvr.Released = false
	Slash_upvr.Transition = nil
	if arg2 == false then
		if Weapon_2 == "Blades" then
			var191 = Stats_2.Swing_Duration
			local Founder_Will_2 = Character_6_upvr:GetAttribute("Founder_Will")
			if Founder_Will_2 ~= nil then
				local _, unpack_result2_2 = unpack(string.split(Founder_Will_2, ','))
				if unpack_result2_2 ~= nil then
					var191 += unpack_result2_2
				end
			end
			Slash_upvr.Speed = (0.65) / (var191 / 100)
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		module_upvr.Tasks(arg1, module_upvr.M1_Frames[tostring(var190.."_Hit_"..Slash_upvr.Combo)], tostring(var190.."_Hit_"..Slash_upvr.Combo), Character_6_upvr.PrimaryPart)
		if Weapon_2 == "Blades" and table.find(Stats_2.Talents, '1') ~= nil or Weapon_2 == "Spears" and table.find(Stats_2.Talents, "30") ~= nil then
			local tbl_3_upvw = {}
			if Weapon_2 == "Blades" then
				local _, _, any_Blade_Check_result3, any_Blade_Check_result4 = module_upvr.Blade_Check(arg1, Character_6_upvr)
				if any_Blade_Check_result3 ~= nil and any_Blade_Check_result4 ~= nil then
					tbl_3_upvw = {any_Blade_Check_result3, any_Blade_Check_result4}
					-- KONSTANTWARNING: GOTO [344] #229
				end
			else
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [321.20]
				if nil ~= nil then
					local new_upvr_3_result1 = new_upvr_3("Attachment")
					new_upvr_3_result1.Name = 'A'
					new_upvr_3_result1.CFrame = new_upvr_2(0, -1.9, 0)
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					new_upvr_3_result1.Parent = nil
					tbl_3_upvw = {new_upvr_3_result1}
				end
			end
			module_upvr.Tips = {}
			if 0 < #tbl_3_upvw then
				task.synchronize()
				for _, v_4 in pairs(tbl_3_upvw) do
					local clone_2 = arg1:Get("Asset", {"Particles", "Blitzblade"}).Tip:Clone()
					clone_2.Parent = v_4
					table.insert(module_upvr.Tips, clone_2)
					local var211_upvr
				end
				if var125_upvw ~= nil then
					task.cancel(var125_upvw)
				end
				local Effects_6_upvr = Modules_6.Effects
				var125_upvw = task.delay(2.5, function() -- Line 995
					--[[ Upvalues[7]:
						[1]: Slash_upvr (readonly)
						[2]: Effects_6_upvr (readonly)
						[3]: arg1 (readonly)
						[4]: module_upvr (copied, readonly)
						[5]: Character_6_upvr (readonly)
						[6]: tbl_3_upvw (read and write)
						[7]: var211_upvr (readonly)
					]]
					if Slash_upvr.Slashing == true then
						if Slash_upvr.Released == false then
							Effects_6_upvr.Charge(arg1, module_upvr, Character_6_upvr, tbl_3_upvw, var211_upvr)
						end
					end
				end)
			end
			-- KONSTANTWARNING: GOTO [430] #293
		end
	else
		Variables_5.Block = false
		task.synchronize()
		arg1:Send("Attacks", "Slash", true)
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		Shift_2.Initiate_Hit(arg1, Character_6_upvr, Character_6_upvr.PrimaryPart, var193)
	end
	-- KONSTANTERROR: [167] 106. Error Block 125 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [430] 293. Error Block 78 start (CF ANALYSIS FAILED)
	do
		return true
	end
	-- KONSTANTERROR: [430] 293. Error Block 78 end (CF ANALYSIS FAILED)
end
function module_upvr.Flip(arg1, arg2, arg3) -- Line 1013
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: Angles_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local Cache = arg1.Cache
	local Effects_5_upvr = arg1.Modules.Effects
	local Variables_2_upvr = Cache.Variables
	local Left_Hook = Variables_2_upvr.Left_Hook
	local Right_Hook_4 = Variables_2_upvr.Right_Hook
	local Flip_4_upvr = Variables_2_upvr.Flip
	local var220
	if Left_Hook.State == true then
		if Left_Hook.Destroying ~= false then
			var220 = false
		else
			var220 = true
		end
	end
	if Right_Hook_4.State == true then
		if Right_Hook_4.Destroying ~= false then
		else
			local var221
		end
	end
	if arg2 == "Backflip" then
		var221 = 0.125
	else
		var221 = 0.3
	end
	local var222
	local function INLINED_4() -- Internal function, doesn't exist in bytecode
		var222 = module_upvr.Enable_Flip(arg1, arg2, 1, nil, 1.25, module_upvr.Usage.Flip, 0.5)
		return var222 == true
	end
	if var222 == false and (arg3 == true or INLINED_4()) then
		if arg2 == "Backflip" then
			var222 = module_upvr.End_Climb
			var222(arg1)
		end
		var222 = Variables_2_upvr.Sliding
		var222.State = false
		Variables_2_upvr.Rolling.State = false
		var222 = Variables_2_upvr.Speedlines
		Variables_2_upvr.Unhook_Type = ""
		var222.Flip = true
		Variables_2_upvr.Movement = true
		var222 = module_upvr.Cancel_Actions
		var222(arg1, {"Mega_Boosting"})
		var222 = module_upvr
		var222.Flip_Type = arg2
		var222 = true
		Flip_4_upvr.State = var222
		local function INLINED_5() -- Internal function, doesn't exist in bytecode
			var222 = Angles_upvr(0, (math.pi/2), 0)
			return var222
		end
		if arg2 ~= "Backflip" or not INLINED_5() then
			var222 = Angles_upvr(0, math.pi, 0)
		end
		Effects_5_upvr.Burst(arg1, var222)
		arg1:Send("S_Objectives", "Boost")
		Effects_5_upvr.Sound(arg1, "Swerve", Cache.Character.PrimaryPart, nil, nil)
		if var220 == false and true == false then
			Flip_4_upvr.Lose = false
			task.delay(0.3333333333333333, function() -- Line 1057
				--[[ Upvalues[1]:
					[1]: Flip_4_upvr (readonly)
				]]
				Flip_4_upvr.Lose = true
			end)
		end
		task.delay(var221 + 0.3333333333333333, function() -- Line 1062
			--[[ Upvalues[1]:
				[1]: Variables_2_upvr (readonly)
			]]
			Variables_2_upvr.Speedlines.Flip = false
		end)
		Effects_5_upvr.Flip = true
		local delay = task.delay
		delay((0.15) + (var221 - 0.05), function() -- Line 1068
			--[[ Upvalues[1]:
				[1]: Effects_5_upvr (readonly)
			]]
			Effects_5_upvr.Flip = false
		end)
		if arg2 == "Backflip" then
			delay = 0.6666666666666666
		else
			delay = 1.5
		end
		task.delay(delay, function() -- Line 1076
			--[[ Upvalues[2]:
				[1]: Flip_4_upvr (readonly)
				[2]: module_upvr (copied, readonly)
			]]
			Flip_4_upvr.State = false
			Flip_4_upvr.Last = tick()
			Flip_4_upvr.Adjusted = false
			module_upvr.Flip_Type = nil
		end)
		Effects_5_upvr.Dust(arg1, false)
	end
end
function module_upvr.Hook_Break(arg1) -- Line 1090
	--[[ Upvalues[2]:
		[1]: new_upvr_3 (readonly)
		[2]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local Cache_12 = arg1.Cache
	local W_2_upvr = arg1.Services.W
	local Variables_7_upvr = Cache_12.Variables
	local PrimaryPart_6_upvr = Cache_12.Character.PrimaryPart
	local Left_Hook_4 = Variables_7_upvr.Left_Hook
	local Right_Hook_2 = Variables_7_upvr.Right_Hook
	local Hook_Break_2_upvr = Variables_7_upvr.Hook_Break
	local var236_upvr
	if Left_Hook_4.State == true then
		if Left_Hook_4.Destroying ~= false then
			var236_upvr = false
		else
			var236_upvr = true
		end
	end
	if Right_Hook_2.State == true then
		if Right_Hook_2.Destroying ~= false then
		else
		end
	end
	local ODM_Range_upvr = arg1.Stats.ODM_Range
	if Hook_Break_2_upvr.State == false and 1 <= tick() - Hook_Break_2_upvr.Last and Hook_Break_2_upvr.Hooking == false then
		local var238_upvw = false
		local var239_upvw = false
		local function _(arg1_2) -- Line 1111, Named "Hook"
			--[[ Upvalues[10]:
				[1]: Hook_Break_2_upvr (readonly)
				[2]: Variables_7_upvr (readonly)
				[3]: W_2_upvr (readonly)
				[4]: PrimaryPart_6_upvr (readonly)
				[5]: ODM_Range_upvr (readonly)
				[6]: new_upvr_3 (copied, readonly)
				[7]: var238_upvw (read and write)
				[8]: module_upvr (copied, readonly)
				[9]: arg1 (readonly)
				[10]: var239_upvw (read and write)
			]]
			if Hook_Break_2_upvr.Holding == true then
				task.defer(function() -- Line 1113
					--[[ Upvalues[11]:
						[1]: Variables_7_upvr (copied, readonly)
						[2]: arg1_2 (readonly)
						[3]: W_2_upvr (copied, readonly)
						[4]: PrimaryPart_6_upvr (copied, readonly)
						[5]: ODM_Range_upvr (copied, readonly)
						[6]: new_upvr_3 (copied, readonly)
						[7]: Hook_Break_2_upvr (copied, readonly)
						[8]: var238_upvw (copied, read and write)
						[9]: module_upvr (copied, readonly)
						[10]: arg1 (copied, readonly)
						[11]: var239_upvw (copied, read and write)
					]]
					-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
					local var241 = arg1_2.."_Hook"
					local var242 = Variables_7_upvr[var241]
					-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [9] 8. Error Block 2 start (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [9] 8. Error Block 2 end (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [20] 17. Error Block 4 start (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [20] 17. Error Block 4 end (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [97] 69. Error Block 24 start (CF ANALYSIS FAILED)
					if var238_upvw == true and var239_upvw == false then
						var239_upvw = true
						Hook_Break_2_upvr.Hooking = true
						Hook_Break_2_upvr.State = true
						Hook_Break_2_upvr.Last = tick()
					end
					-- KONSTANTERROR: [97] 69. Error Block 24 end (CF ANALYSIS FAILED)
				end)
			end
		end
		task.defer(function() -- Line 1169
			--[[ Upvalues[11]:
				[1]: var236_upvr (readonly)
				[2]: module_upvr (copied, readonly)
				[3]: arg1 (readonly)
				[4]: Hook_Break_2_upvr (readonly)
				[5]: Variables_7_upvr (readonly)
				[6]: W_2_upvr (readonly)
				[7]: PrimaryPart_6_upvr (readonly)
				[8]: ODM_Range_upvr (readonly)
				[9]: new_upvr_3 (copied, readonly)
				[10]: var238_upvw (read and write)
				[11]: var239_upvw (read and write)
			]]
			if var236_upvr == true then
				module_upvr.Hook(arg1, "Left", "Passive")
				task.delay(0.43333333333333335, function() -- Line 1173
					--[[ Upvalues[10]:
						[1]: Hook_Break_2_upvr (copied, readonly)
						[2]: Variables_7_upvr (copied, readonly)
						[3]: W_2_upvr (copied, readonly)
						[4]: PrimaryPart_6_upvr (copied, readonly)
						[5]: ODM_Range_upvr (copied, readonly)
						[6]: new_upvr_3 (copied, readonly)
						[7]: var238_upvw (copied, read and write)
						[8]: module_upvr (copied, readonly)
						[9]: arg1 (copied, readonly)
						[10]: var239_upvw (copied, read and write)
					]]
					if Hook_Break_2_upvr.Holding == true then
						if Hook_Break_2_upvr.Holding == true then
							local const_string_upvr_4 = "Left"
							task.defer(function() -- Line 1113
								--[[ Upvalues[11]:
									[1]: Variables_7_upvr (copied, readonly)
									[2]: const_string_upvr_4 (readonly)
									[3]: W_2_upvr (copied, readonly)
									[4]: PrimaryPart_6_upvr (copied, readonly)
									[5]: ODM_Range_upvr (copied, readonly)
									[6]: new_upvr_3 (copied, readonly)
									[7]: Hook_Break_2_upvr (copied, readonly)
									[8]: var238_upvw (copied, read and write)
									[9]: module_upvr (copied, readonly)
									[10]: arg1 (copied, readonly)
									[11]: var239_upvw (copied, read and write)
								]]
								-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
								local var247 = const_string_upvr_4.."_Hook"
								local var248 = Variables_7_upvr[var247]
								-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
								-- KONSTANTERROR: [9] 8. Error Block 2 start (CF ANALYSIS FAILED)
								-- KONSTANTERROR: [9] 8. Error Block 2 end (CF ANALYSIS FAILED)
								-- KONSTANTERROR: [20] 17. Error Block 4 start (CF ANALYSIS FAILED)
								-- KONSTANTERROR: [20] 17. Error Block 4 end (CF ANALYSIS FAILED)
								-- KONSTANTERROR: [97] 69. Error Block 24 start (CF ANALYSIS FAILED)
								if var238_upvw == true and var239_upvw == false then
									var239_upvw = true
									Hook_Break_2_upvr.Hooking = true
									Hook_Break_2_upvr.State = true
									Hook_Break_2_upvr.Last = tick()
								end
								-- KONSTANTERROR: [97] 69. Error Block 24 end (CF ANALYSIS FAILED)
							end)
						end
					end
				end)
			elseif Hook_Break_2_upvr.Holding == true then
				local const_string_upvr_2 = "Left"
				task.defer(function() -- Line 1113
					--[[ Upvalues[11]:
						[1]: Variables_7_upvr (copied, readonly)
						[2]: const_string_upvr_2 (readonly)
						[3]: W_2_upvr (copied, readonly)
						[4]: PrimaryPart_6_upvr (copied, readonly)
						[5]: ODM_Range_upvr (copied, readonly)
						[6]: new_upvr_3 (copied, readonly)
						[7]: Hook_Break_2_upvr (copied, readonly)
						[8]: var238_upvw (copied, read and write)
						[9]: module_upvr (copied, readonly)
						[10]: arg1 (copied, readonly)
						[11]: var239_upvw (copied, read and write)
					]]
					-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
					local var251 = const_string_upvr_2.."_Hook"
					local var252 = Variables_7_upvr[var251]
					-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [9] 8. Error Block 2 start (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [9] 8. Error Block 2 end (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [20] 17. Error Block 4 start (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [20] 17. Error Block 4 end (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [97] 69. Error Block 24 start (CF ANALYSIS FAILED)
					if var238_upvw == true and var239_upvw == false then
						var239_upvw = true
						Hook_Break_2_upvr.Hooking = true
						Hook_Break_2_upvr.State = true
						Hook_Break_2_upvr.Last = tick()
					end
					-- KONSTANTERROR: [97] 69. Error Block 24 end (CF ANALYSIS FAILED)
				end)
			end
		end)
		local var254_upvr = true
		task.defer(function() -- Line 1184
			--[[ Upvalues[11]:
				[1]: var254_upvr (readonly)
				[2]: module_upvr (copied, readonly)
				[3]: arg1 (readonly)
				[4]: Hook_Break_2_upvr (readonly)
				[5]: Variables_7_upvr (readonly)
				[6]: W_2_upvr (readonly)
				[7]: PrimaryPart_6_upvr (readonly)
				[8]: ODM_Range_upvr (readonly)
				[9]: new_upvr_3 (copied, readonly)
				[10]: var238_upvw (read and write)
				[11]: var239_upvw (read and write)
			]]
			if var254_upvr == true then
				module_upvr.Hook(arg1, "Right", "Passive")
				task.delay(0.43333333333333335, function() -- Line 1188
					--[[ Upvalues[10]:
						[1]: Hook_Break_2_upvr (copied, readonly)
						[2]: Variables_7_upvr (copied, readonly)
						[3]: W_2_upvr (copied, readonly)
						[4]: PrimaryPart_6_upvr (copied, readonly)
						[5]: ODM_Range_upvr (copied, readonly)
						[6]: new_upvr_3 (copied, readonly)
						[7]: var238_upvw (copied, read and write)
						[8]: module_upvr (copied, readonly)
						[9]: arg1 (copied, readonly)
						[10]: var239_upvw (copied, read and write)
					]]
					if Hook_Break_2_upvr.Holding == true then
						if Hook_Break_2_upvr.Holding == true then
							local const_string_upvr_3 = "Right"
							task.defer(function() -- Line 1113
								--[[ Upvalues[11]:
									[1]: Variables_7_upvr (copied, readonly)
									[2]: const_string_upvr_3 (readonly)
									[3]: W_2_upvr (copied, readonly)
									[4]: PrimaryPart_6_upvr (copied, readonly)
									[5]: ODM_Range_upvr (copied, readonly)
									[6]: new_upvr_3 (copied, readonly)
									[7]: Hook_Break_2_upvr (copied, readonly)
									[8]: var238_upvw (copied, read and write)
									[9]: module_upvr (copied, readonly)
									[10]: arg1 (copied, readonly)
									[11]: var239_upvw (copied, read and write)
								]]
								-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
								local var258 = const_string_upvr_3.."_Hook"
								local var259 = Variables_7_upvr[var258]
								-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
								-- KONSTANTERROR: [9] 8. Error Block 2 start (CF ANALYSIS FAILED)
								-- KONSTANTERROR: [9] 8. Error Block 2 end (CF ANALYSIS FAILED)
								-- KONSTANTERROR: [20] 17. Error Block 4 start (CF ANALYSIS FAILED)
								-- KONSTANTERROR: [20] 17. Error Block 4 end (CF ANALYSIS FAILED)
								-- KONSTANTERROR: [97] 69. Error Block 24 start (CF ANALYSIS FAILED)
								if var238_upvw == true and var239_upvw == false then
									var239_upvw = true
									Hook_Break_2_upvr.Hooking = true
									Hook_Break_2_upvr.State = true
									Hook_Break_2_upvr.Last = tick()
								end
								-- KONSTANTERROR: [97] 69. Error Block 24 end (CF ANALYSIS FAILED)
							end)
						end
					end
				end)
			elseif Hook_Break_2_upvr.Holding == true then
				local const_string_upvr = "Right"
				task.defer(function() -- Line 1113
					--[[ Upvalues[11]:
						[1]: Variables_7_upvr (copied, readonly)
						[2]: const_string_upvr (readonly)
						[3]: W_2_upvr (copied, readonly)
						[4]: PrimaryPart_6_upvr (copied, readonly)
						[5]: ODM_Range_upvr (copied, readonly)
						[6]: new_upvr_3 (copied, readonly)
						[7]: Hook_Break_2_upvr (copied, readonly)
						[8]: var238_upvw (copied, read and write)
						[9]: module_upvr (copied, readonly)
						[10]: arg1 (copied, readonly)
						[11]: var239_upvw (copied, read and write)
					]]
					-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
					local var262 = const_string_upvr.."_Hook"
					local var263 = Variables_7_upvr[var262]
					-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [9] 8. Error Block 2 start (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [9] 8. Error Block 2 end (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [20] 17. Error Block 4 start (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [20] 17. Error Block 4 end (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [97] 69. Error Block 24 start (CF ANALYSIS FAILED)
					if var238_upvw == true and var239_upvw == false then
						var239_upvw = true
						Hook_Break_2_upvr.Hooking = true
						Hook_Break_2_upvr.State = true
						Hook_Break_2_upvr.Last = tick()
					end
					-- KONSTANTERROR: [97] 69. Error Block 24 end (CF ANALYSIS FAILED)
				end)
			end
		end)
	end
end
function module_upvr.Slide(arg1, arg2) -- Line 1201
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: new_upvr_2 (readonly)
		[3]: new_upvr_4 (readonly)
	]]
	local Cache_4 = arg1.Cache
	local Variables = Cache_4.Variables
	local PrimaryPart_7 = Cache_4.Character.PrimaryPart
	if PrimaryPart_7 ~= nil then
		local BV_2 = Cache_4.Objects.BV
		Variables.Land = false
		Variables.Sliding.State = true
		Variables.Rolling.State = false
		module_upvr.Moving_Magnitude = new_upvr_2(arg2, 0, 0)
		BV_2.MaxForce = new_upvr_4(module_upvr.Max_Force.X, 0, module_upvr.Max_Force.Z)
		BV_2.Velocity = PrimaryPart_7.CFrame.LookVector * arg2
		arg1.Modules.Effects.Dust(arg1, false)
	end
end
function module_upvr.Roll(arg1, arg2) -- Line 1225
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: new_upvr_2 (readonly)
		[3]: new_upvr_4 (readonly)
	]]
	local Cache_3 = arg1.Cache
	local Variables_9 = Cache_3.Variables
	local BV = Cache_3.Objects.BV
	Variables_9.Land = false
	Variables_9.Sliding.State = false
	Variables_9.Rolling.State = true
	module_upvr.Moving_Magnitude = new_upvr_2(arg2, 0, 0)
	BV.MaxForce = new_upvr_4(module_upvr.Max_Force.X, 0, module_upvr.Max_Force.Z)
	BV.Velocity = Cache_3.Character.PrimaryPart.CFrame.LookVector * arg2
	arg1.Modules.Effects.Dust(arg1, true)
end
function module_upvr.Constants(arg1, arg2, arg3, arg4, arg5, arg6, arg7) -- Line 1247
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var271
	local function INLINED_6() -- Internal function, doesn't exist in bytecode
		var271 = arg6 * 1.1
		return var271
	end
	if arg4 ~= true or not INLINED_6() then
		var271 = arg6
	end
	if arg2 == true and arg3 == true then
	elseif arg2 == true or arg3 == true then
	end
	if arg4 == true or arg2 == true and arg3 == true then
		var271 = 1.75
	else
		var271 = 2
		local var272
	end
	if arg2 == false and arg3 == false then
		var272 = 0
	else
		var272 = (arg5) / (arg7 / 1.75) / var271
	end
	return var271, 5, var272
end
function module_upvr.Lerp(arg1, arg2, arg3, arg4, arg5) -- Line 1268
	local Cache_11 = arg1.Cache
	local Maths = arg1.Modules.Maths
	local Coordinates = Cache_11.Coordinates
	local Velocities_2 = Cache_11.Velocities
	Velocities_2.Swerve = Maths.Lerp(Velocities_2.Swerve, arg3, math.min(arg2 * arg4, 1))
	Coordinates.Tilt = Maths.Lerp(Coordinates.Tilt, arg5 / 1.5 * 0.7, math.min(arg2 * 3, 1))
end
function module_upvr.Physics(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) -- Line 1280
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: new_upvr_4 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 88 start (CF ANALYSIS FAILED)
	local Modules_4 = arg1.Modules
	local Cache_6 = arg1.Cache
	local Character_3 = Cache_6.Character
	local Variables_6 = Cache_6.Variables
	local Velocities = Cache_6.Velocities
	local Humanoid = Character_3.Humanoid
	local Left_Hook_5 = Variables_6.Left_Hook
	local Right_Hook = Variables_6.Right_Hook
	local Left_Swerve_2 = Variables_6.Left_Swerve
	local Right_Swerve = Variables_6.Right_Swerve
	local Flip_3 = Variables_6.Flip
	local Boosting = Variables_6.Boosting
	local Mega_Boosting_2 = Variables_6.Mega_Boosting
	local Skill_Movement_2 = Variables_6.Skill_Movement
	local var314
	if Left_Hook_5.State == true then
		var314 = false
		if Left_Hook_5.Destroying == false then
			if Left_Hook_5.Physics ~= true then
				var314 = false
			else
				var314 = true
			end
		end
	end
	if Right_Hook.State == true then
		if Right_Hook.Destroying == false then
			if Right_Hook.Physics ~= true then
				local _ = false
				-- KONSTANTWARNING: Skipped task `defvar` above
			else
			end
		end
	end
	local var316 = arg3 / 100
	if Left_Swerve_2.State == true and Right_Swerve.State == false then
		-- KONSTANTWARNING: GOTO [101] #60
	end
	-- KONSTANTERROR: [0] 1. Error Block 88 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [90] 53. Error Block 93 start (CF ANALYSIS FAILED)
	local var317
	if Right_Swerve.State == true and Left_Swerve_2.State == false then
		var317 = 1
	else
		var317 = 0
	end
	Velocities.Target_Swerve = arg4 / 3 * var317
	local any_Constants_result1, any_Constants_result2, any_Constants_result3_2 = module_upvr.Constants(arg1, var314, true, Boosting, Velocities.Swerve, Velocities.Target_Swerve, arg4)
	module_upvr.Lerp(arg1, arg5, any_Constants_result1, any_Constants_result2, any_Constants_result3_2)
	if Boosting == true then
	else
	end
	if module_upvr.Escaped.Gained == false and Mega_Boosting_2.Lose == true then
		if Skill_Movement_2.Lose == true then
			if Flip_3.Lose ~= true then
			else
			end
		end
	end
	local var321 = false
	if 0 < Humanoid.Health then
		if module_upvr.Escaped.State == true and module_upvr.Escaped.Gained == false then
			module_upvr.Escaped.Gained = true
			task.synchronize()
			arg7.MaxForce = module_upvr.Max_Force
			arg7.Velocity = new_upvr_4(0, arg4 / module_upvr.Escaped.Multiplier, 0)
			arg7.Parent = Character_3.PrimaryPart
			var321 = true
		elseif Variables_6.Climbing.State == false then
			local function INLINED_7() -- Internal function, doesn't exist in bytecode
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				return true == true
			end
			if var314 == true or INLINED_7() then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
				Modules_4.Hooked.Main(arg1, module_upvr, arg6, arg7, arg8, arg9, Modules_4.Climb, Variables_6, Character_3.PrimaryPart, Humanoid, Left_Hook_5, Right_Hook, Boosting, var314, true, var316, arg4, 0.03 * var316 * arg6, var317, 1)
				var321 = true
			elseif Mega_Boosting_2.State == true and Mega_Boosting_2.Lose == false or Skill_Movement_2.State == true and Skill_Movement_2.Lose == false then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				Modules_4.Momentum.Main(arg1, module_upvr, arg6, arg7, arg8, Character_3.PrimaryPart, Mega_Boosting_2, Skill_Movement_2, var316, arg4)
				var321 = true
			elseif Flip_3.State == true and Flip_3.Adjusted == false then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				Modules_4.Flip.Main(arg1, module_upvr, arg7, Flip_3, Character_3.PrimaryPart, arg4)
				var321 = true
			end
		end
	end
	if var321 == false and true == true then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x4)
		Modules_4.Freefall.Main(arg1, module_upvr, arg6, arg7, arg8, arg9, Variables_6, Cache_6.Coordinates.Lock, Character_3.PrimaryPart, Humanoid, Boosting, Variables_6.Climbing, var316, arg4, 0.03 * var316 * arg6, 1)
	end
	-- KONSTANTERROR: [90] 53. Error Block 93 end (CF ANALYSIS FAILED)
end
function module_upvr.Fling(arg1, arg2, arg3, arg4) -- Line 1342
	--[[ Upvalues[1]:
		[1]: new_upvr_2 (readonly)
	]]
	local Character = arg1.Cache.Character
	if Character ~= nil then
		local PrimaryPart_4 = Character.PrimaryPart
		if arg2 ~= nil then
			local PrimaryPart_3 = arg2.PrimaryPart
			if PrimaryPart_3 ~= nil then
				local any_GetScale_result1 = arg2:GetScale()
				for i_8, v_5 in pairs(Character:GetChildren()) do
					if v_5:IsA("BasePart") == true then
						v_5.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
						v_5.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
					end
				end
				if arg3 == "Grab" then
					i_8 = 600
					v_5 = (any_GetScale_result1 - 3) * 37
					i_8 = PrimaryPart_3.CFrame
					v_5 = 300
					i_8 = v_5 + (any_GetScale_result1 - 3) * 8.25
					v_5 = PrimaryPart_3.CFrame.LookVector * (i_8 + v_5) + i_8.UpVector * i_8
					PrimaryPart_4:ApplyImpulse(v_5)
					return
				end
				if arg3 == "Stomp" then
					i_8 = 200
					v_5 = (any_GetScale_result1 - 3) * 12.5
					i_8 = PrimaryPart_4.CFrame
					v_5 = 550
					i_8 = v_5 + (any_GetScale_result1 - 3) * 15
					v_5 = PrimaryPart_4.CFrame.LookVector * (i_8 + v_5) + i_8.UpVector * i_8
					PrimaryPart_4:ApplyImpulse(v_5)
					return
				end
				if arg3 == "Kick" then
					i_8 = 750
					v_5 = (any_GetScale_result1 - 3) * 46
					i_8 = PrimaryPart_3.CFrame
					v_5 = 200
					i_8 = v_5 + (any_GetScale_result1 - 3) * 5.5
					v_5 = PrimaryPart_3.CFrame.LookVector * (i_8 + v_5) + i_8.UpVector * i_8
					PrimaryPart_4:ApplyImpulse(v_5)
					return
				end
				if arg3 == "Dive" then
					i_8 = 650
					v_5 = (any_GetScale_result1 - 3) * 40
					i_8 = PrimaryPart_3.CFrame
					v_5 = 275
					i_8 = v_5 + (any_GetScale_result1 - 3) * 7.5
					v_5 = PrimaryPart_3.CFrame.LookVector * (i_8 + v_5) + i_8.UpVector * i_8
					PrimaryPart_4:ApplyImpulse(v_5)
					return
				end
				if arg3 == "Punch" then
					i_8 = 575
					v_5 = (any_GetScale_result1 - 3) * 35
					i_8 = PrimaryPart_3.CFrame
					v_5 = 275
					i_8 = v_5 + (any_GetScale_result1 - 3) * 7.5
					v_5 = PrimaryPart_3.CFrame.LookVector * (i_8 + v_5) + i_8.UpVector * i_8
					PrimaryPart_4:ApplyImpulse(v_5)
					return
				end
				if arg3 == "Roar" then
					v_5 = new_upvr_2(PrimaryPart_4.Position, PrimaryPart_3.Position).LookVector * -500 + Vector3.new(0, 1000, 0)
					PrimaryPart_4:ApplyImpulse(v_5)
					return
				end
				if arg3 == "Corkscrew" then
					i_8 = PrimaryPart_3.CFrame
					v_5 = PrimaryPart_3.CFrame.LookVector * 1250 + i_8.UpVector * 725
					PrimaryPart_4:ApplyImpulse(v_5)
					return
				end
				if arg3 == "Brutal" then
					i_8 = PrimaryPart_3.CFrame
					v_5 = PrimaryPart_4.CFrame.LookVector * -625 + i_8.UpVector * 1125
					PrimaryPart_4:ApplyImpulse(v_5)
					return
				end
				if arg3 == "Uppercut" then
					i_8 = PrimaryPart_3.CFrame.UpVector * 2000
					PrimaryPart_4:ApplyImpulse(i_8)
					return
				end
				if arg3 == "Earth_Breaker" then
					v_5 = new_upvr_2(PrimaryPart_4.Position, PrimaryPart_3.Position).LookVector * -500 + Vector3.new(0, 1000, 0)
					PrimaryPart_4:ApplyImpulse(v_5)
					return
				end
				if arg3 == "Charge" then
					v_5 = new_upvr_2(PrimaryPart_4.Position, PrimaryPart_3.Position).LookVector * -500 + Vector3.new(0, 1000, 0)
					PrimaryPart_4:ApplyImpulse(v_5)
				end
			end
		end
	end
end
function module_upvr.Escaping(arg1) -- Line 1440
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local _ = arg1.Services
	local Cache_5 = arg1.Cache
	local Weapon_upvr = arg1.Weapon
	local Effects_4_upvr = arg1.Modules.Effects
	local Variables_10 = Cache_5.Variables
	if Weapon_upvr == "Blades" then
		Effects_4_upvr.Slash(arg1, true)
		Effects_4_upvr.Sound(arg1, tostring("Slash_"..math.random(1, 6)), Cache_5.Character.PrimaryPart)
		if table.find(Cache_5.Slot_Data.Skills.Unlocked, "74") == nil then
			Variables_10.Reload = false
			Variables_10.Full_Reload = false
			-- KONSTANTWARNING: GOTO [67] #44
		end
	else
		Variables_10.Full_Reload = false
	end
	local var346 = module_upvr
	var346.Escaped = {
		State = true;
		Gained = false;
		Multiplier = 1.5;
	}
	if arg1.Skill == '3' or arg1.Skill == "59" or arg1.Skill == "115" or arg1.Skill == "151" then
		var346 = 1
	else
		var346 = 0.5
	end
	task.delay(var346, function() -- Line 1464
		--[[ Upvalues[4]:
			[1]: module_upvr (copied, readonly)
			[2]: Weapon_upvr (readonly)
			[3]: Effects_4_upvr (readonly)
			[4]: arg1 (readonly)
		]]
		module_upvr.Escaped = {
			State = false;
			Gained = false;
		}
		if Weapon_upvr == "Blades" then
			Effects_4_upvr.Slash(arg1, false)
		end
	end)
end
function module_upvr.Is_Stuck(arg1, arg2) -- Line 1469
	local Last_Position_upvr = arg2:GetAttribute("Last_Position")
	if Last_Position_upvr ~= nil then
		task.delay(1, function() -- Line 1473
			--[[ Upvalues[3]:
				[1]: arg1 (readonly)
				[2]: arg2 (readonly)
				[3]: Last_Position_upvr (readonly)
			]]
			local W = arg1.Services.W
			local PrimaryPart_2 = arg2.PrimaryPart
			if PrimaryPart_2 ~= nil then
				local Position = PrimaryPart_2.Position
				if W:Raycast(Last_Position_upvr.Position, (Position - Last_Position_upvr.Position).Unit * (Position - Last_Position_upvr.Position).Magnitude, arg1.Params_2) ~= nil then
					arg2:SetPrimaryPartCFrame(Last_Position_upvr)
					return
				end
				if W:Raycast(Position, Vector3.new(0, 200, 0), arg1.Params_2) ~= nil then
					arg2:SetPrimaryPartCFrame(Last_Position_upvr)
				end
			end
		end)
	end
end
return module_upvr
