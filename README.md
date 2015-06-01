Pagexduty
=========

PagerDuty client for Elixir. 

## Installing

Add pagexduty as a dependency to your project:

```elixir
  defp deps do
    [{:pagexduty, "~> 0.1.0"}]
  end
```

And add pagexduty to applications list:

```elixir
  def application do
    [applications: [:pagexduty]]
  end
```

Finally fetch and compile dependency:

```
mix deps.get
mix deps.compile
```

## Examples

```elixir

# Create an incident only with a description

Pagexduty.Server.trigger("Something is not right")

# Create an incident with a description and details

Pagexduty.Server.trigger("You know nothing, Server Snow", %{"detail" => "something"})

# Create an incident with a description and incident_key

Pagexduty.Server.trigger("An error occurred", "srv01/HTTP")

# Create a incident with a description, incident_key and details

Pagexduty.Server.trigger("An error occurred", "srv01/HTTP", %{"detail" => "something"})

```

## License

pagexduty is copyright (c) 2015 Ride Group Inc and contributors.

The source code is released under the MIT License.

Check [LICENSE](LICENSE) for more information.
