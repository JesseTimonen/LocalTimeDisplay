-- Save settings --
function saveSettings()
    Turbine.PluginData.Save(Turbine.DataScope.Server, settingsFileName, settings);
end


-- Save local time window position --
function saveLocalTimePosition()
    if (localTimeWindow.positionHasBeenModified) then
        localTimeWindowPosition["xPos"] = tostring(localTimeWindow:GetLeft());
        localTimeWindowPosition["yPos"] = tostring(localTimeWindow:GetTop());
        Turbine.PluginData.Save(Turbine.DataScope.Server, localTimePositionFileName, localTimeWindowPosition);
    end
end


-- Save server time window position --
function saveServerTimePosition()
    if (serverTimeWindow.positionHasBeenModified) then
        serverTimeWindowPosition["xPos"] = tostring(serverTimeWindow:GetLeft());
        serverTimeWindowPosition["yPos"] = tostring(serverTimeWindow:GetTop());
        Turbine.PluginData.Save(Turbine.DataScope.Server, serverTimePositionFileName, serverTimeWindowPosition);
    end
end


-- Load settings --
function loadSettings()
    local _settings = Turbine.PluginData.Load(Turbine.DataScope.Server, settingsFileName);
    if _settings ~= nil then settings = _settings; end

    -- Make sure settings are not invalid --
    if (type(settings["enableLocalTime"]) ~= "boolean") then settings["enableLocalTime"] = true; end
    if (type(settings["displayLocalTimeTitle"]) ~= "boolean") then settings["displayLocalTimeTitle"] = true; end
    if (settings["localTimeTitle"] == nil) then settings["localTimeTitle"] = "Local Time"; end
    if (settings["localTimeFormat"] ~= "am/pm" and settings["localTimeFormat"] ~= "24 hour") then settings["localTimeFormat"] = "24 hour"; end
    if (settings["localTimeFontSize"] == nil) then settings["localTimeFontSize"] = "16"; end
    if (settings["localTimeColor"] == nil) then settings["localTimeColor"] = "grey"; end
    if (type(settings["localTimeLocked"]) ~= "boolean") then settings["localTimeLocked"] = false; end
    if (type(settings["enableServerTime"]) ~= "boolean") then settings["enableServerTime"] = false; end
    if (type(settings["displayServerTimeTitle"]) ~= "boolean") then settings["displayServerTimeTitle"] = false; end
    if (settings["serverTimeTitle"] == nil) then settings["serverTimeTitle"] = "Server Time"; end
    if (settings["serverTimeFormat"] ~= "am/pm" and settings["serverTimeFormat"] ~= "24 hour") then settings["serverTimeFormat"] = "24 hour"; end
    if (settings["serverTimeFontSize"] == nil) then settings["serverTimeFontSize"] = "16"; end
    if (settings["serverTimeColor"] == nil) then settings["serverTimeColor"] = "grey"; end
    if (type(settings["serverTimeLocked"]) ~= "boolean") then settings["serverTimeLocked"] = false; end
end


-- Load local time window position --
function loadLocalTimePosition()
    local _windowPosition = Turbine.PluginData.Load(Turbine.DataScope.Server, localTimePositionFileName);
    if _windowPosition ~= nil then localTimeWindowPosition = _windowPosition; end

    localTimeWindowPosition["xPos"] = tonumber(localTimeWindowPosition["xPos"]);
    localTimeWindowPosition["yPos"] = tonumber(localTimeWindowPosition["yPos"]);

    if (localTimeWindowPosition["xPos"] == nil or localTimeWindowPosition["yPos"] == nil) then
        localTimeWindowPosition["xPos"] = (screenWidth / 2) - 50;
        localTimeWindowPosition["yPos"] = screenHeight / 2;
        return;
    end
end


-- Load server time window position --
function loadServerTimePosition()
    local _windowPosition = Turbine.PluginData.Load(Turbine.DataScope.Server, serverTimePositionFileName);
    if _windowPosition ~= nil then serverTimeWindowPosition = _windowPosition; end

    serverTimeWindowPosition["xPos"] = tonumber(serverTimeWindowPosition["xPos"]);
    serverTimeWindowPosition["yPos"] = tonumber(serverTimeWindowPosition["yPos"]);

    if (serverTimeWindowPosition["xPos"] == nil or serverTimeWindowPosition["yPos"] == nil) then
        serverTimeWindowPosition["xPos"] = (screenWidth / 2) + 50;
        serverTimeWindowPosition["yPos"] = screenHeight / 2;
        return;
    end
end