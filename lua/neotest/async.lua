-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-04-14 11:23:07
-- Luau version 6, Types version 3
-- Time taken: 0.096179 seconds

local new_upvr_3 = CFrame.new
local new_upvr = UDim2.new
local new_upvr_2 = Vector2.new
local new_upvr_4 = Instance.new
local module_upvr = {
	Customising = false;
	Categories = {
		Appearance = {"Skin_Tone", "Width", "Height"};
		Hair = {"Primary", "Secondary", "Accessory_1", "Accessory_2"};
		Face = {"Eyes", "Nose", "Mouth"};
		Clothing = {"Shirt", "Pants"};
		Family = {"Buy_Spins"};
	};
	Category_Tags = {
		Skin_Tone = "Skin Tone";
		Width = "Width";
		Height = "Height";
		Primary = "Primary Hair";
		Secondary = "Secondary Hair";
		Accessory_1 = "Accessory 1";
		Accessory_2 = "Accessory 2";
		Eyes = "Eyes";
		Mouth = "Mouth";
		Nose = "Nose";
		Shirt = "Shirt";
		Pants = "Pants";
		Buy_Spins = "Buy Spins";
	};
	Rarity_Colours = {
		Common = Color3.fromRGB(125, 125, 125);
		Rare = Color3.fromRGB(32, 177, 255);
		Epic = Color3.fromRGB(110, 52, 255);
		Legendary = Color3.fromRGB(255, 183, 38);
		Secret = Color3.fromRGB(255, 0, 0);
	};
	Products = {1663879179, 1663880607, 1663879354, 1663879570, 1663880899, 1663879759};
	Indexes = {};
	Current_Category = nil;
	Current_Sub_Index = nil;
	Clone = nil;
	Offset = new_upvr_3(0, 0, 0);
	Base_Offset = new_upvr_3(0, 1, 6.5);
	Set_Colour = nil;
	Read = false;
	Spinning = false;
	Buttons = false;
	Spins_Open = false;
	Storage_Open = false;
	Selected_Storage_Slot = nil;
	Click_Events = {};
	Stored_Data = nil;
	Chances = {{
		Secret = "0.025";
		Legendary = "0.065";
		Epic = "0.35";
		Rare = "19.6";
		Common = "79.96";
	}, {
		Secret = "0.025";
		Legendary = "0.07";
		Epic = "0.35";
		Rare = "19.6";
		Common = "79.955";
	}, {
		Secret = "0.025";
		Legendary = "0.075";
		Epic = "0.35";
		Rare = "19.6";
		Common = "79.95";
	}, {
		Secret = "0.025";
		Legendary = "0.08";
		Epic = "0.35";
		Rare = "19.6";
		Common = "79.945";
	}};
	Boosted_Chances = {{
		Secret = "0.05";
		Legendary = "0.125";
		Epic = "0.35";
		Rare = "19.6";
		Common = "79.875";
	}, {
		Secret = "0.05";
		Legendary = "0.13";
		Epic = "0.35";
		Rare = "19.6";
		Common = "79.87";
	}, {
		Secret = "0.05";
		Legendary = "0.135";
		Epic = "0.35";
		Rare = "19.6";
		Common = "79.865";
	}, {
		Secret = "0.05";
		Legendary = "0.14";
		Epic = "0.35";
		Rare = "19.6";
		Common = "79.86";
	}};
}
function module_upvr.Main(arg1) -- Line 122
	--[[ Upvalues[4]:
		[1]: module_upvr (readonly)
		[2]: new_upvr_4 (readonly)
		[3]: new_upvr_3 (readonly)
		[4]: new_upvr (readonly)
	]]
	local Services = arg1.Services
	local Modules = arg1.Modules
	local Cache = arg1.Cache
	local Events_3 = arg1.Events
	local W = Services.W
	local Effects_7 = Modules.Effects
	local Runtime = Modules.Runtime
	local _, any_Get_Data_result2_2 = Modules.Update.Get_Data(arg1, true)
	local CurrentCamera_upvr = W.CurrentCamera
	local Customisation = Cache.Interface.Customisation
	module_upvr.Customising = true
	task.wait(arg1.Loading_Delay + 0.15)
	local var48
	if module_upvr.Clone == nil then
		local clone_6_upvw = arg1:Get("Asset", {"Rigs", "R15"}):Clone()
		clone_6_upvw.Parent = W
		local clone_5 = clone_6_upvw.Head:Clone()
		for _, v in pairs(clone_5:GetChildren()) do
			if v:IsA("SpecialMesh") == false then
				v:Destroy()
			end
		end
		clone_5.Name = "R15_Head"
		clone_5.Massless = true
		clone_5.CanCollide = false
		clone_5.CanTouch = false
		clone_5.CanQuery = false
		clone_5.Transparency = 1
		clone_5.Parent = W
		local Weld = Instance.new("Weld")
		Weld.Name = 'W'
		Weld.Part0 = clone_6_upvw.Head
		Weld.Part1 = clone_5
		Weld.Parent = clone_5
		local BodyGyro = Instance.new("BodyGyro")
		BodyGyro.Name = "BG"
		BodyGyro.CFrame = CFrame.Angles(0, math.pi, 0)
		BodyGyro.MaxTorque = Vector3.new(3000, 3000, 3000)
		BodyGyro.P = 1500
		BodyGyro.D = 250
		BodyGyro.Parent = clone_6_upvw.PrimaryPart
		local var4_result1_2 = new_upvr_4("Animation")
		if any_Get_Data_result2_2.Weapon == "Spears" then
		else
		end
		var4_result1_2.AnimationId = tostring(arg1.Prefix..14518537431)
		clone_6_upvw.Humanoid:LoadAnimation(var4_result1_2):Play()
		module_upvr.Stored_Data = any_Get_Data_result2_2
		Modules.Char.Gear(arg1, clone_6_upvw, any_Get_Data_result2_2, true)
		module_upvr.Initiate(arg1, Cache.Player, any_Get_Data_result2_2, clone_6_upvw, clone_5, true)
		module_upvr.Clone = clone_6_upvw
	end
	module_upvr.Category(arg1, "Appearance", Customisation)
	module_upvr.Offset = module_upvr.Base_Offset
	local any_ToEulerAnglesYXZ_result1_2, _, any_ToEulerAnglesYXZ_result3 = clone_6_upvw.HumanoidRootPart.CFrame:ToEulerAnglesYXZ()
	local var60 = new_upvr_3(clone_6_upvw.HumanoidRootPart.Position) * CFrame.Angles(any_ToEulerAnglesYXZ_result1_2, 0, any_ToEulerAnglesYXZ_result3) * module_upvr.Offset
	Runtime.Tweening = true
	Runtime.cFrame = var60
	CurrentCamera_upvr.CFrame = arg1:Get("Asset", {"Cameras", "Customisation"}).CFrame
	if Events_3.Customisation_Camera ~= nil then
		Events_3.Customisation_Camera:Disconnect()
		Events_3.Customisation_Camera = nil
	end
	task.wait(0.4)
	module_upvr.Fade(arg1, Effects_7, Customisation, "In")
	Effects_7.Hover(arg1, Customisation.Back, Customisation, module_upvr, "Return")
	Effects_7.Hover(arg1, Customisation.Right.Main.Holder.Set, Customisation, module_upvr, "Colour")
	for _, v_2 in pairs(Customisation.Categories:GetChildren()) do
		if v_2:IsA("Frame") == true then
			if v_2.Name == module_upvr.Current_Category then
				Effects_7.Tween(arg1, v_2, tostring(v_2.Name.."_In"), {
					BackgroundColor3 = Color3.fromRGB(75, 75, 75);
					Size = new_upvr(0.40249999999999997, 0, 0.14604999999999999, 0);
				})
				Effects_7.Tween(arg1, v_2.Icon, tostring(v_2.Name.."_Icon_In"), {
					ImageColor3 = Color3.fromRGB(255, 255, 255);
				})
			else
				Effects_7.Tween(arg1, v_2, tostring(v_2.Name.."_Out"), {
					BackgroundColor3 = Color3.fromRGB(25, 25, 25);
					Size = UDim2.new(0.35, 0, 0.127, 0);
				})
				Effects_7.Tween(arg1, v_2.Icon, tostring(v_2.Name.."_Icon_Out"), {
					ImageColor3 = Color3.fromRGB(75, 75, 75);
				})
			end
			Effects_7.Hover(arg1, v_2, Customisation, module_upvr, "Category")
		end
	end
	Effects_7.Tween(arg1, CurrentCamera_upvr, "Camera_Customisation_In", {
		CFrame = var60;
	}, 1.25).Completed:Wait()
	local Offset_upvr = arg1.Offset
	Events_3.Customisation_Camera = Services.RS.RenderStepped:Connect(function() -- Line 231
		--[[ Upvalues[5]:
			[1]: clone_6_upvw (read and write)
			[2]: new_upvr_3 (copied, readonly)
			[3]: module_upvr (copied, readonly)
			[4]: Offset_upvr (readonly)
			[5]: CurrentCamera_upvr (readonly)
		]]
		local any_ToEulerAnglesYXZ_result1, _, any_ToEulerAnglesYXZ_result3_2 = clone_6_upvw.HumanoidRootPart.CFrame:ToEulerAnglesYXZ()
		CurrentCamera_upvr.CFrame = CurrentCamera_upvr.CFrame:Lerp(new_upvr_3(clone_6_upvw.HumanoidRootPart.Position) * CFrame.Angles(any_ToEulerAnglesYXZ_result1, 0, any_ToEulerAnglesYXZ_result3_2) * module_upvr.Offset * new_upvr_3(0, 0, module_upvr.Offset.Z / 25 * Offset_upvr.Current), 0.2)
	end)
