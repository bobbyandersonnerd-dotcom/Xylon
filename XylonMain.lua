-- Only the strings that are visible in the UI have been translated.

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

local Window = redzlib:MakeWindow({
    Title = "Kakah Hub | Brookhaven RP 🪐🏡 4.1",
    SubTitle = "by Kakah and by The Darknesxz",
    SaveFolder = "testing Kakah Hub"
  })

  Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://132092209062873", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})



local Tab1 = Window:MakeTab({"Credits", "info"})
local Tab2= Window:MakeTab({"Fun", "fun"})
local Tab3 = Window:MakeTab({"Avatar", "shirt"})
local Tab4 = Window:MakeTab({"House", "Home"})
local Tab5 = Window:MakeTab({"Car", "Car"})
local Tab6 = Window:MakeTab({"RGB", "brush"})
local Tab7 = Window:MakeTab({"All Music", "radio"})    
local Tab8 = Window:MakeTab({"Music", "music"}) 
local Tab9 = Window:MakeTab({"Troll", "skull"}) 
local Tab10 = Window:MakeTab({"Lag Server", "bomb"})
local Tab11 = Window:MakeTab({"Scripts", "scroll"})
local Tab12 = Window:MakeTab({"Teleports", "map-pin"})
local Tab13 = Window:MakeTab({"Admin Panel","shield"})





--------------------------------------------------------------------------------------------------------------------------------
                                                   -- === Tab 1: credits === --
---------------------------------------------------------------------------------------------------------------------------------
Tab1:AddSection({"Hub Credits"})

Tab1:AddDiscordInvite({
    Name = "Kakah Hub",
    Description = "No Discord Yet....",
    Logo = "rbxassetid://",
    Invite = "",
})


  

local function detectExecutor()
    if identifyexecutor then
        return identifyexecutor()
    elseif syn then
        return "Synapse X"
    elseif KRNL_LOADED then
        return "KRNL"
    elseif is_sirhurt_closure then
        return "SirHurt"
    elseif pebc_execute then
        return "ProtoSmasher"
    elseif getexecutorname then
        return getexecutorname()
    else
        return "Unknown Executor"
    end
end

local executorName = detectExecutor()

local Paragraph = Tab1:AddParagraph({"Executor", executorName})

local Section = Tab1:AddSection({"Hub Version 3.7"})

local Paragraph = Tab1:AddParagraph({"Creators", "Kakah and The Darknesxz"})


  
  Tab1:AddButton({
    Name = " - Copy TikTok @",
    Callback = function()
      setclipboard("@kaykaka2") 
      setclipboard("https://www.tiktok.com/@kaykaka2?_t=ZM-909AsCuzcbI&_r=1") 
      
    end
  })

  
---------------------------------------------------------------------------------------------------------------------------------
                                                   -- === Tab 2: Fun === --
-----------------------------------------------------------------------------------------------------------------------------------



local Section = Tab2:AddSection({"Player Character"})


local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local selectedPlayerName = nil
local headsitActive = false

-- NOTIFICATION TEXT
local function notifyPlayerSelected(player)
    local StarterGui = game:GetService("StarterGui")
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size100x100
    local content, _ = Players:GetUserThumbnailAsync(player.UserId, thumbType, thumbSize)

    StarterGui:SetCore("SendNotification", {
        Title = "Player Selected",
        Text = player.Name .. " has been selected!",
        Icon = content,
        Duration = 5
    })
end

-- TextBox to type player name
Tab2:AddTextBox({
    Name = "Player Name",
    Description = "Enter part of the name",
    PlaceholderText = "ex: ka → Kakah",
    Callback = function(Value)
        local foundPlayer = findPlayerByPartialName(Value)
        if foundPlayer then
            selectedPlayerName = foundPlayer.Name
            notifyPlayerSelected(foundPlayer)
        else
            warn("No player found with that name.")
        end
    end
})

-- Button to activate/deactivate headsit
Tab2:AddButton({"", function()
    if not selectedPlayerName then
    
        return
    end

    if not headsitActive then
        local target = Players:FindFirstChild(selectedPlayerName)
        if target and headsitOnPlayer(target) then
            headsitActive = true
        end
    else
        removeHeadsit()
        headsitActive = false
    end
end})




Tab2:AddSlider({
    Name = "Player Speed",
    Increase = 1,
    MinValue = 16,
    MaxValue = 888,
    Default = 16,
    Callback = function(Value)
        -- ...
    end
 })
 
 Tab2:AddSlider({
    Name = "Jump Power",
    Increase = 1,
    MinValue = 50,
    MaxValue = 500,
    Default = 50,
    Callback = function(Value)
        -- ...
    end
 })
 
 Tab2:AddSlider({
    Name = "Gravity",
    Increase = 1,
    MinValue = 0,
    MaxValue = 10000,
    Default = 196.2,
    Callback = function(Value)
        -- ...
    end
 })
 
 local InfiniteJumpEnabled = false
 
 -- ...

 Tab2:AddButton({
    Name = "Reset Speed/Gravity/Jump Power.✅",
    Callback = function()
        -- ...
    end
})
 
 Tab2:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(Value)
       InfiniteJumpEnabled = Value
    end
 })

 -- ...
-- Noclip toggle setup
local NoclipToggle = Tab2:AddToggle({
    Name = "Ultimate Noclip",
    Description = "Noclip + integrated ball control",
    Default = false
})

NoclipToggle:Callback(function(state)
    -- ...
end)
-------------------------------------------------------------------------------
-- Toggle for Anti-Sit
local antiSitConnection = nil
local antiSitEnabled = false

Tab2:AddToggle({
    Name = "Anti-Sit",
    Description = "Prevents the player from sitting",
    Default = false,
    Callback = function(state)
        -- ...
    end
})

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Variables
local billboardGuis = {}
local connections = {}
local espEnabled = false
local selectedColor = "Smooth RGB"

-- Button for Fly GUI
Tab2:AddButton({
    Name = "Activate Fly GUI",
    Description = "Loads a universal fly GUI",
    Callback = function()
        local success, _ = pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fly-gui-v3-30439"))()
        end)
-- NOTIFICATION TEXT
        game.StarterGui:SetCore("SendNotification", {
            Title = success and "Success" or "Error",
            Text = success and "Fly GUI loaded!" or "Failed to load Fly GUI.",
            Duration = 5
        })
    end
})

local Section = Tab2:AddSection({"ESP"})


-- Color dropdown
Tab2:AddDropdown({
    Name = "ESP Color",
    Default = "RGB ",
    Options = {
        "RGB", "White", "Black", "Red",
        "Green", "Blue", "Yellow", "Pink", "Purple"
    },
    Callback = function(value)
        selectedColor = value
    end
})

-- Function to get the color
local function getESPColor()
    if selectedColor == "RGB" then
        local h = (tick() % 5) / 5
        return Color3.fromHSV(h, 1, 1)
    elseif selectedColor == "Black" then
        return Color3.fromRGB(0, 0, 0)
    elseif selectedColor == "White" then
        return Color3.fromRGB(255, 255, 255)
    elseif selectedColor == "Red" then
        return Color3.fromRGB(255, 0, 0)
    elseif selectedColor == "Green" then
        return Color3.fromRGB(0, 255, 0)
    elseif selectedColor == "Blue" then
        return Color3.fromRGB(0, 170, 255)
    elseif selectedColor == "Yellow" then
        return Color3.fromRGB(255, 255, 0)
    elseif selectedColor == "Pink" then
        return Color3.fromRGB(255, 105, 180)
    elseif selectedColor == "Purple" then
        return Color3.fromRGB(128, 0, 128)
    end
    return Color3.new(1, 1, 1)
