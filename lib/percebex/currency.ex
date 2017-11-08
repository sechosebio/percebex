defmodule Percebex.Currency do
  @moduledoc """
    Represents a Currency with three basic properties.

    - `name` is the name of the currency.
    - `value`is the value of the currency from Euros.
    - `date` the date of the exchange reference.
  """

  @enforce_keys [:name, :value]
  defstruct [:name, :value, :date]

end
