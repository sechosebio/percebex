defmodule Percebex.Test.HTTPClient do

  @ecb_xml File.read("test/fixtures/ecb_exchange.xml")
  
  def get(_url) do
    {_, xml} = @ecb_xml
    {:ok, %{status_code: 200, body: xml}}
  end

end