# Error Handling Blogpost

The code in this repo is just example code which compliments [this blogpost](https://medium.com/@tylerpachal/error-handling-in-elixir-rescue-vs-catch-946e052db97b) (read it for more details!).  The [tests](test/scenarios_test.exs) are just meant to be example references (a lot of them fail on purpose) for the table in this README.

Trigger | Handler | Compatible? | Code
--- | --- | :---: | ---
`raise` | `rescue` | ✅ | [Link](https://github.com/TylerPachal/elixir-error-handling-blogpost/blob/master/test/scenarios_test.exs#L56-L65)
`raise` | `catch/1` | ❌ | [Link](https://github.com/TylerPachal/elixir-error-handling-blogpost/blob/master/test/scenarios_test.exs#L103-L112)
`raise` | `catch/2` | ✅ | [Link](https://github.com/TylerPachal/elixir-error-handling-blogpost/blob/master/test/scenarios_test.exs#L13-L21)
`throw` | `rescue` | ❌ | [Link](https://github.com/TylerPachal/elixir-error-handling-blogpost/blob/master/test/scenarios_test.exs#L67-L76)
`throw` | `catch/1` | ✅ | [Link](https://github.com/TylerPachal/elixir-error-handling-blogpost/blob/master/test/scenarios_test.exs#L114-L122)
`throw` | `catch2` | ✅ | [Link](https://github.com/TylerPachal/elixir-error-handling-blogpost/blob/master/test/scenarios_test.exs#L23-L31)
`exit` | `rescue` | ❌ | [Link](https://github.com/TylerPachal/elixir-error-handling-blogpost/blob/master/test/scenarios_test.exs#L78-L87)
`exit` | `catch/1` | ❌ | [Link](https://github.com/TylerPachal/elixir-error-handling-blogpost/blob/master/test/scenarios_test.exs#L124-L133)
`exit` | `catch/2` | ✅ | [Link](https://github.com/TylerPachal/elixir-error-handling-blogpost/blob/master/test/scenarios_test.exs#L33-L41)
`:erlang.error` | `rescue` | ✅ | [Link](https://github.com/TylerPachal/elixir-error-handling-blogpost/blob/master/test/scenarios_test.exs#L89-L98)
`:erlang.error` | `catch/1` | ❌ | [Link](https://github.com/TylerPachal/elixir-error-handling-blogpost/blob/master/test/scenarios_test.exs#L135-L144)
`:erlang.error` | `catch/2` | ✅ | [Link](https://github.com/TylerPachal/elixir-error-handling-blogpost/blob/master/test/scenarios_test.exs#L43-L52)
