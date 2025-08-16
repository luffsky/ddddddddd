-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-08-16 05:13:13
-- Luau version 6, Types version 3
-- Time taken: 0.042530 seconds

local new_upvr_2 = UDim2.new
local module_upvr = {
	Map = {
		Name = nil;
		Difficulty = nil;
		Type = nil;
		Objective = "Skirmish";
	};
	Selected_Map = {
		Name = nil;
		Difficulty = nil;
		Type = nil;
		Limit = nil;
		Object = nil;
	};
	Leaving = false;
	Object_Events = nil;
	Current_Frame = nil;
	Current_Close_Event = nil;
	Open = false;
	Map_Object = nil;
	Icons = {
		Shiganshina = 14990673687;
		Trost = 14990807796;
		["Giant Forest"] = 14990811142;
		Outskirts = 14990809583;
		Utgard = 18166027357;
		["Loading Docks"] = 82515301654640;
		Stohess = 93895615555111;
		["Attack Titan"] = 17660993868;
		["Armored Titan"] = 84552305810975;
		["Female Titan"] = 109020931498025;
	};
	Colours = {
		Easy = Color3.fromRGB(255, 255, 255);
		Normal = Color3.fromRGB(105, 255, 78);
		Hard = Color3.fromRGB(255, 171, 75);
		Severe = Color3.fromRGB(197, 80, 255);
		Aberrant = Color3.fromRGB(255, 80, 83);
	};
	Unlocked = {
		Missions = {};
		Raids = {};
	};
	Events = {};
	Updated = false;
	Click_Events = {};
	Objective_Events = {};
	Boost_Colours = {
		Gold = Color3.fromRGB(185, 120, 36);
		Luck = Color3.fromRGB(76, 236, 29);
		EXP = Color3.fromRGB(243, 139, 255);
	};
	Difficulty_Indexes = {
		Missions = {
			Easy = 1;
			Normal = 2;
			Hard = 3;
			Severe = 4;
			Aberrant = 5;
		};
		Raids = {
			Hard = 3;
			Severe = 4;
			Aberrant = 5;
		};
	};
	Map_Boost_Object = nil;
	Objectives_Open = false;
	Modifiers_Open = false;
	Raids = {
		Trost = "Attack Titan";
		Shiganshina = "Armored Titan";
		Stohess = "Female Titan";
	};
	Transition = nil;
}
local new_upvr = Vector2.new
function module_upvr.Fade(arg1, arg2) -- Line 98
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: new_upvr (readonly)
		[3]: new_upvr_2 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 58 start (CF ANALYSIS FAILED)
	local Modules_2 = arg1.Modules
	local Events_7 = arg1.Events
	local Effects_2 = Modules_2.Effects
	local Lobby_Type_2 = Modules_2.Topbar.Lobby_Type
	local Missions_upvr_2 = arg1.Cache.Interface.Missions
	local var52 = module_upvr
	var52.Open = arg2
	local var53
	if Lobby_Type_2 == "2D" then
		var52 = 0
	else
		var52 = 0.5
	end
	if Lobby_Type_2 == "2D" then
		var53 = 1
	else
		var53 = 0.5
	end
	if Lobby_Type_2 == "2D" then
	else
	end
	if Lobby_Type_2 == "2D" then
	else
	end
	local Prompt = Missions_upvr_2.Prompt
	Prompt.AnchorPoint = new_upvr(var52, var53)
	Missions_upvr_2.Prompt.Position = new_upvr_2(0.5, 0, 0.5, 0)
	-- KONSTANTERROR: [0] 1. Error Block 58 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [130] 97. Error Block 46 start (CF ANALYSIS FAILED)
	Effects_2.Tween(arg1, Missions_upvr_2, "Missions_In", {
		BackgroundTransparency = 0.25;
	}, 0.15)
	if Prompt == "Prompt" then
		Effects_2.Hover(arg1, Missions_upvr_2.Prompt.Main.Selection.Missions, Missions_upvr_2, module_upvr, "Mission", true, Missions_upvr_2.Prompt.Main.Selection.Missions.Inner.Interact)
		Effects_2.Hover(arg1, Missions_upvr_2.Prompt.Main.Selection.Raids, Missions_upvr_2, module_upvr, "Mission", true, Missions_upvr_2.Prompt.Main.Selection.Raids.Inner.Interact)
		Effects_2.Hover(arg1, Missions_upvr_2.Prompt.Main.Selection.Join, Missions_upvr_2, module_upvr, "Mission", true, Missions_upvr_2.Prompt.Main.Selection.Join.Inner.Interact)
		Effects_2.Hover(arg1, Missions_upvr_2.Prompt.Main.Lobbies_Close, Missions_upvr_2, module_upvr, "Mission", true, Missions_upvr_2.Prompt.Main.Lobbies_Close.Interact)
		return
	end
	module_upvr.Info(arg1, Missions_upvr_2[Prompt])
	do
		return
	end
	-- KONSTANTERROR: [130] 97. Error Block 46 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [257] 179. Error Block 63 start (CF ANALYSIS FAILED)
	if arg2 == false then
		Effects_2.Tween(arg1, Missions_upvr_2, "Missions_Out", {
			BackgroundTransparency = 1;
		}, 0.25)
		task.wait(0.1)
		local var57
		if var57 == false then
			var57 = module_upvr.Current_Close_Event
			if var57 ~= nil then
				var57 = module_upvr.Current_Close_Event:Disconnect
				var57()
				var57 = module_upvr
				var57.Current_Close_Event = nil
			end
			var57 = pairs(module_upvr.Click_Events)
			local pairs_result1_5_upvr, pairs_result2, pairs_result3_3 = pairs(module_upvr.Click_Events)
			for _, v in pairs_result1_5_upvr, pairs_result2, pairs_result3_3 do
				v:Disconnect()
			end
			pairs_result1_5_upvr = module_upvr
			pairs_result1_5_upvr.Click_Events = {}
			if module_upvr.Selected_Map.Name ~= nil then
				pairs_result1_5_upvr = "Info"
			else
				pairs_result1_5_upvr = "Prompt"
			end
			local _ = {
				GroupTransparency = 1;
			}
			if pairs_result1_5_upvr ~= "Prompt" then
			end
			if Events_7["Missions_"..pairs_result1_5_upvr.."_Closed"] == nil then
				Events_7["Missions_"..pairs_result1_5_upvr.."_Closed"] = Effects_2.Tween(arg1, Missions_upvr_2[pairs_result1_5_upvr].Main, tostring("Missions_"..pairs_result1_5_upvr.."_Main_Out"), {
					Size = new_upvr_2(0.85, 0, 0.85, 0);
				}, 0.15).Completed:Connect(function() -- Line 155
					--[[ Upvalues[3]:
						[1]: module_upvr (copied, readonly)
						[2]: Missions_upvr_2 (readonly)
						[3]: pairs_result1_5_upvr (readonly)
					]]
					if module_upvr.Open == false and Missions_upvr_2[pairs_result1_5_upvr].Visible == true then
						Missions_upvr_2.Visible = false
						Missions_upvr_2[pairs_result1_5_upvr].Visible = false
					end
				end)
			end
		end
	end
	-- KONSTANTERROR: [257] 179. Error Block 63 end (CF ANALYSIS FAILED)
