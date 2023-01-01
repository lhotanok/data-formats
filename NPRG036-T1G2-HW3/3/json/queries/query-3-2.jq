{"trafficLines": [
    ."@graph"|.[]
    |select(."trafficLineId"==22)
    |."follows"."holidays"|.[]
]}