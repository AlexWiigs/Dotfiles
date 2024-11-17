local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  -- Auto-closing 
  s({trig = "(", snippetType = "autosnippet"}, fmta("(<>)", {i(1)})),
  s({trig = "[", snippetType = "autosnippet"}, fmta("[<>]", {i(1)})),
  s({trig = "{", snippetType = "autosnippet"}, fmta("{<>}", {i(1)})),
}