end
function module_upvr.Switch(arg1, arg2, arg3, arg4) -- Line 165
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: new_upvr_2 (readonly)
	]]
	local Events = arg1.Events
	local Effects_8 = arg1.Modules.Effects
	local Tweens_2 = arg1.Cache.Tweens
	local Prompt_2_upvr = arg2.Prompt
	local var68_upvr = arg2[arg3]
	if arg4 == true then
		module_upvr.Current_Frame = var68_upvr.Name
		if module_upvr.Current_Close_Event == nil then
			module_upvr.Current_Close_Event = Effects_8.Tween(arg1, Prompt_2_upvr, "Missions_Prompt_Out", {
				GroupTransparency = 1;
			}, 0.15).Completed:Connect(function(arg1_2) -- Line 180
				--[[ Upvalues[2]:
					[1]: module_upvr (copied, readonly)
					[2]: Prompt_2_upvr (readonly)
				]]
				if arg1_2.Name ~= "Completed" then
				elseif module_upvr.Current_Frame ~= nil then
					Prompt_2_upvr.Visible = false
				end
			end)
		end
		task.wait(0.1)
		if module_upvr.Current_Frame ~= var68_upvr.Name then
		else
			var68_upvr.Visible = true
			local var71 = Tweens_2[tostring("Missions_"..var68_upvr.Name.."_Out")]
			if var71 ~= nil then
				var71:Cancel()
			end
			local var72 = Tweens_2[tostring("Missions_"..var68_upvr.Name.."_Main_Out")]
			if var72 ~= nil then
				var72:Cancel()
			end
			Effects_8.Tween(arg1, var68_upvr, "Missions_"..var68_upvr.Name.."_In", {
				GroupTransparency = 0;
			}, 0.25)
			Effects_8.Tween(arg1, var68_upvr.Main, "Missions_"..var68_upvr.Name.."_Main_In", {
				Size = new_upvr_2(0.95, 0, 0.95, 0);
			}, 0.25)
			if var68_upvr.Name == "Missions" or var68_upvr.Name == "Raids" then
				module_upvr.Update(arg1, arg2, var68_upvr, var68_upvr.Name)
				return
			end
			module_upvr[var68_upvr.Name](arg1, arg2, var68_upvr)
		end
	end
	module_upvr.Current_Frame = nil
	Effects_8.Tween(arg1, var68_upvr, tostring("Missions_"..var68_upvr.Name.."_Out"), {
		GroupTransparency = 1;
	}, 0.15)
	if Events["Mission_"..var68_upvr.Name.."_Closed"] == nil then
		Events["Mission_"..var68_upvr.Name.."_Closed"] = Effects_8.Tween(arg1, var68_upvr.Main, tostring("Missions_"..var68_upvr.Name.."_Main_Out"), {
			Size = new_upvr_2(0.85, 0, 0.85, 0);
		}, 0.15).Completed:Connect(function(arg1_3) -- Line 209
			--[[ Upvalues[2]:
				[1]: module_upvr (copied, readonly)
				[2]: var68_upvr (readonly)
			]]
			if arg1_3.Name ~= "Completed" then
			elseif module_upvr.Current_Frame == nil then
				var68_upvr.Visible = false
			end
		end)
	end
	task.wait(0.1)
	if module_upvr.Current_Frame ~= nil then
	else
		Prompt_2_upvr.Visible = true
		if module_upvr.Current_Close_Event ~= nil then
			module_upvr.Current_Close_Event:Disconnect()
			module_upvr.Current_Close_Event = nil
		end
		Effects_8.Tween(arg1, Prompt_2_upvr, "Missions_Prompt_In", {
			GroupTransparency = 0;
		}, 0.25)
	end
end
function module_upvr.Boost(arg1, arg2, arg3) -- Line 226
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local W = arg1.Services.W
	local Boosted_Boost = W:GetAttribute("Boosted_Boost")
	local Boosted_Timer_3 = W:GetAttribute("Boosted_Timer")
	if arg3 == nil then
		for i_2, v_2 in pairs(arg2.Main.Maps.Maps:GetChildren()) do
			if v_2:IsA("Frame") == true then
				local string_split_result1 = string.split(v_2.Name, '_')
				if unpack(string_split_result1) ~= W:GetAttribute("Boosted_Map") then
					string_split_result1 = false
				else
					string_split_result1 = true
				end
				v_2.Boost.Visible = string_split_result1
				if string_split_result1 == true then
					if Boosted_Timer_3 == nil or Boosted_Timer_3 < 0 then
						Boosted_Timer_3 = 0
					end
					Boosted_Timer_3 -= (Boosted_Timer_3 - Boosted_Timer_3 % 60) / 60 * 60
					Boosted_Timer_3 = string.format("%02i", Boosted_Timer_3)
					v_2.Boost.Title.Text = string.upper(Boosted_Boost.." BOOST ("..string.format("%02i", (Boosted_Timer_3 - Boosted_Timer_3 % 60) / 60)..':'..Boosted_Timer_3..')')
					v_2.Boost.Title.Gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, module_upvr.Boost_Colours[Boosted_Boost])})
					module_upvr.Map_Boost_Object = v_2
				end
			end
		end
		local Map = module_upvr.Map
		if Map.Name ~= nil and Map.Difficulty ~= nil then
			v_2 = arg2.Main.Info.Main
			i_2 = v_2.Items
			v_2 = Map.Name
			arg1.Modules.Rewards.Update(arg1, i_2, v_2, Map.Difficulty, Map.Type)
		end
	end