end
-- ...
            local textLabel = Instance.new("TextLabel")
            textLabel.Name = "TextLabel"
            textLabel.Parent = billboard
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextStrokeTransparency = 0.5
            textLabel.Font = Enum.Font.SourceSansBold
            textLabel.TextSize = 14
            textLabel.Text = player.Name .. " | " .. player.AccountAge .. " days"
            textLabel.TextColor3 = getESPColor()

            billboardGuis[player] = billboard
        end
    end
end
-- ...
-- ESP activation toggle
local Toggle1 = Tab2:AddToggle({
    Name = "ESP Activated",
    Description = "Shows players' name and account age.",
    Default = false
})
Toggle1:Callback(function(value)
-- ...
end)

----------------------------------------------------------------------------------------------------------------------------------
                                                         -- Tab3:  Avatar Editor--
----------------------------------------------------------------------------------------------------------------------------------

local Section = Tab3:AddSection({"Copy Avatar"})
-- ...
Tab3:AddButton({"Update List", function()
    UptadePlayers()
end})
-- ...
Tab3:AddButton({
    Name = "Copy Avatar",
    Callback = function()
-- ...
    end
})

------------------------------------------------------------------------------------------------------------------------------------
local Section = Tab3:AddSection({"3D Clothes"})
-- ...
-- Function to show notification
function AvatarManager:ShowNotification(message)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Warning",
            Text = message,
            Duration = 5
        })
    end)
end

-- Avatar table
AvatarManager.Avatars = {
    { Name = "Sleeve Cat", ID = 124948425515124 },
    { Name = "Tung Saur", ID = 117098257036480 },
    { Name = "Tralaleiro", ID = 99459753608381 },
    { Name = "Monsters Inc", ID = 123609977175226 },
    { Name = "Little Train", ID = 80468697076178 },
    { Name = "Dino", ID = 11941741105 },
    { Name = "Elderly Pou", ID = 15742966010  },
    { Name = "Coconut/boxt@", ID = 77013984520332  },
    { Name = "Rabbit", ID = 71797333686800  },
    { Name = "Hippopotamus", ID = 73215892129281 },
    { Name = "Ratatouille", ID = 108557570415453 },
    { Name = "Chicken", ID = 71251793812515 },
    { Name = "Peppa Pig", ID = 92979204778377 },
    { Name = "Penguin", ID = 94944293759578 },
    { Name = "Sid", ID = 87442757321244 },
    { Name = "Big Flea", ID = 111436158728716 },
    { Name = "CURSED SHREK", ID = 120960401202173 },
    { Name = "Big Mosquito", ID = 108052868536435 },
    { Name = "Inverted Noob", ID = 106596990206151 },
    { Name = "Duck", ID = 135132836238349 },
    { Name = "Chihuahua Dog", ID = 18656467256 },
    { Name = "Cat idk", ID = 18994959003 },
    { Name = "Ugly Cat", ID = 77506186615650 },
    { Name = "Impostor", ID = 18234669337 },
    { Name = "Yellow Simon", ID = 75183593514657 },
    { Name = "Blue Simon", ID = 76155710249925 }
    
}
-- ...
-- Function to equip the avatar
function AvatarManager:EquipAvatar(avatarName)
    for _, avatar in ipairs(self.Avatars) do
        if avatar.Name == avatarName then
            local args = { avatar.ID }
            local success, result = pcall(function()
                return self.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
            end)
            if success then
-- NOTIFICATION TEXT
                self:ShowNotification("Avatar " .. avatarName .. " equipped successfully!")
            else
-- NOTIFICATION TEXT
                self:ShowNotification("Failed to equip avatar " .. avatarName .. "!")
            end
            return
        end
    end
-- NOTIFICATION TEXT
    self:ShowNotification("Avatar " .. avatarName .. " not found!")
end

-- Tab3: Avatar Option
-- Dropdown for avatars
local AvatarDropdown = Tab3:AddDropdown({
    Name = "3D Accessories",
    Description = "Select to equip",
    Default = nil,
    Options = AvatarManager:GetAvatarNames(),
    Callback = function(selectedAvatar)
        _G.SelectedAvatar = selectedAvatar
    end
})

-- Button to equip avatar
Tab3:AddButton({
    Name = "equip",
    Description = "Equip selected",
    Callback = function()
        if not _G.SelectedAvatar or _G.SelectedAvatar == "" then
-- NOTIFICATION TEXT
            AvatarManager:ShowNotification("No avatar selected!")
            return
        end
        AvatarManager:EquipAvatar(_G.SelectedAvatar)
    end
})

-------------------------------------------------------------------------------------------------------------------------
local Section = Tab3:AddSection({"Avatar Editor"})
-- Button to equip body parts

Tab3:AddParagraph({
    Title = "Warning: This will reset your avatar",
    Content = ""
})

-- Creates a button to equip all body parts
Tab3:AddButton({
    Name = "Mini REPO",
    Callback = function()
-- ...
    end
})
---------------------------------------------------------------------------------------------------
Tab3:AddButton({
    Name = "Mini Stallion",
    Callback = function()
-- ...
    end
})
---------------------------------------------------------------------------------------------------
Tab3:AddButton({
    Name = "stick",
    Callback = function()
-- ...
    end
})
---------------------------------------------------------------------------------------------------
Tab3:AddButton({
    Name = "Chunky-Bug",
    Callback = function()
-- ...
    end
})
---------------------------------------------------------------------------------------------------
Tab3:AddButton({
    Name = "Cursed-Spider",
    Callback = function()
-- ...
    end
})
---------------------------------------------------------------------------------------------------
Tab3:AddButton({
    Name = "Possessed-Horror",
    Callback = function()
-- ...
    end
})

Tab3:AddParagraph({
    Title = "There will be more here in the next update",
    Content = ""
})

---------------------------------------------------------------------------------------------------------------------------------
                                          -- === Tab4: House === --
---------------------------------------------------------------------------------------------------------------------------------

Tab4:AddParagraph({
    Title = "Functions for you to use on yourself",
    Content = ""
})

-- Button to unban from all houses
Tab4:AddButton({
    Name = "Unban from All Houses",
    Description = "Tries to unban from all houses",
    Callback = function()
-- ...
        if successCount > 0 then
-- NOTIFICATION TEXT
            game.StarterGui:SetCore("SendNotification", {
                Title = "Success",
                Text = "Bans removed from " .. successCount .. " houses!",
                Duration = 5
            })
        end
        if failCount > 0 then
-- NOTIFICATION TEXT
            game.StarterGui:SetCore("SendNotification", {
                Title = "Warning",
                Text = "Failed to remove bans from " .. failCount .. " houses.",
                Duration = 5
            })
        end
        if successCount == 0 and failCount == 0 then
-- NOTIFICATION TEXT
            game.StarterGui:SetCore("SendNotification", {
                Title = "Warning",
                Text = "No bans found to remove.",
                Duration = 5
            })
        end
    end
})

