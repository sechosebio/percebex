defmodule PercebexTest do
  use ExUnit.Case
  doctest Percebex

  test "Make the request to ECB API and parse the XML response then a map with curencies and date
  is returned" do

    expected =
      [%Percebex.Currency{date: "2017-09-20", name: "USD", value: 1.201},
       %Percebex.Currency{date: "2017-09-20", name: "JPY", value: 133.63},
       %Percebex.Currency{date: "2017-09-20", name: "BGN", value: 1.956},
       %Percebex.Currency{date: "2017-09-20", name: "CZK", value: 26.092},
       %Percebex.Currency{date: "2017-09-20", name: "DKK", value: 7.442},
       %Percebex.Currency{date: "2017-09-20", name: "GBP", value: 0.887},
       %Percebex.Currency{date: "2017-09-20", name: "HUF", value: 308.34},
       %Percebex.Currency{date: "2017-09-20", name: "PLN", value: 4.278},
       %Percebex.Currency{date: "2017-09-20", name: "RON", value: 4.6},
       %Percebex.Currency{date: "2017-09-20", name: "SEK", value: 9.534},
       %Percebex.Currency{date: "2017-09-20", name: "CHF", value: 1.154},
       %Percebex.Currency{date: "2017-09-20", name: "NOK", value: 9.344},
       %Percebex.Currency{date: "2017-09-20", name: "HRK", value: 7.483},
       %Percebex.Currency{date: "2017-09-20", name: "RUB", value: 69.439},
       %Percebex.Currency{date: "2017-09-20", name: "TRY", value: 4.165},
       %Percebex.Currency{date: "2017-09-20", name: "AUD", value: 1.49},
       %Percebex.Currency{date: "2017-09-20", name: "BRL", value: 3.758},
       %Percebex.Currency{date: "2017-09-20", name: "CAD", value: 1.471},
       %Percebex.Currency{date: "2017-09-20", name: "CNY", value: 7.895},
       %Percebex.Currency{date: "2017-09-20", name: "HKD", value: 9.367},
       %Percebex.Currency{date: "2017-09-20", name: "IDR", value: 15945.9},
       %Percebex.Currency{date: "2017-09-20", name: "ILS", value: 4.207},
       %Percebex.Currency{date: "2017-09-20", name: "INR", value: 77.197},
       %Percebex.Currency{date: "2017-09-20", name: "KRW", value: 1353.441},
       %Percebex.Currency{date: "2017-09-20", name: "MXN", value: 21.315},
       %Percebex.Currency{date: "2017-09-20", name: "MYR", value: 5.034},
       %Percebex.Currency{date: "2017-09-20", name: "NZD", value: 1.628},
       %Percebex.Currency{date: "2017-09-20", name: "PHP", value: 61.117},
       %Percebex.Currency{date: "2017-09-20", name: "SGD", value: 1.613},
       %Percebex.Currency{date: "2017-09-20", name: "THB", value: 39.708},
       %Percebex.Currency{date: "2017-09-20", name: "ZAR", value: 15.906}]

    assert expected == Percebex.get_euro_exchanges()

  end

end
