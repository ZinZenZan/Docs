### DOCS ###

--Start(afterattackorbwalkerargs.lua)--
---AfterAttackOrbwalkerArgs
---@class AfterAttackOrbwalkerArgs
---@field target AttackableUnit
AfterAttackOrbwalkerArgs = {}


--End(afterattackorbwalkerargs.lua)--

--Start(beforeattackorbwalkerargs.lua)--
---BeforeAttackOrbwalkerArgs
---@class BeforeAttackOrbwalkerArgs
---@field target AttackableUnit
BeforeAttackOrbwalkerArgs = {}


--End(beforeattackorbwalkerargs.lua)--

--Start(castargs.lua)--
---CastArgs
---@class CastArgs
---@field spell Spell
---@field slot SpellSlot
---@field handleCaster integer
---@field networkIdMissile integer
---@field from Vector3
---@field to Vector3
---@field limit Vector3
---@field target AttackableUnit
---@field timeAnimStart number
---@field timeWindupEnd number
---@field timeAnimEnd number
---@field cooldown number
---@field isChanneling boolean
---@field isCharging boolean
---@field wasCast boolean
---@field isStopped boolean
---@field level number
---@field delay number
---@field animationTime number
---@field isAutoAttack boolean
CastArgs = {}

---Returns the spell delay0 and spell delay1.
---@return number, number
CastArgs.GetDelayPartial = function() end


--End(castargs.lua)--

--Start(castspellargs.lua)--
---CastSpellArgs
---@class CastSpellArgs
---@field slot SpellSlot
---@field spellbookEntry SpellBookEntry
---@field target AIBaseClient
---@field p1 Vector3
---@field p1Alt Vector3 #Alternative position used for some spells
---@field p2 Vector3
CastSpellArgs = {}


--End(castspellargs.lua)--

--Start(issueorderargs.lua)--
---IssueOrderArgs
---@class IssueOrderArgs
---@field source AIBaseClient
---@field type IssueOrderType
---@field targetPos Vector3
---@field targetEntity AttackableUnit
---@field isAttackMove boolean
---@field isPetCommand boolean
IssueOrderArgs = {}


--End(issueorderargs.lua)--

--Start(callback.lua)--
---Callback Usage
---@class CallbackType
CallbackType = {}

---Fired every time the game renders a frame. Can be used to draw to the screen using renderer functions.
CallbackType.OnDraw = function() end

---Fired every time the game renders a frame with ImGui. Can be used to draw to the screen using ImGui functions.
CallbackType.OnImguiDraw = function() end

---Fired every time the game update object. Can be used to run champion logic.
CallbackType.OnTick = function() end

---Fired every time the game update object. Can be used to run champion logic. Faster than on tick, do not use if not necessary.
CallbackType.OnFastTick = function() end

---Fired when script unload. Make sure to dispose of your objects and clean up with this callback.
CallbackType.OnUnload = function() end

---Fired before orbwalker want to attack someone.
---@param beforeAttackOrbwalkerArgs BeforeAttackOrbwalkerArgs #
CallbackType.OnBeforeAttack = function(beforeAttackOrbwalkerArgs) end

---Fired when orbwalker finishes an attack.
---@param afterAttackOrbwalkerArgs AfterAttackOrbwalkerArgs #
CallbackType.OnAfterAttack = function(afterAttackOrbwalkerArgs) end

---Fired when issuing movement or attack order.
---@param issueOrderArgs IssueOrderArgs #
CallbackType.OnIssueOrder = function(issueOrderArgs) end

---Fired on manual spell cast by the user (before OnSpellCast).
---@param spellData Spell #(Spelldata Class) 
---@param targetHandle number #(integer) 
CallbackType.OnCastHud = function(spellData, targetHandle) end

---Fired on client-side spell cast.
---@param castSpellArgs CastSpellArgs #
CallbackType.OnSpellCast = function(castSpellArgs) end

---Fired when a spell cast is started.
---@param sender AIBaseClient #
---@param castArgs CastArgs #
CallbackType.OnSpellAnimationStart = function(sender, castArgs) end

---Fired when a spell cast is finished.
---@param sender AIBaseClient #
---@param castArgs CastArgs #
CallbackType.OnSpellCastComplete = function(sender, castArgs) end

---Fired when a spell cast is stopped.
---@param sender AIBaseClient #
---@param castArgs CastArgs #
CallbackType.OnSpellAnimationCancel = function(sender, castArgs) end

---Fired when missile is being updated. For example for Yuumi Q. You can edit the position.
--[[```lua
-- Example: OnUpdateMissile example
Callback.Bind(CallbackType.OnUpdateMissile, function(pos)
    pos.x = Game.GetCursorWorldPosition().x + 500
end)
```]]
---@param pos Vector3 #
CallbackType.OnUpdateMissile = function(pos) end

---Fired when a spell slot name change.
---@param sender AIBaseClient #
---@param slot SpellSlot #
---@param name string #
CallbackType.OnChangeSlotSpellName = function(sender, slot, name) end

---Fired when evolving a spell.
---@param slot SpellSlot #
CallbackType.OnEvolve = function(slot) end

---Fired when GameObject is created.
---@param sender GameObject #
CallbackType.OnObjectCreate = function(sender) end

---Fired when GameObject is removed.
---@param sender GameObject #
CallbackType.OnObjectRemove = function(sender) end

---Fired when a message is printed to game chat.
---@param message string #
---@param flags number #(integer) 
CallbackType.OnPrintChat = function(message, flags) end

---Fired when when unit gets a new path.
---
---**Caution:**  I think sometimes this callback is not reliable. When Leesin R kick someone path may incorrect.
--[[```lua
-- Example: OnNewPath Callback Example
Callback.Bind(CallbackType.OnNewPath,function(sender,isDash,dashSpeed,path)
    for i, v in path:pairs() do
         PrintChat(tostring(i))
         PrintChat(tostring(v))
    end
end)
```]]
---@param sender AIbaseClient #
---@param isDash boolean #
---@param dashSpeed number #
---@param path Vector2[] #(std::vector<Vector2>) Path
CallbackType.OnNewPath = function(sender, isDash, dashSpeed, path) end

---Fired when unit gains or loses a buff.
---@param buffScriptInstance BuffScript #
---@param isGain boolean #
CallbackType.OnGainLoseBuff = function(buffScriptInstance, isGain) end

---Fired when one of unit buffs is updated.
---@param sender AIBaseClient #
---@param buffInstance Buff #
CallbackType.OnUpdateBuff = function(sender, buffInstance) end

---Fired when unit plays some animation.
---@param sender AIBaseClient #
---@param animationName string #
CallbackType.OnPlayAnimation = function(sender, animationName) end

---Fired on various game events such as surrender vote.
---@param eventName string #Event name string
---@param eventID number #(integer) Event name ID
---@param sourceNetworkID #(integer) Source entity network ID
CallbackType.OnNotify = function(eventName, eventID, sourceNetworkID) end

---Fired when player pings something. This event can be cancelled similar to OnSpellCast or OnIssueOrder.
---@param pos Vector3 #Pinged position
---@param targetNetworkID number #(integer) Pinged target network ID
---@param type PingType #Used ping type
CallbackType.OnSendPing = function(pos, targetNetworkID, type) end

---Fired on any ping.
---@param pos Vector3 #Pinged position
---@param targetHandle number #(integer) Pinged target handle
---@param sourceHandle number #(integer) Source handle
---@param type PingType #Used ping type
---@param isPlaySound boolean #Is playing sound
CallbackType.OnShowPing = function(pos, targetHandle, sourceHandle, type, isPlaySound) end

---Fired on minimap icon change.
---@param sender AIBaseClient #Sender entity
---@param name string #Icon name
---@param type string #Icon type
CallbackType.OnMinimapIconChange = function(sender, name, type) end

---Fired when Evade takes action to dodge something.
---@param position Vector2 #Position where evade will try to dodge.
---@param spellData? SpellData #Spell data of evading ability spell unless it was movement.
CallbackType.OnEvade = function(position, spellData) end

---Fired when Evade creates an instance of skillshot.
---@param skillshot Skillshot #Skillshot instance created by Evade.
CallbackType.OnSkillshotCreate = function(skillshot) end


--End(callback.lua)--

--Start(aibaseclient.lua)--
---Inherited from GameObject and AttackableUnit class.
---@class AIBaseClient : AttackableUnit
---@field spellBook SpellBook
---@field buffManager BuffManager
---@field activeSpell CastArgs
---@field isZombie boolean
---@field charName string
---@field actionState integer
---@field actionState2 integer
---@field isMoving boolean
---@field petOwner AIBaseClient
---@field attackDelay number
---@field attackCastDelay number
---@field isClone boolean
---@field dashSpeed number
---@field isDashing boolean
---@field serverPosition Vector3
---@field isMagicImmune boolean
---@field isPhysicalImmune boolean
---@field isUnstoppable boolean
---@field totalHealth number
---@field missingHealth number
---@field totalMaxHealth number
---@field healthMaxFromStats number
---@field totalShield number
---@field canAttack boolean
---@field canCrit boolean
---@field canCast boolean
---@field canMove boolean
---@field isImmovable boolean
---@field isStealthed boolean
---@field isTaunted boolean
---@field isFeared boolean
---@field isFleeing boolean
---@field isSupressed boolean
---@field isAsleep boolean
---@field isGhosted boolean
---@field isCharmed boolean
---@field isDisarmed boolean
---@field isRooted boolean
---@field isSilenced boolean
---@field isStunned boolean
---@field hasAABlockingBuff boolean
---@field isMelee boolean
---@field isRanged boolean
---@field hash integer
---@field totalBaseAttackDamage number
---@field totalBonusAttackDamage number
---@field totalAttackDamage number
---@field totalAbilityPower number
---@field isCasting boolean
---@field isLaneMinion boolean
---@field isSiegeMinion boolean
---@field isSuperMinion boolean
---@field isCasterdMinion boolean
---@field isMeleeMinion integer
---@field isPet boolean
---@field isWard boolean
---@field isWardNoBlue boolean
---@field isTrap boolean
---@field isPlant boolean
---@field isLargeMonster boolean
---@field isBaron boolean
---@field isDragon boolean
---@field isEpicMonster boolean
---@field isSmiteMonster boolean
---@field charIntermediate CharIntermediate
---@field gold number
---@field goldTotal number
---@field minimumGold number
AIBaseClient = {}

---Returns the entity is a bot.
---@return boolean
AIBaseClient.IsBot = function(self) end

---Returns the entity's direction vector.
---@return Vector3
AIBaseClient.GetDirection = function(self) end

---Returns the size of entity's pet array. Entities may have multiple pets. Index starts from 0.
---@return number
AIBaseClient.GetPetHandleSize = function(self) end

---Returns entity's pet handle by index. Entities may have multiple pets. Index starts from 0.
--[[```lua
-- Example: Get first pet
local petHandleSize = Game.localPlayer:GetPetHandleSize()
if petHandleSize > 0 then
    for i=0, petHandleSize-1 do
        local petHandle = Game.localPlayer:GetPetHandleByIndex(i)
        local pet = petHandle and ObjectManager.ResolveHandle(petHandle)
        if pet and pet:IsValid() then
            print(pet:GetUniqueName())
        end
    end
end
```]]
---@return AIBaseClient
AIBaseClient.GetPetHandleByIndex = function(self) end

---Returns the entity's active target.
---@return AttackableUnit
AIBaseClient.GetTarget = function(self) end

---Returns the entity's last waypoint.
---@return Vector3
AIBaseClient.GetWayPoint = function(self) end

---Returns the entity's remaining path array.
---@return Vector2[] #(std::vector<Vector2>)
AIBaseClient.GetRemainingPath2D = function(self) end

---Returns a SpellBookEntry.
---@param slot SpellSlot #(integer0-64) SpellSlot enum.
---@return SpellBookEntry
AIBaseClient.GetSpellEntry = function(self, slot) end

---Returns SpellSlot or SpellSlot.NullSlot.
---@param spellName string #Spell Name for finding spell.
---@return SpellSlot
AIBaseClient.GetSpellSlot = function(self, spellName) end

---Returns a entity's auto attack damage to target.
---@param target AttackableUnit #Target.
---@return number
AIBaseClient.GetAutoAttackDamage = function(self, target) end

---Returns if entity is facing source \(inside cone\).
---@param source AIBaseClient #Check from source.
---@param angle number  #(float) Cone angle.
---@param range number  #(float) Max check range.
---@return boolean
AIBaseClient.IsFacing = function(self, source, angle, range) end

---Use an object like lantern etc.
---@param target AttackableUnit #Target to use.
AIBaseClient.UseObject = function(self, target) end

---Returns if has buff of type.
---@param type BuffType #(integer) BuffType enum.
---@return boolean
AIBaseClient.HasBuffOfType = function(self, type) end

---Returns if entity is a clone from source entity.
---@param source AIBaseClient #Source of clone.
---@return boolean
AIBaseClient.IsCloneFrom = function(self, source) end

---Returns if entity can use spell of given slot.
---@param slot SpellSot #(integer0-64) SpellSlot enum.
---@return boolean
AIBaseClient.CanUseSpell = function(self, slot) end

---Returns entity real health include Shields and Blitzcrank's passive.
---@param msTime number #(float) Time to predict HPRegenRate.
---@param type DamageType #DamageType enum.
---@return number
AIBaseClient.GetRealHealth = function(self, msTime, type) end

---Returns a buff at `index`.
---@param index Integer #Buff array index.
---@return Buff
AIBaseClient.GetBuff = function(self, index) end

---Returns Buff find by fnv\_hash\(name\).
---@param hash number #(Integer) Buff name Hash
---@return Buff
AIBaseClient.FindBuff = function(self, hash) end

---Returns Buff stacks find by fnv\_hash\(name\).
---@param hash number #(Integer) Buff name Hash
---@return number
AIBaseClient.GetBuffStacks = function(self, hash) end

---Returns real auto attack range \(worked for Azir, Aphelios, Caitlyn and most heroes\).
---@param target AttackableUnit #Target could be null.
---@return number
AIBaseClient.GetAutoAttackRange = function(self, target) end

---Returns whether entity is playing specific animation.
---@param animationHash number #Animation hash. Can be taken with Game.fnvhash(animationName).
---@return boolean
AIBaseClient.IsPlayingAnimation = function(self, animationHash) end

---Returns whether entity is still have given remaining time for certain playing animation.
---@param animationHash number #Animation hash. Can be taken with Game.fnvhash(animationName).
---@param remainingTime number #Remaining time to check.
---@return boolean
AIBaseClient.HasTimeRemainingForAnimation = function(self, animationHash, remainingTime) end

---Returns current grass group ID.
---@return number
AIBaseClient.GetGrassGroupToIgnore = function(self) end

---Returns if entity is recalling.
---@return boolean
AIBaseClient.IsRecalling = function(self) end

---Finds safe spot using game function.
---@param position Vector3
---@return Vector3
AIBaseClient.FindSafeSpot = function(self, position) end

---Returns TeamFlag / NavConditionFlag.
---@return number
AIBaseClient.GetNavConditionFlags = function(self) end

---Returns whether enemy is casting or channeling interruptible spell or not.
---
---**Tip:** 0 - Not casting. 1 - Medium danger level spell. 2 - Dangerous spell.
---@return number #(integer)
AIBaseClient.IsCastingInterruptibleSpell = function(self) end

---Returns whether entity is invulnerable towards damage from another entity (source).
---@param source number #Entity to check invulnerability against
---@return boolean
AIBaseClient.IsInvulnerable = function(self, source) end


--End(aibaseclient.lua)--

--Start(aiheroclient.lua)--
---'Inherited from GameObject , AIBaseClient and AttackableUnit class.'
---@class AIHeroClient : AIBaseClient
---@field canShop boolean
---@field summonerLevel number
---@field avatarClient AvatarClient
AIHeroClient = {}

---Returns whether hero can level up a spell in given SpellSlot or not.
---@param slot SpellSlot #Given slot.
---@return boolean
AIHeroClient.CanLevelSpellSlot = function(self, slot) end

---Returns whether hero can evolve a spell in given SpellSlot or not.
---@param slot SpellSlot #Given slot.
---@return boolean
AIHeroClient.CanEvolveSpellSlot = function(self, slot) end

---Buy an item by given id.
---@param id number #(integer) Given item id.
AIHeroClient.BuyItem = function(self, id) end

---Sell an item by given slot.
---@param slot number #(integer) Given item slot.
AIHeroClient.SellItem = function(self, slot) end

---Swap an item from one slot to another.
---@param from number #(integer) Move from this slot.
---@param to number #(integer) Move to this slot.
AIHeroClient.SwapItem = function(self, from, to) end

---Get inventory slot from given item slot.
---@param slot number #(integer) Given item slot.
---@return InventorySlot
AIHeroClient.GetItem = function(self, slot) end

---Get inventory slot from given item id.
---@param id number #(integer) Given item id.
---@return InventorySlot
AIHeroClient.FindItem = function(self, id) end

---Get spell slot from given item id.
---@param id number #(integer) Given item id.
---@return SpellSlot
AIHeroClient.FindItemSlot = function(self, id) end

---Returns whether hero can use item with given item id.
---@param id number #(integer) Given item id.
---@return boolean
AIHeroClient.CanUseItem = function(self, id) end

