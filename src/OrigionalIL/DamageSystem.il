.class public auto ansi abstract sealed beforefieldinit MGSC.DamageSystem
	extends [mscorlib]System.Object
{
	// Nested Types
	.class nested private auto ansi sealed serializable beforefieldinit '<>c'
		extends [mscorlib]System.Object
	{
		.custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = (
			01 00 00 00
		)
		// Fields
		.field public static initonly class MGSC.DamageSystem/'<>c' '<>9'
		.field public static class MGSC.RefEntityAction`1<valuetype MGSC.DamageRequest> '<>9__13_0'
		.field public static class MGSC.RefEntityAction`1<valuetype MGSC.DamageRequest> '<>9__14_0'
		.field public static class MGSC.RefEntityAction`1<valuetype MGSC.DamageRequest> '<>9__15_0'

		// Methods
		.method private hidebysig specialname rtspecialname static 
			void .cctor () cil managed 
		{
			// Method begins at RVA 0x13180f
			// Header size: 1
			// Code size: 11 (0xb)
			.maxstack 8

			// <>9 = new <>c();
			IL_0000: newobj instance void MGSC.DamageSystem/'<>c'::.ctor()
			IL_0005: stsfld class MGSC.DamageSystem/'<>c' MGSC.DamageSystem/'<>c'::'<>9'
			// }
			IL_000a: ret
		} // end of method '<>c'::.cctor

		.method public hidebysig specialname rtspecialname 
			instance void .ctor () cil managed 
		{
			// Method begins at RVA 0x13181b
			// Header size: 1
			// Code size: 7 (0x7)
			.maxstack 8

			// {
			IL_0000: ldarg.0
			// }
			IL_0001: call instance void [mscorlib]System.Object::.ctor()
			IL_0006: ret
		} // end of method '<>c'::.ctor

		.method assembly hidebysig 
			instance void '<ProceedCreatureDamage>b__13_0' (
				int32 e,
				valuetype MGSC.DamageRequest& req
			) cil managed 
		{
			// Method begins at RVA 0x131824
			// Header size: 12
			// Code size: 1205 (0x4b5)
			.maxstack 16
			.locals init (
				[0] class MGSC.Creature,
				[1] valuetype MGSC.ProjectileRuntimeData&,
				[2] valuetype MGSC.Ballistic&,
				[3] valuetype MGSC.DamageRequestCreature&,
				[4] valuetype MGSC.DmgInfo,
				[5] float32,
				[6] float32,
				[7] class MGSC.DamageHitInfo,
				[8] class MGSC.Creature,
				[9] bool,
				[10] class MGSC.RangeAttackLogEntry,
				[11] valuetype MGSC.InjureResult,
				[12] bool,
				[13] valuetype MGSC.BecomeTraitor,
				[14] valuetype MGSC.IgniteTarget,
				[15] valuetype MGSC.StunTarget,
				[16] valuetype MGSC.KnockbackInProgress,
				[17] valuetype MGSC.KnockbackRequest
			)

			// Creature creature = _cacheCreatures.GetCreature(req.TargetUid);
			IL_0000: ldsfld class MGSC.Creatures MGSC.DamageSystem::_cacheCreatures
			IL_0005: ldarg.2
			IL_0006: ldfld int32 MGSC.DamageRequest::TargetUid
			IL_000b: callvirt instance class MGSC.Creature MGSC.Creatures::GetCreature(int32)
			IL_0010: stloc.0
			// if ((object)creature == null)
			IL_0011: ldloc.0
			IL_0012: brtrue.s IL_0020

			// _cacheEntities.ScheduleDestroy(e);
			IL_0014: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_0019: ldarg.1
			IL_001a: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// }
			IL_001f: ret

			// ref ProjectileRuntimeData @ref = ref _cacheEntities.GetRef<ProjectileRuntimeData>(req.ProjEntityId);
			IL_0020: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_0025: ldarg.2
			IL_0026: ldfld int32 MGSC.DamageRequest::ProjEntityId
			IL_002b: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.ProjectileRuntimeData>(int32)
			IL_0030: stloc.1
			// ref Ballistic ref2 = ref _cacheEntities.GetRef<Ballistic>(req.ProjEntityId);
			IL_0031: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_0036: ldarg.2
			IL_0037: ldfld int32 MGSC.DamageRequest::ProjEntityId
			IL_003c: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.Ballistic>(int32)
			IL_0041: stloc.2
			// ref DamageRequestCreature ref3 = ref _cacheEntities.GetRef<DamageRequestCreature>(e);
			IL_0042: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_0047: ldarg.1
			IL_0048: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.DamageRequestCreature>(int32)
			IL_004d: stloc.3
			// DmgInfo dmgInfo = DmgInfo.ToLegacy(@ref.WeaponDamage);
			IL_004e: ldloc.1
			IL_004f: ldfld valuetype MGSC.DmgInfoRuntime MGSC.ProjectileRuntimeData::WeaponDamage
			IL_0054: call valuetype MGSC.DmgInfo MGSC.DmgInfo::ToLegacy(valuetype MGSC.DmgInfoRuntime)
			IL_0059: stloc.s 4
			// float num = @ref.CritBonus;
			IL_005b: ldloc.1
			IL_005c: ldfld float32 MGSC.ProjectileRuntimeData::CritBonus
			IL_0061: stloc.s 5
			// float num2 = @ref.CritDamageBonus;
			IL_0063: ldloc.1
			IL_0064: ldfld float32 MGSC.ProjectileRuntimeData::CritDamageBonus
			IL_0069: stloc.s 6
			// if (creature.CanBeBackstabbed)
			IL_006b: ldloc.0
			IL_006c: callvirt instance bool MGSC.Creature::get_CanBeBackstabbed()
			IL_0071: brfalse.s IL_0089

			// num += @ref.BackstabCritChance;
			IL_0073: ldloc.s 5
			IL_0075: ldloc.1
			IL_0076: ldfld float32 MGSC.ProjectileRuntimeData::BackstabCritChance
			IL_007b: add
			IL_007c: stloc.s 5
			// num2 += @ref.BackstabCritDamage;
			IL_007e: ldloc.s 6
			IL_0080: ldloc.1
			IL_0081: ldfld float32 MGSC.ProjectileRuntimeData::BackstabCritDamage
			IL_0086: add
			IL_0087: stloc.s 6

			// DamageHitInfo damageHitInfo = CalculateHitInfo(ref2.PassedDistance, @ref.Accuracy, req.Dodge, num, dmgInfo, @ref.OverallDmgMult, @ref.WoundChanceBonus, @ref.EffectiveRangeStarts, @ref.Range, @ref.Falloff, autoCrit: false, autoHit: true, num2, @ref.WoundChanceMult, isMaxHitChance: @ref.IsMaxHitChance, noCrit: @ref.NoCrit);
			IL_0089: ldloc.2
			IL_008a: ldfld int32 MGSC.Ballistic::PassedDistance
			IL_008f: ldloc.1
			IL_0090: ldfld float32 MGSC.ProjectileRuntimeData::Accuracy
			IL_0095: ldarg.2
			IL_0096: ldfld float32 MGSC.DamageRequest::Dodge
			IL_009b: ldloc.s 5
			IL_009d: ldloc.s 4
			IL_009f: ldloc.1
			IL_00a0: ldfld float32 MGSC.ProjectileRuntimeData::OverallDmgMult
			IL_00a5: ldloc.1
			IL_00a6: ldfld float32 MGSC.ProjectileRuntimeData::WoundChanceBonus
			IL_00ab: ldloc.1
			IL_00ac: ldfld int32 MGSC.ProjectileRuntimeData::EffectiveRangeStarts
			IL_00b1: ldloc.1
			IL_00b2: ldfld int32 MGSC.ProjectileRuntimeData::Range
			IL_00b7: ldloc.1
			IL_00b8: ldfld float32 MGSC.ProjectileRuntimeData::Falloff
			IL_00bd: ldc.i4.0
			IL_00be: ldc.i4.1
			IL_00bf: ldloc.s 6
			IL_00c1: ldloc.1
			IL_00c2: ldfld float32 MGSC.ProjectileRuntimeData::WoundChanceMult
			IL_00c7: ldloc.1
			IL_00c8: ldfld bool MGSC.ProjectileRuntimeData::IsMaxHitChance
			IL_00cd: stloc.s 12
			IL_00cf: ldloc.1
			IL_00d0: ldfld bool MGSC.ProjectileRuntimeData::NoCrit
			IL_00d5: ldloc.s 12
			IL_00d7: call class MGSC.DamageHitInfo MGSC.DamageSystem::CalculateHitInfo(int32, float32, float32, float32, valuetype MGSC.DmgInfo, float32, float32, int32, int32, float32, bool, bool, float32, float32, bool, bool)
			IL_00dc: stloc.s 7
			// damageHitInfo.ampChanceBonus += @ref.WoundChanceBonus;
			IL_00de: ldloc.s 7
			IL_00e0: dup
			IL_00e1: ldfld float32 MGSC.DamageHitInfo::ampChanceBonus
			IL_00e6: ldloc.1
			IL_00e7: ldfld float32 MGSC.ProjectileRuntimeData::WoundChanceBonus
			IL_00ec: add
			IL_00ed: stfld float32 MGSC.DamageHitInfo::ampChanceBonus
			// damageHitInfo.doAmpOnWound = @ref.DoAmpOnWound;
			IL_00f2: ldloc.s 7
			IL_00f4: ldloc.1
			IL_00f5: ldfld bool MGSC.ProjectileRuntimeData::DoAmpOnWound
			IL_00fa: stfld bool MGSC.DamageHitInfo::doAmpOnWound
			// damageHitInfo.silenceDmg = @ref.DoSilentDmg;
			IL_00ff: ldloc.s 7
			IL_0101: ldloc.1
			IL_0102: ldfld bool MGSC.ProjectileRuntimeData::DoSilentDmg
			IL_0107: stfld bool MGSC.DamageHitInfo::silenceDmg
			// damageHitInfo.dangerPosition = ref2.InitialPosition;
			IL_010c: ldloc.s 7
			IL_010e: ldloc.2
			IL_010f: ldfld valuetype MGSC.CellPosition MGSC.Ballistic::InitialPosition
			IL_0114: stfld valuetype MGSC.CellPosition MGSC.DamageHitInfo::dangerPosition
			// damageHitInfo.weaponArmorPen += @ref.ArmorPen;
			IL_0119: ldloc.s 7
			IL_011b: dup
			IL_011c: ldfld float32 MGSC.DamageHitInfo::weaponArmorPen
			IL_0121: ldloc.1
			IL_0122: ldfld float32 MGSC.ProjectileRuntimeData::ArmorPen
			IL_0127: add
			IL_0128: stfld float32 MGSC.DamageHitInfo::weaponArmorPen
			// damageHitInfo.statusEffectId = SharedStringIds.Get(@ref.StatusEffectId);
			IL_012d: ldloc.s 7
			IL_012f: ldloc.1
			IL_0130: ldfld int32 MGSC.ProjectileRuntimeData::StatusEffectId
			IL_0135: call string MGSC.SharedStringIds::Get(int32)
			IL_013a: stfld string MGSC.DamageHitInfo::statusEffectId
			// damageHitInfo.statusEffectDmgMult += @ref.StatusEffectDmgMult;
			IL_013f: ldloc.s 7
			IL_0141: dup
			IL_0142: ldfld float32 MGSC.DamageHitInfo::statusEffectDmgMult
			IL_0147: ldloc.1
			IL_0148: ldfld float32 MGSC.ProjectileRuntimeData::StatusEffectDmgMult
			IL_014d: add
			IL_014e: stfld float32 MGSC.DamageHitInfo::statusEffectDmgMult
			// damageHitInfo.statusEffectChanceToApplyBonus += @ref.StatusEffectChanceToApplyBonus;
			IL_0153: ldloc.s 7
			IL_0155: dup
			IL_0156: ldfld float32 MGSC.DamageHitInfo::statusEffectChanceToApplyBonus
			IL_015b: ldloc.1
			IL_015c: ldfld float32 MGSC.ProjectileRuntimeData::StatusEffectChanceToApplyBonus
			IL_0161: add
			IL_0162: stfld float32 MGSC.DamageHitInfo::statusEffectChanceToApplyBonus
			// damageHitInfo.statusEffectDmgModBonus += @ref.StatusEffectDamageModBonus;
			IL_0167: ldloc.s 7
			IL_0169: dup
			IL_016a: ldfld float32 MGSC.DamageHitInfo::statusEffectDmgModBonus
			IL_016f: ldloc.1
			IL_0170: ldfld float32 MGSC.ProjectileRuntimeData::StatusEffectDamageModBonus
			IL_0175: add
			IL_0176: stfld float32 MGSC.DamageHitInfo::statusEffectDmgModBonus
			// damageHitInfo.statusEffectResistModBonus += @ref.StatusEffectResistModBonus;
			IL_017b: ldloc.s 7
			IL_017d: dup
			IL_017e: ldfld float32 MGSC.DamageHitInfo::statusEffectResistModBonus
			IL_0183: ldloc.1
			IL_0184: ldfld float32 MGSC.ProjectileRuntimeData::StatusEffectResistModBonus
			IL_0189: add
			IL_018a: stfld float32 MGSC.DamageHitInfo::statusEffectResistModBonus
			// damageHitInfo.woundBonus = @ref.WoundBonus;
			IL_018f: ldloc.s 7
			IL_0191: ldloc.1
			IL_0192: ldfld valuetype MGSC.WoundBonus MGSC.ProjectileRuntimeData::WoundBonus
			IL_0197: stfld valuetype MGSC.WoundBonus MGSC.DamageHitInfo::woundBonus
			// if (!damageHitInfo.wasOutOfRange)
			IL_019c: ldloc.s 7
			IL_019e: ldfld bool MGSC.DamageHitInfo::wasOutOfRange
			IL_01a3: brtrue.s IL_01b2

			// damageHitInfo.corrosiveModifier = @ref.CorrosiveModifier;
			IL_01a5: ldloc.s 7
			IL_01a7: ldloc.1
			IL_01a8: ldfld float32 MGSC.ProjectileRuntimeData::CorrosiveModifier
			IL_01ad: stfld float32 MGSC.DamageHitInfo::corrosiveModifier

			// Creature creature2 = (damageHitInfo.damageDealer = _cacheCreatures.GetCreature(req.OwnerUid));
			IL_01b2: ldsfld class MGSC.Creatures MGSC.DamageSystem::_cacheCreatures
			IL_01b7: ldarg.2
			IL_01b8: ldfld int32 MGSC.DamageRequest::OwnerUid
			IL_01bd: callvirt instance class MGSC.Creature MGSC.Creatures::GetCreature(int32)
			IL_01c2: stloc.s 8
			// bool alive = creature.CreatureData.Health.Alive;
			IL_01c4: ldloc.s 7
			IL_01c6: ldloc.s 8
			IL_01c8: stfld class MGSC.Creature MGSC.DamageHitInfo::damageDealer
			IL_01cd: ldloc.0
			IL_01ce: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_01d3: ldfld class MGSC.HealthInfo MGSC.CreatureData::Health
			IL_01d8: callvirt instance bool MGSC.HealthInfo::get_Alive()
			IL_01dd: stloc.s 9
			// bool num3 = _cacheMapGrid.GetCell(ref2.InitialPosition, checkBorders: false).isSeen || _cacheMapGrid.GetCell(req.Position, checkBorders: false).isSeen;
			IL_01df: ldsfld class MGSC.MapGrid MGSC.DamageSystem::_cacheMapGrid
			IL_01e4: ldloc.2
			IL_01e5: ldfld valuetype MGSC.CellPosition MGSC.Ballistic::InitialPosition
			IL_01ea: ldc.i4.0
			IL_01eb: callvirt instance class MGSC.MapCell MGSC.MapGrid::GetCell(valuetype MGSC.CellPosition, bool)
			IL_01f0: ldfld bool MGSC.MapCell::isSeen
			IL_01f5: brtrue.s IL_020f

			IL_01f7: ldsfld class MGSC.MapGrid MGSC.DamageSystem::_cacheMapGrid
			IL_01fc: ldarg.2
			IL_01fd: ldfld valuetype MGSC.CellPosition MGSC.DamageRequest::Position
			IL_0202: ldc.i4.0
			IL_0203: callvirt instance class MGSC.MapCell MGSC.MapGrid::GetCell(valuetype MGSC.CellPosition, bool)
			IL_0208: ldfld bool MGSC.MapCell::isSeen
			IL_020d: br.s IL_0210

			// RangeAttackLogEntry entry = null;
			IL_020f: ldc.i4.1

			IL_0210: ldnull
			IL_0211: stloc.s 10
			// if (num3)
			IL_0213: dup
			IL_0214: brfalse.s IL_0245

			// entry = CombatLogSystem.BeginAddRangeAttackEntry(_cacheRaidMetadata, _cacheCombatLog, @ref.OwnerNameTagId, ref3.TargetNameTagId, @ref.CreatureOwnerAlliance, ref3.CreatureTargetAlliance, @ref.WeaponId);
			IL_0216: ldsfld class MGSC.RaidMetadata MGSC.DamageSystem::_cacheRaidMetadata
			IL_021b: ldsfld class MGSC.CombatLog MGSC.DamageSystem::_cacheCombatLog
			IL_0220: ldloc.1
			IL_0221: ldfld int32 MGSC.ProjectileRuntimeData::OwnerNameTagId
			IL_0226: ldloc.3
			IL_0227: ldfld int32 MGSC.DamageRequestCreature::TargetNameTagId
			IL_022c: ldloc.1
			IL_022d: ldfld valuetype MGSC.CreatureAlliance MGSC.ProjectileRuntimeData::CreatureOwnerAlliance
			IL_0232: ldloc.3
			IL_0233: ldfld valuetype MGSC.CreatureAlliance MGSC.DamageRequestCreature::CreatureTargetAlliance
			IL_0238: ldloc.1
			IL_0239: ldfld int32 MGSC.ProjectileRuntimeData::WeaponId
			IL_023e: call class MGSC.RangeAttackLogEntry MGSC.CombatLogSystem::BeginAddRangeAttackEntry(class MGSC.RaidMetadata, class MGSC.CombatLog, int32, int32, valuetype MGSC.CreatureAlliance, valuetype MGSC.CreatureAlliance, int32)
			IL_0243: stloc.s 10

			// InjureResult injureResult = creature.Injure(damageHitInfo, playSounds: true, creature.Creature3dView.Descriptor.PutBlood && @ref.MakeBloodDecals);
			IL_0245: ldloc.0
			IL_0246: ldloc.s 7
			IL_0248: ldc.i4.1
			IL_0249: ldloc.0
			IL_024a: callvirt instance class MGSC.Creature3dView MGSC.Creature::get_Creature3dView()
			IL_024f: callvirt instance class MGSC.ActorDescriptor MGSC.Creature3dView::get_Descriptor()
			IL_0254: callvirt instance bool MGSC.ActorDescriptor::get_PutBlood()
			IL_0259: brfalse.s IL_0263

			IL_025b: ldloc.1
			IL_025c: ldfld bool MGSC.ProjectileRuntimeData::MakeBloodDecals
			// (no C# code)
			IL_0261: br.s IL_0264

			IL_0263: ldc.i4.0

			IL_0264: callvirt instance valuetype MGSC.InjureResult MGSC.Creature::Injure(class MGSC.DamageHitInfo, bool, bool)
			IL_0269: stloc.s 11
			// if (num3)
			IL_026b: brfalse.s IL_027b

			// CombatLogSystem.FinishRangeAttackLogEntry(_cacheCombatLog, entry, damageHitInfo);
			IL_026d: ldsfld class MGSC.CombatLog MGSC.DamageSystem::_cacheCombatLog
			IL_0272: ldloc.s 10
			IL_0274: ldloc.s 7
			IL_0276: call void MGSC.CombatLogSystem::FinishRangeAttackLogEntry(class MGSC.CombatLog, class MGSC.RangeAttackLogEntry, class MGSC.DamageHitInfo)

			// if (creature2 != null)
			IL_027b: ldloc.s 8
			IL_027d: ldnull
			IL_027e: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0283: brfalse.s IL_02b2

			// if (injureResult.WasAmputation)
			IL_0285: ldloc.s 11
			IL_0287: ldfld bool MGSC.InjureResult::WasAmputation
			IL_028c: brfalse.s IL_0296

			// creature2.ActivateAmputationTrigger(victim: false);
			IL_028e: ldloc.s 8
			IL_0290: ldc.i4.0
			IL_0291: callvirt instance void MGSC.Creature::ActivateAmputationTrigger(bool)

			// if (creature.CreatureData.Health.Dead && alive)
			IL_0296: ldloc.0
			IL_0297: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_029c: ldfld class MGSC.HealthInfo MGSC.CreatureData::Health
			IL_02a1: callvirt instance bool MGSC.HealthInfo::get_Dead()
			IL_02a6: ldloc.s 9
			IL_02a8: and
			IL_02a9: brfalse.s IL_02b2

			// creature2.ActivateRangeKillTrigger();
			IL_02ab: ldloc.s 8
			IL_02ad: callvirt instance void MGSC.Creature::ActivateRangeKillTrigger()

			// if (@ref.CreatureOwnerAlliance == ref3.CreatureTargetAlliance)
			IL_02b2: ldloc.1
			IL_02b3: ldfld valuetype MGSC.CreatureAlliance MGSC.ProjectileRuntimeData::CreatureOwnerAlliance
			IL_02b8: ldloc.3
			IL_02b9: ldfld valuetype MGSC.CreatureAlliance MGSC.DamageRequestCreature::CreatureTargetAlliance
			IL_02be: bne.un.s IL_02eb

			// 		_cacheEntities.Add(_cacheEntities.CreateEntity(), new BecomeTraitor
			// 		{
			// 			TraitorUid = req.OwnerUid
			// 		});
			IL_02c0: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_02c5: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_02ca: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_02cf: ldloca.s 13
			IL_02d1: initobj MGSC.BecomeTraitor
			IL_02d7: ldloca.s 13
			IL_02d9: ldarg.2
			IL_02da: ldfld int32 MGSC.DamageRequest::OwnerUid
			IL_02df: stfld int32 MGSC.BecomeTraitor::TraitorUid
			IL_02e4: ldloc.s 13
			// if (!damageHitInfo.wasOutOfRange && !creature.CreatureData.Health.Dead)
			IL_02e6: callvirt instance void MGSC.Entities::Add<valuetype MGSC.BecomeTraitor>(int32, !!0)

			IL_02eb: ldloc.s 7
			IL_02ed: ldfld bool MGSC.DamageHitInfo::wasOutOfRange
			IL_02f2: brtrue IL_04a9

			IL_02f7: ldloc.0
			IL_02f8: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_02fd: ldfld class MGSC.HealthInfo MGSC.CreatureData::Health
			IL_0302: callvirt instance bool MGSC.HealthInfo::get_Dead()
			IL_0307: brtrue IL_04a9

			// if (@ref.IncendiaryChance > 0f)
			IL_030c: ldloc.1
			IL_030d: ldfld float32 MGSC.ProjectileRuntimeData::IncendiaryChance
			IL_0312: ldc.r4 0.0
			IL_0317: ble.un.s IL_0351

			// 			_cacheEntities.Add(_cacheEntities.CreateEntity(), new IgniteTarget
			// 			{
			// 				TargetUid = req.TargetUid,
			// 				IgniteChance = @ref.IncendiaryChance
			// 			});
			IL_0319: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_031e: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_0323: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_0328: ldloca.s 14
			IL_032a: initobj MGSC.IgniteTarget
			IL_0330: ldloca.s 14
			IL_0332: ldarg.2
			IL_0333: ldfld int32 MGSC.DamageRequest::TargetUid
			IL_0338: stfld int32 MGSC.IgniteTarget::TargetUid
			IL_033d: ldloca.s 14
			IL_033f: ldloc.1
			IL_0340: ldfld float32 MGSC.ProjectileRuntimeData::IncendiaryChance
			IL_0345: stfld float32 MGSC.IgniteTarget::IgniteChance
			IL_034a: ldloc.s 14
			// if (!creature.IgnoreStun && @ref.AmmoStunChance > 0f)
			IL_034c: callvirt instance void MGSC.Entities::Add<valuetype MGSC.IgniteTarget>(int32, !!0)

			IL_0351: ldloc.0
			IL_0352: callvirt instance bool MGSC.Creature::get_IgnoreStun()
			IL_0357: brtrue.s IL_03b3

			IL_0359: ldloc.1
			IL_035a: ldfld float32 MGSC.ProjectileRuntimeData::AmmoStunChance
			IL_035f: ldc.r4 0.0
			IL_0364: ble.un.s IL_03b3

			// damageHitInfo.wasStun = true;
			IL_0366: ldloc.s 7
			IL_0368: ldc.i4.1
			IL_0369: stfld bool MGSC.DamageHitInfo::wasStun
			// 			_cacheEntities.Add(_cacheEntities.CreateEntity(), new StunTarget
			// 			{
			// 				TargetUid = req.TargetUid,
			// 				StunChance = @ref.AmmoStunChance,
			// 				StunDuration = @ref.AmmoStunDuration
			// 			});
			IL_036e: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_0373: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_0378: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_037d: ldloca.s 15
			IL_037f: initobj MGSC.StunTarget
			IL_0385: ldloca.s 15
			IL_0387: ldarg.2
			IL_0388: ldfld int32 MGSC.DamageRequest::TargetUid
			IL_038d: stfld int32 MGSC.StunTarget::TargetUid
			IL_0392: ldloca.s 15
			IL_0394: ldloc.1
			IL_0395: ldfld float32 MGSC.ProjectileRuntimeData::AmmoStunChance
			IL_039a: stfld float32 MGSC.StunTarget::StunChance
			IL_039f: ldloca.s 15
			IL_03a1: ldloc.1
			IL_03a2: ldfld int32 MGSC.ProjectileRuntimeData::AmmoStunDuration
			IL_03a7: stfld int32 MGSC.StunTarget::StunDuration
			IL_03ac: ldloc.s 15
			// if (!creature.CreatureData.IgnoreThrowback && !creature.CreatureData.EffectsController.HasAnyEffect<WoundEffectThrowbackImmune>() && @ref.AmmoKnockBackChance > 0f && !creature.Creature3dView.ThrowBackInProgress && !WasKnockbackApplied(_cacheEntities, creature.CreatureData.UniqueId))
			IL_03ae: callvirt instance void MGSC.Entities::Add<valuetype MGSC.StunTarget>(int32, !!0)

			IL_03b3: ldloc.0
			IL_03b4: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_03b9: ldfld bool MGSC.CreatureData::IgnoreThrowback
			IL_03be: brtrue IL_04a9

			IL_03c3: ldloc.0
			IL_03c4: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_03c9: ldfld class MGSC.EffectsController MGSC.CreatureData::EffectsController
			IL_03ce: callvirt instance bool MGSC.EffectsController::HasAnyEffect<class MGSC.WoundEffectThrowbackImmune>()
			IL_03d3: brtrue IL_04a9

			// (no C# code)
			IL_03d8: ldloc.1
			IL_03d9: ldfld float32 MGSC.ProjectileRuntimeData::AmmoKnockBackChance
			IL_03de: ldc.r4 0.0
			IL_03e3: ble.un IL_04a9

			IL_03e8: ldloc.0
			IL_03e9: callvirt instance class MGSC.Creature3dView MGSC.Creature::get_Creature3dView()
			IL_03ee: callvirt instance bool MGSC.Creature3dView::get_ThrowBackInProgress()
			IL_03f3: brtrue IL_04a9

			// 			_cacheEntities.Add(_cacheEntities.CreateEntity(), new KnockbackInProgress
			// 			{
			// 				TargetUid = creature.CreatureData.UniqueId
			// 			});
			IL_03f8: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_03fd: ldloc.0
			IL_03fe: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_0403: ldfld int32 MGSC.CreatureData::UniqueId
			IL_0408: call bool MGSC.DamageSystem::WasKnockbackApplied(class MGSC.Entities, int32)
			IL_040d: brtrue IL_04a9

			IL_0412: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_0417: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_041c: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_0421: ldloca.s 16
			IL_0423: initobj MGSC.KnockbackInProgress
			IL_0429: ldloca.s 16
			IL_042b: ldloc.0
			IL_042c: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_0431: ldfld int32 MGSC.CreatureData::UniqueId
			IL_0436: stfld int32 MGSC.KnockbackInProgress::TargetUid
			IL_043b: ldloc.s 16
			// 			_cacheEntities.Add(_cacheEntities.CreateEntity(), new KnockbackRequest
			// 			{
			// 				SourcePosition = ref2.InitialPosition,
			// 				TargetPosition = creature.CreatureData.Position,
			// 				KnockbackChance = @ref.AmmoKnockBackChance,
			// 				HasExtraKnockback = @ref.HasExtraKnockback,
			// 				IsInstant = !creature.IsSeenByPlayer
			// 			});
			IL_043d: callvirt instance void MGSC.Entities::Add<valuetype MGSC.KnockbackInProgress>(int32, !!0)
			IL_0442: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_0447: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_044c: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_0451: ldloca.s 17
			IL_0453: initobj MGSC.KnockbackRequest
			IL_0459: ldloca.s 17
			IL_045b: ldloc.2
			IL_045c: ldfld valuetype MGSC.CellPosition MGSC.Ballistic::InitialPosition
			IL_0461: stfld valuetype MGSC.CellPosition MGSC.KnockbackRequest::SourcePosition
			IL_0466: ldloca.s 17
			IL_0468: ldloc.0
			IL_0469: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_046e: ldfld valuetype MGSC.CellPosition MGSC.CreatureData::Position
			IL_0473: stfld valuetype MGSC.CellPosition MGSC.KnockbackRequest::TargetPosition
			IL_0478: ldloca.s 17
			IL_047a: ldloc.1
			IL_047b: ldfld float32 MGSC.ProjectileRuntimeData::AmmoKnockBackChance
			IL_0480: stfld float32 MGSC.KnockbackRequest::KnockbackChance
			IL_0485: ldloca.s 17
			IL_0487: ldloc.1
			IL_0488: ldfld bool MGSC.ProjectileRuntimeData::HasExtraKnockback
			IL_048d: stfld bool MGSC.KnockbackRequest::HasExtraKnockback
			IL_0492: ldloca.s 17
			IL_0494: ldloc.0
			IL_0495: callvirt instance bool MGSC.Creature::get_IsSeenByPlayer()
			IL_049a: ldc.i4.0
			IL_049b: ceq
			IL_049d: stfld bool MGSC.KnockbackRequest::IsInstant
			IL_04a2: ldloc.s 17
			// _cacheEntities.ScheduleDestroy(e);
			IL_04a4: callvirt instance void MGSC.Entities::Add<valuetype MGSC.KnockbackRequest>(int32, !!0)

			IL_04a9: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_04ae: ldarg.1
			IL_04af: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// (no C# code)
			IL_04b4: ret
		} // end of method '<>c'::'<ProceedCreatureDamage>b__13_0'

		.method assembly hidebysig 
			instance void '<ProceedObstacleDamage>b__14_0' (
				int32 e,
				valuetype MGSC.DamageRequest& req
			) cil managed 
		{
			// Method begins at RVA 0x131ce8
			// Header size: 12
			// Code size: 165 (0xa5)
			.maxstack 12
			.locals init (
				[0] class MGSC.MapObstacle,
				[1] valuetype MGSC.ProjectileRuntimeData&,
				[2] valuetype MGSC.Ballistic&,
				[3] class MGSC.DamageHitInfo
			)

			// MapObstacle mapObstacle = _cacheMapObstacles.Get(req.TargetObstacleUid);
			IL_0000: ldsfld class MGSC.MapObstacles MGSC.DamageSystem::_cacheMapObstacles
			IL_0005: ldarg.2
			IL_0006: ldfld int32 MGSC.DamageRequest::TargetObstacleUid
			IL_000b: callvirt instance class MGSC.MapObstacle MGSC.MapObstacles::Get(int32)
			IL_0010: stloc.0
			// if (mapObstacle == null)
			IL_0011: ldloc.0
			IL_0012: ldnull
			IL_0013: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0018: brfalse.s IL_0026

			// _cacheEntities.ScheduleDestroy(e);
			IL_001a: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_001f: ldarg.1
			IL_0020: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// }
			IL_0025: ret

			// ref ProjectileRuntimeData @ref = ref _cacheEntities.GetRef<ProjectileRuntimeData>(req.ProjEntityId);
			IL_0026: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_002b: ldarg.2
			IL_002c: ldfld int32 MGSC.DamageRequest::ProjEntityId
			IL_0031: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.ProjectileRuntimeData>(int32)
			IL_0036: stloc.1
			// ref Ballistic ref2 = ref _cacheEntities.GetRef<Ballistic>(req.ProjEntityId);
			IL_0037: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_003c: ldarg.2
			IL_003d: ldfld int32 MGSC.DamageRequest::ProjEntityId
			IL_0042: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.Ballistic>(int32)
			IL_0047: stloc.2
			// DamageHitInfo dmgHit = new DamageHitInfo(0, @ref.OverallDmgMult, DmgInfo.ToLegacy(@ref.WeaponDamage), @ref.Accuracy, @ref.CritBonus, @ref.EffectiveRangeStarts, @ref.Range, @ref.Falloff);
			IL_0048: ldc.i4.0
			IL_0049: ldloc.1
			IL_004a: ldfld float32 MGSC.ProjectileRuntimeData::OverallDmgMult
			IL_004f: ldloc.1
			IL_0050: ldfld valuetype MGSC.DmgInfoRuntime MGSC.ProjectileRuntimeData::WeaponDamage
			IL_0055: call valuetype MGSC.DmgInfo MGSC.DmgInfo::ToLegacy(valuetype MGSC.DmgInfoRuntime)
			IL_005a: ldloc.1
			IL_005b: ldfld float32 MGSC.ProjectileRuntimeData::Accuracy
			IL_0060: ldloc.1
			IL_0061: ldfld float32 MGSC.ProjectileRuntimeData::CritBonus
			IL_0066: ldloc.1
			IL_0067: ldfld int32 MGSC.ProjectileRuntimeData::EffectiveRangeStarts
			IL_006c: ldloc.1
			IL_006d: ldfld int32 MGSC.ProjectileRuntimeData::Range
			IL_0072: ldloc.1
			IL_0073: ldfld float32 MGSC.ProjectileRuntimeData::Falloff
			IL_0078: ldc.i4.0
			IL_0079: ldc.i4.0
			IL_007a: ldc.r4 0.0
			IL_007f: ldc.i4.0
			IL_0080: newobj instance void MGSC.DamageHitInfo::.ctor(int32, float32, valuetype MGSC.DmgInfo, float32, float32, int32, int32, float32, bool, bool, float32, bool)
			IL_0085: stloc.3
			// ApplyObstacleDamage(mapObstacle, ref2.InitialPosition, dmgHit, @ref.Speed);
			IL_0086: ldloc.0
			IL_0087: ldloc.2
			IL_0088: ldfld valuetype MGSC.CellPosition MGSC.Ballistic::InitialPosition
			IL_008d: ldloc.3
			IL_008e: ldloc.1
			IL_008f: ldfld float32 MGSC.ProjectileRuntimeData::Speed
			IL_0094: call void MGSC.DamageSystem::ApplyObstacleDamage(class MGSC.MapObstacle, valuetype MGSC.CellPosition, class MGSC.DamageHitInfo, float32)
			// _cacheEntities.ScheduleDestroy(e);
			IL_0099: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_009e: ldarg.1
			IL_009f: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// (no C# code)
			IL_00a4: ret
		} // end of method '<>c'::'<ProceedObstacleDamage>b__14_0'

		.method assembly hidebysig 
			instance void '<ProceedWallDamage>b__15_0' (
				int32 e,
				valuetype MGSC.DamageRequest& req
			) cil managed 
		{
			// Method begins at RVA 0x131d9c
			// Header size: 12
			// Code size: 212 (0xd4)
			.maxstack 13
			.locals init (
				[0] class MGSC.MapCell,
				[1] valuetype MGSC.ProjectileRuntimeData&,
				[2] valuetype MGSC.Ballistic&,
				[3] valuetype MGSC.DmgInfo,
				[4] class MGSC.DamageHitInfo
			)

			// MapCell cell = _cacheMapGrid.GetCell(req.Position);
			IL_0000: ldsfld class MGSC.MapGrid MGSC.DamageSystem::_cacheMapGrid
			IL_0005: ldarg.2
			IL_0006: ldfld valuetype MGSC.CellPosition MGSC.DamageRequest::Position
			IL_000b: ldc.i4.1
			IL_000c: callvirt instance class MGSC.MapCell MGSC.MapGrid::GetCell(valuetype MGSC.CellPosition, bool)
			IL_0011: stloc.0
			// if (cell == null || cell.IsFloorSurfaceType)
			IL_0012: ldloc.0
			IL_0013: brfalse.s IL_001d

			IL_0015: ldloc.0
			IL_0016: callvirt instance bool MGSC.MapCell::get_IsFloorSurfaceType()
			IL_001b: brfalse.s IL_0029

			// _cacheEntities.ScheduleDestroy(e);
			IL_001d: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_0022: ldarg.1
			IL_0023: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// }
			IL_0028: ret

			// ref ProjectileRuntimeData @ref = ref _cacheEntities.GetRef<ProjectileRuntimeData>(req.ProjEntityId);
			IL_0029: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_002e: ldarg.2
			IL_002f: ldfld int32 MGSC.DamageRequest::ProjEntityId
			IL_0034: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.ProjectileRuntimeData>(int32)
			IL_0039: stloc.1
			// ref Ballistic ref2 = ref _cacheEntities.GetRef<Ballistic>(req.ProjEntityId);
			IL_003a: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_003f: ldarg.2
			IL_0040: ldfld int32 MGSC.DamageRequest::ProjEntityId
			IL_0045: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.Ballistic>(int32)
			IL_004a: stloc.2
			// DmgInfo dmgInfo = DmgInfo.ToLegacy(@ref.WeaponDamage);
			IL_004b: ldloc.1
			IL_004c: ldfld valuetype MGSC.DmgInfoRuntime MGSC.ProjectileRuntimeData::WeaponDamage
			IL_0051: call valuetype MGSC.DmgInfo MGSC.DmgInfo::ToLegacy(valuetype MGSC.DmgInfoRuntime)
			IL_0056: stloc.3
			// DamageHitInfo originalDmgHit = new DamageHitInfo(0, @ref.OverallDmgMult, dmgInfo, @ref.Accuracy, @ref.CritBonus, @ref.EffectiveRangeStarts, @ref.Range, @ref.Falloff);
			IL_0057: ldc.i4.0
			IL_0058: ldloc.1
			IL_0059: ldfld float32 MGSC.ProjectileRuntimeData::OverallDmgMult
			IL_005e: ldloc.3
			IL_005f: ldloc.1
			IL_0060: ldfld float32 MGSC.ProjectileRuntimeData::Accuracy
			IL_0065: ldloc.1
			IL_0066: ldfld float32 MGSC.ProjectileRuntimeData::CritBonus
			IL_006b: ldloc.1
			IL_006c: ldfld int32 MGSC.ProjectileRuntimeData::EffectiveRangeStarts
			IL_0071: ldloc.1
			IL_0072: ldfld int32 MGSC.ProjectileRuntimeData::Range
			IL_0077: ldloc.1
			IL_0078: ldfld float32 MGSC.ProjectileRuntimeData::Falloff
			IL_007d: ldc.i4.0
			IL_007e: ldc.i4.0
			IL_007f: ldc.r4 0.0
			IL_0084: ldc.i4.0
			IL_0085: newobj instance void MGSC.DamageHitInfo::.ctor(int32, float32, valuetype MGSC.DmgInfo, float32, float32, int32, int32, float32, bool, bool, float32, bool)
			IL_008a: stloc.s 4
			// FirearmSystem.ProcessGunshotOnWall(_cacheMapController, _cacheFireController, _cacheMapRenderer, _cacheMapObstacles, _cacheCreatures, _cacheItemsOnFloor, ref2.InitialPosition, _cacheMapGrid, _cacheVisibilities, _cacheMapEntities, originalDmgHit, cell);
			IL_008c: ldsfld class MGSC.MapController MGSC.DamageSystem::_cacheMapController
			IL_0091: ldsfld class MGSC.FireController MGSC.DamageSystem::_cacheFireController
			IL_0096: ldsfld class MGSC.MapRenderer MGSC.DamageSystem::_cacheMapRenderer
			IL_009b: ldsfld class MGSC.MapObstacles MGSC.DamageSystem::_cacheMapObstacles
			IL_00a0: ldsfld class MGSC.Creatures MGSC.DamageSystem::_cacheCreatures
			IL_00a5: ldsfld class MGSC.ItemsOnFloor MGSC.DamageSystem::_cacheItemsOnFloor
			IL_00aa: ldloc.2
			IL_00ab: ldfld valuetype MGSC.CellPosition MGSC.Ballistic::InitialPosition
			IL_00b0: ldsfld class MGSC.MapGrid MGSC.DamageSystem::_cacheMapGrid
			IL_00b5: ldsfld class MGSC.Visibilities MGSC.DamageSystem::_cacheVisibilities
			IL_00ba: ldsfld class MGSC.MapEntities MGSC.DamageSystem::_cacheMapEntities
			IL_00bf: ldloc.s 4
			IL_00c1: ldloc.0
			IL_00c2: ldc.i4.0
			IL_00c3: call void MGSC.FirearmSystem::ProcessGunshotOnWall(class MGSC.MapController, class MGSC.FireController, class MGSC.MapRenderer, class MGSC.MapObstacles, class MGSC.Creatures, class MGSC.ItemsOnFloor, valuetype MGSC.CellPosition, class MGSC.MapGrid, class MGSC.Visibilities, class MGSC.MapEntities, class MGSC.DamageHitInfo, class MGSC.MapCell, bool)
			// _cacheEntities.ScheduleDestroy(e);
			IL_00c8: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
			IL_00cd: ldarg.1
			IL_00ce: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// (no C# code)
			IL_00d3: ret
		} // end of method '<>c'::'<ProceedWallDamage>b__15_0'

	} // end of class <>c

	.class nested private auto ansi sealed beforefieldinit '<>c__DisplayClass24_0'
		extends [mscorlib]System.Object
	{
		.custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = (
			01 00 00 00
		)
		// Fields
		.field public int32 targetUid
		.field public bool found

		// Methods
		.method public hidebysig specialname rtspecialname 
			instance void .ctor () cil managed 
		{
			// Method begins at RVA 0x131e7c
			// Header size: 1
			// Code size: 7 (0x7)
			.maxstack 8

			// {
			IL_0000: ldarg.0
			// }
			IL_0001: call instance void [mscorlib]System.Object::.ctor()
			IL_0006: ret
		} // end of method '<>c__DisplayClass24_0'::.ctor

		.method assembly hidebysig 
			instance void '<WasKnockbackApplied>b__0' (
				int32 e,
				valuetype MGSC.KnockbackInProgress& k
			) cil managed 
		{
			// Method begins at RVA 0x131e84
			// Header size: 1
			// Code size: 22 (0x16)
			.maxstack 8

			// if (k.TargetUid == targetUid)
			IL_0000: ldarg.2
			IL_0001: ldfld int32 MGSC.KnockbackInProgress::TargetUid
			IL_0006: ldarg.0
			IL_0007: ldfld int32 MGSC.DamageSystem/'<>c__DisplayClass24_0'::targetUid
			IL_000c: bne.un.s IL_0015

			// found = true;
			IL_000e: ldarg.0
			IL_000f: ldc.i4.1
			IL_0010: stfld bool MGSC.DamageSystem/'<>c__DisplayClass24_0'::found

			// }
			IL_0015: ret
		} // end of method '<>c__DisplayClass24_0'::'<WasKnockbackApplied>b__0'

	} // end of class <>c__DisplayClass24_0


	// Fields
	.field private static class MGSC.Entities _cacheEntities
	.field private static class MGSC.Creatures _cacheCreatures
	.field private static class MGSC.MapGrid _cacheMapGrid
	.field private static class MGSC.MapController _cacheMapController
	.field private static class MGSC.FireController _cacheFireController
	.field private static class MGSC.MapRenderer _cacheMapRenderer
	.field private static class MGSC.MapObstacles _cacheMapObstacles
	.field private static class MGSC.ItemsOnFloor _cacheItemsOnFloor
	.field private static class MGSC.Visibilities _cacheVisibilities
	.field private static class MGSC.MapEntities _cacheMapEntities
	.field private static class MGSC.RaidMetadata _cacheRaidMetadata
	.field private static class MGSC.CombatLog _cacheCombatLog

	// Methods
	.method public hidebysig static 
		void Update (
			class MGSC.Entities entities,
			class MGSC.Creatures creatures,
			class MGSC.MapGrid mapGrid,
			class MGSC.MapController mapController,
			class MGSC.FireController fireController,
			class MGSC.MapRenderer mapRenderer,
			class MGSC.MapObstacles mapObstacles,
			class MGSC.ItemsOnFloor itemsOnFloor,
			class MGSC.Visibilities visibilities,
			class MGSC.MapEntities mapEntities,
			class MGSC.RaidMetadata raidMetadata,
			class MGSC.CombatLog combatLog
		) cil managed 
	{
		.custom instance void MGSC.GameLoopUpdate::.ctor(valuetype MGSC.GameLoopGroup, valuetype MGSC.GameLoopExecuteOrder, string) = (
			01 00 01 00 00 00 02 00 00 00 17 48 69 74 52 65
			73 6f 6c 76 65 53 79 73 74 65 6d 2e 55 70 64 61
			74 65 00 00
		)
		// Method begins at RVA 0x7ced8
		// Header size: 12
		// Code size: 168 (0xa8)
		.maxstack 1

		// _cacheEntities = entities;
		IL_0000: ldarg.0
		IL_0001: stsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
		// _cacheCreatures = creatures;
		IL_0006: ldarg.1
		IL_0007: stsfld class MGSC.Creatures MGSC.DamageSystem::_cacheCreatures
		// _cacheMapGrid = mapGrid;
		IL_000c: ldarg.2
		IL_000d: stsfld class MGSC.MapGrid MGSC.DamageSystem::_cacheMapGrid
		// _cacheMapController = mapController;
		IL_0012: ldarg.3
		IL_0013: stsfld class MGSC.MapController MGSC.DamageSystem::_cacheMapController
		// _cacheFireController = fireController;
		IL_0018: ldarg.s fireController
		IL_001a: stsfld class MGSC.FireController MGSC.DamageSystem::_cacheFireController
		// _cacheMapRenderer = mapRenderer;
		IL_001f: ldarg.s mapRenderer
		IL_0021: stsfld class MGSC.MapRenderer MGSC.DamageSystem::_cacheMapRenderer
		// _cacheMapObstacles = mapObstacles;
		IL_0026: ldarg.s mapObstacles
		IL_0028: stsfld class MGSC.MapObstacles MGSC.DamageSystem::_cacheMapObstacles
		// _cacheItemsOnFloor = itemsOnFloor;
		IL_002d: ldarg.s itemsOnFloor
		IL_002f: stsfld class MGSC.ItemsOnFloor MGSC.DamageSystem::_cacheItemsOnFloor
		// _cacheVisibilities = visibilities;
		IL_0034: ldarg.s visibilities
		IL_0036: stsfld class MGSC.Visibilities MGSC.DamageSystem::_cacheVisibilities
		// _cacheMapEntities = mapEntities;
		IL_003b: ldarg.s mapEntities
		IL_003d: stsfld class MGSC.MapEntities MGSC.DamageSystem::_cacheMapEntities
		// _cacheRaidMetadata = raidMetadata;
		IL_0042: ldarg.s raidMetadata
		IL_0044: stsfld class MGSC.RaidMetadata MGSC.DamageSystem::_cacheRaidMetadata
		// _cacheCombatLog = combatLog;
		IL_0049: ldarg.s combatLog
		IL_004b: stsfld class MGSC.CombatLog MGSC.DamageSystem::_cacheCombatLog
		// ProceedCreatureDamage();
		IL_0050: call void MGSC.DamageSystem::ProceedCreatureDamage()
		// ProceedObstacleDamage();
		IL_0055: call void MGSC.DamageSystem::ProceedObstacleDamage()
		// ProceedWallDamage();
		IL_005a: call void MGSC.DamageSystem::ProceedWallDamage()
		// _cacheEntities = null;
		IL_005f: ldnull
		IL_0060: stsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
		// _cacheCreatures = null;
		IL_0065: ldnull
		IL_0066: stsfld class MGSC.Creatures MGSC.DamageSystem::_cacheCreatures
		// _cacheMapGrid = null;
		IL_006b: ldnull
		IL_006c: stsfld class MGSC.MapGrid MGSC.DamageSystem::_cacheMapGrid
		// _cacheMapController = null;
		IL_0071: ldnull
		IL_0072: stsfld class MGSC.MapController MGSC.DamageSystem::_cacheMapController
		// _cacheFireController = null;
		IL_0077: ldnull
		IL_0078: stsfld class MGSC.FireController MGSC.DamageSystem::_cacheFireController
		// _cacheMapRenderer = null;
		IL_007d: ldnull
		IL_007e: stsfld class MGSC.MapRenderer MGSC.DamageSystem::_cacheMapRenderer
		// _cacheMapObstacles = null;
		IL_0083: ldnull
		IL_0084: stsfld class MGSC.MapObstacles MGSC.DamageSystem::_cacheMapObstacles
		// _cacheItemsOnFloor = null;
		IL_0089: ldnull
		IL_008a: stsfld class MGSC.ItemsOnFloor MGSC.DamageSystem::_cacheItemsOnFloor
		// _cacheVisibilities = null;
		IL_008f: ldnull
		IL_0090: stsfld class MGSC.Visibilities MGSC.DamageSystem::_cacheVisibilities
		// _cacheMapEntities = null;
		IL_0095: ldnull
		IL_0096: stsfld class MGSC.MapEntities MGSC.DamageSystem::_cacheMapEntities
		// _cacheRaidMetadata = null;
		IL_009b: ldnull
		IL_009c: stsfld class MGSC.RaidMetadata MGSC.DamageSystem::_cacheRaidMetadata
		// _cacheCombatLog = null;
		IL_00a1: ldnull
		IL_00a2: stsfld class MGSC.CombatLog MGSC.DamageSystem::_cacheCombatLog
		// }
		IL_00a7: ret
	} // end of method DamageSystem::Update

	.method private hidebysig static 
		void ProceedCreatureDamage () cil managed 
	{
		// Method begins at RVA 0x7cf8c
		// Header size: 1
		// Code size: 52 (0x34)
		.maxstack 8

		// 	_cacheEntities.Filter().With<DamageRequestCreature>().ForEach(delegate(int e, ref DamageRequest req)
		// 	{
		// 		Creature creature = _cacheCreatures.GetCreature(req.TargetUid);
		// 		if ((object)creature == null)
		// 		{
		// 			_cacheEntities.ScheduleDestroy(e);
		// 		}
		// 		else
		// 		{
		// 			ref ProjectileRuntimeData @ref = ref _cacheEntities.GetRef<ProjectileRuntimeData>(req.ProjEntityId);
		// 			ref Ballistic ref2 = ref _cacheEntities.GetRef<Ballistic>(req.ProjEntityId);
		// 			ref DamageRequestCreature ref3 = ref _cacheEntities.GetRef<DamageRequestCreature>(e);
		// 			DmgInfo dmgInfo = DmgInfo.ToLegacy(@ref.WeaponDamage);
		// 			float num = @ref.CritBonus;
		// 			float num2 = @ref.CritDamageBonus;
		// 			if (creature.CanBeBackstabbed)
		// 			{
		// 				num += @ref.BackstabCritChance;
		// 				num2 += @ref.BackstabCritDamage;
		// 			}
		// 			DamageHitInfo damageHitInfo = CalculateHitInfo(ref2.PassedDistance, @ref.Accuracy, req.Dodge, num, dmgInfo, @ref.OverallDmgMult, @ref.WoundChanceBonus, @ref.EffectiveRangeStarts, @ref.Range, @ref.Falloff, autoCrit: false, autoHit: true, num2, @ref.WoundChanceMult, isMaxHitChance: @ref.IsMaxHitChance, noCrit: @ref.NoCrit);
		// 			damageHitInfo.ampChanceBonus += @ref.WoundChanceBonus;
		// 			damageHitInfo.doAmpOnWound = @ref.DoAmpOnWound;
		// 			damageHitInfo.silenceDmg = @ref.DoSilentDmg;
		// 			damageHitInfo.dangerPosition = ref2.InitialPosition;
		// 			damageHitInfo.weaponArmorPen += @ref.ArmorPen;
		// 			damageHitInfo.statusEffectId = SharedStringIds.Get(@ref.StatusEffectId);
		// 			damageHitInfo.statusEffectDmgMult += @ref.StatusEffectDmgMult;
		// 			damageHitInfo.statusEffectChanceToApplyBonus += @ref.StatusEffectChanceToApplyBonus;
		// 			damageHitInfo.statusEffectDmgModBonus += @ref.StatusEffectDamageModBonus;
		// 			damageHitInfo.statusEffectResistModBonus += @ref.StatusEffectResistModBonus;
		// 			damageHitInfo.woundBonus = @ref.WoundBonus;
		// 			if (!damageHitInfo.wasOutOfRange)
		// 			{
		// 				damageHitInfo.corrosiveModifier = @ref.CorrosiveModifier;
		// 			}
		// 			Creature creature2 = (damageHitInfo.damageDealer = _cacheCreatures.GetCreature(req.OwnerUid));
		// 			bool alive = creature.CreatureData.Health.Alive;
		// 			bool num3 = _cacheMapGrid.GetCell(ref2.InitialPosition, checkBorders: false).isSeen || _cacheMapGrid.GetCell(req.Position, checkBorders: false).isSeen;
		// 			RangeAttackLogEntry entry = null;
		// 			if (num3)
		// 			{
		// 				entry = CombatLogSystem.BeginAddRangeAttackEntry(_cacheRaidMetadata, _cacheCombatLog, @ref.OwnerNameTagId, ref3.TargetNameTagId, @ref.CreatureOwnerAlliance, ref3.CreatureTargetAlliance, @ref.WeaponId);
		// 			}
		// 			InjureResult injureResult = creature.Injure(damageHitInfo, playSounds: true, creature.Creature3dView.Descriptor.PutBlood && @ref.MakeBloodDecals);
		// 			if (num3)
		// 			{
		// 				CombatLogSystem.FinishRangeAttackLogEntry(_cacheCombatLog, entry, damageHitInfo);
		// 			}
		// 			if (creature2 != null)
		// 			{
		// 				if (injureResult.WasAmputation)
		// 				{
		// 					creature2.ActivateAmputationTrigger(victim: false);
		// 				}
		// 				if (creature.CreatureData.Health.Dead && alive)
		// 				{
		// 					creature2.ActivateRangeKillTrigger();
		// 				}
		// 			}
		// 			if (@ref.CreatureOwnerAlliance == ref3.CreatureTargetAlliance)
		// 			{
		// 				_cacheEntities.Add(_cacheEntities.CreateEntity(), new BecomeTraitor
		// 				{
		// 					TraitorUid = req.OwnerUid
		// 				});
		// 			}
		// 			if (!damageHitInfo.wasOutOfRange && !creature.CreatureData.Health.Dead)
		// 			{
		// 				if (@ref.IncendiaryChance > 0f)
		// 				{
		// 					_cacheEntities.Add(_cacheEntities.CreateEntity(), new IgniteTarget
		// 					{
		// 						TargetUid = req.TargetUid,
		// 						IgniteChance = @ref.IncendiaryChance
		// 					});
		// 				}
		// 				if (!creature.IgnoreStun && @ref.AmmoStunChance > 0f)
		// 				{
		// 					damageHitInfo.wasStun = true;
		// 					_cacheEntities.Add(_cacheEntities.CreateEntity(), new StunTarget
		// 					{
		// 						TargetUid = req.TargetUid,
		// 						StunChance = @ref.AmmoStunChance,
		// 						StunDuration = @ref.AmmoStunDuration
		// 					});
		// 				}
		// 				if (!creature.CreatureData.IgnoreThrowback && !creature.CreatureData.EffectsController.HasAnyEffect<WoundEffectThrowbackImmune>() && @ref.AmmoKnockBackChance > 0f && !creature.Creature3dView.ThrowBackInProgress && !WasKnockbackApplied(_cacheEntities, creature.CreatureData.UniqueId))
		// 				{
		// 					_cacheEntities.Add(_cacheEntities.CreateEntity(), new KnockbackInProgress
		// 					{
		// 						TargetUid = creature.CreatureData.UniqueId
		// 					});
		// 					_cacheEntities.Add(_cacheEntities.CreateEntity(), new KnockbackRequest
		// 					{
		// 						SourcePosition = ref2.InitialPosition,
		// 						TargetPosition = creature.CreatureData.Position,
		// 						KnockbackChance = @ref.AmmoKnockBackChance,
		// 						HasExtraKnockback = @ref.HasExtraKnockback,
		// 						IsInstant = !creature.IsSeenByPlayer
		// 					});
		// 				}
		// 			}
		// 			_cacheEntities.ScheduleDestroy(e);
		// 		}
		// 	});
		IL_0000: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
		IL_0005: callvirt instance class MGSC.FilterQuery MGSC.Entities::Filter()
		IL_000a: callvirt instance class MGSC.FilterQuery MGSC.FilterQuery::With<valuetype MGSC.DamageRequestCreature>()
		IL_000f: ldsfld class MGSC.RefEntityAction`1<valuetype MGSC.DamageRequest> MGSC.DamageSystem/'<>c'::'<>9__13_0'
		IL_0014: dup
		IL_0015: brtrue.s IL_002e

		// (no C# code)
		IL_0017: pop
		IL_0018: ldsfld class MGSC.DamageSystem/'<>c' MGSC.DamageSystem/'<>c'::'<>9'
		IL_001d: ldftn instance void MGSC.DamageSystem/'<>c'::'<ProceedCreatureDamage>b__13_0'(int32, valuetype MGSC.DamageRequest&)
		IL_0023: newobj instance void class MGSC.RefEntityAction`1<valuetype MGSC.DamageRequest>::.ctor(object, native int)
		IL_0028: dup
		IL_0029: stsfld class MGSC.RefEntityAction`1<valuetype MGSC.DamageRequest> MGSC.DamageSystem/'<>c'::'<>9__13_0'

		// }
		IL_002e: callvirt instance void MGSC.FilterQuery::ForEach<valuetype MGSC.DamageRequest>(class MGSC.RefEntityAction`1<!!0>)
		IL_0033: ret
	} // end of method DamageSystem::ProceedCreatureDamage

	.method private hidebysig static 
		void ProceedObstacleDamage () cil managed 
	{
		// Method begins at RVA 0x7cfc1
		// Header size: 1
		// Code size: 52 (0x34)
		.maxstack 8

		// 	_cacheEntities.Filter().With<DamageRequestObstacle>().ForEach(delegate(int e, ref DamageRequest req)
		// 	{
		// 		MapObstacle mapObstacle = _cacheMapObstacles.Get(req.TargetObstacleUid);
		// 		if (mapObstacle == null)
		// 		{
		// 			_cacheEntities.ScheduleDestroy(e);
		// 		}
		// 		else
		// 		{
		// 			ref ProjectileRuntimeData @ref = ref _cacheEntities.GetRef<ProjectileRuntimeData>(req.ProjEntityId);
		// 			ref Ballistic ref2 = ref _cacheEntities.GetRef<Ballistic>(req.ProjEntityId);
		// 			DamageHitInfo dmgHit = new DamageHitInfo(0, @ref.OverallDmgMult, DmgInfo.ToLegacy(@ref.WeaponDamage), @ref.Accuracy, @ref.CritBonus, @ref.EffectiveRangeStarts, @ref.Range, @ref.Falloff);
		// 			ApplyObstacleDamage(mapObstacle, ref2.InitialPosition, dmgHit, @ref.Speed);
		// 			_cacheEntities.ScheduleDestroy(e);
		// 		}
		// 	});
		IL_0000: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
		IL_0005: callvirt instance class MGSC.FilterQuery MGSC.Entities::Filter()
		IL_000a: callvirt instance class MGSC.FilterQuery MGSC.FilterQuery::With<valuetype MGSC.DamageRequestObstacle>()
		IL_000f: ldsfld class MGSC.RefEntityAction`1<valuetype MGSC.DamageRequest> MGSC.DamageSystem/'<>c'::'<>9__14_0'
		IL_0014: dup
		IL_0015: brtrue.s IL_002e

		// (no C# code)
		IL_0017: pop
		IL_0018: ldsfld class MGSC.DamageSystem/'<>c' MGSC.DamageSystem/'<>c'::'<>9'
		IL_001d: ldftn instance void MGSC.DamageSystem/'<>c'::'<ProceedObstacleDamage>b__14_0'(int32, valuetype MGSC.DamageRequest&)
		IL_0023: newobj instance void class MGSC.RefEntityAction`1<valuetype MGSC.DamageRequest>::.ctor(object, native int)
		IL_0028: dup
		IL_0029: stsfld class MGSC.RefEntityAction`1<valuetype MGSC.DamageRequest> MGSC.DamageSystem/'<>c'::'<>9__14_0'

		// }
		IL_002e: callvirt instance void MGSC.FilterQuery::ForEach<valuetype MGSC.DamageRequest>(class MGSC.RefEntityAction`1<!!0>)
		IL_0033: ret
	} // end of method DamageSystem::ProceedObstacleDamage

	.method private hidebysig static 
		void ProceedWallDamage () cil managed 
	{
		// Method begins at RVA 0x7cff6
		// Header size: 1
		// Code size: 52 (0x34)
		.maxstack 8

		// 	_cacheEntities.Filter().With<DamageRequestWall>().ForEach(delegate(int e, ref DamageRequest req)
		// 	{
		// 		MapCell cell = _cacheMapGrid.GetCell(req.Position);
		// 		if (cell == null || cell.IsFloorSurfaceType)
		// 		{
		// 			_cacheEntities.ScheduleDestroy(e);
		// 		}
		// 		else
		// 		{
		// 			ref ProjectileRuntimeData @ref = ref _cacheEntities.GetRef<ProjectileRuntimeData>(req.ProjEntityId);
		// 			ref Ballistic ref2 = ref _cacheEntities.GetRef<Ballistic>(req.ProjEntityId);
		// 			DmgInfo dmgInfo = DmgInfo.ToLegacy(@ref.WeaponDamage);
		// 			DamageHitInfo originalDmgHit = new DamageHitInfo(0, @ref.OverallDmgMult, dmgInfo, @ref.Accuracy, @ref.CritBonus, @ref.EffectiveRangeStarts, @ref.Range, @ref.Falloff);
		// 			FirearmSystem.ProcessGunshotOnWall(_cacheMapController, _cacheFireController, _cacheMapRenderer, _cacheMapObstacles, _cacheCreatures, _cacheItemsOnFloor, ref2.InitialPosition, _cacheMapGrid, _cacheVisibilities, _cacheMapEntities, originalDmgHit, cell);
		// 			_cacheEntities.ScheduleDestroy(e);
		// 		}
		// 	});
		IL_0000: ldsfld class MGSC.Entities MGSC.DamageSystem::_cacheEntities
		IL_0005: callvirt instance class MGSC.FilterQuery MGSC.Entities::Filter()
		IL_000a: callvirt instance class MGSC.FilterQuery MGSC.FilterQuery::With<valuetype MGSC.DamageRequestWall>()
		IL_000f: ldsfld class MGSC.RefEntityAction`1<valuetype MGSC.DamageRequest> MGSC.DamageSystem/'<>c'::'<>9__15_0'
		IL_0014: dup
		IL_0015: brtrue.s IL_002e

		// (no C# code)
		IL_0017: pop
		IL_0018: ldsfld class MGSC.DamageSystem/'<>c' MGSC.DamageSystem/'<>c'::'<>9'
		IL_001d: ldftn instance void MGSC.DamageSystem/'<>c'::'<ProceedWallDamage>b__15_0'(int32, valuetype MGSC.DamageRequest&)
		IL_0023: newobj instance void class MGSC.RefEntityAction`1<valuetype MGSC.DamageRequest>::.ctor(object, native int)
		IL_0028: dup
		IL_0029: stsfld class MGSC.RefEntityAction`1<valuetype MGSC.DamageRequest> MGSC.DamageSystem/'<>c'::'<>9__15_0'

		// }
		IL_002e: callvirt instance void MGSC.FilterQuery::ForEach<valuetype MGSC.DamageRequest>(class MGSC.RefEntityAction`1<!!0>)
		IL_0033: ret
	} // end of method DamageSystem::ProceedWallDamage

	.method public hidebysig static 
		int32 CalculateDamage (
			int32 incomeDamage,
			int32 resistance,
			[opt] float32 dmgModifier,
			[opt] float32 resModifier,
			[opt] float32 weaponArmorPen
		) cil managed 
	{
		.param [3] = float32(1)
		.param [4] = float32(1)
		.param [5] = float32(0.0)
		// Method begins at RVA 0x7d02c
		// Header size: 12
		// Code size: 77 (0x4d)
		.maxstack 3
		.locals init (
			[0] float32,
			[1] float32,
			[2] float32,
			[3] float32
		)

		// float num = (float)resistance * (resModifier - weaponArmorPen);
		IL_0000: ldarg.1
		IL_0001: conv.r4
		IL_0002: ldarg.3
		IL_0003: ldarg.s weaponArmorPen
		IL_0005: sub
		IL_0006: mul
		IL_0007: stloc.0
		// float num2 = Mathf.Pow(Data.Global.ExponentCoef, (0f - Data.Global.CurveSmoothingCoef) * num);
		IL_0008: call class MGSC.GlobalSettings MGSC.Data::get_Global()
		IL_000d: callvirt instance float32 MGSC.GlobalSettings::get_ExponentCoef()
		IL_0012: call class MGSC.GlobalSettings MGSC.Data::get_Global()
		IL_0017: callvirt instance float32 MGSC.GlobalSettings::get_CurveSmoothingCoef()
		IL_001c: neg
		IL_001d: ldloc.0
		IL_001e: mul
		IL_001f: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Pow(float32, float32)
		IL_0024: stloc.1
		// float num3 = (float)incomeDamage * Mathf.Abs(1f - num2);
		IL_0025: ldarg.0
		IL_0026: conv.r4
		IL_0027: ldc.r4 1
		IL_002c: ldloc.1
		IL_002d: sub
		IL_002e: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Abs(float32)
		IL_0033: mul
		IL_0034: stloc.2
		// float num4 = (float)incomeDamage - num3;
		IL_0035: ldarg.0
		IL_0036: conv.r4
		IL_0037: ldloc.2
		IL_0038: sub
		IL_0039: stloc.3
		// return Mathf.RoundToInt(Mathf.Max(1f, dmgModifier * num4));
		IL_003a: ldc.r4 1
		IL_003f: ldarg.2
		IL_0040: ldloc.3
		IL_0041: mul
		IL_0042: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Max(float32, float32)
		IL_0047: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::RoundToInt(float32)
		IL_004c: ret
	} // end of method DamageSystem::CalculateDamage

	.method public hidebysig static 
		int32 CalculateMinimalResist (
			class MGSC.Creature creature,
			class MGSC.DamageTypeRecord 'record'
		) cil managed 
	{
		// Method begins at RVA 0x7d088
		// Header size: 12
		// Code size: 96 (0x60)
		.maxstack 2
		.locals init (
			[0] int32,
			[1] valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<string>,
			[2] string,
			[3] int32
		)

		// int num = int.MaxValue;
		IL_0000: ldc.i4 2147483647
		IL_0005: stloc.0
		// foreach (string resistType in record.ResistTypes)
		IL_0006: ldarg.1
		IL_0007: callvirt instance class [mscorlib]System.Collections.Generic.List`1<string> MGSC.DamageTypeRecord::get_ResistTypes()
		IL_000c: callvirt instance valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<!0> class [mscorlib]System.Collections.Generic.List`1<string>::GetEnumerator()
		IL_0011: stloc.1
		.try
		{
			// foreach (string resistType in record.ResistTypes)
			IL_0012: br.s IL_0036
			// loop start (head: IL_0036)
				IL_0014: ldloca.s 1
				IL_0016: call instance !0 valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<string>::get_Current()
				IL_001b: stloc.2
				// int b = Mathf.RoundToInt(creature.CreatureData.GetResist(resistType));
				IL_001c: ldarg.0
				IL_001d: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
				IL_0022: ldloc.2
				IL_0023: callvirt instance float32 MGSC.CreatureData::GetResist(string)
				IL_0028: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::RoundToInt(float32)
				IL_002d: stloc.3
				// num = Mathf.Min(num, b);
				IL_002e: ldloc.0
				IL_002f: ldloc.3
				IL_0030: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::Min(int32, int32)
				IL_0035: stloc.0

				// foreach (string resistType in record.ResistTypes)
				IL_0036: ldloca.s 1
				IL_0038: call instance bool valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<string>::MoveNext()
				IL_003d: brtrue.s IL_0014
			// end loop

			// (no C# code)
			IL_003f: leave.s IL_004f
		} // end .try
		finally
		{
			IL_0041: ldloca.s 1
			IL_0043: constrained. valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<string>
			IL_0049: callvirt instance void [mscorlib]System.IDisposable::Dispose()
			// if (record.ResistTypes.Count == 0)
			IL_004e: endfinally
		} // end handler

		IL_004f: ldarg.1
		IL_0050: callvirt instance class [mscorlib]System.Collections.Generic.List`1<string> MGSC.DamageTypeRecord::get_ResistTypes()
		IL_0055: callvirt instance int32 class [mscorlib]System.Collections.Generic.List`1<string>::get_Count()
		IL_005a: brtrue.s IL_005e

		// num = 0;
		IL_005c: ldc.i4.0
		IL_005d: stloc.0

		// return num;
		IL_005e: ldloc.0
		IL_005f: ret
	} // end of method DamageSystem::CalculateMinimalResist

	.method public hidebysig static 
		float32 CalculatePercentResist (
			float32 resist
		) cil managed 
	{
		// Method begins at RVA 0x7d104
		// Header size: 1
		// Code size: 40 (0x28)
		.maxstack 8

		// return Mathf.Abs(1f - Mathf.Pow(Data.Global.ExponentCoef, (0f - Data.Global.CurveSmoothingCoef) * resist));
		IL_0000: ldc.r4 1
		IL_0005: call class MGSC.GlobalSettings MGSC.Data::get_Global()
		IL_000a: callvirt instance float32 MGSC.GlobalSettings::get_ExponentCoef()
		IL_000f: call class MGSC.GlobalSettings MGSC.Data::get_Global()
		IL_0014: callvirt instance float32 MGSC.GlobalSettings::get_CurveSmoothingCoef()
		IL_0019: neg
		IL_001a: ldarg.0
		IL_001b: mul
		IL_001c: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Pow(float32, float32)
		IL_0021: sub
		IL_0022: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Abs(float32)
		IL_0027: ret
	} // end of method DamageSystem::CalculatePercentResist

	.method public hidebysig static 
		class MGSC.DamageHitInfo CalculateHitInfo (
			int32 distance,
			float32 baseAccuracy,
			float32 baseDodge,
			float32 critChanceBonus,
			valuetype MGSC.DmgInfo damage,
			float32 overallDmgMult,
			float32 woundBaseChance,
			[opt] int32 rangeBegins,
			[opt] int32 range,
			[opt] float32 falloff,
			[opt] bool autoCrit,
			[opt] bool autoHit,
			[opt] float32 critDamageBonus,
			[opt] float32 woundChanceMult,
			[opt] bool noCrit,
			[opt] bool isMaxHitChance
		) cil managed 
	{
		.param [8] = int32(0)
		.param [9] = int32(1)
		.param [10] = float32(0.0)
		.param [11] = bool(false)
		.param [12] = bool(false)
		.param [13] = float32(0.0)
		.param [14] = float32(0.0)
		.param [15] = bool(false)
		.param [16] = bool(false)
		// Method begins at RVA 0x7d130
		// Header size: 12
		// Code size: 196 (0xc4)
		.maxstack 12
		.locals init (
			[0] float32,
			[1] float32,
			[2] float32,
			[3] float32,
			[4] float32,
			[5] float32,
			[6] float32,
			[7] float32,
			[8] float32,
			[9] float32
		)

		// float minHitChance = Data.Global.MinHitChance;
		IL_0000: call class MGSC.GlobalSettings MGSC.Data::get_Global()
		IL_0005: callvirt instance float32 MGSC.GlobalSettings::get_MinHitChance()
		IL_000a: stloc.0
		// float capAccuracy = Data.Global.CapAccuracy;
		IL_000b: call class MGSC.GlobalSettings MGSC.Data::get_Global()
		IL_0010: callvirt instance float32 MGSC.GlobalSettings::get_CapAccuracy()
		IL_0015: stloc.1
		// float capDodge = Data.Global.CapDodge;
		IL_0016: call class MGSC.GlobalSettings MGSC.Data::get_Global()
		IL_001b: callvirt instance float32 MGSC.GlobalSettings::get_CapDodge()
		IL_0020: stloc.2
		// float overcapCritModifier = Data.Global.OvercapCritModifier;
		IL_0021: call class MGSC.GlobalSettings MGSC.Data::get_Global()
		IL_0026: callvirt instance float32 MGSC.GlobalSettings::get_OvercapCritModifier()
		IL_002b: stloc.3
		// float value = baseAccuracy - baseDodge;
		IL_002c: ldarg.1
		IL_002d: ldarg.2
		IL_002e: sub
		IL_002f: stloc.s 4
		// float accuracy = (isMaxHitChance ? capAccuracy : Mathf.Clamp(value, minHitChance, capAccuracy));
		IL_0031: ldarg.s isMaxHitChance
		IL_0033: brtrue.s IL_0040

		IL_0035: ldloc.s 4
		IL_0037: ldloc.0
		IL_0038: ldloc.1
		IL_0039: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Clamp(float32, float32, float32)
		IL_003e: br.s IL_0041

		// float num = Mathf.Max(0f, baseAccuracy - capAccuracy);
		IL_0040: ldloc.1

		IL_0041: stloc.s 5
		IL_0043: ldc.r4 0.0
		IL_0048: ldarg.1
		IL_0049: ldloc.1
		IL_004a: sub
		IL_004b: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Max(float32, float32)
		IL_0050: stloc.s 6
		// float num2 = Mathf.Max(0f, baseDodge - capDodge);
		IL_0052: ldc.r4 0.0
		IL_0057: ldarg.2
		IL_0058: ldloc.2
		IL_0059: sub
		IL_005a: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Max(float32, float32)
		IL_005f: stloc.s 7
		// float value2 = damage.critChance + critChanceBonus + num * overcapCritModifier;
		IL_0061: ldarg.s damage
		IL_0063: ldfld float32 MGSC.DmgInfo::critChance
		IL_0068: ldarg.3
		IL_0069: add
		IL_006a: ldloc.s 6
		IL_006c: ldloc.3
		IL_006d: mul
		IL_006e: add
		IL_006f: stloc.s 8
		// value2 = Mathf.Clamp(value2, 0f, 1f);
		IL_0071: ldloc.s 8
		IL_0073: ldc.r4 0.0
		IL_0078: ldc.r4 1
		IL_007d: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Clamp(float32, float32, float32)
		IL_0082: stloc.s 8
		// float woundChanceBonus = Mathf.Max(0f, woundBaseChance - num2 * overcapCritModifier);
		IL_0084: ldc.r4 0.0
		IL_0089: ldarg.s woundBaseChance
		IL_008b: ldloc.s 7
		IL_008d: ldloc.3
		IL_008e: mul
		IL_008f: sub
		IL_0090: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Max(float32, float32)
		IL_0095: stloc.s 9
		// 	return new DamageHitInfo(distance, overallDmgMult, damage, accuracy, value2, rangeBegins, range, falloff, autoCrit, autoHit, critDamageBonus, noCrit)
		// 	{
		// 		woundChanceBonus = woundChanceBonus,
		// 		woundChanceMult = woundChanceMult
		// 	};
		IL_0097: ldarg.0
		IL_0098: ldarg.s overallDmgMult
		IL_009a: ldarg.s damage
		IL_009c: ldloc.s 5
		IL_009e: ldloc.s 8
		IL_00a0: ldarg.s rangeBegins
		IL_00a2: ldarg.s range
		IL_00a4: ldarg.s falloff
		IL_00a6: ldarg.s autoCrit
		IL_00a8: ldarg.s autoHit
		IL_00aa: ldarg.s critDamageBonus
		IL_00ac: ldarg.s noCrit
		IL_00ae: newobj instance void MGSC.DamageHitInfo::.ctor(int32, float32, valuetype MGSC.DmgInfo, float32, float32, int32, int32, float32, bool, bool, float32, bool)
		IL_00b3: dup
		IL_00b4: ldloc.s 9
		IL_00b6: stfld float32 MGSC.DamageHitInfo::woundChanceBonus
		IL_00bb: dup
		IL_00bc: ldarg.s woundChanceMult
		IL_00be: stfld float32 MGSC.DamageHitInfo::woundChanceMult
		IL_00c3: ret
	} // end of method DamageSystem::CalculateHitInfo

	.method public hidebysig static 
		string GetDamageType (
			class MGSC.BasePickupItem weapon
		) cil managed 
	{
		// Method begins at RVA 0x7d200
		// Header size: 1
		// Code size: 28 (0x1c)
		.maxstack 8

		// return Data.Items.GetSimpleRecord<AmmoRecord>(weapon.Record<WeaponRecord>().DefaultAmmoId).DmgType;
		IL_0000: call class MGSC.ItemsCollection MGSC.Data::get_Items()
		IL_0005: ldarg.0
		IL_0006: callvirt instance !!0 MGSC.BasePickupItem::Record<class MGSC.WeaponRecord>()
		IL_000b: callvirt instance string MGSC.WeaponRecord::get_DefaultAmmoId()
		IL_0010: ldc.i4.1
		IL_0011: callvirt instance !!0 MGSC.ItemsCollection::GetSimpleRecord<class MGSC.AmmoRecord>(string, bool)
		IL_0016: callvirt instance string MGSC.AmmoRecord::get_DmgType()
		IL_001b: ret
	} // end of method DamageSystem::GetDamageType

	.method public hidebysig static 
		void SumResistSheets (
			class [mscorlib]System.Collections.Generic.List`1<valuetype MGSC.DmgResist> source,
			class [mscorlib]System.Collections.Generic.List`1<valuetype MGSC.DmgResist> 'add'
		) cil managed 
	{
		// Method begins at RVA 0x7d220
		// Header size: 12
		// Code size: 147 (0x93)
		.maxstack 3
		.locals init (
			[0] valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<valuetype MGSC.DmgResist>,
			[1] valuetype MGSC.DmgResist,
			[2] int32,
			[3] valuetype MGSC.DmgResist
		)

		// foreach (DmgResist item in add)
		IL_0000: ldarg.1
		IL_0001: callvirt instance valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<!0> class [mscorlib]System.Collections.Generic.List`1<valuetype MGSC.DmgResist>::GetEnumerator()
		IL_0006: stloc.0
		.try
		{
			// foreach (DmgResist item in add)
			IL_0007: br.s IL_0079
			// loop start (head: IL_0079)
				IL_0009: ldloca.s 0
				IL_000b: call instance !0 valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<valuetype MGSC.DmgResist>::get_Current()
				IL_0010: stloc.1
				// for (int num = source.Count - 1; num >= 0; num--)
				IL_0011: ldarg.0
				IL_0012: callvirt instance int32 class [mscorlib]System.Collections.Generic.List`1<valuetype MGSC.DmgResist>::get_Count()
				IL_0017: ldc.i4.1
				IL_0018: sub
				IL_0019: stloc.2
				// if (source[num].damage == item.damage)
				IL_001a: br.s IL_0075
				// loop start (head: IL_0075)
					IL_001c: ldarg.0
					IL_001d: ldloc.2
					IL_001e: callvirt instance !0 class [mscorlib]System.Collections.Generic.List`1<valuetype MGSC.DmgResist>::get_Item(int32)
					IL_0023: ldfld string MGSC.DmgResist::damage
					IL_0028: ldloc.1
					IL_0029: ldfld string MGSC.DmgResist::damage
					IL_002e: call bool [mscorlib]System.String::op_Equality(string, string)
					IL_0033: brfalse.s IL_0071

					// DmgResist value = source[num];
					IL_0035: ldarg.0
					IL_0036: ldloc.2
					IL_0037: callvirt instance !0 class [mscorlib]System.Collections.Generic.List`1<valuetype MGSC.DmgResist>::get_Item(int32)
					IL_003c: stloc.3
					// value.resistPercent += item.resistPercent;
					IL_003d: ldloca.s 3
					IL_003f: ldflda float32 MGSC.DmgResist::resistPercent
					IL_0044: dup
					IL_0045: ldind.r4
					IL_0046: ldloc.1
					IL_0047: ldfld float32 MGSC.DmgResist::resistPercent
					IL_004c: add
					IL_004d: stind.r4
					// if (value.resistPercent < 0f)
					IL_004e: ldloc.3
					IL_004f: ldfld float32 MGSC.DmgResist::resistPercent
					IL_0054: ldc.r4 0.0
					IL_0059: bge.un.s IL_0067

					// value.resistPercent = 0f;
					IL_005b: ldloca.s 3
					IL_005d: ldc.r4 0.0
					IL_0062: stfld float32 MGSC.DmgResist::resistPercent

					// source[num] = value;
					IL_0067: ldarg.0
					IL_0068: ldloc.2
					IL_0069: ldloc.3
					IL_006a: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<valuetype MGSC.DmgResist>::set_Item(int32, !0)
					// break;
					IL_006f: br.s IL_0079

					// for (int num = source.Count - 1; num >= 0; num--)
					IL_0071: ldloc.2
					IL_0072: ldc.i4.1
					IL_0073: sub
					IL_0074: stloc.2

					// for (int num = source.Count - 1; num >= 0; num--)
					IL_0075: ldloc.2
					IL_0076: ldc.i4.0
					IL_0077: bge.s IL_001c
				// end loop

				// foreach (DmgResist item in add)
				IL_0079: ldloca.s 0
				IL_007b: call instance bool valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<valuetype MGSC.DmgResist>::MoveNext()
				// (no C# code)
				IL_0080: brtrue.s IL_0009
			// end loop

			IL_0082: leave.s IL_0092
		} // end .try
		finally
		{
			IL_0084: ldloca.s 0
			IL_0086: constrained. valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<valuetype MGSC.DmgResist>
			IL_008c: callvirt instance void [mscorlib]System.IDisposable::Dispose()
			IL_0091: endfinally
		} // end handler

		IL_0092: ret
	} // end of method DamageSystem::SumResistSheets

	.method public hidebysig static 
		float32 GetProgressionDodge (
			class MGSC.Creature enemy,
			class MGSC.Statistics statistics,
			class MGSC.Difficulty difficulty
		) cil managed 
	{
		// Method begins at RVA 0x7d2d0
		// Header size: 12
		// Code size: 44 (0x2c)
		.maxstack 4
		.locals init (
			[0] float32
		)

		// float num = enemy.CreatureData.GetDodge();
		IL_0000: ldarg.0
		IL_0001: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
		IL_0006: callvirt instance float32 MGSC.CreatureData::GetDodge()
		IL_000b: stloc.0
		// if (enemy is Player)
		IL_000c: ldarg.0
		IL_000d: isinst MGSC.Player
		IL_0012: brfalse.s IL_002a

		// num += Data.ProgressionDifficulty.GetPlayerDodgeBonus(statistics.GetStatistic(StatisticType.TotalMissionsComplete), difficulty);
		IL_0014: ldloc.0
		IL_0015: call class [mscorlib]System.Collections.Generic.List`1<class MGSC.ProgressionDifficultyRecord> MGSC.Data::get_ProgressionDifficulty()
		IL_001a: ldarg.1
		IL_001b: ldc.i4.s 9
		IL_001d: callvirt instance int32 MGSC.Statistics::GetStatistic(valuetype MGSC.StatisticType)
		IL_0022: ldarg.2
		IL_0023: call float32 MGSC.ListExtensions::GetPlayerDodgeBonus(class [mscorlib]System.Collections.Generic.List`1<class MGSC.ProgressionDifficultyRecord>, int32, class MGSC.Difficulty)
		IL_0028: add
		IL_0029: stloc.0

		// return num;
		IL_002a: ldloc.0
		IL_002b: ret
	} // end of method DamageSystem::GetProgressionDodge

	.method private hidebysig static 
		void ApplyObstacleDamage (
			class MGSC.MapObstacle obstacle,
			valuetype MGSC.CellPosition shooterPos,
			class MGSC.DamageHitInfo dmgHit,
			float32 bulletSpeed
		) cil managed 
	{
		// Method begins at RVA 0x7d308
		// Header size: 12
		// Code size: 166 (0xa6)
		.maxstack 5
		.locals init (
			[0] valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
			[1] float32,
			[2] float32,
			[3] class MGSC.LightDestroyble,
			[4] bool
		)

		// Vector3 a = _cacheMapRenderer.ConvertPosToWorld(shooterPos, Vector2.zero);
		IL_0000: ldsfld class MGSC.MapRenderer MGSC.DamageSystem::_cacheMapRenderer
		IL_0005: ldarg.1
		IL_0006: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector2 [UnityEngine.CoreModule]UnityEngine.Vector2::get_zero()
		IL_000b: callvirt instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 MGSC.MapRenderer::ConvertPosToWorld(valuetype MGSC.CellPosition, valuetype [UnityEngine.CoreModule]UnityEngine.Vector2)
		// Vector3 b = _cacheMapRenderer.ConvertPosToWorld(obstacle.pos, Vector2.zero);
		IL_0010: ldsfld class MGSC.MapRenderer MGSC.DamageSystem::_cacheMapRenderer
		IL_0015: ldarg.0
		IL_0016: ldfld valuetype MGSC.CellPosition MGSC.MapObstacle::pos
		IL_001b: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector2 [UnityEngine.CoreModule]UnityEngine.Vector2::get_zero()
		IL_0020: callvirt instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 MGSC.MapRenderer::ConvertPosToWorld(valuetype MGSC.CellPosition, valuetype [UnityEngine.CoreModule]UnityEngine.Vector2)
		IL_0025: stloc.0
		// float num = Vector3.Distance(a, b);
		IL_0026: ldloc.0
		IL_0027: call float32 [UnityEngine.CoreModule]UnityEngine.Vector3::Distance(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3, valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
		IL_002c: stloc.1
		// float delay = ((bulletSpeed == 0f) ? 0f : (num / bulletSpeed * SingletonMonoBehaviour<GameSettings>.Instance.AnimationsBulletGlobalTimeScaleMult()));
		IL_002d: ldarg.3
		IL_002e: ldc.r4 0.0
		IL_0033: beq.s IL_0045

		IL_0035: ldloc.1
		IL_0036: ldarg.3
		IL_0037: div
		IL_0038: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.GameSettings>::get_Instance()
		IL_003d: callvirt instance float32 MGSC.GameSettings::AnimationsBulletGlobalTimeScaleMult()
		IL_0042: mul
		IL_0043: br.s IL_004a

		// LightDestroyble component = obstacle.GetComponent<LightDestroyble>();
		IL_0045: ldc.r4 0.0

		IL_004a: stloc.2
		IL_004b: ldarg.0
		IL_004c: callvirt instance !!0 MGSC.MapObstacle::GetComponent<class MGSC.LightDestroyble>()
		IL_0051: stloc.3
		// if (component != null)
		IL_0052: ldloc.3
		IL_0053: ldnull
		IL_0054: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
		IL_0059: brfalse.s IL_0062

		// component.DoDamage();
		IL_005b: ldloc.3
		IL_005c: callvirt instance void MGSC.LightDestroyble::DoDamage()
		// }
		IL_0061: ret

		// dmgHit.ProcessResist(obstacle);
		IL_0062: ldarg.2
		IL_0063: ldarg.0
		IL_0064: callvirt instance void MGSC.DamageHitInfo::ProcessResist(class MGSC.IDestroyable)
		// if (obstacle.Door != null)
		IL_0069: ldarg.0
		IL_006a: callvirt instance class MGSC.Door MGSC.MapObstacle::get_Door()
		IL_006f: ldnull
		IL_0070: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
		IL_0075: brfalse.s IL_008b

		// obstacle.Door.ReceiveDamage((short)dmgHit.finalDmg);
		IL_0077: ldarg.0
		IL_0078: callvirt instance class MGSC.Door MGSC.MapObstacle::get_Door()
		IL_007d: ldarg.2
		IL_007e: ldfld int32 MGSC.DamageHitInfo::finalDmg
		IL_0083: conv.i2
		IL_0084: callvirt instance bool MGSC.Door::ReceiveDamage(int16)
		IL_0089: pop
		// obstacle.Injure(dmgHit, out var shouldRemoveDestroyed, shooterPos, delay);
		IL_008a: ret

		IL_008b: ldarg.0
		IL_008c: ldarg.2
		IL_008d: ldloca.s 4
		IL_008f: ldarg.1
		IL_0090: ldloc.2
		IL_0091: callvirt instance void MGSC.MapObstacle::Injure(class MGSC.DamageHitInfo, bool&, valuetype MGSC.CellPosition, float32)
		// if (shouldRemoveDestroyed)
		IL_0096: ldloc.s 4
		IL_0098: brfalse.s IL_00a5

		// _cacheMapObstacles.Remove(obstacle);
		IL_009a: ldsfld class MGSC.MapObstacles MGSC.DamageSystem::_cacheMapObstacles
		IL_009f: ldarg.0
		IL_00a0: callvirt instance void MGSC.MapObstacles::Remove(class MGSC.MapObstacle)

		// (no C# code)
		IL_00a5: ret
	} // end of method DamageSystem::ApplyObstacleDamage

	.method private hidebysig static 
		bool WasKnockbackApplied (
			class MGSC.Entities entities,
			int32 targetUid
		) cil managed 
	{
		// Method begins at RVA 0x7d3bc
		// Header size: 12
		// Code size: 50 (0x32)
		.maxstack 3
		.locals init (
			[0] class MGSC.DamageSystem/'<>c__DisplayClass24_0'
		)

		// {
		IL_0000: newobj instance void MGSC.DamageSystem/'<>c__DisplayClass24_0'::.ctor()
		IL_0005: stloc.0
		// (no C# code)
		IL_0006: ldloc.0
		IL_0007: ldarg.1
		IL_0008: stfld int32 MGSC.DamageSystem/'<>c__DisplayClass24_0'::targetUid
		// bool found = false;
		IL_000d: ldloc.0
		IL_000e: ldc.i4.0
		IL_000f: stfld bool MGSC.DamageSystem/'<>c__DisplayClass24_0'::found
		// 	entities.Filter().ForEach(delegate(int e, ref KnockbackInProgress k)
		// 	{
		// 		if (k.TargetUid == targetUid)
		// 		{
		// 			found = true;
		// 		}
		// 	});
		IL_0014: ldarg.0
		IL_0015: callvirt instance class MGSC.FilterQuery MGSC.Entities::Filter()
		IL_001a: ldloc.0
		IL_001b: ldftn instance void MGSC.DamageSystem/'<>c__DisplayClass24_0'::'<WasKnockbackApplied>b__0'(int32, valuetype MGSC.KnockbackInProgress&)
		IL_0021: newobj instance void class MGSC.RefEntityAction`1<valuetype MGSC.KnockbackInProgress>::.ctor(object, native int)
		// (no C# code)
		IL_0026: callvirt instance void MGSC.FilterQuery::ForEach<valuetype MGSC.KnockbackInProgress>(class MGSC.RefEntityAction`1<!!0>)
		IL_002b: ldloc.0
		// return found;
		IL_002c: ldfld bool MGSC.DamageSystem/'<>c__DisplayClass24_0'::found
		IL_0031: ret
	} // end of method DamageSystem::WasKnockbackApplied

} // end of class MGSC.DamageSystem
