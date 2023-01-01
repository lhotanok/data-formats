{
    "stations": [[
        .["@graph"]
        | .[]
        | {
        "longitude": .longitude,
        "stationName": .stationName.sk}
    ]
    | .[] | select(.stationName!=null)] | max_by(.longitude)
}
