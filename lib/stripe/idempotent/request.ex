defmodule Stripe.Idempotent.Request do
  @moduledoc """
  Forward HTTP requests to Stripe via the Hackney adapter after appending an
  idempotency key[1], if specified.

  [1] https://stripe.com/docs/api#idempotent_requests
  """

  def request(method, req_url, req_headers, req_body, req_opts) do
    req_headers = include_idempotency_key(req_headers, req_opts)

    :hackney.request(method, req_url, req_headers, req_body, req_opts)
  end

  defp include_idempotency_key(req_headers, req_opts) do
    case Keyword.get(req_opts, :idempotency_key) do
      nil -> req_headers
      idempotency_key -> [{"Idempotency-Key", idempotency_key} | req_headers]
    end
  end
end
