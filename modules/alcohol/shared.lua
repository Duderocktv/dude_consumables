-- Breathalyzer result descriptions based on BAC level
Config.BreathalyzerResults = {
    {
        min = 0,
        max = 4.9,
        description = "SOBER - No significant traces of alcohol detected."
    },
    {
        min = 5.0,
        max = 7.9,
        description = "IMPAIRED - Subject has consumed alcohol but is below legal limit."
    },
    {
        min = 8.0,
        max = 14.9,
        description = "INTOXICATED - Subject is legally drunk and should not drive."
    },
    {
        min = 15.0,
        max = 29.9,
        description = "HEAVILY INTOXICATED - Subject is showing significant impairment."
    },
    {
        min = 30.0,
        max = 100.0,
        description = "EXTREMELY INTOXICATED - Subject requires medical attention."
    }
}