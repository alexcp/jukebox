map = undefined
infowindow = undefined

initialize = ->
  venue = $("#map-canvas").data("venue")
  montreal = new (google.maps.LatLng)(45.501689, -73.567256)
  map = new (google.maps.Map)(document.getElementById('map-canvas'),
    center: montreal
    zoom: 12)
  request =
    location: montreal
    name: venue
    radius: 9000
  infowindow = new (google.maps.InfoWindow)
  service = new (google.maps.places.PlacesService)(map)
  service.nearbySearch request, callback
  return

callback = (results, status) ->
  if status == google.maps.places.PlacesServiceStatus.OK
    results = filterResults(results)
    createMarker(result) for result in results

# Filter result for bar, night club or cafe
filterResults = (results) ->
  filteredResults = new Array
  for result in results
    do ->
      if result.types.contains("bar") || result.types.contains("night_club") || result.types.contains("cafe")
        filteredResults = filteredResults.concat(result)
  # if filtering didn't find anything show original result
  if $(results).size() > 0 && $(filteredResults).size() == 0 && $(results).size() < 3
    filteredResults = results
  return filteredResults

createMarker = (place) ->
  placeLoc = place.geometry.location
  marker = new (google.maps.Marker)(
    map: map
    position: place.geometry.location)
  google.maps.event.addListener marker, 'click', ->
    infowindow.setContent place.name
    infowindow.open map, this
    return
  return

google.maps.event.addDomListener window, 'load', initialize
