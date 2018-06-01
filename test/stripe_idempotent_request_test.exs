defmodule StripeIdempotentRequestTest do
  use ExUnit.Case
  doctest StripeIdempotentRequest

  test "greets the world" do
    assert StripeIdempotentRequest.hello() == :world
  end
end