---Returns HeroStatsCollection
---@return HeroStatsCollection
AIHeroClient.GetStatsCollection = function(self) end


--End(aiheroclient.lua)--

--Start(aiminionclient.lua)--
---'Inherited from GameObject , AIBaseClient and AttackableUnit class.'
---@class AIMinionClient : AIBaseClient
---@field minionLevel number
AIMinionClient = {}


--End(aiminionclient.lua)--

--Start(aiturretclient.lua)--
---'Inherited from GameObject , AIBaseClient and AttackableUnit class.'
---@class AITurretClient : AIBaseClient
---@field tier number
---@field targetNetworkID number
AITurretClient = {}


--End(aiturretclient.lua)--

--Start(attackableunit.lua)--
---Inherited from GameObject class.
---@class AttackableUnit : GameObject
---@field mp number
---@field maxMp number
---@field resourceType integer
---@field secondaryResource number
---@field maxSecondaryResource number
---@field statusFlags integer
---@field pathfindingCollisionRadius number
---@field lifetime number
---@field maxLifetime number
---@field lifetimeTicks number
---@field physicalDamagePercentageModifier number
---@field magicalDamagePercentageModifier number
---@field hpPercent number
---@field mpPercent number
---@field isVisible boolean
---@field isTargetable boolean
---@field isHPBarRendered boolean
AttackableUnit = {}

---Returns if this entity is winding up.
---**Danger:** If you want to utilize spell queue then avoid using this check for spells which do not interrupt basic attacks. Instead use Orbwalker.CanUseSpell function.
---@return boolean
AttackableUnit.IsWindingUp = function(self) end

---Returns if this entity is valid target.
---@param range number #Check range.
---@param onlyEnemyTeam bool #Check target team.
---@param from Vector2 or Vector3 #Check from pos.
---@return boolean
AttackableUnit.IsValidTarget = function(self, range, onlyEnemyTeam, from) end

---Returns if this unit can be targeted by given unit.
---@param unit AttackableUnit #Given unit
AttackableUnit.IsTargetableByUnit = function(self, unit) end

--End(attackableunit.lua)--

--Start(avatarclient.lua)--
---AvatarClient class.
---@class AvatarClient
---@field owner AIHeroClient #AvaterClient owner.
---@field ownerHandle number #(integer) AvatarClient owner's handler.
---@field keystonePerkID number #(integer) Keystone perk ID.
---@field perks PerkInfo[] #(std::vector<PerkInfo>) Container with all perks PerkInfo.
AvatarClient = {}

---Returns Keystone Perk.
---@return Perk
AvatarClient.GetKeystonePerk = function(self) end


--End(avatarclient.lua)--

--Start(buff.lua)--
---Buff class.
---@class Buff
---@field isValid boolean
---@field startTime number
---@field expireTime number
---@field leftTime number
---@field short integer
---@field int integer
---@field type BuffType
---@field owner AIBaseClient
---@field source AIBaseClient
---@field hash integer
Buff = {}

---Returns buff name.
---@return string
Buff.GetName = function(self) end


--End(buff.lua)--

--Start(buffmanager.lua)--
---Buff Manager.
---@class BuffManager
---@field buffs Buff[] #(std::vector<Buff>)
---@field owner AIBaseClient
---@field ownerHandle integer
---@field ownerNetworkID integer
BuffManager = {}

---Returns team dragon buff count.
---@param type DragonType #DragonType enum.
---@param team Team #Team number.
---@return integer
BuffManager.GetDragonBuffCount = function(self, type, team) end


--End(buffmanager.lua)--

--Start(buffscript.lua)--
---BuffScript.
---@class BuffScript
---@field casterHandle integer
---@field casterNetworkID integer
---@field buffInstance Buff
---@field sourceName string
BuffScript = {}


--End(buffscript.lua)--

--Start(callback.lua)--
---Bind or unbind event.
---@class Callback
Callback = {}

---Returns callback unique id.
---@param type CallbackType #CallbackType.
---@param callback function #Callback function.
---@param priority number #(integer) Callback priority\(default 0\)
---@return number
Callback.Bind = function(type, callback, priority) end

---Unblind callback by unique id.
Callback.Unbind = function() end


--End(callback.lua)--

--Start(charintermediate.lua)--
---CharIntermediate struct.
---@class CharIntermediate
---@field percentCooldownMod number
---@field abilityHasteMod number
---@field percentCooldownCapMod number
---@field passiveCooldownEndTime number
---@field passiveCooldownTotalTime number
---@field percentDamageToBarracksMinionMod number
---@field increasedMoveSpeedMinionMod number
---@field flatDamageReductionFromBarracksMinionMod number
---@field flatPhysicalDamageMod number
---@field percentPhysicalDamageMod number
---@field percentBonusPhysicalDamageMod number
---@field percentBasePhysicalDamageAsFlatBonusMod number
---@field flatMagicDamageMod number
---@field percentMagicDamageMod number
---@field flatMagicReduction number
---@field percentMagicReduction number
---@field flatCastRangeMod number
---@field attackSpeedMod number
---@field percentAttackSpeedMod number
---@field percentMultiplicativeAttackSpeedMod number
---@field baseAttackDamage number
---@field baseAttackDamageSansPercentScale number
---@field flatBaseAttackDamageMod number
---@field percentBaseAttackDamageMod number
---@field baseAbilityDamage number
---@field scaleSkinCoef number
---@field dodge number
---@field crit number
---@field armor number
---@field bonusArmor number
---@field spellBlock number
---@field bonusSpellBlock number
---@field flatBaseArmorMod number
---@field flatBaseSpellBlockMod number
---@field hpRegenRate number
---@field baseHPRegenRate number
---@field moveSpeed number
---@field moveSpeedBaseIncrease number
---@field attackRange number
---@field flatBubbleRadiusMod number
---@field percentBubbleRadiusMod number
---@field par number
---@field maxPAR number
---@field physicalLethality number
---@field parEnabled number
---@field percentArmorPenetration number
---@field percentBonusArmorPenetration number
---@field sar number
---@field percentCritBonusArmorPenetration number
---@field maxSAR number
---@field percentCritTotalArmorPenetration number
---@field sarEnabled number
---@field flatMagicPenetration number
---@field magicLethality number
---@field percentMagicPenetration number
---@field percentBonusMagicPenetration number
---@field percentLifeStealMod number
---@field percentSpellVampMod number
---@field percentOmnivampMod number
---@field percentPhysicalVamp number
---@field pathfindingRadiusMod number
---@field percentCCReduction number
---@field percentEXPBonus number
---@field primaryARRegenRateRep number
---@field primaryARBaseRegenRateRep number
---@field secondaryARRegenRateRep number
---@field secondaryARBaseRegenRateRep number
CharIntermediate = {}


--End(charintermediate.lua)--

--Start(effectemitter.lua)--
---Effect object. Inherited from GameObject.
---
---**Tip:** These properies are useful to identify EffectEmitter object by their key rather than by object name.
--[[```lua
-- Example: Identifying Syndra Q Gather objects
local SyndraQGatherKey = 3075502988         -- Syndra_Base_Q_2021_aoe_gather, Syndra_Skin01_Q_aoe_gather, etc
local SyndraQGatherLv5Key = 3214691578      -- Syndra_Base_Q_Lv5_aoe_gather
Callback.Bind(CallbackType.OnObjectCreate, function(object)
    if not object or not object:IsValid() then return end
    if object.type ~= ObjectType.obj_GeneralParticleEmitter then return end

    local source = object.effectSourceFirst and object.effectSourceFirst:IsValid() and object.effectSourceFirst

    if source and source.isEnemy and (effectKey == SyndraQGatherKey or effectKey == SyndraQGatherLv5Key) then
        -- ...
    end
end)
```]]
---@class EffectEmitter : GameObject
---@field effectKey number #Unique effect key. This key is the same for different versions of EffectEmitter object despite the skin and hostility.
---@field effectSourceList GameObject[] #(std::vector<GameObject>) A list of sources. Apparently each EffectEmitter can have multiple sources.
---@field effectSourceFirst GameObject #First source of this EffectEmitter. Added for convenience.
EffectEmitter = {}

---Returns followed object (if it follows any).
---@return GameObject
EffectEmitter.GetFollowTarget = function(self) end


--End(effectemitter.lua)--

--Start(gameobject.lua)--
---Base entity class.
---
---**Tip:** `__eq` has been overriden so that you can just use `==` to compare entities.
---@class GameObject
---@field team Team
---@field handle integer
---@field networkId integer
---@field isVisibleOnScreen boolean
---@field type ObjectType
---@field flags integer
---@field displayName string
---@field bboxMax Vector3
---@field bboxMin Vector3
---@field position Vector3
---@field position2D Vector2
---@field isVisible boolean
---@field isAlive boolean
---@field isMe boolean
---@field hitboxRadius float
---@field isStructure boolean
---@field isAttacableUnit boolean
---@field isAlly boolean
---@field isEnemy boolean
---@field isNeutral boolean
---@field isMonster boolean
---@field isAIBase boolean
---@field isMinion boolean
---@field isHero boolean
---@field isTurret boolean
---@field isMissile boolean
GameObject = {}

---Returns object casted as final type.
---@return GameObject
GameObject.CastAsFinal = function(self) end

---Returns the entity level.
---@return number
GameObject.Level = function(self) end

---Returns the entity's memory address.
---@return number
GameObject.GetAddress = function(self) end

---Print the entity's memory address on console.
GameObject.PrintAddress = function(self) end

---Returns if this is a valid entity.
---@return boolean
GameObject.IsValid = function(self) end

---Returns entity's unique name.
---@return string
GameObject.GetUniqueName = function(self) end

---Returns entity's unique data table.
---@return table<any>
GameObject.GetData = function(self) end


--End(gameobject.lua)--

--Start(herostatscollection.lua)--
---HeroStatsCollection struct
---@class HeroStatsCollection
---@field kills number #Kills count
---@field deaths number #Deaths count
---@field assists number #Assists count
HeroStatsCollection = {}


--End(herostatscollection.lua)--

--Start(inventoryslot.lua)--
---InventorySlot struct
---@class InventorySlot
---@field stacks number #Amount of stacks
---@field updateTime number #Update time
---@field scriptBaseItem ScriptBaseItem #Base item instance
InventorySlot = {}


--End(inventoryslot.lua)--

--Start(itemdata.lua)--
---ItemData struct
---@class ItemData
---@field id number #Item ID
---@field name string #Item name
---@field displayName string #Display name
---@field spellName string #Spell name
---@field description string #Item description
---@field tooltip string #Tooltip string key argument to be used in Game.TranslateString function.
---@field price number #Item price in the shop
ItemData = {}

---Returns calculation result similar to SpellBookEntry.GetCalculateInfo
---@param source AIBaseClient #Souce for calculate.
---@param hash number #(integer) Calculation name hash.
---@return number
ItemData.GetCalculateInfo = function(self, source, hash) end


--End(itemdata.lua)--

--Start(missileclient.lua)--
---Inherited from GameObject class.
---@class MissileClient : GameObject
---@field handleMissileOwner integer
---@field handleMissileTarget integer
---@field startTime number
---@field width number
---@field destroyed boolean
---@field speed number
---@field missileOrigin Vector3
---@field missileDestination Vector3
---@field spell Spell
MissileClient = {}


--End(missileclient.lua)--

--Start(perk.lua)--
---Perk class.
---@class Perk
---@field id number #(integer)
---@field name string
---@field tooltip string
---@field longDescription string
---@field shortDescription string
---@field displayName string
---@field displayStat string
Perk = {}


--End(perk.lua)--

--Start(perkinfo.lua)--
---PerkInfo class.
---@class PerkInfo
---@field data Perk #Perk data.
---@field baseStat number #(double)
---@field bonusMagicStat number #(double)
---@field bonusPhysicalStat number #(double)
PerkInfo = {}


--End(perkinfo.lua)--

--Start(proximitydata.lua)--
---ProximityData struct. Used by TurretTracker.
---@class ProximityData
---@field IsInsideRange boolean #
---@field Distance float #
---@field IsCloseToEdge boolean #
ProximityData = {}


--End(proximitydata.lua)--

--Start(scriptbaseitem.lua)--
---ScriptBaseItem struct
---@class ScriptBaseItem
---@field buffName string #Buff name
---@field itemData ItemData #Item data
ScriptBaseItem = {}


--End(scriptbaseitem.lua)--

--Start(spell.lua)--
---Spelldata class.
---@class Spell
---@field info SpellInfo
---@field hash number
Spell = {}

---Returns SpellData Name.
---@return string
Spell.GetName = function(self) end


--End(spell.lua)--

--Start(spellbook.lua)--
---SpellBook class.
---@class SpellBook
SpellBook = {}

---Returns SpellBookEntry.
---@param slot SpellSlot #(integer0-64) SpellSlot enum.
---@return SpellBookEntry
SpellBook.GetSpellEntry = function(self, slot) end

---Print spell range,cost and missile speed on console.
---@param slot SpellSlot #(integer0-64) SpellSlot enum.
SpellBook.PrintSpells = function(self, slot) end

---Level up a spell in given SpellSlot.
---@param slot SpellSlot #Given slot.
SpellBook.LevelSpell = function(self, slot) end

---Evolve a spell in given SpellSlot.
---@param slot SpellSlot #Given slot.
SpellBook.EvolveSpell = function(self, slot) end


--End(spellbook.lua)--

--Start(spellbookentry.lua)--
---SpellBookEntry class.
---@class SpellBookEntry
---@field info SpellInfo
---@field spell Spell #(Spelldata Class)
---@field isToggled boolean
---@field internalState boolean
---@field level number
---@field timeCooldownOver number
---@field timeNextRecharge number
---@field ammo number
---@field cooldown number
---@field rechargeTime number
---@field fValue float[] #Contains special f tooltip values. See example for more info.
SpellBookEntry = {}

---Returns if entry is valid.
---@return boolean
SpellBookEntry.IsValid = function(self) end

---Returns SpellData Name.
---@return string
SpellBookEntry.GetName = function(self) end

---Returns spell mana cost.
---@return number
SpellBookEntry.ManaCost = function(self) end

---Returns spell displayRange.
---@return number
SpellBookEntry.DisplayRange = function(self) end

---Returns calculation result
--[[```lua
-- Example: Get total damage from Lux Q tooltip
local TotalDamageHash = Game.fnvhash("TotalDamageTT")
local entry = Game.localPlayer:GetSpellEntry(SpellSlot.Q)
local totalDamage = entry:GetCalculateInfo(Game.localPlayer, TotalDamageHash, SpellSlot.Q)
```]]
---@param source AIBaseClient #Souce for calculate.
---@param hash number #(integer) Calculation name hash.
---@param slot SpellSlot #(integer0-64) SpellSlot enum.
---@return number
SpellBookEntry.GetCalculateInfo = function(self, source, hash, slot) end

---Print spell tooltip text in game. you can use **GetCalculateInfo** to get tooltip tag value**.**
---@param extended boolean #Print extended tooltip.
---@return 
SpellBookEntry.PrintTooltip = function(self, extended) end


-- Examples:

-- Example 1: Accessing damage fValue from Ignite tooltip
local slot = SpellSlot.F

-- Print tooltip to see which f value we need to use:
Game.localPlayer:GetSpellEntry(slot):PrintTooltip(false)

-- Access 1st fValue:
print(Game.localPlayer:GetSpellEntry(slot).fValue[1]) -- Index starts from 1. In this example if Ignite is in F slot it will print Ignite damage

--End(spellbookentry.lua)--

--Start(spellinfo.lua)--
---SpellInfo class.
---@class SpellInfo
---@field missileSpeed number
---@field missileAccel number
---@field missileMaxSpeed number
---@field missileMinSpeed number
---@field castFrame number
---@field lineWidth number
---@field increasedMoveSpeedMinionMod number
---@field cooldown number
---@field channelDuration number
---@field targettingType integer
SpellInfo = {}


--End(spellinfo.lua)--

--Start(bufftype.lua)--
---'BuffTypeEnum : Integer'
---@class BuffType
---@field Invalid number
---@field Internal number
---@field Aura number
---@field CombatEnchancer number
---@field CombatDehancer number
---@field SpellShield number
---@field Stun number
---@field Invisibility number
---@field Silence number
---@field Taunt number
---@field Polymorph number
---@field Slow number
---@field Snare number
---@field Damage number
---@field Heal number
---@field Haste number
---@field SpellImmunity number
---@field PhysicalImmunity number
---@field Invulnerability number
---@field Taunt number
---@field AttackSpeedSlow number
---@field NearSight number
---@field Currency number
---@field Fear number
---@field Charm number
---@field Poison number
---@field Suppression number
---@field Blind number
---@field Counter number
---@field Shred number
---@field Flee number
---@field Knockup number
---@field Knockback number
---@field Disarm number
---@field Grounded number
---@field Drowsy number
---@field Asleep number
---@field Obscured number
---@field ClickproofToEnemies number
---@field UnKillable number
BuffType = {}


--End(bufftype.lua)--

--Start(callbackresult.lua)--
---'Callback result :Integer'
---@class CallbackResult
---@field Success number #Default result.
---@field Dispose number #Unload this callback.
---@field Cancel number #Prevent this event called by game.
---@field CancelAndDispose number #Prevent this event and unload this callback.
CallbackResult = {}


