defmodule PagexdutyTest do
  use ExUnit.Case, async: false

  import Mock

  defmodule MockResponse do
    defstruct body: ""
  end

  test "create_event creates a incident" do

  	Pagexduty.Server.start_link("service_key")
    response = %MockResponse{body: ~s({"status":"success","message":"Event processed","incident_key":"srv01/HTTP"})}
    with_mock HTTPoison, [post!: fn(_url, _body, _headers) -> response end] do
      response = Pagexduty.Server.trigger("My test incident", "srv01/HTTP", %{"detail" => "something"})

      assert response["status"] == "success"
      assert response["incident_key"] == "srv01/HTTP"
   	 end
  end
end
