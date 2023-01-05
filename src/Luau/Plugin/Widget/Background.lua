local function create(widget)
    local frame = Instance.new("Frame")
    frame.Name = "Background"
    frame.BackgroundTransparency = 1.000
    frame.Size = UDim2.new(1, 0, 1, 0)

    -- local gradient = Instance.new("UIGradient")
    -- gradient.Color = ColorSequence.new{
    --     ColorSequenceKeypoint.new(0.00, Color3.fromRGB(84, 0, 117)),
    --     ColorSequenceKeypoint.new(0.80, Color3.fromRGB(36, 36, 36)),
    --     ColorSequenceKeypoint.new(1.00, Color3.fromRGB(36, 36, 36))
    -- }
    -- gradient.Rotation = 90
    -- gradient.Parent = frame

    frame.Parent = widget
end

return create