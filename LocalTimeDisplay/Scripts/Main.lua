-- Main window --
mainWindow = Turbine.UI.Window();
mainWindow:SetPosition(windowPosition["xPos"], windowPosition["yPos"]);
mainWindow:SetSize(92, 20);
mainWindow:SetBackColor(Turbine.UI.Color(0, 0, 0, 0));
mainWindow:SetVisible(true);
mainWindow:SetWantsKeyEvents(true)
function mainWindow:KeyDown(args)
    -- Toggle visibility when HUD is toggled --
    if (args.Action == 268435635) then
        mainWindow:SetVisible(not mainWindow:IsVisible());
    end
end


-- First time notification --
if (settings["firstTime"]) then
    mainWindow:SetSize(230, 55);
    mainWindow:SetBackColor(Turbine.UI.Color(0.8, 0, 0, 0));
    firstTime_label = Turbine.UI.Label();
    firstTime_label:SetParent(mainWindow);
    firstTime_label:SetSize(228, 35);
    firstTime_label:SetPosition(2, 30);
    firstTime_label:SetText("Please go to the plugin options\nto setup your local time.");
end


-- Time label --
time_label = Turbine.UI.Label();
time_label:SetParent(mainWindow);
time_label:SetPosition(0, 0);
time_label:SetSize(92, 20);
time_label:SetFontStyle(Turbine.UI.FontStyle.Outline);
time_label:SetOutlineColor(Turbine.UI.Color(1, 0, 0, 0));
time_label:SetWantsUpdates(true);
time_label.updatelimiter = 500;
time_label.Update = function()

    -- Limit the amount of calculations we are doing --
    time_label.updatelimiter = time_label.updatelimiter + 1;
    if (time_label.updatelimiter < 500) then return; end
    time_label.updatelimiter = 0;

    -- Calculate local time --
    local timeDifference = math.floor(Turbine.Engine.GetGameTime()) - calibrationTime;
    timeDifference = timeDifference % 86400;

    local hours = math.floor(timeDifference / 3600);
    local minutes = math.floor((timeDifference % 3600) / 60);
    local prefix = "";

    if (settings["timeFormat"] == "am/pm") then

        if (hours < 12) then
            prefix = " AM";
        else
            prefix = " PM";
        end

        if (hours == 0) then
            hours = hours + 12;
        end

        if (hours >= 13) then
            hours = hours - 12;
        end
    end

    if (minutes < 10) then
        minutes = "0" .. minutes;
    end

    if (hours < 10 and settings["timeFormat"] == "24 hour") then
        hours = "0" .. hours;
    end

    time_label:SetText(hours .. ":" .. minutes .. prefix);
end

time_label.MouseDown = function(sender, args)
    mainWindow.mouseDown_MousePosition = {Turbine.UI.Display.GetMousePosition();}
    mainWindow.mouseDown_WindowPosition = {mainWindow:GetPosition();}
    mainWindow.isMouseDown = true;
end

time_label.MouseUp = function(sender, args)
    mainWindow.isMouseDown = false;
end

time_label.MouseMove = function(sender, args)
    if (mainWindow.isMouseDown and not settings["lockWindow"]) then
        mainWindow.positionHasBeenModified = true;
        local mouseDownX, mouseDownY = unpack(mainWindow.mouseDown_MousePosition);
        local mouseCurrentX, mouseCurrentY = Turbine.UI.Display.GetMousePosition();
        local windowLeft, windowTop = unpack(mainWindow.mouseDown_WindowPosition);
        local displayWidth, displayHeight = Turbine.UI.Display:GetSize();

        if (mouseCurrentX > displayWidth) then mouseCurrentX = displayWidth; end
        if (mouseCurrentY > displayHeight) then mouseCurrentY = displayHeight; end          

        local deltaX = mouseCurrentX - mouseDownX;
        local deltaY = mouseCurrentY - mouseDownY;

        mainWindow:SetPosition(windowLeft + deltaX, windowTop + deltaY);
    end
end


function updateFontStyles()
    -- Set font type for time label --
    if (settings["fontSize"] == "10") then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana10);
    elseif (settings["fontSize"] == "12") then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana12);
    elseif (settings["fontSize"] == "14") then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana14);
    elseif (settings["fontSize"] == "16") then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana16);
    elseif (settings["fontSize"] == "18") then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana18);
    elseif (settings["fontSize"] == "20") then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana20);
    elseif (settings["fontSize"] == "22") then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana22);
    elseif (settings["fontSize"] == "23") then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana23);
    else time_label:SetFont(Turbine.UI.Lotro.Font.Verdana16);
    end

    -- Set font color for time label --
    if (color[settings["fontColor"]] ~= nil) then
        time_label:SetForeColor(color[string.lower(settings["fontColor"])]);
    else
        time_label:SetForeColor(color["gray"]);
    end
end

updateFontStyles();