end
function module_upvr.Update(arg1, arg2, arg3, arg4) -- Line 288
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local Events_4 = arg1.Events
	local W_2_upvr = arg1.Services.W
	local Effects_7 = arg1.Modules.Effects
	if module_upvr.Map.Type ~= arg4 then
		local var121 = module_upvr
		if arg4 == "Missions" then
			var121 = "Shiganshina"
		else
			var121 = "Trost"
		end
		module_upvr.Map.Name = var121
		var121.Map.Type = arg4
	end
	for _, v_3 in pairs(arg3.Main.Maps.Maps:GetChildren()) do
		if v_3:IsA("Frame") == true then
			Effects_7.Hover(arg1, v_3, arg3, module_upvr, "Mission", true, v_3.Icon)
			if v_3.Name == tostring(module_upvr.Map.Name..'_'..arg4) then
				module_upvr.Icon(arg1, v_3, arg3)
			end
		end
	end
	module_upvr.Difficulties(arg1, arg3, arg4)
	local Info_5 = arg3.Main.Info
	Effects_7.Hover(arg1, Info_5.Main.Buttons["M_Back_"..arg4], arg3, module_upvr, "Mission")
	Effects_7.Hover(arg1, Info_5.Main.Buttons["Creation_"..arg4], arg3, module_upvr, "Mission")
	if arg4 == "Missions" then
		Info_5.Main.Visible = true
		Info_5.Objectives.Visible = false
		Info_5.Main.GroupTransparency = 0
		Info_5.Objectives.GroupTransparency = 1
		Effects_7.Hover(arg1, Info_5.Main.Buttons["Objectives_"..arg4], arg3, module_upvr, "Mission")
		local tostring_result1 = tostring("Boosted_Map_Change_"..arg4)
		local tostring_result1_3 = tostring("Boosted_Boost_Change_"..arg4)
		local tostring_result1_5 = tostring("Boosted_Timer_Change_"..arg4)
		if Events_4[tostring_result1] == nil then
			Events_4[tostring_result1] = W_2_upvr:GetAttributeChangedSignal("Boosted_Map"):Connect(function() -- Line 324
				--[[ Upvalues[3]:
					[1]: module_upvr (copied, readonly)
					[2]: arg1 (readonly)
					[3]: arg3 (readonly)
				]]
				module_upvr.Boost(arg1, arg3)
			end)
		end
		if Events_4[tostring_result1_3] == nil then
			Events_4[tostring_result1_3] = W_2_upvr:GetAttributeChangedSignal("Boosted_Boost"):Connect(function() -- Line 330
				--[[ Upvalues[3]:
					[1]: module_upvr (copied, readonly)
					[2]: arg1 (readonly)
					[3]: arg3 (readonly)
				]]
				module_upvr.Boost(arg1, arg3)
			end)
			module_upvr.Boost(arg1, arg3)
		end
		if Events_4[tostring_result1_5] == nil then
			Events_4[tostring_result1_5] = W_2_upvr:GetAttributeChangedSignal("Boosted_Timer"):Connect(function() -- Line 338
				--[[ Upvalues[2]:
					[1]: module_upvr (copied, readonly)
					[2]: W_2_upvr (readonly)
				]]
				-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
				local Map_Boost_Object = module_upvr.Map_Boost_Object
				if Map_Boost_Object ~= nil then
					local Boosted_Timer_2 = W_2_upvr:GetAttribute("Boosted_Timer")
					if Boosted_Timer_2 == nil or Boosted_Timer_2 < 0 then
					end
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					local var134 = (0 - 0 % 60) / 60
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					Map_Boost_Object.Boost.Title.Text = string.upper(W_2_upvr:GetAttribute("Boosted_Boost").." BOOST ("..string.format("%02i", var134)..':'..string.format("%02i", 0 - var134 * 60)..')')
				end
			end)
		end
	end
end
function module_upvr.Difficulties(arg1, arg2, arg3) -- Line 359
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local Modules_6 = arg1.Modules
	local Effects_4 = Modules_6.Effects
	local _, any_Get_Data_result2 = Modules_6.Update.Get_Data(arg1, true)
	if any_Get_Data_result2 ~= nil then
		local var147 = module_upvr.Unlocked[arg3]
		if #var147 == 0 then
			local var148_upvr = module_upvr.Difficulty_Indexes[arg3]
			for i_4, _ in pairs(var148_upvr) do
				table.insert(var147, i_4)
				local var152
			end
			table.sort(module_upvr.Unlocked[arg3], function(arg1_4, arg2_2) -- Line 376
				--[[ Upvalues[1]:
					[1]: var148_upvr (readonly)
				]]
				local var154
				if var148_upvr[arg1_4] >= var148_upvr[arg2_2] then
					var154 = false
				else
					var154 = true
				end
				return var154
			end)
			Effects_4.Hover(arg1, arg2.Main.Info.Main.Difficulty["Backward_"..arg3], arg2, module_upvr, "Mission")
			Effects_4.Hover(arg1, arg2.Main.Info.Main.Difficulty["Forward_"..arg3], arg2, module_upvr, "Mission")
			local _1 = var152[1]
			if _1 == nil then
				_1 = "Hard"
			end
			module_upvr.Map.Difficulty = _1
		else
			var148_upvr = table.find(var152, module_upvr.Map.Difficulty)
			if var148_upvr == nil then
				module_upvr.Map.Difficulty = "Hard"
			end
		end
		var148_upvr = module_upvr.Difficulty
		var148_upvr(arg1, nil, arg2, arg3)
	end
