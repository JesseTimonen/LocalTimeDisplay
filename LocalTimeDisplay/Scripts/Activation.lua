-- Activate Plugin --
Plugins[pluginName].Load = function()
	notification("Activated version " .. Plugins[pluginName]:GetVersion() .. " by Henna");
end

-- Unload Plugin --
Plugins[pluginName].Unload = function()
	time_label:SetWantsUpdates(false);
	saveSettings();
	notification("Unactivated");
end

-- Load settings --
loadCalibration();
loadSettings();