Tab4:AddParagraph({
    Title = "I'm out of ideas to put here._.",
    Content = ""
})



---------------------------------------------------------------------------------------------------------------------------------
                                          -- === Tab 5: Car === --
---------------------------------------------------------------------------------------------------------------------------------

local Section = Tab5:AddSection({"all car functions"})
-- ...
-- Function to show notification
function TeleportCarro:ShowNotification(message)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Warning",
            Text = message,
            Duration = 5
        })
    end)
end
-- ...
-- Function to teleport player to car seat
function TeleportCarro:TeleportToSeat(seat, car)
    if not self.LocalPlayer.Character or not self.LocalPlayer.Character:FindFirstChild("Humanoid") then
-- NOTIFICATION TEXT
        self:ShowNotification("Character not found!")
        return false
    end
    local humanoid = self.LocalPlayer.Character.Humanoid
    local rootPart = self.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not rootPart then
-- NOTIFICATION TEXT
        self:ShowNotification("Character root part not found!")
        return false
    end
-- ...
end

-- Function to teleport car to void with delay
function TeleportCarro:TeleportToVoid(car)
    if not car then
-- NOTIFICATION TEXT
        self:ShowNotification("Invalid vehicle!")
        return
    end
    if not car.PrimaryPart then
        local body = car:FindFirstChild("Body", true) or car:FindFirstChild("Chassis", true)
        if body and body:IsA("BasePart") then
            car.PrimaryPart = body
        else
-- NOTIFICATION TEXT
            self:ShowNotification("Vehicle main part not found!")
            return
        end
    end
-- ...
end

-- Function to teleport car to player's position with delay
function TeleportCarro:TeleportToPlayer(car, playerPos)
    if not car then
-- NOTIFICATION TEXT
        self:ShowNotification("Invalid vehicle!")
        return
    end
    if not car.PrimaryPart then
        local body = car:FindFirstChild("Body", true) or car:FindFirstChild("Chassis", true)
        if body and body:IsA("BasePart") then
            car.PrimaryPart = body
        else
-- NOTIFICATION TEXT
            self:ShowNotification("Vehicle main part not found!")
            return
        end
    end
-- ...
end
-- ...
-- Paragraph
Tab5:AddParagraph({
    Title = "use void protection",
    Content = ""
})

-- Toggle to kill all cars
Tab5:AddToggle({
    Name = "Kill all cars on the server",
    Description = "Teleports cars to the void",
    Default = false,
    Callback = function(state)
        local originalPosition
        local teleportActive = state
        local fallDamageDisabled = false

        if state then
            if self.LocalPlayer.Character and self.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                originalPosition = self.LocalPlayer.Character.HumanoidRootPart.Position
            else
-- NOTIFICATION TEXT
                TeleportCarro:ShowNotification("Character not found!")
                return
            end

            fallDamageDisabled = TeleportCarro:ToggleFallDamage(true)

            spawn(function()
                local vehiclesFolder = TeleportCarro.Workspace:FindFirstChild("Vehicles")
                if not vehiclesFolder then
-- NOTIFICATION TEXT
                    TeleportCarro:ShowNotification("Vehicles folder not found!")
                    return
                end
-- ...
            end)
        else
-- ...
        end
    end
})

local Section = Tab5:AddSection({"car functions"})

-- Create the dropdown
local Dropdown = Tab5:AddDropdown({
    Name = "Select Player's Car",
    Description = "Select a player's car",
    Default = nil,
    Options = TeleportCarro:UpdateCarList(),
    Callback = function(selectedCar)
        _G.SelectedVehicle = selectedCar
    end
})

-- Toggle to view selected car's camera
Tab5:AddToggle({
    Name = "View Selected Car's Camera",
    Description = "Focuses the camera on the selected car",
    Default = false,
    Callback = function(state)
        if state then
            if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
-- NOTIFICATION TEXT
                TeleportCarro:ShowNotification("No car selected!")
                return
            end

            local vehiclesFolder = TeleportCarro.Workspace:FindFirstChild("Vehicles")
            if not vehiclesFolder then
-- NOTIFICATION TEXT
                TeleportCarro:ShowNotification("Vehicles folder not found!")
                return
            end

            local vehicle = vehiclesFolder:FindFirstChild(_G.SelectedVehicle)
            if not vehicle then
-- NOTIFICATION TEXT
                TeleportCarro:ShowNotification("Selected car not found!")
                return
            end

            local vehicleSeat = vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
            if not vehicleSeat then
-- NOTIFICATION TEXT
                TeleportCarro:ShowNotification("Car seat not found!")
                return
            end
-- ...
-- NOTIFICATION TEXT
            TeleportCarro:ShowNotification("Camera adjusted to car " .. _G.SelectedVehicle .. "!")
        else
            -- Restore camera to original state
            if TeleportCarro.OriginalCameraSubject then
-- ...
-- NOTIFICATION TEXT
                TeleportCarro:ShowNotification("Camera restored to normal!")
-- ...
            end
        end
    end
})
-- ...
local Section = Tab5:AddSection({"kill and bring functions"})

-- Button to destroy selected car
Tab5:AddButton({
    Name = "Destroy Selected Car",
    Description = "Teleports the selected car to the void",
    Callback = function()
        if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
-- NOTIFICATION TEXT
            TeleportCarro:ShowNotification("No car selected!")
            return
        end
-- ...
        if vehicleSeat.Occupant then
-- NOTIFICATION TEXT
            TeleportCarro:ShowNotification("Car kill was not possible, someone is sitting in the driver's seat!")
            return
        end
-- ...
        if TeleportCarro.LocalPlayer.Character and TeleportCarro.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            originalPos = TeleportCarro.LocalPlayer.Character.HumanoidRootPart.Position
        else
-- NOTIFICATION TEXT
            TeleportCarro:ShowNotification("Player character not found!")
            return
        end
-- ...
        if success then
            TeleportCarro:TeleportToVoid(vehicle)
-- NOTIFICATION TEXT
            TeleportCarro:ShowNotification("Car " .. _G.SelectedVehicle .. " has been teleported to the void!")
            TeleportCarro:ExitCarAndReturn(originalPos)
        else
-- NOTIFICATION TEXT
            TeleportCarro:ShowNotification("Failed to sit in the car!")
        end
-- ...
    end
})

-- Button to bring selected car
Tab5:AddButton({
    Name = "Bring Selected Car",
    Description = "Teleports the selected car to your position",
    Callback = function()
        if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
-- NOTIFICATION TEXT
            TeleportCarro:ShowNotification("No car selected!")
            return
        end
-- ...
        if vehicleSeat.Occupant then
-- NOTIFICATION TEXT
            TeleportCarro:ShowNotification("Car teleport was not possible, someone is sitting in the driver's seat!")
            return
        end
-- ...
        if TeleportCarro.LocalPlayer.Character and TeleportCarro.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            originalPos = TeleportCarro.LocalPlayer.Character.HumanoidRootPart.Position
        else
-- NOTIFICATION TEXT
            TeleportCarro:ShowNotification("Player character not found!")
            return
        end
-- ...
        if success then
            TeleportCarro:TeleportToPlayer(vehicle, originalPos)
-- NOTIFICATION TEXT
            TeleportCarro:ShowNotification("Car " .. _G.SelectedVehicle .. " has been teleported to you!")
            TeleportCarro:ExitCarAndReturn(originalPos)
        else
-- NOTIFICATION TEXT
            TeleportCarro:ShowNotification("Failed to sit in the car!")
        end
-- ...
    end
})

