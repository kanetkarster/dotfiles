-- needed to be in quotes to work
forecast_url = "\"forecast.weather.gov/MapClick.php?lat=%s&lon=%s&FcstType=json\""

--optional sign, multiple digits, decimal point, more digits
flt = "([+-]?%d*[.]?%d*)" 

-- get my location
where = io.open( os.getenv( "HOME" ) .. "/.config/where", "r"):read()
where = where:gsub(" ", "+")

-- get latitude and longitude from location
resp = assert(io.popen("curl -q -s http://nominatim.openstreetmap.org/search/"..where.."?format=json", "r")):read()
lat, lon = resp:match("\"lat\":\""..flt.."\",\"lon\":\""..flt.."\"")

-- get weather from goverment
weather = string.format(forecast_url, lat, lon)
resp = assert(io.popen("curl -q -s "..weather, "r")):read("*all")

-- todo: parse and do something
print(resp)
