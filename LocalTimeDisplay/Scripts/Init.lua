-- Plugin's name --
pluginName = "Local Time Display";

-- File names --
settingsFileName = "LocalTimeDisplay_Settings";
calibrationFileName = "LocalTimeDisplay_Calibration_Settings";

screenWidth, screenHeight = Turbine.UI.Display:GetSize();

-- Default settings --
settings = {
    windowPosition = {
        xPos = screenWidth / 2,
        yPos = screenHeight / 2
    },
    timeFormat = "24 hour format",
    fontSize = 16,
    fontColor = "gray",
    lockWindow = false,
    firstTime = true,
};

-- Default calibration --
calibrationTime = 0;

-- notification color codes --
rgb = {
    pluginName = "<rgb=#DAA520>",
    error = "<rgb=#FF0000>",
    clear = "</rgb>"
};

-- Turbine colors --
color = {
    black = Turbine.UI.Color(0, 0, 0),
    white = Turbine.UI.Color(1, 1, 1),
    golden = Turbine.UI.Color(242/255, 217/255, 140/255),
    yellow = Turbine.UI.Color(244/255, 255/255, 51/255),
    orange = Turbine.UI.Color(1, 0.5, 0),
    red = Turbine.UI.Color(1, 0, 0),
    darkRed = Turbine.UI.Color(0.7, 0, 0),
    green = Turbine.UI.Color(0, 1, 0),
    darkGreen = Turbine.UI.Color(0, 0.5, 0),
    blue = Turbine.UI.Color(0, 0, 1),
    lightblue = Turbine.UI.Color(0, 1, 1),
    darkBlue = Turbine.UI.Color(0, 0.25, 0.5),
    gray = Turbine.UI.Color(0.7, 0.7, 0.7),
};