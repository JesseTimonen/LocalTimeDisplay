-- Server time window --
serverTimeWindow = Turbine.UI.Window();
serverTimeWindow:SetPosition(serverTimeWindowPosition["xPos"], serverTimeWindowPosition["yPos"]);
serverTimeWindow:SetSize(150, 40);
serverTimeWindow:SetBackColor(Turbine.UI.Color(0, 0, 0, 0));
serverTimeWindow:SetZOrder(0);
serverTimeWindow:SetVisible(settings["enableServerTime"]);
serverTimeWindow:SetWantsKeyEvents(settings["enableServerTime"]);
function serverTimeWindow:KeyDown(args)
    -- Toggle visibility when HUD is toggled --
    if (args.Action == 268435635) then
        serverTimeWindow:SetVisible(not serverTimeWindow:IsVisible());
    end
end


-- Server time title --
serverTimeTitle = Turbine.UI.Label();
serverTimeTitle:SetParent(serverTimeWindow);
serverTimeTitle:SetPosition(0, 0);
serverTimeTitle:SetSize(150, 20);
serverTimeTitle:SetMultiline(false);
serverTimeTitle:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
serverTimeTitle:SetFontStyle(Turbine.UI.FontStyle.Outline);
serverTimeTitle:SetOutlineColor(Turbine.UI.Color(1, 0, 0, 0));
serverTimeTitle:SetText(settings["serverTimeTitle"]);
serverTimeTitle:SetVisible(settings["displayServerTimeTitle"]);


-- Server time label --
serverTimeLabel = Turbine.UI.Label();
serverTimeLabel:SetParent(serverTimeWindow);
serverTimeLabel:SetPosition(0, 20);
serverTimeLabel:SetSize(150, 20);
serverTimeLabel:SetMultiline(false);
serverTimeLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
serverTimeLabel:SetFontStyle(Turbine.UI.FontStyle.Outline);
serverTimeLabel:SetOutlineColor(Turbine.UI.Color(1, 0, 0, 0));
serverTimeLabel:SetWantsUpdates(true);
serverTimeLabel.updatelimiter = 9999;
serverTimeLabel.Update = function()

    -- Limit the amount of calculations we are doing --
    serverTimeLabel.updatelimiter = serverTimeLabel.updatelimiter + 1;
    if (serverTimeLabel.updatelimiter < 500) then return; end
    serverTimeLabel.updatelimiter = 0;

    -- Turbine.Engine.GetLocalTime() returns seconds passed since 1.1.1970 in GMT timezone --
    local serverTime = Turbine.Engine.GetLocalTime();

    -- Convert GMT to server's timezone (GMT-4) and parse the time of day --
    serverTime = (serverTime - (3600 * 4)) % 86400;

    local hours = math.floor(serverTime / 3600);
    local minutes = math.floor((serverTime % 3600) / 60);
    local prefix = "";

    if (settings["serverTimeFormat"] == "am/pm") then

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

    if (hours < 10 and settings["serverTimeFormat"] == "24 hour") then
        hours = "0" .. hours;
    end

    serverTimeLabel:SetText(hours .. ":" .. minutes .. prefix);
end

serverTimeLabel.MouseDown = function(sender, args)
    serverTimeWindow.mouseDown_MousePosition = {Turbine.UI.Display.GetMousePosition();}
    serverTimeWindow.mouseDown_WindowPosition = {serverTimeWindow:GetPosition();}
    serverTimeWindow.isMouseDown = true;
end

serverTimeLabel.MouseUp = function(sender, args)
    serverTimeWindow.isMouseDown = false;
end

