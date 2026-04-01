# config/initializers/date_formats.rb
Date::DATE_FORMATS[:short]     = "%d %b %Y"
Date::DATE_FORMATS[:long]      = "%d %B %Y"
Date::DATE_FORMATS[:with_day]  = "%A %d %B %Y"

Time::DATE_FORMATS[:short]     = "%H:%M %d %b %Y"
Time::DATE_FORMATS[:long]      = "%H:%M %A %d %B %Y"
Time::DATE_FORMATS[:time_only] = "%H:%M"