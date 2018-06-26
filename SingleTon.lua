Singleton = {}
function Singleton:new(tab)
	-- body
	local singleton = tab or {}

	setmetatable(singleton,self)

	self.__index = self
	return singleton 
end
function Singleton:Instance()
	-- body
	if self.instance == nil then

		self.instance = self:new()

	end
	return self.instance
end
function Singleton:ReleaseInstance()
	-- body
	if self.instance then
		self.instance = nil
	end
end
tab1 = Singleton:Instance()
tab2 = Singleton:Instance()
print(tab1.instance,tab2.instance)
Singleton:ReleaseInstance()
if tab1==tab2 then
	print("两个对象是相同的实例")
end
print(tab1.instance,tab2.instance)







