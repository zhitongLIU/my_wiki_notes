# Elixir
base on Rlang machine

* lightweight thread
* easy
* can spawn hundred of process
* Fault-tolerance
  * use supervisors handle failurs

```
children = [
  TCP.pool,
  {TCPAcceptor, port: 4040}
]
Supervisor.start_link(children, strategy: :one_for_one)
```
* variables assign is changing address
* functional programming
* pipe operator `|>`


["A", "B", "C"] = "a, b, c"

* build tool `mix`
```
mix new my_app
```
* package manager hex
* Interactive Shelll: iEx


bool
```
and or !
```

list
````
list = [1, 2, 3]
hd(list) #head
tl(list) #tail
[0 | list ] # add 0 at head of list
[ list | 4 ] # add 4 at the end of list
```

hash
```
%{}
```

fnction
```
fn()
```
modules
```
defmodule Examples do
  def toto(arg) do
  end

  def titi(%{ :key => value}) do
    value
  end
end
```

process
```
pid  = self()
pid |> send(:bar)
flush()
```

## OTP
* Open Telecom Platform
* framwork
* collection outil generique

### Behaviour modules

#### Application
```
Application.start(:toto)
Application.stop(:toto)
```
#### Supervisor

#### GenServer
execute iun callback when message recived
`handle_call` is sync
`handle_cast` is async