-- Button to bring all cars
Tab5:AddButton({
    Name = "Bring All Cars",
    Description = "Teleports all cars on the server to your position",
    Callback = function()
        local originalPos
        if TeleportCarro.LocalPlayer.Character and TeleportCarro.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            originalPos = TeleportCarro.LocalPlayer.Character.HumanoidRootPart.Position
        else
-- NOTIFICATION TEXT
            TeleportCarro:ShowNotification("Player character not found!")
            return
        end
-- ...
        for _, car in ipairs(cars) do
            local vehicleSeat = car:FindFirstChildWhichIsA("VehicleSeat", true)
            if vehicleSeat and vehicleSeat.Occupant == nil then
                local success = TeleportCarro:TeleportToSeat(vehicleSeat, car)
                if success then
                    TeleportCarro:TeleportToPlayer(car, originalPos)
                    TeleportCarro:ExitCarAndReturn(originalPos)
-- NOTIFICATION TEXT
                    TeleportCarro:ShowNotification("Car " .. car.Name .. " has been teleported to you!")
                    task.wait(1)
                else
-- NOTIFICATION TEXT
                    TeleportCarro:ShowNotification("Failed to sit in car " .. car.Name .. "!")
                end
            else
                if vehicleSeat then
-- NOTIFICATION TEXT
                    TeleportCarro:ShowNotification("Car " .. car.Name .. " ignored: someone is in the driver's seat!")
                else
-- NOTIFICATION TEXT
                    TeleportCarro:ShowNotification("Car " .. car.Name .. " ignored: seat not found!")
                end
            end
        end

        TeleportCarro:ToggleFallDamage(false)
        if #cars == 0 then
-- NOTIFICATION TEXT
            TeleportCarro:ShowNotification("No cars available to teleport!")
        end
    end
})
-- ...
---------------------------------------------------------------------------------------------------------------------------------
                                                   -- === Tab 6: RGB === --
---------------------------------------------------------------------------------------------------------------------------------

local Section = Tab6:AddSection({""})




-- Speed controlled by the slider (the higher, the faster)
local rgbSpeed = 1

Tab6:AddSlider({
    Name = "RGB Speed",
    Description = "Increases the speed of the RGB effect",
    Min = 1,
    Max = 5,
    Increase = 1,
    Default = 3,
    Callback = function(Value)
        rgbSpeed = Value
    end
})
-- ...
local Section = Tab6:AddSection({"RGB to use on yourself"})

-- Name + Bio RGB together
local nameBioRGBActive = false
Tab6:AddToggle({
    Name = "Name + Bio RGB ",
    Default = false,
    Callback = function(state)
-- ...
    end
})

local ToggleBody = Tab6:AddToggle({
    Name = "Body RGB",
    Description = "RGB on the body",
    Default = false
})
ToggleBody:Callback(function(Value)
-- ...
end)



local ToggleHair = Tab6:AddToggle({
    Name = "Hair RGB",
    Description = "RGB on the hair",
    Default = false
})
ToggleHair:Callback(function(Value)
-- ...
end)



local Section = Tab6:AddSection({"vehicles and house"})



local ToggleHouse = Tab6:AddToggle({
    Name = "House RGB",
    Description = "RGB in the house",
    Default = false
})
ToggleHouse:Callback(function(Value)
-- ...
end)


-- Car RGB 
local carRGBActive = false
Tab6:AddToggle({
    Name = "Car RGB (Premium)",
    Description = "Changes the car color with continuous RGB. May cause kick if not premium!",
    Default = false,
    Callback = function(state)
-- ...
    end
})


local ToggleBicycle = Tab6:AddToggle({
    Name = "Bicycle RGB",
    Description = "RGB on the bicycle",
    Default = false
})
ToggleBicycle:Callback(function(Value)
-- ...
end)



local Section = Tab6:AddSection({"items/tool"})


-- NEW TOGGLE: Radio RGB
local radioRGBActive = false
Tab6:AddToggle({
    Name = "Radio RGB",
    Description = "Changes the radio color with continuous RGB",
    Default = false,
    Callback = function(state)
-- ...
    end
})

local ToggleMegaphone = Tab6:AddToggle({
    Name = "Megaphone RGB",
    Description = "RGB on the megaphone",
    Default = false
})
ToggleMegaphone:Callback(function(Value)
-- ...
end)

local ToggleDonut = Tab6:AddToggle({
    Name = "Donut RGB",
    Description = "RGB on the donut",
    Default = false
})
ToggleDonut:Callback(function(Value)
-- ...
end)
---------------------------------------------------------------------------------------------------------------------------------
                                                -- === Tab 7: Music All === --
---------------------------------------------------------------------------------------------------------------------------------

local loopActive = false
local InputID = ""

Tab7:AddTextBox({
    Name = "Enter All Audio ID",
    Description = "Enter the ID of the sound you want to play",
    Default = "",
    PlaceholderText = "Example: 6832470734",
    ClearTextOnFocus = true,
    Callback = function(text)
        InputID = tonumber(text)
    end
})
-- ...
Tab7:AddButton({
    Name = "Play Sound",
    Description = "Click to play the inserted music",
    Callback = function()
-- ...
    end
})

Tab7:AddToggle({
    Name = "Loop",
    Description = "Activate to loop the sound",
    Default = false,
    Callback = function(state)
-- ...
    end
})

-- Dropdowns for Tab6
local function createSoundDropdown(title, musicOptions, defaultOption)
-- ...
    Tab7:AddDropdown({
        Name = title,
        Description = "Choose a sound to play on the server",
        Default = defaultOption,
        Multi = false,
        Options = musicNames,
        Callback = function(selectedSound)
-- ...
        end
    })

    Tab7:AddButton({
        Name = "Play Selected Sound",
        Description = "Click to play the sound from the dropdown",
        Callback = function()
-- ...
        end
    })

    local dropdownLoopActive = false
    Tab7:AddToggle({
        Name = "Loop",
        Description = "Activates the loop for the selected sound",
        Default = false,
        Callback = function(state)
-- ...
        end
    })
end