--End(callbackresult.lua)--

--Start(callbacktype.lua)--
---'CallbackType : Integer'
---@class CallbackType
---@field OnDraw number #Fired every time the game renders a frame. Can be used to draw to the screen using renderer functions.
---@field OnImguiDraw number #Fired every time the game renders a frame with ImGui. Can be used to draw to the screen using ImGui functions.
---@field OnTick number #Fired every time the game update object. Can be used to run champion logic.
---@field OnFastTick number #Fired every time the game update object. Can be used to run champion logic. Faster than on tick, do not use if not necessary.
---@field OnUnload number #Fired when script unload. Make sure to dispose of your objects and clean up with this callback.
---@field OnBeforeAttack number #Fired before orbwalker want to attack someone.
---@field OnAfterAttack number #Fired when orbwalker finishes an attack.
---@field OnIssueOrder number #Fired when issuing movement or attack order.
---@field OnCastHud number #Fired on manual spell cast by the user (before OnSpellCast).
---@field OnSpellCast number #Fired on client-side spell cast.
---@field OnSpellAnimationStart number #Fired when a spell cast is started.
---@field OnSpellCastComplete number #Fired when a spell cast is finished.
---@field OnSpellAnimationCancel number #Fired when a spell cast is stopped.
---@field OnUpdateMissile number #Fired when missile is being updated. For example for Yuumi Q. You can edit the position.
---@field OnChangeSlotSpellName number #Fired when a spell slot name change.
---@field OnEvolve number #Fired when evolving a spell.
---@field OnObjectCreate number #Fired when GameObject is created.
---@field OnObjectRemove number #Fired when GameObject is removed.
---@field OnPrintChat number #Fired when a message is printed to game chat.
---@field OnNewPath number #Fired when when unit gets a new path.
---@field OnGainLoseBuff number #Fired when unit gains or loses a buff.
---@field OnUpdateBuff number #Fired when one of unit buffs is updated.
---@field OnPlayAnimation number #Fired when unit plays some animation.
---@field OnNotify number #Fired on various game events such as surrender vote.
---@field OnSendPing number #Fired when player pings something. This event can be cancelled similar to OnSpellCast or OnIssueOrder.
---@field OnShowPing number #Fired on any ping.
---@field OnMinimapIconChange number #Fired on minimap icon change.
---@field OnEvade number #Fired when Evade takes action to dodge something.
---@field OnSkillshotCreate number #Fired when Evade creates an instance of skillshot.
CallbackType = {}


--End(callbacktype.lua)--

--Start(cameracontroller.lua)--
---'CameraControllerType:Integer'
---@class CameraController
---@field Free number
---@field FirstPerson number
---@field ThirdPerson number
---@field Focus number
---@field PathFollowing number
CameraController = {}


--End(cameracontroller.lua)--

--Start(cellflag.lua)--
---'CellFlag:Integer'
---@class CellFlag
---@field None number
---@field Grass number
---@field Wall number
---@field CanSeeThrough number
---@field Prop number
CellFlag = {}


--End(cellflag.lua)--

--Start(collisionflag.lua)--
---'CollisionFlag enum:bit flag.'
---
---**Tip:** You can use bit operation to contact multi flag.
--[[```lua
-- Example: Set Collides with Minions, YasuoWall and Heroes
collisionFlags = bit.bor(CollisionFlag.CollidesWithYasuoWall,CollisionFlag.CollidesWithMinions,CollisionFlag.CollidesWithHeroes)
Champions.Q:SetSkillshot(0.25,60,1000,SkillshotType.SkillshotLine,true,collisionFlags,HitChance.High,true)
```]]
---@class CollisionFlag
---@field CollidesWithNothing number
---@field CollidesWithYasuoWall number
---@field CollidesWithMinions number
---@field CollidesWithWalls number
---@field CollidesWithStructures number
---@field CollidesWithHeroes number
CollisionFlag = {}


--End(collisionflag.lua)--

--Start(crowdcontroltype.lua)--
---Crowd control type.
---@class CrowdControlType
---@field Airborne number #Can't move, can't cast, can't aa. you can remove stun effect by cleansing effects (except Cleanse), but you can't remove airborne movement part.after you removed stun effect and you can cast spells again - you can use any mobility spell to override airborne movement.
---@field Blind number #Makes you miss all your aa
---@field Entangle number #Root + disarm: can't move, can't use mobility spells, can't attack
---@field Taunt number #Can't move, can't cast, can't control aa.
---@field Charm number #Can't move, can't cast, can't aa
---@field Fear number #Can't move, can't cast, can't aa.
---@field Flee number #Can't move, can't cast, can't aa.
---@field Ground number #Can move but can't use mobility spells
---@field Nearsight number #Limits your vision
---@field Root number #Can't move, can't use mobility spells such as : dash / flash / teleport / shen R etc
---@field Silence number #Can't cast
---@field Slow number #Slows your movement
---@field Stasis number #Can't move, can't cast, can't aa, makes you untargetable. basically immunity (zhonya etc):
---@field Stun number #Can't move, can't cast, can't aa
---@field Suppression number #Can't move, can't cast, can't aa
---@field Disarm number #Can't aa
---@field Cripple number #Slows attack speed
---@field Disrupt number #Interrupt of channeled and charged spells
---@field Knockdown number #Not really a CC. puts you back on the ground from airborne or dash.It does not trigger Yasuo R.
---@field Suspension number #Same as airborne but can be fully removed by cleansing effects
---@field Sleep number #Can't move, can't cast, can't aa. interrupted if target takes damage.
---@field Pacify number #Disarm + silence: can't aa, can't cast
---@field Polymorph number #Disarm + silence + slow ? : can't aa, can't cast
---@field Berserk number #Can't move, can't cast, can't aa (like stun or charm). A unit that is berserk will attempt to perform basic attacks on a nearby unit regardless of being ally, enemy, or neutral for the duration.
---@field Opener number #Custom (fake) CC type which represents spells with opener capabilities. Such spells usually will be followed up by some dangerous combo. For example Lee Sin Q, Amumu Q and so on.
CrowdControlType = {}


--End(crowdcontroltype.lua)--

--Start(damagetype.lua)--
---'DamageTypeEnum:Integer'
---@class DamageType
---@field Physical number
---@field Magical number
---@field True number
---@field Mixed number
DamageType = {}


--End(damagetype.lua)--

--Start(dangerlevel.lua)--
---Spell danger level.
---@class DangerLevel
---@field None number
---@field Low number #Spells which can be ignored most of the time.
---@field Medium number #Spells which may deal medium damage or apply light crowd control.
---@field High number #Dangerous spells which deal significant damage or apply hard crowd control.
---@field Extreme number #Most dangerous spells such as Ashe R, Malphite R and so on.
Data.DangerLevel = {}


--End(dangerlevel.lua)--

--Start(dragontype.lua)--
---DragonType.
---@class DragonType
---@field Normal number
---@field Infernal number
---@field Cloud number
---@field Ocean number
---@field Mountain number
---@field Elder number
DragonType = {}


--End(dragontype.lua)--

--Start(effecttype.lua)--
---'Renderer.EffectType : Integer'
---
---**Note:** Part of Renderer namespace.
---@class EffectType
---@field GlowingCircle number #
---@field GlowingCircle2 number #
---@field HighlightCircle number #
---@field TargetCircle number #
---@field MagicalCircle number #
Renderer.EffectType = {}


--End(effecttype.lua)--

--Start(emote.lua)--
---'EmoteEnum : Integer'
---@class Emote
---@field Dance number #0
---@field Taunt number #1
---@field Laugh number #2
---@field Joke number #3
---@field Toggle number #4
Emote = {}


--End(emote.lua)--

--Start(gradienttype.lua)--
---'Renderer.GradientType : Integer'
---
---**Note:** Part of Renderer namespace.
---@class GradientType
---@field Solid number #Fills with single color.
---@field Linear number #Fills with linear gradient.
---@field Radial number #Fills with radial gradient.
Renderer.GradientType = {}


--End(gradienttype.lua)--

--Start(hitchance.lua)--
---'HitChance enum:integer.'
---@class HitChance
---@field Collision number
---@field OutOfRange number
---@field Impossible number
---@field Low number
---@field Medium number
---@field High number
---@field VeryHigh number
---@field Dashing number
---@field Immobile number
HitChance = {}


--End(hitchance.lua)--

--Start(issueordertype.lua)--
---'IssueOrderTypeEnum:Integer'
---@class IssueOrderType
---@field None number
---@field HoldPosition number
---@field MoveTo number
---@field AttackUnit number
---@field AutoAttackPet number
---@field AutoAttack number
---@field MovePet number
---@field AttackTo number
---@field Stop number
IssueOrderType = {}


--End(issueordertype.lua)--

--Start(objecttype.lua)--
---'ObjectTypeIDEnum:Integer'
---@class ObjectType
---@field NeutralMinionCamp number
---@field AIHeroClient number
---@field AIMarker number
---@field AIMinionClient number
---@field FollowerObject number
---@field LevelPropAIClient number
---@field AITurretCommon number
---@field AITurretClient number
---@field obj_GeneralParticleEmitter number
---@field GameObject number
---@field Pawn number
---@field MissileClient number
---@field DrawFX number
---@field UnrevealedTarget number
---@field TFTSlotObject number
---@field Barracks number
---@field BarracksDampener number
---@field obj_Levelsizer number
---@field obj_NavPoint number
---@field obj_SpawnPoint number
---@field AnimatedBuilding number
---@field BuildingClient number
---@field GrassObject number
---@field HQ number
---@field obj_InfoPoint number
---@field MapProp number
---@field LevelPropGameObject number
---@field LevelPropSpawnerPoint number
---@field Shop number
---@field obj_Turret number
---@field Unknown number
ObjectType = {}


--End(objecttype.lua)--

--Start(orbwalkermode.lua)--
---OrbwalkerMode Enum bit flag
---
---**Tip:** You can use bit operation to set multiple active modes at once.
--[[```lua
-- Example: Programmatically set Orbwalker active mode(s) using bit library.
Orbwalker.activeMode = bit.bxor(Orbwalker.activeMode, OrbwalkerMode.Combo) -- Set Combo
Orbwalker.activeMode = bit.band(Orbwalker.activeMode, bit.bnot(OrbwalkerMode.Combo)) -- Unset Combo
```]]
---@class OrbwalkerMode
---@field None number
---@field Combo number
---@field Harass number
---@field LastHit number
---@field LaneClear number
---@field JungleClear number
---@field Flee number
OrbwalkerMode = {}


--End(orbwalkermode.lua)--

--Start(pingtype.lua)--
---PingType enum:integer
---@class PingType
---@field Default number #
---@field Danger number #
---@field EnemyMissing number #
---@field OnMyWay number #
---@field Caution number #
---@field AssistMe number #
---@field VisionHere number #
---@field VisionCleared number #
---@field NeedVision number #
---@field Push number #
---@field AllIn number #
---@field Retreat number #
---@field Bait number #
---@field Hold number #
PingType = {}


--End(pingtype.lua)--

--Start(skillshottype.lua)--
---'SkillshotType enum:integer.'
---@class SkillshotType
---@field SkillshotLine number
---@field SkillshotCircle number
---@field SkillshotCone number
SkillshotType = {}


--End(skillshottype.lua)--

--Start(spellslot.lua)--
---'SpellSlot Enum : Integer'
---@class SpellSlot
---@field NullSlot number #0xFFFFFFFF
---@field Q number #0
---@field W number #1
---@field E number #2
---@field R number #3
---@field D number #4
---@field F number #5
---@field Item1 number #6
---@field Item2 number #7
---@field Item3 number #8
---@field Item4 number #9
---@field Item5 number #10
---@field Item6 number #11
---@field Trinket number #12
---@field Recall number #13
---@field Passive number #63
SpellSlot = {}


--End(spellslot.lua)--

--Start(spellslottype.lua)--
---'SpellSlotType Enum : Integer'
---@class SpellSlotType
---@field Invalid number
---@field Champion number
---@field Summoner number
---@field Item number
SpellSlotType = {}


--End(spellslottype.lua)--

--Start(team.lua)--
---'GameTeamEnum : Integer'
---@class Team
---@field Neutral number #300
---@field Order number #100
---@field Chaos number #200
---@field Unknown number #0
---@field Enemy number #Enemy team.
---@field Ally number #Ally team.
Team = {}


--End(team.lua)--

--Start(teleportstatus.lua)--
---TeleportStatus
---@class TeleportStatus
---@field Unknown number #
---@field Abort number #
---@field Start number #
---@field Finish number #
TeleportStatus = {}


--End(teleportstatus.lua)--

--Start(teleporttype.lua)--
---TeleportType
---@class TeleportType
---@field Unknown number #
---@field Recall number #
---@field Shen number #
---@field TwistedFate number #
---@field Teleport number #
TeleportType = {}


--End(teleporttype.lua)--

--Start(game.lua)--
---Game info and functions.
---@class Game
---@field localPlayer AIHeroClient
Game = {}

---Returns your current latency.
---@return number
Game.GetLatency = function() end

---Returns game tick count now.
---@return integer
Game.GetTickCount = function() end

---Returns game clock time now.
---@return number
Game.GetTime = function() end

---Returns fnvhash of string.
---@param str string #String for calculate\(case ignore\).
---@return integer
Game.fnvhash = function(str) end

---Returns spelldataHash of string.
---@param str string #String for calculate\(case ignore\).
---@return integer
Game.spelldataHash = function(str) end

---Returns translated string.
---@param str string #String key to translate. You may use displayName value from https://127.0.0.1:2999/liveclientdata/playerlist
---@return string
Game.TranslateString = function(str) end

---Returns game id.
---@return number
Game.GameID = function() end

---Returns game mode.
---@return string
Game.GameMode = function() end

---Returns game type.
---@return string
Game.GameType = function() end

---Returns if game is not custom.
---@return boolean
Game.IsMatchmadeGame = function() end

---Returns game region.
---@return string
Game.Region = function() end

---Returns game map id.
---@return integer
Game.MapID = function() end

---Returns game map name.
---@return string
Game.MapName = function() end

---Returns pos is wall of type wall.
---@param pos Vector2 or Vector3 #Check pos.
---@param flag CellFlag #Flag for check.
---@param radius number #Range for check.
---@return boolean
Game.IsWallOfType = function(pos, flag, radius) end

---Returns pos is in fow.
---@param pos Vector3 #Check pos.
---@return boolean
Game.IsInFoW = function(pos) end

---Get Spelldata by spell hash.
--[[```lua
-- Example: Get spell data info value
local WSpell = Game.GetSpellByHash(Game.spelldataHash("PickACard")) -- You can get spelldata by hash
if WSpell then
    local sucusss,value = WSpell:GetCalculateInfo(Game.fnvhash("GoldBase"), W:DataInstance().level)
    print(value)
end
```]]
---@param spellHash number #(integer) Spell hash.
---@return Spell
Game.GetSpellByHash = function(spellHash) end

---Get target under our cursor.
---
--[[```lua
-- Example: Force target under our cursor.
Callback.Bind(CallbackType.OnTick, function()
    local hover = Game.GetHoveredUnit()
    TargetSelector.SetForcedTarget(hover and hover:IsValid() and hover or nil)
end)
```]]
---@return AttackableUnit
Game.GetHoveredUnit = function() end

---Get manually selected (clicked) target.
---@return AttackableUnit
Game.GetSelectedTarget = function() end

---Get cursor world position
---@return Vector3
Game.GetCursorWorldPosition = function() end

---Create obstacle instance to be used with CreateSpecialPath
---@param position Vector2 #Obstacle position.
---@param radius number #(float) Obstacle radius.
---@return SpecialPathObstacle
Game.SpecialPathObstacle = function(position, radius) end

---Returns calculated path from given start position to given end position.
---@param startPos Vector2 #Start position.
---@param endPos Vector2 #End position.
---@param bSmoothPath boolean #Return smooth path. Recommended to use true.
---@return Vector2[] #(std::vector<Vector2>)
Game.CreatePath = function(startPos, endPos, bSmoothPath) end

---Returns calculated path from given start position to given end position.
---@param startPos Vector3 #Start position.
---@param endPos Vector3 #End position.
---@param bSmoothPath boolean #Return smooth path. Recommended to use true.
---@return Vector2[] #(std::vector<Vector2>)
Game.CreatePath = function(startPos, endPos, bSmoothPath) end

---Returns calculated path from player position to given end position.
---@param endPos Vector2 #End position.
---@param bSmoothPath boolean #Return smooth path. Recommended to use true.
---@return Vector2[] #(std::vector<Vector2>)
Game.CreatePath = function(endPos, bSmoothPath) end

---Returns calculated path from player position to given end position.
---@param endPos Vector2 #End position.
---@param bSmoothPath boolean #Return smooth path. Recommended to use true.
---@return Vector2[] #(std::vector<Vector2>)
Game.CreatePath = function(endPos, bSmoothPath) end