end
function module_upvr.Initiate(arg1, arg2, arg3, arg4, arg5, arg6, arg7) -- Line 242
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local pairs_result1_12, pairs_result2_11, pairs_result3_2 = pairs(arg1.Modules.Char.Indexes)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [430] 297. Error Block 62 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [430] 297. Error Block 62 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [13] 9. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [13] 9. Error Block 2 end (CF ANALYSIS FAILED)
end
function module_upvr.Category(arg1, arg2, arg3, arg4) -- Line 399
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local Modules_7 = arg1.Modules
	module_upvr.Current_Category = arg2
	if arg4 == true then
		arg3.Sub_Categories.GroupTransparency = 1
		Modules_7.Effects.Tween(arg1, arg3.Sub_Categories, "Customisation_Sub_Categories_Effect", {
			GroupTransparency = 0;
		}, 0.5)
	end
	local var82
	for i_3 = 1, 4 do
		if i_3 > #module_upvr.Categories[arg2] then
			var82 = false
		else
			var82 = true
		end
		arg3.Sub_Categories[i_3].Visible = var82
		if var82 == true then
			local var83 = module_upvr.Category_Tags[module_upvr.Categories[arg2][i_3]]
			arg3.Sub_Categories[i_3].Info.Category.Text = string.upper(var83)
			arg3.Sub_Categories[i_3].Icon.Image = tostring(arg1.Prefix..Modules_7.Images.Categories[string.gsub(string.gsub(var83, ' ', '_'), "_Hair", "")])
		end
	end
	module_upvr.Sub_Category(arg1, 1, arg3)
end
function module_upvr.Sub_Category(arg1, arg2, arg3, arg4) -- Line 441
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: new_upvr (readonly)
	]]
	local Effects_5 = arg1.Modules.Effects
	for _, v_3 in pairs(arg3.Sub_Categories:GetChildren()) do
		if v_3:IsA("Frame") == true then
			if tonumber(v_3.Name) == arg2 and (arg4 == true or module_upvr.Current_Category ~= "Family") then
				Effects_5.Tween(arg1, v_3, tostring(v_3.Name.."_In"), {
					BackgroundColor3 = Color3.fromRGB(75, 75, 75);
					Size = new_upvr(0.18514999999999998, 0, 0.14604999999999999, 0);
					Position = new_upvr(0.241, 0, v_3.Position.Y.Scale, 0);
				})
				Effects_5.Tween(arg1, v_3.Info, tostring(v_3.Name.."_Info_In"), {
					ImageColor3 = Color3.fromRGB(75, 75, 75);
				})
				Effects_5.Tween(arg1, v_3.Icon, tostring(v_3.Name.."_Icon_In"), {
					ImageColor3 = Color3.fromRGB(255, 255, 255);
				})
			else
				Effects_5.Tween(arg1, v_3, tostring(v_3.Name.."_Out"), {
					BackgroundColor3 = Color3.fromRGB(25, 25, 25);
					Size = new_upvr(0.161, 0, 0.127, 0);
					Position = new_upvr(0.161, 0, v_3.Position.Y.Scale, 0);
				})
				Effects_5.Tween(arg1, v_3.Info, tostring(v_3.Name.."_Info_Out"), {
					ImageColor3 = Color3.fromRGB(25, 25, 25);
				})
				Effects_5.Tween(arg1, v_3.Icon, tostring(v_3.Name.."_Icon_Out"), {
					ImageColor3 = Color3.fromRGB(75, 75, 75);
				})
			end
			Effects_5.Hover(arg1, v_3, arg3, module_upvr, "Sub_Category", true)
		end
	end
	module_upvr.Current_Sub_Index = arg2
	module_upvr.Update(arg1, arg3, arg4)
