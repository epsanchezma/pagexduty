Pagexduty
=========

Pagerduty client for Elixir. 

## Examples

```elixir

#Creates an incident only with param: description

Pagexduty.Server.trigger("Something is not right")

#Creates an incident with params: description, details

Pagexduty.Server.trigger("You know nothing, Server Snow", %{"detail" => "something"})

#Creates an incident with params: description, incident_key

Pagexduty.Server.trigger("An error occurred", "srv01/HTTP")

#Creates an incident with params: description, incident_key, details

Pagexduty.Server.trigger("An error occurred", "srv01/HTTP", %{"detail" => "something"})

```

## License

exlug is copyright (c) 2015 Ride Group Inc and contributors.

The source code is released under the MIT License.

Check [LICENSE](LICENSE) for more information.