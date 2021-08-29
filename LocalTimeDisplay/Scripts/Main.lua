-- Main window --
mainWindow = Turbine.UI.Window();
mainWindow:SetPosition(settings["windowPosition"]["xPos"], settings["windowPosition"]["yPos"]);
mainWindow:SetSize(90, 30);
mainWindow:SetBackColor(Turbine.UI.Color(0, 0, 0, 0));
mainWindow:SetVisible(true);

if (settings["firstTime"]) then
    mainWindow:SetSize(205, 62);
    mainWindow:SetBackColor(Turbine.UI.Color(0.8, 0, 0, 0));
    firstTime_label = Turbine.UI.Label();
    firstTime_label:SetParent(mainWindow);
    firstTime_label:SetSize(200, 35);
    firstTime_label:SetPosition(2, 30);
    firstTime_label:SetText("Time calibration needed!\nPlease go to plugin options.");
end

-- Time label --
time_label = Turbine.UI.Label();
time_label:SetParent(mainWindow);
time_label:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft);

if (settings["fontSize"] == 10) then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana10);
elseif (settings["fontSize"] == 12) then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana12);
elseif (settings["fontSize"] == 14) then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana14);
elseif (settings["fontSize"] == 18) then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana18);
elseif (settings["fontSize"] == 20) then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana20);
elseif (settings["fontSize"] == 22) then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana22);
else time_label:SetFont(Turbine.UI.Lotro.Font.Verdana16);
end

if (color[settings["fontColor"]] ~= nil) then
    time_label:SetForeColor(color[string.lower(settings["fontColor"])]);
else
    time_label:SetForeColor(color[settings["white"]]);
end

time_label:SetOutlineColor(Turbine.UI.Color(1, 0, 0, 0));
time_label:SetSize(90, 30);
time_label:SetPosition(0, 0);
time_label:SetWantsUpdates(true);
time_label.updatelimiter = 500;
time_label.Update = function()
    time_label.updatelimiter = time_label.updatelimiter + 1;
    if (time_label.updatelimiter > 500) then
        time_label.updatelimiter = 0;

        local timeDifference = math.floor(Turbine.Engine.GetGameTime()) - calibrationTime;
        timeDifference = timeDifference % 86400;

        local hours = math.floor(timeDifference / 3600);
        local minutes = math.floor((timeDifference % 3600) / 60);
        local prefix = "";

        if (settings["timeFormat"] == "am/pm format") then

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

        if (hours < 10 and settings["timeFormat"] == "24 hour format") then
            hours = "0" .. hours;
        end

        time_label:SetText(hours .. ":" .. minutes .. prefix);
    end
end

time_label.MouseDown = function(sender, args)
    mainWindow.mouseDown_MousePosition = { Turbine.UI.Display.GetMousePosition(); }
    mainWindow.mouseDown_WindowPosition = { mainWindow:GetPosition(); }
    mainWindow.isMouseDown = true;

    local relativeMouseX, relativeMouseY = mainWindow:GetMousePosition();
end

time_label.MouseUp = function(sender, args)
    mainWindow.isMouseDown = false;
end

time_label.MouseMove = function(sender, args)
    if (mainWindow.isMouseDown and not settings["lockWindow"]) then
        local mouseDownX, mouseDownY = unpack(mainWindow.mouseDown_MousePosition);
        local mouseCurrentX, mouseCurrentY = Turbine.UI.Display.GetMousePosition();
        local windowLeft, windowTop = unpack(mainWindow.mouseDown_WindowPosition);

        local displayWidth, displayHeight = Turbine.UI.Display:GetSize();
        if (mouseCurrentX > displayWidth) then mouseCurrentX = displayWidth; end
        if (mouseCurrentY > displayHeight) then mouseCurrentY = displayHeight; end          

        -- calculate how much the cursor has moved --
        local deltaX = mouseCurrentX - mouseDownX;
        local deltaY = mouseCurrentY - mouseDownY;

        -- move the window the same distance that the mouse has moved --
        mainWindow:SetPosition(windowLeft + deltaX, windowTop + deltaY);
    end
end



function updateUI()
    -- Update font size --
    if (settings["fontSize"] == 10) then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana10);
    elseif (settings["fontSize"] == 12) then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana12);
    elseif (settings["fontSize"] == 14) then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana14);
    elseif (settings["fontSize"] == 18) then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana18);
    elseif (settings["fontSize"] == 20) then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana20);
    elseif (settings["fontSize"] == 22) then time_label:SetFont(Turbine.UI.Lotro.Font.Verdana22);
    else time_label:SetFont(Turbine.UI.Lotro.Font.Verdana16);
    end

    -- Update font color --
    if (color[settings["fontColor"]] ~= nil) then
        time_label:SetForeColor(color[string.lower(settings["fontColor"])]);
    else
        time_label:SetForeColor(color[settings["white"]]);
    end
end