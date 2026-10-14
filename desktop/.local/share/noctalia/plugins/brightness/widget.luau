local function pick(res)
  if type(res) == "string" then return res end
  if type(res) ~= "table" then return nil end
  return res.stdout or res.output or res.out or res.text or res.body or res[1]
end

function update()
  noctalia.setUpdateInterval(1000)
  noctalia.runAsync("cat ~/.cache/brightness", function(res)
    local n = tonumber(tostring(pick(res) or ""):match("%d+"))
    if n then barWidget.setText(string.format("%d%%", n)) end
  end)
  barWidget.setGlyph("brightness-up")
end
