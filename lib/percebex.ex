defmodule Percebex do
  @moduledoc """
  Documentation for Percebex.
  """

  alias Percebex.Currency
  alias Percebex.EcbEuroExchange

  import SweetXml

  @doc """

  Get actual Euro foreign exchange reference rates from ECB API and
  parses the xml file received.

  Options:
  - `value` The amount to exchange.
  - `currency` The origin currency to do the exchange.

  ## Examples
    Percebex.get_euro_exchanges()
  """
  def get_euro_exchanges(opts \\ []) do

    value = Keyword.get(opts, :value, 1)
    origin_code = Keyword.get(opts, :currency)

    case transform_api_response() do
      :error -> :error
      currencies ->
        if origin_code do
          origin_currency =
            Enum.find(currencies, fn currency ->
              currency.name == origin_code
            end)
            Enum.map(currencies, &(modify_currency(&1, origin_currency, value)))
        else
          Enum.map(currencies, fn currency ->
            %Currency{
              name: currency.name,
              date: currency.date,
              value: calculate_final_value(currency.value, value)
            }
          end)
        end

    end
  end

  defp transform_api_response do
    case EcbEuroExchange.fetch() do
      {:ok, body} ->
        body
        |> xpath(~x"/gesmes:Envelope/Cube/Cube")
        |> create_struct
      {:error, _} -> :error
    end
  end

  defp create_struct(xml) do
    date = xpath(xml, ~x"./@time"s)

    xml
    |> xpath(~x"./Cube"l)
    |> Enum.map(fn node ->

      final_value =
        node
        |> xpath(~x"./@rate"s)
        |> parse_value()

      struct(
        Currency,
        %{
          name: xpath(node, ~x"./@currency"s),
          value: final_value,
          date: date
        }
      )
    end)
  end

  defp parse_value(value) do
    {number, _} = Float.parse(value)
    number
  end

  defp calculate_final_value(original_value, value) do
    Float.ceil(original_value * value, 3)
  end

  defp modify_currency(currency, origin_currency, value) do
    if currency.name == origin_currency.name do
      %Currency{
        name: "EUR",
        date: currency.date,
        value: calculate_final_value(1/origin_currency.value, value)
      }
    else
      %Currency{
        name: currency.name,
        date: currency.date,
        value: calculate_final_value(1/origin_currency.value * currency.value, value)
      }
    end
  end

end
