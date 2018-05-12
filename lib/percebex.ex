defmodule Percebex do
  @moduledoc """
  Documentation for Percebex.
  """

  alias Percebex.Currency
  alias Percebex.EcbEuroExchange

  import SweetXml

  @doc """

  Get actual Euro foreign exchange reference rates from ECB API.

  Options:
  - `value` The amount to exchange.
  - `currency` The origin currency to do the exchange.

  ## Examples
    Percebex.get_euro_exchanges()
  """
  @spec get_euro_exchanges(Keyword.t()) :: list(Currency.t()) | :error
  def get_euro_exchanges(opts \\ []) do
    value = Keyword.get(opts, :value, 1)
    origin_code = Keyword.get(opts, :currency)

    with [%Currency{} | _] = currencies <- transform_api_response() do
      origin_currency = Enum.find(currencies, &(&1.name == origin_code))
      Enum.map(currencies, &modify_currency(&1, origin_currency, value))
    else
      :error -> :error
    end
  end

  defp transform_api_response do
    case EcbEuroExchange.fetch() do
      {:ok, body} ->
        body
        |> xpath(~x"/gesmes:Envelope/Cube/Cube")
        |> parse_currencies()

      {:error, _} ->
        :error
    end
  end

  defp parse_currencies(xml) do
    date = xpath(xml, ~x"./@time"s)

    xml
    |> xpath(~x"./Cube"l)
    |> Enum.map(&create_struct(&1, date))
  end

  defp create_struct(xml_node, date) do
    final_value =
      xml_node
      |> xpath(~x"./@rate"s)
      |> parse_value()

    struct(Currency, %{
      name: xpath(xml_node, ~x"./@currency"s),
      value: final_value,
      date: date
    })
  end

  defp parse_value(value) do
    {number, _} = Float.parse(value)
    number
  end

  defp calculate_final_value(original_value, value) do
    Float.ceil(original_value * value, 3)
  end

  defp modify_currency(currency, nil, value) do
    %Currency{
      name: currency.name,
      date: currency.date,
      value: calculate_final_value(currency.value, value)
    }
  end

  defp modify_currency(currency, origin_currency, value) do
    if currency.name == origin_currency.name do
      %Currency{
        name: "EUR",
        date: currency.date,
        value: calculate_final_value(1 / origin_currency.value, value)
      }
    else
      %Currency{
        name: currency.name,
        date: currency.date,
        value: calculate_final_value(1 / origin_currency.value * currency.value, value)
      }
    end
  end
end