end
function module_upvr.Difficulty(arg1, arg2, arg3, arg4) -- Line 401
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 51 start (CF ANALYSIS FAILED)
	local _ = arg1.Modules
	if arg2 ~= nil and arg2.Name:find("Backward") ~= nil then
		-- KONSTANTWARNING: GOTO [42] #27
	end
	-- KONSTANTERROR: [0] 1. Error Block 51 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [29] 18. Error Block 52 start (CF ANALYSIS FAILED)
	if arg2 ~= nil and arg2.Name:find("Forward") ~= nil then
	else
	end
	local _, _, _ = pairs(module_upvr.Unlocked[module_upvr.Map.Type])
	-- KONSTANTERROR: [29] 18. Error Block 52 end (CF ANALYSIS FAILED)
end
function module_upvr.Icon(arg1, arg2, arg3, arg4) -- Line 463
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var160
	if module_upvr.Map_Object ~= arg2 then
		local Modules = arg1.Modules
		local Effects_11 = Modules.Effects
		var160 = module_upvr
		var160 = arg2.Name
		local string_gsub_result1 = string.gsub(var160, tostring('_'..arg3.Name), "")
		var160 = module_upvr.Map_Object
		if var160 ~= nil then
			var160 = Effects_11.Tween
			var160(arg1, module_upvr.Map_Object.Icon.Stroke, tostring(module_upvr.Map_Object.Name.."_Stroke_Out_"), {
				Transparency = 1;
			}, 0.25)
		end
		var160 = module_upvr
		var160.Map_Object = arg2
		var160 = module_upvr.Boost
		var160(arg1, arg3, true)
		var160 = Effects_11.Tween
		var160(arg1, arg2.Icon.Stroke, tostring(arg2.Name.."_Stroke_In_"), {
			Transparency = 0;
		}, 0.25)
		var160 = module_upvr.Map
		var160.Name = string_gsub_result1
		var160 = module_upvr.Map
		var160.Objective = "Skirmish"
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var160 = module_upvr.Raids[string_gsub_result1]
			return var160
		end
		if var160.Map.Type ~= "Raids" or not INLINED() then
			var160 = string_gsub_result1
		end
		arg3.Main.Info.Map.Text = string.upper(var160)
		arg3.Main.Info.Icon.Image = tostring(arg1.Prefix..module_upvr.Icons[var160])
		if arg4 == true then
			Modules.Rewards.Update(arg1, arg3.Main.Info.Main.Items, module_upvr.Map.Name, module_upvr.Map.Difficulty, module_upvr.Map.Type)
		end
		if module_upvr.Objectives_Open == true then
			module_upvr.Objectives(arg1, arg3.Main.Info, true)
		end
	end
end
function module_upvr.Create_M_Back(arg1, arg2) -- Line 501
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if module_upvr.Modifiers_Open == true then
	else
		module_upvr.Switch(arg1, arg2.Parent, module_upvr.Map.Type, false)
	end
end
function module_upvr.Create_Creation(arg1, arg2) -- Line 507
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: new_upvr_2 (readonly)
	]]
	if module_upvr.Current_Frame ~= nil then
		local any_Invoke_result1_2 = arg1:Invoke("S_Missions", "Create", module_upvr.Map)
		if any_Invoke_result1_2 ~= nil then
			arg2.GroupTransparency = 1
			arg2.Visible = false
			arg2.Main.Size = new_upvr_2(0.85, 0, 0.85, 0)
			if module_upvr.Current_Close_Event ~= nil then
				module_upvr.Current_Close_Event:Disconnect()
				module_upvr.Current_Close_Event = nil
			end
			module_upvr.Selected_Map = {
				Name = any_Invoke_result1_2.Name;
				Difficulty = any_Invoke_result1_2.Value;
				Type = any_Invoke_result1_2:GetAttribute("Type");
				Limit = any_Invoke_result1_2:GetAttribute("Limit");
				Object = any_Invoke_result1_2;
			}
			module_upvr.Fade(arg1, true)
		end
	end
end
function module_upvr.Create_Objectives(arg1, arg2) -- Line 523
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if arg2.Name ~= "Missions" then
	else
		local Events_2 = arg1.Events
		local Effects_5_upvr = arg1.Modules.Effects
		local Info_9_upvw = arg2.Main.Info
		module_upvr.Objectives_Open = true
		if Events_2.Objectives_Open == nil then
			Events_2.Objectives_Open = Effects_5_upvr.Tween(arg1, Info_9_upvw.Main, "Mission_Create_Out", {
				GroupTransparency = 1;
			}).Completed:Connect(function(arg1_5) -- Line 539
				--[[ Upvalues[5]:
					[1]: module_upvr (copied, readonly)
					[2]: Info_9_upvw (read and write)
					[3]: Effects_5_upvr (readonly)
					[4]: arg1 (readonly)
					[5]: arg2 (readonly)
				]]
				if arg1_5.Name == "Completed" and module_upvr.Objectives_Open == true then
					Info_9_upvw.Main.Visible = false
					Info_9_upvw.Objectives.Visible = true
					Effects_5_upvr.Tween(arg1, Info_9_upvw.Objectives, "Mission_Objectives_In", {
						GroupTransparency = 0;
					})
					Effects_5_upvr.Hover(arg1, Info_9_upvw.Objectives.Objectives_Buttons.Objectives_Return, arg2, module_upvr, "Mission")
					module_upvr.Objectives(arg1, Info_9_upvw)
				end
			end)
		end
	end
