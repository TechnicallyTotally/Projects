--[[
   Recode soon!
   Hello Skidders! If You Viewing This, Your Furry, Have Nice A day
]]

local Setting = getgenv and getgenv() or shared do
    local function CheckSetting(Var,DefaultValue)
		if Setting[Var] == nil then
			Setting[Var] = DefaultValue
		end
	end
	
	CheckSetting("HitboxToggle",false)
	CheckSetting("HitboxValue",20)
	CheckSetting("HitboxTransparency",50)
end

local function runcode(func)
  func()
end



local Library = loadstring(game:HttpGet("https://pastebin.com/raw/b11PvrYg"), "Material Lua")()
local Lib = Library:Load({
    Title = "The Actual TD Cheat",
    SizeX = 400,
    SizeY = 300
})

local Main = Lib:New({
    Title = "Main"
})

runcode(function()

Main:Toggle({
    Text = "Hitbox Expander",
    Callback = function(State)
        Setting.HitboxToggle = State;
        if Setting.HitboxToggle then
          task.spawn(function()
            repeat
              wait(1.5)
              for i,v in ipairs(game.Players:GetChildren()) do
              for i2,v2 in next, game.Workspace[v.Name]:GetDescendants() do
                if v2.Name == "collision" and v2.Parent.Name == "torso" and v2.ClassName == "Part" then
                  if v.Name ~= game.Players.LocalPlayer.Name then
                    v2.Size = Vector3.new(Setting.HitboxValue, Setting.HitboxValue, Setting.HitboxValue)
                    v2.Transparency = 1 - (Setting.HitboxTransparency / 100)
                  elseif v.Name == game.Players.LocalPlayer.Name then
                    -- Unavailable
                  end
                end
              end
            end
            until (not Setting.HitboxToggle)
          end)
	   end
    end,
    Enabled = false,
    Menu = {
        Information = function()
            Lib:Banner({
                Text = "Tap it, Toggles The Value Of Hitbox"
            })
        end
    }
})

Main:Slider({
    Text = "Hitbox Expander Size",
    Callback = function(Value)
        if Setting.HitboxToggle then
        	Setting.HitboxValue = Value
        end
    end,
    Min = 5,
    Max = 30,
    Default = 15,
    Menu = {
        Information = function()
            Lib:Banner({
                Text = "Drag The Dot, And Inscrease!"
            })
        end
    }
})

Main:Slider({
    Text = "Hitbox Expander Transparency",
    Callback = function(Value)
        if Setting.HitboxToggle then
        	Setting.HitboxTransparency = Value
        end
    end,
    Min = 0,
    Max = 100,
    Default = 50,
    Menu = {
        Information = function()
            Lib:Banner({
                Text = "Invisible To Visible"
            })
        end
    }
})


end)
