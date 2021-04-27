
if SERVER then
    AddCSLuaFile()
    resource.AddFile("materials/vgui/ttt/events/icon_randomatevent.vmt")
end

if CLIENT then
    EVENT.title = "title_mg_randomat"
    EVENT.icon = Material("vgui/ttt/events/icon_randomatevent.vmt")

    function EVENT:GetText()

        return {
            {
                string = "desc_mg_randomat",
                params = {
                    name = self.event.nick
                }
            }
        }
    end
end

if SERVER then
    function EVENT:Trigger(ply)

        return self:Add({
            nick = ply:Nick(),
            sid64 = ply:SteamID64()
        })
    end
end

function EVENT:Serialize()
    return self.event.nick .. " activated a Randomat"
end