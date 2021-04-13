## Crowify

A [Monome Norns](https://monome.org/norns/) library for easily adding [Crow](https://monome.org/docs/crow/) input support to existing scripts.

### Requirements

* An up-to-date Norns (exact OS support unknown)
* A Monome Crow (or the desire to support one in your Norns script)
* We/TestSine Engine (If you want to test this script)

### Usage

```lua
-- create Crowify class and crowify object
local Crowify = include("lib/crowify")
local crowify = Crowify.new()

-- by default, Crowify updates every 1/25th of a second
-- if you want a different update speed, pass it in
local slowUpdatesCrowify = Crowify.new(1/2)

function init()
    -- register parameters with crowify
    crowify:register("cutoff")
    crowify:register("resonance")

    -- after registering all your params run add_params()
    -- to make them visible in norns params menu
    crowify:add_params()
end

function key(n, z)
    -- if you want to use a shift key with Crowify
    -- pass key params in
    crowify:handle_shift(n, z)
    redraw()
end
```

### Roadmap
1. Beta release & bugfixing
1. Remove the need to `register()` params, and introspect them from the global `params.params_` table directly.
