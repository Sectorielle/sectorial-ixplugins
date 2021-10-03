PLUGIN.name = "Armor Saver"
PLUGIN.author = "Sectorial.Commander"
PLUGIN.description = "Saves armor data."


function PLUGIN:CharacterPreSave(character)
	local client = character:GetPlayer()
		if IsValid(client) then
			local armor = client:Armor()
			character:SetData('armor', armor)
		end
end

function PLUGIN:PlayerLoadedCharacter(client)
	timer.Simple(0.25, function()
		if not IsValid(client) then
			return 
		end
		local character = client:GetCharacter()

		if not character then
			return
		end

		local armor = character:GetData('armor')
		if isnumber(armor) then
			client:SetArmor(armor)
		end
	end)
end