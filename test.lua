-- crowify
-- test script
--
-- go to the PARAMS page to assign
-- params to your Crow inputs

engine.name = "TestSine"

-- create Crowify class and crowify object
local Crowify = include("lib/crowify")
local crowify = Crowify.new()

function init()
    -- add some params for crowify to tap into
    params:add {
        type = "control",
        id = "hz",
        name = "Frequency",
        controlspec = controlspec.new(100, 8000, "exp", 10, 220),
        action = function(value)
            engine.hz(value)
            redraw()
        end
    }
    params:add {
        type = "control",
        id = "amp",
        name = "Amplitude",
        controlspec = controlspec.new(0, 1, "lin", 0.01, 0.5),
        action = function(value)
            engine.amp(value)
            redraw()
        end
    }

    -- register parameters with crowify
    crowify:register("hz")
    crowify:register("amp")

    -- after registering all your params run add_params()
    -- to make them visible in norns params menu
    crowify:add_params(false)
end

function redraw()
    screen.clear()

    screen.move(16, 16)
    screen.text("Crowify Test")
    screen.move(16, 28)
    screen.text("Hz")
    screen.move(36, 28)
    screen.text(params:get("hz"))
    screen.move(16, 36)
    screen.text("Amp")
    screen.move(36, 36)
    screen.text(params:get("amp"))
    screen.move(16, 48)
    screen.text("See the PARAMS screen")
    screen.move(16, 56)
    screen.text("to assign Crow inputs")

    screen.update()
end
