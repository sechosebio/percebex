defmodule Percebex do
  @moduledoc """
  Documentation for Percebex.
  """

  alias Percebex.EcbEuroExchange

  import SweetXml

  @doc """

  Get the actual Euro foreign exchange reference rates from ECB API and
  parses the xml file received.

  ## Examples
    Percebex.get_euro_exchanges()
  """
  def get_euro_exchanges(value \\ 1) do
    case transform_api_response() do
      :error -> :error 
      map -> 
        {_, map } = 
          Map.get_and_update(map, :info, fn current_info -> 
            {current_info, Map.put(current_info, :value, value)}
          end)
        
        update_in(map, [:currencies, Access.all(), :value], fn currency_value -> 
          parse_value(currency_value) * value
          |> Float.round(3)
        end)
    end
  end

  defp transform_api_response do
    case EcbEuroExchange.fetch() do
      {:ok, body} ->
       xmap(body,
        info: [
          ~x"/gesmes:Envelope/Cube/Cube",
          date: ~x"./@time"s
        ],
        currencies: [
          ~x"/gesmes:Envelope/Cube/Cube/Cube"l,
          name: ~x"./@currency"s,
          value: ~x"./@rate"s,
        ]
       )
      {:error, _} -> :error
    end
  end

  defp parse_value(value) do
    {number, _} = Float.parse(value)
    number
  end

end