end
local fromRGB_upvr = Color3.fromRGB
function module_upvr.Objectives(arg1, arg2, arg3) -- Line 553
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: fromRGB_upvr (readonly)
		[3]: new_upvr_2 (readonly)
	]]
	if module_upvr.Current_Frame ~= nil then
		if module_upvr.Current_Frame == "Missions" then
			local Modules_9 = arg1.Modules
			local Effects_6 = Modules_9.Effects
			local var185 = Modules_9.Objectives[module_upvr.Map.Name]
			for _, v_5 in pairs(module_upvr.Objective_Events) do
				v_5:Disconnect()
			end
			module_upvr.Objective_Events = {}
			for i_6, v_6 in pairs(arg2.Objectives.Main:GetChildren()) do
				if v_6:IsA("UIListLayout") == false then
					v_6:Destroy()
				end
			end
			if arg3 == true then
				v_6 = module_upvr
				i_6 = v_6.Map
				if table.find(var185, i_6.Objective) == nil then
					module_upvr.Map.Objective = "Skirmish"
				end
				arg2.Objectives.GroupTransparency = 1
			end
			for i_7, v_7 in pairs(var185) do
				local clone = arg1:Get("Asset", {"Effects", "Objective"}):Clone()
				clone.Name = v_7
				clone.Selected.Title.Text = string.upper(v_7)
				clone.Selected.Description.Text = Modules_9.Descriptions.Objectives[v_7]
				clone.Parent = arg2.Objectives.Main
				Effects_6.Hover(arg1, clone, arg2, module_upvr, "Objective", nil, nil, true, nil, module_upvr.Objective_Events)
				if v_7 == module_upvr.Map.Objective then
					clone.GroupColor3 = fromRGB_upvr(255, 255, 255)
					clone.Size = new_upvr_2(0.315, 0, 0.892, 0)
				end
			end
			if arg3 == true then
				i_7 = "Objectives_Visibility"
				v_7 = {}
				v_7.GroupTransparency = 0
				Effects_6.Tween(arg1, arg2.Objectives, i_7, v_7, 0.2, nil, nil, nil, nil, nil, true)
			end
		end
	end
end
function module_upvr.Objective(arg1, arg2, arg3) -- Line 587
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local Modules_3 = arg1.Modules
	local Effects_9 = Modules_3.Effects
	local Tweens = Modules_3.Tweens
	local Objective_2 = module_upvr.Map.Objective
	if Objective_2 ~= arg2.Name then
		module_upvr.Map.Objective = arg2.Name
		local SOME = arg3.Objectives.Main:FindFirstChild(Objective_2)
		if SOME ~= nil then
			Tweens.Tween(arg1, Effects_9, SOME, module_upvr, nil, "Out", true)
		end
		Tweens.Tween(arg1, Effects_9, arg2, module_upvr, nil, "In", true)
	end
end
function module_upvr.Update_Empty(arg1, arg2) -- Line 605
	local var202
	if #arg2:GetChildren() > 2 then
		var202 = false
	else
		var202 = true
	end
	arg2.Empty.Visible = var202
	if var202 == true then
		arg2.Empty.Label.TextTransparency = 1
		arg1.Modules.Effects.Tween(arg1, arg2.Empty.Label, "Empty_In", {
			TextTransparency = 0;
		}, 0.35, nil, nil, nil, nil, nil, true)
	end
end
function module_upvr.Create_Template(arg1, arg2, arg3, arg4) -- Line 621
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local var204
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [13] 8. Error Block 25 start (CF ANALYSIS FAILED)
	var204 = "Leader"
	var204 = "Asset"
	local clone_3 = arg1:Get(var204, {"Effects", "Mission"}):Clone()
	var204 = tostring(arg2.Name.."_Lobby_Template")
	clone_3.Name = var204
	local function INLINED_2() -- Internal function, doesn't exist in bytecode
		var204 = module_upvr.Raids[arg2.Name]
		return var204
	end
	if arg2:GetAttribute("Type") ~= "Raids" or not INLINED_2() then
		var204 = arg2.Name
	end
	clone_3.Map.Text = string.upper(var204)
	clone_3.Icon.Image = tostring(arg1.Prefix..module_upvr.Icons[var204])
	clone_3.Difficulty.Text = string.upper(arg2.Value)
	clone_3.Difficulty.TextColor3 = module_upvr.Colours[arg2.Value]
	if arg2:GetAttribute("Objective") then
		clone_3.Objective.Text = string.upper(arg2:GetAttribute("Objective"))
		-- KONSTANTWARNING: GOTO [123] #82
	end
	-- KONSTANTERROR: [13] 8. Error Block 25 end (CF ANALYSIS FAILED)
end
function module_upvr.Lobbies(arg1, arg2, arg3) -- Line 697
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if module_upvr.Open == true then
		local Missions = arg1.Services.RepS.Missions
		arg1.Modules.Effects.Hover(arg1, arg3.Main.Maps.Lobbies_Closing, arg2, module_upvr, "Mission")
		local Inner = arg3.Main.Maps.Maps.Inner
		module_upvr.Update_Empty(arg1, Inner)
		if module_upvr.Updated == false then
			module_upvr.Updated = true
			for _, v_8 in pairs(Missions:GetChildren()) do
				module_upvr.Create_Template(arg1, v_8, Inner)
				local var220_upvr
			end
			arg1.Events.Map_Update = Missions.ChildAdded:Connect(function(arg1_6) -- Line 720
				--[[ Upvalues[3]:
					[1]: module_upvr (copied, readonly)
					[2]: arg1 (readonly)
					[3]: var220_upvr (readonly)
				]]
				task.wait(0.5)
				module_upvr.Create_Template(arg1, arg1_6, var220_upvr, true)
			end)
		end
	end
