localTimeDisplayCommand = Turbine.ShellCommand();

-- Execute command --
function localTimeDisplayCommand:Execute(command, args)
	toggleVisibility();
end

-- Toggle visibility of the main window --
function toggleVisibility()
	mainWindow:SetVisible(not mainWindow:IsVisible());
end

-- Commands --
Turbine.Shell.AddCommand("localtimedisplay", localTimeDisplayCommand);