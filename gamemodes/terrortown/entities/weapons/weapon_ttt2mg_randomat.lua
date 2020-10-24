if SERVER then
	resource.AddFile("materials/vgui/ttt/icon_randomat")

	AddCSLuaFile()
else -- CLIENT
	SWEP.ViewModelFOV = 60
	SWEP.ViewModelFlip = false

	SWEP.EquipMenuData = {
		type = "item_weapon",
		name = "ttt2_weapon_randomat_name",
		desc = "ttt2_weapon_randomat_desc"
	}

	SWEP.Icon = "vgui/ttt/icon_randomat"
end

SWEP.Base = "weapon_tttbase"
SWEP.Kind = WEAPON_EQUIP2
SWEP.Spawnable = true
SWEP.AutoSpawnable = false
SWEP.HoldType = "slam"
SWEP.AdminSpawnable = true
SWEP.AutoSwitchFrom = false
SWEP.AutoSwithTo = false

SWEP.AllowDrop = true
SWEP.NoSights = true
SWEP.UseHands = true
SWEP.CanBuy = {ROLE_DETECTIVE}

SWEP.ViewModel = "models/weapons/v_c4.mdl"
SWEP.WorldModel = "models/weapons/w_c4.mdl"
SWEP.Weight = 2

SWEP.Primary.Ammo = "none"
SWEP.Primary.ClipsSize = 1
SWEP.Primary.DefaultClip = 1

if CLIENT then
	function SWEP:Initialize()
		self:AddTTT2HUDHelp("ttt2_weapon_randomat_help_msb1")
	end
end

function SWEP:PrimaryAttack()
	if CLIENT then return end

	minigame = minigames.Select()

	if not minigame then
		self:Remove()

		return
	end

	ActivateMinigame(minigame)

	DamageLog("[TTT2][MINIGAME] : " .. self:GetOwner():Nick() .. " [" .. self:GetOwner():GetRoleString() .. "] used their Randomat X")

	self:SetNextPrimaryFire(CurTime() + 10)
	self:Remove()
end

function SWEP:SecondaryAttack()

end