end
function module_upvr.Join(arg1, arg2) -- Line 729
	--[[ Upvalues[2]:
		[1]: new_upvr_2 (readonly)
		[2]: module_upvr (readonly)
	]]
	local Notify = arg1.Modules.Notify
	local Parent = arg2.Parent.Parent.Parent.Parent.Parent
	local any_Invoke_result1, any_Invoke_result2 = arg1:Invoke("S_Missions", "Join", arg2:GetAttribute("ID"))
	if any_Invoke_result1 ~= nil then
		if any_Invoke_result1.Parent ~= nil then
			Parent.GroupTransparency = 1
			Parent.Visible = false
			Parent.Main.Size = new_upvr_2(0.85, 0, 0.85, 0)
			if module_upvr.Current_Close_Event ~= nil then
				module_upvr.Current_Close_Event:Disconnect()
				module_upvr.Current_Close_Event = nil
			end
			module_upvr.Selected_Map = {
				Name = any_Invoke_result1.Name;
				Difficulty = any_Invoke_result1.Value;
				Type = any_Invoke_result1:GetAttribute("Type");
				Limit = any_Invoke_result1:GetAttribute("Limit");
				Object = any_Invoke_result1;
			}
			module_upvr.Fade(arg1, true)
		else
			Notify.Fade(arg1, true, "Party has been disbanded!")
		end
	end
	if any_Invoke_result2 ~= nil then
		Notify.Fade(arg1, true, any_Invoke_result2)
	end
end
function module_upvr.Update_Screen(arg1) -- Line 761
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local Selected_Map = module_upvr.Selected_Map
	local Cache = arg1.Cache
	local Mission = Cache.Gear_Up.Mission
	local Name_2 = Selected_Map.Name
	local Difficulty_2 = Selected_Map.Difficulty
	local Type = Selected_Map.Type
	local Object = Selected_Map.Object
	if Name_2 ~= nil and Difficulty_2 ~= nil then
		local var242
		if Type ~= nil and Object ~= nil then
			var242 = "Leader"
			local SOME_4 = Object:FindFirstChild(var242)
			local var244 = false
			if SOME_4 ~= nil then
				var242 = SOME_4.Value
				if var242 ~= Cache.Player.Name then
					var244 = false
				else
					var244 = true
				end
			end
			local function INLINED_4() -- Internal function, doesn't exist in bytecode
				var242 = module_upvr.Raids[Name_2]
				return var242
			end
			if Type ~= "Raids" or not INLINED_4() then
				var242 = Name_2
			end
			Mission.Start.Visible = var244
			Mission.Start.BackgroundTransparency = 0
			Mission.Start.Title.TextTransparency = 0
			Mission.Main.Interact.Title.TextTransparency = 1
			Mission.Main.Interact.Title.TextTransparency = 1
			Mission.Main.Icon.Image = tostring(arg1.Prefix..module_upvr.Icons[var242])
			Mission.Info.Map.Text = string.upper(var242)
			Mission.Info.Map.TextColor3 = module_upvr.Colours[Difficulty_2]
			return
		end
	end
	Mission.Start.Visible = false
	Mission.Start.BackgroundTransparency = 1
	Mission.Start.Title.TextTransparency = 1
	Mission.Main.Interact.Title.TextTransparency = 0
	Mission.Main.Interact.Title.TextTransparency = 0.5
	Mission.Main.Icon.Image = ""
	Mission.Info.Map.Text = "N/A"
	Mission.Info.Map.TextColor3 = Color3.fromRGB(255, 255, 255)
end
function module_upvr.Reset(arg1, arg2) -- Line 794
	--[[ Upvalues[2]:
		[1]: new_upvr_2 (readonly)
		[2]: module_upvr (readonly)
	]]
	arg2.GroupTransparency = 1
	arg2.Visible = false
	arg2.Main.Size = new_upvr_2(0.85, 0, 0.85, 0)
	module_upvr.Selected_Map = {
		Name = nil;
		Difficulty = nil;
		Type = nil;
		Limit = nil;
		Object = nil;
	}
	if module_upvr.Object_Events ~= nil then
		for _, v_9 in pairs(module_upvr.Object_Events) do
			v_9:Disconnect()
		end
		module_upvr.Object_Events = nil
	end
	if module_upvr.Modifiers_Open == true then
		local Info_4 = arg2.Main.Info
		module_upvr.Modifiers_Open = false
		Info_4.Main.Visible = true
		Info_4.Modifiers.Visible = false
		Info_4.Main.GroupTransparency = 0
		Info_4.Modifiers.GroupTransparency = 1
	end
	if module_upvr.Open == true then
		module_upvr.Fade(arg1, true)
	end
	module_upvr.Update_Screen(arg1)