---Returns special calculated path from given start position to given end position, but it adds "fake walls" under each minion and hero within given range.
--[[```lua
-- Example: Get special path from player position to cursor. Useful for movement checks inside groups of minions and close to heroes.
Callback.Bind(CallbackType.OnDraw, function()
    -- Example 1: Basic usage with friendly units, 1000 rangeFilter:
    -- local path = Game.CreateSpecialPath(Game.localPlayer.position2D, Game.GetCursorWorldPosition():To2D(), true, 1000)

    -- Example 2: include friendly units, 1000 rangeFilter, add 100 extra collision radius and ignore currently selected target:
    local path = Game.CreateSpecialPath(Game.localPlayer.position2D, Game.GetCursorWorldPosition():To2D(), true, 1000, 100, { Game.GetSelectedTarget() and Game.GetSelectedTarget().handle or 0 })

    if path and #path > 0 then
        Renderer.DrawVectorPoly(path, 1, 0xFFFFFFFF) -- Draw full path (overload with std::vector<Vector2> argument)
    end
end)
```]]
---@param startPos Vector2 #Start position.
---@param endPos Vector2 #End position.
---@param includeAllies? boolean #Include friendly units or not. False by default.
---@param rangeFilter? number #(float) Add "fake walls" only to units within this range from start position. 500 by default.
---@param extraCollisionRadius? number #(float) Extra pathfinding collision radius. 0 by default.
---@param excludeObjectHandles? table #(std::unordered_set<unsigned>) Handle list of all objects you want to exclude.
---@param smoothPath? boolean #Return smooth path. True by default.
---@return Vector2[] #(std::vector<Vector2>)
Game.CreateSpecialPath = function(startPos, endPos, includeAllies, rangeFilter, extraCollisionRadius, excludeObjectHandles, smoothPath) end


---Returns special calculated path from given start position to given end position, but it adds "fake walls" under selected objects and custom obstacles.
--[[```lua
-- Example: Get special path from player position to cursor. Useful for movement checks inside groups of minions and close to heroes.
Callback.Bind(CallbackType.OnDraw, function()
    local path = Game.CreateSpecialPathEx(
        Game.localPlayer.position2D,
        Game.GetCursorWorldPosition():To2D(),
        {
            Game.SpecialPathObstacle(Game.localPlayer.position2D + Math.Vector2(500, 0), 100),
            Game.SpecialPathObstacle(TurretTracker.GetClosestAllyTurretPosition(), 500),
        },
        { ObjectType.AIHeroClient, ObjectType.AIMinionClient },
        true,
        1000,
        400,
        { Game.GetSelectedTarget() and Game.GetSelectedTarget().handle or 0 }
    )

    if path and #path > 0 then
        Renderer.DrawVectorPoly(path, 1, 0xFFFFFFFF) -- Draw full path (overload with std::vector<Vector2> argument)
    end
end)
```]]
---@param startPos Vector2 #Start position.
---@param endPos Vector2 #End position.
---@param customObstacles? table #(std::vector<SpecialPathObstacle>) A list of custom obstacles.
---@param includeObjectTypes? table #(std::unordered_set<ObjectType>) A list of all game object types you want to include.
---@param includeAllies? boolean #Include friendly units or not. False by default.
---@param rangeFilter? number #(float) Add "fake walls" only to units within this range from start position. 500 by default.
---@param extraCollisionRadius? number #(float) Extra pathfinding collision radius. 0 by default.
---@param excludeObjectHandles? table #(std::unordered_set<unsigned>) Handle list of all objects you want to exclude.
---@param smoothPath? boolean #Return smooth path. True by default.
---@return Vector2[] #(std::vector<Vector2>)
Game.CreateSpecialPathEx = function(startPos, endPos, customObstacles, includeObjectTypes, includeAllies, rangeFilter, extraCollisionRadius, excludeObjectHandles, smoothPath) end

---Issue order in safe way.
---@param orderType IssueOrderType #
---@return boolean
Game.IssueOrder = function(orderType) end

---Issue order in safe way to a position.
---@param orderType IssueOrderType #
---@param position Vector2 #
---@return boolean
Game.IssueOrder = function(orderType, position) end

---Issue order in safe way to a position.
---@param orderType IssueOrderType #
---@param position Vector3 #
---@return boolean
Game.IssueOrder = function(orderType, position) end

---Issue order in safe way to a target.
---@param orderType IssueOrderType #
---@param target AttackableUnit #
---@return boolean
Game.IssueOrder = function(orderType, target) end

---Perform emote.
---@param emoteType Emote #
Game.DoEmote = function(emoteType) end

---Send chat message.
---@param msg string #Message to be sent. Use /all prefix if you want to send to All Chat.
Game.SendChat = function(msg) end

---Send ping.
---@param targetNetworkID number #(integer) Network ID of the target to ping
---@param position Vector2 #Positiong to ping
---@param pingType PingType #Used ping type
Game.SendPing = function(targetNetworkID, position, pingType) end

---Show ping locally.
---@param sourceHandle number #(integer) Ping source handle
---@param targetHandle number #(integer) Pinged target handle
---@param position Vector2 #Pinged position
---@param pingType PingType #Used ping type
---@param isPlaySound boolean #Play sound or not
---@param isTriggerEvent boolean #Trigger event or not
Game.ShowPing = function(sourceHandle, targetHandle, position, pingType, isPlaySound, isTriggerEvent) end

---Returns if camera is locked
---@return boolean
Game.IsCameraLocked = function() end

---Returns if camera is locked
---@param state boolean #Lock state
Game.CameraLockToggle = function(state) end


--End(game.lua)--

--Start(bit.lua)--
---LuaJIT library for bitwise operations
---@class bit
bit = {}

---Returns the bitwise arithmetic right-shift of its first argument by the number of bits given by the second argument. Arithmetic right-shift treats the most-significant bit as a sign bit and replicates it. Only the lower 5 bits of the shift count are used \(reduces to the range \[0..31\]\).
---@param x number #number
---@param n number #number of bits
---@return number
bit.arshift = function(x, n) end

---Returns the bitwise and of all of its arguments. Note that more than two arguments are allowed.
---@param x1 number #number
---@vararg number #number\(s\)
---@return number
bit.band = function(x1, ...) end

---Returns the bitwise not of its argument.
---@param x number #number
---@return number
bit.bnot = function(x) end

---Returns the bitwise or of all of its arguments. Note that more than two arguments are allowed.
---@param x1 number #number
---@vararg number #number\(s\)
---@return number
bit.bor = function(x1, ...) end

---Swaps the bytes of its argument and returns it. This can be used to convert little-endian 32 bit numbers to big-endian 32 bit numbers or vice versa.
---@param x number #number
---@return number
bit.bswap = function(x) end

---Returns the bitwise xor of all of its arguments. Note that more than two arguments are allowed.
---@param x1 number #number
---@vararg number #number\(s\)
---@return number
bit.bxor = function(x1, ...) end

---Returns the bitwise logical left-shift of its first argument by the number of bits given by the second argument. Logical shifts treat the first argument as an unsigned number and shift in 0-bits. Only the lower 5 bits of the shift count are used \(reduces to the range \[0..31\]\).
---@param x number #number
---@param n number #number of bits
---@return number
bit.lshift = function(x, n) end

---Returns the bitwise left rotation of its first argument by the number of bits given by the second argument. Bits shifted out on one side are shifted back in on the other side. Only the lower 5 bits of the rotate count are used \(reduces to the range \[0..31\]\).
---@param x number #number
---@param n number #number of bits
---@return number
bit.rol = function(x, n) end

---Returns the bitwise right rotation of its first argument by the number of bits given by the second argument. Bits shifted out on one side are shifted back in on the other side. Only the lower 5 bits of the rotate count are used \(reduces to the range \[0..31\]\).
---@param x number #number
---@param n number #number of bits
---@return number
bit.ror = function(x, n) end

---Returns the bitwise logical right-shift of its first argument by the number of bits given by the second argument. Logical shifts treat the first argument as an unsigned number and shift in 0-bits. Only the lower 5 bits of the shift count are used \(reduces to the range \[0..31\]\).
---@param x number #number
---@param n number #number of bits
---@return number
bit.rshift = function(x, n) end

---Normalizes a number to the numeric range for bit operations and returns it. This function is usually not needed since all bit operations already normalize all of their input arguments.
---@param x number #number to normalize
---@return number
bit.tobit = function(x) end

---Converts its first argument to a hex string. The number of hex digits is given by the absolute value of the optional second argument. Positive numbers between 1 and 8 generate lowercase hex digits. Negative numbers generate uppercase hex digits. Only the least-significant 4\*n bits are used. The default is to generate 8 lowercase hex digits.
---@param x number #number to convert
---@param n number #number of hex digits to return
---@return number
bit.tohex = function(x, n) end


--End(bit.lua)--

--Start(common-api.lua)--
---Common library with some useful helper functions and classes made by our Lua developers.
---@class Common
Common = {}

---Executes given action (function) after given delay (in seconds) using OnTick.
---@param action function #Given action function
---@param delay number #Given delay
Common.DelayAction = function(action, delay) end

---Executes given action (function) after given delay (in seconds) using OnDraw.
---@param action function #Given action function
---@param delay number #Given delay
Common.DelayActionPrecise = function(action, delay) end

---Executes given action (function) after certain given frames.
---@param action function #Given action function
---@param frames number #Given frames to wait
Common.DelayActionFrames = function(action, frames) end

---Creates and returns empty Queue instance.
---@return Queue
Common.Queue = function() end

---Creates and returns Queue instance based on table with elements with index starting from 1.
---@param t any[] #Table with elements
---@return Queue
Common.Queue = function(t) end

---Returns enum name.
---@param enumTable any[] #Enumeration table
---@param enum any #Enumeration value
---@return string
Common.GetEnumName = function(enumTable, enum) end

---Rolls a chance. Returns true if roll is successful.
---@param chance number #Any number in range from 0 to 100
---@return boolean
Common.RollChance = function(chance) end

---Returns remaining recall time for player.
---@return number
Common.GetRemainingRecallTime = function() end

---Returns whether unit has immunity.
---@param unit AIBaseClient #Unit to check
---@return boolean
Common.IsUnitImmune = function(unit) end

---Returns whether unit has spell immunity (i.e. has spellshield).
---@param unit AIBaseClient #Unit to check
---@return boolean
Common.IsUnitSpellImmune = function(unit) end

---Returns whether unit is fleeing from gives position.
---@param unit AIBaseClient #Unit to check
---@param pos Vector3 #Position to check
---@return boolean
Common.IsFleeing = function(unit, pos) end

---Returns closest enemy to the player.
---@return AIHeroClient
Common.ClosestEnemy = function() end


--End(common-api.lua)--

--Start(queue.lua)--
---Common.Queue class. Queue implementation based on table.insert and table.remove.
---
---**Note:** Part of Common namespace.
---**Tip:** In LuaJIT it's almost as fast as alternative implementation from https://www.lua.org/pil/11.4.html and even though it's slightly slower - it provides much more functionality.
---@class Queue
Common.Queue = {}

---Push the value to the beginning of the queue.
---@param val any #Any value
Queue.PushLeft = function(self, val) end

---Push the value to the end of the queue.
---@param val any #Any value
Queue.PushRight = function(self, val) end

---Pop the value from the beginning of the queue. Returns the popped value.
---@return any
Queue.PopLeft = function(self) end

---Pop the value from the end of the queue. Returns the popped value.
---@return any
Queue.PopRight = function(self) end

---Iterator. Implemented as pairs(Queue.list).
Queue.Pairs = function(self) end

---You can push values directly even in the middle of the queue. Implemented as table.insert(Queue.list, key, value).
---@param key number #Index
---@param val any #Any value
Queue.__newindex = function(self, key, val) end


-- Examples:

-- Example 1: Basic usage
local q = Queue({1, 2, 3})
q:PushLeft(1)
q:PushRight(2)
q:PushLeft(0)
for i=1, #q do
    print(q[i])
end

local q = Queue()
q:PushRight(function() print("Action 1") end)
q:PushRight(function()
    print("Action 2")
    q:PushLeft(function() print("Top Priority Action!") end)
end)
q:PushRight(function() print("Action 3") end)
while #q > 0 do
    q:PopLeft()()
end


--End(queue.lua)--

--Start(math-api.lua)--
---Math library.
---@class Math
Math = {}

---Returns if Line1 and Line2 have Intersection.
---@param a1 Vector2 #Line 1 start.
---@param a2 Vector2 #Line 1 end.
---@param b1 Vector2 #Line 2 start.
---@param b2 Vector2 #Line 2 end.
---@return boolean
Math.LineIntersection = function(a1, a2, b1, b2) end

---Returns if Line1 and Line2 have Intersection.
---@param a1 Vector2 #Segment 1 start.
---@param a2 Vector2 #Segment1 end.
---@param b1 Vector2 #Segment2 start.
---@param b2 Vector2 #Segment2 end.
---@return boolean
Math.LineSegmentIntersection = function(a1, a2, b1, b2) end

---Returns sqrt result.
---@param value number #(float) Number for sqrt.
---@return number
Math.FastSqrt = function(value) end

---Returns Quaternion Rotation Vector4.
---@param yaw number #(float) Yaw
---@param pitch number #(float) Pitch
---@param roll number #(float) Angle
---@return Vector4
Math.QuaternionRotation = function(yaw, pitch, roll) end

---Returns Vector4.
---@param x number #(float) x
---@param y number #(float) y
---@param z number #(float) z
---@param w number #(float) w
---@return Vector4
Math.Vector4 = function(x, y, z, w) end

---Returns Vector3.
---@param x number #(float) x
---@param y number #(float) y
---@param z number #(float) z
---@return Vector3
Math.Vector3 = function(x, y, z) end

---Returns Vector2.
---@param x number #(float) x
---@param y number #(float) y
---@return Vector2
Math.Vector2 = function(x, y) end

---Returns the result of the Catmull-Rom interpolation.
---@param a Vector2 #a
---@param b Vector2 #b
---@param c Vector2 #c
---@param d Vector2 #d
---@param t number #(float) Weighting factor.
---@return Vector2
Math.CatmullRom = function(a, b, c, d, t) end

---Returns angle between ba and bc.
---@param a Vector2 #PA
---@param b Vector2 #PB
---@param c Vector2 #PC
---@return number
Math.GetAngle = function(a, b, c) end

---Returns angle degree between ba and bc \(0-180\).
---@param a Vector2 #PA
---@param b Vector2 #PB
---@param c Vector2 #PC
---@return number
Math.GetAngleDeg = function(a, b, c) end

---Returns angle degree between ba and bc \(-180-180\).
---@param a Vector2 #PA
---@param b Vector2 #PB
---@param c Vector2 #PC
---@return number
Math.GetFullAngleDeg = function(a, b, c) end

---Returns true if line segment 1 and line segment2 has intersection and intersection point\(if false ,defalut return point a\).
---@param a Vector2 #Line 1 start.
---@param b Vector2 #Line 1 end.
---@param c Vector2 #Line 2 start
---@param d Vector2 #Line 2 end.
---@return boolean, Vector2
Math.LineSegmentIntersection = function(a, b, c, d) end

---Returns two Intersection points if exist or else reutrns nil.
---@param a Vector2 #Line start.
---@param b Vector2 #Line end.
---@param c Vector2 #Center.
---@param radius number #Circle radius.
---@param onlySegment boolean #Only check ab as line segment.
---@return [Vector2], [Vector2]
Math.CircleLineIntersection = function(a, b, c, radius, onlySegment) end

---Returns circle points table.
---@param center Vector2 #Center.
---@param radius number #Circle radius.
---@param quality number #Circle sides.
---@return Vector2[]
Math.BuildCircle = function(center, radius, quality) end

---Returns safe circle points.
---@param center Vector2 #Center position.
---@param radius number #Circle radius.
---@param sides number #Circle sides.
---@param bSafeOffset boolean #Apply safe offset.
---@return Vector2[] #(std::vector<Vector2>)
Math.BuildSafeCircle = function(center, radius, sides, bSafeOffset) end

---Convert degrees to radians
---@param degrees number #(float)
---@return number #(float)
Math.Deg2Rad = function(degrees) end

---Convert radians to degrees
---@param radians number #(float)
---@return number #(float)
Math.Rad2Deg = function(radians) end

---Convert Vector2 to D3DXVECTOR2
---@param vec Vector2 #
---@return D3DXVECTOR2
Math.ToDX2D = function(vec) end

---Convert Vector3 to D3DXVECTOR2
---@param vec Vector3 #
---@return D3DXVECTOR2
Math.ToDX2D = function(vec) end

---Convert Vector3 to D3DXVECTOR3
---@param vec Vector3 #
---@return D3DXVECTOR3
Math.ToDX3D = function(vec) end

---Returns direction vector from orientation matrix (taken from given EffectEmitter).
---@param obj EffectEmitter #
---@return Vector2
Math.GetDirectionFromOrientation = function(obj) end

---Returns direction vector from orientation matrix.
---@param matrix _D3DMATRIX #
---@return Vector2
Math.GetDirectionFromOrientation = function(matrix) end

---Performs reverse linear interpolation and returns float `time` value.
---@param A Vector2 # Start position
---@param B Vector2 # End position
---@param C Vector2 # Result position from normal Lerp/Extension
---@return number #(float)
Math.InverseLerp = function(A, B, C) end

---Returns whether AB and CD are collinear.
---@param A Vector2 #
---@param B Vector2 #
---@param C Vector2 #
---@param D Vector2 #
---@return boolean
Math.IsCollinearLines = function(A, B, C, D) end

