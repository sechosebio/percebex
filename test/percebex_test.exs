defmodule PercebexTest do
  use ExUnit.Case
  doctest Percebex
  
  test "Make the request to ECB API and parse the XML response then a map with curencies and date
  is returned" do

    expected = 
      %{currencies: [%{name: "USD", value: 1.201}, %{name: "JPY", value: 133.63},
      %{name: "BGN", value: 1.956}, %{name: "CZK", value: 26.092},
      %{name: "DKK", value: 7.442}, %{name: "GBP", value: 0.887},
      %{name: "HUF", value: 308.34}, %{name: "PLN", value: 4.278},
      %{name: "RON", value: 4.6}, %{name: "SEK", value: 9.534},
      %{name: "CHF", value: 1.154}, %{name: "NOK", value: 9.344},
      %{name: "HRK", value: 7.483}, %{name: "RUB", value: 69.439},
      %{name: "TRY", value: 4.165}, %{name: "AUD", value: 1.49},
      %{name: "BRL", value: 3.758}, %{name: "CAD", value: 1.471},
      %{name: "CNY", value: 7.895}, %{name: "HKD", value: 9.367},
      %{name: "IDR", value: 15945.9}, %{name: "ILS", value: 4.207},
      %{name: "INR", value: 77.197}, %{name: "KRW", value: 1353.441},
      %{name: "MXN", value: 21.315}, %{name: "MYR", value: 5.034},
      %{name: "NZD", value: 1.628}, %{name: "PHP", value: 61.117},
      %{name: "SGD", value: 1.613}, %{name: "THB", value: 39.708},
      %{name: "ZAR", value: 15.906}], info: %{date: "2017-09-20", value: 1}}

    assert expected == Percebex.get_euro_exchanges()

  end

end
