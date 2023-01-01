{
    "passengers": [
        .["@graph"]
        | .[]
        | {
            "en": (.firstName.en + " " + .surname.en),
            "ownsTickets": (
                [if .owns then .owns else [] end | .[].ticketId]
            )
        }
    ] | .[] | select(.en!=" ")
}