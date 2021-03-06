cleanStorm <- function(storm) {
    require(plyr)
    
    storm$PROPDMGEXP <- revalue(as.character(storm$PROPDMGEXP), dmg.permitted)
    storm$EVTYPE     <- revalue(as.character(storm$EVTYPE), type.permitted)
    
    storm$PROPDMGEXP <- as.numeric(storm$PROPDMGEXP)
    storm$EVTYPE     <- factor(storm$EVTYPE)
    
    return(storm)
}

dmg.permitted <- c("m" = "1000000", "M" = "1000000", "K" = "1000", "B" = "1000000000",
                   "-" = NA, "?" = NA, "+" = NA, "0" = NA, "1" = NA, "2" = NA,"3" = NA, "4" = NA, "5" = NA, "6" = NA, "7" = NA, "8" = NA, "h" = NA, "H" = NA)
type.permitted <- c(
    "Mild and Dry Pattern" = NA,
    "MILD/DRY PATTERN" = NA,
    "MILD PATTERN" = NA,
    "MINOR FLOOD" = NA,
    "Minor Flooding" = NA,
    "MINOR FLOODING" = NA,
    "MIXED PRECIP" = NA,
    "Mixed Precipitation" = NA,
    "MIXED PRECIPITATION" = NA,
    "MODERATE SNOW" = NA,
    "MODERATE SNOWFALL" = NA,
    "MONTHLY PRECIPITATION" = NA,
    "Monthly Rainfall" = NA,
    "MONTHLY RAINFALL" = NA,
    "Monthly Snowfall" = NA,
    "MONTHLY SNOWFALL" = NA,
    "MONTHLY TEMPERATURE" = NA,
    "Mountain Snows" = NA,
    "FIRST FROST" = NA,
    "FIRST SNOW" = NA,
    "HEAVY MIX" = NA,
    "HIGH" = NA,
    "EARLY RAIN" = NA,
    "EARLY SNOW" = NA,
    "Early snowfall" = NA,
    "EARLY SNOWFALL" = NA,
    "EXCESSIVE" = NA,
    "EXCESSIVE WETNESS" = NA,
    "Wet Month" = NA,
    "WET SNOW" = NA,
    "WET WEATHER" = NA,
    "SOUTHEAST" = NA,
    "Temperature record" = NA,
    "UNUSUALLY LATE SNOW" = NA,
    "VOG" = NA,
    "WAKE LOW WIND" = NA,
    "Wet Year" = NA,
    "ABNORMALLY WET" = NA,
    "BELOW NORMAL PRECIPITATION" = NA,
    "EXTREMELY WET" = NA,
    "LACK OF SNOW" = NA,
    "NONE" = NA,
    "PATCHY ICE" = NA,
    "NORMAL PRECIPITATION" = NA,
    "NORTHERN LIGHTS" = NA,
    "No Severe Weather" = NA,
    "Other" = NA,
    "OTHER" = NA,
    "Marine Accident" = NA,
    "MARINE MISHAP" = NA,
    "Metro Storm, May 26" = NA,
    "?" = NA,
    "Summary August 10" = NA, 
    "Summary August 11" = NA,
    "Summary August 17" = NA,
    "Summary August 21" = NA,
    "Summary August 2-3" = NA,
    "Summary August 28" = NA,
    "Summary August 4" = NA,
    "Summary August 7" = NA,
    "Summary August 9" = NA,
    "Summary Jan 17" = NA,
    "Summary July 23-24" = NA,
    "Summary June 18-19" = NA,
    "Summary June 5-6" = NA,
    "Summary June 6" = NA,
    "Summary: Nov. 16" = NA,
    "Summary: Nov. 6-7" = NA,
    "Summary: Oct. 20-21" = NA,
    "Summary: October 31" = NA,
    "Summary of April 12" = NA,
    "Summary of April 13" = NA,
    "Summary of April 21" = NA,
    "Summary of April 27" = NA,
    "Summary of April 3rd" = NA,
    "Summary of August 1" = NA,
    "Summary of July 11" = NA,
    "Summary of July 2" = NA,
    "Summary of July 22" = NA,
    "Summary of July 26" = NA,
    "Summary of July 29" = NA,
    "Summary of July 3" = NA,
    "Summary of June 10" = NA,
    "Summary of June 11" = NA,
    "Summary of June 12" = NA,
    "Summary of June 13" = NA,
    "Summary of June 15" = NA,
    "Summary of June 16" = NA,
    "Summary of June 18" = NA,
    "Summary of June 23" = NA,
    "Summary of June 24" = NA,
    "Summary of June 3" = NA,
    "Summary of June 30" = NA,
    "Summary of June 4" = NA,
    "Summary of June 6" = NA,
    "Summary of March 14" = NA,
    "Summary of March 23" = NA,
    "Summary of March 24" = NA,
    "SUMMARY OF MARCH 24-25" = NA,
    "SUMMARY OF MARCH 27" = NA,
    "SUMMARY OF MARCH 29" = NA,
    "Summary of May 10" = NA,
    "Summary of May 13" = NA,
    "Summary of May 14" = NA,
    "Summary of May 22" = NA,
    "Summary of May 22 am" = NA,
    "Summary of May 22 pm" = NA,
    "Summary of May 26 am" = NA,
    "Summary of May 26 pm" = NA,
    "Summary of May 31 am" = NA,
    "Summary of May 31 pm" = NA,
    "Summary of May 9-10" = NA,
    "Summary: Sept. 18" = NA,
    "Summary Sept. 25-26" = NA,
    "Summary September 20" = NA,
    "Summary September 23" = NA,
    "Summary September 3" = NA,
    "Summary September 4" = NA,
    "APACHE COUNTY" = NA,
    "RAIN/SNOW" = NA,
    "Record High" = NA,
    "RECORD HIGH" = NA,
    "RECORD LOW" = NA,
    "RECORD LOW RAINFALL" = NA,
    "Record temperature" = NA,
    "RECORD TEMPERATURE" = NA,
    "Record Temperatures" = NA,
    "RECORD TEMPERATURES" = NA,
    "RED FLAG CRITERIA" = NA,
    "RED FLAG FIRE WX" = NA,
    "REMNANTS OF FLOYD" = NA,
    "ROCK SLIDE" = NA,
    "ROGUE WAVE" = NA,
    "MARINE STRONG WIND" = "Marine Strong Wind",
    "MARINE THUNDERSTORM WIND" = "Marine Thunderstorm Wind",
    "MARINE TSTM WIND" = "Marine Thunderstorm Wind",
    "MARINE HAIL" = "Marine Hail",
    "MARINE HIGH WIND" = "Marine High Wind",
    "ASTRONOMICAL LOW TIDE" = "Astronomical Low Tide",
    "ABNORMAL WARMTH" = "Heat",
    "HEAT" = "Heat",
    "Heatburst" = "Heat",
    "HEAT DROUGHT" = "Drought",
    "HEAT/DROUGHT" = "Drought",
    "Heat Wave" = "Heat",
    "HEAT WAVE" = "Heat",
    "HEAT WAVE DROUGHT" = "Drought",
    "HEAT WAVES" = "Heat",
    "ABNORMALLY DRY" = "Drought",
    "AVALANCE" = "Avalanche",
    "AVALANCHE" = "Avalanche",
    "BEACH EROSIN" = "Coastal Flood",
    "Beach Erosion" = "Coastal Flood",
    "BEACH EROSION" = "Coastal Flood",
    "BEACH EROSION/COASTAL FLOOD" = "Coastal Flood",
    "BEACH FLOOD" = "Coastal Flood",
    "COASTAL EROSION" = "Coastal Flood",
    "Coastal Flood" = "Coastal Flood",
    "COASTALFLOOD" = "Coastal Flood",
    " COASTAL FLOOD" = "Coastal Flood",
    "COASTAL FLOOD" = "Coastal Flood",
    "coastal flooding" = "Coastal Flood",
    "Coastal Flooding" = "Coastal Flood",
    "COASTAL FLOODING" = "Coastal Flood",
    "COASTAL  FLOODING/EROSION" = "Coastal Flood",
    "COASTAL FLOODING/EROSION" = "Coastal Flood",
    "ASTRONOMICAL HIGH TIDE" = "Coastal Flood",
    "Coastal Storm" = "Storm Surge/Tide",
    "COASTALSTORM" = "Storm Surge/Tide",
    "COASTAL STORM" = "Storm Surge/Tide",
    "COASTAL SURGE" = "Storm Surge/Tide",
    "COASTAL/TIDAL FLOOD" = "Storm Surge/Tide",
    "BLIZZARD" = "Blizzard",
    "BLIZZARD AND EXTREME WIND CHIL" = "Blizzard",
    "BLIZZARD AND HEAVY SNOW" = "Blizzard",
    "BLIZZARD/FREEZING RAIN" = "Blizzard",
    "BLIZZARD/HEAVY SNOW" = "Blizzard",
    "BLIZZARD/HIGH WIND" = "Blizzard",
    "Blizzard Summary" = "Blizzard",
    "BLIZZARD WEATHER" = "Blizzard",
    "BLIZZARD/WINTER STORM" = "Blizzard",
    "Cold" = "Cold/Wind Chill",
    "COLD" = "Cold/Wind Chill",
    "COLD AIR FUNNEL" = "Cold/Wind Chill",
    "COLD AIR FUNNELS" = "Cold/Wind Chill",
    "COLD AIR TORNADO" = "Tornado",
    "FROST\\FREEZE" = "Cold/Wind Chill",
    "Cold and Frost" = "Cold/Wind Chill",
    "COLD AND FROST" = "Cold/Wind Chill",
    "SNOW\\COLD" = "Cold/Wind Chill",
    "COLD AND SNOW" = "Cold/Wind Chill",
    "COLD AND WET CONDITIONS" = "Cold/Wind Chill",
    "Cold Temperature" = "Cold/Wind Chill",
    "COLD TEMPERATURES" = "Cold/Wind Chill",
    "COLD WAVE" = "Cold/Wind Chill",
    "COLD WEATHER" = "Cold/Wind Chill",
    "COLD/WIND CHILL" = "Cold/Wind Chill",
    "COLD WIND CHILL TEMPERATURES" = "Cold/Wind Chill",
    "COLD/WINDS" = "Cold/Wind Chill",
    "COOL AND WET" = "Cold/Wind Chill",
    "COOL SPELL" = "Cold/Wind Chill",
    "CSTL FLOODING/EROSION" = "Coastal Flood",
    "Damaging Freeze" = "Frost/Freeze",
    "DAMAGING FREEZE" = "Frost/Freeze",
    "BITTER WIND CHILL" = "Cold/Wind Chill",
    "BITTER WIND CHILL TEMPERATURES" = "Cold/Wind Chill",
    "blowing snow" = "Heavy Snow",
    "Blowing Snow" = "Heavy Snow",
    "BLOWING SNOW" = "Heavy Snow",
    "BLOWING SNOW & EXTREME WIND CH" = "Heavy Snow",
    "BLOWING SNOW- EXTREME WIND CHI" = "Heavy Snow",
    "BLOWING SNOW/EXTREME WIND CHIL" = "Heavy Snow",
    "DAM BREAK" = "Flash Flood",
    "DAM FAILURE" = "Flash Flood",
    "DROUGHT" = "Drought",
    "DROUGHT/EXCESSIVE HEAT" = "Drought",
    "DROWNING" = "Drought",
    "DRY" = "Drought",
    "DRY CONDITIONS" = "Drought",
    "DRY HOT WEATHER" = "Drought",
    "DRY MICROBURST" = "Drought",
    "DRY MICROBURST 50" = "Drought",
    "DRY MICROBURST 53" = "Drought",
    "DRY MICROBURST 58" = "Drought",
    "DRY MICROBURST 61" = "Drought",
    "DRY MICROBURST 84" = "Drought",
    "DRY MICROBURST WINDS" = "Drought",
    "DRY MIRCOBURST WINDS" = "Drought",
    "DRYNESS" = "Drought",
    "DRY PATTERN" = "Drought",
    "DRY SPELL" = "Drought",
    "DRY WEATHER" = "Drought",
    "DUST DEVEL" = "Dust Devil",
    "Dust Devil" = "Dust Devil",
    "DUST DEVIL" = "Dust Devil",
    "DUST DEVIL WATERSPOUT" = "Dust Devil",
    "DUSTSTORM" = "Dust Storm",
    "DUST STORM" = "Dust Storm",
    "DUST STORM/HIGH WINDS" = "Dust Storm",
    "EXCESSIVE HEAT/DROUGHT" = "Drought",
    "EXCESSIVE HEAT" = "Excessive Heat",
    "EXCESSIVELY DRY" = "Excessive Heat",
    "Extended Cold" = "Extreme Cold/Wind Chill",
    "Extreme Cold" = "Extreme Cold/Wind Chill",
    "EXTREME COLD" = "Extreme Cold/Wind Chill",
    "EXTREME COLD/WIND CHILL" = "Extreme Cold/Wind Chill",
    "EXTREME/RECORD COLD" = "Extreme Cold/Wind Chill",
    "EXTREME WINDCHILL" = "Extreme Cold/Wind Chill",
    "EXTREME WIND CHILL" = "Extreme Cold/Wind Chill",
    "EXTREME WIND CHILL/BLOWING SNO" = "Extreme Cold/Wind Chill",
    "EXTREME WIND CHILLS" = "Extreme Cold/Wind Chill",
    "EXTREME WINDCHILL TEMPERATURES" = "Extreme Cold/Wind Chill",
    "EXTREME HEAT" = "Excessive Heat",
    " FLASH FLOOD" = "Flash Flood",
    "FLASH FLOOD" = "Flash Flood",
    "FLASH FLOOD/" = "Flash Flood",
    "FLASH FLOOD/FLOOD" = "Flash Flood",
    "FLASH FLOOD/ FLOOD" = "Flash Flood",
    "FLASH FLOOD FROM ICE JAMS" = "Flash Flood",
    "FLASH FLOOD - HEAVY RAIN" = "Flash Flood",
    "FLASH FLOOD/HEAVY RAIN" = "Flash Flood",
    "FLASH FLOODING" = "Flash Flood",
    "FLASH FLOODING/FLOOD" = "Flash Flood",
    "FLASH FLOODING/THUNDERSTORM WI" = "Flash Flood",
    "FLASH FLOOD/LANDSLIDE" = "Flash Flood",
    "FLASH FLOOD LANDSLIDES" = "Flash Flood",
    "FLASH FLOODS" = "Flash Flood",
    "FLASH FLOOD/ STREET" = "Flash Flood",
    "FLASH FLOOD WINDS" = "Flash Flood",
    "FLASH FLOOODING" = "Flash Flood",
    "FLOOD FLASH" = "Flash Flood",
    "FLOOD/FLASH" = "Flash Flood",
    "Flood/Flash Flood" = "Flash Flood",
    "FLOOD/FLASHFLOOD" = "Flash Flood",
    "FLOOD/FLASH FLOOD" = "Flash Flood",
    "FLOOD/FLASH/FLOOD" = "Flash Flood",
    "FLOOD/FLASH FLOODING" = "Flash Flood",
    "FLOOD FLOOD/FLASH" = "Flash Flood",
    "Flood" = "Flood",
    "FLOOD" = "Flood",
    "FLOOD & HEAVY RAIN" = "Flood",
    "FLOODING" = "Flood",
    "FLOODING/HEAVY RAIN" = "Flood",
    "FLOOD/RAIN/WIND" = "Flood",
    "FLOOD/RAIN/WINDS" = "Flood",
    "FLOOD/RIVER FLOOD" = "Flood",
    "FLOODS" = "Flood",
    "Flood/Strong Wind" = "Flood",
    "FLOOD WATCH/" = "Flood",
    "Freezing rain" = "Frost/Freeze",
    "Freezing Rain" = "Frost/Freeze",
    "FREEZING RAIN" = "Frost/Freeze",
    "FREEZING RAIN AND SLEET" = "Frost/Freeze",
    "FREEZING RAIN AND SNOW" = "Frost/Freeze",
    "FREEZING RAIN/SLEET" = "Frost/Freeze",
    "FREEZING RAIN SLEET AND" = "Frost/Freeze",
    "FREEZING RAIN SLEET AND LIGHT" = "Frost/Freeze",
    "FREEZING RAIN/SNOW" = "Frost/Freeze",
    "Freezing Spray" = "Frost/Freeze",
    "Frost" = "Frost/Freeze",
    "FROST" = "Frost/Freeze",
    "Frost/Freeze" = "Frost/Freeze",
    "FROST/FREEZE" = "Frost/Freeze",
    "Freeze" = "Frost/Freeze",
    "FREEZE" = "Frost/Freeze",
    "Freezing drizzle" = "Frost/Freeze",
    "Freezing Drizzle" = "Frost/Freeze",
    "FREEZING DRIZZLE" = "Frost/Freeze",
    "FREEZING DRIZZLE AND FREEZING" = "Frost/Freeze",
    "Freezing Fog" = "Freezing Fog",
    "FREEZING FOG" = "Freezing Fog",
    "FUNNEL" = "Funnel Cloud",
    "Funnel Cloud" = "Funnel Cloud",
    "FUNNEL CLOUD" = "Funnel Cloud",
    "FUNNEL CLOUD." = "Funnel Cloud",
    "FUNNEL CLOUD/HAIL" = "Funnel Cloud",
    "FUNNEL CLOUDS" = "Funnel Cloud",
    "FUNNELS" = "Funnel Cloud",
    "Glaze" = "Ice Storm",
    "GLAZE" = "Ice Storm",
    "GLAZE ICE" = "Ice Storm",
    "GLAZE/ICE STORM" = "Ice Storm",
    "gradient wind" = "High Wind",
    "Gradient wind" = "High Wind",
    "GRADIENT WIND" = "High Wind",
    "GRADIENT WINDS" = "High Wind",
    "GRASS FIRES" = "Wildfire",
    "GROUND BLIZZARD" = "Blizzard",
    "GUSTNADO" = "High Wind",
    "GUSTNADO AND" = "High Wind",
    "GUSTY LAKE WIND" = "High Wind",
    "GUSTY THUNDERSTORM WIND" = "Thunderstorm Wind",
    "GUSTY THUNDERSTORM WINDS" = "Thunderstorm Wind",
    "Gusty Wind" = "High Wind",
    "GUSTY WIND" = "High Wind",
    "GUSTY WIND/HAIL" = "Hail",
    "GUSTY WIND/HVY RAIN" = "Heavy Rain",
    "Gusty wind/rain" = "Heavy Rain",
    "Gusty winds" = "High Wind",
    "Gusty Winds" = "High Wind",
    "GUSTY WINDS" = "High Wind",
    "HAIL" = "Hail",
    "Hail(0.75)" = "Hail",
    "HAIL 075" = "Hail",
    "HAIL 0.75" = "Hail",
    "HAIL 088" = "Hail",
    "HAIL 0.88" = "Hail",
    "HAIL 100" = "Hail",
    "HAIL 1.00" = "Hail",
    "HAIL 125" = "Hail",
    "HAIL 150" = "Hail",
    "HAIL 175" = "Hail",
    "HAIL 1.75" = "Hail",
    "HAIL 1.75)" = "Hail",
    "HAIL 200" = "Hail",
    "HAIL 225" = "Hail",
    "HAIL 275" = "Hail",
    "HAIL 450" = "Hail",
    "HAIL 75" = "Hail",
    "HAIL 80" = "Hail",
    "HAIL 88" = "Hail",
    "HAIL ALOFT" = "Hail",
    "HAIL DAMAGE" = "Hail",
    "HAIL FLOODING" = "Flood",
    "HAIL/ICY ROADS" = "Frost/Freeze",
    "HAILSTORM" = "Hail",
    "HAIL STORM" = "Hail",
    "HAILSTORMS" = "Hail",
    "HAIL/WIND" = "Hail",
    "HAIL/WINDS" = "Hail",
    "EARLY FREEZE" = "Frost/Freeze",
    "Early Frost" = "Frost/Freeze",
    "EARLY FROST" = "Frost/Freeze",
    "Erosion/Cstl Flood" = "Coastal Flood",
    "Excessive Cold" = "Extreme Cold/Wind Chill",
    "EXCESSIVE PRECIPITATION" = "Heavy Rain",
    "EXCESSIVE RAIN" = "Heavy Rain",
    "EXCESSIVE RAINFALL" = "Heavy Rain",
    "EXCESSIVE SNOW" = "Heavy Snow",
    "FOG" = "Freezing Fog",
    "FOG AND COLD TEMPERATURES" = "Freezing Fog",
    "HEAVY PRECIPATATION" = "Heavy Rain",
    "Heavy Precipitation" = "Heavy Rain",
    "HEAVY PRECIPITATION" = "Heavy Rain",
    "Heavy rain" = "Heavy Rain",
    "Heavy Rain" = "Heavy Rain",
    "HEAVY RAIN" = "Heavy Rain",
    "HEAVY RAIN AND FLOOD" = "Flood",
    "Heavy Rain and Wind" = "Heavy Rain",
    "HEAVY RAIN EFFECTS" = "Heavy Rain",
    "HEAVY RAINFALL" = "Heavy Rain",
    "HEAVY RAIN/FLOODING" = "Flood",
    "Heavy Rain/High Surf" = "Heavy Rain",
    "HEAVY RAIN/LIGHTNING" = "Heavy Rain",
    "HEAVY RAIN/MUDSLIDES/FLOOD" = "Flood",
    "HEAVY RAINS" = "Heavy Rain",
    "HEAVY RAIN/SEVERE WEATHER" = "Heavy Rain",
    "HEAVY RAINS/FLOODING" = "Flood",
    "HEAVY RAIN/SMALL STREAM URBAN" = "Heavy Rain",
    "HEAVY RAIN/SNOW" = "Heavy Snow",
    "HEAVY RAIN/URBAN FLOOD" = "Flood",
    "HEAVY RAIN; URBAN FLOOD WINDS;" = "Flood",
    "HEAVY RAIN/WIND" = "Heavy Rain",
    "HEAVY SEAS" = "Marine High Wind",
    "HEAVY SHOWER" = "Heavy Rain",
    "HEAVY SHOWERS" = "Heavy Rain",
    "HEAVY SNOW" = "Heavy Snow",
    "HEAVY SNOW AND" = "Heavy Snow",
    "HEAVY SNOW ANDBLOWING SNOW" = "Heavy Snow",
    "HEAVY SNOW AND HIGH WINDS" = "Heavy Snow",
    "HEAVY SNOW AND ICE" = "Heavy Snow",
    "HEAVY SNOW AND ICE STORM" = "Ice Storm",
    "HEAVY SNOW AND STRONG WINDS" = "Heavy Snow",
    "HEAVY SNOW/BLIZZARD" = "Blizzard",
    "HEAVY SNOW/BLIZZARD/AVALANCHE" = "Avalanche",
    "HEAVY SNOW/BLOWING SNOW" = "Heavy Snow",
    "HEAVY SNOW   FREEZING RAIN" = "Heavy Snow",
    "HEAVY SNOW/FREEZING RAIN" = "Heavy Snow",
    "HEAVY SNOW/HIGH" = "Heavy Snow",
    "HEAVY SNOW/HIGH WIND" = "Heavy Snow",
    "HEAVY SNOW/HIGH WINDS" = "Heavy Snow",
    "HEAVY SNOW/HIGH WINDS & FLOOD" = "Heavy Snow",
    "HEAVY SNOW/HIGH WINDS/FREEZING" = "Heavy Snow",
    "HEAVY SNOW & ICE" = "Heavy Snow",
    "HEAVY SNOW/ICE" = "Heavy Snow",
    "HEAVY SNOW/ICE STORM" = "Ice Storm",
    "HEAVY SNOWPACK" = "Heavy Snow",
    "Heavy snow shower" = "Heavy Snow",
    "HEAVY SNOW/SLEET" = "Heavy Snow",
    "HEAVY SNOW SQUALLS" = "Heavy Snow",
    "HEAVY SNOW-SQUALLS" = "Heavy Snow",
    "HEAVY SNOW/SQUALLS" = "Heavy Snow",
    "HEAVY SNOW/WIND" = "Heavy Snow",
    "HEAVY SNOW/WINTER STORM" = "Winter Storm",
    "High Surf" = "High Surf",
    "HIGH SURF" = "High Surf",
    "HIGH SURF ADVISORIES" = "High Surf",
    "   HIGH SURF ADVISORY" = "High Surf",
    "HIGH SURF ADVISORY" = "High Surf",
    "HIGH SWELLS" = "High Surf",
    "HIGH  SWELLS" = "High Surf",
    "HIGH TEMPERATURE RECORD" = "Excessive Heat",
    "HIGH TIDES" = "High Surf",
    "HIGH WATER" = "High Surf",
    "HIGH WAVES" = "High Surf",
    "HIGH SEAS" = "Marine High Wind",
    "Heavy Surf" = "High Surf",
    "HEAVY SURF" = "High Surf",
    "Heavy surf and wind" = "High Surf",
    "HEAVY SURF COASTAL FLOODING" = "Coastal Flood",
    "HEAVY SURF/HIGH SURF" = "High Surf",
    "HEAVY SWELLS" = "High Surf",
    "HEAVY WET SNOW" = "Heavy Snow",
    "HAZARDOUS SURF" = "High Surf",
    "HIGHWAY FLOODING" = "Flood",
    "High Wind" = "High Wind",
    "HIGH WIND" = "High Wind",
    "HIGH WIND 48" = "High Wind",
    "HIGH WIND 63" = "High Wind",
    "HIGH WIND 70" = "High Wind",
    "HIGH WIND AND HEAVY SNOW" = "Heavy Snow",
    "HIGH WIND AND HIGH TIDES" = "High Surf",
    "HIGH WIND AND SEAS" = "High Wind",
    "HIGH WIND/BLIZZARD" = "Blizzard",
    "HIGH WIND/ BLIZZARD" = "Blizzard",
    "HIGH WIND/BLIZZARD/FREEZING RA" = "Blizzard",
    "HIGH WIND DAMAGE" = "High Wind",
    "HIGH WIND (G40)" = "High Wind",
    "HIGH WIND/HEAVY SNOW" = "Heavy Snow",
    "HIGH WIND/LOW WIND CHILL" = "Extreme Cold/Wind Chill",
    "HIGH WINDS" = "High Wind",
    "HIGH  WINDS" = "High Wind",
    "HIGH WINDS/" = "High Wind",
    "HIGH WINDS 55" = "High Wind",
    "HIGH WINDS 57" = "High Wind",
    "HIGH WINDS 58" = "High Wind",
    "HIGH WINDS 63" = "High Wind",
    "HIGH WINDS 66" = "High Wind",
    "HIGH WINDS 67" = "High Wind",
    "HIGH WINDS 73" = "High Wind",
    "HIGH WINDS 76" = "High Wind",
    "HIGH WINDS 80" = "High Wind",
    "HIGH WINDS 82" = "High Wind",
    "HIGH WINDS AND WIND CHILL" = "High Wind",
    "HIGH WINDS/COASTAL FLOOD" = "Coastal Flood",
    "HIGH WINDS/COLD" = "High Wind",
    "HIGH WINDS DUST STORM" = "Dust Storm",
    "HIGH WIND/SEAS" = "High Wind",
    "HIGH WINDS/FLOODING" = "Flood",
    "HIGH WINDS/HEAVY RAIN" = "Heavy Rain",
    "HIGH WINDS HEAVY RAINS" = "Heavy Rain",
    "HIGH WINDS/SNOW" = "Heavy Snow",
    "HIGH WIND/WIND CHILL" = "Extreme Cold/Wind Chill",
    "HIGH WIND/WIND CHILL/BLIZZARD" = "Blizzard",
    "Hot and Dry" = "Excessive Heat",
    "HOT/DRY PATTERN" = "Excessive Heat",
    "HOT PATTERN" = "Excessive Heat",
    "HOT SPELL" = "Excessive Heat",
    "HOT WEATHER" = "Excessive Heat",
    "HURRICANE" = "Hurricane (Typhoon)",
    "Hurricane Edouard" = "Hurricane (Typhoon)",
    "HURRICANE EMILY" = "Hurricane (Typhoon)",
    "HURRICANE ERIN" = "Hurricane (Typhoon)",
    "HURRICANE FELIX" = "Hurricane (Typhoon)",
    "HURRICANE-GENERATED SWELLS" = "Hurricane (Typhoon)",
    "HURRICANE GORDON" = "Hurricane (Typhoon)",
    "HURRICANE OPAL" = "Hurricane (Typhoon)",
    "HURRICANE OPAL/HIGH WINDS" = "Hurricane (Typhoon)",
    "HURRICANE/TYPHOON" = "Hurricane (Typhoon)",
    "HVY RAIN" = "Heavy Rain",
    "HYPERTHERMIA/EXPOSURE" = "Excessive Heat",
    "HYPOTHERMIA" = "Extreme Cold/Wind Chill",
    "Hypothermia/Exposure" = "Extreme Cold/Wind Chill",
    "HYPOTHERMIA/EXPOSURE" = "Extreme Cold/Wind Chill",
    "ICE" = "Frost/Freeze",
    "ICE AND SNOW" = "Frost/Freeze",
    "ICE FLOES" = "Frost/Freeze",
    "Ice Fog" = "Frost/Freeze",
    "ICE JAM" = "Frost/Freeze",
    "ICE JAM FLOODING" = "Frost/Freeze",
    "Ice jam flood (minor" = "Frost/Freeze",
    "ICE ON ROAD" = "Frost/Freeze",
    "ICE PELLETS" = "Frost/Freeze",
    "ICE ROADS" = "Frost/Freeze",
    "Ice/Snow" = "Frost/Freeze",
    "ICE/SNOW" = "Frost/Freeze",
    "ICE STORM" = "Ice Storm",
    "ICE STORM AND SNOW" = "Ice Storm",
    "Icestorm/Blizzard" = "Blizzard",
    "ICE STORM/FLASH FLOOD" = "Ice Storm",
    "ICE/STRONG WINDS" = "Ice Storm",
    "Icy Roads" = "Frost/Freeze",
    "ICY ROADS" = "Frost/Freeze",
    "Lake Effect Snow" = "Lake-Effect Snow",
    "LAKE EFFECT SNOW" = "Lake-Effect Snow",
    "LAKE-EFFECT SNOW" = "Lake-Effect Snow",
    "LAKE FLOOD" = "Lakeshore Flood",
    "LAKESHORE FLOOD" = "Lakeshore Flood",
    "LANDSLIDE" = "Debris Flow",
    "LANDSLIDES" = "Debris Flow",
    "LANDSLIDE/URBAN FLOOD" = "Debris Flow",
    "Landslump" = "Debris Flow",
    "LANDSLUMP" = "Debris Flow",
    "LANDSPOUT" = "Debris Flow",
    "LIGHTING" = "Lightning",
    "LIGHTNING" = "Lightning",
    " LIGHTNING" = "Lightning",
    "LIGHTNING." = "Lightning",
    "LIGHTNING AND HEAVY RAIN" = "Lightning",
    "LIGHTNING AND THUNDERSTORM WIN" = "Thunderstorm Wind",
    "LIGHTNING AND WINDS" = "Lightning",
    "LIGHTNING DAMAGE" = "Lightning",
    "LIGHTNING FIRE" = "Lightning",
    "LIGHTNING/HEAVY RAIN" = "Lightning",
    "LIGHTNING INJURY" = "Lightning",
    "LIGHTNING THUNDERSTORM WINDS" = "Thunderstorm Wind",
    "LIGHTNING THUNDERSTORM WINDSS" = "Thunderstorm Wind",
    "LIGHTNING  WAUSEON" = "Lightning",
    "LIGNTNING" = "Lightning",
    "LOCAL FLASH FLOOD" = "Flash Flood",
    "LOCAL FLOOD" = "Flash Flood",
    "LIGHT SNOW AND SLEET" = "Sleet",
    "LOCALLY HEAVY RAIN" = "Heavy Rain",
    "LOW TEMPERATURE" = "Cold/Wind Chill",
    "LOW TEMPERATURE RECORD" = "Extreme Cold/Wind Chill",
    "LOW WIND CHILL" = "Cold/Wind Chill",
    "MAJOR FLOOD" = "Flood",
    "Microburst" = "Thunderstorm Wind",
    "MICROBURST" = "Thunderstorm Wind",
    "MICROBURST WINDS" = "Thunderstorm Wind",
    "MUD/ROCK SLIDE" = "Debris Flow",
    "Mudslide" = "Debris Flow",
    "MUDSLIDE" = "Debris Flow",
    "MUD SLIDE" = "Debris Flow",
    "MUDSLIDE/LANDSLIDE" = "Debris Flow",
    "Mudslides" = "Debris Flow",
    "MUDSLIDES" = "Debris Flow",
    "MUD SLIDES" = "Debris Flow",
    "RAINSTORM" = "Heavy Rain",
    "RAIN/WIND" = "Heavy Rain",
    "RAIN" = "Heavy Rain",
    "RAIN AND WIND" = "Heavy Rain",
    "Rain Damage" = "Heavy Rain",
    "RAIN (HEAVY)" = "Heavy Rain",
    "Record Cold" = "Extreme Cold/Wind Chill",
    "RECORD COLD" = "Extreme Cold/Wind Chill",
    "RECORD  COLD" = "Extreme Cold/Wind Chill",
    "RECORD COLD AND HIGH WIND" = "Extreme Cold/Wind Chill",
    "RECORD COLD/FROST" = "Extreme Cold/Wind Chill",
    "RECORD COOL" = "Extreme Cold/Wind Chill",
    "RECORD/EXCESSIVE HEAT" = "Excessive Heat",
    "RECORD/EXCESSIVE RAINFALL" = "Heavy Rain",
    "Record Heat" = "Excessive Heat",
    "RECORD HEAT" = "Excessive Heat",
    "RECORD HEAT WAVE" = "Excessive Heat",
    "Record dry month" = "Excessive Heat",
    "RECORD HIGH TEMPERATURE" = "Excessive Heat",
    "RECORD HIGH TEMPERATURES" = "Excessive Heat",
    "RECORD PRECIPITATION" = "Excessive Heat",
    "RECORD RAINFALL" = "Excessive Heat",
    "Record May Snow" = "Heavy Snow",
    "RECORD SNOW" = "Heavy Snow",
    "RECORD SNOW/COLD" = "Heavy Snow",
    "RECORD SNOWFALL" = "Heavy Snow",
    "Record Winter Snow" = "Heavy Snow",
    "RECORD WARM" = "Excessive Heat",
    "RECORD WARM TEMPS." = "Excessive Heat",
    "Record Warmth" = "Excessive Heat",
    "RECORD WARMTH" = "Excessive Heat",
    "RIP CURRENT" = "Rip Current",
    "RIP CURRENTS" = "Rip Current",
    "RIP CURRENTS HEAVY SURF" = "High Surf",
    "RIP CURRENTS/HEAVY SURF" = "High Surf",
    "RAPIDLY RISING WATER" = "Flash Flood",
    "RECORD DRYNESS" = "Excessive Heat",
    "RIVER AND STREAM FLOOD" = "Flood",
    "RIVER FLOOD" = "Flood",
    "River Flooding" = "Flood",
    "RIVER FLOODING" = "Flood",
    "RURAL FLOOD" = "Flood",
    "ROUGH SEAS" = "High Surf",
    "ROUGH SURF" = "High Surf",
    "ROTATING WALL CLOUD" = "Funnel Cloud",
    "Saharan Dust" = "Dust Storm",
    "SAHARAN DUST" = "Dust Storm",
    "Seasonal Snowfall" = "Heavy Snow",
    "SEICHE" = "Seiche",
    "SEVERE COLD" = "Extreme Cold/Wind Chill",
    "SEVERE THUNDERSTORM" = "Thunderstorm Wind",
    "SEVERE THUNDERSTORMS" = "Thunderstorm Wind",
    "SEVERE THUNDERSTORM WINDS" = "Thunderstorm Wind",
    "SEVERE TURBULENCE" = "Thunderstorm Wind",
    "SLEET" = "Sleet",
    "SLEET & FREEZING RAIN" = "Sleet",
    "SLEET/FREEZING RAIN" = "Sleet",
    "SLEET/ICE STORM" = "Ice Storm",
    "SLEET/RAIN/SNOW" = "Sleet",
    "SLEET/SNOW" = "Sleet",
    "SLEET STORM" = "Ice Storm",
    "small hail" = "Hail",
    "Small Hail" = "Hail",
    "SMALL HAIL" = "Hail",
    "SMALL STREAM" = "Hail",
    "SMALL STREAM AND" = "Hail",
    "SMALL STREAM AND URBAN FLOOD" = "Flash Flood",
    "SMALL STREAM AND URBAN FLOODIN" = "Flash Flood",
    "SMALL STREAM FLOOD" = "Flash Flood",
    "SMALL STREAM FLOODING" = "Flash Flood",
    "SMALL STREAM URBAN FLOOD" = "Flash Flood",
    "SMALL STREAM/URBAN FLOOD" = "Flash Flood",
    "Sml Stream Fld" = "Flash Flood",
    "SMOKE" = "Dense Smoke",
    "Snow" = "Heavy Snow",
    "SNOW" = "Heavy Snow",
    "Snow Accumulation" = "Heavy Snow",
    "SNOW ACCUMULATION" = "Heavy Snow",
    "SNOW ADVISORY" = "Heavy Snow",
    "SNOW AND COLD" = "Heavy Snow",
    "SNOW AND HEAVY SNOW" = "Heavy Snow",
    "Snow and Ice" = "Heavy Snow",
    "SNOW AND ICE" = "Heavy Snow",
    "SNOW AND ICE STORM" = "Ice Storm",
    "Snow and sleet" = "Sleet",
    "SNOW AND SLEET" = "Sleet",
    "SNOW AND WIND" = "Heavy Snow",
    "SNOW/ BITTER COLD" = "Heavy Snow",
    "SNOW/BLOWING SNOW" = "Heavy Snow",
    "SNOW/COLD" = "Heavy Snow",
    "SNOW DROUGHT" = "Heavy Snow",
    "SNOWFALL RECORD" = "Heavy Snow",
    "SNOW FREEZING RAIN" = "Heavy Snow",
    "SNOW/FREEZING RAIN" = "Heavy Snow",
    "SNOW/HEAVY SNOW" = "Heavy Snow",
    "SNOW/HIGH WINDS" = "Heavy Snow",
    "SNOW- HIGH WIND- WIND CHILL" = "Heavy Snow",
    "SNOW/ICE" = "Heavy Snow",
    "SNOW/ ICE" = "Heavy Snow",
    "SNOW/ICE STORM" = "Ice Storm",
    "SNOWMELT FLOODING" = "Heavy Snow",
    "SNOW/RAIN" = "Heavy Snow",
    "SNOW/RAIN/SLEET" = "Sleet",
    "SNOW SHOWERS" = "Heavy Snow",
    "SNOW SLEET" = "Sleet",
    "SNOW/SLEET" = "Sleet",
    "SNOW/SLEET/FREEZING RAIN" = "Sleet",
    "SNOW/SLEET/RAIN" = "Sleet",
    "SNOW SQUALL" = "Heavy Snow",
    "Snow squalls" = "Heavy Snow",
    "Snow Squalls" = "Heavy Snow",
    "SNOW SQUALLS" = "Heavy Snow",
    "SNOWSTORM" = "Heavy Snow",
    "STORM FORCE WINDS" = "Thunderstorm Wind",
    "STORM SURGE" = "Storm Surge/Tide",
    "STORM SURGE/TIDE" = "Storm Surge/Tide",
    "STREAM FLOODING" = "Flash Flood",
    "STREET FLOOD" = "Flash Flood",
    "STREET FLOODING" = "Flash Flood",
    "Strong Wind" = "Strong Wind",
    "STRONG WIND" = "Strong Wind",
    "STRONG WIND GUST" = "Strong Wind",
    "Strong winds" = "Strong Wind",
    "Strong Winds" = "Strong Wind",
    "STRONG WINDS" = "Strong Wind",
    "THUDERSTORM WINDS" = "Thunderstorm Wind",
    "THUNDEERSTORM WINDS" = "Thunderstorm Wind",
    "THUNDERESTORM WINDS" = "Thunderstorm Wind",
    "THUNDERSNOW" = "Thunderstorm Wind",
    "Thundersnow shower" = "Heavy Snow",
    "THUNDERSTORM" = "Thunderstorm Wind",
    "THUNDERSTORM DAMAGE" = "Thunderstorm Wind",
    "THUNDERSTORM DAMAGE TO" = "Thunderstorm Wind",
    "THUNDERSTORM HAIL" = "Hail",
    "THUNDERSTORMS" = "Thunderstorm Wind",
    "THUNDERSTORMS WIND" = "Thunderstorm Wind",
    "THUNDERSTORMS WINDS" = "Thunderstorm Wind",
    "THUNDERSTORMW" = "Thunderstorm Wind",
    "THUNDERSTORMW 50" = "Thunderstorm Wind",
    "Thunderstorm Wind" = "Thunderstorm Wind",
    "THUNDERSTORM WIND" = "Thunderstorm Wind",
    "THUNDERSTORM WIND." = "Thunderstorm Wind",
    "THUNDERSTORM WIND 50" = "Thunderstorm Wind",
    "THUNDERSTORM WIND 52" = "Thunderstorm Wind",
    "THUNDERSTORM WIND 56" = "Thunderstorm Wind",
    "THUNDERSTORM WIND 59" = "Thunderstorm Wind",
    "THUNDERSTORM WIND 59 MPH" = "Thunderstorm Wind",
    "THUNDERSTORM WIND 59 MPH." = "Thunderstorm Wind",
    "THUNDERSTORM WIND 60 MPH" = "Thunderstorm Wind",
    "THUNDERSTORM WIND 65MPH" = "Thunderstorm Wind",
    "THUNDERSTORM WIND 65 MPH" = "Thunderstorm Wind",
    "THUNDERSTORM WIND 69" = "Thunderstorm Wind",
    "THUNDERSTORM WIND 98 MPH" = "Thunderstorm Wind",
    "THUNDERSTORM WIND/AWNING" = "Thunderstorm Wind",
    "THUNDERSTORM WIND (G40)" = "Thunderstorm Wind",
    "THUNDERSTORM WIND G50" = "Thunderstorm Wind",
    "THUNDERSTORM WIND G51" = "Thunderstorm Wind",
    "THUNDERSTORM WIND G52" = "Thunderstorm Wind",
    "THUNDERSTORM WIND G55" = "Thunderstorm Wind",
    "THUNDERSTORM WIND G60" = "Thunderstorm Wind",
    "THUNDERSTORM WIND G61" = "Thunderstorm Wind",
    "THUNDERSTORM WIND/HAIL" = "Thunderstorm Wind",
    "THUNDERSTORM WIND/LIGHTNING" = "Thunderstorm Wind",
    "THUNDERSTORMWINDS" = "Thunderstorm Wind",
    "THUNDERSTORM WINDS" = "Thunderstorm Wind",
    "THUNDERSTORM  WINDS" = "Thunderstorm Wind",
    "THUNDERSTORM W INDS" = "Thunderstorm Wind",
    "THUNDERSTORM WINDS." = "Thunderstorm Wind",
    "THUNDERSTORM WINDS 13" = "Thunderstorm Wind",
    "THUNDERSTORM WINDS 2" = "Thunderstorm Wind",
    "THUNDERSTORM WINDS 50" = "Thunderstorm Wind",
    "THUNDERSTORM WINDS 52" = "Thunderstorm Wind",
    "THUNDERSTORM WINDS53" = "Thunderstorm Wind",
    "THUNDERSTORM WINDS 53" = "Thunderstorm Wind",
    "THUNDERSTORM WINDS 60" = "Thunderstorm Wind",
    "THUNDERSTORM WINDS 61" = "Thunderstorm Wind",
    "THUNDERSTORM WINDS 62" = "Thunderstorm Wind",
    "THUNDERSTORM WINDS 63 MPH" = "Thunderstorm Wind",
    "THUNDERSTORM WINDS AND" = "Thunderstorm Wind",
    "THUNDERSTORM WINDS/FLASH FLOOD" = "Flash Flood",
    "THUNDERSTORM WINDS/ FLOOD" = "Flash Flood",
    "THUNDERSTORM WINDS/FLOODING" = "Flash Flood",
    "THUNDERSTORM WINDS FUNNEL CLOU" = "Funnel Cloud",
    "THUNDERSTORM WINDS/FUNNEL CLOU" = "Funnel Cloud",
    "THUNDERSTORM WINDS G" = "Thunderstorm Wind",
    "THUNDERSTORM WINDS G60" = "Thunderstorm Wind",
    "THUNDERSTORM WINDSHAIL" = "Hail",
    "THUNDERSTORM WINDS HAIL" = "Hail",
    "THUNDERSTORM WINDS/HAIL" = "Hail",
    "THUNDERSTORM WINDS/ HAIL" = "Hail",
    "THUNDERSTORM WINDS HEAVY RAIN" = "Heavy Rain",
    "THUNDERSTORM WINDS/HEAVY RAIN" = "Heavy Rain",
    "THUNDERSTORM WINDS      LE CEN" = "Thunderstorm Wind",
    "THUNDERSTORM WINDS LIGHTNING" = "Thunderstorm Wind",
    "THUNDERSTORM WINDSS" = "Thunderstorm Wind",
    "THUNDERSTORM WINDS SMALL STREA" = "Thunderstorm Wind",
    "THUNDERSTORM WINDS URBAN FLOOD" = "Flash Flood",
    "THUNDERSTORM WIND/ TREE" = "Thunderstorm Wind",
    "THUNDERSTORM WIND TREES" = "Thunderstorm Wind",
    "THUNDERSTORM WIND/ TREES" = "Thunderstorm Wind",
    "THUNDERSTORM WINS" = "Thunderstorm Wind",
    "THUNDERSTORMW WINDS" = "Thunderstorm Wind",
    "THUNDERSTROM WIND" = "Thunderstorm Wind",
    "THUNDERSTROM WINDS" = "Thunderstorm Wind",
    "THUNDERTORM WINDS" = "Thunderstorm Wind",
    "THUNDERTSORM WIND" = "Thunderstorm Wind",
    "THUNDESTORM WINDS" = "Thunderstorm Wind",
    "THUNERSTORM WINDS" = "Thunderstorm Wind",
    "TIDAL FLOOD" = "Flash Flood",
    "Tidal Flooding" = "Flash Flood",
    "TIDAL FLOODING" = "Flash Flood",
    "TORNADO" = "Tornado",
    "TORNADO DEBRIS" = "Tornado",
    "TORNADOES" = "Tornado",
    "TORNADOES, TSTM WIND, HAIL" = "Tornado",
    "TORNADO F0" = "Tornado",
    "TORNADO F1" = "Tornado",
    "TORNADO F2" = "Tornado",
    "TORNADO F3" = "Tornado",
    "TORNADOS" = "Tornado",
    "TORNADO/WATERSPOUT" = "Tornado",
    "TORNDAO" = "Tornado",
    "TORRENTIAL RAIN" = "Heavy Rain",
    "Torrential Rainfall" = "Heavy Rain",
    "TROPICAL DEPRESSION" = "Tropical Depression",
    "TROPICAL STORM" = "Tropical Storm",
    "TROPICAL STORM ALBERTO" = "Tropical Storm",
    "TROPICAL STORM DEAN" = "Tropical Storm",
    "TROPICAL STORM GORDON" = "Tropical Storm",
    "TROPICAL STORM JERRY" = "Tropical Storm",
    "TSTM" = "Thunderstorm Wind",
    "TSTM HEAVY RAIN" = "Thunderstorm Wind",
    "TSTMW" = "Thunderstorm Wind",
    "Tstm Wind" = "Thunderstorm Wind",
    " TSTM WIND" = "Thunderstorm Wind",
    "TSTM WIND" = "Thunderstorm Wind",
    "TSTM WIND 40" = "Thunderstorm Wind",
    "TSTM WIND (41)" = "Thunderstorm Wind",
    "TSTM WIND 45" = "Thunderstorm Wind",
    "TSTM WIND 50" = "Thunderstorm Wind",
    "TSTM WIND 51" = "Thunderstorm Wind",
    "TSTM WIND 52" = "Thunderstorm Wind",
    "TSTM WIND 55" = "Thunderstorm Wind",
    "TSTM WIND 65)" = "Thunderstorm Wind",
    "TSTM WIND AND LIGHTNING" = "Thunderstorm Wind",
    "TSTM WIND DAMAGE" = "Thunderstorm Wind",
    "TSTM WIND (G35)" = "Thunderstorm Wind",
    "TSTM WIND (G40)" = "Thunderstorm Wind",
    " TSTM WIND (G45)" = "Thunderstorm Wind",
    "TSTM WIND G45" = "Thunderstorm Wind",
    "TSTM WIND  (G45)" = "Thunderstorm Wind",
    "TSTM WIND (G45)" = "Thunderstorm Wind",
    "TSTM WIND G58" = "Thunderstorm Wind",
    "TSTM WIND/HAIL" = "Thunderstorm Wind",
    "TSTM WINDS" = "Thunderstorm Wind",
    "TSTM WND" = "Thunderstorm Wind",
    "TSUNAMI" = "Tsunami",
    "TUNDERSTORM WIND" = "Thunderstorm Wind",
    "TYPHOON" = "Hurricane (Typhoon)",
    "Unseasonable Cold" = "Extreme Cold/Wind Chill",
    "UNSEASONABLY COLD" = "Extreme Cold/Wind Chill",
    "UNSEASONABLY COOL" = "Extreme Cold/Wind Chill",
    "UNSEASONABLY COOL & WET" = "Extreme Cold/Wind Chill",
    "UNSEASONABLY DRY" = "Excessive Heat",
    "UNSEASONABLY HOT" = "Excessive Heat",
    "UNSEASONABLY WARM" = "Excessive Heat",
    "UNSEASONABLY WARM AND DRY" = "Excessive Heat",
    "UNSEASONABLY WARM & WET" = "Excessive Heat",
    "UNSEASONABLY WARM/WET" = "Excessive Heat",
    "UNSEASONABLY WARM YEAR" = "Excessive Heat",
    "UNSEASONABLY WET" = "Excessive Heat",
    "UNSEASONAL LOW TEMP" = "Extreme Cold/Wind Chill",
    "UNSEASONAL RAIN" = "Heavy Rain",
    "UNUSUALLY COLD" = "Extreme Cold/Wind Chill",
    "UNUSUALLY WARM" = "Excessive Heat",
    "UNUSUAL/RECORD WARMTH" = "Excessive Heat",
    "UNUSUAL WARMTH" = "Excessive Heat",
    "URBAN AND SMALL" = "Flash Flood",
    "URBAN AND SMALL STREAM" = "Flash Flood",
    "URBAN AND SMALL STREAM FLOOD" = "Flash Flood",
    "URBAN AND SMALL STREAM FLOODIN" = "Flash Flood",
    "Urban flood" = "Flash Flood",
    "Urban Flood" = "Flash Flood",
    "URBAN FLOOD" = "Flash Flood",
    "Urban Flooding" = "Flash Flood",
    "URBAN FLOODING" = "Flash Flood",
    "URBAN FLOOD LANDSLIDE" = "Flash Flood",
    "URBAN FLOODS" = "Flash Flood",
    "URBAN SMALL" = "Flash Flood",
    "URBAN/SMALL" = "Flash Flood",
    "URBAN/SMALL FLOODING" = "Flash Flood",
    "URBAN/SMALL STREAM" = "Flash Flood",
    "URBAN SMALL STREAM FLOOD" = "Flash Flood",
    "URBAN/SMALL STREAM FLOOD" = "Flash Flood",
    "URBAN/SMALL STREAM  FLOOD" = "Flash Flood",
    "URBAN/SMALL STREAM FLOODING" = "Flash Flood",
    "URBAN/SMALL STRM FLDG" = "Flash Flood",
    "URBAN/SML STREAM FLD" = "Flash Flood",
    "URBAN/SML STREAM FLDG" = "Flash Flood",
    "URBAN/STREET FLOODING" = "Flash Flood",
    "VERY DRY" = "Excessive Heat",
    "VERY WARM" = "Excessive Heat",
    "Volcanic Ash" = "Volcanic Ash",
    "VOLCANIC ASH" = "Volcanic Ash",
    "VOLCANIC ASHFALL" = "Volcanic Ash",
    "Volcanic Ash Plume" = "Volcanic Ash",
    "VOLCANIC ERUPTION" = "Volcanic Ash",
    "WALL CLOUD" = "Funnel Cloud",
    "WALL CLOUD/FUNNEL CLOUD" = "Funnel Cloud",
    "WARM DRY CONDITIONS" = "Excessive Heat",
    "WARM WEATHER" = "Excessive Heat",
    "WATERSPOUT" = "Waterspout",
    " WATERSPOUT" = "Waterspout",
    "WATER SPOUT" = "Waterspout",
    "WATERSPOUT-" = "Waterspout",
    "WATERSPOUT/" = "Waterspout",
    "WATERSPOUT FUNNEL CLOUD" = "Waterspout",
    "WATERSPOUTS" = "Waterspout",
    "WATERSPOUT TORNADO" = "Tornado",
    "WATERSPOUT-TORNADO" = "Tornado",
    "WATERSPOUT/TORNADO" = "Tornado",
    "WATERSPOUT/ TORNADO" = "Tornado",
    "WAYTERSPOUT" = "Waterspout",
    "wet micoburst" = "Thunderstorm Wind",
    "WET MICROBURST" = "Thunderstorm Wind",
    "Whirlwind" = "Thunderstorm Wind",
    "WHIRLWIND" = "Thunderstorm Wind",
    "WILDFIRE" = "Wildfire",
    "WILDFIRES" = "Wildfire",
    "WILD FIRES" = "Wildfire",
    "WILD/FOREST FIRE" = "Wildfire",
    "WILD/FOREST FIRES" = "Wildfire",
    "Wind" = "Strong Wind",
    "WIND" = "Strong Wind",
    " WIND" = "Strong Wind",
    "WIND ADVISORY" = "Strong Wind",
    "WIND AND WAVE" = "Strong Wind",
    "WIND CHILL" = "Cold/Wind Chill",
    "WIND CHILL/HIGH WIND" = "Strong Wind",
    "Wind Damage" = "Strong Wind",
    "WIND DAMAGE" = "Strong Wind",
    "WIND GUSTS" = "Strong Wind",
    "WIND/HAIL" = "Hail",
    "WINDS" = "Strong Wind",
    "WIND STORM" = "Thunderstorm Wind",
    "WINTER MIX" = "Winter Weather",
    "WINTER STORM" = "Winter Storm",
    "WINTER STORM/HIGH WIND" = "Winter Storm",
    "WINTER STORM HIGH WINDS" = "Winter Storm",
    "WINTER STORM/HIGH WINDS" = "Winter Storm",
    "WINTER STORMS" = "Winter Storm",
    "Winter Weather" = "Winter Weather",
    "WINTER WEATHER" = "Winter Weather",
    "WINTER WEATHER MIX" = "Winter Weather",
    "WINTER WEATHER/MIX" = "Winter Weather",
    "WINTERY MIX" = "Winter Weather",
    "Wintry mix" = "Winter Weather",
    "Wintry Mix" = "Winter Weather",
    "WINTRY MIX" = "Winter Weather",
    "WND" = "Strong Wind",
    "ACCUMULATED SNOWFALL" = "Heavy Snow",
    "AGRICULTURAL FREEZE" = "Frost/Freeze",
    "Black Ice" = "Frost/Freeze",
    "BLACK ICE" = "Frost/Freeze",
    "BLOWING DUST" = "Dust Storm",
    "BLOW-OUT TIDE" = "Frost/Freeze",
    "BLOW-OUT TIDES" = "Frost/Freeze",
    "BREAKUP FLOODING" = "Flash Flood",
    "BRUSH FIRE" = "Wildfire",
    "BRUSH FIRES" = "Wildfire",
    "DEEP HAIL" = "Hail",
    "DENSE FOG" = "Dense Fog",
    "DENSE SMOKE" = "Dense Smoke",
    "DOWNBURST" = "Thunderstorm Wind",
    "DOWNBURST WINDS" = "Thunderstorm Wind",
    "DRIEST MONTH" = "Excessive Heat",
    "Drifting Snow" = "Heavy Snow",
    "FALLING SNOW/ICE" = "Heavy Snow",
    "FOREST FIRES" = "Wildfire",
    "HARD FREEZE" = "Frost/Freeze",
    "HEAVY LAKE SNOW" = "Lake-Effect Snow",
    "LARGE WALL CLOUD" = "Funnel Cloud",
    "LATE FREEZE" = "Frost/Freeze",
    "LATE SEASON HAIL" = "Hail",
    "LATE SEASON SNOW" = "Heavy Snow",
    "Late-season Snowfall" = "Heavy Snow",
    "Late Season Snowfall" = "Heavy Snow",
    "LATE SNOW" = "Heavy Snow",
    "LIGHT FREEZING RAIN" = "Sleet",
    "Light snow" = "Heavy Snow",
    "Light Snow" = "Heavy Snow",
    "LIGHT SNOW" = "Heavy Snow",
    "Light Snowfall" = "Heavy Snow",
    "Light Snow/Flurries" = "Heavy Snow",
    "LIGHT SNOW/FREEZING PRECIP" = "Sleet",
    "MUD SLIDES URBAN FLOODING" = "Debris Flow",
    "NEAR RECORD SNOW" = "Heavy Snow",
    "NON SEVERE HAIL"= "Hail",
    "NON-SEVERE WIND DAMAGE" = "Strong Wind",
    "NON TSTM WIND" = "Thunderstorm Wind",
    "NON-TSTM WIND" = "Thunderstorm Wind",
    "PATCHY DENSE FOG" = "Dense Fog",
    "Prolong Cold" = "Cold/Wind Chill",
    "PROLONG COLD" = "Cold/Wind Chill",
    "PROLONG COLD/SNOW" = "Cold/Wind Chill",
    "PROLONGED RAIN" = "Heavy Rain",
    "PROLONG WARMTH" = "Excessive Heat"
)