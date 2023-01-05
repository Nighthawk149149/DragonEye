local function create(widget)
    local DragonEyeLabel = Instance.new("TextLabel")
    DragonEyeLabel.Name = "DragonEyeLabel"
    DragonEyeLabel.Text = "Dragon Eye"
    DragonEyeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    DragonEyeLabel.TextSize = 20.000
    DragonEyeLabel.BackgroundTransparency = 1.000
    DragonEyeLabel.AnchorPoint = Vector2.new(0.5, 0)
    DragonEyeLabel.Size = UDim2.new(1, 0, 0.1, 0)
    DragonEyeLabel.Position = UDim2.new(0.5, 0, 0, 0)
    DragonEyeLabel.Parent = widget
end

return create