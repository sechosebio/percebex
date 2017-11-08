defmodule Percebex do
  @moduledoc """
  Documentation for Percebex.
  """

  alias Percebex.Currency
  alias Percebex.EcbEuroExchange

  import SweetXml

  @doc """

  Get the actual Euro foreign exchange reference rates from ECB API and
  parses the xml file received.

  ## Examples
    Percebex.get_euro_exchanges()
  """
  def get_euro_exchanges(opts \\ []) do

    value = Keyword.get(opts, :value, 1)

    case transform_api_response(value) do
      :error -> :error
      map ->
        map
    end
  end

  defp transform_api_response(value) do
    case EcbEuroExchange.fetch() do
      {:ok, body} ->
        body
        |> xpath(~x"/gesmes:Envelope/Cube/Cube")
        |> create_struct(value)
      {:error, _} -> :error
    end
  end

  defp create_struct(xml, value) do
    date = xpath(xml, ~x"./@time"s)

    xml
    |> xpath(~x"./Cube"l)
    |> Enum.map(fn node ->

      final_value =
        node
        |> xpath(~x"./@rate"s)
        |> parse_value()
        |> calculate_final_value(value)

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

end
