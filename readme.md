timer.lua
===

Timer lib for [lua-nginx](https://github.com/openresty/lua-nginx-module/) like openresty

Use it like `setInterval` in javascript with a little difference

`timer.lua` is based on (`store.lua`)[https://github.com/chunpu/store.lua]

Usage
---

Use timer with `init_worker_by_lua_file your/code.lua;`

`your/code.lua`

```lua
local timer = require 'timer'

timer.setInterval('timer1', function()
	ngx.log(ngx.ERR, 'timer1: ', ngx.now())
end)
```

Api
---

- `timer.setInterval(timerName, handler, interval[, arguments...])` return ok, err
- `timer.clearInterval(timerName)`

The reason why we need to define a timer name rather use an auto increment int is that we can't tell if nginx is reload or restart


Advanced
---

Interval only supports integer multiple of `timer.interval`, default is `0.5`. if you want to run interval by 0.1, then you should set `timer.interval` to smaller than 0.1