---Returns whether AB and CD are collinear.
---@param AB LineSegment #
---@param CD LineSegment #
---@return boolean
Math.IsCollinearLines = function(AB, CD) end

---Returns whether AB and CD are collinear.
---@param AB Line #
---@param CD Line #
---@return boolean
Math.IsCollinearLines = function(AB, CD) end

---Returns whether given points form a straight line or not (within given deviation).
---@param points Vector2[] #Given positions to check.
---@param deviation number #(float) Deviation. The closer to 0 the stricter this check is.
---@return boolean
Math.IsStraightLine = function(points, deviation) end

---Returns whether given points form a straight line or not (within given deviation).
---@param points Vector3[] #Given positions to check.
---@param deviation number #(float) Deviation. The closer to 0 the stricter this check is.
---@return boolean
Math.IsStraightLine = function(points, deviation) end

---Returns calculated centroid from given positions.
---@param points Vector2[] #Given positions.
---@return Vector2
Math.GetCentroid = function(points) end

---Returns calculated centroid from given positions.
---@param points Vector3[] #(std::vector<Vector3>) Given positions.
---@return Vector2
Math.GetCentroid = function(points) end

---Returns enemy centroid from enemies at given position within given range, and returns affected enemy count.
---@param position Vector2 #Given position.
---@param range number #(float) Given range.
---@return Vector2, number
Math.GetEnemyCentroid = function(position, range) end

---Get Minimum Enclosing Circle (position and radius) from given Vector2 positions.
---@param positions Vector2[] # Given positions.
---@return Vector2, float
Math.GetMEC = function(positions) end

---Get Minimum Enclosing Circle (position and radius) from given Vector3 positions.
---@param positions Vector3[] #(std::vector<Vector3>) Given positions.
---@return Vector2, float
Math.GetMEC = function(positions) end


--End(math-api.lua)--

--Start(vector2.lua)--
---Vector2 class
---@class Vector2
---@field x number
---@field y number
Vector2 = {}

---Returns whether this vector is not (0, 0)
---@return boolean
Vector2.IsValid = function(self) end

---Returns a Vector3 \(x =x, y =0, z=y\).
---@return Vector3
Vector2.To3D = function(self) end

---Returns a Vector2 \(x =x, y =y\).
---@return Vector2
Vector2.To2D = function(self) end

---Returns a Vector2 \(x =x, y =y\).
---@return Vector2
Vector2.Copy = function(self) end

---Returns a game world position Vector3 \(ScreenToWorld\).
---@return Vector3
Vector2.Project = function(self) end

---Returns project on line AB.
---@param A Vector2 #Line  start.
---@param B Vector2 #Line  end.
---@return Vector2
Vector2.ProjectOnLine = function(self, A, B) end

---Returns project on line segment AB.
---@param A Vector2 #Line segment start.
---@param B Vector2 #Line segment end.
---@return Vector2
Vector2.ProjectOnLineSegment = function(self, A, B) end

---Returns if point's project is on line segment AB.
---@param A Vector2 #Line segment start.
---@param B Vector2 #Line segment end.
---@return boolean
Vector2.IsOnLineSegment = function(self, A, B) end

---Returns whether AB intersects CD.
---@param B Vector2 #
---@param C Vector2 #
---@param D Vector2 #
---@return boolean
Vector2.IsLineSegmentIntersection = function(self, B, C, D) end

---Returns intersection between AB and CD.
---@param B Vector2 #
---@param C Vector2 #
---@param D Vector2 #
---@return Vector2
Vector2.VectorIntersection = function(self, B, C, D) end

---Returns vector length.
---@return number
Vector2.Length = function(self) end

---Returns vector length **square**.
---@return number
Vector2.Length2 = function(self) end

---Returns distance from v to v2.
---@param v2 Vector2 #Point 2
---@return number
Vector2.Distance = function(self, v2) end

---Returns distance **square** from v to v2.
---@param v2 Vector2 #Point 2
---@return number
Vector2.Distance2 = function(self, v2) end

---Returns dot result.
---@param v2 Vector2 #Point 2
---@return number
Vector2.Dot = function(self, v2) end

---Returns cross result.
---@param v2 Vector2 #Point 2
---@return number
Vector2.Cross = function(self, v2) end

---Normalizes this vector
Vector2.Normalize = function(self) end

---Returns a normalized vector from this vector.
---@return Vector2
Vector2.Normalized = function(self) end

---Extends this vector towards given vector.
---@param v2 Vector2 #
---@param distance number #(float)
Vector2.Extend = function(self, v2, distance) end

---Returns extended vector towards given vector.
---@param v2 Vector2 #
---@param distance number #(float)
---@return Vector2
Vector2.Extended = function(self, v2, distance) end

---Shortens this vector towards given vector.
---@param v2 Vector2 #
---@param distance number #(float)
Vector2.Shorten = function(self, v2, distance) end

---Returns shortened vector towards given vector.
---@param v2 Vector2 #
---@param distance number #(float)
---@return Vector2
Vector2.Shortened = function(self, v2, distance) end

---Returns Linear interpolation. V1 + s \(V2-V1\)
---@param v2 Vector2 #Point 2
---@param time number #(float) Time.
---@return Vector2
Vector2.Lerp = function(self, v2, time) end

---Returns this vector angle.
---@return number
Vector2.Angle = function(self) end

---Returns this vector angle **degree**.
---@return number
Vector2.AngleDeg = function(self) end

---Returns angle between this and v2.
---@param v2 Vector2 #Point 2
---@return number
Vector2.AngleBetween = function(self, v2) end

---Returns angle **degree** between this and v2.
---@param v2 Vector2 #Point 2
---@return number
Vector2.AngleDegBetween = function(self, v2) end

---Returns vector rotated at a given **radian** angle.
---@param angle number #(float) Rotation angle.
---@return Vector2
Vector2.Rotate = function(self, angle) end

---Returns vector rotated at a given **degree** angle.
---@param angle number #(float) Rotation angle.
---@return Vector2
Vector2.RotateDeg = function(self, angle) end

---Returns two numbers x,y.
---@return number, number
Vector2.Unpack = function(self) end

---Returns NavGridCell from this position.
---@return NavGridCell
Vector2.ToCell = function(self) end

---Returns relative position in direction from v to v2 as Vector2.
---@param v2 Vector2 #Point 2
---@param distance number #(float) Distance to extended.
---@return Vector2
Vector2.RelativePos = function(self, v2, distance) end

---Randomizes vector a little.
---@return Vector2
Vector2.Randomize = function(self) end

---Returns normalized direction vector from v to v2.
---@param v2 Vector2 #Point 2
---@return Vector2
Vector2.Direction = function(self, v2) end

---Returns normal.
---@return Vector2
Vector2.Normal = function(self) end

---Returns whether this vector is within certain range of other given Vector2.
---@param v2 Vector2 #Point 2
---@param range number #(float)
---@return boolean
Vector2.IsInRange = function(self, v2, range) end

---Returns whether this vector is within certain range of other given Vector3.
---@param v2 Vector3 #Point 2
---@param range number #(float)
---@return boolean
Vector2.IsInRange = function(self, v2, range) end

---Returns distance from this to v2.
---@param v2 Vector3 #Point 2
---@return number
Vector2.DistanceToVec3 = function(self, v2) end

---Returns distance from this to line AB.
---@param A Vector3 #Line start.
---@param B Vector3 #Line end.
---@return number
Vector2.DistanceToLine = function(self, A, B) end

---Returns distance **square** from this to line AB.
---@param A Vector3 #Line start.
---@param B Vector3 #Line end.
---@return number
Vector2.DistanceToLine2 = function(self, A, B) end

---Returns if vector2 is under enemy turret.
---@return boolean
Vector2.IsUnderEnemyTurret = function(self) end

---Returns if vector2 is under ally turret.
---@return boolean
Vector2.IsUnderAllyTurret = function(self) end

---Returns if how many **valid**  allies is in vector2 range\(**include me**\).
---@param range number #Check range.
---@return number
Vector2.CountAlliesInRange = function(self, range) end

---Returns if how many **valid** ally minions is in vector2 range.
---@param range number #Check range.
---@return number
Vector2.CountAllyLaneMinionsInRange = function(self, range) end

---Returns if how many **valid** enemies is in vector2 range.
---@param range number #Check range.
---@return number
Vector2.CountEnemiesInRange = function(self, range) end

---Returns if this position is not passable through static obstacles.
---@param actorTeam number #(integer) Actor team to check special air wall \(300 == ignore air wall\).
---@return boolean
Vector2.IsWall = function(self, actorTeam) end

---Returns if this position is not passable through both static and dynamic obstacles.
---@param teamFlag number #(integer) Use AIBaseClient::GetNavConditionFlags()
---@return boolean
Vector2.IsWallDynamic = function(self, teamFlag) end

---Returns if this position is grass.
---@return boolean
Vector2.IsGrass = function(self) end

---Returns if this position is water.
---@return boolean
Vector2.IsWater = function(self) end

---Returns if this position has certain CellFlag. Can be used to check position near grass for example.
---@param cellFlag CellFlag #
---@param radius number #
---@return boolean
Vector2.IsWallOfType = function(self, cellFlag, radius) end


--End(vector2.lua)--

--Start(vector3.lua)--
---Vector3 class.
---@class Vector3
---@field x number
---@field y number
---@field z number
Vector3 = {}

---Returns whether this vector is not (0, 0, 0)
---@return boolean
Vector3.IsValid = function(self) end

---Returns a Vector2 \(x =x, y =z\).
---@return Vector2
Vector3.To2D = function(self) end

---Returns a Vector3 \(x =x, y =y, z=z\).
---@return Vector3
Vector3.To3D = function(self) end

---Returns a Vector3 \(x =x, y =y, z=z\).
---@return Vector3
Vector3.Copy = function(self) end

---Returns this **ref** Vector3 \(x =x, y =GameMapHeight, z=z\).
---@return Vector3
Vector3.FixHeight = function(self) end

---Performs WorldToScreen operation and returns a screen position as Vector3 where X and Y are 2D coordinates and Z can be used for on screen check.
---**Tip:** Z coordinate can be used to check if position is on screen: If Z > 0.01 - it is on screen.
---@return Vector3
Vector3.Project = function(self) end

---Returns navGridCell\(userdata\).
---@return NavGridCell
Vector3.ToCell = function(self) end

---Returns vector length.
---@return number
Vector3.Length = function(self) end

---Returns vector length **square**.
---@return number
Vector3.Length2 = function(self) end

---Returns distance from v to v2.
---@param v2 Vector3 #Point2.
---@return number
Vector3.Distance = function(self, v2) end

---Returns distance **square** from v to v2.
---@param v2 Vector3 #Point2.
---@return number
Vector3.Distance2 = function(self, v2) end

---Returns dot product result.
---@param v2 Vector3 #Point2.
---@return number
Vector3.Dot = function(self, v2) end

---Returns cross product result.
---@param v2 Vector3 #Point2.
---@return Vector3
Vector3.Cross = function(self, v2) end

---Normalizes this vector
Vector3.Normalize = function(self) end

---Returns a normalized Vector3 from this vector.
---@return Vector3
Vector3.Normalized = function(self) end

---Extends this vector towards given vector.
---@param v Vector3 #
---@param distance number #(float)
Vector3.Extend = function(self, v, distance) end

---Returns extended vector towards given vector.
---@param v Vector3 #
---@param distance number #(float)
---@return Vector3
Vector3.Extended = function(self, v, distance) end

---Shortens this vector towards given vector.
---@param v Vector3 #
---@param distance number #(float)
Vector3.Shorten = function(self, v, distance) end

---Returns shortened vector towards given vector.
---@param v Vector3 #
---@param distance number #(float)
---@return Vector3
Vector3.Shortened = function(self, v, distance) end

---Returns Linear interpolation. V1 + s \(V2-V1\)
---@param v2 Vector3 #Point2.
---@param time number #(float) Time.
---@return Vector3
Vector3.Lerp = function(self, v2, time) end

---Returns whether this vector is within certain range of other given Vector3.
---@param v2 Vector3 #Point 2
---@param range number #(float)
---@return boolean
Vector3.IsInRange = function(self, v2, range) end

---Returns two numbers x,y.z
---@return number, number, number
Vector3.Unpack = function(self) end

---Returns navGridCell\(userdata\).
---@return NavGridCell
Vector3.ToCell = function(self) end

---Returns relative position in direction from v to v2 as Vector3.
---@param v2 Vector3 #Point2.
---@param distance number #(float) Distance to extended.
---@return Vector3
Vector3.RelativePos = function(self, v2, distance) end

---Returns relative flat position in direction from v to v2 as Vector 2 with corrected height.
---@param v2 Vector3 #Point2.
---@param distance number #(float) Distance to extended.
---@return Vector3
Vector3.RelativeFlatPos = function(self, v2, distance) end

---Randomizes vector a little.
---@return Vector3
Vector3.Randomize = function(self) end

---Returns normalized direction vector.
---@return Vector3
Vector3.Direction = function(self) end

---Returns normal.
---@return Vector3
Vector3.Normal = function(self) end

---Returns **flat** distance from this to v2.
---@param v2 Vector3 #Point2.
---@return number
Vector3.FlatDistance = function(self, v2) end

---Returns **flat** distance from this to v2.
---@param v2 Vector2 #Point2.
---@return number
Vector3.FlatDistanceToVec2 = function(self, v2) end

---Returns if vector3 is under enemy turret.
---@return boolean
Vector3.IsUnderEnemyTurret = function(self) end

---Returns if vector3 is under ally turret.
---@return boolean
Vector3.IsUnderAllyTurret = function(self) end

---Returns if how many **valid**  allies is in vector3 range\(**include me**\).
---@param range number #Check range.
---@return number
Vector3.CountAlliesInRange = function(self, range) end

---Returns if how many **valid** ally minions is in vector3 range.
---@param range number #Check range.
---@return number
Vector3.CountAllyLaneMinionsInRange = function(self, range) end

---Returns if how many **valid** enemy **lane** minions is in vector3 range.
---@param range number #Check range.
---@return number
Vector3.CountEnemyLaneMinionsInRange = function(self, range) end

---Returns if how many **valid** enemies is in vector3 range.
---@param range number #Check range.
---@return number
Vector3.CountEnemiesInRange = function(self, range) end

---Returns if this position is not passable.
---@param actorTeam number #(integer) Actor team to check special air wall \(300 == ignore air wall\)
---@return boolean
Vector3.IsWall = function(self, actorTeam) end

---Returns if this position is not passable through both static and dynamic obstacles.
---@param teamFlag number #(integer) Use AIBaseClient::GetNavConditionFlags(). Use 0 to ignore air walls.
---@return boolean
Vector3.IsWallDynamic = function(self, teamFlag) end

---Returns if this position is grass.
---@return boolean
Vector3.IsGrass = function(self) end

---Returns if this position is water.
---@return boolean
Vector3.IsWater = function(self) end

---Returns if this position has certain CellFlag. Can be used to check position near grass for example.
---@param cellFlag CellFlag #
---@param radius number #
---@return boolean
Vector3.IsWallOfType = function(self, cellFlag, radius) end

---Returns collision position with a circle.
---
--[[```lua
-- Example: Check for Qiyana W if intersects water.
Game.localPlayer.position:GetCircleCollisionPosition(0,366,0):IsWater()
```]]
---@param innerRadius number #Inner radius
---@param outerRadius number #Outer radius
---@param teamFlag number #(integer) NavConditionFlag. Use 0 to ignore air walls.
---@return Vector3
Vector3.GetCircleCollisionPosition = function(self, innerRadius, outerRadius, teamFlag) end


--End(vector3.lua)--

--Start(vector4.lua)--
---Vector4 class
---@class Vector4
---@field x number
---@field y number
---@field z number
---@field w number
Vector4 = {}

---Returns a Vector4 \(x =x, y =y, z=z, w=w\).
---@return Vector4
Vector4.Copy = function(self) end

---Returns vector length.
---@return number
Vector4.Length = function(self) end

---Returns vector length **square**.
---@return number
Vector4.Length2 = function(self) end

---Returns distance from v to v2.
---@param v2 Vector4 #Point2.
---@return number
Vector4.Distance = function(self, v2) end

---Returns distance **square** from v to v2.
---@param v2 Vector4 #Point2.
---@return number
Vector4.Distance2 = function(self, v2) end

---Returns dot product result.
---@param v2 Vector4 #Point2.
---@return number
Vector4.Dot = function(self, v2) end

---Returns a normalized Vector4 from this vector.
---@return Vector4
Vector4.Normalize = function(self) end

---Returns Linear interpolation. V1 + s \(V2-V1\)
---@param v2 Vector4 #Point2.
---@param time number #(float) Time.
---@return Vector3
Vector4.Lerp = function(self, v2, time) end

---Returns two numbers x,y.z,w
---@return number, number, number, number
Vector4.Unpack = function(self) end

---Randomizes vector a little.
---@return Vector4
Vector4.Randomize = function(self) end


--End(vector4.lua)--