end
function module_upvr.Switch(arg1, arg2, arg3, arg4) -- Line 468
	--[[ Upvalues[3]:
		[1]: new_upvr (readonly)
		[2]: new_upvr_2 (readonly)
		[3]: module_upvr (readonly)
	]]
	local Events = arg1.Events
	local Effects = arg1.Modules.Effects
	for _, v_4 in pairs(arg2:GetDescendants()) do
		if v_4:IsA("ImageButton") == true or v_4:IsA("TextButton") == true then
			v_4.Selectable = false
		end
	end
	Effects.Tween(arg1, arg2, tostring("Customisation_"..arg2.Name.."_Out"), {
		Position = new_upvr(0.99, 0, arg4, 0);
	}, 1)
	Effects.Tween(arg1, arg3, tostring("Customisation_"..arg3.Name.."_In"), {
		Position = new_upvr(0.99, 0, 0.5, 0);
	}, 1.25)
	Effects.Tween(arg1, arg3.Gradient, tostring("Customisation_"..arg3.Name.."_Gradient_In"), {
		Offset = new_upvr_2(0, 1);
	}, 1.3)
	arg3.Visible = true
	for _, v_5 in pairs(arg3:GetDescendants()) do
		if v_5:IsA("ImageButton") == true or v_5:IsA("TextButton") == true then
			v_5.Selectable = true
		end
	end
	if Events[arg2.Name.."_Hide"] == nil then
		Events[arg2.Name.."_Hide"] = Effects.Tween(arg1, arg2.Gradient, tostring("Customisation_"..arg2.Name.."_Gradient_Out"), {
			Offset = new_upvr_2(0, -1);
		}, 1.05).Completed:Connect(function() -- Line 494
			--[[ Upvalues[3]:
				[1]: module_upvr (copied, readonly)
				[2]: arg3 (readonly)
				[3]: arg2 (readonly)
			]]
			if module_upvr.Current_Category == "Family" and arg3.Name == "Family" or module_upvr.Current_Category ~= "Family" and arg3.Name == "Right" then
				arg2.Visible = false
			end
		end)
	end
