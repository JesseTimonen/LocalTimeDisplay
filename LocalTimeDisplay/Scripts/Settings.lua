plugin.GetOptionsPanel = function(self)

	-- Create Options Panel --
	optionsPanel = Turbine.UI.Control();
	optionsPanel:SetSize(500, 600);


	-- Time calibration title --
	timeCalibrationTitle = Turbine.UI.Label();
	timeCalibrationTitle:SetParent(optionsPanel);
	timeCalibrationTitle:SetText("Time Calibration");
	timeCalibrationTitle:SetSize(400, 30);
	timeCalibrationTitle:SetPosition(0, 20);
	timeCalibrationTitle:SetFont(Turbine.UI.Lotro.Font.TrajanPro18);
	timeCalibrationTitle:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	timeCalibrationTitle:SetForeColor(color["yellow"]);
	timeCalibrationTitle:SetFontStyle(Turbine.UI.FontStyle.Outline);
	timeCalibrationTitle:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	timeCalibrationTitle:SetBackground(Turbine.UI.Graphic("LocalTimeDisplay/Assets/Images/optionsTitleBackground.tga"));


	-- Description label for time calibration --
	timeCalibrationDescription = Turbine.UI.Label();
	timeCalibrationDescription:SetParent(optionsPanel);
	timeCalibrationDescription:SetSize(400, 50);
	timeCalibrationDescription:SetPosition(10, 50);
	timeCalibrationDescription:SetFont(Turbine.UI.Lotro.Font.Verdana16);
    timeCalibrationDescription:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	timeCalibrationDescription:SetText("Insert your local time into the two textboxes");
	timeCalibrationDescription:SetForeColor(color["golden"]);


    -- Notice label for time calibration --
	timeCalibrationNotice = Turbine.UI.Label();
	timeCalibrationNotice:SetParent(optionsPanel);
	timeCalibrationNotice:SetSize(400, 50);
	timeCalibrationNotice:SetPosition(0, 150);
	timeCalibrationNotice:SetFont(Turbine.UI.Lotro.Font.Verdana12);
    timeCalibrationNotice:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	timeCalibrationNotice:SetText("Time calibration needs to be done\nusing the 24 hour format!");
	timeCalibrationNotice:SetForeColor(color["golden"]);


	-- Textbox input for time calibration (hours) --
    timeCalibrationHoursTextBox = Turbine.UI.Lotro.TextBox();
	timeCalibrationHoursTextBox:SetParent(optionsPanel);
    timeCalibrationHoursTextBox:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
    timeCalibrationHoursTextBox:SetText("00");
	timeCalibrationHoursTextBox:SetZOrder(2);
	timeCalibrationHoursTextBox:SetMultiline(false);
	timeCalibrationHoursTextBox:SetSize(50, 30);
	timeCalibrationHoursTextBox:SetPosition(130, 100);
	timeCalibrationHoursTextBox.FocusLost = function()
		local timeCalibrationHoursText = timeCalibrationHoursTextBox:GetText();
		timeCalibrationHoursText = tonumber(timeCalibrationHoursText);

		if (timeCalibrationHoursText == nil) then
			timeCalibrationHoursTextBox:SetText("00");
			return;
		end

		if (timeCalibrationHoursText > 23) then
			timeCalibrationHoursText = 23;
		end

		if (timeCalibrationHoursText <= 0) then
			timeCalibrationHoursText = 0;
		end
		
		if (timeCalibrationHoursText == 0) then
			timeCalibrationHoursTextBox:SetText("00");
		elseif (timeCalibrationHoursText < 10) then
			timeCalibrationHoursTextBox:SetText("0" .. tostring(timeCalibrationHoursText));
		else
			timeCalibrationHoursTextBox:SetText(tostring(timeCalibrationHoursText));
		end
	end


	-- Textbox input for time calibration (minutes) --
    timeCalibrationMinutesTextBox = Turbine.UI.Lotro.TextBox();
	timeCalibrationMinutesTextBox:SetParent(optionsPanel);
    timeCalibrationMinutesTextBox:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
    timeCalibrationMinutesTextBox:SetText("00");
	timeCalibrationMinutesTextBox:SetZOrder(2);
	timeCalibrationMinutesTextBox:SetMultiline(false);
	timeCalibrationMinutesTextBox:SetSize(50, 30);
	timeCalibrationMinutesTextBox:SetPosition(210, 100);
	timeCalibrationMinutesTextBox.FocusLost = function()
		local timeCalibrationMinutesText = timeCalibrationMinutesTextBox:GetText();
		timeCalibrationMinutesText = tonumber(timeCalibrationMinutesText);

		if (timeCalibrationMinutesText == nil) then
			timeCalibrationMinutesTextBox:SetText("00");
			return;
		end

		if (timeCalibrationMinutesText > 59) then
			timeCalibrationMinutesText = 59;
		end

		if (timeCalibrationMinutesText <= 0) then
			timeCalibrationMinutesText = 0;
		end
		
		if (timeCalibrationMinutesText == 0) then
			timeCalibrationMinutesTextBox:SetText("00");
		elseif (timeCalibrationMinutesText < 10) then
			timeCalibrationMinutesTextBox:SetText("0" .. tostring(timeCalibrationMinutesText));
		else
			timeCalibrationMinutesTextBox:SetText(tostring(timeCalibrationMinutesText));
		end
	end


	-- Time calibration hour label --
	timeCalibrationHourLabel = Turbine.UI.Label();
	timeCalibrationHourLabel:SetParent(optionsPanel);
	timeCalibrationHourLabel:SetSize(80, 50);
	timeCalibrationHourLabel:SetPosition(115, 112);
	timeCalibrationHourLabel:SetFont(Turbine.UI.Lotro.Font.Verdana12);
	timeCalibrationHourLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	timeCalibrationHourLabel:SetText("hours");
	timeCalibrationHourLabel:SetZOrder(1);
	timeCalibrationHourLabel:SetForeColor(color["golden"]);


	-- Time calibration minute label --
	timeCalibrationminuteLabel = Turbine.UI.Label();
	timeCalibrationminuteLabel:SetParent(optionsPanel);
	timeCalibrationminuteLabel:SetSize(80, 50);
	timeCalibrationminuteLabel:SetPosition(195, 112);
	timeCalibrationminuteLabel:SetFont(Turbine.UI.Lotro.Font.Verdana12);
	timeCalibrationminuteLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	timeCalibrationminuteLabel:SetText("minutes");
	timeCalibrationminuteLabel:SetZOrder(1);
	timeCalibrationminuteLabel:SetForeColor(color["golden"]);


    -- Textbox input seperator --
	timeCalibrationseperator = Turbine.UI.Label();
	timeCalibrationseperator:SetParent(optionsPanel);
	timeCalibrationseperator:SetSize(50, 50);
	timeCalibrationseperator:SetPosition(191, 102);
	timeCalibrationseperator:SetFont(Turbine.UI.Lotro.Font.Verdana20);
	timeCalibrationseperator:SetText(":");
	timeCalibrationseperator:SetZOrder(1);
	timeCalibrationseperator:SetForeColor(color["golden"]);


	-- Save calibration button --
	saveCalibrationButton = Turbine.UI.Lotro.Button();
	saveCalibrationButton:SetText("Calibrate");
	saveCalibrationButton:SetParent(optionsPanel);
	saveCalibrationButton:SetSize(125, 20);
	saveCalibrationButton:SetPosition(140, 210);
	saveCalibrationButton:SetZOrder(100);
	saveCalibrationButton.Click = function( sender, args)
		local calibrationHours = tonumber(timeCalibrationHoursTextBox:GetText());
		local calibrationMinutes = tonumber(timeCalibrationMinutesTextBox:GetText());
		calibrationTime = math.floor(Turbine.Engine.GetGameTime() - (calibrationHours * 3600) - (calibrationMinutes * 60));

		time_label.updatelimiter = 9999;
		if (settings["firstTime"]) then
			settings["firstTime"] = false;
			mainWindow:SetSize(92, 20);
			mainWindow:SetBackColor(Turbine.UI.Color(0, 0, 0, 0));
			firstTime_label:SetVisible(false);
		end

		saveCalibration();
		saveSettings();
		notification("Calibration has been completed!");
	end


	-- Settings Label --
	SettingsTitle = Turbine.UI.Label();
	SettingsTitle:SetParent(optionsPanel);
	SettingsTitle:SetText("Settings");
	SettingsTitle:SetSize(400, 30);
	SettingsTitle:SetPosition(0, 270);
	SettingsTitle:SetFont(Turbine.UI.Lotro.Font.TrajanPro18);
	SettingsTitle:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	SettingsTitle:SetForeColor(color["yellow"]);
	SettingsTitle:SetFontStyle(Turbine.UI.FontStyle.Outline);
	SettingsTitle:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	SettingsTitle:SetBackground(Turbine.UI.Graphic("LocalTimeDisplay/Assets/Images/optionsTitleBackground.tga"));



	timeFormatLabel = Turbine.UI.Label();
	timeFormatLabel:SetParent(optionsPanel);
	timeFormatLabel:SetSize(200, 50);
	timeFormatLabel:SetPosition(50, 310);
	timeFormatLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	timeFormatLabel:SetText("Time format");
	timeFormatLabel:SetForeColor(color["golden"]);

	-- Time format settings --
	local timeFormats = { "24 hour", "AM/PM",};
	local radioButtons = {};
	local top = 330;

	for i = 1, #timeFormats do
		radioButton = LocalTimeDisplay.Utility.RadioButton();
		radioButton:SetParent(optionsPanel);
		radioButton:SetPosition(50, top);
		radioButton:SetSize(300, 20);
		radioButton:SetFont(Turbine.UI.Lotro.Font.TrajanPro15);
		radioButton:SetForeColor(color["golden"]);
		radioButton:SetText(timeFormats[i]);
		if (string.lower(timeFormats[i]) == settings["timeFormat"]) then radioButton:SetChecked(true); end
		radioButton.Clicked = function()
			settings["timeFormat"] = string.lower(timeFormats[i]);
		end
		
		top = top + 20;
		table.insert(radioButtons, radioButton);
	end

	Utility.RadioButton.LinkPeers(radioButtons);


	-- Font size Settings --
	fontSizeLabel = Turbine.UI.Label();
	fontSizeLabel:SetParent(optionsPanel);
	fontSizeLabel:SetSize(200, 50);
	fontSizeLabel:SetPosition(50, 390);
	fontSizeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	fontSizeLabel:SetText("Font Size");
	fontSizeLabel:SetForeColor(color["golden"]);

	fontSizeDropdown = LocalTimeDisplay.Utility.DropDownList();
	fontSizeDropdown:SetParent(optionsPanel);
	fontSizeDropdown:SetDropRows(5);
	fontSizeDropdown:SetSize(200, 20);
	fontSizeDropdown:SetPosition(50, 410);
	fontSizeDropdown:SetZOrder(1002);
	fontSizeDropdown:SetVisible(true);
	fontSizeDropdown:SetBackColor(Turbine.UI.Color(0, 0, 0));
	fontSizeDropdown:SetTextColor(Turbine.UI.Color(1, 1, 1));
	fontSizeDropdown:SetCurrentBackColor(Turbine.UI.Color(0, 0, 0));

	local fontSizes = {"10", "12", "14", "16", "18", "20", "22", "23"};
	for i = 1, #fontSizes do
		fontSizeDropdown:AddItem(fontSizes[i], string.lower(fontSizes[i]));
		if (settings["fontSize"] == string.lower(fontSizes[i])) then
			fontSizeDropdown:SetSelectedIndex(i);
		end
	end


	-- Font Color Settings --
	fontColorLabel = Turbine.UI.Label();
	fontColorLabel:SetParent(optionsPanel);
	fontColorLabel:SetSize(200, 50);
	fontColorLabel:SetPosition(50, 450);
	fontColorLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	fontColorLabel:SetText("Font Color");
	fontColorLabel:SetForeColor(color["golden"]);

	fontColorDropdown = LocalTimeDisplay.Utility.DropDownList();
	fontColorDropdown:SetParent(optionsPanel);
	fontColorDropdown:SetDropRows(5);
	fontColorDropdown:SetSize(200, 20);
	fontColorDropdown:SetPosition(50, 470);
	fontColorDropdown:SetZOrder(1001);
	fontColorDropdown:SetVisible(true);
	fontColorDropdown:SetBackColor(Turbine.UI.Color(0, 0, 0));
	fontColorDropdown:SetTextColor(Turbine.UI.Color(1, 1, 1));
	fontColorDropdown:SetCurrentBackColor(Turbine.UI.Color(0, 0, 0));

	local fontColors = { "White", "Light Gray", "Gray", "Dark Gray", "golden", "yellow", "orange", "red", "lightred", "green", "darkgreen",  "lightblue"};
	for i = 1, #fontColors do
		fontColorDropdown:AddItem(fontColors[i], string.lower(string.gsub(fontColors[i], " ", "")));
		if (settings["fontColor"] == string.lower(string.gsub(fontColors[i], " ", ""))) then
			fontColorDropdown:SetSelectedIndex(i);
		end
	end


	-- Lock window position label --
	lockWindowPositionLabel = Turbine.UI.Label();
	lockWindowPositionLabel:SetParent(optionsPanel);
	lockWindowPositionLabel:SetSize(300, 30);
	lockWindowPositionLabel:SetPosition(80, 510);
	lockWindowPositionLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	lockWindowPositionLabel:SetText("Lock timer position");
	lockWindowPositionLabel:SetForeColor(color["golden"]);


	-- Lock window position checkbox --
	lockWindowPositionCheckbox = Turbine.UI.Lotro.CheckBox();
	lockWindowPositionCheckbox:SetParent(optionsPanel);
	lockWindowPositionCheckbox:SetSize(20, 20);
	lockWindowPositionCheckbox:SetPosition(50, 509);
	lockWindowPositionCheckbox:SetChecked(settings["lockWindow"]);


	-- Save settings button --
	saveSettingsButton = Turbine.UI.Lotro.Button();
	saveSettingsButton:SetText("Save Settings");
	saveSettingsButton:SetParent(optionsPanel);
	saveSettingsButton:SetSize(250, 20);
	saveSettingsButton:SetPosition(50, 560);
	saveSettingsButton:SetZOrder(100);
	saveSettingsButton.Click = function( sender, args)
		settings["fontSize"] = fontSizeDropdown:GetValue();
		settings["fontColor"] = fontColorDropdown:GetValue();
		settings["lockWindow"] = lockWindowPositionCheckbox:IsChecked();
		saveSettings();
		updateFontStyles();
		time_label.updatelimiter = 9999;
		notification("Settings have been saved!");
	end


	-- Return View --
	return optionsPanel;
end