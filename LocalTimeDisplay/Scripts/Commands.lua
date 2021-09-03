localTimeDisplayCommand = Turbine.ShellCommand();

-- Execute command --
function localTimeDisplayCommand:Execute(command, args)
	toggleVisibility();
end

-- Toggle visibility of the main window --
function toggleVisibility()
	if (localTimeWindow:IsVisible()) then
		localTimeWindow:SetVisible(false);
		serverTimeWindow:SetVisible(false);
		notification("Time display has been hidden.");
	else
		localTimeWindow:SetVisible(true);
		serverTimeWindow:SetVisible(true);
		notification("Time display is visible again.");
	end
end

-- Commands --
Turbine.Shell.AddCommand("localtimedisplay", localTimeDisplayCommand);