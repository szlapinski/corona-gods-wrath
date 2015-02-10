application = 
{
    --showRuntimeErrors = true,
    content = 
    { 
        width = 640,
        height = 1136,
        scale = "letterbox",-- "zoomEven", "adaptive", "zoomStretch"
        --xAlign = "center",
        --yAlign = "center",
        imageSuffix =
        {
            ["@2x"] = 1.5
            --high-resolution devices (Retina iPad, Kindle Fire HD 9", Nexus 10, etc.) will use @2x-suffixed images
            --devices less than 1200 pixels in width (iPhone 5, iPad 2, Kindle Fire 7", etc.) will use non-suffixed images
        },
        --fps = 30,
    }
}