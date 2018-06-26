--[[Lua面向对象]]--
--Lua 元表与元方法
--元表：Lua中普通的表，定义了原始值在某些特定操作下的的行为
--setmetatable：设置元表
--getmetatable：获取元表

--eg：
-- local tab = {}
-- local  tab_mt = {}
-- local  ret  =  setmetatable(tab,tab_mt)
-- print(ret)
-- print(tab)
-- print(tab_mt)
-- local ret_mt = getmetatable(tab)
-- print(ret_mt)

--元方法：元表中的键，成为事件，元表中的值
--算术元方法
-- __add:+
-- __sub:-
-- __mul:*
-- __div:/
-- __num:~
-- __pow:^
-- __mod:求模

-- local mt = {
-- 	__add = function ( )
-- 		-- body
-- 		print("add")
-- 	end
-- }
-- local mt_tab2 = {
-- 	__add = function ( )
-- 		-- body
-- 		print("Hello")
-- 	end
-- }
-- local t1 = {}
-- local t2 = {}
-- setmetatable(t1,mt)
-- setmetatable(t2,mt_tab2)
-- t3 = t1+t2



--规则：
--如果两个表具有不同的元表：
--如果第一个表具有元表或者元方法，则遵循第一个元表的元方法
--否则，遵循第二个表所对应的元表和元方法
--如果两者均无对应的元表和元方法，抛出异常


--关系元方法
-- __lt:<
-- __eq:==
-- __le:<=
--特殊元方法
-- __index:查询
-- 在访问表中不存在的字段时，允许程序员进行一些自定义操作
-- 两种赋值方式：1、函数 2、表
-- local mt = {
--第一种方式函数
	-- __index = function ()
	-- 	-- body
	-- 	print("key is invalid or is not exist!")
	-- 	return "WongTwoDog"
	-- end
--第二种方法表
    -- __index ={name = "JJ",age = 21} 
-- }
-- local tab = {}
-- setmetatable(tab,mt)
-- print(tab.age)

-- 如果__index赋值为函数，在访问不存在字段时将会回调该函数
-- 如果__index赋值为表，在访问一些不存在字段时，将会向__index所对应的表中查询字段
-- 并返回对应的值
-- __newindex:用于更新
-- 在访问不存在字段时，允许程序员进行自定义更新操作
-- 两种赋值方式：1、函数 2、表
--eg
-- local newTab = {name = "Dog",sex = "Boy",age=22}
-- local mt = {
	-- __newindex = function (table,key,value)
	-- 	-- body
	-- 	print(table,key,value)
	-- end
-- 	__newindex = newTab
-- }
-- local tab = {}
-- setmetatable(tab,mt)
-- tab.word = 33
-- print(newTab.word)

-- 特性：
-- 在访问不存在字段时，如果__newindex对应的是一个函数，则会回调该函数
-- 在访问不存在字段时，如果__newindex对应的是一个表，则将更新__newindex表中字段的信息
-- Lua 全局环境
-- _G
-- gName = "GNAME"
-- print(gName)
-- print(_G.gName)
-- print(_G ["gName"])


















--Lua 模块
-- require("game")
-- game.play()

-- require("Game")

-- print(age)
-- play()






--Lua 面向对象基础
--self:代表对象（表）本身
--.与:  
--使用.运算符进行函数访问时，需要显示传递self参数
--使用:运算符进行函数访问时，不需要显示传递self参数，系统自动进行隐式传递
-- Person = {
-- 	name = nil,
-- 	age = 0
-- }
-- function Person.setName(self,strName)
-- 	-- body
-- 	self.name = strName
-- end
-- Person.setName(Person,"haahah")
-- print(Person.name)

-- function Person:setAge(numAge)
-- 	-- body
-- 	self.age = numAge
-- end
-- Person:setAge(21)
-- print(Person.age)
--继承
Animal = {name = nil,age = 0}
function Animal:new(tab)
	-- body
	local tab = tab or {}
	setmetatable(tab,self)
	self.__index = self
	return tab
end
function Animal:setName(strName)
	-- body
	self.name = strName
end
Lion = Animal:new()
Lion:setName("KK")
print(Lion.name)
print(Animal.name)

function  Lion:setAge(numAge)
	-- body
	self.age = numAge
end
function Lion:setName()
	-- body
	print("override")
end
Lion.setName()
Lion.setName("Lion")
Lion:setAge(20)
print(Lion.age)

-- Dog = Animal:new()
-- Dog:setName("husky")
-- print(Dog.name)





-- function class(classname,super)
-- 	-- body
-- 	local superType = type(super)
-- 	local cls = nil
-- 	if super then
-- 		cls = {}
-- 		setmetatable(cls,{__index = super})
-- 		cls.super = super
-- 	else
-- 		cls = {ctor = function()end}
-- 	end

-- 	cls.__cname = classname
-- 	cls.__ctype = 2--lua
-- 	cls.__index = cls 
-- 	function cls:new( ... )
-- 		-- body
-- 		local instance = setmetatable({},cls)
-- 		instance.class = cls
-- 		instance:ctor(...)
-- 		return instance
-- 	end
-- 	return cls
-- end
-- tab = {}
-- tab1 = class("cls",tab)
-- print(tab1.__index)
-- print(tab1)


-- local Shape = class("Shape")
-- function  Shape:ctor(shapeName)
-- 	-- body
-- 	self.shapeName = shapeName
-- 	print("Shape:ctor(%s)",self.shapeName)
-- end
-- function  Shape:draw()
-- 	-- body
-- 	print("draw %s",self.shapeName)
-- end
-- Shape:ctor("sss")
-- Shape:draw()
-- local Circle = class("Circle",Shape)
-- function Circle:ctor()
-- 	-- body
-- 	Circle.super.ctor(self,"circle")
-- 	self.radius = 100
-- end
-- function Circle:setRadius(radius)
-- 	-- body
-- 	self.radius = radius
-- end
-- function Circle:draw()
-- 	-- body
-- 	print("draw %s,radius = %0.2f",self.shapeName,self.radius)
-- end
-- local Rectangle = class("Rectangle",Shape)
-- function  Rectangle:ctor()
-- 	-- body
-- 	Rectangle.super.ctor(self,"rectangle")
-- end


-- local circle = Circle.new()
-- circle:setRadius(200)
-- circle:draw()
-- radius = 200.00

-- local  rectangle = Rectangle.new()
-- Shape:ctor(rectangle)
-- rectangle:draw()



-- tabm = {1,2,"Monday",3,mon="Fri",4,"Week"}
-- print(#tabm)

function Count(  )
	-- body
	local  i = 0

	return function (  )
		-- body
		i = i + 1
		return i
end
end

local func = Count()
print(func())
print(func())
print(func())
