# Tmux
```
ctrl - b <command>
ctrl - b :command
```

## windows
| command        | description                                    |
| :------------- | :-------------                                 |
| c              | create window                                  |
| ,              | rename window                                  |
| n              | next window                                    |
| p              | previous window                                |
| l              | previously selected window                     |
| 0-9            | go to window number                            |
| w              | list windows                                   |
| &              | kill current windows                           |
| q              | show pane numbers(then type number to go into) |
| o              | switch to next pane                            |
| ?              | list keybinding                                |
|                |                                                |
|                |                                                |


## pane
| command        | description                  |
| :------------- | :-------------               |
| %              | vertical split               |
| "              | horizontal split             |
| {              | move pane left               |
| }              | move pane right              |
| :break-pane    | make pane to become a window |
| arrow-keys     | go to direction pane         |
|                |                              |
|                |                              |


## session

```
tmux new -s <session-name>
tmux list-sessions
tmux attach -t <session-name>
tmux kill-session -t <session-name>
```

| command        | description    |
| :------------- | :------------- |
| d              | detach session |
|                |                |


