unit HtmlGenerator_Cores;

interface

uses
  System.Classes, System.SysUtils;

type
  THtmlGeneratorCores = class
  public
    class function GerarPaletaCores: string;
  end;

implementation

class function THtmlGeneratorCores.GerarPaletaCores: string;
var
  Cores: TStringList;
begin
  Cores := TStringList.Create;
  try
    Cores.Add('        const colorPalette = [');
    Cores.Add('            ''rgba(255, 99, 132, 0.6)'',  // Red');
    Cores.Add('            ''rgba(54, 162, 235, 0.6)'',  // Blue');
    Cores.Add('            ''rgba(255, 206, 86, 0.6)'',  // Yellow');
    Cores.Add('            ''rgba(75, 192, 192, 0.6)'',  // Green');
    Cores.Add('            ''rgba(153, 102, 255, 0.6)'', // Purple');
    Cores.Add('            ''rgba(255, 159, 64, 0.6)'',  // Orange');
    Cores.Add('            ''rgba(199, 199, 199, 0.6)'', // Grey');
    Cores.Add('            ''rgba(255, 99, 71, 0.6)'',   // Tomato');
    Cores.Add('            ''rgba(46, 139, 87, 0.6)'',   // SeaGreen');
    Cores.Add('            ''rgba(30, 144, 255, 0.6)'',  // DodgerBlue');
    Cores.Add('            ''rgba(255, 69, 0, 0.6)'',    // OrangeRed');
    Cores.Add('            ''rgba(50, 205, 50, 0.6)'',   // LimeGreen');
    Cores.Add('            ''rgba(138, 43, 226, 0.6)'',  // BlueViolet');
    Cores.Add('            ''rgba(255, 20, 147, 0.6)'',  // DeepPink');
    Cores.Add('            ''rgba(0, 255, 255, 0.6)'',   // Cyan');
    Cores.Add('            ''rgba(255, 215, 0, 0.6)'',   // Gold');
    Cores.Add('            ''rgba(255, 105, 180, 0.6)'', // HotPink');
    Cores.Add('            ''rgba(0, 128, 0, 0.6)'',     // Green');
    Cores.Add('            ''rgba(100, 149, 237, 0.6)'', // CornflowerBlue');
    Cores.Add('            ''rgba(255, 140, 0, 0.6)'',   // DarkOrange');
    Cores.Add('            ''rgba(210, 105, 30, 0.6)'',  // Chocolate');
    Cores.Add('            ''rgba(220, 20, 60, 0.6)'',   // Crimson');
    Cores.Add('            ''rgba(0, 191, 255, 0.6)'',   // DeepSkyBlue');
    Cores.Add('            ''rgba(218, 112, 214, 0.6)'', // Orchid');
    Cores.Add('            ''rgba(65, 105, 225, 0.6)'',  // RoyalBlue');
    Cores.Add('            ''rgba(123, 104, 238, 0.6)'', // MediumSlateBlue');
    Cores.Add('            ''rgba(34, 139, 34, 0.6)'',   // ForestGreen');
    Cores.Add('            ''rgba(255, 0, 255, 0.6)'',   // Magenta');
    Cores.Add('            ''rgba(255, 182, 193, 0.6)'', // LightPink');
    Cores.Add('            ''rgba(173, 216, 230, 0.6)'', // LightBlue');
    Cores.Add('            ''rgba(128, 0, 128, 0.6)'',   // Purple');
    Cores.Add('            ''rgba(75, 0, 130, 0.6)'',    // Indigo');
    Cores.Add('            ''rgba(255, 99, 132, 0.4)'',  // LightRed');
    Cores.Add('            ''rgba(54, 162, 235, 0.4)'',  // LightBlue');
    Cores.Add('            ''rgba(255, 206, 86, 0.4)'',  // LightYellow');
    Cores.Add('            ''rgba(75, 192, 192, 0.4)'',  // LightGreen');
    Cores.Add('            ''rgba(153, 102, 255, 0.4)'', // LightPurple');
    Cores.Add('            ''rgba(255, 159, 64, 0.4)'',  // LightOrange');
    Cores.Add('            ''rgba(199, 199, 199, 0.4)'', // LightGrey');
    Cores.Add('            ''rgba(255, 99, 71, 0.4)'',   // LightTomato');
    Cores.Add('            ''rgba(46, 139, 87, 0.4)'',   // LightSeaGreen');
    Cores.Add('            ''rgba(30, 144, 255, 0.4)'',  // LightDodgerBlue');
    Cores.Add('            ''rgba(255, 69, 0, 0.4)'',    // LightOrangeRed');
    Cores.Add('            ''rgba(50, 205, 50, 0.4)'',   // LightLimeGreen');
    Cores.Add('            ''rgba(138, 43, 226, 0.4)'',  // LightBlueViolet');
    Cores.Add('            ''rgba(255, 20, 147, 0.4)'',  // LightDeepPink');
    Cores.Add('            ''rgba(0, 255, 255, 0.4)'',   // LightCyan');
    Cores.Add('            ''rgba(255, 215, 0, 0.4)'',   // LightGold');
    Cores.Add('            ''rgba(255, 105, 180, 0.4)'', // LightHotPink');
    Cores.Add('            ''rgba(0, 128, 0, 0.4)'',     // LightGreen');
    Cores.Add('            ''rgba(100, 149, 237, 0.4)'', // LightCornflowerBlue');
    Cores.Add('            ''rgba(255, 140, 0, 0.4)'',   // LightDarkOrange');
    Cores.Add('            ''rgba(210, 105, 30, 0.4)'',  // LightChocolate');
    Cores.Add('            ''rgba(220, 20, 60, 0.4)'',   // LightCrimson');
    Cores.Add('            ''rgba(0, 191, 255, 0.4)'',   // LightDeepSkyBlue');
    Cores.Add('            ''rgba(218, 112, 214, 0.4)'', // LightOrchid');
    Cores.Add('            ''rgba(65, 105, 225, 0.4)'',  // LightRoyalBlue');
    Cores.Add('            ''rgba(123, 104, 238, 0.4)'', // LightMediumSlateBlue');
    Cores.Add('            ''rgba(34, 139, 34, 0.4)'',   // LightForestGreen');
    Cores.Add('            ''rgba(255, 0, 255, 0.4)'',   // LightMagenta');
    Cores.Add('            ''rgba(255, 182, 193, 0.4)'', // LightLightPink');
    Cores.Add('            ''rgba(173, 216, 230, 0.4)'', // LightLightBlue');
    Cores.Add('            ''rgba(128, 0, 128, 0.4)'',   // LightPurple');
    Cores.Add('            ''rgba(75, 0, 130, 0.4)'',    // LightIndigo');
    Cores.Add('            ''rgba(255, 99, 132, 0.8)'',  // DarkRed');
    Cores.Add('            ''rgba(54, 162, 235, 0.8)'',  // DarkBlue');
    Cores.Add('            ''rgba(255, 206, 86, 0.8)'',  // DarkYellow');
    Cores.Add('            ''rgba(75, 192, 192, 0.8)'',  // DarkGreen');
    Cores.Add('            ''rgba(153, 102, 255, 0.8)'', // DarkPurple');
    Cores.Add('            ''rgba(255, 159, 64, 0.8)'',  // DarkOrange');
    Cores.Add('            ''rgba(199, 199, 199, 0.8)'', // DarkGrey');
    Cores.Add('            ''rgba(255, 99, 71, 0.8)'',   // DarkTomato');
    Cores.Add('            ''rgba(46, 139, 87, 0.8)'',   // DarkSeaGreen');
    Cores.Add('            ''rgba(30, 144, 255, 0.8)'',  // DarkDodgerBlue');
    Cores.Add('            ''rgba(255, 69, 0, 0.8)'',    // DarkOrangeRed');
    Cores.Add('            ''rgba(50, 205, 50, 0.8)'',   // DarkLimeGreen');
    Cores.Add('            ''rgba(138, 43, 226, 0.8)'',  // DarkBlueViolet');
    Cores.Add('            ''rgba(255, 20, 147, 0.8)'',  // DarkDeepPink');
    Cores.Add('            ''rgba(0, 255, 255, 0.8)'',   // DarkCyan');
    Cores.Add('            ''rgba(255, 215, 0, 0.8)'',   // DarkGold');
    Cores.Add('            ''rgba(255, 105, 180, 0.8)'', // DarkHotPink');
    Cores.Add('            ''rgba(0, 128, 0, 0.8)'',     // DarkGreen');
    Cores.Add('            ''rgba(100, 149, 237, 0.8)'', // DarkCornflowerBlue');
    Cores.Add('            ''rgba(255, 140, 0, 0.8)'',   // DarkDarkOrange');
    Cores.Add('            ''rgba(210, 105, 30, 0.8)'',  // DarkChocolate');
    Cores.Add('            ''rgba(220, 20, 60, 0.8)'',   // DarkCrimson');
    Cores.Add('            ''rgba(0, 191, 255, 0.8)'',   // DarkDeepSkyBlue');
    Cores.Add('            ''rgba(218, 112, 214, 0.8)'', // DarkOrchid');
    Cores.Add('            ''rgba(65, 105, 225, 0.8)'',  // DarkRoyalBlue');
    Cores.Add('            ''rgba(123, 104, 238, 0.8)'', // DarkMediumSlateBlue');
    Cores.Add('            ''rgba(34, 139, 34, 0.8)'',   // DarkForestGreen');
    Cores.Add('            ''rgba(255, 0, 255, 0.8)'',   // DarkMagenta');
    Cores.Add('            ''rgba(255, 182, 193, 0.8)'', // DarkLightPink');
    Cores.Add('            ''rgba(173, 216, 230, 0.8)'', // DarkLightBlue');
    Cores.Add('            ''rgba(128, 0, 128, 0.8)'',   // DarkPurple');
    Cores.Add('            ''rgba(75, 0, 130, 0.8)''     // DarkIndigo');
    Cores.Add('        ];');
    Cores.Add('');

    Result := Cores.Text;
  finally
    Cores.Free;
  end;
end;

end.
