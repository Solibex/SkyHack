---@diagnostic disable: deprecated

if not(_G.SkyHackLoaded) then
   loadstring("https://raw.githubusercontent.com//Oskar2601/SkyHack/.SkywarsHack.lua", true)()
   _G.SkyHackLoaded = true
end

game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
   if State == Enum.TeleportState.Started then
      _G.SkyHackLoaded = false
       syn.queue_on_teleport("https://raw.githubusercontent.com//Oskar2601/SkyHack/.MainScript.lua")
   end
end)