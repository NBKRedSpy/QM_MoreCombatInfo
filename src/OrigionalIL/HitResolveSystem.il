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
			// Method begins at RVA 0x17bd8a
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
			// Method begins at RVA 0x17bd96
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
			// Method begins at RVA 0x17bda0
			// Header size: 12
			// Code size: 541 (0x21d)
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
				[9] class MGSC.Creature,
				[10] valuetype MGSC.Door/DoorState
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
			IL_0094: brfalse IL_01a5

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
			IL_00bc: brfalse IL_0181

			IL_00c1: ldloc.2
			IL_00c2: callvirt instance bool MGSC.ObstacleHealth::get_IsDestroyed()
			IL_00c7: brtrue IL_0181

			// CellPosition position = mapObstacle.Position;
			IL_00cc: ldloc.1
			IL_00cd: callvirt instance valuetype MGSC.CellPosition MGSC.MapObstacle::get_Position()
			IL_00d2: stloc.s 6
			// CellPosition position2 = player.CreatureData.Position;
			IL_00d4: ldloc.s 5
			IL_00d6: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_00db: ldfld valuetype MGSC.CellPosition MGSC.CreatureData::Position
			// int num3 = position2.X - position.X;
			IL_00e0: dup
			IL_00e1: ldfld int32 MGSC.CellPosition::X
			IL_00e6: ldloc.s 6
			IL_00e8: ldfld int32 MGSC.CellPosition::X
			IL_00ed: sub
			IL_00ee: stloc.s 7
			// int num4 = position2.Y - position.Y;
			IL_00f0: ldfld int32 MGSC.CellPosition::Y
			IL_00f5: ldloc.s 6
			IL_00f7: ldfld int32 MGSC.CellPosition::Y
			IL_00fc: sub
			IL_00fd: stloc.s 8
			// if ((num3 | num4) != 0 && Mathf.Abs(num3) <= 1 && Mathf.Abs(num4) <= 1)
			IL_00ff: ldloc.s 7
			IL_0101: ldloc.s 8
			IL_0103: or
			IL_0104: brfalse.s IL_013a

			IL_0106: ldloc.s 7
			IL_0108: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::Abs(int32)
			IL_010d: ldc.i4.1
			IL_010e: bgt.s IL_013a

			IL_0110: ldloc.s 8
			IL_0112: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::Abs(int32)
			IL_0117: ldc.i4.1
			IL_0118: bgt.s IL_013a

			// num += player.CreatureData.CoverHitChanceBonus;
			IL_011a: ldloc.3
			IL_011b: ldloc.s 5
			IL_011d: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_0122: ldfld int32 MGSC.CreatureData::CoverHitChanceBonus
			IL_0127: add
			IL_0128: stloc.3
			// num2 += player.CreatureData.CoverBlockChanceBonus;
			IL_0129: ldloc.s 4
			IL_012b: ldloc.s 5
			IL_012d: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_0132: ldfld int32 MGSC.CreatureData::CoverBlockChanceBonus
			IL_0137: add
			IL_0138: stloc.s 4

			// Creature creature = _cacheCreatures.GetCreature(hitEvent.OwnerUid);
			IL_013a: ldsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
			IL_013f: ldarg.2
			IL_0140: ldfld int32 MGSC.HitEvent::OwnerUid
			IL_0145: callvirt instance class MGSC.Creature MGSC.Creatures::GetCreature(int32)
			IL_014a: stloc.s 9
			// if (player == creature)
			IL_014c: ldloc.s 5
			IL_014e: ldloc.s 9
			IL_0150: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0155: brfalse.s IL_0181

			// num += player.Mercenary.CurseData.CoverPierceBlockResist;
			IL_0157: ldloc.3
			IL_0158: ldloc.s 5
			IL_015a: callvirt instance class MGSC.Mercenary MGSC.Player::get_Mercenary()
			IL_015f: ldfld class MGSC.CurseData MGSC.Mercenary::CurseData
			IL_0164: ldfld int32 MGSC.CurseData::CoverPierceBlockResist
			IL_0169: add
			IL_016a: stloc.3
			// num2 += player.Mercenary.CurseData.CoverPierceBlockResist;
			IL_016b: ldloc.s 4
			IL_016d: ldloc.s 5
			IL_016f: callvirt instance class MGSC.Mercenary MGSC.Player::get_Mercenary()
			IL_0174: ldfld class MGSC.CurseData MGSC.Mercenary::CurseData
			IL_0179: ldfld int32 MGSC.CurseData::CoverPierceBlockResist
			IL_017e: add
			IL_017f: stloc.s 4

			// hitEvent.WasMiss = Random.Range(1, 101) >= num;
			IL_0181: ldarg.2
			IL_0182: ldc.i4.1
			IL_0183: ldc.i4.s 101
			IL_0185: call int32 [UnityEngine.CoreModule]UnityEngine.Random::Range(int32, int32)
			IL_018a: ldloc.3
			IL_018b: clt
			IL_018d: ldc.i4.0
			IL_018e: ceq
			IL_0190: stfld bool MGSC.HitEvent::WasMiss
			// reference.PierceBlock = (float)num2 * 0.01f;
			IL_0195: ldloc.0
			IL_0196: ldloc.s 4
			IL_0198: conv.r4
			IL_0199: ldc.r4 0.01
			IL_019e: mul
			IL_019f: stfld float32 MGSC.CollisionWithObstacle::PierceBlock
			// if (!(mapObstacle.Door != null))
			IL_01a4: ret

			IL_01a5: ldloc.1
			IL_01a6: callvirt instance class MGSC.Door MGSC.MapObstacle::get_Door()
			IL_01ab: ldnull
			IL_01ac: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_01b1: brfalse.s IL_021c

			// hitEvent.WasMiss = false;
			IL_01b3: ldarg.2
			IL_01b4: ldc.i4.0
			IL_01b5: stfld bool MGSC.HitEvent::WasMiss
			// if (mapObstacle.Door.CanBePierced)
			IL_01ba: ldloc.1
			IL_01bb: callvirt instance class MGSC.Door MGSC.MapObstacle::get_Door()
			IL_01c0: ldfld bool MGSC.Door::CanBePierced
			IL_01c5: brfalse.s IL_01d3

			// reference.PierceBlock = 0f;
			IL_01c7: ldloc.0
			IL_01c8: ldc.r4 0.0
			IL_01cd: stfld float32 MGSC.CollisionWithObstacle::PierceBlock
			// switch (mapObstacle.Door.State)
			IL_01d2: ret

			IL_01d3: ldloc.1
			IL_01d4: callvirt instance class MGSC.Door MGSC.MapObstacle::get_Door()
			IL_01d9: callvirt instance valuetype MGSC.Door/DoorState MGSC.Door::get_State()
			IL_01de: stloc.s 10
			// (no C# code)
			IL_01e0: ldloc.s 10
			IL_01e2: switch (IL_0205, IL_0211, IL_0205, IL_01f9)

			// reference.PierceBlock = 0.5f;
			IL_01f7: br.s IL_0211

			IL_01f9: ldloc.0
			IL_01fa: ldc.r4 0.5
			IL_01ff: stfld float32 MGSC.CollisionWithObstacle::PierceBlock
			// break;
			IL_0204: ret

			// reference.PierceBlock = 1f;
			IL_0205: ldloc.0
			IL_0206: ldc.r4 1
			IL_020b: stfld float32 MGSC.CollisionWithObstacle::PierceBlock
			// break;
			IL_0210: ret

			// reference.PierceBlock = 0f;
			IL_0211: ldloc.0
			IL_0212: ldc.r4 0.0
			IL_0217: stfld float32 MGSC.CollisionWithObstacle::PierceBlock

			// break;
			IL_021c: ret
		} // end of method '<>c'::'<ProcessObstacleAccuracy>b__8_0'

		.method assembly hidebysig 
			instance void '<ProcessCreatureAccuracy>b__9_0' (
				int32 entity,
				valuetype MGSC.HitEvent& hitEvent
			) cil managed 
		{
			// Method begins at RVA 0x17bfcc
			// Header size: 12
			// Code size: 649 (0x289)
			.maxstack 9
			.locals init (
				[0] valuetype MGSC.Ballistic&,
				[1] valuetype MGSC.ProjectileRuntimeData&,
				[2] valuetype MGSC.CollisionWithCreature&,
				[3] class MGSC.Creature,
				[4] float32,
				[5] float32,
				[6] float32,
				[7] class MGSC.Creature,
				[8] int32,
				[9] valuetype MGSC.CellPosition,
				[10] valuetype MGSC.CellPosition,
				[11] valuetype [UnityEngine.CoreModule]UnityEngine.Vector2,
				[12] valuetype MGSC.Ballistic,
				[13] class MGSC.ProjectileView,
				[14] valuetype MGSC.SuppressTarget
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

			// ref Ballistic reference = ref _cacheEntities.GetRef<Ballistic>(hitEvent.ProjEntityId);
			IL_001e: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0023: ldarg.2
			IL_0024: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_0029: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.Ballistic>(int32)
			IL_002e: stloc.0
			// ref ProjectileRuntimeData reference2 = ref _cacheEntities.GetRef<ProjectileRuntimeData>(hitEvent.ProjEntityId);
			IL_002f: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0034: ldarg.2
			IL_0035: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_003a: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.ProjectileRuntimeData>(int32)
			IL_003f: stloc.1
			// ref CollisionWithCreature reference3 = ref _cacheEntities.GetRef<CollisionWithCreature>(entity);
			IL_0040: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0045: ldarg.1
			IL_0046: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.CollisionWithCreature>(int32)
			IL_004b: stloc.2
			// Creature creature = _cacheCreatures.GetCreature(reference3.CreatureUid);
			IL_004c: ldsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
			IL_0051: ldloc.2
			IL_0052: ldfld int32 MGSC.CollisionWithCreature::CreatureUid
			IL_0057: callvirt instance class MGSC.Creature MGSC.Creatures::GetCreature(int32)
			IL_005c: stloc.3
			// if (creature == null)
			IL_005d: ldloc.3
			IL_005e: ldnull
			IL_005f: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0064: brfalse.s IL_0072

			// _cacheEntities.ScheduleDestroy(entity);
			IL_0066: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_006b: ldarg.1
			IL_006c: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// if (creature.CreatureData.EffectsController.HasAnyEffect<ReflectShieldBuff>())
			IL_0071: ret

			IL_0072: ldloc.3
			IL_0073: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_0078: ldfld class MGSC.EffectsController MGSC.CreatureData::EffectsController
			IL_007d: callvirt instance bool MGSC.EffectsController::HasAnyEffect<class MGSC.ReflectShieldBuff>()
			IL_0082: brfalse IL_0159

			// int num = _cacheEntities.CreateEntity();
			IL_0087: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_008c: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_0091: stloc.s 8
			// CellPosition hitPosition = hitEvent.HitPosition;
			IL_0093: ldarg.2
			IL_0094: ldfld valuetype MGSC.CellPosition MGSC.HitEvent::HitPosition
			IL_0099: stloc.s 9
			// CellPosition initialPosition = reference.InitialPosition;
			IL_009b: ldloc.0
			IL_009c: ldfld valuetype MGSC.CellPosition MGSC.Ballistic::InitialPosition
			IL_00a1: stloc.s 10
			// Vector2 vector = _cacheMapRenderer.CoordsToPositionCenterPivot(hitPosition);
			IL_00a3: ldsfld class MGSC.MapRenderer MGSC.HitResolveSystem::_cacheMapRenderer
			IL_00a8: ldloc.s 9
			IL_00aa: callvirt instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector2 MGSC.MapRenderer::CoordsToPositionCenterPivot(valuetype MGSC.CellPosition)
			IL_00af: stloc.s 11
			// Ballistic comp = BallisticSystem.CreateBallistic(_cacheMapGrid, hitPosition, initialPosition, vector, reference2.Speed, 0f, reference.MaxDistance, 0, isPreciseTarget: true);
			IL_00b1: ldsfld class MGSC.MapGrid MGSC.HitResolveSystem::_cacheMapGrid
			IL_00b6: ldloc.s 9
			IL_00b8: ldloc.s 10
			IL_00ba: ldloc.s 11
			IL_00bc: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector2::op_Implicit(valuetype [UnityEngine.CoreModule]UnityEngine.Vector2)
			IL_00c1: ldloc.1
			IL_00c2: ldfld float32 MGSC.ProjectileRuntimeData::Speed
			IL_00c7: ldc.r4 0.0
			IL_00cc: ldloc.0
			IL_00cd: ldfld int32 MGSC.Ballistic::MaxDistance
			IL_00d2: ldc.i4.0
			IL_00d3: ldc.i4.1
			IL_00d4: call valuetype MGSC.Ballistic MGSC.BallisticSystem::CreateBallistic(class MGSC.MapGrid, valuetype MGSC.CellPosition, valuetype MGSC.CellPosition, valuetype [UnityEngine.CoreModule]UnityEngine.Vector3, float32, float32, int32, int32, bool)
			IL_00d9: stloc.s 12
			// comp.OwnerUid = hitEvent.OwnerUid;
			IL_00db: ldloca.s 12
			IL_00dd: ldarg.2
			IL_00de: ldfld int32 MGSC.HitEvent::OwnerUid
			IL_00e3: stfld int32 MGSC.Ballistic::OwnerUid
			// _cacheEntities.Add(num, comp);
			IL_00e8: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_00ed: ldloc.s 8
			IL_00ef: ldloc.s 12
			IL_00f1: callvirt instance void MGSC.Entities::Add<valuetype MGSC.Ballistic>(int32, !!0)
			// _cacheEntities.Add(num, reference2);
			IL_00f6: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_00fb: ldloc.s 8
			IL_00fd: ldloc.1
			IL_00fe: ldobj MGSC.ProjectileRuntimeData
			IL_0103: callvirt instance void MGSC.Entities::Add<valuetype MGSC.ProjectileRuntimeData>(int32, !!0)
			// ProjectileView bullet = (Data.Projectiles.GetRecord(SharedStringIds.Get(reference2.ProjectileId)).ContentDescriptor as ProjectileDescriptor).Bullet;
			IL_0108: call class MGSC.ConfigRecordCollection`1<class MGSC.ProjectileRecord> MGSC.Data::get_Projectiles()
			IL_010d: ldloc.1
			IL_010e: ldfld int32 MGSC.ProjectileRuntimeData::ProjectileId
			IL_0113: call string MGSC.SharedStringIds::Get(int32)
			IL_0118: ldc.i4.1
			IL_0119: callvirt instance !0 class MGSC.ConfigRecordCollection`1<class MGSC.ProjectileRecord>::GetRecord(string, bool)
			IL_011e: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Object MGSC.ConfigTableRecord::get_ContentDescriptor()
			IL_0123: isinst MGSC.ProjectileDescriptor
			IL_0128: callvirt instance class MGSC.ProjectileView MGSC.ProjectileDescriptor::get_Bullet()
			IL_012d: stloc.s 13
			// SingletonMonoBehaviour<BulletFactory>.Instance.SpawnBullet(vector, hitPosition, bullet, num);
			IL_012f: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.BulletFactory>::get_Instance()
			IL_0134: ldloc.s 11
			IL_0136: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector2::op_Implicit(valuetype [UnityEngine.CoreModule]UnityEngine.Vector2)
			IL_013b: ldloc.s 9
			IL_013d: ldloc.s 13
			IL_013f: ldloc.s 8
			IL_0141: ldnull
			IL_0142: callvirt instance class MGSC.ProjectileView MGSC.BulletFactory::SpawnBullet(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3, valuetype MGSC.CellPosition, class MGSC.ProjectileView, int32, class [mscorlib]System.Collections.Generic.List`1<valuetype MGSC.CellPosition>)
			IL_0147: pop
			// _cacheEntities.ScheduleDestroy(hitEvent.ProjEntityId);
			IL_0148: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_014d: ldarg.2
			IL_014e: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_0153: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// creature.ActivateAttackedTrigger(wasHit: false);
			IL_0158: ret

			IL_0159: ldloc.3
			IL_015a: ldc.i4.0
			IL_015b: callvirt instance void MGSC.Creature::ActivateAttackedTrigger(bool)
			// hitEvent.CreatureTargetAlliance = creature.CreatureData.CreatureAlliance;
			IL_0160: ldarg.2
			IL_0161: ldloc.3
			IL_0162: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_0167: ldfld valuetype MGSC.CreatureAlliance MGSC.CreatureData::CreatureAlliance
			IL_016c: stfld valuetype MGSC.CreatureAlliance MGSC.HitEvent::CreatureTargetAlliance
			// hitEvent.TargetNameTagId = SharedStringIds.Register(creature.CreatureData.LocalizationId);
			IL_0171: ldarg.2
			IL_0172: ldloc.3
			IL_0173: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_0178: ldfld string MGSC.CreatureData::LocalizationId
			IL_017d: call int32 MGSC.SharedStringIds::Register(string)
			IL_0182: stfld int32 MGSC.HitEvent::TargetNameTagId
			// hitEvent.TargetDodge = DamageSystem.GetProgressionDodge(creature, _cacheStatistics, _cacheDifficulty);
			IL_0187: ldarg.2
			IL_0188: ldloc.3
			IL_0189: ldsfld class MGSC.Statistics MGSC.HitResolveSystem::_cacheStatistics
			IL_018e: ldsfld class MGSC.Difficulty MGSC.HitResolveSystem::_cacheDifficulty
			IL_0193: call float32 MGSC.DamageSystem::GetProgressionDodge(class MGSC.Creature, class MGSC.Statistics, class MGSC.Difficulty)
			IL_0198: stfld float32 MGSC.HitEvent::TargetDodge
			// float value = reference2.Accuracy - hitEvent.TargetDodge;
			IL_019d: ldloc.1
			IL_019e: ldfld float32 MGSC.ProjectileRuntimeData::Accuracy
			IL_01a3: ldarg.2
			IL_01a4: ldfld float32 MGSC.HitEvent::TargetDodge
			IL_01a9: sub
			IL_01aa: stloc.s 4
			// float num2 = (reference2.IsMaxHitChance ? Data.Global.CapAccuracy : Mathf.Clamp(value, Data.Global.MinHitChance, Data.Global.CapAccuracy));
			IL_01ac: ldloc.1
			IL_01ad: ldfld bool MGSC.ProjectileRuntimeData::IsMaxHitChance
			IL_01b2: brtrue.s IL_01d1

			IL_01b4: ldloc.s 4
			IL_01b6: call class MGSC.GlobalSettings MGSC.Data::get_Global()
			IL_01bb: callvirt instance float32 MGSC.GlobalSettings::get_MinHitChance()
			IL_01c0: call class MGSC.GlobalSettings MGSC.Data::get_Global()
			IL_01c5: callvirt instance float32 MGSC.GlobalSettings::get_CapAccuracy()
			IL_01ca: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Clamp(float32, float32, float32)
			IL_01cf: br.s IL_01db

			// float num3 = Random.Range(0f, 1f);
			IL_01d1: call class MGSC.GlobalSettings MGSC.Data::get_Global()
			IL_01d6: callvirt instance float32 MGSC.GlobalSettings::get_CapAccuracy()

			IL_01db: stloc.s 5
			IL_01dd: ldc.r4 0.0
			IL_01e2: ldc.r4 1
			IL_01e7: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
			IL_01ec: stloc.s 6
			// hitEvent.WasMiss = num3 > num2;
			IL_01ee: ldarg.2
			IL_01ef: ldloc.s 6
			IL_01f1: ldloc.s 5
			IL_01f3: cgt
			IL_01f5: stfld bool MGSC.HitEvent::WasMiss
			// Creature creature2 = _cacheCreatures.GetCreature(hitEvent.OwnerUid);
			IL_01fa: ldsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
			IL_01ff: ldarg.2
			IL_0200: ldfld int32 MGSC.HitEvent::OwnerUid
			IL_0205: callvirt instance class MGSC.Creature MGSC.Creatures::GetCreature(int32)
			IL_020a: stloc.s 7
			// if (creature2 == null)
			IL_020c: ldloc.s 7
			IL_020e: ldnull
			IL_020f: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0214: brfalse.s IL_0217

			// if (!hitEvent.WasMiss)
			IL_0216: ret

			IL_0217: ldarg.2
			IL_0218: ldfld bool MGSC.HitEvent::WasMiss
			IL_021d: brtrue.s IL_023d

			// creature2.OnHit();
			IL_021f: ldloc.s 7
			IL_0221: callvirt instance void MGSC.Creature::OnHit()
			// creature.ActivateAttackedTrigger(wasHit: true);
			IL_0226: ldloc.3
			IL_0227: ldc.i4.1
			IL_0228: callvirt instance void MGSC.Creature::ActivateAttackedTrigger(bool)
			// if (!creature.IsSeenByPlayer)
			IL_022d: ldloc.3
			IL_022e: callvirt instance bool MGSC.Creature::get_IsSeenByPlayer()
			IL_0233: brtrue.s IL_0288

			// creature2.OnBlindHit();
			IL_0235: ldloc.s 7
			IL_0237: callvirt instance void MGSC.Creature::OnBlindHit()
			// if (reference2.SuppressedAccuracy > 0f)
			IL_023c: ret

			IL_023d: ldloc.1
			IL_023e: ldfld float32 MGSC.ProjectileRuntimeData::SuppressedAccuracy
			IL_0243: ldc.r4 0.0
			IL_0248: ble.un.s IL_0282

			// 		_cacheEntities.Add(_cacheEntities.CreateEntity(), new SuppressTarget
			// 		{
			// 			TargetUid = reference3.CreatureUid,
			// 			SuppressedAccuracy = reference2.SuppressedAccuracy
			// 		});
			IL_024a: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_024f: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0254: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_0259: ldloca.s 14
			IL_025b: initobj MGSC.SuppressTarget
			IL_0261: ldloca.s 14
			IL_0263: ldloc.2
			IL_0264: ldfld int32 MGSC.CollisionWithCreature::CreatureUid
			IL_0269: stfld int32 MGSC.SuppressTarget::TargetUid
			IL_026e: ldloca.s 14
			IL_0270: ldloc.1
			IL_0271: ldfld float32 MGSC.ProjectileRuntimeData::SuppressedAccuracy
			IL_0276: stfld float32 MGSC.SuppressTarget::SuppressedAccuracy
			IL_027b: ldloc.s 14
			// creature.ActivateDodgedTrigger();
			IL_027d: callvirt instance void MGSC.Entities::Add<valuetype MGSC.SuppressTarget>(int32, !!0)

			IL_0282: ldloc.3
			IL_0283: callvirt instance void MGSC.Creature::ActivateDodgedTrigger()

			// (no C# code)
			IL_0288: ret
		} // end of method '<>c'::'<ProcessCreatureAccuracy>b__9_0'

		.method assembly hidebysig 
			instance void '<CreateHitConsequences>b__10_0' (
				int32 entity,
				valuetype MGSC.HitEvent& hitEvent
			) cil managed 
		{
			// Method begins at RVA 0x17c264
			// Header size: 12
			// Code size: 908 (0x38c)
			.maxstack 9
			.locals init (
				[0] valuetype MGSC.Ballistic&,
				[1] valuetype MGSC.ProjectileRuntimeData&,
				[2] class MGSC.Creature,
				[3] string,
				[4] int32,
				[5] valuetype MGSC.PropagatesNoise,
				[6] valuetype MGSC.PropagatesNoise,
				[7] int32,
				[8] valuetype MGSC.ExplosionRequest,
				[9] int32,
				[10] int32,
				[11] int32,
				[12] valuetype MGSC.CollisionWithCreature&,
				[13] class MGSC.Creature,
				[14] int32,
				[15] valuetype MGSC.CellPosition,
				[16] valuetype MGSC.CellPosition,
				[17] valuetype [UnityEngine.CoreModule]UnityEngine.Vector2,
				[18] valuetype MGSC.Ballistic,
				[19] class MGSC.ProjectileView,
				[20] int32,
				[21] valuetype MGSC.PropagatesNoise
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
			// ref Ballistic reference = ref _cacheEntities.GetRef<Ballistic>(hitEvent.ProjEntityId);
			IL_0033: ret

			IL_0034: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0039: ldarg.2
			IL_003a: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_003f: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.Ballistic>(int32)
			IL_0044: stloc.0
			// ref ProjectileRuntimeData reference2 = ref _cacheEntities.GetRef<ProjectileRuntimeData>(hitEvent.ProjEntityId);
			IL_0045: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_004a: ldarg.2
			IL_004b: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_0050: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.ProjectileRuntimeData>(int32)
			IL_0055: stloc.1
			// Creature creature = _cacheCreatures.GetCreature(hitEvent.OwnerUid);
			IL_0056: ldsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
			IL_005b: ldarg.2
			IL_005c: ldfld int32 MGSC.HitEvent::OwnerUid
			IL_0061: callvirt instance class MGSC.Creature MGSC.Creatures::GetCreature(int32)
			IL_0066: stloc.2
			// if (creature != null)
			IL_0067: ldloc.2
			IL_0068: ldnull
			IL_0069: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_006e: brfalse IL_033f

			// if (PerkSystem.GetPerkParameterSumFloat(creature.CreatureData, "FNoiseSuppression") < Random.Range(0f, 1f))
			IL_0073: ldloc.2
			IL_0074: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_0079: ldstr "FNoiseSuppression"
			IL_007e: ldc.i4.0
			IL_007f: ldc.i4.0
			IL_0080: call float32 MGSC.PerkSystem::GetPerkParameterSumFloat(class MGSC.CreatureData, string, valuetype MGSC.WeaponClass, valuetype MGSC.WeaponSubClass)
			IL_0085: ldc.r4 0.0
			IL_008a: ldc.r4 1
			IL_008f: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
			IL_0094: bge.un.s IL_00e2

			// int entity2 = _cacheEntities.CreateEntity();
			IL_0096: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_009b: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_00a0: stloc.s 4
			// 			PropagatesNoise comp = new PropagatesNoise
			// 			{
			// 				NoiseType = 2,
			// 				Position = hitEvent.PreviousPosition,
			// 				Radius = Data.Global.AggroGunshotRadius
			// 			};
			IL_00a2: ldloca.s 6
			IL_00a4: initobj MGSC.PropagatesNoise
			IL_00aa: ldloca.s 6
			IL_00ac: ldc.i4.2
			IL_00ad: stfld int32 MGSC.PropagatesNoise::NoiseType
			IL_00b2: ldloca.s 6
			IL_00b4: ldarg.2
			IL_00b5: ldfld valuetype MGSC.CellPosition MGSC.HitEvent::PreviousPosition
			IL_00ba: stfld valuetype MGSC.CellPosition MGSC.PropagatesNoise::Position
			IL_00bf: ldloca.s 6
			IL_00c1: call class MGSC.GlobalSettings MGSC.Data::get_Global()
			IL_00c6: callvirt instance int32 MGSC.GlobalSettings::get_AggroGunshotRadius()
			IL_00cb: stfld int32 MGSC.PropagatesNoise::Radius
			// _cacheEntities.Add(entity2, comp);
			IL_00d0: ldloc.s 6
			IL_00d2: stloc.s 5
			IL_00d4: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_00d9: ldloc.s 4
			IL_00db: ldloc.s 5
			IL_00dd: callvirt instance void MGSC.Entities::Add<valuetype MGSC.PropagatesNoise>(int32, !!0)

			// if (reference2.HasShrapnelExplosion)
			IL_00e2: ldloc.1
			IL_00e3: ldfld bool MGSC.ProjectileRuntimeData::HasShrapnelExplosion
			IL_00e8: brfalse.s IL_0133

			// int entity3 = _cacheEntities.CreateEntity();
			IL_00ea: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_00ef: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_00f4: stloc.s 7
			// 			_cacheEntities.Add(entity3, new ExplosionRequest
			// 			{
			// 				Position = hitEvent.HitPosition,
			// 				ExplosionTypeId = reference2.ShrapnelExplId,
			// 				OwnerUid = hitEvent.OwnerUid
			// 			});
			IL_00f6: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_00fb: ldloc.s 7
			IL_00fd: ldloca.s 8
			IL_00ff: initobj MGSC.ExplosionRequest
			IL_0105: ldloca.s 8
			IL_0107: ldarg.2
			IL_0108: ldfld valuetype MGSC.CellPosition MGSC.HitEvent::HitPosition
			IL_010d: stfld valuetype MGSC.CellPosition MGSC.ExplosionRequest::Position
			IL_0112: ldloca.s 8
			IL_0114: ldloc.1
			IL_0115: ldfld int32 MGSC.ProjectileRuntimeData::ShrapnelExplId
			IL_011a: stfld int32 MGSC.ExplosionRequest::ExplosionTypeId
			IL_011f: ldloca.s 8
			IL_0121: ldarg.2
			IL_0122: ldfld int32 MGSC.HitEvent::OwnerUid
			IL_0127: stfld int32 MGSC.ExplosionRequest::OwnerUid
			IL_012c: ldloc.s 8
			// if (ItemTraitSystem.TryGetValue<string>(creature.CreatureData.Inventory.CurrentWeapon.Comp<WeaponComponent>().OverridenAmmo.Traits, "SExplosive", out var value))
			IL_012e: callvirt instance void MGSC.Entities::Add<valuetype MGSC.ExplosionRequest>(int32, !!0)

			IL_0133: ldloc.2
			IL_0134: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_0139: ldfld class MGSC.Inventory MGSC.CreatureData::Inventory
			IL_013e: callvirt instance class MGSC.BasePickupItem MGSC.Inventory::get_CurrentWeapon()
			IL_0143: callvirt instance !!0 MGSC.BasePickupItem::Comp<class MGSC.WeaponComponent>()
			IL_0148: callvirt instance class MGSC.AmmoRecord MGSC.WeaponComponent::get_OverridenAmmo()
			IL_014d: callvirt instance class [mscorlib]System.Collections.Generic.List`1<string> MGSC.AmmoRecord::get_Traits()
			IL_0152: ldstr "SExplosive"
			IL_0157: ldloca.s 3
			IL_0159: call bool MGSC.ItemTraitSystem::TryGetValue<string>(class [mscorlib]System.Collections.Generic.List`1<string>, string, !!0&)
			IL_015e: brfalse.s IL_01ad

			// int entity4 = _cacheEntities.CreateEntity();
			IL_0160: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0165: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_016a: stloc.s 9
			// int explosionTypeId = SharedStringIds.Register(value);
			IL_016c: ldloc.3
			IL_016d: call int32 MGSC.SharedStringIds::Register(string)
			IL_0172: stloc.s 10
			// 			_cacheEntities.Add(entity4, new ExplosionRequest
			// 			{
			// 				Position = hitEvent.HitPosition,
			// 				ExplosionTypeId = explosionTypeId,
			// 				OwnerUid = hitEvent.OwnerUid
			// 			});
			IL_0174: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0179: ldloc.s 9
			IL_017b: ldloca.s 8
			IL_017d: initobj MGSC.ExplosionRequest
			IL_0183: ldloca.s 8
			IL_0185: ldarg.2
			IL_0186: ldfld valuetype MGSC.CellPosition MGSC.HitEvent::HitPosition
			IL_018b: stfld valuetype MGSC.CellPosition MGSC.ExplosionRequest::Position
			IL_0190: ldloca.s 8
			IL_0192: ldloc.s 10
			IL_0194: stfld int32 MGSC.ExplosionRequest::ExplosionTypeId
			IL_0199: ldloca.s 8
			IL_019b: ldarg.2
			IL_019c: ldfld int32 MGSC.HitEvent::OwnerUid
			IL_01a1: stfld int32 MGSC.ExplosionRequest::OwnerUid
			IL_01a6: ldloc.s 8
			// if (reference2.ProjectileExplosionChance > 0f && reference2.ProjectileExplosionChance > Random.Range(0f, 1f))
			IL_01a8: callvirt instance void MGSC.Entities::Add<valuetype MGSC.ExplosionRequest>(int32, !!0)

			IL_01ad: ldloc.1
			IL_01ae: ldfld float32 MGSC.ProjectileRuntimeData::ProjectileExplosionChance
			IL_01b3: ldc.r4 0.0
			IL_01b8: ble.un.s IL_021a

			IL_01ba: ldloc.1
			IL_01bb: ldfld float32 MGSC.ProjectileRuntimeData::ProjectileExplosionChance
			IL_01c0: ldc.r4 0.0
			IL_01c5: ldc.r4 1
			IL_01ca: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
			IL_01cf: ble.un.s IL_021a

			// int entity5 = _cacheEntities.CreateEntity();
			IL_01d1: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_01d6: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_01db: stloc.s 11
			// 			_cacheEntities.Add(entity5, new ExplosionRequest
			// 			{
			// 				Position = hitEvent.HitPosition,
			// 				ExplosionTypeId = reference2.ProjectileExplosionId,
			// 				OwnerUid = hitEvent.OwnerUid
			// 			});
			IL_01dd: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_01e2: ldloc.s 11
			IL_01e4: ldloca.s 8
			IL_01e6: initobj MGSC.ExplosionRequest
			IL_01ec: ldloca.s 8
			IL_01ee: ldarg.2
			IL_01ef: ldfld valuetype MGSC.CellPosition MGSC.HitEvent::HitPosition
			IL_01f4: stfld valuetype MGSC.CellPosition MGSC.ExplosionRequest::Position
			IL_01f9: ldloca.s 8
			IL_01fb: ldloc.1
			IL_01fc: ldfld int32 MGSC.ProjectileRuntimeData::ProjectileExplosionId
			IL_0201: stfld int32 MGSC.ExplosionRequest::ExplosionTypeId
			IL_0206: ldloca.s 8
			IL_0208: ldarg.2
			IL_0209: ldfld int32 MGSC.HitEvent::OwnerUid
			IL_020e: stfld int32 MGSC.ExplosionRequest::OwnerUid
			IL_0213: ldloc.s 8
			// if (_cacheEntities.Has<CollisionWithCreature>(entity))
			IL_0215: callvirt instance void MGSC.Entities::Add<valuetype MGSC.ExplosionRequest>(int32, !!0)

			IL_021a: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_021f: ldarg.1
			IL_0220: callvirt instance bool MGSC.Entities::Has<valuetype MGSC.CollisionWithCreature>(int32)
			IL_0225: brfalse IL_038b

			// ref CollisionWithCreature reference3 = ref _cacheEntities.GetRef<CollisionWithCreature>(entity);
			IL_022a: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_022f: ldarg.1
			IL_0230: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.CollisionWithCreature>(int32)
			IL_0235: stloc.s 12
			// Creature creature2 = _cacheCreatures.GetCreature(reference3.CreatureUid);
			IL_0237: ldsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
			IL_023c: ldloc.s 12
			IL_023e: ldfld int32 MGSC.CollisionWithCreature::CreatureUid
			IL_0243: callvirt instance class MGSC.Creature MGSC.Creatures::GetCreature(int32)
			IL_0248: stloc.s 13
			// if (creature2 != null && creature2.CreatureData.EffectsController.HasAnyEffect<BloodMirrorBuff>())
			IL_024a: ldloc.s 13
			IL_024c: ldnull
			IL_024d: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0252: brfalse IL_038b

			IL_0257: ldloc.s 13
			IL_0259: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_025e: ldfld class MGSC.EffectsController MGSC.CreatureData::EffectsController
			IL_0263: callvirt instance bool MGSC.EffectsController::HasAnyEffect<class MGSC.BloodMirrorBuff>()
			IL_0268: brfalse IL_038b

			// int num = _cacheEntities.CreateEntity();
			IL_026d: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0272: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_0277: stloc.s 14
			// CellPosition hitPosition = hitEvent.HitPosition;
			IL_0279: ldarg.2
			IL_027a: ldfld valuetype MGSC.CellPosition MGSC.HitEvent::HitPosition
			IL_027f: stloc.s 15
			// CellPosition initialPosition = reference.InitialPosition;
			IL_0281: ldloc.0
			IL_0282: ldfld valuetype MGSC.CellPosition MGSC.Ballistic::InitialPosition
			IL_0287: stloc.s 16
			// Vector2 vector = _cacheMapRenderer.CoordsToPositionCenterPivot(hitPosition);
			IL_0289: ldsfld class MGSC.MapRenderer MGSC.HitResolveSystem::_cacheMapRenderer
			IL_028e: ldloc.s 15
			IL_0290: callvirt instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector2 MGSC.MapRenderer::CoordsToPositionCenterPivot(valuetype MGSC.CellPosition)
			IL_0295: stloc.s 17
			// Ballistic comp2 = BallisticSystem.CreateBallistic(_cacheMapGrid, hitPosition, initialPosition, vector, reference2.Speed, 0f, reference.MaxDistance, 0, isPreciseTarget: true);
			IL_0297: ldsfld class MGSC.MapGrid MGSC.HitResolveSystem::_cacheMapGrid
			IL_029c: ldloc.s 15
			IL_029e: ldloc.s 16
			IL_02a0: ldloc.s 17
			IL_02a2: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector2::op_Implicit(valuetype [UnityEngine.CoreModule]UnityEngine.Vector2)
			IL_02a7: ldloc.1
			IL_02a8: ldfld float32 MGSC.ProjectileRuntimeData::Speed
			IL_02ad: ldc.r4 0.0
			IL_02b2: ldloc.0
			IL_02b3: ldfld int32 MGSC.Ballistic::MaxDistance
			IL_02b8: ldc.i4.0
			IL_02b9: ldc.i4.1
			IL_02ba: call valuetype MGSC.Ballistic MGSC.BallisticSystem::CreateBallistic(class MGSC.MapGrid, valuetype MGSC.CellPosition, valuetype MGSC.CellPosition, valuetype [UnityEngine.CoreModule]UnityEngine.Vector3, float32, float32, int32, int32, bool)
			IL_02bf: stloc.s 18
			// comp2.OwnerUid = hitEvent.OwnerUid;
			IL_02c1: ldloca.s 18
			IL_02c3: ldarg.2
			IL_02c4: ldfld int32 MGSC.HitEvent::OwnerUid
			IL_02c9: stfld int32 MGSC.Ballistic::OwnerUid
			// _cacheEntities.Add(num, comp2);
			IL_02ce: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_02d3: ldloc.s 14
			IL_02d5: ldloc.s 18
			IL_02d7: callvirt instance void MGSC.Entities::Add<valuetype MGSC.Ballistic>(int32, !!0)
			// _cacheEntities.Add(num, reference2);
			IL_02dc: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_02e1: ldloc.s 14
			IL_02e3: ldloc.1
			IL_02e4: ldobj MGSC.ProjectileRuntimeData
			IL_02e9: callvirt instance void MGSC.Entities::Add<valuetype MGSC.ProjectileRuntimeData>(int32, !!0)
			// ProjectileView bullet = (Data.Projectiles.GetRecord(SharedStringIds.Get(reference2.ProjectileId)).ContentDescriptor as ProjectileDescriptor).Bullet;
			IL_02ee: call class MGSC.ConfigRecordCollection`1<class MGSC.ProjectileRecord> MGSC.Data::get_Projectiles()
			IL_02f3: ldloc.1
			IL_02f4: ldfld int32 MGSC.ProjectileRuntimeData::ProjectileId
			IL_02f9: call string MGSC.SharedStringIds::Get(int32)
			IL_02fe: ldc.i4.1
			IL_02ff: callvirt instance !0 class MGSC.ConfigRecordCollection`1<class MGSC.ProjectileRecord>::GetRecord(string, bool)
			IL_0304: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Object MGSC.ConfigTableRecord::get_ContentDescriptor()
			IL_0309: isinst MGSC.ProjectileDescriptor
			IL_030e: callvirt instance class MGSC.ProjectileView MGSC.ProjectileDescriptor::get_Bullet()
			IL_0313: stloc.s 19
			// SingletonMonoBehaviour<BulletFactory>.Instance.SpawnBullet(vector, hitPosition, bullet, num);
			IL_0315: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.BulletFactory>::get_Instance()
			IL_031a: ldloc.s 17
			IL_031c: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector2::op_Implicit(valuetype [UnityEngine.CoreModule]UnityEngine.Vector2)
			IL_0321: ldloc.s 15
			IL_0323: ldloc.s 19
			IL_0325: ldloc.s 14
			IL_0327: ldnull
			IL_0328: callvirt instance class MGSC.ProjectileView MGSC.BulletFactory::SpawnBullet(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3, valuetype MGSC.CellPosition, class MGSC.ProjectileView, int32, class [mscorlib]System.Collections.Generic.List`1<valuetype MGSC.CellPosition>)
			IL_032d: pop
			// _cacheEntities.ScheduleDestroy(hitEvent.ProjEntityId);
			IL_032e: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0333: ldarg.2
			IL_0334: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_0339: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// int entity6 = _cacheEntities.CreateEntity();
			IL_033e: ret

			IL_033f: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0344: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_0349: stloc.s 20
			// 		PropagatesNoise comp3 = new PropagatesNoise
			// 		{
			// 			NoiseType = 2,
			// 			Position = hitEvent.PreviousPosition,
			// 			Radius = Data.Global.AggroGunshotRadius
			// 		};
			IL_034b: ldloca.s 6
			IL_034d: initobj MGSC.PropagatesNoise
			IL_0353: ldloca.s 6
			IL_0355: ldc.i4.2
			IL_0356: stfld int32 MGSC.PropagatesNoise::NoiseType
			IL_035b: ldloca.s 6
			IL_035d: ldarg.2
			IL_035e: ldfld valuetype MGSC.CellPosition MGSC.HitEvent::PreviousPosition
			IL_0363: stfld valuetype MGSC.CellPosition MGSC.PropagatesNoise::Position
			IL_0368: ldloca.s 6
			IL_036a: call class MGSC.GlobalSettings MGSC.Data::get_Global()
			IL_036f: callvirt instance int32 MGSC.GlobalSettings::get_AggroGunshotRadius()
			IL_0374: stfld int32 MGSC.PropagatesNoise::Radius
			// _cacheEntities.Add(entity6, comp3);
			IL_0379: ldloc.s 6
			IL_037b: stloc.s 21
			IL_037d: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0382: ldloc.s 20
			IL_0384: ldloc.s 21
			IL_0386: callvirt instance void MGSC.Entities::Add<valuetype MGSC.PropagatesNoise>(int32, !!0)

			// (no C# code)
			IL_038b: ret
		} // end of method '<>c'::'<CreateHitConsequences>b__10_0'

		.method assembly hidebysig 
			instance void '<ProcessExplosion>b__11_0' (
				int32 e,
				valuetype MGSC.ExplosionRequest& explosion
			) cil managed 
		{
			// Method begins at RVA 0x17c5fc
			// Header size: 12
			// Code size: 422 (0x1a6)
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
			IL_0075: callvirt instance valuetype MGSC.MapCellType MGSC.MapCell::get_Type()
			IL_007a: ldc.i4.5
			IL_007b: beq IL_019a

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
			// if (creature == null)
			IL_0114: ldloc.s 6
			IL_0116: ldnull
			IL_0117: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_011c: brfalse.s IL_011f

			// return;
			IL_011e: ret

			// ExplosionEntity.ExplosionParameters parameters = record.Parameters;
			IL_011f: ldloc.1
			IL_0120: callvirt instance valuetype MGSC.ExplosionEntity/ExplosionParameters MGSC.ExplosionRecord::get_Parameters()
			IL_0125: stloc.s 7
			// parameters.Damage = Mathf.RoundToInt((float)parameters.Damage * creature.CreatureData.GrenadeDamageMult);
			IL_0127: ldloca.s 7
			IL_0129: ldloc.s 7
			IL_012b: ldfld int32 MGSC.ExplosionEntity/ExplosionParameters::Damage
			IL_0130: conv.r4
			IL_0131: ldloc.s 6
			IL_0133: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_0138: ldfld float32 MGSC.CreatureData::GrenadeDamageMult
			IL_013d: mul
			IL_013e: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::RoundToInt(float32)
			IL_0143: stfld int32 MGSC.ExplosionEntity/ExplosionParameters::Damage
			// parameters.IsPlayerFire = creature is Player;
			IL_0148: ldloca.s 7
			IL_014a: ldloc.s 6
			IL_014c: isinst MGSC.Player
			IL_0151: ldnull
			IL_0152: cgt.un
			IL_0154: stfld bool MGSC.ExplosionEntity/ExplosionParameters::IsPlayerFire
			// SingletonMonoBehaviour<ExplosionFactory>.Instance.CreateExplosion(explosion.Position, parameters, visualParameters, creature).ExplodeNow();
			IL_0159: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.ExplosionFactory>::get_Instance()
			IL_015e: ldarg.2
			IL_015f: ldfld valuetype MGSC.CellPosition MGSC.ExplosionRequest::Position
			IL_0164: ldloc.s 7
			IL_0166: ldloc.3
			IL_0167: ldloc.s 6
			IL_0169: callvirt instance class MGSC.ExplosionEntity MGSC.ExplosionFactory::CreateExplosion(valuetype MGSC.CellPosition, valuetype MGSC.ExplosionEntity/ExplosionParameters, valuetype MGSC.ExplosionEntity/ExplosionVisualParameters, class MGSC.Creature)
			IL_016e: callvirt instance void MGSC.ExplosionEntity::ExplodeNow()
			// if (visualParameters.ExpSoundBank != null)
			IL_0173: ldloc.3
			IL_0174: ldfld class MGSC.SoundBank MGSC.ExplosionEntity/ExplosionVisualParameters::ExpSoundBank
			IL_0179: ldnull
			IL_017a: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_017f: brfalse.s IL_019a

			// SingletonMonoBehaviour<SoundController>.Instance.PlaySound(vector, visualParameters.ExpSoundBank);
			IL_0181: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
			IL_0186: ldloc.s 5
			IL_0188: ldloc.3
			IL_0189: ldfld class MGSC.SoundBank MGSC.ExplosionEntity/ExplosionVisualParameters::ExpSoundBank
			IL_018e: ldc.i4.0
			IL_018f: ldc.i4.0
			IL_0190: ldc.r4 0.0
			IL_0195: callvirt instance void MGSC.SoundController::PlaySound(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3, class MGSC.SoundBank, bool, bool, float32)

			// _cacheEntities.ScheduleDestroy(e);
			IL_019a: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_019f: ldarg.1
			IL_01a0: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// }
			IL_01a5: ret
		} // end of method '<>c'::'<ProcessExplosion>b__11_0'

		.method assembly hidebysig 
			instance void '<ProcessObstaclePierce>b__12_0' (
				int32 entity,
				valuetype MGSC.HitEvent& hitEvent
			) cil managed 
		{
			// Method begins at RVA 0x17c7b0
			// Header size: 12
			// Code size: 270 (0x10e)
			.maxstack 5
			.locals init (
				[0] valuetype MGSC.CollisionWithObstacle&,
				[1] valuetype MGSC.ProjectileRuntimeData&,
				[2] float32,
				[3] string,
				[4] class MGSC.MapObstacle,
				[5] class MGSC.BasePickupItem
			)

			// if (!_cacheEntities.IsAlive(hitEvent.ProjEntityId) || hitEvent.WasMiss)
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
			// ref ProjectileRuntimeData reference2 = ref _cacheEntities.GetRef<ProjectileRuntimeData>(hitEvent.ProjEntityId);
			IL_0028: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_002d: ldarg.2
			IL_002e: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_0033: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.ProjectileRuntimeData>(int32)
			IL_0038: stloc.1
			// float num = reference2.PierceChance - reference.PierceBlock;
			IL_0039: ldloc.1
			IL_003a: ldfld float32 MGSC.ProjectileRuntimeData::PierceChance
			IL_003f: ldloc.0
			IL_0040: ldfld float32 MGSC.CollisionWithObstacle::PierceBlock
			IL_0045: sub
			IL_0046: stloc.2
			// hitEvent.WasPierced = reference.PierceBlock == 0f || Random.Range(0f, 1f) < num;
			IL_0047: ldarg.2
			IL_0048: ldloc.0
			IL_0049: ldfld float32 MGSC.CollisionWithObstacle::PierceBlock
			IL_004e: ldc.r4 0.0
			IL_0053: beq.s IL_0069

			IL_0055: ldc.r4 0.0
			IL_005a: ldc.r4 1
			IL_005f: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
			IL_0064: ldloc.2
			IL_0065: clt
			IL_0067: br.s IL_006a

			IL_0069: ldc.i4.1

			IL_006a: stfld bool MGSC.HitEvent::WasPierced
			// if (hitEvent.WasPierced)
			IL_006f: ldarg.2
			IL_0070: ldfld bool MGSC.HitEvent::WasPierced
			IL_0075: brfalse.s IL_0078

			// if (reference2.AmmoId != 0)
			IL_0077: ret

			IL_0078: ldloc.1
			IL_0079: ldfld int32 MGSC.ProjectileRuntimeData::AmmoId
			IL_007e: brfalse.s IL_00fd

			// string itemId = SharedStringIds.Get(reference2.AmmoId);
			IL_0080: ldloc.1
			IL_0081: ldfld int32 MGSC.ProjectileRuntimeData::AmmoId
			IL_0086: call string MGSC.SharedStringIds::Get(int32)
			IL_008b: stloc.3
			// MapObstacle mapObstacle = _cacheMapObstacles.Get(reference.ObstacleUid);
			IL_008c: ldsfld class MGSC.MapObstacles MGSC.HitResolveSystem::_cacheMapObstacles
			IL_0091: ldloc.0
			IL_0092: ldfld int32 MGSC.CollisionWithObstacle::ObstacleUid
			IL_0097: callvirt instance class MGSC.MapObstacle MGSC.MapObstacles::Get(int32)
			IL_009c: stloc.s 4
			// if (mapObstacle != null && mapObstacle.Store != null && mapObstacle.Store.AbsorbBullets)
			IL_009e: ldloc.s 4
			IL_00a0: ldnull
			IL_00a1: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_00a6: brfalse.s IL_00fd

			IL_00a8: ldloc.s 4
			IL_00aa: callvirt instance class MGSC.Store MGSC.MapObstacle::get_Store()
			IL_00af: ldnull
			IL_00b0: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_00b5: brfalse.s IL_00fd

			// BasePickupItem basePickupItem = SingletonMonoBehaviour<ItemFactory>.Instance.CreateForInventory(itemId);
			IL_00b7: ldloc.s 4
			IL_00b9: callvirt instance class MGSC.Store MGSC.MapObstacle::get_Store()
			IL_00be: callvirt instance bool MGSC.Store::get_AbsorbBullets()
			IL_00c3: brfalse.s IL_00fd

			IL_00c5: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.ItemFactory>::get_Instance()
			IL_00ca: ldloc.3
			IL_00cb: ldc.i4.0
			IL_00cc: callvirt instance class MGSC.BasePickupItem MGSC.ItemFactory::CreateForInventory(string, bool)
			IL_00d1: stloc.s 5
			// basePickupItem.StackCount = 1;
			IL_00d3: ldloc.s 5
			IL_00d5: ldc.i4.1
			IL_00d6: callvirt instance void MGSC.BasePickupItem::set_StackCount(int16)
			// mapObstacle.Store.storage.TryPutItem(basePickupItem, CellPosition.Zero);
			IL_00db: ldloc.s 4
			IL_00dd: callvirt instance class MGSC.Store MGSC.MapObstacle::get_Store()
			IL_00e2: ldfld class MGSC.ItemStorage MGSC.Store::'storage'
			IL_00e7: ldloc.s 5
			IL_00e9: ldsfld valuetype MGSC.CellPosition MGSC.CellPosition::Zero
			IL_00ee: ldc.i4.0
			IL_00ef: ldc.i4.1
			IL_00f0: callvirt instance bool MGSC.ItemStorage::TryPutItem(class MGSC.BasePickupItem, valuetype MGSC.CellPosition, bool, bool)
			IL_00f5: pop
			// mapObstacle.RefreshVisual();
			IL_00f6: ldloc.s 4
			IL_00f8: callvirt instance void MGSC.MapObstacle::RefreshVisual()

			// _cacheEntities.ScheduleDestroy(hitEvent.ProjEntityId);
			IL_00fd: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0102: ldarg.2
			IL_0103: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_0108: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// (no C# code)
			IL_010d: ret
		} // end of method '<>c'::'<ProcessObstaclePierce>b__12_0'

		.method assembly hidebysig 
			instance void '<ProcessCreaturePierce>b__13_0' (
				int32 entity,
				valuetype MGSC.HitEvent& hitEvent
			) cil managed 
		{
			// Method begins at RVA 0x17c8cc
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
			// Method begins at RVA 0x17c948
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
			// Method begins at RVA 0x17ca74
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
		// Method begins at RVA 0xb8500
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
		// Method begins at RVA 0xb858c
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
		// 						Creature creature = _cacheCreatures.GetCreature(hitEvent.OwnerUid);
		// 						if (player == creature)
		// 						{
		// 							num += player.Mercenary.CurseData.CoverPierceBlockResist;
		// 							num2 += player.Mercenary.CurseData.CoverPierceBlockResist;
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
		// Method begins at RVA 0xb85c1
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
		// 			ref Ballistic reference = ref _cacheEntities.GetRef<Ballistic>(hitEvent.ProjEntityId);
		// 			ref ProjectileRuntimeData reference2 = ref _cacheEntities.GetRef<ProjectileRuntimeData>(hitEvent.ProjEntityId);
		// 			ref CollisionWithCreature reference3 = ref _cacheEntities.GetRef<CollisionWithCreature>(entity);
		// 			Creature creature = _cacheCreatures.GetCreature(reference3.CreatureUid);
		// 			if (creature == null)
		// 			{
		// 				_cacheEntities.ScheduleDestroy(entity);
		// 			}
		// 			else if (creature.CreatureData.EffectsController.HasAnyEffect<ReflectShieldBuff>())
		// 			{
		// 				int num = _cacheEntities.CreateEntity();
		// 				CellPosition hitPosition = hitEvent.HitPosition;
		// 				CellPosition initialPosition = reference.InitialPosition;
		// 				Vector2 vector = _cacheMapRenderer.CoordsToPositionCenterPivot(hitPosition);
		// 				Ballistic comp = BallisticSystem.CreateBallistic(_cacheMapGrid, hitPosition, initialPosition, vector, reference2.Speed, 0f, reference.MaxDistance, 0, isPreciseTarget: true);
		// 				comp.OwnerUid = hitEvent.OwnerUid;
		// 				_cacheEntities.Add(num, comp);
		// 				_cacheEntities.Add(num, reference2);
		// 				ProjectileView bullet = (Data.Projectiles.GetRecord(SharedStringIds.Get(reference2.ProjectileId)).ContentDescriptor as ProjectileDescriptor).Bullet;
		// 				SingletonMonoBehaviour<BulletFactory>.Instance.SpawnBullet(vector, hitPosition, bullet, num);
		// 				_cacheEntities.ScheduleDestroy(hitEvent.ProjEntityId);
		// 			}
		// 			else
		// 			{
		// 				creature.ActivateAttackedTrigger(wasHit: false);
		// 				hitEvent.CreatureTargetAlliance = creature.CreatureData.CreatureAlliance;
		// 				hitEvent.TargetNameTagId = SharedStringIds.Register(creature.CreatureData.LocalizationId);
		// 				hitEvent.TargetDodge = DamageSystem.GetProgressionDodge(creature, _cacheStatistics, _cacheDifficulty);
		// 				float value = reference2.Accuracy - hitEvent.TargetDodge;
		// 				float num2 = (reference2.IsMaxHitChance ? Data.Global.CapAccuracy : Mathf.Clamp(value, Data.Global.MinHitChance, Data.Global.CapAccuracy));
		// 				float num3 = Random.Range(0f, 1f);
		// 				hitEvent.WasMiss = num3 > num2;
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
		// 						if (reference2.SuppressedAccuracy > 0f)
		// 						{
		// 							_cacheEntities.Add(_cacheEntities.CreateEntity(), new SuppressTarget
		// 							{
		// 								TargetUid = reference3.CreatureUid,
		// 								SuppressedAccuracy = reference2.SuppressedAccuracy
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
		// Method begins at RVA 0xb85f6
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
		// 				ref Ballistic reference = ref _cacheEntities.GetRef<Ballistic>(hitEvent.ProjEntityId);
		// 				ref ProjectileRuntimeData reference2 = ref _cacheEntities.GetRef<ProjectileRuntimeData>(hitEvent.ProjEntityId);
		// 				Creature creature = _cacheCreatures.GetCreature(hitEvent.OwnerUid);
		// 				if (creature != null)
		// 				{
		// 					if (PerkSystem.GetPerkParameterSumFloat(creature.CreatureData, "FNoiseSuppression") < Random.Range(0f, 1f))
		// 					{
		// 						int entity2 = _cacheEntities.CreateEntity();
		// 						PropagatesNoise comp = new PropagatesNoise
		// 						{
		// 							NoiseType = 2,
		// 							Position = hitEvent.PreviousPosition,
		// 							Radius = Data.Global.AggroGunshotRadius
		// 						};
		// 						_cacheEntities.Add(entity2, comp);
		// 					}
		// 					if (reference2.HasShrapnelExplosion)
		// 					{
		// 						int entity3 = _cacheEntities.CreateEntity();
		// 						_cacheEntities.Add(entity3, new ExplosionRequest
		// 						{
		// 							Position = hitEvent.HitPosition,
		// 							ExplosionTypeId = reference2.ShrapnelExplId,
		// 							OwnerUid = hitEvent.OwnerUid
		// 						});
		// 					}
		// 					if (ItemTraitSystem.TryGetValue<string>(creature.CreatureData.Inventory.CurrentWeapon.Comp<WeaponComponent>().OverridenAmmo.Traits, "SExplosive", out var value))
		// 					{
		// 						int entity4 = _cacheEntities.CreateEntity();
		// 						int explosionTypeId = SharedStringIds.Register(value);
		// 						_cacheEntities.Add(entity4, new ExplosionRequest
		// 						{
		// 							Position = hitEvent.HitPosition,
		// 							ExplosionTypeId = explosionTypeId,
		// 							OwnerUid = hitEvent.OwnerUid
		// 						});
		// 					}
		// 					if (reference2.ProjectileExplosionChance > 0f && reference2.ProjectileExplosionChance > Random.Range(0f, 1f))
		// 					{
		// 						int entity5 = _cacheEntities.CreateEntity();
		// 						_cacheEntities.Add(entity5, new ExplosionRequest
		// 						{
		// 							Position = hitEvent.HitPosition,
		// 							ExplosionTypeId = reference2.ProjectileExplosionId,
		// 							OwnerUid = hitEvent.OwnerUid
		// 						});
		// 					}
		// 					if (_cacheEntities.Has<CollisionWithCreature>(entity))
		// 					{
		// 						ref CollisionWithCreature reference3 = ref _cacheEntities.GetRef<CollisionWithCreature>(entity);
		// 						Creature creature2 = _cacheCreatures.GetCreature(reference3.CreatureUid);
		// 						if (creature2 != null && creature2.CreatureData.EffectsController.HasAnyEffect<BloodMirrorBuff>())
		// 						{
		// 							int num = _cacheEntities.CreateEntity();
		// 							CellPosition hitPosition = hitEvent.HitPosition;
		// 							CellPosition initialPosition = reference.InitialPosition;
		// 							Vector2 vector = _cacheMapRenderer.CoordsToPositionCenterPivot(hitPosition);
		// 							Ballistic comp2 = BallisticSystem.CreateBallistic(_cacheMapGrid, hitPosition, initialPosition, vector, reference2.Speed, 0f, reference.MaxDistance, 0, isPreciseTarget: true);
		// 							comp2.OwnerUid = hitEvent.OwnerUid;
		// 							_cacheEntities.Add(num, comp2);
		// 							_cacheEntities.Add(num, reference2);
		// 							ProjectileView bullet = (Data.Projectiles.GetRecord(SharedStringIds.Get(reference2.ProjectileId)).ContentDescriptor as ProjectileDescriptor).Bullet;
		// 							SingletonMonoBehaviour<BulletFactory>.Instance.SpawnBullet(vector, hitPosition, bullet, num);
		// 							_cacheEntities.ScheduleDestroy(hitEvent.ProjEntityId);
		// 						}
		// 					}
		// 				}
		// 				else
		// 				{
		// 					int entity6 = _cacheEntities.CreateEntity();
		// 					PropagatesNoise comp3 = new PropagatesNoise
		// 					{
		// 						NoiseType = 2,
		// 						Position = hitEvent.PreviousPosition,
		// 						Radius = Data.Global.AggroGunshotRadius
		// 					};
		// 					_cacheEntities.Add(entity6, comp3);
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
		// Method begins at RVA 0xb8626
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
		// 			if (creature == null)
		// 			{
		// 				return;
		// 			}
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
		// Method begins at RVA 0xb8656
		// Header size: 1
		// Code size: 57 (0x39)
		.maxstack 8

		// 	_cacheEntities.Filter().With<CollisionWithObstacle>().Without<CollisionWithWall>()
		// 		.ForEach(delegate(int entity, ref HitEvent hitEvent)
		// 		{
		// 			if (_cacheEntities.IsAlive(hitEvent.ProjEntityId) && !hitEvent.WasMiss)
		// 			{
		// 				ref CollisionWithObstacle reference = ref _cacheEntities.GetRef<CollisionWithObstacle>(entity);
		// 				ref ProjectileRuntimeData reference2 = ref _cacheEntities.GetRef<ProjectileRuntimeData>(hitEvent.ProjEntityId);
		// 				float num = reference2.PierceChance - reference.PierceBlock;
		// 				hitEvent.WasPierced = reference.PierceBlock == 0f || Random.Range(0f, 1f) < num;
		// 				if (!hitEvent.WasPierced)
		// 				{
		// 					if (reference2.AmmoId != 0)
		// 					{
		// 						string itemId = SharedStringIds.Get(reference2.AmmoId);
		// 						MapObstacle mapObstacle = _cacheMapObstacles.Get(reference.ObstacleUid);
		// 						if (mapObstacle != null && mapObstacle.Store != null && mapObstacle.Store.AbsorbBullets)
		// 						{
		// 							BasePickupItem basePickupItem = SingletonMonoBehaviour<ItemFactory>.Instance.CreateForInventory(itemId);
		// 							basePickupItem.StackCount = 1;
		// 							mapObstacle.Store.storage.TryPutItem(basePickupItem, CellPosition.Zero);
		// 							mapObstacle.RefreshVisual();
		// 						}
		// 					}
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
		// Method begins at RVA 0xb8690
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
		// Method begins at RVA 0xb86ca
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
		// Method begins at RVA 0xb86fa
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
