local in_textzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 0
end

-- For Visual Snippets
local function get_visual(_, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  -- Enumerate and Itemize
  s({trig=";enum", dscr="Begin enumerate environment.", snippetType = "autosnippet"},
    fmta(
       [[
         \begin{enumerate}
             \item <>
         \end{enumerate}
       ]],
    { i(1) },
    {condition = in_textzone}  
    )
  ),

  s({trig=";item", dscr="Begin itemize environment.", snippetType = "autosnippet"},
    fmta(
       [[
         \begin{itemize}
             \item <>
         \end{itemize}
       ]],
    { i(1) },
    {condition = in_textzone}  
    )
  ),    

  s({trig=";part", dscr="Begin question part.", snippetType = "autosnippet"},
    fmta(
       [[
         \begin{enumerate}
             \item[(<>)] <>
         \end{enumerate}
       ]],
    { i(1), i(2) },
    {condition = in_textzone}  
    )
  ),
  -- Equation Environment
  s({trig="dm", dscr="Expands 'eq' into an equation environment", snippetType = "autosnippet"},
    fmta(
       [[
         \[
             <>
         \]
       ]],
    { i(1) },
    {condition = in_textzone}  
    )
  ),

  s({trig=";align", snippetType = "autosnippet"},
    fmta(
       [[
         \begin{align*}
            <>
         \end{align*}
       ]],
       { i(1) },
       {condition = in_textzone}  
    )
  ),

  s({trig="md", snippetType = "autosnippet"},
    fmta("$<>$", {i(1)}),
    {condition = in_textzone}  
  ),

  s(
    {trig = ";beg", dscr="default begin environment", snippetType = "autosnippet"},
    fmta([[
          \begin{<>}
          <>
          \end{<>}
          ]], {i(1), i(2), rep(1)}),
    {condition = in_textzone}  -- Change to `in_textzone` if `in_mathzone` is undefined
  ),

  -- Visual Mode
  s({trig=";align", snippetType = "autosnippet"},
    fmta(
       [[
         \begin{align*}
            <>
         \end{align*}
       ]],
       { d(1, get_visual) }
    )
  ),
}

