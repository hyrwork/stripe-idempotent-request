defmodule Stripe.Idempotent.Request.MixProject do
  use Mix.Project

  def project do
    [
      app: :stripe_idempotent_request,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:hackney, "~> 1.6"}
    ]
  end
end
