defmodule Pagexduty.Server do 
	use GenServer

	def start_link(service_key) do
		GenServer.start_link(__MODULE__, service_key, name: __MODULE__)
	end

  def trigger(description, details \\ %{}) do
    incident = %{description: description, details: details}
    GenServer.call __MODULE__, {:trigger, incident}
  end

  def trigger(description, incident_key, details \\ %{}) do
    incident = %{description: description, details: details, incident_key: incident_key}
    enServer.call __MODULE__, {:trigger, incident}
  end

	def handle_call({:trigger, incident}, _from, service_key) do 
		# call to pagerduty api
    event_params = Map.put(incident, "service_key", service_key)    
    response = create_event(event_params)
    { :reply, response, service_key }
	end

  def create_event(params) do
    url = "https://events.pagerduty.com/generic/2010-04-15/create_event.json"
    json = encode_json(params)
    response = post(url, json, Map.merge(default_headers))
    body_response = decode_json(response.body)
  end

  defp post(url, service_key, params) do
    HTTPoison.post!(url, params)
  end

  defp default_headers do
    %{"Content-type" => "application/json"}
  end

  defp decode_json(body) do
    JSX.decode!(body)
  end

  defp encode_json(params) do
    JSX.encode!(params)
  end  
end