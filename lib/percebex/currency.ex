defmodule Percebex.Currency do
  @moduledoc """
    Represents a Currency with three basic properties.

    - `name` is the name of the currency.
    - `value`is the value of the currency from Euros.
    - `date` the date of the exchange reference.
  """

  @enforce_keys [:name, :value]
  defstruct [:name, :value, :date]

  @type t :: %__MODULE__{
          name: String.t(),
          value: number(),
          date: String.t()
        }
end