--Start(objectmanager.lua)--
---ObjectManager contains some list of objects.
---@class ObjectManager
---@field enemyHeroes list
---@field enemyLaneMinions list
---@field allyHeroes list
---@field activeAllyWindWalls list
---@field activeEnemyWindWalls list
---@field allAIBaseClients list
---@field allAttackableUnits list
---@field allGameObjects list
---@field allMissileClients list
---@field enemyMinions list
---@field enemyPets list
---@field enemyStructures list
---@field enemyTurrets list
---@field enemyWards list
---@field allyLaneMinions list
---@field allyMinions list
---@field allyPets list
---@field allyTurrets list
---@field allyWards list
---@field barrels list
---@field jungleMinions list
---@field plants list
---@field spellFarmMinions list #A list of all minions and objects which can be hit with spells. For example it doesn't include Teemo Mushrooms.
ObjectManager = {}

---Get an object by handle \(if failed, returns nil\).
---@param handle number  #(integer) Handle for query.
---@return GameObject
ObjectManager.ResolveHandle = function(handle) end

---Get an object by networkId \(if failed, returns nil\).
---@param networkId number  #(integer) Network handle for query.
---@return GameObject
ObjectManager.ResolveNetworkId = function(networkId) end


-- Examples:

-- Example 1: Find first immobile enemy and cast Q
for _, entity in ObjectManager.enemyHeroes:pairs() do
    if entity:IsValidTarget(Q.range) and not Champions.CanMove(entity, 0.1) and Q:Cast(entity, menu.Q.hitChanceQ) then
        return
    end
end

--End(objectmanager.lua)--

--Start(colorinfo.lua)--
---Renderer.ColorInfo struct. Used by fancy shader drawings.
---
---**Note:** Part of Renderer namespace.
---@class ColorInfo
---@field from number #(D3DCOLOR) Main color
---@field to number #(D3DCOLOR) Secondary color (Used in gradient)
---@field gradientType GradientType #Gradient type.
Renderer.ColorInfo = {}

---ColorInfo constructor
---@param colFrom number #(D3DCOLOR) Main color
---@param colTo number #(D3DCOLOR) Secondary color (Used in gradient)
---@param gradType GradientType #Gradient type.
---@return ColorInfo
ColorInfo.new = function(colFrom, colTo, gradType) end

---ColorInfo constructor
---@param colFrom number #(D3DCOLOR) Main color
---@param colTo number #(D3DCOLOR) Secondary color (Used in gradient)
---@return ColorInfo
ColorInfo.new = function(colFrom, colTo) end

---ColorInfo constructor
---@param col number #(D3DCOLOR) Main color
---@return ColorInfo
ColorInfo.new = function(col) end


-- Examples:

-- Example 1: Draw fancy shader circle around selected target.
local MyGlowingCircleHash = Game.fnvhash("Example_MyGlowingCircle") -- This must be unique hash per drawing. Use unique prefix.
local color = Renderer.ColorInfo.new(0xFFFFFFFF, 0xFF5555FF, Renderer.GradientType.Linear)
local radius = 100
Callback.Bind(CallbackType.OnDraw, function()
    local tar = Game.GetSelectedTarget()
    if tar and tar:IsValid() then
        Renderer.DrawEffectCircle(MyGlowingCircleHash, tar.position2D, radius, color, Renderer.EffectType.MagicalCircle)
    end
end)


--End(colorinfo.lua)--

--Start(renderer-api.lua)--
---Renderer namespace with useful drawing functions.
---
---**Caution:** Please do not overuse these in your final production scripts as these calls made from Lua may cause heavy impact on performance.
---**Tip:** For optimal performance prefer using Renderer.DrawEffectCircle function in your final production scripts.
---@class Renderer
Renderer = {}

---Get proper color value
---@param r number #Red 0-255
---@param g number #Green 0-255
---@param b number #Blue 0-255
---@param a number #Alpha 0-255
---@return number
Renderer.RGBA = function(r, g, b, a) end

---Draw basic circle in game world.
---@param position Vector2 #Center position.
---@param radius number #(integer) Radius
---@param sides number #(integer) Sides
---@param width number #(integer) Line width
---@param color number #(D3DCOLOR) Color
Renderer.DrawCircle3D = function(position, radius, sides, width, color) end

---Draw basic circle in game world.
---@param position Vector3 #Center position.
---@param radius number #(integer) Radius
---@param sides number #(integer) Sides
---@param width number #(integer) Line width
---@param color number #(D3DCOLOR) Color
Renderer.DrawCircle3D = function(position, radius, sides, width, color) end

---Draw vector poly path.
---@param vectorPoly Vector2[] #Points which make a path.
---@param width number #(float) Line width.
---@param color number #(D3DCOLOR) Line color.
Renderer.DrawVectorPoly = function(vectorPoly, width, color) end

---Draw vector poly path.
---@param vectorPoly Vector3[] #(std::vector<Vector3>) Points which make a path.
---@param width number #(float) Line width.
---@param color number #(D3DCOLOR) Line color.
Renderer.DrawVectorPoly = function(vectorPoly, width, color) end

---Draw cross in game world.
---
---**Tip:** Useful to see exact position of any unit in game.
---@param position Vector2 #World position.
---@param size? number #(float) Cross size. 100 by default.
---@param color? number #(D3DCOLOR) Line color. White by default.
Renderer.DrawCross = function(position, size, color) end

---Draw basic `ImGui` text.
---
---**Note:** Unlike most other `Renderer` functions, all `ImGui` functions must be used in `OnImguiDraw` callback.
---@param text string #Text you want to display.
---@param position Vector2 #On-screen position for your text. Starts from top-left corner.
---@param size? number #(float) Font size. 12 by default.
---@param color? number #(D3DCOLOR) Font color. White by default.
Renderer.DrawText = function(text, position, size, color) end

---Draw basic `ImGui` text in game world.
---
---**Note:** Unlike most other `Renderer` functions, all `ImGui` functions must be used in `OnImguiDraw` callback.
---@param text string #Text you want to display.
---@param position Vector3 #World position.
---@param offset? Vector2 #On-screen offset. Vector2(0,0) by default.
---@param size? number #(float) Font size. 12 by default.
---@param color? number #(D3DCOLOR) Font color. White by default.
Renderer.DrawWorldText = function(text, position, offset, size, color) end

---Draw fancy shader circle.
---
---**Caution:** It is important to use unique fnv hash for this. Please use unique prefix when generating this hash.
--[[```lua
-- Example: Draw fancy shader circle around selected target.
local MyGlowingCircleHash = Game.fnvhash("Example_MyGlowingCircle") -- This must be unique hash per drawing. Use unique prefix.
local color = Renderer.ColorInfo.new(0xFFFFFFFF, 0xFF5555FF, Renderer.GradientType.Linear)
local radius = 100
Callback.Bind(CallbackType.OnDraw, function()
    local tar = Game.GetSelectedTarget()
    if tar and tar:IsValid() then
        Renderer.DrawEffectCircle(MyGlowingCircleHash, tar.position2D, radius, color, Renderer.EffectType.MagicalCircle)
    end
end)
```]]
---@param hash number #(integer) Unique fnv hash.
---@param position Vector2 #Position.
---@param radius number #Radius.
---@param colorInfo? ColorInfo #ColorInfo struct. White solid by default.
---@param effectType? EffectType #Shader effect type. GlowingCircle by default.
Renderer.DrawEffectCircle = function(hash, position, radius, colorInfo, effectType) end

---Returns calculated text width and height.
--[[```lua
-- Example: Draw a centered text indicator under player, showing whether he is inside enemy turret range or not.
local fontSize = 16
Callback.Bind(CallbackType.OnImguiDraw, function()
    local text = TurretTracker.IsPlayerInsideTurret() and "Inside" or "Outside"
    local tX, tY = Renderer.CalcTextSize(text, fontSize)
    Renderer.DrawWorldText(text, Game.localPlayer.position, Math.Vector2(-tX/2, 0), fontSize)
end)
```]]
---@param text string #Text string.
---@param fontSize number #(float) Text font size.
---@return number, number
Renderer.CalcTextSize = function(text, fontSize) end


--End(renderer-api.lua)--

--Start(champions.lua)--
---Champions script manager.
---
---**Caution:** Q/W/E/R/QMANA/WMANA/EMANA/RMANA should be set by yourself.
---@class Champions
---@field Q SDKSpell
---@field W SDKSpell
---@field E SDKSpell
---@field R SDKSpell
---@field QMANA number
---@field WMANA number
---@field EMANA number
---@field RMANA number
---@field None boolean
---@field Flee boolean
---@field Combo boolean
---@field Harass boolean
---@field LaneClear boolean
---@field OnlyHarass boolean
---@field FastLaneClear boolean
---@field Freeze boolean
---@field Hash integer
---@field FarmMinions UI.Slider
---@field spellFarm UI.KeyBind
---@field harassToggle UI.KeyBind
---@field PredictionType UI.List
Champions = {}

---Create a champion base menu.
---@param menu UI.Menu #Root menu.
---@param predictionType integer #(0-1) Default prediction type\(0 = default ,1 = fast\).
Champions.CreateBaseMenu = function(menu, predictionType) end

---Create a champion Q\W\E\R drawing menu \(If Champions.Q/W/E/R has been set\).
---@param menu UI.Menu #Dawing sub menu.
---@param defaultValue boolean #Default value of range check box.
Champions.CreateColorMenu = function(menu, defaultValue) end

---Lagfree check for better performance.
---@param index integer #(0-4) Index.
---@return boolean
Champions.LagFree = function(index) end

---Harass check  \(under enemy turret and toggle check\).
---@return boolean
Champions.CanHarass = function() end

---Spell farm check  \(check spellFarm toggle,mana setting,minions nearby and orbwalker is LaneClear mode\).
---@param checkMinionsNumber boolean #(false) Should check enemy minions aournd with laneclear slider.
---@return boolean
Champions.CanSpellFarm = function(checkMinionsNumber) end

---Master switch to control internal Cpp scripts.
---@param enable boolean #Enabled.
Champions.CppScriptMaster = function(enable) end

---Check a target is can move\(not been CCed\) after delay.
---@param target AIBaseClient #Target.
---@param delay number #After the delay target can move.
---@return boolean
Champions.CanMove = function(target, delay) end

---Get incoming damage.
---@param target AIBaseClient #Target.
---@return number #(float)
Champions.GetIncomingDamage = function(target) end

---Returns if souce and target is moving in same direction.
---@param source AIBaseClient #Source
---@param target AIBaseClient #Target.
---@param angle number #(default = 20) Angle for check.
---@return boolean
Champions.IsMovingInSameDirection = function(source, target, angle) end

---Returns if target is unkillable after delay.
---@param target AIBaseClient #Target.
---@param delay number #Spell delay.
---@return boolean
Champions.ValidKillTarget = function(target, delay) end

---Returns if target is unkillable or **overkill** after delay.
---@param target AIBaseClient #Target.
---@param delay number #Spell delay.
---@return boolean
Champions.ValidUlt = function(target, delay) end

---Clean base menu  and QWER instance. Should be called when **unload**.
Champions.Clean = function() end


-- Examples:

-- Example 1: SDKSpell and SDKSpell:SetSkillshot example
-- Creating SDKSpell instances:
-- IMPORTANT: Make sure to call Champions.Clean() OnUnload to clear these instances!
Champions.Q = SDKSpell.Create(SpellSlot.Q, 1400, DamageType.Magical)
Champions.W = SDKSpell.Create(SpellSlot.W, 100, DamageType.Magical)
Champions.E = SDKSpell.Create(SpellSlot.E, 1200, DamageType.Magical)
Champions.R = SDKSpell.Create (SpellSlot.R, 5500, DamageType.Magical)

-- Set skillshot:
Champions.Q:SetSkillshot(0.25, 60, 1000, SkillshotType.SkillshotLine, true, CollisionFlag.CollidesWithYasuoWall, HitChance.High, true)
Champions.R:SetSkillshot(1, 65, math.flt_max, SkillshotType.SkillshotCircle, false, CollisionFlag.CollidesWithNothing, HitChance.High, true)
-- Please note how we use math.flt_max for speed instead of math.huge, this is important

Callback.Bind(CallbackType.OnUnload, function()
    Champions.Clean() -- Clean up
    return CallbackResult.Dispose
end)

--End(champions.lua)--

--Start(championtracker.lua)--
---ChampionTracker
---@class ChampionTracker
---@field source AIHeroClient
---@field lastPosition Vector3
---@field lastWayPoint Vector3
---@field invisibleSince number
---@field invisibleTimeCount number
---@field lastAuroWardTime number
---@field teleportInfo TeleportInfo
ChampionTracker = {}

---Returns a ChampionTracker instance if find.
---@param nethandle integer #Champion network id.
---@return ChampionTracker
ChampionTracker.GetChampionInfomation = function(nethandle) end

---Returns skirmishData for a championtracker info.
---@return skirmishData
ChampionTracker.GetSkirmishData = function() end


--End(championtracker.lua)--

--Start(damagelib.lua)--
---Damage Library for accurate damage calculations.
---@class DamageLib
---@field slot SpellSlot
DamageLib = {}

---Returns <hash, function> map with functions which calculate spell damage.
---
---**Note:** Function must accept (source: AIBaseHero, bRawDamage: boolean, stage: integer) parameters and return float (damage).
---**Tip:** You can extend our DamageLib with missing damage calculations for your champion script or overwrite existing ones if you think it will improve it.
--[[```lua
-- Example: Get damage function map and replace Lux Q damage calculation function.
local LuxLightBindingSpellDataHash = Game.spelldataHash("LuxLightBinding") -- Spell Data hash is used as key for damageMap
local damageMap = DamageLib.GetDamageFunctionMap()
damageMap[LuxLightBindingSpellDataHash] = function(source, target, bRawDamage, stage)
    rawDamage = 100
    return bRawDamage and rawDamage or DamageLib.CalculateMagicalDamage(source, target, rawDamage)
end
```]]
---@return unordered_map<hash, fun(source: AIBaseHero, bRawDamage: boolean, stage: integer): float>
DamageLib.GetDamageFunctionMap = function() end

---Returns calculated damage of the given spell.
---@param spellHash number #(unsigned) spelldataHash of the given spell.
---@param source AIHeroClient #Source unit.
---@param target AIBaseClient #Target unit.
---@param bRawDamage boolean #Return raw damage if true.
---@param stage number #(integer) Return damage of certain stage, if spell supports multiple stages.
---@param slot SpellSlot #SpellSlot of the given spell.
---@return float
DamageLib.GetSpellDamage = function(spellHash, source, target, bRawDamage, stage, slot) end

---Returns calculated damage of the given spell.
---@param spellName string #Name of the given spell.
---@param source AIHeroClient #Source unit.
---@param target AIBaseClient #Target unit.
---@param bRawDamage boolean #Return raw damage if true.
---@param stage number #(integer) Return damage of certain stage, if spell supports multiple stages.
---@return float
DamageLib.GetSpellDamage = function(spellName, source, target, bRawDamage, stage) end

---Returns calculated auto attack damage including various modifiers (armor, resistances, empowerments etc).
---@param source AIBaseClient #Source unit. AA damage will be taked from this unit.
---@param target AIBaseClient #Target unit
---@return float
DamageLib.CalculateAutoAttackDamage = function(source, target) end

---Returns calculated physical damage including various modifiers (armor, resistances, empowerments etc).
---@param source AIBaseClient #Source unit
---@param target AIBaseClient #Target unit
---@param amount float #Raw damage
---@return float
DamageLib.CalculatePhysicalDamage = function(source, target, amount) end

---Returns calculated magical damage including various modifiers (armor, resistances, empowerments etc).
---@param source AIBaseClient #Source unit
---@param target AIBaseClient #Target unit
---@param amount float #Raw damage
---@return float
DamageLib.CalculateMagicalDamage = function(source, target, amount) end


-- Examples:

-- Example 1: Replace Lux Q damage calc function, get damage from tooltip and print it using SDKSpell:GetDamage().
local LuxLightBindingSpellDataHash = Game.spelldataHash("LuxLightBinding") -- Spell Data hash is used as key for damageMap
local LuxLightBindingHash = Game.fnvhash("LuxLightBinding") -- FNV hash is used by AIBaseClient:GetSpellSlot(spellHash) function
local TotalDamageHash = Game.fnvhash("TotalDamageTT") -- FNV hash is used to access tooltip property with SpellBookEntry:GetCalculateInfo(...)
local damageMap = DamageLib.GetDamageFunctionMap()

damageMap[LuxLightBindingSpellDataHash] = function(source, target, bRawDamage, stage)
    local slot = source:GetSpellSlot(LuxLightBindingHash) -- This uses fnv hash
    if slot == SpellSlot.NullSlot then
        return 0
    end

    local entry = source:GetSpellEntry(slot)
    if not entry or not entry:IsValid() then
        return 0
    end

    local rawDamage = entry:GetCalculateInfo(source, TotalDamageHash, slot)

    if bRawDamage or not target or not target:IsValid() then
        return rawDamage
    end

    return DamageLib.CalculateMagicalDamage(source, target, rawDamage)
end

local Q = SDKSpell.Create(SpellSlot.Q, 1300, DamageType.Magical)
print("Q Damage", Q:GetDamage(Game.localPlayer)) -- This will use our custom damage calc function


--End(damagelib.lua)--

--Start(evade-api.lua)--
---Evade API
---@class Evade
Evade = {}

