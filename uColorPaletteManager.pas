unit uColorPaletteManager;

interface

uses
  System.SysUtils, System.Classes;

type
  TColorScheme = record
    Primary: string;
    Success: string;
    Info: string;
    Warning: string;
    Danger: string;
    Secondary: string;
  end;

  TColorPaletteManager = class
  private
    class function GetDefaultColorScheme: TColorScheme;
    class function GetChartColorsArray: string;
    class function GetStatusColorsObject: string;
    class function GetColorUtilityFunctions: string;
  public
    class function GetColorPaletteScript: string;
    class function GetCSSVariables: string;
  end;

implementation

class function TColorPaletteManager.GetDefaultColorScheme: TColorScheme;
begin
  Result.Primary := '#4e73df';
  Result.Success := '#1cc88a';
  Result.Info := '#36b9cc';
  Result.Warning := '#f6c23e';
  Result.Danger := '#e74a3b';
  Result.Secondary := '#858796';
end;

class function TColorPaletteManager.GetChartColorsArray: string;
begin
  Result :=
    '    this.chartColors = [' + sLineBreak +
    '      "rgba(78, 115, 223, 0.6)",' + sLineBreak +
    '      "rgba(28, 200, 138, 0.6)",' + sLineBreak +
    '      "rgba(54, 185, 204, 0.6)",' + sLineBreak +
    '      "rgba(246, 194, 62, 0.6)",' + sLineBreak +
    '      "rgba(231, 74, 59, 0.6)",' + sLineBreak +
    '      "rgba(133, 135, 150, 0.6)",' + sLineBreak +
    '      "rgba(105, 153, 255, 0.6)",' + sLineBreak +
    '      "rgba(45, 206, 137, 0.6)",' + sLineBreak +
    '      "rgba(66, 197, 216, 0.6)",' + sLineBreak +
    '      "rgba(247, 205, 92, 0.6)",' + sLineBreak +
    '      "rgba(235, 101, 88, 0.6)",' + sLineBreak +
    '      "rgba(151, 153, 166, 0.6)"' + sLineBreak +
    '    ];';
end;

class function TColorPaletteManager.GetStatusColorsObject: string;
var
  ColorScheme: TColorScheme;
begin
  ColorScheme := GetDefaultColorScheme;
  Result :=
    '    this.statusColors = {' + sLineBreak +
    Format('      "Concluído": "%s",', [ColorScheme.Success]) + sLineBreak +
    Format('      "Pendente": "%s",', [ColorScheme.Warning]) + sLineBreak +
    Format('      "Cancelado": "%s",', [ColorScheme.Danger]) + sLineBreak +
    Format('      "Em Andamento": "%s"', [ColorScheme.Info]) + sLineBreak +
    '    };';
end;

class function TColorPaletteManager.GetColorUtilityFunctions: string;
begin
  Result :=
    '    adjustOpacity(color, opacity) {' + sLineBreak +
    '      if (color.startsWith("#")) {' + sLineBreak +
    '        const r = parseInt(color.slice(1, 3), 16);' + sLineBreak +
    '        const g = parseInt(color.slice(3, 5), 16);' + sLineBreak +
    '        const b = parseInt(color.slice(5, 7), 16);' + sLineBreak +
    '        return `rgba(${r}, ${g}, ${b}, ${opacity})`;' + sLineBreak +
    '      }' + sLineBreak +
    '      return color.replace(/[\d.]+\)$/g, `${opacity})`);' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    generateGradient(ctx, color, startOpacity = 0.6, endOpacity = 0.1) {' + sLineBreak +
    '      const gradient = ctx.createLinearGradient(0, 0, 0, 400);' + sLineBreak +
    '      gradient.addColorStop(0, this.adjustOpacity(color, startOpacity));' + sLineBreak +
    '      gradient.addColorStop(1, this.adjustOpacity(color, endOpacity));' + sLineBreak +
    '      return gradient;' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    getRandomColor(opacity = 0.6) {' + sLineBreak +
    '      const color = this.chartColors[Math.floor(Math.random() * this.chartColors.length)];' + sLineBreak +
    '      return this.adjustOpacity(color, opacity);' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    getColorByIndex(index, opacity = 0.6) {' + sLineBreak +
    '      const color = this.chartColors[index % this.chartColors.length];' + sLineBreak +
    '      return this.adjustOpacity(color, opacity);' + sLineBreak +
    '    }';
end;

class function TColorPaletteManager.GetColorPaletteScript: string;
var
  ColorScheme: TColorScheme;
begin
  ColorScheme := GetDefaultColorScheme;
  Result :=
    'class ColorPaletteManager {' + sLineBreak +
    '  constructor() {' + sLineBreak +
    '    this.baseColors = {' + sLineBreak +
    Format('      primary: "%s",', [ColorScheme.Primary]) + sLineBreak +
    Format('      success: "%s",', [ColorScheme.Success]) + sLineBreak +
    Format('      info: "%s",', [ColorScheme.Info]) + sLineBreak +
    Format('      warning: "%s",', [ColorScheme.Warning]) + sLineBreak +
    Format('      danger: "%s",', [ColorScheme.Danger]) + sLineBreak +
    Format('      secondary: "%s"', [ColorScheme.Secondary]) + sLineBreak +
    '    };' + sLineBreak +
    '' + sLineBreak +
    GetChartColorsArray + sLineBreak +
    '' + sLineBreak +
    GetStatusColorsObject + sLineBreak +
    '  }' + sLineBreak +
    '' + sLineBreak +
    GetColorUtilityFunctions + sLineBreak +
    '}';
end;

class function TColorPaletteManager.GetCSSVariables: string;
var
  ColorScheme: TColorScheme;
begin
  ColorScheme := GetDefaultColorScheme;
  Result :=
    ':root {' + sLineBreak +
    Format('  --primary-color: %s;', [ColorScheme.Primary]) + sLineBreak +
    Format('  --success-color: %s;', [ColorScheme.Success]) + sLineBreak +
    Format('  --info-color: %s;', [ColorScheme.Info]) + sLineBreak +
    Format('  --warning-color: %s;', [ColorScheme.Warning]) + sLineBreak +
    Format('  --danger-color: %s;', [ColorScheme.Danger]) + sLineBreak +
    Format('  --secondary-color: %s;', [ColorScheme.Secondary]) + sLineBreak +
    '  --text-color: #333;' + sLineBreak +
    '  --background-color: #f8f9fc;' + sLineBreak +
    '  --border-color: rgba(0, 0, 0, 0.1);' + sLineBreak +
    '}';
end;

end.
