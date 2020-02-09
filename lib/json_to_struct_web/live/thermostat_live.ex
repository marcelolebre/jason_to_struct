defmodule JsonToStructWeb.ThermostatLive do
    use Phoenix.LiveView

    use Phoenix.LiveView

    def render(assigns) do
      ~L"""
      <form phx-change="suggest" phx-submit="search">
        <input type="text" name="q" value="<%= @query %>" list="matches" placeholder="Search..."
               <%= if @loading, do: "readonly" %>/>
        <a><%= @result %></a>
      </form>
      """
    end
  
    def mount(_params, _session, socket) do
      {:ok, assign(socket, query: nil, result: nil, loading: false, matches: [])}
    end
  
    def handle_event("suggest", %{"q" => query}, socket) when byte_size(query) <= 100 do

      result = String.replace(query, "%", "")
      |> String.replace("=>", ":")
      |> Jason.encode!()
      |> HtmlEntities.decode()
      |> String.replace("\\", "")

      {:noreply, assign(socket, result:  result)}
    end

    
  
    def handle_event("search", %{"q" => query}, socket) when byte_size(query) <= 100 do
      send(self(), {:search, query})
      {:noreply, assign(socket, query: query, result: "Searching...", loading: true, matches: [])}
    end
  
    def handle_info({:search, query}, socket) do
      {result, _} = System.cmd("dict", ["#{query}"], stderr_to_stdout: true)
      {:noreply, assign(socket, loading: false, result: result, matches: [])}
    end
end