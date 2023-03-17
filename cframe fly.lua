local Players = game.Players
local RunService = game.RunService
local UserInputService = game.UserInputService

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Humanoid = Character:FindFirstChildOfClass("Humanoid")
local Root = Character.HumanoidRootPart
local Camera = workspace.Camera

Character.Animate.Disabled = true
for _,v in next, Humanoid:GetPlayingAnimationTracks() do
    v:Stop()
end
Humanoid:ChangeState(8)
Humanoid.StateChanged:Connect(function()
    Humanoid:ChangeState(8)
    Humanoid.PlatformStand = false
end)

local Offset = CFrame.new(0,0,0)
UserInputService.InputBegan:Connect(function(Input, GPE)
    if GPE then return end
    if Input.KeyCode == Enum.KeyCode.W then Offset *= CFrame.new(0,0,-0.1) end
    if Input.KeyCode == Enum.KeyCode.A then Offset *= CFrame.new(-0.1,0,0) end
    if Input.KeyCode == Enum.KeyCode.S then Offset *= CFrame.new(0,0,0.1) end
    if Input.KeyCode == Enum.KeyCode.D then Offset *= CFrame.new(0.1,0,0) end
    if Input.KeyCode == Enum.KeyCode.Q then Offset *= CFrame.new(0,-0.1,0) end
    if Input.KeyCode == Enum.KeyCode.E then Offset *= CFrame.new(0,0.1,0) end
end)

UserInputService.InputEnded:Connect(function(Input, GPE)
    if GPE then return end
    if Input.KeyCode == Enum.KeyCode.W then Offset *= CFrame.new(0,0,0.1) end
    if Input.KeyCode == Enum.KeyCode.A then Offset *= CFrame.new(0.1,0,0) end
    if Input.KeyCode == Enum.KeyCode.S then  Offset *= CFrame.new(0,0,-0.1) end
    if Input.KeyCode == Enum.KeyCode.D then Offset *= CFrame.new(-0.1,0,0) end
    if Input.KeyCode == Enum.KeyCode.Q then Offset *= CFrame.new(0,0.1,0) end
    if Input.KeyCode == Enum.KeyCode.E then Offset *= CFrame.new(0,-0.1,0) end
end)

local Target = Root.CFrame
RunService.Heartbeat:Connect(function()
    Root.CFrame = CFrame.new((Target * Offset).Position, Camera.CFrame.Position + Camera.CFrame.LookVector * 50)
    Target = Root.CFrame
end)