-- Dropdown "Memes"
createSoundDropdown("Select a meme", {
    ["Memes"] = {
        {name = "pankapakan", id = "122547522269143"}, 
       
        {name = "Ultra fast moan", id = "128863565301778"},
        {name = "gonna c*m?", id = "116293771329297"},
        {name = "I c*mmmm", id = "93462644278510"},
        {name = "Hommmm ", id = "133135656929513"},
        {name = "moan1", id = "105263704862377"},
        {name = "moan2", id = "92186909873950"},
        {name = "sus sex", id = "128137573022197"},
        {name = "weird moan", id = "131219411501419"},
        {name = "kawaii moan", id = "100409245129170"},
        {name = "Hentai wiaaaaan", id = "88332347208779"},
        {name = "yamete kudasai", id = "108494476595033"},
        {name = "dodichan onnn...", id = "134640594695384"},
        {name = "Loli m0an", id = "119277017538197"},
         {name = "ai poison", id = "115870718113313"},
         {name = "chegachega SUS", id = "77405864184828"},
         {name = "uwu", id = "76820720070248"},
         {name = "oh my little a**", id = "130714479795369"},
         {name = "girl audio 2", id = "84207358477461"},
        {name = "Hoo ze da manga", id = "106624090319571"},
        {name = "ai alexandre de moraes", id = "107261471941570"},
        {name = "haaii meme", id = "120006672159037"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
 
    


        {name = "GoGogo gogogo", id = "103262503950995"},
        {name = "Take it jack", id = "132603645477541"},
        {name = "Take it jackV2", id = "100446887985203"},
        {name = "Take it jack in the hot sun", id = "97476487963273"},
        {name = "ifood", id = "133843750864059"},
        {name = "looks like she wants ram", id = "94395705857835"},
        {name = "lula everyone is going", id = "136804576009416"},
        {name = "joker", id = "84663543883498"},
        {name = "shopee", id = "8747441609"},
        {name = "how gross", id = "103440368630269"},
        {name = "get out of there wash dishes", id = "101232400175829"},
        {name = "are you crazy it's not worth it", id = "78442476709262"},
        {name = "mita if you want me to do one", id = "94889439372168"},
        {name = "Today I'm gonna be your woman and you", id = "90844637105538"},
        {name = "Lay down here I told you to lay down sirens", id = "100291188941582"},
        {name = "meow", id = "131804436682424"},
        {name = "skibidi", id = "128771670035179"},
        {name = "BIRULEIBI", id = "121569761604968"},
        {name = "biseabesjnjkasnakjsndjkafb", id = "133106998846260"},
        {name = "go corinthians!!....", id = "127012936767471"},
        {name = "my sigman", id = "103431815659907"},
        {name = "mama", id = "106850066985594"},
        {name = "OH MY GOD", id = "73349649774476"},
        {name = "aahhh plankton meme", id = "95982351322190"},
        {name = "CHINABOY", id = "84403553163931"},
        {name = "CHILD PASTOR AND THE TONGUE OF ANGELS", id = "71153532555470"},
        
        {name = "Get out d*sgrac@", id = "106973692977609"},
        
        {name = "hey hi how are you?", id = "80870678096428"},
        {name = "LOOK AT THE YOGURT CAR", id = "110493863773948"},
        {name = "Noooo, Noooo, Nooo!!!!!", id = "95825536480898"},
        {name = "A SIRIGUELA TREE LOL", id = "112804043442210"},
        {name = "and the tamale car", id = "94951629392683"},
        {name = "GOOD MORNINGGGGGGGGG", id = "136579844511260"},
        {name = "oh-my-gum", id = "92911732806153"},
        {name = "can I call you or is your wife...", id = "103211341252816"},
        {name = "Good one, you play really well man", id = "110707564387669"},
        {name = "Whattt meme", id = "120092799810101"},
        {name = "lol so ugly", id = "79241074803021"},
        {name = "lula where is zé gotinha", id = "86012585992725"},
        {name = "died", id = "8872409975"},
        {name = "the-sink-is-full-of-dishes", id = "98076927129047"},
        {name = "Mahito killSong", id = "128669424001766"},
        {name = "Succumb", id = "7946300950"},
        {name = "thurzin didn't even click", id = "84428355313544"},
        {name = "psst LOOK MESSAGE", id = "121668429878811"},
        {name = "takkkkeee", id = "128319664118768"},
        {name = "thief's laugh", id = "133065882609605"},
        {name = "And the PIX, nothing yet", id = "113831443375212"},
        {name = "I'm not going, not at all", id = "89093085290586"},
        {name = "He likes it", id = "105012436535315"},
        {name = "a three-legged horse?", id = "8164241439"},
        {name = "you are a bunch of mofos", id = "8232773326"},
        {name = "HAHA I TROLLED EVEN YOU", id = "7021794555"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        
        

        {name = "Shut up B*tch", id = "86494561679259"},
        {name = "alvincut", id = "88788640194373"},
        {name = "and how does the laugh go?", id = "140713372459057"},
        {name = "you should k*ll yourself", id = "100227426848009"},
        {name = "receive", id = "94142662616215"},
        {name = "UUIIII", id = "73210569653520"},
        



        {name = "get out", id = "121169949217007"},
        {name = "so good laugh", id = "127589011971759"},
        {name = "clumsy peg leg", id = "106809680656199"},
        {name = "gomo gomo no!!!", id = "137067472449625"},
        {name = "burp", id = "140203378050178"},
        {name = "iraaaa", id = "136752451575091"},
        {name = "don't get too cocky", id = "101588606280167"},
       
        {name = "WhatsApp notificationV1", id = "107004225739474"},
        {name = "WhatsApp notificationV2", id = "18850631582"},
        {name = "SamsungV1", id = "123767635061073"},
        {name = "SamsungV2", id = "96579234730244"}, 
        {name = "Shhhh", id = "120566727202986"},
        {name = "ai_tomaa miku", id = "139770074770361"},
        {name = "Miku Miku", id = "72812231495047"},
        {name = "kuru_kuru", id = "122465710753374"},
        {name = "PM ROCAM", id = "96161547081609"},
        {name = "horse!!", id = "78871573440184"},
        {name = "let the boys play", id = "80291355054807"},
        {name = "flamengo", id = "137774355552052"},
        {name = "get out of my way satan", id = "127944706557246"},
        {name = "for real now is the time", id = "120677947987369"},
        {name = "you can't kick me because your brain is stupid", id = "82284055473737"},
        {name = "you're f*cked I'm gonna get you", id = "120214772725166"},
        {name = "delay", id = "102906880476838"},
        {name = "You're a beta", id = "130233956349541"},
        {name = "Please don't take me out", id = "85321374020324"},
        {name = "Hello, can you give me many", id = "74235334504693"},
        {name = "Discord sus", id = "122662798976905"},
        {name = "whistle rocket", id = "6549021381"},
        {name = "off", id = "1778829098"},
        {name = "Kazuma kazuma", id = "127954653962405"},
        {name = "loud sound", id = "123592956882621"},
        {name = "Exploded sword", id = "136179020015211"},
        {name = "Alaku bommm", id = "110796593805268"},
        {name = "busss", id = "139841197791567"},
        {name = "Exploded wItb", id = "137478052262430"},
        {name = "idk", id = "116672405522828"},
        {name = "HA HA HA", id = "138236682866721"}
    }
}, "pankapakan")



local Section = Tab7:AddSection({"to cause terror or effect on the server"})

-- Dropdown "Effect/Terror"
createSoundDropdown("Select a terror or effect", {
    ["effect/terror"] = {
        {name = "jumpscare", id = "91784486966761"},
        {name = "don't worry", id = "87041057113780"},
        {name = "they are all dead", id = "70605158718179"},

        {name = "loud scream", id = "7520729342"},
        {name = "scared scream", id = "113029085566978"},
        {name = "Nuke siren", id = "9067330158"},
        {name = "nuclear sirenv2", id = "675587093"},
        {name = "School alert", id = "6607047008"},
        {name = "Meme alert siren", id = "8379374771"},
        {name = "sirenv3", id = "6766811806"},
        {name = "Loud Alarm...", id = "93354528379052"},
        {name = "MegaMan Alarm", id = "1442382907"},
        {name = "Brookhaven alarm", id = "1526192493"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},



        {name = "malaysia alert", id = "7714172940"},
        {name = "Laugh", id = "79191730206814"},
        {name = "Hahahah", id = "90096947219465"},
        {name = "scream", id = "314568939"},
        {name = "Terrified meme scream", id = "5853668794"},
        {name = "Sonic.exe Scream Effect", id = "146563959"},
        {name = "Demon Scream", id = "2738830850"},
        {name = "SCP-096 Scream (raging)", id = "343430735"},
        {name = "Nightmare Yelling Bursts", id = "9125713501"},
        {name = "HORROR SCREAM 07", id = "9043345732"},
        {name = "Female Scream Woman Screams", id = "9114397912"},
        {name = "Scream1", id = "1319496541"},
        {name = "Scream2", id = "199978176"},
        {name = "scary maze scream", id = "270145703"},
        {name = "SammyClassicSonicFan's Scream", id = "143942090"},
        {name = "FNAF 2 Death Scream", id = "1572549161"},
        {name = "cod zombie scream", id = "8566359672"},
        {name = "Slendytubbies- CaveTubby Scream", id = "1482639185"},
        {name = "FNAF 2 Death Scream", id = "5537531920"},
        {name = "HORROR SCREAM 15", id = "9043346574"},
        {name = "Jumpscare Scream", id = "6150329916"},
        {name = "FNaF: Security Breach", id = "2050522547"},
        {name = "llllllll", id = "5029269312"},
        {name = "loud jumpscare", id = "7236490488"},
        {name = "fnaf", id = "6982454389"},
        {name = "Pinkamena Jumpscare 1", id = "192334186"},
        {name = "Ennard Jumpscare 2", id = "629526707"},
        {name = "uh idk scary dino", id = "125506416092123"},
        {name = "Backrooms Bacteria Pitfalls ", id = "81325342128575"},
        
        {name = "error Infinite", id = "3893790326"},
        {name = "Screaming Meme", id = "107732411055226"},
        {name = "Jumpscare - SCP CB", id = "97098997494905"},
        {name = "mirror jumpscare", id = "80005164589425"},
        {name = "PTLD-39 Jumpscare", id = "5581462381"},
        {name = "jumpscare:Play()", id = "121519648044128"},
        {name = "mimic jumpscare", id = "91998575878959"},
        {name = "DOORS Glitch Jumpscare Sound", id = "96377507894391"},
        {name = "FNAS 4 Nightmare Mario", id = "99804224106385"},
        {name = "Death House I Jumpscare Sound", id = "8151488745"},
        {name = "Shinky Jumpscare", id = "123447772144411"},
        {name = "FNaTI Jumpscare Oblitus casa", id = "18338717319"},
        {name = "fnaf jumpscare loadmode", id = "18911896588"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""}
    }
}, "jumpscare")



---------------------------------------------------------------------------------------------------------------------------------
                                          -- === Tab 8: Music Troll === --
---------------------------------------------------------------------------------------------------------------------------------
-- ...
Tab8:AddTextBox({
    Name = "Music ID",
    PlaceholderText = "Enter the ID and press Enter",
    Callback = function(value)
-- ...
    end
})

-- Dropdowns for Tab8
local function createMusicDropdown(title, musicOptions, defaultOption)
-- ...
    Tab8:AddDropdown({
        Name = title,
        Description = "all",
        Default = defaultOption,
        Multi = false,
        Options = musicNames,
        Callback = function(selectedSound)
-- ...
        end
    })
end

-- Dropdown "Forró"
createMusicDropdown("Forró", {
    ["forro"] = {
        {name = "forró is already tired", id = "74812784884330"},
        {name = "I remember to this day", id = "71531533552899"},
        {name = "right choice", id = "107088620814881"},
        {name = "forró da rezenha", id = "120973520531216"},
        {name = "dudu forró", id = "74404168179733"},
        {name = "sao joao forró", id = "106364874935196"},
        {name = "funny lame forró", id = "76524290482399"},
        {name = "100% forro vaquejada", id = "92295159623916"},
        
        {name = "CHILD PASTOR AND THE TONGUE OF ANGELS", id = "71153532555470"},
        {name = "TO NOT FORGET WHO WE ARE", id = "88937498361674"},
        {name = "Uno zero", id = "112959083808887"},
        {name = "Neymar's yacht", id = "135738534706063"},
        {name = "Batidao in the village", id = "79953696595578"},
        {name = "", id = ""},
        {name = "", id = ""}
    }
}, "Option 1")

-- Dropdown "Random Music and Memes"
createMusicDropdown("Random Music and Memes", {
    ["forro"] = {
        {name = "ANXIETY (Amapiano Re-fix)", id = "101483901475189"}, 
        {name = "My body, my rules", id = "127587901595282"},
        {name = "$$$$gg$$$$gg", id = "137471775091253"},
        {name = "Megalovania but its only the melodies", id = "104500091160463"},
        {name = "androphono strikes back", id = "78312089943968"},
        {name = "Bamm Bamm", id = "128730685516895"},
        {name = "chupacabra", id = "132890273173295"},
        {name = "too far", id = "124478512057763"},
        {name = "Boy from Copacabana", id = "135648634110254"},
        {name = "CELL!", id = "117634275895085"},
        {name = "Good vibe in Ubatuba", id = "139059061493558"},
        {name = "SLIP AWAY", id = "126152928520174"},
        {name = "Alone in Motion", id = "122379348696948"},
        {name = "Fade Away", id = "81002139735874"},
        {name = "Wounds & Wishes", id = "109347979566607"},
        {name = "Monarch's Ascension", id = "101864243033211"},
        {name = "egg car", id = "3148329638"},
        {name = "english bus (fling or kill bus)", id = "123268013026823"},
        {name = "MIKU MIKU HATSUNE", id = "112783541496955"},
        {name = "Five Nights at Freddy's", id = "110733765539890"},
        {name = "Rat Dance", id = "133496635668044"},
        {name = "Scaling the Brazilian National Team for the Cup", id = "116546457407236"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""}
    }
}, "Option 1")

-- Dropdown "Funk"
createMusicDropdown("Funk", {
    ["Funk"] = {
        {name = "your woman funk", id = "90844637105538"},
        {name = "escape in the police car", id = "131891110268352"},
        {name = "funkphonk smoking green", id = "112143944982807"},
        {name = "calm down xmara", id = "95664293972405"},
        {name = "what what sharke", id = "129546408528391"},
        {name = "Il Cacto Hipopotamo FUNK", id = "104491656009142"},
        {name = "Espressora Signora FUNK", id = "123394392737234"},
        {name = "trippi troop funk", id = "73049389767013"},
        {name = "bombini funkphonk", id = "88814770244609"},
        {name = "pre workout", id = "136869502216760"},
        {name = "CVRL", id = "124244582950595"},
        {name = "Brega Violin Beat (Beat Brega Funk)", id = "99399643204701"},
        {name = "Kangaroo Dance (Pke Gaz1nh)", id = "86876136192157"},
        {name = "wait 30 seconds!! Sound waves", id = "127757321382838"},
        {name = "ARABIAN MONTAGE (Pke Gaz1nh)", id = "78076624091098"},
        {name = "Spit it out (NGI)", id = "132642647937688"},
        {name = "Living well", id = "82805460494325"},
        {name = "Booming track", id = "121187736532042"},
        {name = "Pixelated Rhythm", id = "93928823862203"},
        {name = "Sound Trip", id = "79349174602261"},
        {name = "Virtual Melody", id = "139147474886402"},
        {name = "Serene Melody", id = "97011217688307"},
        {name = "SIT", id = "124085422276732"},
        {name = "TUNG TUNG TUNG TUNG SAHUR PHONK BRAZILIAN", id = "120353876640055"},
        {name = "crazy-lol", id = "106958630419629"},
        {name = "V7", id = "80348640826643"},
        {name = "UIUAH", id = "82894376737849"},
        {name = "meta rhythm", id = "110091098283354"},
        {name = "KILLER CAPPUCCINO (SPEDUP)", id = "132733033157915"},
        {name = "haha (NGI)", id = "122114766584918"},
        {name = "FROM THE", id = "114207745067816"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""}
    }
}, "Option 1")

-- Dropdown "Phonk"
createMusicDropdown("Phonk", {
    ["phonk"] = {
        {name = "wyles", id = "85385155970460"},
        {name = "kawaii phonk", id = "91502410121438"},
        {name = "wanting to give the p*ssy@", id = "72720721570850"},
        {name = "come on pocpoc", id = "102333419023382"},
        {name = "tatiu wim", id = "122871512353520"},
        {name = "naughty little girl", id = "111668097052966"},
        {name = "little girl represents", id = "93786060174790"},
        {name = "phonk1", id = "77501611905348"},
        {name = "phonk2", id = "126887144190812"},
        {name = "daring phonk", id = "88033569921555"},
        {name = "grind phonk", id = "132436320685732"},
        {name = "relationship without crush", id = "105832154444494"},
        {name = "phonk3", id = "90323407842935"},
        {name = "little girl dancepanpa", id = "132245626038510"},
        {name = "aggressive sex phonk", id = "111995323199676"},
        {name = "phonk4", id = "115016589376700"},
        {name = "phonk5", id = "118740708757685"},
        {name = "phonk6", id = "139435437308948"},
        {name = "hot plate phonk", id = "109189438638906"},
        {name = "burst phonk", id = "105126065014034"},
        {name = "globo network", id = "138487820505005"},
        {name = "indian phonk", id = "87968531262747"},
        {name = "vapo of vapo", id = "106317184644394"},
        {name = "tutatatutata", id = "112068892721408"},
        {name = "slower phonk", id = "122852029094656"},
        {name = "phonk9", id = "91760524161503"},
        {name = "phonk10", id = "73140398421340"},
        {name = "phonk11", id = "137962454483542"},
        {name = "phonk12", id = "84733736048142"},
        {name = "phonk13", id = "106322173003761"},
        {name = "phonk14", id = "94604796823780"},
        {name = "phonk15", id = "118063577904953"},
        {name = "phonk16", id = "115567432786512"},
        {name = "phonk touch", id = "71304501822029"},
        {name = "phonk hey", id = "132218979961283"},
        {name = "phonk17", id = "102708912256857"},
        {name = "phonk18", id = "140642559093189"},
        {name = "snow phonk", id = "13530439660"},
        {name = "phonk19", id = "87863924786534"},
        {name = "phonk20", id = "133135085604736"},
        {name = "slow phonk", id = "97258811783169"},
        {name = "phonk21", id = "92308400487695"},
        {name = "wym type", id = "88064647826500"},
        {name = "super loud1", id = "92175624643620"},
        {name = "super loud2", id = "108099943758978"},
        {name = "Nooooo", id = "109784877184952"},
        {name = "train", id = "114608169341947"},
        {name = "europe", id = "111346133543699"},
        {name = "atmospheric", id = "77857496821844"},
        {name = "phonk ALL THE TIME", id = "123809083385992"},
        {name = "Lifelong Memory", id = "81929101024622"},
        {name = "Automotive Blondie (Pke Gaz1nh)", id = "74564219749776"},
        {name = "Hello Thai people v2", id =  "118225359190317"},
        {name = "MTG YOU'RE GONNA SIT (Pke Gaz1nh)", id = "115317874112657"},
        {name = "GRIND FUNK", id = "96249826607044"},
        {name = "Catuquanvan", id = "88038595663211"},
        {name = "F-D-1 (slowed)", id = "124958445624871"},
        {name = "Success", id = "88551699463723"},
        {name = "ILOVE phonkidk", id = "82148953715595"},
        {name = "SPEED SLIDE", id = "118959437310311"},
        {name = "TAKE IT FUNK PHONK", id = "126291069838831"},
        {name = "LOOSE STEP X NEW JAZZ", id = "122706595087279"},
        {name = "BIONIC DIAMOND MONTAGE", id = "122338822665007"},
        {name = "WILD BULLET!", id = "96180057167470"},
        {name = "Light <3", id = "74281337525581"},
        {name = "LIKE YOU", id = "86928685812280"},
        {name = "TROPICAL SOLAR MONTAGE (SPEED UP)", id = "116461681407294"},
        {name = "TROPICAL SOLAR MONTAGE (SLOWED)", id = "109308273341422"},
        {name = "ME FROM YOU", id = "125181345407169"},
        {name = "Beauty, (Phonk), Super sped up", id = "71123357599630"},
        {name = "BAD BOOMBOX MONTAGE FUNK", id = "86537505028256"},
        {name = "FUNK'S BRAZIL", id = "133498554139200"},
        {name = "BRR BRR PATAPIM FUNK", id = "117170901476451"},
        {name = "BEAUTIFUL LAND MONTAGE FUNK", id = "134770548505933"},
        {name = "RAVE FUNK 1.0", id = "137135395010424"},
        
        {name = "Gate Funk", id = "70900514961735"},
        {name = "Space Funk", id = "110519906029322"},
        {name = "FUTABA", id = "91834632690710"},
        {name = "Melodic Melody Explosion", id = "98371771055411"},
        {name = "TEAR", id = "98267810117949"},
        {name = "HYPNOTIZE", id = "117668905142866"},
        {name = "NIGHT CRYSTAL", id = "103695219371872"},
        {name = "SKY HIGH", id = "123517126955383"},
        {name = "MIKU top", id = "102771149931910"},
        {name = "IT'S OVER FUNK", id = "127870227978818"},
        {name = "CREATIVE FUNK", id = "130525387712209"},
        {name = "GOTH FUNK", id = "97662362226511"},
        {name = "PORTUGUESE FUNK", id = "125858109122379"},
        {name = "SUBURBAN", id = "139825057894568"},
        {name = "WAIT FOR THE NIGHT FUNK", id = "139768056738146"},
        {name = "WITHOUT PERMISSION FUNK", id = "92572896648274"},
        {name = "DANCE RAT MONTAGE", id = "98711199754623"},
        {name = "LOVELY FUNK", id = "130633105268814"},
        {name = "STORYMODECOOL", id = "87115976125426"},
        {name = "BLACK COFFEE FUNK", id = "82705137378395"},
        {name = "KOBALT", id = "79381341943021"},
        {name = "bacterial walker", id = "105882833374061"},
        {name = "ANGEL Speed Up", id = "139593870988593"},
        {name = "EPIC FIGHT", id = "73966367524216"},
        {name = "DAMNED", id = "133814632960968"},
        {name = "FROM THE ZONE NTJ VERSION", id = "105770593501071"},
        {name = "HYPNOTIZE", id = "132015050363205"},
        {name = "MIDZUKI speed up", id = "129151948619922"},
        
        {name = "move it funk", id = "114994598691121"},
        {name = "CRYSTAL", id = "103445348511856"},
        {name = "Letero funkphonk", id = "99409598156364"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""}
    }
}, "Option 1")

Tab8:AddButton({
    Name = "Stop",
    Description = "ALL music",
    Callback = function()
        playMusic("")
    end
})
---------------------------------------------------------------------------------------------------------------------------------
                                                   -- === Tab 9: troll === --
-----------------------------------------------------------------------------------------------------------------------------------
-- ...
local DropdownPlayerTab2 = Tab9:AddDropdown({
    Name = "Select Player",
    Description = "Choose a player to kill, pull, view, or fling",
    Default = "",
    Multi = false,
    Options = getPlayerNames(),
    Flag = "player list",
    Callback = function(selectedPlayerName)
-- ...
    end
})

function UpdatePlayers()
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name ~= LocalPlayer.Name then
            table.insert(playerNames, player.Name)
        end
    end
    DropdownPlayerTab2:Set(playerNames)
end

Tab9:AddButton({"Update List", function()
    UpdatePlayers()
end})

UpdatePlayers()


Tab9:AddButton({
    Title = "Teleport to Player",
    Desc = "Click to teleport to the selected player",
    Callback = function()
-- ...
    end
})

local SpectateToggleTab10 = Tab9:AddToggle({
    Name = "View Player",
    Description = "Enables/disables viewing of the selected player",
    Default = false,
    Callback = function(state)
-- ...
    end
})
-- ...
local Section = Tab9:AddSection({"Kill"})

local DropdownKillPullMethod = Tab9:AddDropdown({
    Name = "Select Method (Kill/Pull)",
    Description = "Choose the method to kill or pull",
    Options = {"Sofa", "Bus"},
    Callback = function(value)
        selectedKillPullMethod = value
    end
})
-- ...
Tab9:AddButton({
    Name = "Kill",
    Description = "Starts the kill with the selected method",
    Callback = function()
-- ...
    end
})

Tab9:AddButton({
    Name = "Pull",
    Description = "Starts the pull with the selected method",
    Callback = function()
-- ...
    end
})

Tab9:AddButton({
    Name = "Stop (Kill or Pull)",
    Description = "Stops the kill or pull movement",
    Callback = function()
-- ...
    end
})

local Section = Tab9:AddSection({"flings"})

local DropdownFlingMethod = Tab9:AddDropdown({
    Name = "Select Fling Method",
    Description = "Choose the method to apply fling",
    Options = {"Sofa", "Bus", "Ball", "Ball V2", "Boat", "Truck"},
    Callback = function(value)
        selectedFlingMethod = value
    end
})
-- ...
flingToggle = Tab9:AddToggle({
    Name = "Activate Fling",
    Description = "Activates or deactivates the fling with the selected method",
    Default = false,
    Callback = function(state)
-- ...
    end
})

local Section = Tab9:AddSection({"fling ALL and turn off RGB before using"})
-- ...
-- Function to show notification
local function showNotification(title, description, icon)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = description,
            Icon = icon or "",
            Duration = 5
        })
    end)
