
-- include("includes/modules/minigames.lua")
if SERVER then
  AddCSLuaFile()
elseif CLIENT then
  SWEP.ViewModelFOV = 60
  SWEP.ViewModelFlip = false

  SWEP.EquipMenuData = {
    type = "weapon",
    name = "Randommat X",
    desc = "Randomat X starts a random minigame!"
  }

  SWEP.Icon = "VGUI/ttt/icon_randomat"

  function SWEP:PrimaryAttack() end
end

SWEP.Base = "weapon_tttbase"
SWEP.Kind = WEAPON_EQUIP2
SWEP.Spawnable = true
SWEP.AutoSpawnable = false
SWEP.HoldType = "slam"
SWEP.AdminSpawnable = true
SWEP.AutoSwitchFrom = false
SWEP.AutoSwithTo = false

SWEP.AllowDrop = false
SWEP.NoSights = true
SWEP.UseHands = true
SWEP.CanBuy = {ROLE_DETECTIVE}

SWEP.ViewModel = "models/weapons/gamefreak/c_csgo_c4.mdl"
SWEP.WorldModel = "models/weapons/gamefreak/w_c4_planted.mdl"
SWEP.Weight = 2

SWEP.Primary.Ammo = "none"
SWEP.Primary.ClipsSize = 1
SWEP.Primary.DefaultClip = 1

function SWEP:Initialize()
  util.PrecacheSound("weapons/c4_initiate.wav")
end

function SWEP:PrimaryAttack()
  if SERVER then
    minigame = minigames.Select()
    if not minigame then self:Remove() return end

    ActivateMinigame(minigame)

    DamageLog("[TTT2][MINIGAME] : " .. self:GetOwner():Nick() .. " [" .. self:GetOwner():GetRoleString() .. "] used their Randomat X")
    self:SetNextPrimaryFire(CurTime() + 10)

    self:Remove()
  end
end

function SWEP:SecondaryAttack()

end
