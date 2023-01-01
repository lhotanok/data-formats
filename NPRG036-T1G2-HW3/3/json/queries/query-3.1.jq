{"trafficLines": [
    ."@graph"|.[]
    |select(."type"=="TrafficLine")."contains"
    |.[]|select(."minutesToNext"==1)
]}