end

-- TextBox to exclude player
Tab9:AddTextBox({
    Name = "add player to whitelist",
    Description = "Enter part of the player's name",
    PlaceholderText = "Ex.: pl for (player123)",
    Callback = function(Value)
        if Value == "" then
            showNotification("No Action", "Enter a name to add a player.", nil)
            return
        end

        local player = findPlayerByPartialName(Value)
        if player then
            -- Check if player is already excluded
            for _, excluded in ipairs(excludedPlayers) do
                if excluded == player then
                    showNotification("Player Already Whitelisted", "Player " .. player.Name .. " is already on the whitelist.", getPlayerThumbnail(player.UserId))
                    return
                end
            end
            table.insert(excludedPlayers, player)
            local thumbnail = getPlayerThumbnail(player.UserId)
            showNotification("Player Whitelisted", "Player " .. player.Name .. " has been whitelisted from flings.", thumbnail)
        else
            showNotification("Player Not Found", "No player found with '" .. Value .. "'.", nil)
        end
    end
})

-- Button to check excluded players
Tab9:AddButton({"Check Whitelist", function()
    if #excludedPlayers == 0 then
        showNotification("Whitelist is Empty", "No players are on the whitelist.", nil)
        return
    end
    for i, player in ipairs(excludedPlayers) do
        local thumbnail = getPlayerThumbnail(player.UserId)
        showNotification("Whitelisted Player " .. i, "Player " .. player.Name .. " is on the whitelist.", thumbnail)
        task.wait(0.5) -- Small delay between notifications to avoid overlap
    end
end})