---Returns whether player is evading at this moment or not.
---@return boolean
Evade.IsEvading = function() end

---Checks if there are any skillshots at given position.
---@param position Vector2 #Checked position.
---@param bGetDangerLevel? boolean #If true this function will also return highest DangerLevel from all skillshots at given position.
---@param bIncludeIgnored? boolean #If true this function will include all ignored skillshots.
---@return boolean, DangerLevel
Evade.IsInsideSkillshots = function(position, bGetDangerLevel, bIncludeIgnored) end

---Checks if Vector2[] path is crossing any skillshots.
---
--[[```lua
-- Example: Check if line between player and cursor is crossing any skillshots
local heroPos = Game.localPlayer.position2D
local cursorPos = Game.GetCursorWorldPosition():To2D()
print(Evade.IsCrossingSkillshots({heroPos, cursorPos}))
```]]
---@param path Vector2[] #Checked path.
---@param bIncludeIgnored? boolean #If true this function will include all ignored skillshots.
---@return boolean
Evade.IsCrossingSkillshots = function(path, bIncludeIgnored) end

---Returns skillshots at given position.
---
--[[```lua
-- Example: Print all skillshots' names at player position
local skillshots = Evade.GetSkillshotsAtPosition(Game.localPlayer.position2D)
if skillshots and #skillshots > 0 then
    for i, ss in skillshots:pairs() do
        print(ss.SpellData.Name)
    end
end
```]]
---@param position Vector2 #Checked position.
---@param bIncludeIgnored? boolean #If true this function will include all ignored skillshots.
---@return Skillshot[] #(std::vector<Skillshot>)
Evade.GetSkillshotsAtPosition = function(position, bIncludeIgnored) end

---Returns skillshots which intersect with given path.
---@param path Vector2[] #Given path.
---@param bIncludeIgnored? boolean #If true this function will include all ignored skillshots.
---@return Skillshot[] #(std::vector<Skillshot>)
Evade.GetSkillshotsCrossingPath = function(path, bIncludeIgnored) end

---Ignores all skillshots at given position.
---@param position Vector2 #Given position.
Evade.IgnoreSkillshotsAtPosition = function(position) end

---Set custom hook function which determines which spells should be ignored by Evade.
---
---**Tip:** This may be useful to create a script with custom rules, which will determine what skillshots should be ignored by Evade.
---**Danger:** If your code is using this, please make sure to call this function with nil argument in OnUnload to avoid weird bugs.
--[[```lua
-- Example: Ignore absolutely all skillshots
 Evade.SetCustomShouldSpellBeIgnored(function(skillshot)
     return true -- Ignore this skillshot
 end)
 -- Dispose:
 Callback.Bind(CallbackType.OnUnload, function()
     Evade.SetCustomShouldSpellBeIgnored(nil)
 end)
```]]
---@param fn fun(ss: Skillshot): boolean #Custom function which accepts Skillshot as parameter and must return true or false if given skillshot should be ignored by Evade.
Evade.SetCustomShouldSpellBeIgnored = function(fn) end

---Returns damage from skillshots at given position.
---@param position Vector2 #Checked position.
---@param bCheckIfCanEvade boolean #If true then only spells which can't be dodged will be taken in count.
---@return number #(float)
Evade.GetSkillshotsDamage = function(position, bCheckIfCanEvade) end

---Returns damage from skillshots casted by certain caster source.
---@param caster AIBaseClient #Checked source unit.
---@return number #(float)
Evade.GetSkillshotsDamageFrom = function(caster) end

---Returns meta data of all skillshots supported by Evade in current game.
---**Note:** Signature with keys: `std::map<charName, std::map<spellName, SpellMetaData>>`
---**Tip:** This may be useful for developers to retrieve supported spells by Evade and their metadata so you can add specific settings in your scripts.
--[[```lua
-- Example: Basic usage with some explanation
-- First make sure that Evade is loaded and initialized.
-- Then call this function to retrieve meta data for all supported spells.
-- You can match skillshot's spell data to this meta data by comparing SpellMetaData.UniqueID and SpellData:GetUniqueID()
-- If you want to create in your script a special menu with settings for each supported skillshots - this function will be helpful to you, but keep in mind:
-- UniqueID is not static and doesn't remain the same between games. It is important to understand this - never use UniqueID in keys for your menus.
local evadeSpellMetaData = Evade.GetSupportedSpellsMetaData()
if evadeSpellMetaData then
    for i, v in evadeSpellMetaData:pairs() do
        print(i)
        for k, b in v:pairs() do
            print("", k, b.UniqueID)
        end
    end
end
```]]
---@return std::map<string, std::map<string, SpellMetaData>>
Evade.GetSupportedSpellsMetaData = function() end


--End(evade-api.lua)--

--Start(skillshot.lua)--
---Evade Skillshot class
---@class Skillshot
---@field SpellData SpellData #Spell data of this skillshot.
---@field Caster AIBaseClient #Caster of this spell.
---@field StartPosition Vector2 #Start position of this spell.
---@field EndPosition Vector2 #End position of this spell.
---@field DirectionVector Vector2 #Direction vector of this spell.
Skillshot = {}

---Returns whether this skillshot is ignored or not.
---@return boolean
Skillshot.IsIgnored = function(self) end

---Ignore this skillshot (same effect as double clicking on skillshot area).
---
---**Tip:** To ignore multiple spells at given position you may use Evade.IgnoreSkillshotsAtPosition(position) function.
Skillshot.IgnoreTemporarily = function(self) end

---Returns if given position is within spell area.
---@param position Vector2 #Checked position.
---@return boolean
Skillshot.Contains = function(self, position) end

---Returns calculated time when certain position will get hit by this spell. Position is irrelevant for some types of spells.
---@param position Vector2 #Checked position. Does not have to be inside skillshot area (it will be projected).
---@return number #(float)
Skillshot.GetHitTime = function(self, position) end

---Returns calculated remaining time when certain position will get hit by this spell. Position is irrelevant for some types of spells.
---@param position Vector2 #Checked position. Does not have to be inside skillshot area (it will be projected).
---@return number #(float)
Skillshot.GetHitRemainingTime = function(self, position) end


--End(skillshot.lua)--

--Start(spelldata.lua)--
---Structure containing spell data used by Evade.
---@class SpellData
---@field Slot SpellSlot
---@field DangerLevel DangerLevel
---@field CrowdControl CrowdControlType[] #(std::vector<CrowdControlType>) List of crowd control types which this spell may apply.
SpellData = {}


--End(spelldata.lua)--

--Start(spellmetadata.lua)--
---Structure containing spell meta data used by Evade.
---@class SpellMetaData
---@field Slot SpellSlot
---@field SlotType SpellSlotType
---@field UniqueID number
---@field Name string
---@field EvadeDisplayName string
---@field ChampionName string
---@field ChampionNameHash number
---@field DangerLevel DangerLevel
---@field IsCrowdControl boolean
---@field CrowdControl CrowdControlType[] #(std::vector<CrowdControlType>) List of crowd control types which this spell may apply.
SpellMetaData = {}


--End(spellmetadata.lua)--

--Start(healthprediction-api.lua)--
---Health Prediction class
---@class HealthPrediction
---@field incomingTargetedDamage list #(std::map<unsigned, std::vector<IncomingDamage>>)
---@field incomingAttacks list #(std::map<unsigned, std::vector<IncomingAttack>>)
---@field incomingAttacksHero list #(std::map<unsigned, std::vector<IncomingAttack>>)
HealthPrediction = {}

---Get health prediction for given unit and time. Returns predicted health and bool if unit has turret aggro and if yes also AITurretClient.
---@param unit AIBaseClient #Unit to predict health for.
---@param time number #(float) Prediction time.
---@return number, bool, AITurretClient
HealthPrediction.GetLaneClearHealthPrediction = function(unit, time) end

---Get health prediction for given unit, time and specify whether hero attacks should be included or not.
---@param unit AIBaseClient #Unit to predict health for.
---@param time number #(float) Prediction time.
---@param includeHeroesAttack? boolean #Whether include hero attacks or not (false by default).
---@return number #(float)
HealthPrediction.GetHealthPrediction = function(unit, time, includeHeroesAttack) end


---Get predicted incoming damage for given unit, time and specify whether it should include skillshots and AA or not.
---@param unit AIBaseClient #Unit to predict health for.
---@param time number #(float) Prediction time.
---@param includeSkillshot? boolean #Whether include skillshots or not (true by default).
---@param includeAutoAttacks? boolean #Whether include auto attacks or not (true by default).
---@return number #(float)
HealthPrediction.GetIncomingDamage = function(unit, time, includeSkillshot, includeAutoAttacks) end

---Get all incoming damage dealt by given unit.
---@param unit AIBaseClient #Unit to get all damage from.
---@return number #(float)
HealthPrediction.GetIncomingDamageFrom = function(unit) end


--End(healthprediction-api.lua)--

--Start(incomingattack.lua)--
---IncomingAttack class
---@class IncomingAttack
---@field source AIBaseClient
---@field target AIBaseClient
---@field sourcePosition Vector3
---@field castDelay number #(float)
---@field delay number #(float)
---@field startTime number #(float)
---@field damage number #(float)
---@field processed number #(int)
---@field isRangedAttack boolean
IncomingAttack = {}

---Get damage
---@param time number #
---@return number #(float)
IncomingAttack.GetDamage = function(self, time) end


--End(incomingattack.lua)--

--Start(incomingdamage.lua)--
---IncomingDamage class
---@class IncomingDamage
---@field source AIBaseClient
---@field target AIBaseClient
---@field sourceMissile MissileClient
---@field damage number #(float)
---@field castDelay number #(float)
---@field totalDelay number #(float)
---@field hasMissile boolean
---@field wasCast boolean
---@field removed boolean
---@field spellData Spell
---@field missileNID number #(unsigned)
---@field timeStart number #(float)
---@field buffTrigger boolean
---@field buff Buff
---@field sourcePosition Vector3
---@field endPosition Vector3
IncomingDamage = {}


--End(incomingdamage.lua)--

--Start(orbwalker.lua)--
---Orbwalker.
---@class Orbwalker
---@field activeMode OrbwalkerMode #Flags containing active Orbwalker modes. See example below.
---@field lastAttackOrder number
---@field lastAttackRange number
---@field lastTargetNID integer
---@field lastAttack number
---@field missileID integer
---@field forcedPosition Vector3
---@field forcedTarget AttackableUnit
---@field bMove boolean
---@field bAttack boolean
Orbwalker = {}

---Returns orbwalker target.
---@return AttackableUnit
Orbwalker.GetTarget = function() end

---Returns **local player** 's attack cast delay against target .
---@param targetAgainst AIBaseClient #Target against player.
---@return number
Orbwalker.GetAttackCastDelay = function(targetAgainst) end

---Returns **local player** 's attack delay against target .
---@param targetAgainst AIBaseClient #Target against player.
---@return number
Orbwalker.GetAttackDelay = function(targetAgainst) end

---Returns a **hero** 's attack missile speed against target .
---@param source AIHeroClient #Souce to calculate missile speed.
---@param targetAgainst AIBaseClient #Target against source.
---@return number
Orbwalker.GetAttackMissileSpeed = function(source, targetAgainst) end

---Returns if orbwalker ready for next attack.
---@return boolean
Orbwalker.CanAttack = function() end

---Returns if player is ready to cast spells using several special checks. Please use this check instead of IsWindingUp.
---**Tip:** This is important to use this check for casting of spells which do not interrupt AA instead of Orbwalker.CanMove and/or AttackableUnit:IsWindingUp
---@return boolean
Orbwalker.CanUseSpell = function() end

---Returns if orbwalker ready for next move.
---@return boolean
Orbwalker.CanMove = function() end

---Returns if target is in source attack range.
---@param source AIHeroClient #Souce to calculate missile speed.
---@param targetAgainst AIBaseClient #Target against source.
---@param extraRange number #Extra range for check.
---@return number
Orbwalker.IsInAutoAttackRange = function(source, targetAgainst, extraRange) end

---Returns if orbwalker already lasthit this minion.
---@param minion AIBaseClient #Minion to check.
---@return boolean
Orbwalker.IsMinionLasthited = function(minion) end


-- Examples:
-- Example 1: Programmatically set Orbwalker active mode(s) using bit library.
Orbwalker.activeMode = bit.bxor(Orbwalker.activeMode, OrbwalkerMode.Combo) -- Set Combo
Orbwalker.activeMode = bit.band(Orbwalker.activeMode, bit.bnot(OrbwalkerMode.Combo)) -- Unset Combo

--End(orbwalker.lua)--

--Start(collisionresult.lua)--
---Collision result
---@class CollisionResult
---@field object GameObject
---@field position Vector3
---@field isWall boolean
---@field isYasuoWall boolean
---@field isStructure boolean
CollisionResult = {}


--End(collisionresult.lua)--

--Start(movementprediction.lua)--
---Class which allows to predict unit movement
---@class MovementPrediction
MovementPrediction = {}

---Get movement prediction.
---**Danger:** Be aware that this overload has bFt boolean argument as true by default. Therefore this will add extra delay (latency and serverTick) in calculations. If used in wrong way it may lead to inaccurate results.
---@param unit AIBaseClient #Given entity for movement prediction
---@param delay float #Delay to be used in calculations besides latency and serverTick
---@return PredictionOutput #
MovementPrediction.GetPrediction = function(unit, delay) end

---Get movement prediction.
---@param input PredictionInput #Given prediction input
---@param bFt boolean #If true - this will add latency and serverTick to delay in calculations
---@param bCheckCollision boolean #If true - this will also check for collision
---@return PredictionOutput #
MovementPrediction.GetPrediction = function(input, bFt, bCheckCollision) end

---Get collision. This returns if there is any collision.
---@param positions Vector3[] #Given positions
---@param input PredictionInput #Given prediction input
---@return boolean #Result of the collision
MovementPrediction.GetCollision = function(positions, input) end

---Get collision. This returns multiple results. May be useful for logic of spells which explode with their colliders.
---**Danger:** This is expensive function. Please use with caution or use MovementPrediction.GetCollision instead.
---@param positions Vector3[] #Given positions
---@param input PredictionInput #Given prediction input
---@return CollisionResult[] #Result of the collision detection. It may have multiple results.
MovementPrediction.GetCollisionEx = function(positions, input) end


--End(movementprediction.lua)--

--Start(predictioninput.lua)--
---Prediction input
---@class PredictionInput
---@field from Vector3 #
---@field rangeCheckFrom Vector3 #
---@field delay number #(float)
---@field radius number #(float)
---@field range number #(float)
---@field speed number #(float)
---@field startOffset number #(float)
---@field type SkillshotType #
---@field target AIBaseClient #
---@field useBoundingRadius boolean #
---@field collision boolean #
---@field collisionFlags CollisionFlag #
PredictionInput = {}


---PredictionInput constructor
---@param unit AIBaseClient #
---@param delay number #(float)
PredictionInput.new = function(unit, delay) end

---comment
---@param from Vector3 #
---@param rangeCheckFrom Vector3 #
---@param delay float #
---@param radius float #
---@param range float #
---@param speed float #
---@param type SkillshotType #
---@param target AIBaseClient #
---@param bUseBoundingRadius boolean #
---@param bCollision boolean #
---@param collisionFlags CollisionFlag #
---@param bAoe boolean #
---@param startOffset float #
PredictionInput.new = function(from, rangeCheckFrom, delay, radius, range, speed, type, target, bUseBoundingRadius, bCollision, collisionFlags, bAoe, startOffset) end


--End(predictioninput.lua)--

--Start(predictionoutput.lua)--
---Prediction result
---@class PredictionOutput
---@field hitchance HitChance
---@field castPosition Vector3
---@field unitPosition Vector3
PredictionOutput = {}


--End(predictionoutput.lua)--

--Start(sdkspell.lua)--
---SDKSpell for easy cast spell.
---@class SDKSpell
---@field slot SpellSlot
---@field lastCastAttempt integer
---@field isSkillShot boolean
---@field boundingRadiusMod boolean
---@field isChargeSpell boolean
---@field chargedBuffNameHash integer
---@field chargedMaxRange number
---@field chargedMinRange number
---@field chargedSpellNameHash integer
---@field forceSpellHash integer
---@field chargedBuffNameHash integer
---@field chargeDuration number
---@field collision boolean
---@field damageType DamageType
---@field collisionFlags CollisionFlag
---@field type SkillshotType
---@field width number
---@field speed number
---@field delay number
---@field hitchance HitChance
---@field rangeCheckFrom Vector3
---@field from Vector3
---@field range number
SDKSpell = {}

---Create a sdk spell instance.
---@param slot SpellSlot #Spell slot.
---@param range number #Spell range.
---@param damageType DamageType #Damage type.
---@return SDKSpell
SDKSpell.Create = function(slot, range, damageType) end

---Set skillshot spell.
---@param delay number #Spell delay.
---@param width number #Spell width.
---@param speed number #Spell missile speed.
---@param type SkillshotType #.
---@param collision boolean #Should calculate collision.
---@param collisionFlags CollisionFlag #.
---@param minHitChance HitChance #Min hitchance for cast.
---@param boundingRadiusMod boolean #Should include target bounding radius.
SDKSpell.SetSkillshot = function(self, delay, width, speed, type, collision, collisionFlags, minHitChance, boundingRadiusMod) end

