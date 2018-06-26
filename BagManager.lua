
funClass = require("Analysis")

-- funSort = require("Analysis")

tab = funClass[1](2)
funClass[2](tab)
	for i=1,#tab do
		print("Id:".. tab[i].Id.." Name:"..tab[i].Name.." Level:".. tab[i].Level.." Star:".. tab[i].Star.." Count:".. tab[i].Count.." Type:".. tab[i].Type)
		print("-----------------------------------------------------------------------")
	end
