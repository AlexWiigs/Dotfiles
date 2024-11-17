-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local fmta = require("luasnip.extras.fmt").fmta

-- Define a function to check if we are in a Quarto file
local in_quarto = function()
    return vim.bo.filetype == "quarto"
end

return{
ls.add_snippets("quarto", {
 -- snippets
  -- Equation Enviroment
  s({trig=";R", dscr="Creates an R code block", snippetType = "autosnippet"},
    fmta(
       [[
         ```{R}
         <>
         ```
       ]],
    { i(1) }
    ),
    { condition = in_quarto}
    ),

  s({trig=";P", dscr="Creates an Python code block", snippetType = "autosnippet"},
    fmta(
       [[
         ```{Python}
         <>
         ```
       ]],
    { i(1) }
    ),
    { condition = in_quarto}
    ),

  s({trig=";bglm", dscr="R binomial glm", snippetType = "autosnippet"},
    fmta(                                                                    
       [[                                                                    
         glm(<> ~ <>, family = binomial, data = <>)
       ]],
    { i(1), i(2), i(3) }
    ),
    { condition = in_quarto}
    ),
}),



}
