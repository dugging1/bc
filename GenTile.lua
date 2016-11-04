function interpret(img, data)
	local lexer = {pos = -1,currentChar = nil, inp=data,
	advance = function(self)
		self.pos = self.pos + 1
		if self.pos < self.inp:len() then
			self.currentChar = self.inp:sub(self.pos, self.pos)
		else
			self.currentChar = nil
		end
	end,
	def = function(self)
		if (self.pos+2) <= self.inp:len() then
			if self.inp:sub(self.pos, self.pos+2) == "def" then
				self:advance()
				self:advance()
				self:advance()
				return {Type = "Define", val = "def"}
			end
		end
	end,
	path = function(self)
		local nums = {}
		while self.currentChar ~= '"' do
			local num = ""
			while self.currentChar ~= "," and self.currentChar ~= '"' do
				num = num..self.currentChar
				self:advance()
			end
			table.insert(nums,tonumber(num))
			if self.currentChar == "," then
				self:advance()
			end
		end
		self:advance()
		return {Type="Path", val=nums}
	end,
	number = function(self)
		local num = ""
		while tonumber(self.currentChar) ~= nil do
			num = num + self.currentChar
			self.advance()
		end
		return {Type}
	end,
	nextToken = function(self)
		while self.pos < 1 do
			self:advance()
		end
		while self.currentChar ~= nil do
			local de = self:def()
			if de == nil then
				if self.currentChar == "=" then
					self:advance()
					return {Type = "Equals", val = "="}
				elseif self.currentChar == '"' then
					self:advance()
					return self:path()
				elseif self.currentChar == " " then
					self:advance()
				elseif self.currentChar == ";" then
					self:advance()
					return {Type = "SEMI", val=";"}
				else
					v = {Type = "Var", val=self.currentChar}
					self:advance()
					return v
				end
			else
				return de
			end
		end
		return {Type = "EOF", val=nil}
	end,
	}
	local parser = {lex=lexer, currentToken=nil,
	eat = function(self, Type)
		if self.currentToken.Type == Type then
			self.currentToken = self.lex:nextToken()
		else
			--error
			print(">>>>>>>>>>ERROR<<<<<<<<<")
			print(self.currentToken.Type)
			self.currentToken = self.lex:nextToken()
		end
	end,
	expr = function(self)
		if self.currentToken == nil then
			self.currentToken = self.lex:nextToken()
		end
		if self.currentToken.Type == "Define" then
			--Assignment
			self:eat("Define")
			local left = self.currentToken.val
			self:eat("Var")
			self:eat("Equals")
			local right = self.currentToken.val
			self:eat("Path")
			self:eat("SEMI")
			return {Type="Assign", l=left, r=right}
		elseif self.currentToken.Type == "Var" then
			--Line
			local line = {}
			table.insert(line,self.currentToken.val)
			self:eat("Var")
			while self.currentToken.Type == "Var" do
				table.insert(line,self.currentToken.val)
				self:eat("Var")
			end
			self:eat("SEMI")
			return {Type = "Line",val=line}
		else
			--EOF
			return self.currentToken
		end
	end,
	}
	local symbolTable = {}
	local h = 0
	local w = 0
	local step = parser:expr()
	while step.Type ~= "EOF" do
		if step.Type == "Assign" then
			symbolTable[step.l] = step.r
		else
			--Do drawing
			step = step.val
			local var = step[1]
			while table.getn(step) ~= 0 do
				rgba = symbolTable[var]
				img:setPixel(w,h,rgba[1],rgba[2],rgba[3],rgba[4])
				w=w+1
				var = table.remove(step,1)
			end
			w=0
			h=h+1
		end
		step = parser:expr()
	end
	return img
end

function createTile(width, height, name, data)
	local image = love.image.newImageData(tonumber(width), tonumber(height))
	img = interpret(image, data.." ")
	if not love.filesystem.isDirectory("/customChunks") then
		love.filesystem.createDirectory("/customChunks")
	end
	a = img:encode("png", "/customChunks/"..name..".png")
end