localTimeDisplayCommand = Turbine.ShellCommand();

-- Execute command --
function localTimeDisplayCommand:Execute(command, args)
	toggleVisibility();
end

-- Toggle visibility of the main window --
function toggleVisibility()
	if (mainWindow:IsVisible()) then
		mainWindow:SetVisible(false);
		notification("Time display has been hidden.");
	else
		mainWindow:SetVisible(true);
		notification("Time display is visible again.");
	end
end

-- Commands --
Turbine.Shell.AddCommand("localtimedisplay", localTimeDisplayCommand);