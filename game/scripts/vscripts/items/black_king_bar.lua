item_black_king_bar_1 = class(ItemBaseClass)

LinkLuaModifier( "modifier_item_black_king_bar_oaa", "items/black_king_bar.lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_item_black_king_bar_magic_immune", "items/black_king_bar.lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_item_black_king_bar_status_resist", "items/black_king_bar.lua", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------

function item_black_king_bar_1:GetIntrinsicModifierName()
	return "modifier_item_black_king_bar_oaa"
end

--------------------------------------------------------------------------------

function item_black_king_bar_1:OnSpellStart()
  local caster = self:GetCaster()

  caster:AddNewModifier( caster, self, "modifier_black_king_bar_immune", {
    duration = self:GetSpecialValueFor( "duration" ),
  } )
  caster:EmitSound( "DOTA_Item.BlackKingBar.Activate" )

  caster:Purge( false, true, false, false, false )
  -- wow bkb is a basic item without the decay
end

item_black_king_bar_magic_1 = class(item_black_king_bar_1)
item_black_king_bar_status_1 = class(item_black_king_bar_1)

function item_black_king_bar_magic_1:OnSpellStart()
  local caster = self:GetCaster()

  caster:AddNewModifier( caster, self, "modifier_item_black_king_bar_magic_immune", {
    duration = self:GetSpecialValueFor( "duration" ),
  } )
  caster:EmitSound( "DOTA_Item.BlackKingBar.Activate" )

  caster:Purge( false, true, false, false, false )
  -- wow bkb is a basic item without the decay
end

function item_black_king_bar_status_1:OnSpellStart()
  local caster = self:GetCaster()

  caster:AddNewModifier( caster, self, "modifier_item_black_king_bar_status_resist", {
    duration = self:GetSpecialValueFor( "duration" ),
  } )
  caster:EmitSound( "DOTA_Item.BlackKingBar.Activate" )

  caster:Purge( false, true, false, false, false )
  -- wow bkb is a basic item without the decay
end

--------------------------------------------------------------------------------

-- we're using our own modifier for stats since the normal bkb one seems to have weird quirks
modifier_item_black_king_bar_oaa = class(ModifierBaseClass)

--------------------------------------------------------------------------------

function modifier_item_black_king_bar_oaa:IsHidden()
	return true
end

function modifier_item_black_king_bar_oaa:IsDebuff()
	return false
end

function modifier_item_black_king_bar_oaa:IsPurgable()
	return false
end

function modifier_item_black_king_bar_oaa:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

--------------------------------------------------------------------------------

function modifier_item_black_king_bar_oaa:OnCreated( event )
	local spell = self:GetAbility()

	self.str = spell:GetSpecialValueFor( "bonus_strength" )
	self.damage = spell:GetSpecialValueFor( "bonus_damage" )
end

--------------------------------------------------------------------------------

function modifier_item_black_king_bar_oaa:OnRefresh( event )
	local spell = self:GetAbility()

	self.str = spell:GetSpecialValueFor( "bonus_strength" )
	self.damage = spell:GetSpecialValueFor( "bonus_damage" )
end

--------------------------------------------------------------------------------

function modifier_item_black_king_bar_oaa:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
	}

	return funcs
end

--------------------------------------------------------------------------------

function modifier_item_black_king_bar_oaa:GetModifierPreAttack_BonusDamage( event )
	return self.damage
end

--------------------------------------------------------------------------------

function modifier_item_black_king_bar_oaa:GetModifierBonusStats_Strength( event )
	return self.str
end

--------------------------------------------------------------------------------

modifier_item_black_king_bar_magic_immune = class(ModifierBaseClass)

function modifier_item_black_king_bar_magic_immune:DeclareFunctions ()
  return {
    MODIFIER_PROPERTY_ABSOLUTE_NO_DAMAGE_MAGICAL
  }
end

function modifier_item_black_king_bar_magic_immune:GetAbsoluteNoDamageMagical ()
  return true
end

function modifier_item_black_king_bar_magic_immune:GetEffectName()
  return "particles/black_king_bar_overhead.vpcf"
end

--------------------------------------------------------------------------------

modifier_item_black_king_bar_status_resist = class(ModifierBaseClass)

function modifier_item_black_king_bar_status_resist:DeclareFunctions ()
  return {
    MODIFIER_PROPERTY_STATUS_RESISTANCE
  }
end

function modifier_item_black_king_bar_status_resist:GetModifierStatusResistance ()
  return 100
end

function modifier_item_black_king_bar_status_resist:GetEffectName()
  return "particles/items_fx/black_king_bar_avatar.vpcf"
end

--------------------------------------------------------------------------------

item_black_king_bar_2 = item_black_king_bar_1
item_black_king_bar_3 = item_black_king_bar_1
item_black_king_bar_4 = item_black_king_bar_1
item_black_king_bar_5 = item_black_king_bar_1

item_black_king_bar_status_2 = item_black_king_bar_status_1
item_black_king_bar_status_3 = item_black_king_bar_status_1
item_black_king_bar_status_4 = item_black_king_bar_status_1
item_black_king_bar_status_5 = item_black_king_bar_status_1

item_black_king_bar_magic_2 = item_black_king_bar_magic_1
item_black_king_bar_magic_3 = item_black_king_bar_magic_1
item_black_king_bar_magic_4 = item_black_king_bar_magic_1
item_black_king_bar_magic_5 = item_black_king_bar_magic_1
