set json to do shell script "curl -H 'CB-VERSION: 2015-04-08' https://api.coinbase.com/v2/prices/ETH-USD/spot"
set json to do shell script "sed s/warnings.*//g <<< " & json
set eth to do shell script "sed s/[a-zA-Z:{},]//g <<< " & json
set eth to eth as real

set pay to do shell script "curl -s 'https://bittrex.com/api/v1.1/public/getticker?market=eth-bat' | grep -oE '(Last).*' | sed 's/[^0-9\\.]*//g'"
set pay to pay as real

set answer to pay * eth
set answer to answer * 100
set answer to round answer
set answer to answer / 100
return "$" & answer
