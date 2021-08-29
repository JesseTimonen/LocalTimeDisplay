-- Save settings --
function saveSettings()

    if (mainWindow:GetLeft() < 0) then
        settings["windowPosition"]["xPos"] = "0";
    else
        settings["windowPosition"]["xPos"] = tostring(mainWindow:GetLeft());
    end

    if (mainWindow:GetTop() < 0) then
        settings["windowPosition"]["yPos"] = "0";
    else
        settings["windowPosition"]["yPos"] = tostring(mainWindow:GetTop());
    end

    Turbine.PluginData.Save(Turbine.DataScope.Server, settingsFileName, settings);
end

-- Load settings --
function loadSettings()
    local _settings = Turbine.PluginData.Load(Turbine.DataScope.Server, settingsFileName);
    if _settings ~= nil then settings = _settings; end

    -- Make sure settings are there --
    if (settings["windowPosition"]["xPos"] == nil) then settings["windowPosition"]["xPos"] = screenWidth / 2 end
    if (settings["windowPosition"]["yPos"] == nil) then settings["windowPosition"]["yPos"] = screenHeight / 2 end
    if (settings["timeFormat"] == nil) then settings["timeFormat"] = "24 hour format" end
    if (settings["fontSize"] == nil) then settings["fontSize"] = 16 end
    if (settings["fontColor"] == nil) then settings["fontColor"] = "gray" end
    if (settings["lockWindow"] == nil) then settings["lockWindow"] = false end
    if (settings["firstTime"] == nil) then settings["firstTime"] = true end
end


-- Save Calibration --
function saveCalibration()
    Turbine.PluginData.Save(Turbine.DataScope.Server, calibrationFileName, calibrationTime);
end

-- Load Calibration --
function loadCalibration()
    local _calibrationTime = Turbine.PluginData.Load(Turbine.DataScope.Server, calibrationFileName);
    if _calibrationTime ~= nil then calibrationTime = _calibrationTime; end
end