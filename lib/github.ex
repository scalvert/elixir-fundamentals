defmodule Github do
  require HTTPoison
  require Poison

  @api_base Application.get_env(:elixir_fundamentals, :github_api) || "https://api.github.com"

  def org_url(org_name) when is_bitstring(org_name) do
    "#{@api_base}/orgs/#{org_name}"
  end

  def repo_url(owner_name, repo_name) when is_bitstring(owner_name) and is_bitstring(repo_name) do
    "#{@api_base}/repos/#{owner_name}/#{repo_name}"
  end

  def org(org_name) when is_bitstring(org_name) do
    http_response = HTTPoison.get(org_url(org_name))
    process_response(http_response)
  end

  def repo(owner_name, repo_name) when is_bitstring(owner_name) and is_bitstring(repo_name) do
    http_response = HTTPoison.get(repo_url(owner_name, repo_name))
    process_response(http_response)
  end

  defp process_response({:ok, %{status_code: 200, body: response_body} }) do
    { :ok, Poison.decode!(response_body) }
  end

  defp process_response({:ok, %{body: response_body} }) do
    { :error, Poison.decode!(response_body) }
  end
end