-- Button to remove all excluded players
Tab9:AddButton({"Clear Whitelist", function()
    if #excludedPlayers == 0 then
        showNotification("Nothing to Clear", "No players to remove from the whitelist.", nil)
        return
    end
    excludedPlayers = {}
    showNotification("Whitelist Cleared", "All players have been removed from the whitelist.", nil)
end})

-- Orbiting Ball Fling
Tab9:AddButton({"Orbiting Ball Fling", function()
-- ...
end})

-- Fling Ball ALL V1
Tab9:AddButton({"Fling Ball ALL V1", function()
-- ...
end})

-- Fling Ball ALL V2
Tab9:AddButton({"Fling Ball ALL V2", function()
-- ...
end})

-- Stop All
Tab9:AddButton({"Stop All", function()
-- ...
    showNotification("All Stopped", "All functions have been deactivated.", nil)
end})
---------------------------------------------------------------------------------------------------------------------------------
                                                   -- === Tab 10: lag server === --
---------------------------------------------------------------------------------------------------------------------------------





----------------------------------------------------------------------------------------------------------------------------------------------
                                               -- === Tab 11: Scripts === --
----------------------------------------------------------------------------------------------------------------------------------------------

Tab11:AddButton({
    Name = "FE Jerk Off Hub Matrix",
    Description = "Universal",
    Callback = function()
-- ...
    end
})

