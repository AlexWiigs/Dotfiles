return {
	image = {
		backend = "ghostty",
		inline = false,
		float = true,
		max_width = 400,
		max_height = 300,
		integration = {
			markdown = true,
			neorg = false,
			latex = false,
		},
		math = {
			enabled = true,
			typst = {
				tpl = [[
                    #set page(width: auto, height: auto, margin: (x: 2pt, y: 2pt))
                    #show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
                    #set text(size: 12pt, fill: rgb("${color}"))
                    ${header}
                    ${content}
                ]],
			},
		},
	},
}
