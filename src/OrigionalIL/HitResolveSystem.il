.class public auto ansi abstract sealed beforefieldinit MGSC.HitResolveSystem
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
		.field public static initonly class MGSC.HitResolveSystem/'<>c' '<>9'
		.field public static class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> '<>9__8_0'
		.field public static class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> '<>9__9_0'
		.field public static class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> '<>9__10_0'
		.field public static class MGSC.RefEntityAction`1<valuetype MGSC.ExplosionRequest> '<>9__11_0'
		.field public static class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> '<>9__12_0'
		.field public static class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> '<>9__13_0'
		.field public static class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> '<>9__14_0'
		.field public static class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> '<>9__15_0'

		// Methods
		.method private hidebysig specialname rtspecialname static 
			void .cctor () cil managed 
		{
			// Method begins at RVA 0x13a66a
			// Header size: 1
			// Code size: 11 (0xb)
			.maxstack 8

			// <>9 = new <>c();
			IL_0000: newobj instance void MGSC.HitResolveSystem/'<>c'::.ctor()
			IL_0005: stsfld class MGSC.HitResolveSystem/'<>c' MGSC.HitResolveSystem/'<>c'::'<>9'
			// }
			IL_000a: ret
		} // end of method '<>c'::.cctor

		.method public hidebysig specialname rtspecialname 
			instance void .ctor () cil managed 
		{
			// Method begins at RVA 0x13a676
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
			instance void '<ProcessObstacleAccuracy>b__8_0' (
				int32 entity,
				valuetype MGSC.HitEvent& hitEvent
			) cil managed 
		{
			// Method begins at RVA 0x13a680
			// Header size: 12
			// Code size: 464 (0x1d0)
			.maxstack 3
			.locals init (
				[0] valuetype MGSC.CollisionWithObstacle&,
				[1] class MGSC.MapObstacle,
				[2] class MGSC.ObstacleHealth,
				[3] int32,
				[4] int32,
				[5] class MGSC.Player,
				[6] valuetype MGSC.CellPosition,
				[7] int32,
				[8] int32,
				[9] valuetype MGSC.Door/DoorState
			)

			// if (!_cacheEntities.IsAlive(hitEvent.ProjEntityId))
			IL_0000: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0005: ldarg.2
			IL_0006: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_000b: callvirt instance bool MGSC.Entities::IsAlive(int32)
			IL_0010: brtrue.s IL_001e

			// _cacheEntities.ScheduleDestroy(entity);
			IL_0012: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0017: ldarg.1
			IL_0018: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// }
			IL_001d: ret

			// ref CollisionWithObstacle reference = ref _cacheEntities.GetRef<CollisionWithObstacle>(entity);
			IL_001e: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0023: ldarg.1
			IL_0024: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.CollisionWithObstacle>(int32)
			IL_0029: stloc.0
			// MapObstacle mapObstacle = _cacheMapObstacles.Get(reference.ObstacleUid);
			IL_002a: ldsfld class MGSC.MapObstacles MGSC.HitResolveSystem::_cacheMapObstacles
			IL_002f: ldloc.0
			IL_0030: ldfld int32 MGSC.CollisionWithObstacle::ObstacleUid
			IL_0035: callvirt instance class MGSC.MapObstacle MGSC.MapObstacles::Get(int32)
			IL_003a: stloc.1
			// if (mapObstacle == null)
			IL_003b: ldloc.1
			IL_003c: ldnull
			IL_003d: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0042: brfalse.s IL_0050

			// _cacheEntities.ScheduleDestroy(entity);
			IL_0044: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0049: ldarg.1
			IL_004a: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// if (mapObstacle.Door != null && (mapObstacle.Door.State == Door.DoorState.Opened || mapObstacle.Door.State == Door.DoorState.Remains))
			IL_004f: ret

			IL_0050: ldloc.1
			IL_0051: callvirt instance class MGSC.Door MGSC.MapObstacle::get_Door()
			IL_0056: ldnull
			IL_0057: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_005c: brfalse.s IL_0086

			IL_005e: ldloc.1
			IL_005f: callvirt instance class MGSC.Door MGSC.MapObstacle::get_Door()
			IL_0064: callvirt instance valuetype MGSC.Door/DoorState MGSC.Door::get_State()
			IL_0069: ldc.i4.1
			IL_006a: beq.s IL_007a

			IL_006c: ldloc.1
			IL_006d: callvirt instance class MGSC.Door MGSC.MapObstacle::get_Door()
			IL_0072: callvirt instance valuetype MGSC.Door/DoorState MGSC.Door::get_State()
			IL_0077: ldc.i4.4
			IL_0078: bne.un.s IL_0086

			// _cacheEntities.ScheduleDestroy(entity);
			IL_007a: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_007f: ldarg.1
			IL_0080: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// ObstacleHealth obstacleHealth = mapObstacle.ObstacleHealth;
			IL_0085: ret

			IL_0086: ldloc.1
			IL_0087: callvirt instance class MGSC.ObstacleHealth MGSC.MapObstacle::get_ObstacleHealth()
			IL_008c: stloc.2
			// if (obstacleHealth != null)
			IL_008d: ldloc.2
			IL_008e: ldnull
			IL_008f: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0094: brfalse IL_0158

			// int num = obstacleHealth.HitChanceOnShoot;
			IL_0099: ldloc.2
			IL_009a: callvirt instance int32 MGSC.ObstacleHealth::get_HitChanceOnShoot()
			IL_009f: stloc.3
			// int num2 = obstacleHealth.BlockChance;
			IL_00a0: ldloc.2
			IL_00a1: callvirt instance int32 MGSC.ObstacleHealth::get_BlockChance()
			IL_00a6: stloc.s 4
			// Player player = _cacheCreatures.Player;
			IL_00a8: ldsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
			IL_00ad: ldfld class MGSC.Player MGSC.Creatures::Player
			IL_00b2: stloc.s 5
			// if (player != null && !obstacleHealth.IsDestroyed)
			IL_00b4: ldloc.s 5
			IL_00b6: ldnull
			IL_00b7: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_00bc: brfalse.s IL_0134

			IL_00be: ldloc.2
			IL_00bf: callvirt instance bool MGSC.ObstacleHealth::get_IsDestroyed()
			IL_00c4: brtrue.s IL_0134

			// CellPosition position = mapObstacle.Position;
			IL_00c6: ldloc.1
			IL_00c7: callvirt instance valuetype MGSC.CellPosition MGSC.MapObstacle::get_Position()
			IL_00cc: stloc.s 6
			// CellPosition position2 = player.CreatureData.Position;
			IL_00ce: ldloc.s 5
			IL_00d0: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_00d5: ldfld valuetype MGSC.CellPosition MGSC.CreatureData::Position
			// int num3 = position2.X - position.X;
			IL_00da: dup
			IL_00db: ldfld int32 MGSC.CellPosition::X
			IL_00e0: ldloc.s 6
			IL_00e2: ldfld int32 MGSC.CellPosition::X
			IL_00e7: sub
			IL_00e8: stloc.s 7
			// int num4 = position2.Y - position.Y;
			IL_00ea: ldfld int32 MGSC.CellPosition::Y
			IL_00ef: ldloc.s 6
			IL_00f1: ldfld int32 MGSC.CellPosition::Y
			IL_00f6: sub
			IL_00f7: stloc.s 8
			// if ((num3 | num4) != 0 && Mathf.Abs(num3) <= 1 && Mathf.Abs(num4) <= 1)
			IL_00f9: ldloc.s 7
			IL_00fb: ldloc.s 8
			IL_00fd: or
			IL_00fe: brfalse.s IL_0134

			IL_0100: ldloc.s 7
			IL_0102: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::Abs(int32)
			IL_0107: ldc.i4.1
			IL_0108: bgt.s IL_0134

			IL_010a: ldloc.s 8
			IL_010c: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::Abs(int32)
			IL_0111: ldc.i4.1
			IL_0112: bgt.s IL_0134

			// num += player.CreatureData.CoverHitChanceBonus;
			IL_0114: ldloc.3
			IL_0115: ldloc.s 5
			IL_0117: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_011c: ldfld int32 MGSC.CreatureData::CoverHitChanceBonus
			IL_0121: add
			IL_0122: stloc.3
			// num2 += player.CreatureData.CoverBlockChanceBonus;
			IL_0123: ldloc.s 4
			IL_0125: ldloc.s 5
			IL_0127: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_012c: ldfld int32 MGSC.CreatureData::CoverBlockChanceBonus
			IL_0131: add
			IL_0132: stloc.s 4

			// hitEvent.WasMiss = Random.Range(1, 101) >= num;
			IL_0134: ldarg.2
			IL_0135: ldc.i4.1
			IL_0136: ldc.i4.s 101
			IL_0138: call int32 [UnityEngine.CoreModule]UnityEngine.Random::Range(int32, int32)
			IL_013d: ldloc.3
			IL_013e: clt
			IL_0140: ldc.i4.0
			IL_0141: ceq
			IL_0143: stfld bool MGSC.HitEvent::WasMiss
			// reference.PierceBlock = (float)num2 * 0.01f;
			IL_0148: ldloc.0
			IL_0149: ldloc.s 4
			IL_014b: conv.r4
			IL_014c: ldc.r4 0.01
			IL_0151: mul
			IL_0152: stfld float32 MGSC.CollisionWithObstacle::PierceBlock
			// if (!(mapObstacle.Door != null))
			IL_0157: ret

			IL_0158: ldloc.1
			IL_0159: callvirt instance class MGSC.Door MGSC.MapObstacle::get_Door()
			IL_015e: ldnull
			IL_015f: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0164: brfalse.s IL_01cf

			// hitEvent.WasMiss = false;
			IL_0166: ldarg.2
			IL_0167: ldc.i4.0
			IL_0168: stfld bool MGSC.HitEvent::WasMiss
			// if (mapObstacle.Door.CanBePierced)
			IL_016d: ldloc.1
			IL_016e: callvirt instance class MGSC.Door MGSC.MapObstacle::get_Door()
			IL_0173: ldfld bool MGSC.Door::CanBePierced
			IL_0178: brfalse.s IL_0186

			// reference.PierceBlock = 0f;
			IL_017a: ldloc.0
			IL_017b: ldc.r4 0.0
			IL_0180: stfld float32 MGSC.CollisionWithObstacle::PierceBlock
			// switch (mapObstacle.Door.State)
			IL_0185: ret

			IL_0186: ldloc.1
			IL_0187: callvirt instance class MGSC.Door MGSC.MapObstacle::get_Door()
			IL_018c: callvirt instance valuetype MGSC.Door/DoorState MGSC.Door::get_State()
			IL_0191: stloc.s 9
			// (no C# code)
			IL_0193: ldloc.s 9
			IL_0195: switch (IL_01b8, IL_01c4, IL_01b8, IL_01ac)

			// reference.PierceBlock = 0.5f;
			IL_01aa: br.s IL_01c4

			IL_01ac: ldloc.0
			IL_01ad: ldc.r4 0.5
			IL_01b2: stfld float32 MGSC.CollisionWithObstacle::PierceBlock
			// break;
			IL_01b7: ret

			// reference.PierceBlock = 1f;
			IL_01b8: ldloc.0
			IL_01b9: ldc.r4 1
			IL_01be: stfld float32 MGSC.CollisionWithObstacle::PierceBlock
			// break;
			IL_01c3: ret

			// reference.PierceBlock = 0f;
			IL_01c4: ldloc.0
			IL_01c5: ldc.r4 0.0
			IL_01ca: stfld float32 MGSC.CollisionWithObstacle::PierceBlock

			// break;
			IL_01cf: ret
		} // end of method '<>c'::'<ProcessObstacleAccuracy>b__8_0'

		.method assembly hidebysig 
			instance void '<ProcessCreatureAccuracy>b__9_0' (
				int32 entity,
				valuetype MGSC.HitEvent& hitEvent
			) cil managed 
		{
			// Method begins at RVA 0x13a85c
			// Header size: 12
			// Code size: 399 (0x18f)
			.maxstack 4
			.locals init (
				[0] valuetype MGSC.ProjectileRuntimeData&,
				[1] valuetype MGSC.CollisionWithCreature&,
				[2] class MGSC.Creature,
				[3] float32,
				[4] float32,
				[5] float32,
				[6] class MGSC.Creature,
				[7] valuetype MGSC.SuppressTarget
			)

			// if (!_cacheEntities.IsAlive(hitEvent.ProjEntityId))
			IL_0000: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0005: ldarg.2
			IL_0006: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_000b: callvirt instance bool MGSC.Entities::IsAlive(int32)
			IL_0010: brtrue.s IL_001e

			// _cacheEntities.ScheduleDestroy(entity);
			IL_0012: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0017: ldarg.1
			IL_0018: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// }
			IL_001d: ret

			// ref ProjectileRuntimeData reference = ref _cacheEntities.GetRef<ProjectileRuntimeData>(hitEvent.ProjEntityId);
			IL_001e: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0023: ldarg.2
			IL_0024: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_0029: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.ProjectileRuntimeData>(int32)
			IL_002e: stloc.0
			// ref CollisionWithCreature reference2 = ref _cacheEntities.GetRef<CollisionWithCreature>(entity);
			IL_002f: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0034: ldarg.1
			IL_0035: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.CollisionWithCreature>(int32)
			IL_003a: stloc.1
			// Creature creature = _cacheCreatures.GetCreature(reference2.CreatureUid);
			IL_003b: ldsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
			IL_0040: ldloc.1
			IL_0041: ldfld int32 MGSC.CollisionWithCreature::CreatureUid
			IL_0046: callvirt instance class MGSC.Creature MGSC.Creatures::GetCreature(int32)
			IL_004b: stloc.2
			// if (creature == null)
			IL_004c: ldloc.2
			IL_004d: ldnull
			IL_004e: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0053: brfalse.s IL_0061

			// _cacheEntities.ScheduleDestroy(entity);
			IL_0055: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_005a: ldarg.1
			IL_005b: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// creature.ActivateAttackedTrigger(wasHit: false);
			IL_0060: ret

			IL_0061: ldloc.2
			IL_0062: ldc.i4.0
			IL_0063: callvirt instance void MGSC.Creature::ActivateAttackedTrigger(bool)
			// hitEvent.CreatureTargetAlliance = creature.CreatureData.CreatureAlliance;
			IL_0068: ldarg.2
			IL_0069: ldloc.2
			IL_006a: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_006f: ldfld valuetype MGSC.CreatureAlliance MGSC.CreatureData::CreatureAlliance
			IL_0074: stfld valuetype MGSC.CreatureAlliance MGSC.HitEvent::CreatureTargetAlliance
			// hitEvent.TargetNameTagId = SharedStringIds.Register(creature.CreatureData.LocalizationId);
			IL_0079: ldarg.2
			IL_007a: ldloc.2
			IL_007b: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_0080: ldfld string MGSC.CreatureData::LocalizationId
			IL_0085: call int32 MGSC.SharedStringIds::Register(string)
			IL_008a: stfld int32 MGSC.HitEvent::TargetNameTagId
			// hitEvent.TargetDodge = DamageSystem.GetProgressionDodge(creature, _cacheStatistics, _cacheDifficulty);
			IL_008f: ldarg.2
			IL_0090: ldloc.2
			IL_0091: ldsfld class MGSC.Statistics MGSC.HitResolveSystem::_cacheStatistics
			IL_0096: ldsfld class MGSC.Difficulty MGSC.HitResolveSystem::_cacheDifficulty
			IL_009b: call float32 MGSC.DamageSystem::GetProgressionDodge(class MGSC.Creature, class MGSC.Statistics, class MGSC.Difficulty)
			IL_00a0: stfld float32 MGSC.HitEvent::TargetDodge
			// float value = reference.Accuracy - hitEvent.TargetDodge;
			IL_00a5: ldloc.0
			IL_00a6: ldfld float32 MGSC.ProjectileRuntimeData::Accuracy
			IL_00ab: ldarg.2
			IL_00ac: ldfld float32 MGSC.HitEvent::TargetDodge
			IL_00b1: sub
			IL_00b2: stloc.3
			// float num = (reference.IsMaxHitChance ? Data.Global.CapAccuracy : Mathf.Clamp(value, Data.Global.MinHitChance, Data.Global.CapAccuracy));
			IL_00b3: ldloc.0
			IL_00b4: ldfld bool MGSC.ProjectileRuntimeData::IsMaxHitChance
			IL_00b9: brtrue.s IL_00d7

			IL_00bb: ldloc.3
			IL_00bc: call class MGSC.GlobalSettings MGSC.Data::get_Global()
			IL_00c1: callvirt instance float32 MGSC.GlobalSettings::get_MinHitChance()
			IL_00c6: call class MGSC.GlobalSettings MGSC.Data::get_Global()
			IL_00cb: callvirt instance float32 MGSC.GlobalSettings::get_CapAccuracy()
			IL_00d0: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Clamp(float32, float32, float32)
			IL_00d5: br.s IL_00e1

			// float num2 = Random.Range(0f, 1f);
			IL_00d7: call class MGSC.GlobalSettings MGSC.Data::get_Global()
			IL_00dc: callvirt instance float32 MGSC.GlobalSettings::get_CapAccuracy()

			IL_00e1: stloc.s 4
			IL_00e3: ldc.r4 0.0
			IL_00e8: ldc.r4 1
			IL_00ed: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
			IL_00f2: stloc.s 5
			// hitEvent.WasMiss = num2 > num;
			IL_00f4: ldarg.2
			IL_00f5: ldloc.s 5
			IL_00f7: ldloc.s 4
			IL_00f9: cgt
			IL_00fb: stfld bool MGSC.HitEvent::WasMiss
			// Creature creature2 = _cacheCreatures.GetCreature(hitEvent.OwnerUid);
			IL_0100: ldsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
			IL_0105: ldarg.2
			IL_0106: ldfld int32 MGSC.HitEvent::OwnerUid
			IL_010b: callvirt instance class MGSC.Creature MGSC.Creatures::GetCreature(int32)
			IL_0110: stloc.s 6
			// if (creature2 == null)
			IL_0112: ldloc.s 6
			IL_0114: ldnull
			IL_0115: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_011a: brfalse.s IL_011d

			// if (!hitEvent.WasMiss)
			IL_011c: ret

			IL_011d: ldarg.2
			IL_011e: ldfld bool MGSC.HitEvent::WasMiss
			IL_0123: brtrue.s IL_0143

			// creature2.OnHit();
			IL_0125: ldloc.s 6
			IL_0127: callvirt instance void MGSC.Creature::OnHit()
			// creature.ActivateAttackedTrigger(wasHit: true);
			IL_012c: ldloc.2
			IL_012d: ldc.i4.1
			IL_012e: callvirt instance void MGSC.Creature::ActivateAttackedTrigger(bool)
			// if (!creature.IsSeenByPlayer)
			IL_0133: ldloc.2
			IL_0134: callvirt instance bool MGSC.Creature::get_IsSeenByPlayer()
			IL_0139: brtrue.s IL_018e

			// creature2.OnBlindHit();
			IL_013b: ldloc.s 6
			IL_013d: callvirt instance void MGSC.Creature::OnBlindHit()
			// if (reference.SuppressedAccuracy > 0f)
			IL_0142: ret

			IL_0143: ldloc.0
			IL_0144: ldfld float32 MGSC.ProjectileRuntimeData::SuppressedAccuracy
			IL_0149: ldc.r4 0.0
			IL_014e: ble.un.s IL_0188

			// 		_cacheEntities.Add(_cacheEntities.CreateEntity(), new SuppressTarget
			// 		{
			// 			TargetUid = reference2.CreatureUid,
			// 			SuppressedAccuracy = reference.SuppressedAccuracy
			// 		});
			IL_0150: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0155: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_015a: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_015f: ldloca.s 7
			IL_0161: initobj MGSC.SuppressTarget
			IL_0167: ldloca.s 7
			IL_0169: ldloc.1
			IL_016a: ldfld int32 MGSC.CollisionWithCreature::CreatureUid
			IL_016f: stfld int32 MGSC.SuppressTarget::TargetUid
			IL_0174: ldloca.s 7
			IL_0176: ldloc.0
			IL_0177: ldfld float32 MGSC.ProjectileRuntimeData::SuppressedAccuracy
			IL_017c: stfld float32 MGSC.SuppressTarget::SuppressedAccuracy
			IL_0181: ldloc.s 7
			// creature.ActivateDodgedTrigger();
			IL_0183: callvirt instance void MGSC.Entities::Add<valuetype MGSC.SuppressTarget>(int32, !!0)

			IL_0188: ldloc.2
			IL_0189: callvirt instance void MGSC.Creature::ActivateDodgedTrigger()

			// (no C# code)
			IL_018e: ret
		} // end of method '<>c'::'<ProcessCreatureAccuracy>b__9_0'

		.method assembly hidebysig 
			instance void '<CreateHitConsequences>b__10_0' (
				int32 entity,
				valuetype MGSC.HitEvent& hitEvent
			) cil managed 
		{
			// Method begins at RVA 0x13a9f8
			// Header size: 12
			// Code size: 488 (0x1e8)
			.maxstack 4
			.locals init (
				[0] valuetype MGSC.ProjectileRuntimeData&,
				[1] class MGSC.Creature,
				[2] string,
				[3] int32,
				[4] valuetype MGSC.PropagatesNoise,
				[5] valuetype MGSC.PropagatesNoise,
				[6] int32,
				[7] int32,
				[8] valuetype MGSC.ExplosionRequest,
				[9] int32,
				[10] int32,
				[11] valuetype MGSC.PropagatesNoise
			)

			// if (hitEvent.WasMiss)
			IL_0000: ldarg.2
			IL_0001: ldfld bool MGSC.HitEvent::WasMiss
			IL_0006: brfalse.s IL_0009

			// }
			IL_0008: ret

			// if (!_cacheEntities.IsAlive(hitEvent.ProjEntityId) && !_cacheEntities.Has<CollisionWithWall>(entity))
			IL_0009: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_000e: ldarg.2
			IL_000f: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_0014: callvirt instance bool MGSC.Entities::IsAlive(int32)
			IL_0019: brtrue.s IL_0034

			IL_001b: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0020: ldarg.1
			IL_0021: callvirt instance bool MGSC.Entities::Has<valuetype MGSC.CollisionWithWall>(int32)
			IL_0026: brtrue.s IL_0034

			// _cacheEntities.ScheduleDestroy(entity);
			IL_0028: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_002d: ldarg.1
			IL_002e: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// ref ProjectileRuntimeData reference = ref _cacheEntities.GetRef<ProjectileRuntimeData>(hitEvent.ProjEntityId);
			IL_0033: ret

			IL_0034: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0039: ldarg.2
			IL_003a: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_003f: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.ProjectileRuntimeData>(int32)
			IL_0044: stloc.0
			// Creature creature = _cacheCreatures.GetCreature(hitEvent.OwnerUid);
			IL_0045: ldsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
			IL_004a: ldarg.2
			IL_004b: ldfld int32 MGSC.HitEvent::OwnerUid
			IL_0050: callvirt instance class MGSC.Creature MGSC.Creatures::GetCreature(int32)
			IL_0055: stloc.1
			// if (creature != null)
			IL_0056: ldloc.1
			IL_0057: ldnull
			IL_0058: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_005d: brfalse IL_01ac

			// if (PerkSystem.GetPerkParameterSumFloat(creature.CreatureData, "FNoiseSuppression") < Random.Range(0f, 1f))
			IL_0062: ldloc.1
			IL_0063: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_0068: ldstr "FNoiseSuppression"
			IL_006d: ldc.i4.0
			IL_006e: ldc.i4.0
			IL_006f: call float32 MGSC.PerkSystem::GetPerkParameterSumFloat(class MGSC.CreatureData, string, valuetype MGSC.WeaponClass, valuetype MGSC.WeaponSubClass)
			IL_0074: ldc.r4 0.0
			IL_0079: ldc.r4 1
			IL_007e: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
			IL_0083: bge.un.s IL_00be

			// int entity2 = _cacheEntities.CreateEntity();
			IL_0085: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_008a: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_008f: stloc.3
			// 			PropagatesNoise comp = new PropagatesNoise
			// 			{
			// 				NoiseType = 1,
			// 				Position = hitEvent.PreviousPosition
			// 			};
			IL_0090: ldloca.s 5
			IL_0092: initobj MGSC.PropagatesNoise
			IL_0098: ldloca.s 5
			IL_009a: ldc.i4.1
			IL_009b: stfld int32 MGSC.PropagatesNoise::NoiseType
			IL_00a0: ldloca.s 5
			IL_00a2: ldarg.2
			IL_00a3: ldfld valuetype MGSC.CellPosition MGSC.HitEvent::PreviousPosition
			IL_00a8: stfld valuetype MGSC.CellPosition MGSC.PropagatesNoise::Position
			// _cacheEntities.Add(entity2, comp);
			IL_00ad: ldloc.s 5
			IL_00af: stloc.s 4
			IL_00b1: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_00b6: ldloc.3
			IL_00b7: ldloc.s 4
			IL_00b9: callvirt instance void MGSC.Entities::Add<valuetype MGSC.PropagatesNoise>(int32, !!0)

			// if (ItemTraitSystem.TryGetValue<string>(creature.CreatureData.Inventory.CurrentWeapon.Comp<WeaponComponent>().OverridenAmmo.Traits, "SExplosive", out var value))
			IL_00be: ldloc.1
			IL_00bf: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_00c4: ldfld class MGSC.Inventory MGSC.CreatureData::Inventory
			IL_00c9: callvirt instance class MGSC.BasePickupItem MGSC.Inventory::get_CurrentWeapon()
			IL_00ce: callvirt instance !!0 MGSC.BasePickupItem::Comp<class MGSC.WeaponComponent>()
			IL_00d3: callvirt instance class MGSC.AmmoRecord MGSC.WeaponComponent::get_OverridenAmmo()
			IL_00d8: callvirt instance class [mscorlib]System.Collections.Generic.List`1<string> MGSC.AmmoRecord::get_Traits()
			IL_00dd: ldstr "SExplosive"
			IL_00e2: ldloca.s 2
			IL_00e4: call bool MGSC.ItemTraitSystem::TryGetValue<string>(class [mscorlib]System.Collections.Generic.List`1<string>, string, !!0&)
			IL_00e9: brfalse.s IL_0138

			// int entity3 = _cacheEntities.CreateEntity();
			IL_00eb: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_00f0: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_00f5: stloc.s 6
			// int explosionTypeId = SharedStringIds.Register(value);
			IL_00f7: ldloc.2
			IL_00f8: call int32 MGSC.SharedStringIds::Register(string)
			IL_00fd: stloc.s 7
			// 			_cacheEntities.Add(entity3, new ExplosionRequest
			// 			{
			// 				Position = hitEvent.HitPosition,
			// 				ExplosionTypeId = explosionTypeId,
			// 				OwnerUid = hitEvent.OwnerUid
			// 			});
			IL_00ff: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0104: ldloc.s 6
			IL_0106: ldloca.s 8
			IL_0108: initobj MGSC.ExplosionRequest
			IL_010e: ldloca.s 8
			IL_0110: ldarg.2
			IL_0111: ldfld valuetype MGSC.CellPosition MGSC.HitEvent::HitPosition
			IL_0116: stfld valuetype MGSC.CellPosition MGSC.ExplosionRequest::Position
			IL_011b: ldloca.s 8
			IL_011d: ldloc.s 7
			IL_011f: stfld int32 MGSC.ExplosionRequest::ExplosionTypeId
			IL_0124: ldloca.s 8
			IL_0126: ldarg.2
			IL_0127: ldfld int32 MGSC.HitEvent::OwnerUid
			IL_012c: stfld int32 MGSC.ExplosionRequest::OwnerUid
			IL_0131: ldloc.s 8
			// if (reference.ProjectileExplosionChance > 0f && reference.ProjectileExplosionChance > Random.Range(0f, 1f))
			IL_0133: callvirt instance void MGSC.Entities::Add<valuetype MGSC.ExplosionRequest>(int32, !!0)

			IL_0138: ldloc.0
			IL_0139: ldfld float32 MGSC.ProjectileRuntimeData::ProjectileExplosionChance
			IL_013e: ldc.r4 0.0
			IL_0143: ble.un IL_01e7

			IL_0148: ldloc.0
			IL_0149: ldfld float32 MGSC.ProjectileRuntimeData::ProjectileExplosionChance
			IL_014e: ldc.r4 0.0
			IL_0153: ldc.r4 1
			IL_0158: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
			IL_015d: ble.un IL_01e7

			// int entity4 = _cacheEntities.CreateEntity();
			IL_0162: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0167: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_016c: stloc.s 9
			// 			_cacheEntities.Add(entity4, new ExplosionRequest
			// 			{
			// 				Position = hitEvent.HitPosition,
			// 				ExplosionTypeId = reference.ProjectileExplosionId,
			// 				OwnerUid = hitEvent.OwnerUid
			// 			});
			IL_016e: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0173: ldloc.s 9
			IL_0175: ldloca.s 8
			IL_0177: initobj MGSC.ExplosionRequest
			IL_017d: ldloca.s 8
			IL_017f: ldarg.2
			IL_0180: ldfld valuetype MGSC.CellPosition MGSC.HitEvent::HitPosition
			IL_0185: stfld valuetype MGSC.CellPosition MGSC.ExplosionRequest::Position
			IL_018a: ldloca.s 8
			IL_018c: ldloc.0
			IL_018d: ldfld int32 MGSC.ProjectileRuntimeData::ProjectileExplosionId
			IL_0192: stfld int32 MGSC.ExplosionRequest::ExplosionTypeId
			IL_0197: ldloca.s 8
			IL_0199: ldarg.2
			IL_019a: ldfld int32 MGSC.HitEvent::OwnerUid
			IL_019f: stfld int32 MGSC.ExplosionRequest::OwnerUid
			IL_01a4: ldloc.s 8
			// (no C# code)
			IL_01a6: callvirt instance void MGSC.Entities::Add<valuetype MGSC.ExplosionRequest>(int32, !!0)
			// int entity5 = _cacheEntities.CreateEntity();
			IL_01ab: ret

			IL_01ac: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_01b1: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_01b6: stloc.s 10
			// 		PropagatesNoise comp2 = new PropagatesNoise
			// 		{
			// 			NoiseType = 1,
			// 			Position = hitEvent.PreviousPosition
			// 		};
			IL_01b8: ldloca.s 5
			IL_01ba: initobj MGSC.PropagatesNoise
			IL_01c0: ldloca.s 5
			IL_01c2: ldc.i4.1
			IL_01c3: stfld int32 MGSC.PropagatesNoise::NoiseType
			IL_01c8: ldloca.s 5
			IL_01ca: ldarg.2
			IL_01cb: ldfld valuetype MGSC.CellPosition MGSC.HitEvent::PreviousPosition
			IL_01d0: stfld valuetype MGSC.CellPosition MGSC.PropagatesNoise::Position
			// _cacheEntities.Add(entity5, comp2);
			IL_01d5: ldloc.s 5
			IL_01d7: stloc.s 11
			IL_01d9: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_01de: ldloc.s 10
			IL_01e0: ldloc.s 11
			IL_01e2: callvirt instance void MGSC.Entities::Add<valuetype MGSC.PropagatesNoise>(int32, !!0)

			// (no C# code)
			IL_01e7: ret
		} // end of method '<>c'::'<CreateHitConsequences>b__10_0'

		.method assembly hidebysig 
			instance void '<ProcessExplosion>b__11_0' (
				int32 e,
				valuetype MGSC.ExplosionRequest& explosion
			) cil managed 
		{
			// Method begins at RVA 0x13abec
			// Header size: 12
			// Code size: 411 (0x19b)
			.maxstack 6
			.locals init (
				[0] string,
				[1] class MGSC.ExplosionRecord,
				[2] class MGSC.ExplosionDescriptor,
				[3] valuetype MGSC.ExplosionEntity/ExplosionVisualParameters,
				[4] valuetype MGSC.ExplosionEntity/ExplosionVisualParameters,
				[5] valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
				[6] class MGSC.Creature,
				[7] valuetype MGSC.ExplosionEntity/ExplosionParameters,
				[8] class [UnityEngine.CoreModule]UnityEngine.GameObject
			)

			// string id = SharedStringIds.Get(explosion.ExplosionTypeId);
			IL_0000: ldarg.2
			IL_0001: ldfld int32 MGSC.ExplosionRequest::ExplosionTypeId
			IL_0006: call string MGSC.SharedStringIds::Get(int32)
			IL_000b: stloc.0
			// ExplosionRecord record = Data.Explosions.GetRecord(id);
			IL_000c: call class MGSC.ConfigRecordCollection`1<class MGSC.ExplosionRecord> MGSC.Data::get_Explosions()
			IL_0011: ldloc.0
			IL_0012: ldc.i4.1
			IL_0013: callvirt instance !0 class MGSC.ConfigRecordCollection`1<class MGSC.ExplosionRecord>::GetRecord(string, bool)
			IL_0018: stloc.1
			// ExplosionDescriptor explosionDescriptor = record.ContentDescriptor as ExplosionDescriptor;
			IL_0019: ldloc.1
			IL_001a: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Object MGSC.ConfigTableRecord::get_ContentDescriptor()
			IL_001f: isinst MGSC.ExplosionDescriptor
			IL_0024: stloc.2
			// 	ExplosionEntity.ExplosionVisualParameters visualParameters = new ExplosionEntity.ExplosionVisualParameters
			// 	{
			// 		VisualDelay = explosionDescriptor.visualExplosionDelay,
			// 		ShakeOnExplosion = explosionDescriptor.shakeCameraOnExplosion,
			// 		ExpSoundBank = explosionDescriptor.explosionSoundBank,
			// 		ClearGibsRadiusInPixels = explosionDescriptor.clearGibsRadiusInPixels
			// 	};
			IL_0025: ldloca.s 4
			IL_0027: initobj MGSC.ExplosionEntity/ExplosionVisualParameters
			IL_002d: ldloca.s 4
			IL_002f: ldloc.2
			IL_0030: ldfld float32 MGSC.ExplosionDescriptor::visualExplosionDelay
			IL_0035: stfld float32 MGSC.ExplosionEntity/ExplosionVisualParameters::VisualDelay
			IL_003a: ldloca.s 4
			IL_003c: ldloc.2
			IL_003d: ldfld bool MGSC.ExplosionDescriptor::shakeCameraOnExplosion
			IL_0042: stfld bool MGSC.ExplosionEntity/ExplosionVisualParameters::ShakeOnExplosion
			IL_0047: ldloca.s 4
			IL_0049: ldloc.2
			IL_004a: ldfld class MGSC.SoundBank MGSC.ExplosionDescriptor::explosionSoundBank
			IL_004f: stfld class MGSC.SoundBank MGSC.ExplosionEntity/ExplosionVisualParameters::ExpSoundBank
			IL_0054: ldloca.s 4
			IL_0056: ldloc.2
			IL_0057: ldfld int32 MGSC.ExplosionDescriptor::clearGibsRadiusInPixels
			IL_005c: stfld int32 MGSC.ExplosionEntity/ExplosionVisualParameters::ClearGibsRadiusInPixels
			// if (_cacheMapGrid.GetCell(explosion.Position).Type != MapCellType.Deep)
			IL_0061: ldloc.s 4
			IL_0063: stloc.3
			IL_0064: ldsfld class MGSC.MapGrid MGSC.HitResolveSystem::_cacheMapGrid
			IL_0069: ldarg.2
			IL_006a: ldfld valuetype MGSC.CellPosition MGSC.ExplosionRequest::Position
			IL_006f: ldc.i4.1
			IL_0070: callvirt instance class MGSC.MapCell MGSC.MapGrid::GetCell(valuetype MGSC.CellPosition, bool)
			IL_0075: ldfld valuetype MGSC.MapCellType MGSC.MapCell::Type
			IL_007a: ldc.i4.5
			IL_007b: beq IL_018f

			// Vector3 vector = _cacheMapRenderer.CoordsToPositionCenterPivot(explosion.Position);
			IL_0080: ldsfld class MGSC.MapRenderer MGSC.HitResolveSystem::_cacheMapRenderer
			IL_0085: ldarg.2
			IL_0086: ldfld valuetype MGSC.CellPosition MGSC.ExplosionRequest::Position
			IL_008b: callvirt instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector2 MGSC.MapRenderer::CoordsToPositionCenterPivot(valuetype MGSC.CellPosition)
			IL_0090: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector2::op_Implicit(valuetype [UnityEngine.CoreModule]UnityEngine.Vector2)
			IL_0095: stloc.s 5
			// if (record.Parameters.VisualExplosion)
			IL_0097: ldloc.1
			IL_0098: callvirt instance valuetype MGSC.ExplosionEntity/ExplosionParameters MGSC.ExplosionRecord::get_Parameters()
			IL_009d: ldfld bool MGSC.ExplosionEntity/ExplosionParameters::VisualExplosion
			IL_00a2: brfalse.s IL_0102

			// GameObject gameObject = Object.Instantiate(explosionDescriptor.explosion, SingletonMonoBehaviour<DungeonGameMode>.Instance.transform);
			IL_00a4: ldloc.2
			IL_00a5: ldfld class [UnityEngine.CoreModule]UnityEngine.GameObject MGSC.ExplosionDescriptor::explosion
			IL_00aa: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.DungeonGameMode>::get_Instance()
			IL_00af: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
			IL_00b4: call !!0 [UnityEngine.CoreModule]UnityEngine.Object::Instantiate<class [UnityEngine.CoreModule]UnityEngine.GameObject>(!!0, class [UnityEngine.CoreModule]UnityEngine.Transform)
			IL_00b9: stloc.s 8
			// gameObject.transform.position = vector + explosionDescriptor.visualExplosionOffset;
			IL_00bb: ldloc.s 8
			IL_00bd: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.GameObject::get_transform()
			IL_00c2: ldloc.s 5
			IL_00c4: ldloc.2
			IL_00c5: ldfld valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 MGSC.ExplosionDescriptor::visualExplosionOffset
			IL_00ca: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::op_Addition(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3, valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
			IL_00cf: callvirt instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
			// visualParameters.ExpLightUpdater = gameObject.GetComponentInChildren<ExplosionLightUpdater>(includeInactive: true);
			IL_00d4: ldloca.s 3
			IL_00d6: ldloc.s 8
			IL_00d8: ldc.i4.1
			IL_00d9: callvirt instance !!0 [UnityEngine.CoreModule]UnityEngine.GameObject::GetComponentInChildren<class MGSC.ExplosionLightUpdater>(bool)
			IL_00de: stfld class MGSC.ExplosionLightUpdater MGSC.ExplosionEntity/ExplosionVisualParameters::ExpLightUpdater
			// visualParameters.ExpAnimator = gameObject.GetComponent<FrameAnimator>();
			IL_00e3: ldloca.s 3
			IL_00e5: ldloc.s 8
			IL_00e7: callvirt instance !!0 [UnityEngine.CoreModule]UnityEngine.GameObject::GetComponent<class MGSC.FrameAnimator>()
			IL_00ec: stfld class MGSC.FrameAnimator MGSC.ExplosionEntity/ExplosionVisualParameters::ExpAnimator
			// visualParameters.ExpAnimator.Renderer.enabled = false;
			IL_00f1: ldloc.3
			IL_00f2: ldfld class MGSC.FrameAnimator MGSC.ExplosionEntity/ExplosionVisualParameters::ExpAnimator
			IL_00f7: callvirt instance class [UnityEngine.CoreModule]UnityEngine.SpriteRenderer MGSC.FrameAnimator::get_Renderer()
			IL_00fc: ldc.i4.0
			IL_00fd: callvirt instance void [UnityEngine.CoreModule]UnityEngine.Renderer::set_enabled(bool)

			// Creature creature = _cacheCreatures.GetCreature(explosion.OwnerUid);
			IL_0102: ldsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
			IL_0107: ldarg.2
			IL_0108: ldfld int32 MGSC.ExplosionRequest::OwnerUid
			IL_010d: callvirt instance class MGSC.Creature MGSC.Creatures::GetCreature(int32)
			IL_0112: stloc.s 6
			// ExplosionEntity.ExplosionParameters parameters = record.Parameters;
			IL_0114: ldloc.1
			IL_0115: callvirt instance valuetype MGSC.ExplosionEntity/ExplosionParameters MGSC.ExplosionRecord::get_Parameters()
			IL_011a: stloc.s 7
			// parameters.Damage = Mathf.RoundToInt((float)parameters.Damage * creature.CreatureData.GrenadeDamageMult);
			IL_011c: ldloca.s 7
			IL_011e: ldloc.s 7
			IL_0120: ldfld int32 MGSC.ExplosionEntity/ExplosionParameters::Damage
			IL_0125: conv.r4
			IL_0126: ldloc.s 6
			IL_0128: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_012d: ldfld float32 MGSC.CreatureData::GrenadeDamageMult
			IL_0132: mul
			IL_0133: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::RoundToInt(float32)
			IL_0138: stfld int32 MGSC.ExplosionEntity/ExplosionParameters::Damage
			// parameters.IsPlayerFire = creature is Player;
			IL_013d: ldloca.s 7
			IL_013f: ldloc.s 6
			IL_0141: isinst MGSC.Player
			IL_0146: ldnull
			IL_0147: cgt.un
			IL_0149: stfld bool MGSC.ExplosionEntity/ExplosionParameters::IsPlayerFire
			// SingletonMonoBehaviour<ExplosionFactory>.Instance.CreateExplosion(explosion.Position, parameters, visualParameters, creature).ExplodeNow();
			IL_014e: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.ExplosionFactory>::get_Instance()
			IL_0153: ldarg.2
			IL_0154: ldfld valuetype MGSC.CellPosition MGSC.ExplosionRequest::Position
			IL_0159: ldloc.s 7
			IL_015b: ldloc.3
			IL_015c: ldloc.s 6
			IL_015e: callvirt instance class MGSC.ExplosionEntity MGSC.ExplosionFactory::CreateExplosion(valuetype MGSC.CellPosition, valuetype MGSC.ExplosionEntity/ExplosionParameters, valuetype MGSC.ExplosionEntity/ExplosionVisualParameters, class MGSC.Creature)
			IL_0163: callvirt instance void MGSC.ExplosionEntity::ExplodeNow()
			// if (visualParameters.ExpSoundBank != null)
			IL_0168: ldloc.3
			IL_0169: ldfld class MGSC.SoundBank MGSC.ExplosionEntity/ExplosionVisualParameters::ExpSoundBank
			IL_016e: ldnull
			IL_016f: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0174: brfalse.s IL_018f

			// SingletonMonoBehaviour<SoundController>.Instance.PlaySound(vector, visualParameters.ExpSoundBank);
			IL_0176: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
			IL_017b: ldloc.s 5
			IL_017d: ldloc.3
			IL_017e: ldfld class MGSC.SoundBank MGSC.ExplosionEntity/ExplosionVisualParameters::ExpSoundBank
			IL_0183: ldc.i4.0
			IL_0184: ldc.i4.0
			IL_0185: ldc.r4 0.0
			IL_018a: callvirt instance void MGSC.SoundController::PlaySound(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3, class MGSC.SoundBank, bool, bool, float32)

			// _cacheEntities.ScheduleDestroy(e);
			IL_018f: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0194: ldarg.1
			IL_0195: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// }
			IL_019a: ret
		} // end of method '<>c'::'<ProcessExplosion>b__11_0'

		.method assembly hidebysig 
			instance void '<ProcessObstaclePierce>b__12_0' (
				int32 entity,
				valuetype MGSC.HitEvent& hitEvent
			) cil managed 
		{
			// Method begins at RVA 0x13ad94
			// Header size: 12
			// Code size: 135 (0x87)
			.maxstack 3
			.locals init (
				[0] valuetype MGSC.CollisionWithObstacle&,
				[1] float32
			)

			// if (_cacheEntities.IsAlive(hitEvent.ProjEntityId) && !hitEvent.WasMiss)
			IL_0000: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0005: ldarg.2
			IL_0006: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_000b: callvirt instance bool MGSC.Entities::IsAlive(int32)
			IL_0010: brtrue.s IL_0013

			// }
			IL_0012: ret

			// (no C# code)
			IL_0013: ldarg.2
			IL_0014: ldfld bool MGSC.HitEvent::WasMiss
			IL_0019: brfalse.s IL_001c

			// ref CollisionWithObstacle reference = ref _cacheEntities.GetRef<CollisionWithObstacle>(entity);
			IL_001b: ret

			IL_001c: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0021: ldarg.1
			IL_0022: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.CollisionWithObstacle>(int32)
			IL_0027: stloc.0
			// float num = _cacheEntities.GetRef<ProjectileRuntimeData>(hitEvent.ProjEntityId).PierceChance - reference.PierceBlock;
			IL_0028: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_002d: ldarg.2
			IL_002e: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_0033: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.ProjectileRuntimeData>(int32)
			IL_0038: ldfld float32 MGSC.ProjectileRuntimeData::PierceChance
			IL_003d: ldloc.0
			IL_003e: ldfld float32 MGSC.CollisionWithObstacle::PierceBlock
			IL_0043: sub
			IL_0044: stloc.1
			// hitEvent.WasPierced = reference.PierceBlock == 0f || Random.Range(0f, 1f) < num;
			IL_0045: ldarg.2
			IL_0046: ldloc.0
			IL_0047: ldfld float32 MGSC.CollisionWithObstacle::PierceBlock
			IL_004c: ldc.r4 0.0
			IL_0051: beq.s IL_0067

			IL_0053: ldc.r4 0.0
			IL_0058: ldc.r4 1
			IL_005d: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
			IL_0062: ldloc.1
			IL_0063: clt
			IL_0065: br.s IL_0068

			IL_0067: ldc.i4.1

			IL_0068: stfld bool MGSC.HitEvent::WasPierced
			// if (!hitEvent.WasPierced)
			IL_006d: ldarg.2
			IL_006e: ldfld bool MGSC.HitEvent::WasPierced
			IL_0073: brfalse.s IL_0076

			// _cacheEntities.ScheduleDestroy(hitEvent.ProjEntityId);
			IL_0075: ret

			IL_0076: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_007b: ldarg.2
			IL_007c: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_0081: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// (no C# code)
			IL_0086: ret
		} // end of method '<>c'::'<ProcessObstaclePierce>b__12_0'

		.method assembly hidebysig 
			instance void '<ProcessCreaturePierce>b__13_0' (
				int32 entity,
				valuetype MGSC.HitEvent& hitEvent
			) cil managed 
		{
			// Method begins at RVA 0x13ae28
			// Header size: 12
			// Code size: 111 (0x6f)
			.maxstack 3
			.locals init (
				[0] valuetype MGSC.ProjectileRuntimeData&
			)

			// if (!_cacheEntities.IsAlive(hitEvent.ProjEntityId))
			IL_0000: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0005: ldarg.2
			IL_0006: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_000b: callvirt instance bool MGSC.Entities::IsAlive(int32)
			IL_0010: brtrue.s IL_001e

			// _cacheEntities.ScheduleDestroy(entity);
			IL_0012: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0017: ldarg.1
			IL_0018: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// }
			IL_001d: ret

			// else if (!hitEvent.WasMiss)
			IL_001e: ldarg.2
			IL_001f: ldfld bool MGSC.HitEvent::WasMiss
			IL_0024: brfalse.s IL_0027

			// ref ProjectileRuntimeData reference = ref _cacheEntities.GetRef<ProjectileRuntimeData>(hitEvent.ProjEntityId);
			IL_0026: ret

			IL_0027: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_002c: ldarg.2
			IL_002d: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_0032: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.ProjectileRuntimeData>(int32)
			IL_0037: stloc.0
			// hitEvent.WasPierced = Random.Range(0f, 1f) < reference.PierceChance;
			IL_0038: ldarg.2
			IL_0039: ldc.r4 0.0
			IL_003e: ldc.r4 1
			IL_0043: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
			IL_0048: ldloc.0
			IL_0049: ldfld float32 MGSC.ProjectileRuntimeData::PierceChance
			IL_004e: clt
			IL_0050: stfld bool MGSC.HitEvent::WasPierced
			// if (!hitEvent.WasPierced)
			IL_0055: ldarg.2
			IL_0056: ldfld bool MGSC.HitEvent::WasPierced
			IL_005b: brfalse.s IL_005e

			// _cacheEntities.ScheduleDestroy(hitEvent.ProjEntityId);
			IL_005d: ret

			IL_005e: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0063: ldarg.2
			IL_0064: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_0069: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// (no C# code)
			IL_006e: ret
		} // end of method '<>c'::'<ProcessCreaturePierce>b__13_0'

		.method assembly hidebysig 
			instance void '<CreateDamageRequest>b__14_0' (
				int32 entity,
				valuetype MGSC.HitEvent& hitEvent
			) cil managed 
		{
			// Method begins at RVA 0x13aea4
			// Header size: 12
			// Code size: 288 (0x120)
			.maxstack 4
			.locals init (
				[0] int32,
				[1] valuetype MGSC.DamageRequest,
				[2] valuetype MGSC.DamageRequest,
				[3] valuetype MGSC.CollisionWithCreature&,
				[4] valuetype MGSC.DamageRequestCreature,
				[5] valuetype MGSC.CollisionWithObstacle&,
				[6] valuetype MGSC.DamageRequestObstacle,
				[7] valuetype MGSC.DamageRequestWall
			)

			// if (!hitEvent.WasMiss)
			IL_0000: ldarg.2
			IL_0001: ldfld bool MGSC.HitEvent::WasMiss
			IL_0006: brfalse.s IL_0009

			// }
			IL_0008: ret

			// int entity2 = _cacheEntities.CreateEntity();
			IL_0009: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_000e: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_0013: stloc.0
			// 		DamageRequest comp = new DamageRequest
			// 		{
			// 			OwnerUid = hitEvent.OwnerUid,
			// 			Position = hitEvent.HitPosition,
			// 			ProjEntityId = hitEvent.ProjEntityId
			// 		};
			IL_0014: ldloca.s 2
			IL_0016: initobj MGSC.DamageRequest
			IL_001c: ldloca.s 2
			IL_001e: ldarg.2
			IL_001f: ldfld int32 MGSC.HitEvent::OwnerUid
			IL_0024: stfld int32 MGSC.DamageRequest::OwnerUid
			IL_0029: ldloca.s 2
			IL_002b: ldarg.2
			IL_002c: ldfld valuetype MGSC.CellPosition MGSC.HitEvent::HitPosition
			IL_0031: stfld valuetype MGSC.CellPosition MGSC.DamageRequest::Position
			IL_0036: ldloca.s 2
			IL_0038: ldarg.2
			IL_0039: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_003e: stfld int32 MGSC.DamageRequest::ProjEntityId
			// if (_cacheEntities.Has<CollisionWithCreature>(entity))
			IL_0043: ldloc.2
			IL_0044: stloc.1
			IL_0045: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_004a: ldarg.1
			IL_004b: callvirt instance bool MGSC.Entities::Has<valuetype MGSC.CollisionWithCreature>(int32)
			IL_0050: brfalse.s IL_00b4

			// comp.TargetUid = _cacheEntities.GetRef<CollisionWithCreature>(entity).CreatureUid;
			IL_0052: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0057: ldarg.1
			IL_0058: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.CollisionWithCreature>(int32)
			IL_005d: stloc.3
			IL_005e: ldloca.s 1
			IL_0060: ldloc.3
			IL_0061: ldfld int32 MGSC.CollisionWithCreature::CreatureUid
			IL_0066: stfld int32 MGSC.DamageRequest::TargetUid
			// comp.Dodge = hitEvent.TargetDodge;
			IL_006b: ldloca.s 1
			IL_006d: ldarg.2
			IL_006e: ldfld float32 MGSC.HitEvent::TargetDodge
			IL_0073: stfld float32 MGSC.DamageRequest::Dodge
			// _cacheEntities.Add(entity2, comp);
			IL_0078: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_007d: ldloc.0
			IL_007e: ldloc.1
			IL_007f: callvirt instance void MGSC.Entities::Add<valuetype MGSC.DamageRequest>(int32, !!0)
			// 			_cacheEntities.Add(entity2, new DamageRequestCreature
			// 			{
			// 				TargetNameTagId = hitEvent.TargetNameTagId,
			// 				CreatureTargetAlliance = hitEvent.CreatureTargetAlliance
			// 			});
			IL_0084: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0089: ldloc.0
			IL_008a: ldloca.s 4
			IL_008c: initobj MGSC.DamageRequestCreature
			IL_0092: ldloca.s 4
			IL_0094: ldarg.2
			IL_0095: ldfld int32 MGSC.HitEvent::TargetNameTagId
			IL_009a: stfld int32 MGSC.DamageRequestCreature::TargetNameTagId
			IL_009f: ldloca.s 4
			IL_00a1: ldarg.2
			IL_00a2: ldfld valuetype MGSC.CreatureAlliance MGSC.HitEvent::CreatureTargetAlliance
			IL_00a7: stfld valuetype MGSC.CreatureAlliance MGSC.DamageRequestCreature::CreatureTargetAlliance
			IL_00ac: ldloc.s 4
			// (no C# code)
			IL_00ae: callvirt instance void MGSC.Entities::Add<valuetype MGSC.DamageRequestCreature>(int32, !!0)
			// else if (_cacheEntities.Has<CollisionWithObstacle>(entity))
			IL_00b3: ret

			IL_00b4: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_00b9: ldarg.1
			IL_00ba: callvirt instance bool MGSC.Entities::Has<valuetype MGSC.CollisionWithObstacle>(int32)
			IL_00bf: brfalse.s IL_00fe

			// comp.TargetObstacleUid = _cacheEntities.GetRef<CollisionWithObstacle>(entity).ObstacleUid;
			IL_00c1: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_00c6: ldarg.1
			IL_00c7: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.CollisionWithObstacle>(int32)
			IL_00cc: stloc.s 5
			IL_00ce: ldloca.s 1
			IL_00d0: ldloc.s 5
			IL_00d2: ldfld int32 MGSC.CollisionWithObstacle::ObstacleUid
			IL_00d7: stfld int32 MGSC.DamageRequest::TargetObstacleUid
			// _cacheEntities.Add(entity2, comp);
			IL_00dc: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_00e1: ldloc.0
			IL_00e2: ldloc.1
			IL_00e3: callvirt instance void MGSC.Entities::Add<valuetype MGSC.DamageRequest>(int32, !!0)
			// _cacheEntities.Add(entity2, default(DamageRequestObstacle));
			IL_00e8: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_00ed: ldloc.0
			IL_00ee: ldloca.s 6
			IL_00f0: initobj MGSC.DamageRequestObstacle
			IL_00f6: ldloc.s 6
			// (no C# code)
			IL_00f8: callvirt instance void MGSC.Entities::Add<valuetype MGSC.DamageRequestObstacle>(int32, !!0)
			// _cacheEntities.Add(entity2, comp);
			IL_00fd: ret

			IL_00fe: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0103: ldloc.0
			IL_0104: ldloc.1
			IL_0105: callvirt instance void MGSC.Entities::Add<valuetype MGSC.DamageRequest>(int32, !!0)
			// _cacheEntities.Add(entity2, default(DamageRequestWall));
			IL_010a: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_010f: ldloc.0
			// (no C# code)
			IL_0110: ldloca.s 7
			IL_0112: initobj MGSC.DamageRequestWall
			IL_0118: ldloc.s 7
			IL_011a: callvirt instance void MGSC.Entities::Add<valuetype MGSC.DamageRequestWall>(int32, !!0)
			IL_011f: ret
		} // end of method '<>c'::'<CreateDamageRequest>b__14_0'

		.method assembly hidebysig 
			instance void '<TempHitEventCleaner>b__15_0' (
				int32 entity,
				valuetype MGSC.HitEvent& _
			) cil managed 
		{
			// Method begins at RVA 0x13afd0
			// Header size: 1
			// Code size: 12 (0xc)
			.maxstack 8

			// _cacheEntities.ScheduleDestroy(entity);
			IL_0000: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0005: ldarg.1
			IL_0006: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// }
			IL_000b: ret
		} // end of method '<>c'::'<TempHitEventCleaner>b__15_0'

	} // end of class <>c


	// Fields
	.field private static class MGSC.Entities _cacheEntities
	.field private static class MGSC.Creatures _cacheCreatures
	.field private static class MGSC.Statistics _cacheStatistics
	.field private static class MGSC.Difficulty _cacheDifficulty
	.field private static class MGSC.MapGrid _cacheMapGrid
	.field private static class MGSC.MapRenderer _cacheMapRenderer
	.field private static class MGSC.MapObstacles _cacheMapObstacles

	// Methods
	.method public hidebysig static 
		void Update (
			class MGSC.Entities entities,
			class MGSC.Creatures creatures,
			class MGSC.Statistics statistics,
			class MGSC.Difficulty difficulty,
			class MGSC.MapGrid mapGrid,
			class MGSC.MapRenderer mapRenderer,
			class MGSC.MapObstacles mapObstacles
		) cil managed 
	{
		.custom instance void MGSC.GameLoopUpdate::.ctor(valuetype MGSC.GameLoopGroup, valuetype MGSC.GameLoopExecuteOrder, string) = (
			01 00 01 00 00 00 02 00 00 00 16 43 6f 6c 6c 69
			73 69 6f 6e 53 79 73 74 65 6d 2e 55 70 64 61 74
			65 00 00
		)
		// Method begins at RVA 0x82728
		// Header size: 12
		// Code size: 128 (0x80)
		.maxstack 1

		// _cacheEntities = entities;
		IL_0000: ldarg.0
		IL_0001: stsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
		// _cacheCreatures = creatures;
		IL_0006: ldarg.1
		IL_0007: stsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
		// _cacheStatistics = statistics;
		IL_000c: ldarg.2
		IL_000d: stsfld class MGSC.Statistics MGSC.HitResolveSystem::_cacheStatistics
		// _cacheDifficulty = difficulty;
		IL_0012: ldarg.3
		IL_0013: stsfld class MGSC.Difficulty MGSC.HitResolveSystem::_cacheDifficulty
		// _cacheMapGrid = mapGrid;
		IL_0018: ldarg.s mapGrid
		IL_001a: stsfld class MGSC.MapGrid MGSC.HitResolveSystem::_cacheMapGrid
		// _cacheMapRenderer = mapRenderer;
		IL_001f: ldarg.s mapRenderer
		IL_0021: stsfld class MGSC.MapRenderer MGSC.HitResolveSystem::_cacheMapRenderer
		// _cacheMapObstacles = mapObstacles;
		IL_0026: ldarg.s mapObstacles
		IL_0028: stsfld class MGSC.MapObstacles MGSC.HitResolveSystem::_cacheMapObstacles
		// ProcessObstacleAccuracy();
		IL_002d: call void MGSC.HitResolveSystem::ProcessObstacleAccuracy()
		// ProcessCreatureAccuracy();
		IL_0032: call void MGSC.HitResolveSystem::ProcessCreatureAccuracy()
		// CreateHitConsequences();
		IL_0037: call void MGSC.HitResolveSystem::CreateHitConsequences()
		// ProcessExplosion();
		IL_003c: call void MGSC.HitResolveSystem::ProcessExplosion()
		// ProcessObstaclePierce();
		IL_0041: call void MGSC.HitResolveSystem::ProcessObstaclePierce()
		// ProcessCreaturePierce();
		IL_0046: call void MGSC.HitResolveSystem::ProcessCreaturePierce()
		// CreateDamageRequest();
		IL_004b: call void MGSC.HitResolveSystem::CreateDamageRequest()
		// TempHitEventCleaner();
		IL_0050: call void MGSC.HitResolveSystem::TempHitEventCleaner()
		// _cacheEntities = null;
		IL_0055: ldnull
		IL_0056: stsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
		// _cacheCreatures = null;
		IL_005b: ldnull
		IL_005c: stsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
		// _cacheStatistics = null;
		IL_0061: ldnull
		IL_0062: stsfld class MGSC.Statistics MGSC.HitResolveSystem::_cacheStatistics
		// _cacheDifficulty = null;
		IL_0067: ldnull
		IL_0068: stsfld class MGSC.Difficulty MGSC.HitResolveSystem::_cacheDifficulty
		// _cacheMapGrid = null;
		IL_006d: ldnull
		IL_006e: stsfld class MGSC.MapGrid MGSC.HitResolveSystem::_cacheMapGrid
		// _cacheMapRenderer = null;
		IL_0073: ldnull
		IL_0074: stsfld class MGSC.MapRenderer MGSC.HitResolveSystem::_cacheMapRenderer
		// _cacheMapObstacles = null;
		IL_0079: ldnull
		IL_007a: stsfld class MGSC.MapObstacles MGSC.HitResolveSystem::_cacheMapObstacles
		// }
		IL_007f: ret
	} // end of method HitResolveSystem::Update

	.method private hidebysig static 
		void ProcessObstacleAccuracy () cil managed 
	{
		// Method begins at RVA 0x827b4
		// Header size: 1
		// Code size: 52 (0x34)
		.maxstack 8

		// 	_cacheEntities.Filter().With<CollisionWithObstacle>().ForEach(delegate(int entity, ref HitEvent hitEvent)
		// 	{
		// 		if (!_cacheEntities.IsAlive(hitEvent.ProjEntityId))
		// 		{
		// 			_cacheEntities.ScheduleDestroy(entity);
		// 		}
		// 		else
		// 		{
		// 			ref CollisionWithObstacle reference = ref _cacheEntities.GetRef<CollisionWithObstacle>(entity);
		// 			MapObstacle mapObstacle = _cacheMapObstacles.Get(reference.ObstacleUid);
		// 			if (mapObstacle == null)
		// 			{
		// 				_cacheEntities.ScheduleDestroy(entity);
		// 			}
		// 			else if (mapObstacle.Door != null && (mapObstacle.Door.State == Door.DoorState.Opened || mapObstacle.Door.State == Door.DoorState.Remains))
		// 			{
		// 				_cacheEntities.ScheduleDestroy(entity);
		// 			}
		// 			else
		// 			{
		// 				ObstacleHealth obstacleHealth = mapObstacle.ObstacleHealth;
		// 				if (obstacleHealth != null)
		// 				{
		// 					int num = obstacleHealth.HitChanceOnShoot;
		// 					int num2 = obstacleHealth.BlockChance;
		// 					Player player = _cacheCreatures.Player;
		// 					if (player != null && !obstacleHealth.IsDestroyed)
		// 					{
		// 						CellPosition position = mapObstacle.Position;
		// 						CellPosition position2 = player.CreatureData.Position;
		// 						int num3 = position2.X - position.X;
		// 						int num4 = position2.Y - position.Y;
		// 						if ((num3 | num4) != 0 && Mathf.Abs(num3) <= 1 && Mathf.Abs(num4) <= 1)
		// 						{
		// 							num += player.CreatureData.CoverHitChanceBonus;
		// 							num2 += player.CreatureData.CoverBlockChanceBonus;
		// 						}
		// 					}
		// 					hitEvent.WasMiss = Random.Range(1, 101) >= num;
		// 					reference.PierceBlock = (float)num2 * 0.01f;
		// 				}
		// 				else if (mapObstacle.Door != null)
		// 				{
		// 					hitEvent.WasMiss = false;
		// 					if (mapObstacle.Door.CanBePierced)
		// 					{
		// 						reference.PierceBlock = 0f;
		// 					}
		// 					else
		// 					{
		// 						switch (mapObstacle.Door.State)
		// 						{
		// 						case Door.DoorState.Shattered:
		// 							reference.PierceBlock = 0.5f;
		// 							break;
		// 						case Door.DoorState.Closed:
		// 						case Door.DoorState.Blocked:
		// 							reference.PierceBlock = 1f;
		// 							break;
		// 						default:
		// 							reference.PierceBlock = 0f;
		// 							break;
		// 						}
		// 					}
		// 				}
		// 			}
		// 		}
		// 	});
		IL_0000: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
		IL_0005: callvirt instance class MGSC.FilterQuery MGSC.Entities::Filter()
		IL_000a: callvirt instance class MGSC.FilterQuery MGSC.FilterQuery::With<valuetype MGSC.CollisionWithObstacle>()
		IL_000f: ldsfld class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> MGSC.HitResolveSystem/'<>c'::'<>9__8_0'
		IL_0014: dup
		IL_0015: brtrue.s IL_002e

		// (no C# code)
		IL_0017: pop
		IL_0018: ldsfld class MGSC.HitResolveSystem/'<>c' MGSC.HitResolveSystem/'<>c'::'<>9'
		IL_001d: ldftn instance void MGSC.HitResolveSystem/'<>c'::'<ProcessObstacleAccuracy>b__8_0'(int32, valuetype MGSC.HitEvent&)
		IL_0023: newobj instance void class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent>::.ctor(object, native int)
		IL_0028: dup
		IL_0029: stsfld class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> MGSC.HitResolveSystem/'<>c'::'<>9__8_0'

		// }
		IL_002e: callvirt instance void MGSC.FilterQuery::ForEach<valuetype MGSC.HitEvent>(class MGSC.RefEntityAction`1<!!0>)
		IL_0033: ret
	} // end of method HitResolveSystem::ProcessObstacleAccuracy

	.method private hidebysig static 
		void ProcessCreatureAccuracy () cil managed 
	{
		// Method begins at RVA 0x827e9
		// Header size: 1
		// Code size: 52 (0x34)
		.maxstack 8

		// 	_cacheEntities.Filter().With<CollisionWithCreature>().ForEach(delegate(int entity, ref HitEvent hitEvent)
		// 	{
		// 		if (!_cacheEntities.IsAlive(hitEvent.ProjEntityId))
		// 		{
		// 			_cacheEntities.ScheduleDestroy(entity);
		// 		}
		// 		else
		// 		{
		// 			ref ProjectileRuntimeData reference = ref _cacheEntities.GetRef<ProjectileRuntimeData>(hitEvent.ProjEntityId);
		// 			ref CollisionWithCreature reference2 = ref _cacheEntities.GetRef<CollisionWithCreature>(entity);
		// 			Creature creature = _cacheCreatures.GetCreature(reference2.CreatureUid);
		// 			if (creature == null)
		// 			{
		// 				_cacheEntities.ScheduleDestroy(entity);
		// 			}
		// 			else
		// 			{
		// 				creature.ActivateAttackedTrigger(wasHit: false);
		// 				hitEvent.CreatureTargetAlliance = creature.CreatureData.CreatureAlliance;
		// 				hitEvent.TargetNameTagId = SharedStringIds.Register(creature.CreatureData.LocalizationId);
		// 				hitEvent.TargetDodge = DamageSystem.GetProgressionDodge(creature, _cacheStatistics, _cacheDifficulty);
		// 				float value = reference.Accuracy - hitEvent.TargetDodge;
		// 				float num = (reference.IsMaxHitChance ? Data.Global.CapAccuracy : Mathf.Clamp(value, Data.Global.MinHitChance, Data.Global.CapAccuracy));
		// 				float num2 = Random.Range(0f, 1f);
		// 				hitEvent.WasMiss = num2 > num;
		// 				Creature creature2 = _cacheCreatures.GetCreature(hitEvent.OwnerUid);
		// 				if (!(creature2 == null))
		// 				{
		// 					if (!hitEvent.WasMiss)
		// 					{
		// 						creature2.OnHit();
		// 						creature.ActivateAttackedTrigger(wasHit: true);
		// 						if (!creature.IsSeenByPlayer)
		// 						{
		// 							creature2.OnBlindHit();
		// 						}
		// 					}
		// 					else
		// 					{
		// 						if (reference.SuppressedAccuracy > 0f)
		// 						{
		// 							_cacheEntities.Add(_cacheEntities.CreateEntity(), new SuppressTarget
		// 							{
		// 								TargetUid = reference2.CreatureUid,
		// 								SuppressedAccuracy = reference.SuppressedAccuracy
		// 							});
		// 						}
		// 						creature.ActivateDodgedTrigger();
		// 					}
		// 				}
		// 			}
		// 		}
		// 	});
		IL_0000: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
		IL_0005: callvirt instance class MGSC.FilterQuery MGSC.Entities::Filter()
		IL_000a: callvirt instance class MGSC.FilterQuery MGSC.FilterQuery::With<valuetype MGSC.CollisionWithCreature>()
		IL_000f: ldsfld class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> MGSC.HitResolveSystem/'<>c'::'<>9__9_0'
		IL_0014: dup
		IL_0015: brtrue.s IL_002e

		// (no C# code)
		IL_0017: pop
		IL_0018: ldsfld class MGSC.HitResolveSystem/'<>c' MGSC.HitResolveSystem/'<>c'::'<>9'
		IL_001d: ldftn instance void MGSC.HitResolveSystem/'<>c'::'<ProcessCreatureAccuracy>b__9_0'(int32, valuetype MGSC.HitEvent&)
		IL_0023: newobj instance void class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent>::.ctor(object, native int)
		IL_0028: dup
		IL_0029: stsfld class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> MGSC.HitResolveSystem/'<>c'::'<>9__9_0'

		// }
		IL_002e: callvirt instance void MGSC.FilterQuery::ForEach<valuetype MGSC.HitEvent>(class MGSC.RefEntityAction`1<!!0>)
		IL_0033: ret
	} // end of method HitResolveSystem::ProcessCreatureAccuracy

	.method private hidebysig static 
		void CreateHitConsequences () cil managed 
	{
		// Method begins at RVA 0x8281e
		// Header size: 1
		// Code size: 47 (0x2f)
		.maxstack 8

		// 	_cacheEntities.Filter().ForEach(delegate(int entity, ref HitEvent hitEvent)
		// 	{
		// 		if (!hitEvent.WasMiss)
		// 		{
		// 			if (!_cacheEntities.IsAlive(hitEvent.ProjEntityId) && !_cacheEntities.Has<CollisionWithWall>(entity))
		// 			{
		// 				_cacheEntities.ScheduleDestroy(entity);
		// 			}
		// 			else
		// 			{
		// 				ref ProjectileRuntimeData reference = ref _cacheEntities.GetRef<ProjectileRuntimeData>(hitEvent.ProjEntityId);
		// 				Creature creature = _cacheCreatures.GetCreature(hitEvent.OwnerUid);
		// 				if (creature != null)
		// 				{
		// 					if (PerkSystem.GetPerkParameterSumFloat(creature.CreatureData, "FNoiseSuppression") < Random.Range(0f, 1f))
		// 					{
		// 						int entity2 = _cacheEntities.CreateEntity();
		// 						PropagatesNoise comp = new PropagatesNoise
		// 						{
		// 							NoiseType = 1,
		// 							Position = hitEvent.PreviousPosition
		// 						};
		// 						_cacheEntities.Add(entity2, comp);
		// 					}
		// 					if (ItemTraitSystem.TryGetValue<string>(creature.CreatureData.Inventory.CurrentWeapon.Comp<WeaponComponent>().OverridenAmmo.Traits, "SExplosive", out var value))
		// 					{
		// 						int entity3 = _cacheEntities.CreateEntity();
		// 						int explosionTypeId = SharedStringIds.Register(value);
		// 						_cacheEntities.Add(entity3, new ExplosionRequest
		// 						{
		// 							Position = hitEvent.HitPosition,
		// 							ExplosionTypeId = explosionTypeId,
		// 							OwnerUid = hitEvent.OwnerUid
		// 						});
		// 					}
		// 					if (reference.ProjectileExplosionChance > 0f && reference.ProjectileExplosionChance > Random.Range(0f, 1f))
		// 					{
		// 						int entity4 = _cacheEntities.CreateEntity();
		// 						_cacheEntities.Add(entity4, new ExplosionRequest
		// 						{
		// 							Position = hitEvent.HitPosition,
		// 							ExplosionTypeId = reference.ProjectileExplosionId,
		// 							OwnerUid = hitEvent.OwnerUid
		// 						});
		// 					}
		// 				}
		// 				else
		// 				{
		// 					int entity5 = _cacheEntities.CreateEntity();
		// 					PropagatesNoise comp2 = new PropagatesNoise
		// 					{
		// 						NoiseType = 1,
		// 						Position = hitEvent.PreviousPosition
		// 					};
		// 					_cacheEntities.Add(entity5, comp2);
		// 				}
		// 			}
		// 		}
		// 	});
		IL_0000: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
		IL_0005: callvirt instance class MGSC.FilterQuery MGSC.Entities::Filter()
		IL_000a: ldsfld class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> MGSC.HitResolveSystem/'<>c'::'<>9__10_0'
		IL_000f: dup
		IL_0010: brtrue.s IL_0029

		// (no C# code)
		IL_0012: pop
		IL_0013: ldsfld class MGSC.HitResolveSystem/'<>c' MGSC.HitResolveSystem/'<>c'::'<>9'
		IL_0018: ldftn instance void MGSC.HitResolveSystem/'<>c'::'<CreateHitConsequences>b__10_0'(int32, valuetype MGSC.HitEvent&)
		IL_001e: newobj instance void class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent>::.ctor(object, native int)
		IL_0023: dup
		IL_0024: stsfld class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> MGSC.HitResolveSystem/'<>c'::'<>9__10_0'

		// }
		IL_0029: callvirt instance void MGSC.FilterQuery::ForEach<valuetype MGSC.HitEvent>(class MGSC.RefEntityAction`1<!!0>)
		IL_002e: ret
	} // end of method HitResolveSystem::CreateHitConsequences

	.method private hidebysig static 
		void ProcessExplosion () cil managed 
	{
		// Method begins at RVA 0x8284e
		// Header size: 1
		// Code size: 47 (0x2f)
		.maxstack 8

		// 	_cacheEntities.Filter().ForEach(delegate(int e, ref ExplosionRequest explosion)
		// 	{
		// 		string id = SharedStringIds.Get(explosion.ExplosionTypeId);
		// 		ExplosionRecord record = Data.Explosions.GetRecord(id);
		// 		ExplosionDescriptor explosionDescriptor = record.ContentDescriptor as ExplosionDescriptor;
		// 		ExplosionEntity.ExplosionVisualParameters visualParameters = new ExplosionEntity.ExplosionVisualParameters
		// 		{
		// 			VisualDelay = explosionDescriptor.visualExplosionDelay,
		// 			ShakeOnExplosion = explosionDescriptor.shakeCameraOnExplosion,
		// 			ExpSoundBank = explosionDescriptor.explosionSoundBank,
		// 			ClearGibsRadiusInPixels = explosionDescriptor.clearGibsRadiusInPixels
		// 		};
		// 		if (_cacheMapGrid.GetCell(explosion.Position).Type != MapCellType.Deep)
		// 		{
		// 			Vector3 vector = _cacheMapRenderer.CoordsToPositionCenterPivot(explosion.Position);
		// 			if (record.Parameters.VisualExplosion)
		// 			{
		// 				GameObject gameObject = Object.Instantiate(explosionDescriptor.explosion, SingletonMonoBehaviour<DungeonGameMode>.Instance.transform);
		// 				gameObject.transform.position = vector + explosionDescriptor.visualExplosionOffset;
		// 				visualParameters.ExpLightUpdater = gameObject.GetComponentInChildren<ExplosionLightUpdater>(includeInactive: true);
		// 				visualParameters.ExpAnimator = gameObject.GetComponent<FrameAnimator>();
		// 				visualParameters.ExpAnimator.Renderer.enabled = false;
		// 			}
		// 			Creature creature = _cacheCreatures.GetCreature(explosion.OwnerUid);
		// 			ExplosionEntity.ExplosionParameters parameters = record.Parameters;
		// 			parameters.Damage = Mathf.RoundToInt((float)parameters.Damage * creature.CreatureData.GrenadeDamageMult);
		// 			parameters.IsPlayerFire = creature is Player;
		// 			SingletonMonoBehaviour<ExplosionFactory>.Instance.CreateExplosion(explosion.Position, parameters, visualParameters, creature).ExplodeNow();
		// 			if (visualParameters.ExpSoundBank != null)
		// 			{
		// 				SingletonMonoBehaviour<SoundController>.Instance.PlaySound(vector, visualParameters.ExpSoundBank);
		// 			}
		// 		}
		// 		_cacheEntities.ScheduleDestroy(e);
		// 	});
		IL_0000: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
		IL_0005: callvirt instance class MGSC.FilterQuery MGSC.Entities::Filter()
		IL_000a: ldsfld class MGSC.RefEntityAction`1<valuetype MGSC.ExplosionRequest> MGSC.HitResolveSystem/'<>c'::'<>9__11_0'
		IL_000f: dup
		IL_0010: brtrue.s IL_0029

		// (no C# code)
		IL_0012: pop
		IL_0013: ldsfld class MGSC.HitResolveSystem/'<>c' MGSC.HitResolveSystem/'<>c'::'<>9'
		IL_0018: ldftn instance void MGSC.HitResolveSystem/'<>c'::'<ProcessExplosion>b__11_0'(int32, valuetype MGSC.ExplosionRequest&)
		IL_001e: newobj instance void class MGSC.RefEntityAction`1<valuetype MGSC.ExplosionRequest>::.ctor(object, native int)
		IL_0023: dup
		IL_0024: stsfld class MGSC.RefEntityAction`1<valuetype MGSC.ExplosionRequest> MGSC.HitResolveSystem/'<>c'::'<>9__11_0'

		// }
		IL_0029: callvirt instance void MGSC.FilterQuery::ForEach<valuetype MGSC.ExplosionRequest>(class MGSC.RefEntityAction`1<!!0>)
		IL_002e: ret
	} // end of method HitResolveSystem::ProcessExplosion

	.method private hidebysig static 
		void ProcessObstaclePierce () cil managed 
	{
		// Method begins at RVA 0x8287e
		// Header size: 1
		// Code size: 57 (0x39)
		.maxstack 8

		// 	_cacheEntities.Filter().With<CollisionWithObstacle>().Without<CollisionWithWall>()
		// 		.ForEach(delegate(int entity, ref HitEvent hitEvent)
		// 		{
		// 			if (_cacheEntities.IsAlive(hitEvent.ProjEntityId) && !hitEvent.WasMiss)
		// 			{
		// 				ref CollisionWithObstacle reference = ref _cacheEntities.GetRef<CollisionWithObstacle>(entity);
		// 				float num = _cacheEntities.GetRef<ProjectileRuntimeData>(hitEvent.ProjEntityId).PierceChance - reference.PierceBlock;
		// 				hitEvent.WasPierced = reference.PierceBlock == 0f || Random.Range(0f, 1f) < num;
		// 				if (!hitEvent.WasPierced)
		// 				{
		// 					_cacheEntities.ScheduleDestroy(hitEvent.ProjEntityId);
		// 				}
		// 			}
		// 		});
		IL_0000: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
		IL_0005: callvirt instance class MGSC.FilterQuery MGSC.Entities::Filter()
		IL_000a: callvirt instance class MGSC.FilterQuery MGSC.FilterQuery::With<valuetype MGSC.CollisionWithObstacle>()
		IL_000f: callvirt instance class MGSC.FilterQuery MGSC.FilterQuery::Without<valuetype MGSC.CollisionWithWall>()
		IL_0014: ldsfld class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> MGSC.HitResolveSystem/'<>c'::'<>9__12_0'
		IL_0019: dup
		IL_001a: brtrue.s IL_0033

		// (no C# code)
		IL_001c: pop
		IL_001d: ldsfld class MGSC.HitResolveSystem/'<>c' MGSC.HitResolveSystem/'<>c'::'<>9'
		IL_0022: ldftn instance void MGSC.HitResolveSystem/'<>c'::'<ProcessObstaclePierce>b__12_0'(int32, valuetype MGSC.HitEvent&)
		IL_0028: newobj instance void class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent>::.ctor(object, native int)
		IL_002d: dup
		IL_002e: stsfld class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> MGSC.HitResolveSystem/'<>c'::'<>9__12_0'

		// }
		IL_0033: callvirt instance void MGSC.FilterQuery::ForEach<valuetype MGSC.HitEvent>(class MGSC.RefEntityAction`1<!!0>)
		IL_0038: ret
	} // end of method HitResolveSystem::ProcessObstaclePierce

	.method private hidebysig static 
		void ProcessCreaturePierce () cil managed 
	{
		// Method begins at RVA 0x828b8
		// Header size: 1
		// Code size: 57 (0x39)
		.maxstack 8

		// 	_cacheEntities.Filter().With<CollisionWithCreature>().Without<CollisionWithWall>()
		// 		.ForEach(delegate(int entity, ref HitEvent hitEvent)
		// 		{
		// 			if (!_cacheEntities.IsAlive(hitEvent.ProjEntityId))
		// 			{
		// 				_cacheEntities.ScheduleDestroy(entity);
		// 			}
		// 			else if (!hitEvent.WasMiss)
		// 			{
		// 				ref ProjectileRuntimeData reference = ref _cacheEntities.GetRef<ProjectileRuntimeData>(hitEvent.ProjEntityId);
		// 				hitEvent.WasPierced = Random.Range(0f, 1f) < reference.PierceChance;
		// 				if (!hitEvent.WasPierced)
		// 				{
		// 					_cacheEntities.ScheduleDestroy(hitEvent.ProjEntityId);
		// 				}
		// 			}
		// 		});
		IL_0000: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
		IL_0005: callvirt instance class MGSC.FilterQuery MGSC.Entities::Filter()
		IL_000a: callvirt instance class MGSC.FilterQuery MGSC.FilterQuery::With<valuetype MGSC.CollisionWithCreature>()
		IL_000f: callvirt instance class MGSC.FilterQuery MGSC.FilterQuery::Without<valuetype MGSC.CollisionWithWall>()
		IL_0014: ldsfld class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> MGSC.HitResolveSystem/'<>c'::'<>9__13_0'
		IL_0019: dup
		IL_001a: brtrue.s IL_0033

		// (no C# code)
		IL_001c: pop
		IL_001d: ldsfld class MGSC.HitResolveSystem/'<>c' MGSC.HitResolveSystem/'<>c'::'<>9'
		IL_0022: ldftn instance void MGSC.HitResolveSystem/'<>c'::'<ProcessCreaturePierce>b__13_0'(int32, valuetype MGSC.HitEvent&)
		IL_0028: newobj instance void class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent>::.ctor(object, native int)
		IL_002d: dup
		IL_002e: stsfld class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> MGSC.HitResolveSystem/'<>c'::'<>9__13_0'

		// }
		IL_0033: callvirt instance void MGSC.FilterQuery::ForEach<valuetype MGSC.HitEvent>(class MGSC.RefEntityAction`1<!!0>)
		IL_0038: ret
	} // end of method HitResolveSystem::ProcessCreaturePierce

	.method private hidebysig static 
		void CreateDamageRequest () cil managed 
	{
		// Method begins at RVA 0x828f2
		// Header size: 1
		// Code size: 47 (0x2f)
		.maxstack 8

		// 	_cacheEntities.Filter().ForEach(delegate(int entity, ref HitEvent hitEvent)
		// 	{
		// 		if (!hitEvent.WasMiss)
		// 		{
		// 			int entity2 = _cacheEntities.CreateEntity();
		// 			DamageRequest comp = new DamageRequest
		// 			{
		// 				OwnerUid = hitEvent.OwnerUid,
		// 				Position = hitEvent.HitPosition,
		// 				ProjEntityId = hitEvent.ProjEntityId
		// 			};
		// 			if (_cacheEntities.Has<CollisionWithCreature>(entity))
		// 			{
		// 				comp.TargetUid = _cacheEntities.GetRef<CollisionWithCreature>(entity).CreatureUid;
		// 				comp.Dodge = hitEvent.TargetDodge;
		// 				_cacheEntities.Add(entity2, comp);
		// 				_cacheEntities.Add(entity2, new DamageRequestCreature
		// 				{
		// 					TargetNameTagId = hitEvent.TargetNameTagId,
		// 					CreatureTargetAlliance = hitEvent.CreatureTargetAlliance
		// 				});
		// 			}
		// 			else if (_cacheEntities.Has<CollisionWithObstacle>(entity))
		// 			{
		// 				comp.TargetObstacleUid = _cacheEntities.GetRef<CollisionWithObstacle>(entity).ObstacleUid;
		// 				_cacheEntities.Add(entity2, comp);
		// 				_cacheEntities.Add(entity2, default(DamageRequestObstacle));
		// 			}
		// 			else
		// 			{
		// 				_cacheEntities.Add(entity2, comp);
		// 				_cacheEntities.Add(entity2, default(DamageRequestWall));
		// 			}
		// 		}
		// 	});
		IL_0000: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
		IL_0005: callvirt instance class MGSC.FilterQuery MGSC.Entities::Filter()
		IL_000a: ldsfld class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> MGSC.HitResolveSystem/'<>c'::'<>9__14_0'
		IL_000f: dup
		IL_0010: brtrue.s IL_0029

		// (no C# code)
		IL_0012: pop
		IL_0013: ldsfld class MGSC.HitResolveSystem/'<>c' MGSC.HitResolveSystem/'<>c'::'<>9'
		IL_0018: ldftn instance void MGSC.HitResolveSystem/'<>c'::'<CreateDamageRequest>b__14_0'(int32, valuetype MGSC.HitEvent&)
		IL_001e: newobj instance void class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent>::.ctor(object, native int)
		IL_0023: dup
		IL_0024: stsfld class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> MGSC.HitResolveSystem/'<>c'::'<>9__14_0'

		// }
		IL_0029: callvirt instance void MGSC.FilterQuery::ForEach<valuetype MGSC.HitEvent>(class MGSC.RefEntityAction`1<!!0>)
		IL_002e: ret
	} // end of method HitResolveSystem::CreateDamageRequest

	.method private hidebysig static 
		void TempHitEventCleaner () cil managed 
	{
		// Method begins at RVA 0x82922
		// Header size: 1
		// Code size: 47 (0x2f)
		.maxstack 8

		// 	_cacheEntities.Filter().ForEach(delegate(int entity, ref HitEvent _)
		// 	{
		// 		_cacheEntities.ScheduleDestroy(entity);
		// 	});
		IL_0000: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
		IL_0005: callvirt instance class MGSC.FilterQuery MGSC.Entities::Filter()
		IL_000a: ldsfld class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> MGSC.HitResolveSystem/'<>c'::'<>9__15_0'
		IL_000f: dup
		IL_0010: brtrue.s IL_0029

		// (no C# code)
		IL_0012: pop
		IL_0013: ldsfld class MGSC.HitResolveSystem/'<>c' MGSC.HitResolveSystem/'<>c'::'<>9'
		IL_0018: ldftn instance void MGSC.HitResolveSystem/'<>c'::'<TempHitEventCleaner>b__15_0'(int32, valuetype MGSC.HitEvent&)
		IL_001e: newobj instance void class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent>::.ctor(object, native int)
		IL_0023: dup
		IL_0024: stsfld class MGSC.RefEntityAction`1<valuetype MGSC.HitEvent> MGSC.HitResolveSystem/'<>c'::'<>9__15_0'

		// }
		IL_0029: callvirt instance void MGSC.FilterQuery::ForEach<valuetype MGSC.HitEvent>(class MGSC.RefEntityAction`1<!!0>)
		IL_002e: ret
	} // end of method HitResolveSystem::TempHitEventCleaner

} // end of class MGSC.HitResolveSystem
