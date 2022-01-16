// ---@diagnostic disable-next-line: deprecated
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/joeengo/exploiting/main/EngoUILIB_V2.lua"))()
local main = library:CreateMain("Title", "Description", Enum.KeyCode.RightAlt)
local combatTab = main:CreateTab("Combat")
local lplr = game.Players.LocalPlayer

local killAura = combatTab:CreateToggle("Kill Aura", function() 
    game:GetService("RunService").Heartbeat:Connect(function()
        for _,v in next, game.Players:GetPlayers() do
            if v ~= lplr and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Health > 0 and (v.Character.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 10 then
                game:GetService("ReplicatedStorage"):FindFirstChild("events-shared/events@GlobalEvents").PlayerMelee:FireServer(v)
            end
        end
    end)
end)

local autoFarm = combatTab:CreateToggle("Auto Farm", function() 
   if(!killAura) then
      killAura:Toggle()
   end
end)


main:CreateSettings()
