defmodule PagexdutyTest do
  use ExUnit.Case, async: false
  alias Pagexduty.Server

  import Mock

  defmodule MockResponse do
    defstruct body: ""
  end

  test "create_event creates a incident" do

    response = %MockResponse{body: ~s({"status":"success","message":"Event processed","incident_key":"srv01/HTTP"})}
    with_mock HTTPoison, [post!: fn(_url, _service_key, _params) -> response end] do
      response = Server.create_event(~s({"e93facc04764012d7bfb002500d5d1a6","srv01/HTTP","trigger","FAILURE","details"}))

      assert response.status == "success"   
   	 end
  end
end
