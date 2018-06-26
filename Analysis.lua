
BagType = require("ItemBagTool")
-- print(BagType[2].Id)
BagCount = 0
for k,v in pairs(BagType) do
	BagCount  = BagCount+1
end

-- WeaType = {}
-- CloType = {}
-- DecType = {}
-- MatType = {}

-- for i=1,BagCount do
-- 	if BagType[i].Id>1000 and BagType[i].Id<1010 then
--         WeaType[#WeaType+1] = BagType[i]
--     end
--     if BagType[i].Id>2000 and BagType[i].Id<2010 then
-- 		CloType[#CloType+1] = BagType[i]
-- 	end
-- 	if BagType[i].Id>3000 and BagType[i].Id<3010 then
-- 		DecType[#DecType+1] = BagType[i]
-- 	end
-- 	if BagType[i].Id>4000 and BagType[i].Id<4010 then
-- 		MatType[#MatType+1] = BagType[i]
-- 	end
-- end

function BubbleSort(tab)
	-- print(123)
	-- body	
	for i=1,#tab-1 do
		for j=1,#tab-i do
			if tab[j].Level< tab[j+1].Level then
				tab[j],tab[j+1] = tab[j+1],tab[j]
			elseif tab[j].Level == tab[j+1].Level and tab[j].Star<tab[j+1].Star then
				tab[j],tab[j+1] = tab[j+1],tab[j]
			elseif tab[j].Level == tab[j+1].Level and tab[j].Star ==  tab[j+1].Star and tab[j].Id<tab[j+1].Id then
				tab[j],tab[j+1] = tab[j+1],tab[j]
			end
		end
	end

	
end
function ItemClassify(Type)
	-- body
	-- print(456)
	if Type ==nil then
		return
	end
	local tab = {}
	for i=1,BagCount do
		if BagType[i].Type == Type then
			tab[#tab+1] = BagType[i]
		end
	end
	return tab
end
funclass = {ItemClassify,BubbleSort}
return funclass