end
function module_upvr.Info(arg1, arg2) -- Line 824
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 72 start (CF ANALYSIS FAILED)
	local Modules_8 = arg1.Modules
	local Effects_upvr_4 = Modules_8.Effects
	local Player_upvr = arg1.Cache.Player
	local Info_3_upvr = arg2.Main.Info
	local Selected_Map_2 = module_upvr.Selected_Map
	local Object_5_upvr = Selected_Map_2.Object
	for _, v_10 in pairs(module_upvr.Click_Events) do
		v_10:Disconnect()
	end
	local var263 = module_upvr
	var263.Click_Events = {}
	-- KONSTANTERROR: [0] 1. Error Block 72 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [52] 30. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [52] 30. Error Block 4 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [54] 31. Error Block 5 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [54] 31. Error Block 5 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [56] 32. Error Block 6 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [56] 32. Error Block 6 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [58] 33. Error Block 7 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [58] 33. Error Block 7 end (CF ANALYSIS FAILED)
	Effects_upvr_4.Hover(arg1, Info_3_upvr.Main.Info_Buttons.Left, arg2, module_upvr, "Mission")
	Effects_upvr_4.Hover(arg1, Info_3_upvr.Main.Info_Buttons.Begin, arg2, module_upvr, "Mission")
	Effects_upvr_4.Hover(arg1, Info_3_upvr.Main.Info_Buttons.Modify, arg2, module_upvr, "Mission")
	Effects_upvr_4.Hover(arg1, Info_3_upvr.Info_Close, arg2, module_upvr, "Mission")
	Info_3_upvr.Main.Info_Buttons.Begin.Visible = var263
	if module_upvr.Object_Events == nil then
		local tbl = {}
		local Modifiers_2_upvr = Modules_8.Modifiers
		table.insert(tbl, Object_5_upvr:GetPropertyChangedSignal("Parent"):Connect(function() -- Line 936
			--[[ Upvalues[4]:
				[1]: Object_5_upvr (readonly)
				[2]: module_upvr (copied, readonly)
				[3]: arg1 (readonly)
				[4]: arg2 (readonly)
			]]
			if Object_5_upvr.Parent == nil then
				if module_upvr.Leaving == false then
					module_upvr.Reset(arg1, arg2)
				end
			end
		end))
		table.insert(tbl, Object_5_upvr.ChildAdded:Connect(function() -- Line 942
			--[[ Upvalues[3]:
				[1]: module_upvr (copied, readonly)
				[2]: arg1 (readonly)
				[3]: arg2 (readonly)
			]]
			if module_upvr.Leaving == false then
				module_upvr.Info(arg1, arg2)
			end
		end))
		table.insert(tbl, Object_5_upvr.ChildRemoved:Connect(function(arg1_7) -- Line 946
			--[[ Upvalues[4]:
				[1]: module_upvr (copied, readonly)
				[2]: Player_upvr (readonly)
				[3]: arg1 (readonly)
				[4]: arg2 (readonly)
			]]
			if module_upvr.Leaving == false then
				if arg1_7.Value == Player_upvr.Name then
					module_upvr.Reset(arg1, arg2)
					return
				end
				module_upvr.Info(arg1, arg2)
			end
		end))
		table.insert(tbl, Object_5_upvr:GetAttributeChangedSignal("Modifiers"):Connect(function() -- Line 957
			--[[ Upvalues[7]:
				[1]: Object_5_upvr (readonly)
				[2]: module_upvr (copied, readonly)
				[3]: Player_upvr (readonly)
				[4]: Modifiers_2_upvr (readonly)
				[5]: Info_3_upvr (readonly)
				[6]: Effects_upvr_4 (readonly)
				[7]: arg1 (readonly)
			]]
			local Leader = Object_5_upvr:FindFirstChild("Leader")
			if module_upvr.Modifiers_Open == true and Leader ~= nil then
				if Leader.Value ~= Player_upvr.Name then
					for _, v_11 in pairs(Modifiers_2_upvr) do
						local Tag = v_11.Tag
						local SOME_2 = Info_3_upvr.Modifiers.Options:FindFirstChild(Tag)
						local var280
						if SOME_2 ~= nil then
							local tbl_5 = {}
							if Object_5_upvr:GetAttribute("Modifiers"):find(Tag) ~= nil then
								var280 = 0
							else
								var280 = 1
							end
							tbl_5.ImageTransparency = var280
							var280 = 0.2
							Effects_upvr_4.Tween(arg1, SOME_2.Selected.Checkmark, "Checkmark", tbl_5, var280, nil, nil, nil, nil, nil, true)
						end
					end
				end
			end
		end))
		module_upvr.Object_Events = tbl
	end
	module_upvr.Update_Screen(arg1)
	-- KONSTANTERROR: [521] 359. Error Block 53 start (CF ANALYSIS FAILED)
	module_upvr.Current_Frame = nil
	-- KONSTANTERROR: [521] 359. Error Block 53 end (CF ANALYSIS FAILED)
end
function module_upvr.Info_Left(arg1, arg2) -- Line 984
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if module_upvr.Transition == true then
	else
		module_upvr.Leaving = true
		if arg1:Invoke("S_Missions", "Leave") == true then
			module_upvr.Reset(arg1, arg2)
			module_upvr.Leaving = false
		end
	end
end
function module_upvr.Info_Begin(arg1, arg2) -- Line 996
	arg1:Invoke("S_Missions", "Start")
end
function module_upvr.Info_Modify(arg1, arg2) -- Line 1000
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if module_upvr.Transition == true then
	else
		local Events_5 = arg1.Events
		local Effects_upvr_3 = arg1.Modules.Effects
		local Info_7_upvw = arg2.Main.Info
		module_upvr.Modifiers_Open = true
		module_upvr.Transition = true
		if Events_5.Modify_Open == nil then
			Events_5.Modify_Open = Effects_upvr_3.Tween(arg1, Info_7_upvw.Main, "Mission_Main_Out", {
				GroupTransparency = 1;
			}).Completed:Connect(function(arg1_8) -- Line 1016
				--[[ Upvalues[5]:
					[1]: module_upvr (copied, readonly)
					[2]: Info_7_upvw (read and write)
					[3]: Effects_upvr_3 (readonly)
					[4]: arg1 (readonly)
					[5]: arg2 (readonly)
				]]
				if arg1_8.Name == "Completed" and module_upvr.Modifiers_Open == true then
					Info_7_upvw.Main.Visible = false
					Info_7_upvw.Modifiers.Visible = true
					Effects_upvr_3.Tween(arg1, Info_7_upvw.Modifiers, "Mission_Modifiers_In", {
						GroupTransparency = 0;
					})
					Effects_upvr_3.Hover(arg1, Info_7_upvw.Modifiers.Modifiers_Buttons.Modifiers_Return, arg2, module_upvr, "Mission")
					module_upvr.Modifiers(arg1, Info_7_upvw.Modifiers)
					task.delay(0.25, function() -- Line 1026
						--[[ Upvalues[1]:
							[1]: module_upvr (copied, readonly)
						]]
						module_upvr.Transition = false
					end)
				end
			end)
		end
	end
