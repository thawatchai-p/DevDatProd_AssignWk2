library(leaflet) # load the library

content <- paste(sep = "<br/>",
                 "<b><a href='http://www.irpc.co.th/en/'>IRPC Public Company Limited</a></b>",
                 "299 Moo5 Sukhumvit Road",
                 "Tambol Cherng-nern Amphur Muang",
                 "Rayong, Thailand") # add popup content

ry_cities <- data.frame(name = c("Mueang Rayong", "Ban Chang", "Klaeng",
                                 "Wang Chan", "Ban Khai", "Pluak Daeng",
                                 "Khao Chamao", "Nikhom Phatthana"),
                        pop = c(243502, 60290, 127590, 25323, 61802, 45160, 23324, 39411),
                        lat = c(12.668333, 12.728333, 12.778333, 12.934722,
                                12.783611, 12.972222, 12.975, 12.831389),
                        lng = c(101.275, 101.066389, 101.653333, 101.520278,
                                101.296667, 101.215278, 101.685, 101.208056))

ry_cities %>% leaflet() %>% # leaflet works with the pipe operator
        addTiles() %>% # setup the default OpenStreetMap map tiles
        addCircles(weight = 1, radius = sqrt(ry_cities$pop) * 20) %>% # add circle with size based on population
        addMarkers(lng = 101.313613, lat = 12.662320, popup = content, popupOptions(keepInView = TRUE)) # add a single point layer