---Set targetted spell.
---@param delay number #Spell delay.
---@param speed number #Spell missile speed.
---@param type SkillshotType #.
---@param collision boolean #Should calculate collision.
---@param collisionFlags CollisionFlag #.
---@param minHitChance HitChance #Min hitchance for cast.
---@param boundingRadiusMod boolean #Should include target bounding radius.
SDKSpell.SetTargetted = function(self, delay, speed, type, collision, collisionFlags, minHitChance, boundingRadiusMod) end

---Delete spell instance and clean memory. \(Do it when unload if you create a spell and not manage it to Champions class Q/W/E/R\)
SDKSpell.Delete = function(self) end

---Returns if spell is ready to cast.
SDKSpell.Ready = function(self) end

---Returns if spell is charging.
SDKSpell.IsCharging = function(self) end

---Returns datainstance.
---@return SpellBookEntry
SDKSpell.DataInstance = function(self) end

---Set charge spell like varus Q etc.
---@param spellName string #Spell name.
---@param buffName string #Charge buff name.
---@param minRange number #Min charge range.
---@param maxRange number #Max charge range.
---@param duration number #Charge max duration.
SDKSpell.SetCharged = function(self, spellName, buffName, minRange, maxRange, duration) end

---Returns spell mana cost.
---@return number
SDKSpell.ManaCost = function(self) end

---Returns spell charge percent.
---@return number
SDKSpell.ChargePercent = function(self) end

---Returns spell cooldown.
---@return number
SDKSpell.Cooldown = function(self) end

---Returns spell level.
---@return number
SDKSpell.Level = function(self) end

---Returns if cast sucessfully.
---@param target AIBaseClient #Spell target.
---@param usePacket boolean #false
---@return boolean
SDKSpell.CastOnUnit = function(self, target, usePacket) end

---Returns if cast sucessfully.
---@param usePacket boolean #false
---@return boolean
SDKSpell.Cast = function(self, usePacket) end

---Returns if cast sucessfully.
---@param target AIBaseClient #Spell target.
---@param hitChanceMenu UI.List #Use menu to check min hitchance.
---@param usePacket boolean #false
---@return boolean
SDKSpell.Cast = function(self, target, hitChanceMenu, usePacket) end

---Returns if cast sucessfully.
---@param pos Vector3 #Cast position.
---@param limit Vector3 #Cast posiiton limit, use for Viktor E etc.
---@param usePacket boolean #false
---@return boolean
SDKSpell.Cast = function(self, pos, limit, usePacket) end

---Returns prediction output.
---@param target AIBaseClient #Target.
---@return PredictionOutput
SDKSpell.GetPrediction = function(self, target) end

---Returns spell damage to target.
---@param target AIBaseClient #Target.
---@param stage integer #Damage stage.
---@return number
SDKSpell.GetDamage = function(self, target, stage) end

---Returns if spell is coliision from A to B.
---@param from Vector3 #From pos.
---@param to Vector3 #To pos.
---@param target AIBaseClient #Target to ignore.
---@return boolean
SDKSpell.IsCollision = function(self, from, to, target) end

---Returns ture if cast sucessfully to a retrive/zhonya/teleport target.
---@param from Vector3 #From pos.
---@param isSnare boolean #Is snare spell Jinx E etc.
---@param strictlyTimeCheck boolean #Strictly time check for some important R spell.
---@return boolean
SDKSpell.CastSpecialImmobileTarget = function(self, from, isSnare, strictlyTimeCheck) end

---Returns if cast sucessfully.
---@param pos Vector3 #Cast position.
---@param usePacket boolean #false
---@return boolean
SDKSpell.StartCharging = function(self, pos, usePacket) end

---Returns if cast sucessfully.
---@param pos Vector3 #Cast position.
---@param releaseCast boolean #Is release cast.
---@param extraRange number #extra cast end pos.
---@param usePacket boolean #false
---@return boolean
SDKSpell.ShootChargedSpell = function(self, pos, releaseCast, extraRange, usePacket) end

---Returns optimal position for spell farm.
---@param minMinions number #(integer) Minimum amount of minions to hit.
---@param isJungleMinions boolean #Run this logic on jungle camps.
---@return Vector3
SDKSpell.GetCastOnBestFarmPosition = function(self, minMinions, isJungleMinions) end

---Returns optimal position for AOE on enemy heroes.
---@param minTargets number #(integer) Minimum amount of targets to hit.
---@return Vector3
SDKSpell.GetCastOnBestAOEPosition = function(self, minTargets) end


--End(sdkspell.lua)--

--Start(skirmishdata.lua)--
---skirmishData.
---@class skirmishData
---@field allyHeroCountInCombat integer
---@field enemyHeroCountInCombat integer
---@field enemyHeroCountInAssist integer
---@field allyHeroCountInAssist integer
---@field allyHeroCount integer
---@field enemyHeroCount integer
---@field isEqual boolean
---@field isAlmostEqual boolean
---@field hasAdvantage boolean
---@field isDuel boolean
---@field isTeamfight boolean
---@field isUnfairFight boolean
---@field isUndetermined boolean
---@field cacheExpireTime number
skirmishData = {}


--End(skirmishdata.lua)--

--Start(specialpathobstacle.lua)--
---SpecialPathObstacle.
---@class SpecialPathObstacle
---@field position Vector2 #Obstacle position.
---@field radius number #(float) Collision radius.
SpecialPathObstacle = {}


--End(specialpathobstacle.lua)--

--Start(targetselector.lua)--
---TargetSelector.
---@class TargetSelector
---@field selectedTarget AIHeroClient #Currently selected target
TargetSelector = {}

---Returns best target.
---@param range number #Check range.
---@param damageType DamageType #Damage type.
---@param from Vector3 #Check from.
---@param addBoundingRadius boolean #Should add target bounding radius.
---@return AIHeroClient
TargetSelector.GetTarget = function(range, damageType, from, addBoundingRadius) end

---Set forced target.
---
--[[```lua
-- Example: Force target under our cursor.
Callback.Bind(CallbackType.OnTick, function()
    local hover = Game.GetHoveredUnit()
    TargetSelector.SetForcedTarget(hover and hover:IsValid() and hover or nil)
end)
```]]
---@param target AIHeroClient #Target to be forced. nil to clear.
TargetSelector.SetForcedTarget = function(target) end


--End(targetselector.lua)--

--Start(teleportinfo.lua)--
---TeleportInfo contains data related to tracked recalling or teleporting.
---@class TeleportInfo
---@field startTime number
---@field endTime number
---@field duration number
---@field sender AIHeroClient
---@field status TeleportStatus
---@field type TeleportType
---@field teleportName string
---@field teleportTypeName string
TeleportInfo = {}

--End(teleportinfo.lua)--

--Start(turrettracker.lua)--
---TurretTracker.
---@class TurretTracker
TurretTracker = {}

---Returns whether the player is inside enemy turret or not.
--[[```lua
-- Example: Draw a centered text indicator under player, showing whether he is inside enemy turret range or not.
local fontSize = 16
Callback.Bind(CallbackType.OnImguiDraw, function()
    local text = TurretTracker.IsPlayerInsideTurret() and "Inside" or "Outside"
    local tX, tY = Renderer.CalcTextSize(text, fontSize)
    Renderer.DrawWorldText(text, Game.localPlayer.position, Math.Vector2(-tX/2, 0), fontSize)
end)
```]]
---@return boolean
TurretTracker.IsPlayerInsideTurret = function() end

---Returns whether the player is close to the edge of enemy turret range.
---@return boolean
TurretTracker.IsPlayerCloseToTurretEdge = function() end

---Returns whether the player is inside enemy fountain or not.
---@return boolean
TurretTracker.IsPlayerInsideFountain = function() end

---Returns whether the player is close to the edge of enemy fountain range.
---@return boolean
TurretTracker.IsPlayerCloseToFountainEdge = function() end

---Returns whether the player is inside enemy turret/fountain or not.
---@return boolean
TurretTracker.IsPlayerInsideTurretOrFountain = function() end

---Returns whether the player is close to the edge of enemy turret/fountain range.
---@return boolean
TurretTracker.IsPlayerCloseToTurretOrFountainEdge = function() end

---Returns whether the player is focused by enemy turret.
---@return boolean
TurretTracker.IsPlayerFocusedByTurret = function() end

---Returns closest ally turret position.
---@return Vector2
TurretTracker.GetClosestAllyTurretPosition = function() end

---Returns closest enemy turret position.
---@return Vector2
TurretTracker.GetClosestEnemyTurretPosition = function() end

---Returns ally fountain (spawn) position.
---@return Vector2
TurretTracker.GetAllySpawnPosition = function() end

---Returns enemy fountain (spawn) position.
---@return Vector2
TurretTracker.GetEnemySpawnPosition = function() end

---Returns ProximityData from given position, structure position and structure range.
---@param position Vector2 #Checked position.
---@param structPosition Vector2 #Structure position.
---@param structRange number #(float) Structure range.
---@return ProximityData
TurretTracker.IsInsideStructureRange = function(position, structPosition, structRange) end

---Returns ProximityData from given position, which is checked against all enemy turrets.
---@param position Vector2 #Checked position.
---@return ProximityData
TurretTracker.IsInsideEnemyTurret = function(position) end

---Returns ProximityData from given position, which is checked against enemy fountain.
---@param position Vector2 #Checked position.
---@return ProximityData
TurretTracker.IsInsideEnemyFountain = function(position) end


--End(turrettracker.lua)--

--Start(checkbox.lua)--
---CheckBox.
---@class CheckBox : MenuComponent
---@field value boolean
CheckBox = {}

---Permashow this item. If not necessary , **overrideSave** should be **false.**
---@param show boolean #Should draw permashow.
---@param overrideSave boolean #Force permashow even if save is exist.
CheckBox.PermaShow = function(self, show, overrideSave) end

---Add tooltip to this element.
---@param tooltipString string #Tooltip string.
CheckBox.AddTooltip = function(self, tooltipString) end


--End(checkbox.lua)--

--Start(colorpicker.lua)--
---ColorPicker.
---@class ColorPicker : MenuComponent
---@field value color
---@field boolValue boolean
ColorPicker = {}

---Permashow this item. If not necessary , **overrideSave** should be **false.**
---@param show boolean #Should draw permashow.
---@param overrideSave boolean #Force permashow even if save is exist.
ColorPicker.PermaShow = function(self, show, overrideSave) end

---Add tooltip to this element.
---@param tooltipString string #Tooltip string.
ColorPicker.AddTooltip = function(self, tooltipString) end


--End(colorpicker.lua)--

--Start(keybind.lua)--
---KeyBind.
---@class KeyBind : MenuComponent
---@field value integer
---@field key integer
---@field isToggle boolean
KeyBind = {}

---Permashow this item. If not necessary , **overrideSave** should be **false.**‌
---@param show boolean #Should draw permashow.
---@param overrideSave boolean #Force permashow even if save is exist.
KeyBind.PermaShow = function(self, show, overrideSave) end

---Add tooltip to this element.
---@param tooltipString string #Tooltip string.
KeyBind.AddTooltip = function(self, tooltipString) end


--End(keybind.lua)--

--Start(list.lua)--
---List
---@class List : MenuComponent
---@field value integer
---@field items string[] #(std::vector<string>)
List = {}

---Permashow this item. If not necessary , **overrideSave** should be **false.**
---@param show boolean #Should draw permashow.
---@param overrideSave boolean #Force permashow even if save is exist.
List.PermaShow = function(self, show, overrideSave) end

---Add tooltip to this element.
---@param tooltipString string #Tooltip string.
List.AddTooltip = function(self, tooltipString) end


--End(list.lua)--

--Start(menu.lua)--
---Root Menu.
---@class Menu : MenuComponent
---@field page integer
---@field isVisible boolean
Menu = {}

---Create and returns a root menu item.
---@param name string #Internal name.
---@param displayName string #Display name.
---@param page number #Base menu page.
---@return Menu
Menu.CreateMenu = function(self, name, displayName, page) end

---Add tooltip to this element.
---@param tooltipString string #Tooltip string.
Menu.AddTooltip = function(self, tooltipString) end

---Create and returns sub menu.
---@param name string #Internal name.
---@param displayName string #Display name.
---@return Menu
Menu.AddMenu = function(self, name, displayName) end

---Add a checkbox to menu.
---@param name string #Internal name.
---@param displayName string #Display name.
---@param defaultValue boolean #Default value.
---@param callback function #Callback when value change.
---@return CheckBox
Menu.AddCheckBox = function(self, name, displayName, defaultValue, callback) end

---Add a colorpicker to menu.
---@param name string #Internal name.
---@param displayName string #Display name.
---@param defaultValue color #Default color value.
---@param hasCheckBox boolean #Has checkbox
---@param checkBoxDefaultValue boolean #Checkbox default value.
---@param callback function #Callback when value change.
---@return ColorPicker
Menu.AddColorPicker = function(self, name, displayName, defaultValue, hasCheckBox, checkBoxDefaultValue, callback) end

---Add an info text to menu.
---@param name string #Internal name.
---@param displayName string #Display name.
Menu.AddInfo = function(self, name, displayName) end

---Add a keybind to menu.
---@param name string #Internal name.
---@param displayName string #Display name.
---@param key number #(unsigned char) Key.
---@param defaultValue boolean #Default value.
---@param isToggle boolean #Is toggle.
---@param callback? function #Callback when value change.
---@return KeyBind
Menu.AddKeyBind = function(self, name, displayName, key, defaultValue, isToggle, callback) end

---Add a list to menu.
---@param name string #Internal name.
---@param displayName string #Display name.
---@param items string table #Select items.
---@param defaultValue integer #Default select value.
---@param callback function #Callback when value change.
---@return List
Menu.AddList = function(self, name, displayName, items, defaultValue, callback) end

---Add a slider to menu.
---@param name string #Internal name.
---@param displayName string #Display name.
---@param defaultValue integer #Default value.
---@param minimumValue integer #Minimum value.
---@param maximumValue integer #Maximum value.
---@param step integer #Slider step per pix.
---@param callback function #Callback when value change.
---@return Slider
Menu.AddSlider = function(self, name, displayName, defaultValue, minimumValue, maximumValue, step, callback) end


--End(menu.lua)--

--Start(menucomponent.lua)--
---Base MenuComponent class.
---@class MenuComponent
---@field name string
---@field displayName string
MenuComponent = {}

---Casts this component to CheckBox
---@return CheckBox
MenuComponent.CastToCheckBox = function(self) end

---Casts this component to ColorPicker
---@return ColorPicker
MenuComponent.CastToColorPicker = function(self) end

---Casts this component to List
---@return List
MenuComponent.CastToList = function(self) end

---Casts this component to Slider
---@return Slider
MenuComponent.CastToSlider = function(self) end

---Casts this component to KeyBind
---@return KeyBind
MenuComponent.CastToKeyBind = function(self) end

---Casts this component to Menu
---@return Menu
MenuComponent.CastToMenu = function(self) end


--End(menucomponent.lua)--

--Start(slider.lua)--
---Slider.
---@class Slider : MenuComponent
---@field value integer
Slider = {}

---Permashow this item. If not necessary , **overrideSave** should be **false.**
---@param show boolean #Should draw permashow.
---@param overrideSave boolean #Force permashow even if save is exist.
Slider.PermaShow = function(self, show, overrideSave) end

---Add tooltip to this element.
---@param tooltipString string #Tooltip string.
Slider.AddTooltip = function(self, tooltipString) end


--End(slider.lua)--

--Start(ui-api.lua)--
---UI namespace
---**Danger:** Please be careful when accessing and overriding settings of other scripts!
---@class UI
---@field rootMenus Menu[] #(std::vector<Menu>) List of all root menus.
UI = {}

---Returns currently selected language.
---@return number #(integer)
UI.GetLanguage = function() end


-- Examples:

-- Example 1: Access Orbwalker Hold Radius settings and temporarily override it.
-- Warning: This is just a PoC to give you an idea how it can be done.
-- We highly advice not to mess around with settings, but if you have to - then please be responsible.
-- If you override some value - make sure to restore it immediately after you executed your logic.

local orbwalkerMenu
for _, v in UI.rootMenus:pairs() do
    if v and v.name and v.name == "Orbwalker" then -- Locate Orbwalker Menu
        orbwalkerMenu = v
        break
    end
end
local holdRadius = orbwalkerMenu["Configuration"]["HoldRadius"] -- Access HoldRadius setting
local originalHoldRadius
local function PushHoldRadius(value)
    if originalHoldRadius then return end -- Make sure we don't override it twice
    originalHoldRadius = holdRadius.value -- Store original value
    holdRadius.value = value -- Override value
end
local function PopHoldRadius()
    if not originalHoldRadius then return end
    holdRadius.value = originalHoldRadius
    originalHoldRadius = nil
end

local function MyLogic()
    PushHoldRadius(50) -- Override
    -- Perform logic
    PopHoldRadius() -- Restore
end

Callback.Bind(CallbackType.OnUnload, function()
    PopHoldRadius() -- Just in case do it OnUnload
    return CallbackResult.Dispose
end)

--End(ui-api.lua)--

### END OF DOCS ###