-- Sends notifications to chat --
function notification(message)
	if (type(message) == "string") then
		Turbine.Shell.WriteLine(rgb["pluginName"] .. pluginName .. rgb["clear"] .. ": " .. message);
	end
end