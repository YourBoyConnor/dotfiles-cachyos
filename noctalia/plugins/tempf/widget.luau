local function pick(res)
  if type(res) == "string" then return res end
  if type(res) ~= "table" then return nil end
  return res.stdout or res.output or res.out or res.text or res.body or res[1]
end

function update()
  noctalia.setUpdateInterval(2000)
  noctalia.runAsync("cat /sys/devices/platform/coretemp.0/hwmon/*/temp1_input", function(res)
    local milli = tonumber(tostring(pick(res) or ""):match("%d+"))
    if milli then
      barWidget.setText(string.format("%d°F", math.floor(milli / 1000 * 9 / 5 + 32 + 0.5)))
    end
  end)
  noctalia.runAsync("sh ~/.local/share/noctalia/plugins/tempf/info.sh", function(res)
    local out = pick(res)
    if out then barWidget.setTooltip(tostring(out)) end
  end)
end

function onClick()
  noctalia.runAsync("noctalia msg panel-toggle control-center system")
end
