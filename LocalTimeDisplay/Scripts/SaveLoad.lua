-- Save settings --
function saveSettings()
    Turbine.PluginData.Save(Turbine.DataScope.Server, settingsFileName, settings);
end


-- Save window position --
function savePosition()
    if (mainWindow.positionHasBeenModified) then
        windowPosition["xPos"] = tostring(mainWindow:GetLeft());
        windowPosition["yPos"] = tostring(mainWindow:GetTop());
        Turbine.PluginData.Save(Turbine.DataScope.Server, positionFileName, windowPosition);
    end
end


-- Save Calibration --
function saveCalibration()
    Turbine.PluginData.Save(Turbine.DataScope.Server, calibrationFileName, tostring(calibrationTime));
end


-- Load settings --
function loadSettings()
    local _settings = Turbine.PluginData.Load(Turbine.DataScope.Server, settingsFileName);
    if _settings ~= nil then settings = _settings; end

    -- Make sure settings are not invalid --
    if (settings["timeFormat"] ~= "am/pm" and settings["timeFormat"] ~= "24 hour") then settings["timeFormat"] = "24 hour"; end
    if (settings["fontSize"] == nil) then settings["fontSize"] = "16"; end
    if (settings["fontColor"] == nil) then settings["fontColor"] = "gray"; end
    if (settings["lockWindow"] ~= true and settings["lockWindow"] ~= false) then settings["lockWindow"] = false; end
    if (settings["firstTime"] ~= true and settings["firstTime"] ~= false) then settings["firstTime"] = true; end
end


-- Load window position --
function loadPosition()
    local _windowPosition = Turbine.PluginData.Load(Turbine.DataScope.Server, positionFileName);
    if _windowPosition ~= nil then windowPosition = _windowPosition; end

    windowPosition["xPos"] = tonumber(windowPosition["xPos"]);
    windowPosition["yPos"] = tonumber(windowPosition["yPos"]);

    if (windowPosition["xPos"] == nil or windowPosition["yPos"] == nil) then
        windowPosition["xPos"] = screenWidth / 2;
        windowPosition["yPos"] = screenHeight / 2;
        return;
    end

    if (windowPosition["xPos"] < 0) then
        windowPosition["xPos"] = 0;
    end

    if (windowPosition["xPos"] > screenWidth - 25) then
        windowPosition["xPos"] = screenWidth - 25;
    end

    if (windowPosition["yPos"] < 0) then
        windowPosition["yPos"] = 0;
    end

    if (windowPosition["yPos"] > screenHeight - 10) then
        windowPosition["yPos"] = screenHeight - 10;
    end
end


-- Load Calibration --
function loadCalibration()
    local _calibrationTime = Turbine.PluginData.Load(Turbine.DataScope.Server, calibrationFileName);
    if _calibrationTime ~= nil then calibrationTime = tonumber(_calibrationTime); end

    if (calibrationTime == nil) then
        calibrationTime = 0;
    end
end