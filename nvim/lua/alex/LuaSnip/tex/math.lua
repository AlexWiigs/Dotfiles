local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end  

return {

  -- Basic
  s(
    {trig = "imp", snippetType = "autosnippet"},
    {t("\\implies")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "ss", snippetType = "autosnippet"},
    {t("\\quad")},
    {condition = in_mathzone}
  ),


  -- Sets
  s(
    {trig = "in", snippetType = "autosnippet"},
    {t("\\in")},
    {condition = in_mathzone}
  ),
  -- Hats 
  s(
    {trig = "hat", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
    fmta("\\hat{<>}", {i(1)}),
    {condition = in_mathzone}
  ),

  s(
    {trig = "tilde", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
    fmta("\\tilde{<>}", {i(1)}),
    {condition = in_mathzone}
  ),

  -- Probability
  s(
    {trig = ";p", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
    fmta("\\Pr[<>]", {i(1)}),
    {condition = in_mathzone}
  ),

  s(
    {trig = ";e", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
    fmta("\\mathbb{E}[<>]", {i(1)}),
    {condition = in_mathzone}
  ),

  s(
    {trig = ";v", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
    fmta("\\mathbb{V}[<>]", {i(1)}),
    {condition = in_mathzone}
  ),

  -- Inequalities
  s(
    {trig = "leq", snippetType = "autosnippet"},
    {t("\\leq")},
    {condition = in_mathzone}
  ),

 s(
    {trig = "geq", snippetType = "autosnippet"},
    {t("\\geq")},
    {condition = in_mathzone}
  ),
 
  -- superscript and upperscript
  s(
    {trig = "dr", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
    fmta("^{<>}", {i(1)}),
    {condition = in_mathzone}
  ),

  s(
    {trig = "rd", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
    fmta("_{<>}", {i(1)}),
    {condition = in_mathzone}
  ),

  -- Dots
  s(
    {trig = "...", dscr="dots", snippetType = "autosnippet"},
    {t("\\dots")},
    {condition = in_mathzone}
  ), 

  -- Summations and Products 
  s(
    {trig = "sumin", dscr="Summation with i and n", snippetType = "autosnippet"},
    {t("\\sum_{i=1}^{n}")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "sum", dscr="Summation", snippetType = "autosnippet"},
    fmta("\\sum_{<>}^{<>}", {i(1), i(2)}),
    {condition = in_mathzone}
  ),

  s(
    {trig = "part", dscr="partial derivative", snippetType = "autosnippet"},
    {t("\\partial")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "prodin", dscr="Summation with i and n", snippetType = "autosnippet"},
    {t("\\prod_{i=1}^{n}")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "prod", dscr="Summation", snippetType = "autosnippet"},
    fmta("\\prod_{<>}^{<>}", {i(1), i(2)}),
    {condition = in_mathzone}
  ),  
  -- Words
  s(
    {trig = "det", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\text{det}")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "trace", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\text{trace}")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "log", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\log")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "min", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\min")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "max", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\max")},
    {condition = in_mathzone}
  ),


  -- BoldSymbol
  s(
    {trig = "bm", dscr="BoldSymbols in Mathmode", snippetType = "autosnippet"},
    fmta("\\bm{<>}", {i(1)}),
    {condition = in_mathzone}
  ),

  -- Text
  s(
    {trig = "text", dscr="text inside mathmode", snippetType = "autosnippet"},
    fmta("\\text{<>}", {i(1)}),
    {condition = in_mathzone}
  ),  

  -- Fractions
  s(
    {trig = "ff", dscr="Fraction shortcut", snippetType = "autosnippet"},
    fmta("\\frac{<>}{<>}", {i(1) , i(2)}),
    {condition = in_mathzone}
  ),
  
  -- Greek Letters
  s(
    {trig = "alpha", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\alpha")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Alpha", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Alpha")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "beta", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\beta")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Beta", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Beta")},
    {condition = in_mathzone}
  ),
  s(
    {trig = "gamma", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\gamma")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Gamma", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Gamma")},
    {condition = in_mathzone}
  ),

   s(
    {trig = "delta", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\delta")},
    {condition = in_mathzone}
  ), 

  s(
    {trig = "Delta", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Delta")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "epsilon", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\epsilon")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Epsilon", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Epsilon")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "zeta", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\zeta")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Zeta", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Zeta")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "eta", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\eta")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Eta", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Eta")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "theta", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\theta")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Theta", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Theta")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "iota", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\iota")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Iota", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Iota")},
    {condition = in_mathzone}
  ),

  s(
    {trig = ";k", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\kappa")},
    {condition = in_mathzone}
  ),

  s(
    {trig = ";K", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Kappa")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "lambda", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\lambda")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Lambda", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Lambda")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "mu", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\mu")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Mu", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Mu")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "nu", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\nu")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Nu", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Nu")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "xi", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\xi")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Xi", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Xi")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "omicron", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\omicron")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Omicron", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Omicron")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "pi", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\pi")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Pi", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Pi")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "rho", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\rho")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Rho", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Rho")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "sigma", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\sigma")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Sigma", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Sigma")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "tau", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\tau")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "upsilon", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\upsilon")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Upsilon", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Upsilon")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "phi", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\phi")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Phi", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Phi")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "chi", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\chi")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Chi", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Chi")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "psi", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Psi")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "omega", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\omega")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "Omega", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\Omega")},
    {condition = in_mathzone}
  ),

  s(
    {trig = "ell", snippetType="autosnippet"}, -- Table of snippet parameters
    {t("\\ell")},
    {condition = in_mathzone}
  ),

  -- Matrices
  s(
    {trig = ";mat", dscr="matrix", snippetType = "autosnippet"},
    fmta([[
          \begin{<>matrix}
          <>
          \end{<>matrix}
          ]], {i(1), i(2), rep(1)}),
    {condition = in_mathzone}
  ),

  -- Auto Subscripts
s({trig = '([%a%)%]%}])0', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    "<>_{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      t("0")
    }
  )
),

s({trig = '([%a%)%]%}])1', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    "<>_{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      t("1")
    }
  )
),

s({trig = '([%a%)%]%}])2', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    "<>_{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      t("2")
    }
  )
),

s({trig = '([%a%)%]%}])3', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    "<>_{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      t("3")
    }
  )
),
s({trig = '([%a%)%]%}])4', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    "<>_{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      t("4")
    }
  )
),

s({trig = '([%a%)%]%}])5', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    "<>_{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      t("5")
    }
  )
),

s({trig = '([%a%)%]%}])6', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    "<>_{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      t("6")
    }
  )
),

s({trig = '([%a%)%]%}])7', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    "<>_{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      t("7")
    }
  )
),

s({trig = '([%a%)%]%}])8', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    "<>_{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      t("8")
    }
  )
),

s({trig = '([%a%)%]%}])9', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    "<>_{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      t("9")
    }
  )
),





}

