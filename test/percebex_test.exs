defmodule PercebexTest do
  use ExUnit.Case
  doctest Percebex

  test "Make a request to ECB API and parse the XML response then a list with Currency is returned" do

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

    assert Percebex.get_euro_exchanges() == expected

  end

  test "Make a request to ECB API to convert 5 AUD to other currencies then a list with the Currency is returned" do

    expected =
      [%Percebex.Currency{date: "2017-09-20", name: "USD", value: 4.032},
      %Percebex.Currency{date: "2017-09-20", name: "JPY", value: 448.694},
      %Percebex.Currency{date: "2017-09-20", name: "BGN", value: 6.568},
      %Percebex.Currency{date: "2017-09-20", name: "CZK", value: 87.607},
      %Percebex.Currency{date: "2017-09-20", name: "DKK", value: 24.986},
      %Percebex.Currency{date: "2017-09-20", name: "GBP", value: 2.978},
      %Percebex.Currency{date: "2017-09-20", name: "HUF", value: 1035.324},
      %Percebex.Currency{date: "2017-09-20", name: "PLN", value: 14.363},
      %Percebex.Currency{date: "2017-09-20", name: "RON", value: 15.444},
      %Percebex.Currency{date: "2017-09-20", name: "SEK", value: 32.011},
      %Percebex.Currency{date: "2017-09-20", name: "CHF", value: 3.873},
      %Percebex.Currency{date: "2017-09-20", name: "NOK", value: 31.375},
      %Percebex.Currency{date: "2017-09-20", name: "HRK", value: 25.126},
      %Percebex.Currency{date: "2017-09-20", name: "RUB", value: 233.155},
      %Percebex.Currency{date: "2017-09-20", name: "TRY", value: 13.983},
      %Percebex.Currency{date: "2017-09-20", name: "EUR", value: 3.358},
      %Percebex.Currency{date: "2017-09-20", name: "BRL", value: 12.619},
      %Percebex.Currency{date: "2017-09-20", name: "CAD", value: 4.937},
      %Percebex.Currency{date: "2017-09-20", name: "CNY", value: 26.509},
      %Percebex.Currency{date: "2017-09-20", name: "HKD", value: 31.452},
      %Percebex.Currency{date: "2017-09-20", name: "IDR", value: 53542.073},
      %Percebex.Currency{date: "2017-09-20", name: "ILS", value: 14.125},
      %Percebex.Currency{date: "2017-09-20", name: "INR", value: 259.206},
      %Percebex.Currency{date: "2017-09-20", name: "KRW", value: 4544.49},
      %Percebex.Currency{date: "2017-09-20", name: "MXN", value: 71.57},
      %Percebex.Currency{date: "2017-09-20", name: "MYR", value: 16.903},
      %Percebex.Currency{date: "2017-09-20", name: "NZD", value: 5.466},
      %Percebex.Currency{date: "2017-09-20", name: "PHP", value: 205.215},
      %Percebex.Currency{date: "2017-09-20", name: "SGD", value: 5.416},
      %Percebex.Currency{date: "2017-09-20", name: "THB", value: 133.326},
      %Percebex.Currency{date: "2017-09-20", name: "ZAR", value: 53.408}]

      assert Percebex.get_euro_exchanges([value: 5, currency: "AUD"]) == expected

  end

end
