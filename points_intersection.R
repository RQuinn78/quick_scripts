# example of how to determine whether a collection of latitude longitude co-ordinates lie within one of a collection of boundaries
# boundary files for Ireland are available at census website e.g. settlements, small areas etc and ordinance survey Ireland website
# assumes points are stored in Latitude and Longitude column in a data frame called points_df
library (sf)
points_df$Latitude <- as.numeric(points_df$Latitude)
points_df$Longitude <- as.numeric(points_df$Longitude)

# this step is only required if there are missing values in the Latitude/Longitude columns
pointsmissing <- points_df[is.na(points_df$Latitude)| is.na(points_df$Longitude),]
points <- points_df [!is.na(points_df$Latitude)&!is.na(points_df$Longitude),]

# assumes points are in standard GPS format (WGS84), if using a different reference system then projcrs must be defined using that format
projcrs <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
points <- st_as_sf (points, coords=c("Longitude", "Latitude"), remove=FALSE, crs=projcrs)

# read shape file of boundary co-ordinates, in this case a settlement boundaries file
settlements <- st_read (Settlements_Ungeneralised_-_OSi_National_Statistical_Boundaries_-_2015-shp")

# intersect the latitude and longitude co-ordinates with the settlement boundary co-ordinates
location <- st_contains (settlements, points)
names (location) <- settlements$SETTL_NAME
location_df <- stack (location)