serverTimeLabel.MouseMove = function(sender, args)
    if (serverTimeWindow.isMouseDown and not settings["serverTimeLocked"]) then
        serverTimeWindow.positionHasBeenModified = true;
        local mouseDownX, mouseDownY = unpack(serverTimeWindow.mouseDown_MousePosition);
        local mouseCurrentX, mouseCurrentY = Turbine.UI.Display.GetMousePosition();
        local windowLeft, windowTop = unpack(serverTimeWindow.mouseDown_WindowPosition);
        local displayWidth, displayHeight = Turbine.UI.Display:GetSize();

        if (mouseCurrentX > displayWidth) then mouseCurrentX = displayWidth; end
        if (mouseCurrentY > displayHeight) then mouseCurrentY = displayHeight; end          

        local deltaX = mouseCurrentX - mouseDownX;
        local deltaY = mouseCurrentY - mouseDownY;

        serverTimeWindow:SetPosition(windowLeft + deltaX, windowTop + deltaY);
    end
end

serverTimeTitle.MouseDown = function(sender, args)
    serverTimeWindow.mouseDown_MousePosition = {Turbine.UI.Display.GetMousePosition();}
    serverTimeWindow.mouseDown_WindowPosition = {serverTimeWindow:GetPosition();}
    serverTimeWindow.isMouseDown = true;
end

serverTimeTitle.MouseUp = function(sender, args)
    serverTimeWindow.isMouseDown = false;
end

serverTimeTitle.MouseMove = function(sender, args)
    if (serverTimeWindow.isMouseDown and not settings["serverTimeLocked"]) then
        serverTimeWindow.positionHasBeenModified = true;
        local mouseDownX, mouseDownY = unpack(serverTimeWindow.mouseDown_MousePosition);
        local mouseCurrentX, mouseCurrentY = Turbine.UI.Display.GetMousePosition();
        local windowLeft, windowTop = unpack(serverTimeWindow.mouseDown_WindowPosition);
        local displayWidth, displayHeight = Turbine.UI.Display:GetSize();

        if (mouseCurrentX > displayWidth) then mouseCurrentX = displayWidth; end
        if (mouseCurrentY > displayHeight) then mouseCurrentY = displayHeight; end          

        local deltaX = mouseCurrentX - mouseDownX;
        local deltaY = mouseCurrentY - mouseDownY;

        serverTimeWindow:SetPosition(windowLeft + deltaX, windowTop + deltaY);
    end
end



function updateServerTimeUI()

    -- Update window visibility --
    serverTimeWindow:SetVisible(settings["enableServerTime"]);
    serverTimeWindow:SetWantsKeyEvents(settings["enableServerTime"]);
    serverTimeTitle:SetVisible(settings["displayServerTimeTitle"]);
    serverTimeTitle:SetText(settings["serverTimeTitle"]);

    -- Set font size for server time --
    if (settings["serverTimeFontSize"] == "10") then serverTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana10); serverTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana10);
    elseif (settings["serverTimeFontSize"] == "12") then serverTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana12); serverTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana12);
    elseif (settings["serverTimeFontSize"] == "14") then serverTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana14); serverTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana14);
    elseif (settings["serverTimeFontSize"] == "16") then serverTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16); serverTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana16);
    elseif (settings["serverTimeFontSize"] == "18") then serverTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana18); serverTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana18);
    elseif (settings["serverTimeFontSize"] == "20") then serverTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana20); serverTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana20);
    elseif (settings["serverTimeFontSize"] == "22") then serverTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana22); serverTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana22);
    elseif (settings["serverTimeFontSize"] == "23") then serverTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana23); serverTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana23);
    else serverTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16); serverTimeTitle:SetFont(Turbine.UI.Lotro.Font.Verdana16);
    end

    -- Set font color for server time --
    if (color[settings["serverTimeColor"]] ~= nil) then
        serverTimeLabel:SetForeColor(color[string.lower(settings["serverTimeColor"])]);
        serverTimeTitle:SetForeColor(color[string.lower(settings["serverTimeColor"])]);
    else
        serverTimeLabel:SetForeColor(color["grey"]);
        serverTimeTitle:SetForeColor(color["grey"]);
    end
end

updateServerTimeUI();