end
function module_upvr.Info_Modifiers_Return(arg1, arg2) -- Line 1032
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if module_upvr.Transition == true then
	else
		local Events_6 = arg1.Events
		local Effects_upvr = arg1.Modules.Effects
		local Info_6_upvw = arg2.Main.Info
		module_upvr.Modifiers_Open = false
		module_upvr.Transition = true
		if Events_6.Modify_Close == nil then
			Events_6.Modify_Close = Effects_upvr.Tween(arg1, Info_6_upvw.Modifiers, "Mission_Modifiers_Out", {
				GroupTransparency = 1;
			}).Completed:Connect(function(arg1_9) -- Line 1046
				--[[ Upvalues[4]:
					[1]: module_upvr (copied, readonly)
					[2]: Info_6_upvw (read and write)
					[3]: Effects_upvr (readonly)
					[4]: arg1 (readonly)
				]]
				if arg1_9.Name == "Completed" and module_upvr.Modifiers_Open == false then
					Info_6_upvw.Main.Visible = true
					Info_6_upvw.Modifiers.Visible = false
					Effects_upvr.Tween(arg1, Info_6_upvw.Main, "Mission_Main_In", {
						GroupTransparency = 0;
					})
					task.delay(0.25, function() -- Line 1052
						--[[ Upvalues[1]:
							[1]: module_upvr (copied, readonly)
						]]
						module_upvr.Transition = false
					end)
				end
			end)
		end
	end
end
function module_upvr.Info_Objectives_Return(arg1, arg2) -- Line 1058
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local Events_9 = arg1.Events
	local Effects_upvr_2 = arg1.Modules.Effects
	local Info_2_upvw = arg2.Main.Info
	module_upvr.Objectives_Open = false
	if Events_9.Objectives_Close == nil then
		Events_9.Objectives_Close = Effects_upvr_2.Tween(arg1, Info_2_upvw.Objectives, "Mission_Objectives_Out", {
			GroupTransparency = 1;
		}).Completed:Connect(function(arg1_10) -- Line 1070
			--[[ Upvalues[4]:
				[1]: module_upvr (copied, readonly)
				[2]: Info_2_upvw (read and write)
				[3]: Effects_upvr_2 (readonly)
				[4]: arg1 (readonly)
			]]
			if arg1_10.Name == "Completed" and module_upvr.Objectives_Open == false then
				Info_2_upvw.Main.Visible = true
				Info_2_upvw.Objectives.Visible = false
				Effects_upvr_2.Tween(arg1, Info_2_upvw.Main, "Mission_Create_In", {
					GroupTransparency = 0;
				})
			end
		end)
	end
end
function module_upvr.Modifiers(arg1, arg2) -- Line 1082
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local Modules_5 = arg1.Modules
	local Object_3 = module_upvr.Selected_Map.Object
	if Object_3 ~= nil then
		for _, v_12 in pairs(Modules_5.Modifiers) do
			local Tag_2 = v_12.Tag
			local Description = v_12.Description
			local Boost_2 = v_12.Boost
			if Object_3:GetAttribute("Type") == "Raids" then
				Description = string.gsub(Description, "XP/Gold", "Luck")
				Boost_2 /= 2
			end
			Description = string.gsub(Description, "{x}", string.format("%.1f", Boost_2))
			local var336 = Description
			if Tag_2 == "Time Trial" then
				local var337 = Modules_5.Values.Time_Trial_Times[Object_3.Name][Object_3:GetAttribute("Objective")][math.min(Object_3:GetAttribute("Players"), 5)]
				if var337 then
					var336 = string.gsub(var336, "{xx:xx}", Modules_5.Format.Conversion(var337, true))
					local var338
				end
			end
			if arg2.Options:FindFirstChild(Tag_2) == nil then
				local clone_2 = arg1:Get("Asset", {"Effects", "Option"}):Clone()
				clone_2.Name = Tag_2
				var338 = clone_2.Description
				clone_2.Title.Text = string.upper(Tag_2)
				var338.Text = var336:gsub("(%d+%.?%d*)", "<font color=\"rgb(218,176,97)\">%1</font>")
				var338 = clone_2.Selected
				if Object_3:GetAttribute("Modifiers"):find(Tag_2) ~= nil then
					var338 = 0
				else
					var338 = 1
				end
				var338.Checkmark.ImageTransparency = var338
				clone_2.Parent = arg2.Options
				Modules_5.Effects.Hover(arg1, clone_2, arg2, module_upvr, "Modify", nil, clone_2.Interact)
			else
				clone_2.Description.Text = var336:gsub("(%d+%.?%d*)", "<font color=\"rgb(218,176,97)\">%1</font>")
				if Object_3:GetAttribute("Modifiers"):find(Tag_2) ~= nil then
				else
				end
				clone_2.Selected.Checkmark.ImageTransparency = 1
			end
		end
	end
end
function module_upvr.Modify(arg1, arg2) -- Line 1132
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local Object_2 = module_upvr.Selected_Map.Object
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [17] 10. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [17] 10. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [33] 20. Error Block 7 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [33] 20. Error Block 7 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [67] 46. Error Block 13 start (CF ANALYSIS FAILED)
	arg1.Modules.Notify.Fade(arg1, true, "You are not the leader!")
	-- KONSTANTERROR: [67] 46. Error Block 13 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [73] 51. Error Block 14 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [73] 51. Error Block 14 end (CF ANALYSIS FAILED)
end
function module_upvr.Teleporting(arg1, arg2) -- Line 1163
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local Modules_4 = arg1.Modules
	local Cache_2 = arg1.Cache
	local Effects_3 = Modules_4.Effects
	local Loading_Screen = Modules_4.Loading_Screen
	local Topbar = Modules_4.Topbar
	local Topbar_2 = Cache_2.Topbar
	arg1.Invoked = true
	Loading_Screen.Get(arg1, arg2, true, true)
	Topbar.Fade(arg1, Topbar_2, Effects_3, "Out")
	module_upvr.Fade(arg1, false)
	Effects_3.Sound(arg1, "Bell", Cache_2.Interface, 1.25)
	arg1.Services.W.Zones.Bell.Stars.Bell.SquareFloor.Enabled = true
	task.wait(0.15)
	if Modules_4.Friends.Open == "In" then
		Topbar.Update(arg1, Topbar_2, "Friends")
	end
	Effects_3.Fade(arg1, module_upvr, {Topbar.Category}, "Loading_Screen")
	Loading_Screen.Transition(arg1, arg2)
	Topbar.Category = nil
end
return module_upvr