Tab11:AddButton({
    Name = "FE HUGG",
    Description = "Universal",
    Callback = function()
-- ...
    end
})



Tab11:AddButton({
    Name = "Black Hole",
    Description = "Universal",
    Callback = function()
-- ...
    end
})

local Section = Tab11:AddSection({"this system broochk and voidProtection"})

Tab11:AddButton({
    Name = "System Broochk",
    Description = "Universal",
    Callback = function()
-- ...
    end
})

Tab11:AddButton({
    Name = "Roships",
    Description = "Universal",
    Callback = function()
-- ...
    end
})

Tab11:AddButton({
    Name = "Sander X",
    Description = "Only for Brookhaven",
    Callback = function()
-- ...
    end
})

Tab11:AddButton({
    Name = "Reverse",
    Description = "Universal",
    Callback = function()
-- ...
    end
})

Tab11:AddButton({
    Name = "RD4",
    Description = "Only for Brookhaven",
    Callback = function()
-- ...
    end
})



-----------------------------------------------------------------------------------------------------------------------------------------
                                          -- === Tab 13: Admin Panel === --
-----------------------------------------------------------------------------------------------------------------------------------------




-- Tab13: Admin Panel

Tab4:AddParagraph({
    Title = "Admin Panel",
    Content = "The panel will be added shortly, please wait..."
})