end
function module_upvr.Product(arg1, arg2, arg3) -- Line 502
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	arg1.Services.MPS:PromptProductPurchase(arg1.Cache.Player, module_upvr.Products[tonumber(string.sub(arg2.Name, #arg2.Name, #arg2.Name))])
end
local function Update(arg1, arg2, arg3) -- Line 516
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: new_upvr (readonly)
		[3]: new_upvr_3 (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local Cache_5 = arg1.Cache
	local Effects_3_upvr = arg1.Modules.Effects
	local Tweens_2 = Cache_5.Tweens
	local var181 = module_upvr.Categories[module_upvr.Current_Category][module_upvr.Current_Sub_Index]
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [61] 39. Error Block 3 start (CF ANALYSIS FAILED)
	Effects_3_upvr.Fade(arg1, {"Customisation"}, "Market")
	do
		return
	end
	-- KONSTANTERROR: [61] 39. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [72] 47. Error Block 118 start (CF ANALYSIS FAILED)
	module_upvr.Storage(arg1, arg2.Family, false)
	if arg2.Right.Position.Y.Scale ~= 0.5 then
		module_upvr.Switch(arg1, arg2.Family, arg2.Right, 0.55)
	end
	local var183 = var181
	if var181:find("Accessory") ~= nil then
		var183 = "Accessory"
	end
	local _ = {Cache_5.Player.Name, var183}
	local _ = {"Effects", "Item"}
	for i_7, v_6 in pairs(arg2.Right.Main.Holder.Items:GetChildren()) do
		if v_6:IsA("Frame") == true then
			v_6:Destroy()
		end
	end
	local function _(arg1_5, arg2_5) -- Line 559, Named "Leave_Effect"
		--[[ Upvalues[3]:
			[1]: Effects_3_upvr (readonly)
			[2]: arg1 (readonly)
			[3]: new_upvr (copied, readonly)
		]]
		Effects_3_upvr.Tween(arg1, arg1_5.Main, tostring(arg1_5.Name.."_Out"), {
			BackgroundTransparency = 0.2;
			Size = new_upvr(0.85, 0, 0.85, 0);
		}, 0.2, nil, nil, nil, nil, nil, true)
		Effects_3_upvr.Tween(arg1, arg1_5.Main.Interact, tostring(arg1_5.Name.."_Interact_Unselected"), {
			BackgroundTransparency = 1;
		}, 0.2, nil, nil, nil, nil, nil, true)
	end
	if Tweens_2.Customisation_Items_Holder_In ~= nil then
		Tweens_2.Customisation_Items_Holder_In:Cancel()
	end
	arg2.Right.Main.Holder.GroupTransparency = 1
	local var191 = true
	if var181 ~= "Eyes" then
		var191 = true
		if var181 ~= "Primary" then
			var191 = true
			if var181 ~= "Secondary" then
				var191 = true
				if var181 ~= "Shirt" then
					if var181 ~= "Pants" then
						var191 = false
					else
						var191 = true
					end
				end
			end
		end
	end
	if var191 == false then
		i_7 = new_upvr
		v_6 = 0.97
		i_7 = i_7(v_6, 0, 0.965, 0)
		arg2.Right.Main.Holder.Items.Size = i_7
		i_7 = arg2.Right
		i_7 = i_7.Main
		i_7 = i_7.Holder
		i_7 = i_7.Items
		i_7 = i_7.Grid
		v_6 = new_upvr(0.017, 0, 0.023, 0)
		arg2.Right.Main.Holder.Items.Grid.CellPadding = v_6
		i_7.CellSize = new_upvr(0.228, 0, 0.16, 0)
	else
		i_7 = new_upvr
		v_6 = 0.97
		i_7 = i_7(v_6, 0, 0.643, 0)
		arg2.Right.Main.Holder.Items.Size = i_7
		i_7 = arg2.Right
		i_7 = i_7.Main
		i_7 = i_7.Holder
		i_7 = i_7.Items
		i_7 = i_7.Grid
		v_6 = new_upvr(0.017, 0, 0.023, 0)
		arg2.Right.Main.Holder.Items.Grid.CellPadding = v_6
		i_7.CellSize = new_upvr(0.228, 0, 0.24, 0)
	end
	arg2.Right.Main.Holder.Colour.Visible = var191
	arg2.Right.Main.Holder.Brightness.Visible = var191
	arg2.Right.Main.Holder.Saturation.Visible = var191
	arg2.Right.Main.Holder.Set.Visible = var191
	arg2.Right.Main.Holder.Line.Visible = var191
	if var181 == "Eyes" then
		-- KONSTANTWARNING: GOTO [382] #246
	end
	if var181 == "Nose" then
		-- KONSTANTWARNING: GOTO [382] #246
	end
	if var181 == "Mouth" then
		-- KONSTANTWARNING: GOTO [382] #246
	end
	-- KONSTANTERROR: [72] 47. Error Block 118 end (CF ANALYSIS FAILED)
end
module_upvr.Update = Update
function module_upvr.Roll(arg1, arg2) -- Line 889
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local Modules_3 = arg1.Modules
	local any_Get_Data_result1_3, _ = Modules_3.Update.Get_Data(arg1, true)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [24] 15. Error Block 16 start (CF ANALYSIS FAILED)
	if any_Get_Data_result1_3.Spins == 0 then
		Modules_3.Notify.Fade(arg1, true, "No spins left!")
		return
	end
	local _, _, _ = pairs(Modules_3.Families)
	-- KONSTANTERROR: [24] 15. Error Block 16 end (CF ANALYSIS FAILED)
end
function module_upvr.Rolling(arg1, arg2) -- Line 921
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local Modules_2 = arg1.Modules
	local Update = Modules_2.Update
	local any_Get_Data_result1, any_Get_Data_result2_5 = Update.Get_Data(arg1, true)
	module_upvr.Spinning = true
	local any_Invoke_result1, any_Invoke_result2_2, any_Invoke_result3_2, any_Invoke_result4 = arg1:Invoke("Family", "Roll")
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [30] 20. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [30] 20. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [32] 21. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [32] 21. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [34] 22. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [34] 22. Error Block 4 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [236] 170. Error Block 14 start (CF ANALYSIS FAILED)
	any_Get_Data_result2_5.Avatar.Family = any_Invoke_result2_2
	any_Get_Data_result1.Spins = any_Invoke_result1
	module_upvr.Family_Details(arg1, arg2, true, true)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [251.15]
	nil.Visible = true
	-- KONSTANTERROR: [236] 170. Error Block 14 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [253] 182. Error Block 21 start (CF ANALYSIS FAILED)
	module_upvr.Spinning = false
	local any_Get_Data_result1_6 = Update.Get_Data(arg1)
	if any_Get_Data_result1_6 ~= nil then
		arg2.Buttons_2.Roll.Title.Text = tostring("ROLL ("..Modules_2.Format.Convert(any_Get_Data_result1_6.Spins)..')')
	end
	-- KONSTANTERROR: [253] 182. Error Block 21 end (CF ANALYSIS FAILED)
end
function module_upvr.Store(arg1, arg2) -- Line 1021
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [46] 30. Error Block 5 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [46.5]
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [51.13]
	nil.Fade(arg1, true, tostring("Reached maximum families ("..nil..")!"))
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [59.12]
	-- KONSTANTERROR: [46] 30. Error Block 5 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [68] 48. Error Block 10 start (CF ANALYSIS FAILED)
	local any_Invoke_result1_2, any_Invoke_result2, any_Invoke_result3 = arg1:Invoke("Family", "Store")
	if any_Invoke_result1_2 == true then
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [77.11]
		table.insert(nil, any_Invoke_result2)
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [82.10]
		nil.Avatar.Family = any_Invoke_result3
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		nil.Fade(arg1, true, tostring("Stored '"..string.upper(any_Invoke_result2).."' family!"), true)
		module_upvr.Update_Storage(arg1, arg2.Parent.Storage, true)
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [114.4]
		nil.Tween(arg1, arg2.Family.Title, "Label_Fade", {
			TextTransparency = 1;
		}, 0.15, nil, nil, nil, nil, nil, true).Completed:Wait()
		module_upvr.Family_Details(arg1, arg2, true)
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		nil.Tween(arg1, arg2.Family.Title, "Label_Fade", {
			TextTransparency = 0;
		}, 0.15, nil, nil, nil, nil, nil, true)
	end
	-- KONSTANTERROR: [68] 48. Error Block 10 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [166] 123. Error Block 9 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [166] 123. Error Block 9 end (CF ANALYSIS FAILED)
end
function module_upvr.Update_Storage(arg1, arg2, arg3) -- Line 1074
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [271] 187. Error Block 88 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [0.18]
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [0.19]
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [0.20]
	for i_8, v_7 in nil do
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [271.12]
		local clone_4_upvr = nil:Clone()
		local Inner_3 = clone_4_upvr:FindFirstChild("Inner")
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [280.6]
		for i_9, v_8 in pairs(nil) do
			local var323
			if v_8[v_7] ~= nil then
				if v_7 == "Fritz" or v_7 == "Helos" then
					var323 = "Mythical"
				else
					var323 = i_9
				end
				Inner_3.Title.Text = tostring(string.upper(v_7).." ("..var323..')')
				local tbl_14 = {}
				var323 = module_upvr.Rarity_Colours[i_9]
				var323 = 1
				tbl_14[1] = ColorSequenceKeypoint.new(0, var323)
				tbl_14[2] = ColorSequenceKeypoint.new(var323, Color3.fromRGB(255, 255, 255))
				Inner_3.Title.Gradient.Color = ColorSequence.new(tbl_14)
			end
		end
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [342.13]
		clone_4_upvr.Name = tostring((#nil.Families:GetChildren() - 3)..'_'..v_7)
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		clone_4_upvr.Parent = nil.Families
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [362.5]
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		nil.Hover(arg1, clone_4_upvr, nil, module_upvr, "Storage", true, Inner_3.Interact, true)
		local var326_upvr
		task.delay((i_8 - 1) * 0.125, function() -- Line 1182
			--[[ Upvalues[3]:
				[1]: var326_upvr (readonly)
				[2]: arg1 (readonly)
				[3]: clone_4_upvr (readonly)
			]]
			var326_upvr.Tween(arg1, clone_4_upvr, "Storage_Family_In", {
				GroupTransparency = 0.4;
			}, 0.25, nil, nil, nil, nil, nil, true)
		end)
	end
	-- KONSTANTERROR: [271] 187. Error Block 88 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 90 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [383.10]
	if nil ~= nil then
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [383.11]
		if nil ~= nil then
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [383.16]
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [383.17]
			for i_10, v_9 in nil do
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil == true then
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil == 0 then
				for _, _ in nil, i_10, v_9 do
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				end
				for _, _ in nil, i_10, v_9 do
					if clone_4_upvr == true then
					end
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				end
			end
			if arg3 == nil then
				for _, _ in nil, i_10, v_9 do
					if clone_4_upvr == true then
						if clone_4_upvr == _ then
						end
					end
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				end
				-- KONSTANTWARNING: GOTO [271] #187
			end
			-- KONSTANTWARNING: GOTO [212] #144
		end
		-- KONSTANTWARNING: GOTO [385] #270
	end
	-- KONSTANTERROR: [0] 1. Error Block 90 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [385] 270. Error Block 48 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [385] 270. Error Block 48 end (CF ANALYSIS FAILED)
end
function module_upvr.Storage(arg1, arg2, arg3) -- Line 1190
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: new_upvr (readonly)
		[3]: new_upvr_2 (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 36 start (CF ANALYSIS FAILED)
	local var328 = not module_upvr.Storage_Open
	if arg3 ~= nil then
		var328 = arg3
	end
	module_upvr.Storage_Open = var328
	if module_upvr.Storage_Open == true then
	else
	end
	if module_upvr.Storage_Open == true then
		-- KONSTANTWARNING: GOTO [36] #25
	end
	-- KONSTANTERROR: [0] 1. Error Block 36 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [35] 24. Error Block 39 start (CF ANALYSIS FAILED)
	if module_upvr.Storage_Open == true then
		-- KONSTANTWARNING: GOTO [44] #31
	end
	-- KONSTANTERROR: [35] 24. Error Block 39 end (CF ANALYSIS FAILED)
end
function module_upvr.Storage_State(arg1, arg2, arg3, arg4, arg5) -- Line 1233
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: new_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local Events_5 = arg1.Events
	local Selected_Storage_Slot = module_upvr.Selected_Storage_Slot
	local var339
	if Selected_Storage_Slot == var339 or arg5 == "Out" then
		var339 = nil
	end
	module_upvr.Selected_Storage_Slot = var339
	local function INLINED() -- Internal function, doesn't exist in bytecode
		local Inner_2 = Selected_Storage_Slot:FindFirstChild("Inner")
		return Inner_2 ~= nil
	end
	if Selected_Storage_Slot ~= nil and (Selected_Storage_Slot ~= var339 or var339 == nil) or INLINED() then
		arg1.Modules.Tweens.Tween(arg1, arg2, Selected_Storage_Slot, module_upvr, Inner_2.Interact, true, "Out", true)
	end
	local Buttons = arg4.Parent.Buttons
	if module_upvr.Selected_Storage_Slot ~= nil then
		local _ = "In"
	else
	end
	if "Out" == "In" then
	else
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if "Out" == "In" then
	else
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if "Out" == "In" then
		Buttons.Visible = true
		for _, v_13 in pairs(Buttons:GetChildren()) do
			arg2.Hover(arg1, v_13, Buttons, module_upvr, "Storage_Button")
			local var347_upvr
		end
	else
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if "Out" == "Out" and Events_5["Storage_"..var347_upvr.Name.."_Hide"] == nil then
			Events_5["Storage_"..var347_upvr.Name.."_Hide"] = arg2.Tween(arg1, Buttons, tostring("Storage_Buttons_".."Out"), {
				GroupTransparency = 1;
				Position = new_upvr(0.5, 0, 0.95, 0);
			}, 0.25).Completed:Connect(function() -- Line 1271
				--[[ Upvalues[2]:
					[1]: module_upvr (copied, readonly)
					[2]: var347_upvr (readonly)
				]]
				if module_upvr.Selected_Storage_Slot == nil then
					var347_upvr.Visible = false
				end
			end)
		end
	end
end
function module_upvr.Deletion(arg1, arg2) -- Line 1279
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 4. Error Block 2 start (CF ANALYSIS FAILED)
	local any_Get_Data_result1_5, any_Get_Data_result2_7 = arg1.Modules.Update.Get_Data(arg1, true)
	-- KONSTANTERROR: [5] 4. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [24] 15. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [24] 15. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [26] 16. Error Block 4 start (CF ANALYSIS FAILED)
	local _, unpack_result2_2 = unpack(string.split(module_upvr.Selected_Storage_Slot.Name, '_'))
	-- KONSTANTERROR: [26] 16. Error Block 4 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [91] 65. Error Block 11 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [91] 65. Error Block 11 end (CF ANALYSIS FAILED)
end
function module_upvr.Delete(arg1, arg2, arg3) -- Line 1311
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 4. Error Block 2 start (CF ANALYSIS FAILED)
	local any_Get_Data_result1_4, any_Get_Data_result2 = arg1.Modules.Update.Get_Data(arg1, true)
	-- KONSTANTERROR: [5] 4. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [20] 13. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [20] 13. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [76] 54. Error Block 14 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [76] 54. Error Block 14 end (CF ANALYSIS FAILED)
end
function module_upvr.Swap(arg1, arg2, arg3) -- Line 1342
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 4. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 4. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 7. Error Block 3 start (CF ANALYSIS FAILED)
	local any_Get_Data_result1_2, any_Get_Data_result2_4 = arg1.Modules.Update.Get_Data(arg1, true)
	-- KONSTANTERROR: [10] 7. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 15. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 15. Error Block 4 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [55] 36. Error Block 7 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [57.10]
	local any_Invoke_result1_3, _, _ = arg1:Invoke("Family", "Swap", nil)
	-- KONSTANTERROR: [55] 36. Error Block 7 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [175] 126. Error Block 14 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [175] 126. Error Block 14 end (CF ANALYSIS FAILED)
end
function module_upvr.Family(arg1, arg2) -- Line 1393
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local Modules_6 = arg1.Modules
	local Events_4 = arg1.Events
	local W_upvr = arg1.Services.W
	local Effects_2 = Modules_6.Effects
	local any_Get_Data_result1_8, any_Get_Data_result2_3_upvr = Modules_6.Update.Get_Data(arg1, true)
	local Rarities = arg2.Rarities
	for _, v_14 in pairs(Rarities:GetChildren()) do
		if v_14:IsA("Frame") == true then
			if v_14.Name:find("Category") == nil then
				v_14:Destroy()
			else
				Effects_2.Hover(arg1, v_14, Rarities, module_upvr, "Rarity", nil, v_14.Main.Arrow)
			end
		end
	end
	Effects_2.Hover(arg1, arg2.Buttons_2.Roll, arg2, module_upvr, "Customise")
	Effects_2.Hover(arg1, arg2.Buttons_2.Store, arg2, module_upvr, "Customise")
	Effects_2.Hover(arg1, arg2.Buttons_2.Storage, arg2, module_upvr, "Customise")
	module_upvr.Family_Details(arg1, arg2)
	arg2.Pity.Text = tostring("EPIC+ PITY: "..any_Get_Data_result2_3_upvr.Avatar.Pity.."/400")
	arg2.Buttons_2.Roll.Title.Text = tostring("ROLL ("..Modules_6.Format.Convert(any_Get_Data_result1_8.Spins)..')')
	if Events_4.Rates == nil then
		local tbl_7_upvr = {
			Common = 1;
			Rare = 2;
			Epic = 3;
			Legendary = 4;
			Secret = 5;
		}
		local function Update_upvr() -- Line 1428, Named "Update"
			--[[ Upvalues[5]:
				[1]: W_upvr (readonly)
				[2]: module_upvr (copied, readonly)
				[3]: any_Get_Data_result2_3_upvr (readonly)
				[4]: tbl_7_upvr (readonly)
				[5]: arg2 (readonly)
			]]
			for i_16, v_15 in pairs(module_upvr.Chances[any_Get_Data_result2_3_upvr.Progression.Prestige]) do
				local var383 = v_15
				if W_upvr:GetAttribute("Rate") == true then
					var383 = tostring(module_upvr.Boosted_Chances[any_Get_Data_result2_3_upvr.Progression.Prestige][i_16].."% <s>"..var383.."</s>")
				end
				if i_16 == "Secret" then
					i_16 = "Mythical"
				end
				arg2.Rarities[tbl_7_upvr[i_16].." - "..i_16.." - Category"].Main.Title.Text = tostring(i_16.." - "..var383..'%')
			end
		end
		Events_4.Rate = W_upvr:GetAttributeChangedSignal("Rate"):Connect(function() -- Line 1448
			--[[ Upvalues[1]:
				[1]: Update_upvr (readonly)
			]]
			Update_upvr()
		end)
		Update_upvr()
	end
end
function module_upvr.Family_Details(arg1, arg2, arg3, arg4) -- Line 1456
	--[[ Upvalues[2]:
		[1]: new_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 51 start (CF ANALYSIS FAILED)
	local Modules_5 = arg1.Modules
	local _, _ = Modules_5.Update.Get_Data(arg1, true)
	local Perks_upvr = arg2.Middle.Perks
	local function _() -- Line 1469, Named "Wipe"
		--[[ Upvalues[1]:
			[1]: Perks_upvr (readonly)
		]]
		for _, v_16 in pairs(Perks_upvr.Display:GetChildren()) do
			if v_16:IsA("UIListLayout") == false and v_16:IsA("UIPadding") == false then
				v_16:Destroy()
			end
		end
	end
	local TextS_upvr = arg1.Services.TextS
	local function _(arg1_6, arg2_6, arg3_2, arg4_2, arg5) -- Line 1477, Named "Add"
		--[[ Upvalues[4]:
			[1]: arg1 (readonly)
			[2]: TextS_upvr (readonly)
			[3]: Perks_upvr (readonly)
			[4]: new_upvr (copied, readonly)
		]]
		local tbl_20 = {"Objects"}
		tbl_20[2] = arg1_6
		local clone_2 = arg1:Get("Asset", tbl_20):Clone()
		local var402
		if arg5 == nil then
			clone_2.Size = new_upvr(1, 0, TextS_upvr:GetTextSize(var402, Perks_upvr.AbsoluteSize.Y / 13.5, Enum.Font.Fantasy, Perks_upvr.AbsoluteSize).Y / Perks_upvr.AbsoluteSize.Y, 0)
		end
		if arg3_2 == nil then
			local class_UIGradient = clone_2:FindFirstChildOfClass("UIGradient")
			if class_UIGradient ~= nil then
				class_UIGradient:Destroy()
				local var404
			end
		end
		if arg4_2 == nil then
			var404 = Color3.fromRGB(255, 255, 255)
			clone_2.TextColor3 = var404
		else
			var404 = var402:gsub("(%d+%.?%d*)", "<font color=\"rgb(218,176,97)\">%1</font>")
			var402 = var404
			local function INLINED_3() -- Internal function, doesn't exist in bytecode
				var404 = Color3.fromRGB(127, 255, 80)
				return var404
			end
			if arg4_2 ~= "Buff" or not INLINED_3() then
				var404 = Color3.fromRGB(255, 80, 80)
			end
			clone_2.TextColor3 = var404
		end
		clone_2.Text = var402
		clone_2.Parent = Perks_upvr.Display
	end
	if arg3 == true then
		arg2.Middle.Perks.GroupTransparency = 1
		Modules_5.Effects.Tween(arg1, arg2.Middle.Perks, "Customisation_Family_Perks", {
			GroupTransparency = 0;
		}, 0.5)
	end
	local pairs_result1_14, pairs_result2_4, pairs_result3_14 = pairs(Modules_5.Families)
	-- KONSTANTERROR: [0] 1. Error Block 51 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [335] 237. Error Block 45 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [335] 237. Error Block 45 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [64] 43. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	-- KONSTANTERROR: [64] 43. Error Block 4 end (CF ANALYSIS FAILED)
end
function module_upvr.Rarity(arg1, arg2, arg3, arg4) -- Line 1574
	local unpack_result1, unpack_result2 = unpack(string.split(arg2, " - "))
	if arg4:GetAttribute(unpack_result2) == nil then
		arg4:SetAttribute(unpack_result2, true)
		arg3.Rotation = -90
		for i_18, _ in pairs(arg1.Modules.Families[unpack_result2]) do
			if i_18 ~= "Shiki" then
				local clone_7 = arg1:Get("Asset", {"Effects", "Family"}):Clone()
				clone_7.Name = tostring(unpack_result1.." - "..unpack_result2.." - Family")
				clone_7.Label.Text = i_18
				clone_7.Parent = arg4
			end
		end
	else
		arg4:SetAttribute(unpack_result2, nil)
		arg3.Rotation = 0
		for _, v_20 in pairs(arg4:GetChildren()) do
			if v_20.Name:find(unpack_result2) ~= nil and v_20.Name:find("Family") ~= nil then
				v_20:Destroy()
			end
		end
	end
end
function module_upvr.Get_Colour(arg1, arg2) -- Line 1605
	for i_19 = 1, #arg2 - 1 do
		if arg2[i_19].Time <= arg1 and arg1 <= arg2[i_19 + 1].Time then
			local var424 = arg2[i_19]
			local var425 = arg2[i_19 + 1]
			return var424.Value:Lerp(var425.Value, (arg1 - var424.Time) / (var425.Time - var424.Time))
		end
	end
end
function module_upvr.Colour(arg1, arg2, arg3, arg4) -- Line 1625
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local Parent_3 = arg2.Parent
	local Parent = arg3.Parent
	local Parent_2 = arg4.Parent
	local X_2 = Parent_3.AbsolutePosition.X
	local X_3 = Parent.AbsolutePosition.X
	local X = Parent_2.AbsolutePosition.X
	local any_Get_Colour_result1_2 = module_upvr.Get_Colour((arg3.AbsolutePosition.X - X_3) / (X_3 + Parent.AbsoluteSize.X - X_3), arg3.Real_Gradient.Color.Keypoints)
	local any_Get_Colour_result1 = module_upvr.Get_Colour((arg2.AbsolutePosition.X - X_2) / (X_2 + Parent_3.AbsoluteSize.X - X_2), Parent_3.Gradient.Color.Keypoints)
	local floored = math.floor(any_Get_Colour_result1.R * 255)
	local floored_3 = math.floor(any_Get_Colour_result1.G * 255)
	local floored_2 = math.floor(any_Get_Colour_result1.B * 255)
	Parent.Gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(floored, floored_3, floored_2)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))})
	Parent_2.Gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(floored, floored_3, floored_2)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))})
	local any_Get_Colour_result1_3 = module_upvr.Get_Colour((arg4.AbsolutePosition.X - X) / (X + Parent_2.AbsoluteSize.X - X), Parent_2.Gradient.Color.Keypoints)
	module_upvr.Set_Colour = {
		R = math.clamp(floored + math.floor(any_Get_Colour_result1_3.R * 255), 0, 255) * any_Get_Colour_result1_2.R;
		G = math.clamp(floored_3 + math.floor(any_Get_Colour_result1_3.G * 255), 0, 255) * any_Get_Colour_result1_2.G;
		B = math.clamp(floored_2 + math.floor(any_Get_Colour_result1_3.B * 255), 0, 255) * any_Get_Colour_result1_2.B;
	}
end
function module_upvr.Fade(arg1, arg2, arg3, arg4) -- Line 1682
	--[[ Upvalues[2]:
		[1]: new_upvr_2 (readonly)
		[2]: new_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var441_upvr
	if arg4 == "In" then
	else
	end
	if arg4 == "In" then
		local _ = 1
	else
	end
	if arg4 == "In" then
		var441_upvr = 0
	else
		var441_upvr = -0.25
	end
	if arg4 == "In" then
	else
	end
	if arg4 == "In" then
	else
	end
	if arg4 == "In" then
	else
	end
	if arg4 == "In" then
	else
	end
	if arg4 == "In" then
	else
	end
	local var443_upvr = -0.2
	local function Arcs_upvr(arg1_7, arg2_7) -- Line 1699, Named "Arcs"
		--[[ Upvalues[7]:
			[1]: arg2 (readonly)
			[2]: arg1 (readonly)
			[3]: arg3 (readonly)
			[4]: arg4 (readonly)
			[5]: new_upvr_2 (copied, readonly)
			[6]: var441_upvr (readonly)
			[7]: var443_upvr (readonly)
		]]
		arg2.Tween(arg1, arg3.Large_Arc.Stroke.Gradient, tostring("Customisation_Large_Arc_Stroke_Gradient_"..arg4), {
			Offset = new_upvr_2(var441_upvr, 0);
		}, arg1_7)
		arg2.Tween(arg1, arg3.Small_Arc.Stroke.Gradient, tostring("Customisation_Small_Arc_Stroke_Gradient_"..arg4), {
			Offset = new_upvr_2(var443_upvr, 0);
		}, arg2_7)
	end
	local var446_upvr = -1
	local var447_upvr = 0.135
	local function Categories_upvr(arg1_8, arg2_8) -- Line 1704, Named "Categories"
		--[[ Upvalues[8]:
			[1]: arg2 (readonly)
			[2]: arg1 (readonly)
			[3]: arg3 (readonly)
			[4]: arg4 (readonly)
			[5]: new_upvr_2 (copied, readonly)
			[6]: var446_upvr (readonly)
			[7]: new_upvr (copied, readonly)
			[8]: var447_upvr (readonly)
		]]
		arg2.Tween(arg1, arg3.Categories.Gradient, tostring("Customisation_Categories_Gradient_"..arg4), {
			Offset = new_upvr_2(0, var446_upvr);
		}, arg1_8)
		arg2.Tween(arg1, arg3.Sub_Categories, tostring("Customisation_Sub_Categories_"..arg4), {
			Position = new_upvr(var447_upvr, 0, 0.5, 0);
		}, arg2_8)
		arg2.Tween(arg1, arg3.Sub_Categories.Gradient, tostring("Customisation_Sub_Categories_Gradient_"..arg4), {
			Offset = new_upvr_2(var446_upvr * -1, 0);
		}, arg2_8 + 0.05)
	end
	local var451_upvr = 1.133
	local function Back(arg1_9) -- Line 1710
		--[[ Upvalues[6]:
			[1]: arg2 (readonly)
			[2]: arg1 (readonly)
			[3]: arg3 (readonly)
			[4]: arg4 (readonly)
			[5]: new_upvr (copied, readonly)
			[6]: var451_upvr (readonly)
		]]
		arg2.Tween(arg1, arg3.Back, tostring("Customisation_Back_"..arg4), {
			Position = new_upvr(0.014, 0, var451_upvr, 0);
		}, arg1_9, "Back", "Out")
	end
	local var453_upvr = 0.975
	local var454_upvr = -1
	local function Rotation_upvr(arg1_10) -- Line 1714, Named "Rotation"
		--[[ Upvalues[8]:
			[1]: arg2 (readonly)
			[2]: arg1 (readonly)
			[3]: arg3 (readonly)
			[4]: arg4 (readonly)
			[5]: new_upvr (copied, readonly)
			[6]: var453_upvr (readonly)
			[7]: new_upvr_2 (copied, readonly)
			[8]: var454_upvr (readonly)
		]]
		arg2.Tween(arg1, arg3.Wheel, tostring("Customisation_Wheel_"..arg4), {
			Position = new_upvr(0.5, 0, var453_upvr, 0);
		}, arg1_10)
		arg2.Tween(arg1, arg3.Wheel.Gradient, tostring("Customisation_Wheel_Gradient_"..arg4), {
			Offset = new_upvr_2(0, var454_upvr * -1);
		}, arg1_10 + 0.05)
	end
	local var457_upvr = 0.45
	local function Right_upvr(arg1_11) -- Line 1719, Named "Right"
		--[[ Upvalues[8]:
			[1]: arg2 (readonly)
			[2]: arg1 (readonly)
			[3]: arg3 (readonly)
			[4]: arg4 (readonly)
			[5]: new_upvr (copied, readonly)
			[6]: var457_upvr (readonly)
			[7]: new_upvr_2 (copied, readonly)
			[8]: var454_upvr (readonly)
		]]
		arg2.Tween(arg1, arg3.Right, tostring("Customisation_Right_"..arg4), {
			Position = new_upvr(0.99, 0, var457_upvr, 0);
		}, arg1_11)
		arg2.Tween(arg1, arg3.Right.Gradient, tostring("Customisation_Right_Gradient_"..arg4), {
			Offset = new_upvr_2(0, var454_upvr);
		}, arg1_11 + 0.05)
	end
	task.defer(function() -- Line 1724
		--[[ Upvalues[6]:
			[1]: arg4 (readonly)
			[2]: Arcs_upvr (readonly)
			[3]: Back (readonly)
			[4]: Rotation_upvr (readonly)
			[5]: Categories_upvr (readonly)
			[6]: Right_upvr (readonly)
		]]
		if arg4 == "In" then
			Arcs_upvr(0.75, 1)
			task.wait(0.15)
			Back(1)
			Rotation_upvr(0.75)
			task.wait(0.15)
			Categories_upvr(0.65, 1.25)
			task.wait(0.2)
			Right_upvr(1.25)
		else
			Right_upvr(1)
			task.wait(0.1)
			Rotation_upvr(0.9)
			task.wait(0.15)
			Categories_upvr(1, 0.75)
			task.wait(0.1)
			Back(0.75)
			task.wait(0.2)
			Arcs_upvr(0.5, 0.25)
		end
	end)
end
function module_upvr.Back(arg1, arg2) -- Line 1762
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: new_upvr_4 (readonly)
		[3]: new_upvr (readonly)
	]]
	local Modules_4 = arg1.Modules
	local Events_2 = arg1.Events
	local Effects_6 = Modules_4.Effects
	local Title_Screen = Modules_4.Title_Screen
	local Runtime_2 = Modules_4.Runtime
	local any_Get_Data_result1_7, any_Get_Data_result2_6 = Modules_4.Update.Get_Data(arg1, true)
	if module_upvr.Customising == true and module_upvr.Spinning == false and any_Get_Data_result1_7 ~= nil then
		module_upvr.Customising = false
		module_upvr.Offset = module_upvr.Base_Offset
		module_upvr.Fade(arg1, Effects_6, arg2, "Out")
		any_Get_Data_result2_6.Avatar = arg1:Invoke("Functions", "Customise", module_upvr.Indexes)
		module_upvr.Storage(arg1, arg2.Family, false)
		task.wait(0.5)
		Title_Screen.Closing = false
		Effects_6.Fade(arg1, {"Customisation"}, "Closeout")
		local Character = Title_Screen.Character
		if Character ~= nil then
			for _, v_18 in pairs(Character:GetChildren()) do
				if v_18:IsA("Accessory") == true or v_18:IsA("Shirt") == true or v_18:IsA("Pants") == true or v_18:IsA("Model") == true and v_18.Name:find("Rig_") == nil then
					v_18:Destroy()
				end
			end
			Character.Head.Transparency = 0
			local any_Initiate_result1 = module_upvr.Initiate(arg1, arg1.Cache.Player, any_Get_Data_result2_6, Character, Character.Head)
			local var4_result1 = new_upvr_4("HumanoidDescription")
			for _, v_19 in pairs(Character.Humanoid:GetChildren()) do
				local var487
				if var487 ~= nil then
					local function INLINED_4() -- Internal function, doesn't exist in bytecode
						var487 = v_19.Name
						return var487
					end
					if v_19.Name:find("Type") == nil or not INLINED_4() then
						var487 = string.gsub(v_19.Name, "Body", "")
					end
					var4_result1[var487] = v_19.Value
				end
			end
			var4_result1.HeadColor = any_Initiate_result1
			var4_result1.LeftArmColor = any_Initiate_result1
			var4_result1.LeftLegColor = any_Initiate_result1
			var4_result1.RightArmColor = any_Initiate_result1
			var4_result1.RightLegColor = any_Initiate_result1
			var4_result1.TorsoColor = any_Initiate_result1
			Character.Humanoid:ApplyDescription(var4_result1)
			var4_result1:Destroy()
		end
		task.wait(2)
		if Events_2.Customisation_Camera ~= nil then
			Events_2.Customisation_Camera:Disconnect()
			Events_2.Customisation_Camera = nil
		end
		Runtime_2.cFrame = arg1:Get("Asset", {"Cameras", "Intro"}).CFrame
		Runtime_2.Tweening = false
		Modules_4.Lighting.Update(arg1, "Title_Screen")
		Effects_6.Fade(arg1, {"Closeout"}, "Title_Screen")
		task.wait(0.25)
		Effects_6.Tween(arg1, arg2.Parent.Title_Screen.Logo, "Title_Screen_Main_Logo_In", {
			ImageTransparency = 0;
		}, 0.5, nil, "Out")
		Title_Screen.Logo_Effects(arg1, true)
		arg2.Parent.Title_Screen.Buttons.Play.Visible = true
		Effects_6.Tween(arg1, arg2.Parent.Title_Screen.Buttons, "Title_Screen_Buttons_In", {
			Position = new_upvr(0.5, 0, 0.505, 0);
		}, 0.4, "Back", "Out")
	end
end
return module_upvr
