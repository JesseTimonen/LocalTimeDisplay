plugin.GetOptionsPanel = function(self)

	-- Create Options Panel --
	optionsPanel = Turbine.UI.Control();
	optionsPanel:SetSize(800, 1050);


	-- Local time settings title --
	localTimeSettingsTitle = Turbine.UI.Label();
	localTimeSettingsTitle:SetParent(optionsPanel);
	localTimeSettingsTitle:SetText("Local Time Settings");
	localTimeSettingsTitle:SetSize(400, 30);
	localTimeSettingsTitle:SetPosition(0, 25);
	localTimeSettingsTitle:SetFont(Turbine.UI.Lotro.Font.TrajanPro18);
	localTimeSettingsTitle:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	localTimeSettingsTitle:SetForeColor(color["yellow"]);
	localTimeSettingsTitle:SetFontStyle(Turbine.UI.FontStyle.Outline);
	localTimeSettingsTitle:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	localTimeSettingsTitle:SetBackground(Turbine.UI.Graphic("LocalTimeDisplay/Images/optionsTitleBackground.tga"));


	-- Enable local time checkbox --
	enableLocalTimeLabel = Turbine.UI.Label();
	enableLocalTimeLabel:SetParent(optionsPanel);
	enableLocalTimeLabel:SetSize(300, 30);
	enableLocalTimeLabel:SetPosition(80, 80);
	enableLocalTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	enableLocalTimeLabel:SetText("Enable local time");
	enableLocalTimeLabel:SetForeColor(color["golden"]);
	enableLocalTimeCheckbox = Turbine.UI.Lotro.CheckBox();
	enableLocalTimeCheckbox:SetParent(optionsPanel);
	enableLocalTimeCheckbox:SetSize(20, 20);
	enableLocalTimeCheckbox:SetPosition(50, 79);
	enableLocalTimeCheckbox:SetChecked(settings["enableLocalTime"]);


	-- Enable local time Title --
	enableLocalTimeTitleLabel = Turbine.UI.Label();
	enableLocalTimeTitleLabel:SetParent(optionsPanel);
	enableLocalTimeTitleLabel:SetSize(300, 30);
	enableLocalTimeTitleLabel:SetPosition(80, 120);
	enableLocalTimeTitleLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	enableLocalTimeTitleLabel:SetText("Enable local time title");
	enableLocalTimeTitleLabel:SetForeColor(color["golden"]);
	enableLocalTimeTitleCheckbox = Turbine.UI.Lotro.CheckBox();
	enableLocalTimeTitleCheckbox:SetParent(optionsPanel);
	enableLocalTimeTitleCheckbox:SetSize(20, 20);
	enableLocalTimeTitleCheckbox:SetPosition(50, 119);
	enableLocalTimeTitleCheckbox:SetChecked(settings["displayLocalTimeTitle"]);


	-- Local time title --
	localTimeTitleLabel = Turbine.UI.Label();
	localTimeTitleLabel:SetParent(optionsPanel);
	localTimeTitleLabel:SetSize(300, 30);
	localTimeTitleLabel:SetPosition(50, 160);
	localTimeTitleLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	localTimeTitleLabel:SetText("Local Time Title:");
	localTimeTitleLabel:SetForeColor(color["golden"]);
	localTimeTitleTextbox = Turbine.UI.Lotro.TextBox();
	localTimeTitleTextbox:SetParent(optionsPanel);
	localTimeTitleTextbox:SetMultiline(false);
	localTimeTitleTextbox:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	localTimeTitleTextbox:SetText(settings["localTimeTitle"]);
	localTimeTitleTextbox:SetSize(250, 20);
	localTimeTitleTextbox:SetPosition(50, 180);


	-- Local time format --
	localTimeFormatLabel = Turbine.UI.Label();
	localTimeFormatLabel:SetParent(optionsPanel);
	localTimeFormatLabel:SetSize(200, 50);
	localTimeFormatLabel:SetPosition(50, 220);
	localTimeFormatLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	localTimeFormatLabel:SetText("Time format:");
	localTimeFormatLabel:SetForeColor(color["golden"]);

	local localTimeFormats = { "24 hour", "AM/PM",};
	local localTimeFormatRadioButtons = {};
	local top = 240;
	for i = 1, #localTimeFormats do
		localTimeFormatRadioButton = LocalTimeDisplay.Utility.RadioButton();
		localTimeFormatRadioButton:SetParent(optionsPanel);
		localTimeFormatRadioButton:SetPosition(50, top);
		localTimeFormatRadioButton:SetSize(300, 20);
		localTimeFormatRadioButton:SetFont(Turbine.UI.Lotro.Font.TrajanPro15);
		localTimeFormatRadioButton:SetForeColor(color["golden"]);
		localTimeFormatRadioButton:SetText(localTimeFormats[i]);
		if (string.lower(localTimeFormats[i]) == settings["localTimeFormat"]) then localTimeFormatRadioButton:SetChecked(true); end
		localTimeFormatRadioButton.Clicked = function()
			settings["localTimeFormat"] = string.lower(localTimeFormats[i]);
		end
		
		top = top + 20;
		table.insert(localTimeFormatRadioButtons, localTimeFormatRadioButton);
	end

	Utility.RadioButton.LinkPeers(localTimeFormatRadioButtons);


	-- Local time font size --
	localTimeFontSizeLabel = Turbine.UI.Label();
	localTimeFontSizeLabel:SetParent(optionsPanel);
	localTimeFontSizeLabel:SetSize(200, 50);
	localTimeFontSizeLabel:SetPosition(50, 300);
	localTimeFontSizeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	localTimeFontSizeLabel:SetText("Font Size:");
	localTimeFontSizeLabel:SetForeColor(color["golden"]);
	localTimeFontSizeDropdown = LocalTimeDisplay.Utility.DropDownList();
	localTimeFontSizeDropdown:SetParent(optionsPanel);
	localTimeFontSizeDropdown:SetDropRows(5);
	localTimeFontSizeDropdown:SetSize(200, 20);
	localTimeFontSizeDropdown:SetPosition(50, 320);
	localTimeFontSizeDropdown:SetZOrder(1002);
	localTimeFontSizeDropdown:SetVisible(true);
	localTimeFontSizeDropdown:SetBackColor(Turbine.UI.Color(0, 0, 0));
	localTimeFontSizeDropdown:SetTextColor(Turbine.UI.Color(1, 1, 1));
	localTimeFontSizeDropdown:SetCurrentBackColor(Turbine.UI.Color(0, 0, 0));
	local localFontSizes = {"10", "12", "14", "16", "18", "20", "22", "23"};
	for i = 1, #localFontSizes do
		localTimeFontSizeDropdown:AddItem(localFontSizes[i], string.lower(localFontSizes[i]));
		if (settings["localTimeFontSize"] == string.lower(localFontSizes[i])) then
			localTimeFontSizeDropdown:SetSelectedIndex(i);
		end
	end


	-- Local time font color --
	localTimeColorLabel = Turbine.UI.Label();
	localTimeColorLabel:SetParent(optionsPanel);
	localTimeColorLabel:SetSize(200, 50);
	localTimeColorLabel:SetPosition(50, 360);
	localTimeColorLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	localTimeColorLabel:SetText("Font Color:");
	localTimeColorLabel:SetForeColor(color["golden"]);
	localTimeColorDropdown = LocalTimeDisplay.Utility.DropDownList();
	localTimeColorDropdown:SetParent(optionsPanel);
	localTimeColorDropdown:SetDropRows(5);
	localTimeColorDropdown:SetSize(200, 20);
	localTimeColorDropdown:SetPosition(50, 380);
	localTimeColorDropdown:SetZOrder(1001);
	localTimeColorDropdown:SetVisible(true);
	localTimeColorDropdown:SetBackColor(Turbine.UI.Color(0, 0, 0));
	localTimeColorDropdown:SetTextColor(Turbine.UI.Color(1, 1, 1));
	localTimeColorDropdown:SetCurrentBackColor(Turbine.UI.Color(0, 0, 0));
	local localFontColors = { "White", "Light grey", "grey", "Dark grey", "golden", "yellow", "orange", "red", "lightred", "green", "darkgreen",  "lightblue"};
	for i = 1, #localFontColors do
		localTimeColorDropdown:AddItem(localFontColors[i], string.lower(string.gsub(localFontColors[i], " ", "")));
		if (settings["localTimeColor"] == string.lower(string.gsub(localFontColors[i], " ", ""))) then
			localTimeColorDropdown:SetSelectedIndex(i);
		end
	end


	-- Lock local time window --
	lockLocalTimeWindowLabel = Turbine.UI.Label();
	lockLocalTimeWindowLabel:SetParent(optionsPanel);
	lockLocalTimeWindowLabel:SetSize(300, 30);
	lockLocalTimeWindowLabel:SetPosition(80, 420);
	lockLocalTimeWindowLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	lockLocalTimeWindowLabel:SetText("Lock local time position");
	lockLocalTimeWindowLabel:SetForeColor(color["golden"]);
	lockLocalTimeWindowTextbox = Turbine.UI.Lotro.CheckBox();
	lockLocalTimeWindowTextbox:SetParent(optionsPanel);
	lockLocalTimeWindowTextbox:SetSize(20, 20);
	lockLocalTimeWindowTextbox:SetPosition(50, 419);
	lockLocalTimeWindowTextbox:SetChecked(settings["localTimeLocked"]);


	-- Local time offscreen help button --
	localTimeOffscreenButton = Turbine.UI.Lotro.Button();
	localTimeOffscreenButton:SetText("Reset Local Time Position");
	localTimeOffscreenButton:SetParent(optionsPanel);
	localTimeOffscreenButton:SetSize(250, 20);
	localTimeOffscreenButton:SetPosition(50, 450);
	localTimeOffscreenButton:SetZOrder(100);
	localTimeOffscreenButton.Click = function( sender, args)
		localTimeWindowPosition["xPos"] = (screenWidth / 2) - 50;
		localTimeWindowPosition["yPos"] = screenHeight / 2;
		localTimeWindow:SetPosition(localTimeWindowPosition["xPos"], localTimeWindowPosition["yPos"]);
		localTimeWindow.positionHasBeenModified = true;
		notification("Local time's position has been resetted.");
	end


	-- Server time settings title --
	serverTimeSettingsTitle = Turbine.UI.Label();
	serverTimeSettingsTitle:SetParent(optionsPanel);
	serverTimeSettingsTitle:SetText("Server Time Settings");
	serverTimeSettingsTitle:SetSize(400, 30);
	serverTimeSettingsTitle:SetPosition(0, 515);
	serverTimeSettingsTitle:SetFont(Turbine.UI.Lotro.Font.TrajanPro18);
	serverTimeSettingsTitle:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	serverTimeSettingsTitle:SetForeColor(color["yellow"]);
	serverTimeSettingsTitle:SetFontStyle(Turbine.UI.FontStyle.Outline);
	serverTimeSettingsTitle:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	serverTimeSettingsTitle:SetBackground(Turbine.UI.Graphic("LocalTimeDisplay/Images/optionsTitleBackground.tga"));


	-- Enable server time checkbox --
	enableServerTimeLabel = Turbine.UI.Label();
	enableServerTimeLabel:SetParent(optionsPanel);
	enableServerTimeLabel:SetSize(300, 30);
	enableServerTimeLabel:SetPosition(80, 570);
	enableServerTimeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	enableServerTimeLabel:SetText("Enable server time");
	enableServerTimeLabel:SetForeColor(color["golden"]);
	enableServerTimeCheckbox = Turbine.UI.Lotro.CheckBox();
	enableServerTimeCheckbox:SetParent(optionsPanel);
	enableServerTimeCheckbox:SetSize(20, 20);
	enableServerTimeCheckbox:SetPosition(50, 569);
	enableServerTimeCheckbox:SetChecked(settings["enableServerTime"]);


	-- Enable server time Title --
	enableServerTimeTitleLabel = Turbine.UI.Label();
	enableServerTimeTitleLabel:SetParent(optionsPanel);
	enableServerTimeTitleLabel:SetSize(300, 30);
	enableServerTimeTitleLabel:SetPosition(80, 610);
	enableServerTimeTitleLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	enableServerTimeTitleLabel:SetText("Enable server time title");
	enableServerTimeTitleLabel:SetForeColor(color["golden"]);
	enableServerTimeTitleCheckbox = Turbine.UI.Lotro.CheckBox();
	enableServerTimeTitleCheckbox:SetParent(optionsPanel);
	enableServerTimeTitleCheckbox:SetSize(20, 20);
	enableServerTimeTitleCheckbox:SetPosition(50, 609);
	enableServerTimeTitleCheckbox:SetChecked(settings["displayServerTimeTitle"]);


	-- Server time title --
	serverTimeTitleLabel = Turbine.UI.Label();
	serverTimeTitleLabel:SetParent(optionsPanel);
	serverTimeTitleLabel:SetSize(300, 30);
	serverTimeTitleLabel:SetPosition(50, 650);
	serverTimeTitleLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	serverTimeTitleLabel:SetText("Server Time Title:");
	serverTimeTitleLabel:SetForeColor(color["golden"]);
	serverTimeTitleTextbox = Turbine.UI.Lotro.TextBox();
	serverTimeTitleTextbox:SetParent(optionsPanel);
	serverTimeTitleTextbox:SetMultiline(false);
	serverTimeTitleTextbox:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	serverTimeTitleTextbox:SetText(settings["serverTimeTitle"]);
	serverTimeTitleTextbox:SetSize(250, 20);
	serverTimeTitleTextbox:SetPosition(50, 670);


	-- Server time format --
	serverTimeFormatLabel = Turbine.UI.Label();
	serverTimeFormatLabel:SetParent(optionsPanel);
	serverTimeFormatLabel:SetSize(200, 50);
	serverTimeFormatLabel:SetPosition(50, 710);
	serverTimeFormatLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	serverTimeFormatLabel:SetText("Time format:");
	serverTimeFormatLabel:SetForeColor(color["golden"]);

	local serverTimeFormats = { "24 hour", "AM/PM",};
	local serverTimeFormatRadioButtons = {};
	local top = 730;
	for i = 1, #serverTimeFormats do
		serverTimeFormatRadioButton = LocalTimeDisplay.Utility.RadioButton();
		serverTimeFormatRadioButton:SetParent(optionsPanel);
		serverTimeFormatRadioButton:SetPosition(50, top);
		serverTimeFormatRadioButton:SetSize(300, 20);
		serverTimeFormatRadioButton:SetFont(Turbine.UI.Lotro.Font.TrajanPro15);
		serverTimeFormatRadioButton:SetForeColor(color["golden"]);
		serverTimeFormatRadioButton:SetText(serverTimeFormats[i]);
		if (string.lower(serverTimeFormats[i]) == settings["serverTimeFormat"]) then serverTimeFormatRadioButton:SetChecked(true); end
		serverTimeFormatRadioButton.Clicked = function()
			settings["serverTimeFormat"] = string.lower(serverTimeFormats[i]);
		end
		
		top = top + 20;
		table.insert(serverTimeFormatRadioButtons, serverTimeFormatRadioButton);
	end

	Utility.RadioButton.LinkPeers(serverTimeFormatRadioButtons);


	-- Server font size --
	serverTimeFontSizeLabel = Turbine.UI.Label();
	serverTimeFontSizeLabel:SetParent(optionsPanel);
	serverTimeFontSizeLabel:SetSize(200, 50);
	serverTimeFontSizeLabel:SetPosition(50, 790);
	serverTimeFontSizeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	serverTimeFontSizeLabel:SetText("Font Size:");
	serverTimeFontSizeLabel:SetForeColor(color["golden"]);
	serverTimeFontSizeDropdown = LocalTimeDisplay.Utility.DropDownList();
	serverTimeFontSizeDropdown:SetParent(optionsPanel);
	serverTimeFontSizeDropdown:SetDropRows(5);
	serverTimeFontSizeDropdown:SetSize(200, 20);
	serverTimeFontSizeDropdown:SetPosition(50, 810);
	serverTimeFontSizeDropdown:SetZOrder(1002);
	serverTimeFontSizeDropdown:SetVisible(true);
	serverTimeFontSizeDropdown:SetBackColor(Turbine.UI.Color(0, 0, 0));
	serverTimeFontSizeDropdown:SetTextColor(Turbine.UI.Color(1, 1, 1));
	serverTimeFontSizeDropdown:SetCurrentBackColor(Turbine.UI.Color(0, 0, 0));
	local serverFontSizes = {"10", "12", "14", "16", "18", "20", "22", "23"};
	for i = 1, #serverFontSizes do
		serverTimeFontSizeDropdown:AddItem(serverFontSizes[i], string.lower(serverFontSizes[i]));
		if (settings["serverTimeFontSize"] == string.lower(serverFontSizes[i])) then
			serverTimeFontSizeDropdown:SetSelectedIndex(i);
		end
	end


	-- Server font color --
	serverTimeColorLabel = Turbine.UI.Label();
	serverTimeColorLabel:SetParent(optionsPanel);
	serverTimeColorLabel:SetSize(200, 50);
	serverTimeColorLabel:SetPosition(50, 850);
	serverTimeColorLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	serverTimeColorLabel:SetText("Font Color:");
	serverTimeColorLabel:SetForeColor(color["golden"]);
	serverTimeColorDropdown = LocalTimeDisplay.Utility.DropDownList();
	serverTimeColorDropdown:SetParent(optionsPanel);
	serverTimeColorDropdown:SetDropRows(5);
	serverTimeColorDropdown:SetSize(200, 20);
	serverTimeColorDropdown:SetPosition(50, 870);
	serverTimeColorDropdown:SetZOrder(1001);
	serverTimeColorDropdown:SetVisible(true);
	serverTimeColorDropdown:SetBackColor(Turbine.UI.Color(0, 0, 0));
	serverTimeColorDropdown:SetTextColor(Turbine.UI.Color(1, 1, 1));
	serverTimeColorDropdown:SetCurrentBackColor(Turbine.UI.Color(0, 0, 0));
	local serverFontColors = { "White", "Light grey", "grey", "Dark grey", "golden", "yellow", "orange", "red", "lightred", "green", "darkgreen",  "lightblue"};
	for i = 1, #serverFontColors do
		serverTimeColorDropdown:AddItem(serverFontColors[i], string.lower(string.gsub(serverFontColors[i], " ", "")));
		if (settings["serverTimeColor"] == string.lower(string.gsub(serverFontColors[i], " ", ""))) then
			serverTimeColorDropdown:SetSelectedIndex(i);
		end
	end


	-- Lock server time window --
	lockServerTimeWindowLabel = Turbine.UI.Label();
	lockServerTimeWindowLabel:SetParent(optionsPanel);
	lockServerTimeWindowLabel:SetSize(300, 30);
	lockServerTimeWindowLabel:SetPosition(80, 910);
	lockServerTimeWindowLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	lockServerTimeWindowLabel:SetText("Lock server time position");
	lockServerTimeWindowLabel:SetForeColor(color["golden"]);
	lockServerTimeWindowTextbox = Turbine.UI.Lotro.CheckBox();
	lockServerTimeWindowTextbox:SetParent(optionsPanel);
	lockServerTimeWindowTextbox:SetSize(20, 20);
	lockServerTimeWindowTextbox:SetPosition(50, 909);
	lockServerTimeWindowTextbox:SetChecked(settings["serverTimeLocked"]);


	-- Server time offscreen help button --
	serverTimeOffscreenButton = Turbine.UI.Lotro.Button();
	serverTimeOffscreenButton:SetText("Reset Server Time Position");
	serverTimeOffscreenButton:SetParent(optionsPanel);
	serverTimeOffscreenButton:SetSize(250, 20);
	serverTimeOffscreenButton:SetPosition(50, 940);
	serverTimeOffscreenButton:SetZOrder(100);
	serverTimeOffscreenButton.Click = function( sender, args)
		serverTimeWindowPosition["xPos"] = (screenWidth / 2) + 50;
		serverTimeWindowPosition["yPos"] = screenHeight / 2;
		serverTimeWindow:SetPosition(serverTimeWindowPosition["xPos"], serverTimeWindowPosition["yPos"]);
		serverTimeWindow.positionHasBeenModified = true;
		notification("Server time's position has been resetted.");
	end


	-- Save settings button --
	saveSettingsButton = Turbine.UI.Lotro.Button();
	saveSettingsButton:SetText("Save Settings");
	saveSettingsButton:SetParent(optionsPanel);
	saveSettingsButton:SetSize(250, 20);
	saveSettingsButton:SetPosition(50, 1000);
	saveSettingsButton:SetZOrder(100);
	saveSettingsButton.Click = function( sender, args)
		settings["enableLocalTime"] = enableLocalTimeCheckbox:IsChecked();
		settings["displayLocalTimeTitle"] = enableLocalTimeTitleCheckbox:IsChecked();
		settings["localTimeTitle"] = localTimeTitleTextbox:GetText();
		settings["localTimeFontSize"] = localTimeFontSizeDropdown:GetValue();
		settings["localTimeColor"] = localTimeColorDropdown:GetValue();
		settings["localTimeLocked"] = lockLocalTimeWindowTextbox:IsChecked();
		settings["enableServerTime"] = enableServerTimeCheckbox:IsChecked();
		settings["displayServerTimeTitle"] = enableServerTimeTitleCheckbox:IsChecked();
		settings["serverTimeTitle"] = serverTimeTitleTextbox:GetText();
		settings["serverTimeFontSize"] = serverTimeFontSizeDropdown:GetValue();
		settings["serverTimeColor"] = serverTimeColorDropdown:GetValue();
		settings["serverTimeLocked"] = lockServerTimeWindowTextbox:IsChecked();
		saveSettings();
		updateLocalTimeUI();
		updateServerTimeUI();
		localTimeLabel.updatelimiter = 9999;
		serverTimeLabel.updatelimiter = 9999;
		notification("Settings have been saved!");
	end


	-- Return View --
	return optionsPanel;
end