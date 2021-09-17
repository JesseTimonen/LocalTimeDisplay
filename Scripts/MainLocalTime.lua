-- Local time window --
localTimeWindow = Turbine.UI.Window();
localTimeWindow:SetPosition(localTimeWindowPosition["xPos"], localTimeWindowPosition["yPos"]);
localTimeWindow:SetSize(150, 40);
localTimeWindow:SetBackColor(Turbine.UI.Color(0, 0, 0, 0));
localTimeWindow:SetZOrder(0);
localTimeWindow:SetVisible(settings["enableLocalTime"]);
localTimeWindow:SetWantsKeyEvents(settings["enableLocalTime"]);
function localTimeWindow:KeyDown(args)
    -- Toggle visibility when HUD is toggled --
    if (args.Action == 268435635) then
        localTimeWindow:SetVisible(not localTimeWindow:IsVisible());
    end
end


-- Local time title --
localTimeTitle = Turbine.UI.Label();
localTimeTitle:SetParent(localTimeWindow);
localTimeTitle:SetPosition(0, 0);
localTimeTitle:SetSize(150, 20);
localTimeTitle:SetMultiline(false);
localTimeTitle:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
localTimeTitle:SetFontStyle(Turbine.UI.FontStyle.Outline);
localTimeTitle:SetOutlineColor(Turbine.UI.Color(1, 0, 0, 0));
localTimeTitle:SetText(settings["localTimeTitle"]);
localTimeTitle:SetVisible(settings["displayLocalTimeTitle"]);


-- Local time label --
localTimeLabel = Turbine.UI.Label();
localTimeLabel:SetParent(localTimeWindow);
localTimeLabel:SetPosition(0, 20);
localTimeLabel:SetSize(150, 20);
localTimeLabel:SetMultiline(false);
localTimeLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
localTimeLabel:SetFontStyle(Turbine.UI.FontStyle.Outline);
localTimeLabel:SetOutlineColor(Turbine.UI.Color(1, 0, 0, 0));
localTimeLabel:SetWantsUpdates(true);
localTimeLabel.updatelimiter = 9999;
localTimeLabel.Update = function()

    -- Limit the amount of calculations we are doing --
    localTimeLabel.updatelimiter = localTimeLabel.updatelimiter + 1;
    if (localTimeLabel.updatelimiter < 500) then return; end
    localTimeLabel.updatelimiter = 0;

    local localTime = Turbine.Engine.GetDate();
    local hours = localTime["Hour"];
    local minutes = localTime["Minute"];
    local prefix = "";

    if (settings["localTimeFormat"] == "am/pm") then

        if (hours < 12) then
            prefix = " AM";
        else
            prefix = " PM";
        end

        if (hours == 0) then
            hours = hours + 12;
        elseif (hours >= 13) then
            hours = hours - 12;
        end
    end

    if (minutes < 10) then
        minutes = "0" .. minutes;
    end

    if (hours < 10 and settings["localTimeFormat"] == "24 hour") then
        hours = "0" .. hours;
    end

    localTimeLabel:SetText(hours .. ":" .. minutes .. prefix);
end

localTimeLabel.MouseDown = function(sender, args)
    localTimeWindow.mouseDown_MousePosition = {Turbine.UI.Display.GetMousePosition();}
    localTimeWindow.mouseDown_WindowPosition = {localTimeWindow:GetPosition();}
    localTimeWindow.isMouseDown = true;
end

localTimeLabel.MouseUp = function(sender, args)
    localTimeWindow.isMouseDown = false;
end

localTimeLabel.MouseMove = function(sender, args)
    if (localTimeWindow.isMouseDown and not settings["localTimeLocked"]) then
        localTimeWindow.positionHasBeenModified = true;
        local mouseDownX, mouseDownY = unpack(localTimeWindow.mouseDown_MousePosition);
        local mouseCurrentX, mouseCurrentY = Turbine.UI.Display.GetMousePosition();
        local windowLeft, windowTop = unpack(localTimeWindow.mouseDown_WindowPosition);
        local displayWidth, displayHeight = Turbine.UI.Display:GetSize();

        if (mouseCurrentX > displayWidth) then mouseCurrentX = displayWidth; end
        if (mouseCurrentY > displayHeight) then mouseCurrentY = displayHeight; end          

        local deltaX = mouseCurrentX - mouseDownX;
        local deltaY = mouseCurrentY - mouseDownY;

        localTimeWindow:SetPosition(windowLeft + deltaX, windowTop + deltaY);
    end
end

localTimeTitle.MouseDown = function(sender, args)
    localTimeWindow.mouseDown_MousePosition = {Turbine.UI.Display.GetMousePosition();}
    localTimeWindow.mouseDown_WindowPosition = {localTimeWindow:GetPosition();}
    localTimeWindow.isMouseDown = true;
end

localTimeTitle.MouseUp = function(sender, args)
    localTimeWindow.isMouseDown = false;
end

localTimeTitle.MouseMove = function(sender, args)
    if (localTimeWindow.isMouseDown and not settings["localTimeLocked"]) then
        localTimeWindow.positionHasBeenModified = true;
        local mouseDownX, mouseDownY = unpack(localTimeWindow.mouseDown_MousePosition);
        local mouseCurrentX, mouseCurrentY = Turbine.UI.Display.GetMousePosition();
        local windowLeft, windowTop = unpack(localTimeWindow.mouseDown_WindowPosition);
        local displayWidth, displayHeight = Turbine.UI.Display:GetSize();

        if (mouseCurrentX > displayWidth) then mouseCurrentX = displayWidth; end
        if (mouseCurrentY > displayHeight) then mouseCurrentY = displayHeight; end          

        local deltaX = mouseCurrentX - mouseDownX;
        local deltaY = mouseCurrentY - mouseDownY;

        localTimeWindow:SetPosition(windowLeft + deltaX, windowTop + deltaY);
    end
end



function updateLocalTimeUI()

    -- Update window visibility --
    localTimeWindow:SetVisible(settings["enableLocalTime"]);
    localTimeWindow:SetWantsKeyEvents(settings["enableLocalTime"]);
    localTimeTitle:SetVisible(settings["displayLocalTimeTitle"]);
    localTimeTitle:SetText(settings["localTimeTitle"]);

    -- Set font type for local time --
    if (settings["localTimeFontSize"] == "10") then localTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana10); localTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana10);
    elseif (settings["localTimeFontSize"] == "12") then localTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana12); localTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana12);
    elseif (settings["localTimeFontSize"] == "14") then localTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana14); localTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana14);
    elseif (settings["localTimeFontSize"] == "16") then localTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16); localTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana16);
    elseif (settings["localTimeFontSize"] == "18") then localTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana18); localTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana18);
    elseif (settings["localTimeFontSize"] == "20") then localTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana20); localTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana20);
    elseif (settings["localTimeFontSize"] == "22") then localTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana22); localTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana22);
    elseif (settings["localTimeFontSize"] == "23") then localTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana23); localTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana23);
    else localTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16); localTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana16);
    end

    -- Set font color for local time --
    if (color[settings["localTimeColor"]] ~= nil) then
        localTimeLabel:SetForeColor(color[string.lower(settings["localTimeColor"])]);
        localTimeTitle:SetForeColor(color[string.lower(settings["localTimeColor"])]);
    else
        localTimeLabel:SetForeColor(color["grey"]);
        localTimeTitle:SetForeColor(color["grey"]);
    end
end

updateLocalTimeUI();