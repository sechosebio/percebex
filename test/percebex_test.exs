defmodule PercebexTest do
  use ExUnit.Case
  doctest Percebex
  
  test "Make the request to ECB API and parse the XML response then a map with curencies and date
  is returned" do

    expected = 
      %{currencies: [%{name: "USD", value: 1.2},
      %{name: "JPY", value: 130.38}, %{name: "BGN", value: 1.956},
      %{name: "CZK", value: 26.077}, %{name: "DKK", value: 7.44},
      %{name: "GBP", value: 0.908}, %{name: "HUF", value: 306.28},
      %{name: "PLN", value: 4.244}, %{name: "RON", value: 4.599},
      %{name: "SEK", value: 9.57}, %{name: "CHF", value: 1.14},
      %{name: "NOK", value: 9.371}, %{name: "HRK", value: 7.428},
      %{name: "RUB", value: 68.619}, %{name: "TRY", value: 4.078},
      %{name: "AUD", value: 1.492}, %{name: "BRL", value: 3.706},
      %{name: "CAD", value: 1.454}, %{name: "CNY", value: 7.833},
      %{name: "HKD", value: 9.373}, %{name: "IDR", value: 15791.05},
      %{name: "ILS", value: 4.226}, %{name: "INR", value: 76.674},
      %{name: "KRW", value: 1357.76}, %{name: "MXN", value: 21.214},
      %{name: "MYR", value: 5.036}, %{name: "NZD", value: 1.65},
      %{name: "PHP", value: 60.99}, %{name: "SGD", value: 1.613},
      %{name: "THB", value: 39.746}, %{name: "ZAR", value: 15.514}],
    info: %{date: "2017-09-11", value: 1}}

    assert Percebex.get_euro_exchanges() == expected
  end

end
