defmodule Percebex.EcbEuroExchange do
  @moduledoc """
  Module for call European Central Bank API.
  """

  @ecb_url "https://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml"
  @http Application.get_env(:percebex, :ecb)[:http_client] || HTTPoison

  @doc """
  Get the response from European Central Bank API in XML format

  ## Examples

      iex> Percebex.EcbEuroExchange.fetch()
      {:ok, "XML"}

  """
  def fetch do
    @ecb_url
    |> @http.get()
    |> handle_response()
  end

  defp handle_response({:ok, %{status_code: 200, body: body}}) do
    {:ok, body}
  end

  defp handle_response({_, %{status_code: _, body: body}}) do
    {:error, body}
  end
end
