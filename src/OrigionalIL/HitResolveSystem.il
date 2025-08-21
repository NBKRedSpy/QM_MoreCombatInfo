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
			// Method begins at RVA 0x132c72
			// Header size: 1
			// Code size: 11 (0xb)
			.maxstack 8

			// 	<>9 = new <>c();
			IL_0000: newobj instance void MGSC.HitResolveSystem/'<>c'::.ctor()
			IL_0005: stsfld class MGSC.HitResolveSystem/'<>c' MGSC.HitResolveSystem/'<>c'::'<>9'
			// }
			IL_000a: ret
		} // end of method '<>c'::.cctor

		.method public hidebysig specialname rtspecialname 
			instance void .ctor () cil managed 
		{
			// Method begins at RVA 0x132c7e
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
			// Method begins at RVA 0x132c88
			// Header size: 12
			// Code size: 313 (0x139)
			.maxstack 3
			.locals init (
				[0] valuetype MGSC.CollisionWithObstacle&,
				[1] class MGSC.MapObstacle,
				[2] class MGSC.ObstacleHealth,
				[3] valuetype MGSC.Door/DoorState
			)

			// 	if (!_cacheEntities.IsAlive(hitEvent.ProjEntityId))
			IL_0000: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0005: ldarg.2
			IL_0006: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_000b: callvirt instance bool MGSC.Entities::IsAlive(int32)
			IL_0010: brtrue.s IL_001e

			// 		_cacheEntities.ScheduleDestroy(entity);
			IL_0012: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0017: ldarg.1
			IL_0018: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// }
			IL_001d: ret

			// 	ref CollisionWithObstacle reference = ref _cacheEntities.GetRef<CollisionWithObstacle>(entity);
			IL_001e: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0023: ldarg.1
			IL_0024: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.CollisionWithObstacle>(int32)
			IL_0029: stloc.0
			// 	MapObstacle mapObstacle = _cacheMapObstacles.Get(reference.ObstacleUid);
			IL_002a: ldsfld class MGSC.MapObstacles MGSC.HitResolveSystem::_cacheMapObstacles
			IL_002f: ldloc.0
			IL_0030: ldfld int32 MGSC.CollisionWithObstacle::ObstacleUid
			IL_0035: callvirt instance class MGSC.MapObstacle MGSC.MapObstacles::Get(int32)
			IL_003a: stloc.1
			// 	if (mapObstacle == null)
			IL_003b: ldloc.1
			IL_003c: ldnull
			IL_003d: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0042: brfalse.s IL_0050

			// 		_cacheEntities.ScheduleDestroy(entity);
			IL_0044: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0049: ldarg.1
			IL_004a: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// 	if (mapObstacle.Door != null && (mapObstacle.Door.State == Door.DoorState.Opened || mapObstacle.Door.State == Door.DoorState.Remains))
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

			// 		_cacheEntities.ScheduleDestroy(entity);
			IL_007a: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_007f: ldarg.1
			IL_0080: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// 	ObstacleHealth obstacleHealth = mapObstacle.ObstacleHealth;
			IL_0085: ret

			IL_0086: ldloc.1
			IL_0087: callvirt instance class MGSC.ObstacleHealth MGSC.MapObstacle::get_ObstacleHealth()
			IL_008c: stloc.2
			// 	if (obstacleHealth != null)
			IL_008d: ldloc.2
			IL_008e: ldnull
			IL_008f: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0094: brfalse.s IL_00c3

			// 		hitEvent.WasMiss = Random.Range(1, 101) >= obstacleHealth.HitChanceOnShoot;
			IL_0096: ldarg.2
			IL_0097: ldc.i4.1
			IL_0098: ldc.i4.s 101
			IL_009a: call int32 [UnityEngine.CoreModule]UnityEngine.Random::Range(int32, int32)
			IL_009f: ldloc.2
			IL_00a0: callvirt instance int32 MGSC.ObstacleHealth::get_HitChanceOnShoot()
			IL_00a5: clt
			IL_00a7: ldc.i4.0
			IL_00a8: ceq
			IL_00aa: stfld bool MGSC.HitEvent::WasMiss
			// 		reference.PierceBlock = (float)obstacleHealth.BlockChance * 0.01f;
			IL_00af: ldloc.0
			IL_00b0: ldloc.2
			IL_00b1: callvirt instance int32 MGSC.ObstacleHealth::get_BlockChance()
			IL_00b6: conv.r4
			IL_00b7: ldc.r4 0.01
			IL_00bc: mul
			IL_00bd: stfld float32 MGSC.CollisionWithObstacle::PierceBlock
			// 		if (!(mapObstacle.Door != null))
			IL_00c2: ret

			IL_00c3: ldloc.1
			IL_00c4: callvirt instance class MGSC.Door MGSC.MapObstacle::get_Door()
			IL_00c9: ldnull
			IL_00ca: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_00cf: brfalse.s IL_0138

			// 		hitEvent.WasMiss = false;
			IL_00d1: ldarg.2
			IL_00d2: ldc.i4.0
			IL_00d3: stfld bool MGSC.HitEvent::WasMiss
			// 		if (mapObstacle.Door.CanBePierced)
			IL_00d8: ldloc.1
			IL_00d9: callvirt instance class MGSC.Door MGSC.MapObstacle::get_Door()
			IL_00de: ldfld bool MGSC.Door::CanBePierced
			IL_00e3: brfalse.s IL_00f1

			// 			reference.PierceBlock = 0f;
			IL_00e5: ldloc.0
			IL_00e6: ldc.r4 0.0
			IL_00eb: stfld float32 MGSC.CollisionWithObstacle::PierceBlock
			// 		switch (mapObstacle.Door.State)
			IL_00f0: ret

			IL_00f1: ldloc.1
			IL_00f2: callvirt instance class MGSC.Door MGSC.MapObstacle::get_Door()
			IL_00f7: callvirt instance valuetype MGSC.Door/DoorState MGSC.Door::get_State()
			IL_00fc: stloc.3
			// (no C# code)
			IL_00fd: ldloc.3
			IL_00fe: switch (IL_0121, IL_012d, IL_0121, IL_0115)

			// 			reference.PierceBlock = 0.5f;
			IL_0113: br.s IL_012d

			IL_0115: ldloc.0
			IL_0116: ldc.r4 0.5
			IL_011b: stfld float32 MGSC.CollisionWithObstacle::PierceBlock
			// 			break;
			IL_0120: ret

			// 			reference.PierceBlock = 1f;
			IL_0121: ldloc.0
			IL_0122: ldc.r4 1
			IL_0127: stfld float32 MGSC.CollisionWithObstacle::PierceBlock
			// 			break;
			IL_012c: ret

			// 			reference.PierceBlock = 0f;
			IL_012d: ldloc.0
			IL_012e: ldc.r4 0.0
			IL_0133: stfld float32 MGSC.CollisionWithObstacle::PierceBlock

			// 			break;
			IL_0138: ret
		} // end of method '<>c'::'<ProcessObstacleAccuracy>b__8_0'

		.method assembly hidebysig 
			instance void '<ProcessCreatureAccuracy>b__9_0' (
				int32 entity,
				valuetype MGSC.HitEvent& hitEvent
			) cil managed 
		{
			// Method begins at RVA 0x132dd0
			// Header size: 12
			// Code size: 360 (0x168)
			.maxstack 4
			.locals init (
				[0] valuetype MGSC.ProjectileRuntimeData&,
				[1] valuetype MGSC.CollisionWithCreature&,
				[2] class MGSC.Creature,
				[3] float32,
				[4] float32,
				[5] class MGSC.Creature,
				[6] valuetype MGSC.SuppressTarget
			)

			// 	if (!_cacheEntities.IsAlive(hitEvent.ProjEntityId))
			IL_0000: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0005: ldarg.2
			IL_0006: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_000b: callvirt instance bool MGSC.Entities::IsAlive(int32)
			IL_0010: brtrue.s IL_001e

			// 		_cacheEntities.ScheduleDestroy(entity);
			IL_0012: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0017: ldarg.1
			IL_0018: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// }
			IL_001d: ret

			// 	ref ProjectileRuntimeData reference = ref _cacheEntities.GetRef<ProjectileRuntimeData>(hitEvent.ProjEntityId);
			IL_001e: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0023: ldarg.2
			IL_0024: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_0029: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.ProjectileRuntimeData>(int32)
			IL_002e: stloc.0
			// 	ref CollisionWithCreature reference2 = ref _cacheEntities.GetRef<CollisionWithCreature>(entity);
			IL_002f: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0034: ldarg.1
			IL_0035: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.CollisionWithCreature>(int32)
			IL_003a: stloc.1
			// 	Creature creature = _cacheCreatures.GetCreature(reference2.CreatureUid);
			IL_003b: ldsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
			IL_0040: ldloc.1
			IL_0041: ldfld int32 MGSC.CollisionWithCreature::CreatureUid
			IL_0046: callvirt instance class MGSC.Creature MGSC.Creatures::GetCreature(int32)
			IL_004b: stloc.2
			// 	if (creature == null)
			IL_004c: ldloc.2
			IL_004d: ldnull
			IL_004e: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0053: brfalse.s IL_0061

			// 		_cacheEntities.ScheduleDestroy(entity);
			IL_0055: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_005a: ldarg.1
			IL_005b: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// 	creature.ActivateAttackedTrigger(wasHit: false);
			IL_0060: ret

			IL_0061: ldloc.2
			IL_0062: ldc.i4.0
			IL_0063: callvirt instance void MGSC.Creature::ActivateAttackedTrigger(bool)
			// 	hitEvent.CreatureTargetAlliance = creature.CreatureData.CreatureAlliance;
			IL_0068: ldarg.2
			IL_0069: ldloc.2
			IL_006a: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_006f: ldfld valuetype MGSC.CreatureAlliance MGSC.CreatureData::CreatureAlliance
			IL_0074: stfld valuetype MGSC.CreatureAlliance MGSC.HitEvent::CreatureTargetAlliance
			// 	hitEvent.TargetNameTagId = SharedStringIds.Register(creature.CreatureData.LocalizationId);
			IL_0079: ldarg.2
			IL_007a: ldloc.2
			IL_007b: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_0080: ldfld string MGSC.CreatureData::LocalizationId
			IL_0085: call int32 MGSC.SharedStringIds::Register(string)
			IL_008a: stfld int32 MGSC.HitEvent::TargetNameTagId
			// 	hitEvent.TargetDodge = DamageSystem.GetProgressionDodge(creature, _cacheStatistics, _cacheDifficulty);
			IL_008f: ldarg.2
			IL_0090: ldloc.2
			IL_0091: ldsfld class MGSC.Statistics MGSC.HitResolveSystem::_cacheStatistics
			IL_0096: ldsfld class MGSC.Difficulty MGSC.HitResolveSystem::_cacheDifficulty
			IL_009b: call float32 MGSC.DamageSystem::GetProgressionDodge(class MGSC.Creature, class MGSC.Statistics, class MGSC.Difficulty)
			IL_00a0: stfld float32 MGSC.HitEvent::TargetDodge
			// 	float num = Mathf.Clamp(reference.Accuracy - hitEvent.TargetDodge, Data.Global.MinHitChance, Data.Global.CapAccuracy);
			IL_00a5: ldloc.0
			IL_00a6: ldfld float32 MGSC.ProjectileRuntimeData::Accuracy
			IL_00ab: ldarg.2
			IL_00ac: ldfld float32 MGSC.HitEvent::TargetDodge
			IL_00b1: sub
			IL_00b2: call class MGSC.GlobalSettings MGSC.Data::get_Global()
			IL_00b7: callvirt instance float32 MGSC.GlobalSettings::get_MinHitChance()
			IL_00bc: call class MGSC.GlobalSettings MGSC.Data::get_Global()
			IL_00c1: callvirt instance float32 MGSC.GlobalSettings::get_CapAccuracy()
			IL_00c6: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Clamp(float32, float32, float32)
			IL_00cb: stloc.3
			// 	float num2 = Random.Range(0f, 1f);
			IL_00cc: ldc.r4 0.0
			IL_00d1: ldc.r4 1
			IL_00d6: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
			IL_00db: stloc.s 4
			// 	hitEvent.WasMiss = num2 > num;
			IL_00dd: ldarg.2
			IL_00de: ldloc.s 4
			IL_00e0: ldloc.3
			IL_00e1: cgt
			IL_00e3: stfld bool MGSC.HitEvent::WasMiss
			// 	Creature creature2 = _cacheCreatures.GetCreature(hitEvent.OwnerUid);
			IL_00e8: ldsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
			IL_00ed: ldarg.2
			IL_00ee: ldfld int32 MGSC.HitEvent::OwnerUid
			IL_00f3: callvirt instance class MGSC.Creature MGSC.Creatures::GetCreature(int32)
			IL_00f8: stloc.s 5
			// 	if (creature2 == null)
			IL_00fa: ldloc.s 5
			IL_00fc: ldnull
			IL_00fd: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0102: brfalse.s IL_0105

			// 	if (!hitEvent.WasMiss)
			IL_0104: ret

			IL_0105: ldarg.2
			IL_0106: ldfld bool MGSC.HitEvent::WasMiss
			IL_010b: brtrue.s IL_011c

			// 		creature2.OnHit();
			IL_010d: ldloc.s 5
			IL_010f: callvirt instance void MGSC.Creature::OnHit()
			// 		creature.ActivateAttackedTrigger(wasHit: true);
			IL_0114: ldloc.2
			IL_0115: ldc.i4.1
			IL_0116: callvirt instance void MGSC.Creature::ActivateAttackedTrigger(bool)
			// 	if (reference.SuppressedAccuracy > 0f)
			IL_011b: ret

			IL_011c: ldloc.0
			IL_011d: ldfld float32 MGSC.ProjectileRuntimeData::SuppressedAccuracy
			IL_0122: ldc.r4 0.0
			IL_0127: ble.un.s IL_0161

			// 		_cacheEntities.Add(_cacheEntities.CreateEntity(), new SuppressTarget
			// 		{
			// 			TargetUid = reference2.CreatureUid,
			// 			SuppressedAccuracy = reference.SuppressedAccuracy
			// 		});
			IL_0129: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_012e: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0133: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_0138: ldloca.s 6
			IL_013a: initobj MGSC.SuppressTarget
			IL_0140: ldloca.s 6
			IL_0142: ldloc.1
			IL_0143: ldfld int32 MGSC.CollisionWithCreature::CreatureUid
			IL_0148: stfld int32 MGSC.SuppressTarget::TargetUid
			IL_014d: ldloca.s 6
			IL_014f: ldloc.0
			IL_0150: ldfld float32 MGSC.ProjectileRuntimeData::SuppressedAccuracy
			IL_0155: stfld float32 MGSC.SuppressTarget::SuppressedAccuracy
			IL_015a: ldloc.s 6
			// 	creature.ActivateDodgedTrigger();
			IL_015c: callvirt instance void MGSC.Entities::Add<valuetype MGSC.SuppressTarget>(int32, !!0)

			IL_0161: ldloc.2
			IL_0162: callvirt instance void MGSC.Creature::ActivateDodgedTrigger()
			// (no C# code)
			IL_0167: ret
		} // end of method '<>c'::'<ProcessCreatureAccuracy>b__9_0'

		.method assembly hidebysig 
			instance void '<CreateHitConsequences>b__10_0' (
				int32 entity,
				valuetype MGSC.HitEvent& hitEvent
			) cil managed 
		{
			// Method begins at RVA 0x132f44
			// Header size: 12
			// Code size: 213 (0xd5)
			.maxstack 4
			.locals init (
				[0] int32,
				[1] valuetype MGSC.PropagatesNoise,
				[2] class MGSC.Creature,
				[3] valuetype MGSC.PropagatesNoise,
				[4] string,
				[5] int32,
				[6] int32,
				[7] valuetype MGSC.ExplosionRequest
			)

			// 	if (!hitEvent.WasMiss)
			IL_0000: ldarg.2
			IL_0001: ldfld bool MGSC.HitEvent::WasMiss
			IL_0006: brfalse.s IL_0009

			// }
			IL_0008: ret

			// 		int entity2 = _cacheEntities.CreateEntity();
			IL_0009: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_000e: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_0013: stloc.0
			// 		PropagatesNoise comp = new PropagatesNoise
			// 		{
			// 			NoiseType = 1,
			// 			Position = hitEvent.PreviousPosition
			// 		};
			IL_0014: ldloca.s 3
			IL_0016: initobj MGSC.PropagatesNoise
			IL_001c: ldloca.s 3
			IL_001e: ldc.i4.1
			IL_001f: stfld int32 MGSC.PropagatesNoise::NoiseType
			IL_0024: ldloca.s 3
			IL_0026: ldarg.2
			IL_0027: ldfld valuetype MGSC.CellPosition MGSC.HitEvent::PreviousPosition
			IL_002c: stfld valuetype MGSC.CellPosition MGSC.PropagatesNoise::Position
			// 		_cacheEntities.Add(entity2, comp);
			IL_0031: ldloc.3
			IL_0032: stloc.1
			IL_0033: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0038: ldloc.0
			IL_0039: ldloc.1
			IL_003a: callvirt instance void MGSC.Entities::Add<valuetype MGSC.PropagatesNoise>(int32, !!0)
			// 		Creature creature = _cacheCreatures.GetCreature(hitEvent.OwnerUid);
			IL_003f: ldsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
			IL_0044: ldarg.2
			IL_0045: ldfld int32 MGSC.HitEvent::OwnerUid
			IL_004a: callvirt instance class MGSC.Creature MGSC.Creatures::GetCreature(int32)
			IL_004f: stloc.2
			// 		if (creature != null && ItemTraitSystem.TryGetValue<string>(creature.CreatureData.Inventory.CurrentWeapon.Comp<WeaponComponent>().OverridenAmmo.Traits, "SExplosive", out var value))
			IL_0050: ldloc.2
			IL_0051: ldnull
			IL_0052: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0057: brfalse.s IL_00d4

			IL_0059: ldloc.2
			IL_005a: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
			IL_005f: ldfld class MGSC.Inventory MGSC.CreatureData::Inventory
			IL_0064: callvirt instance class MGSC.BasePickupItem MGSC.Inventory::get_CurrentWeapon()
			IL_0069: callvirt instance !!0 MGSC.BasePickupItem::Comp<class MGSC.WeaponComponent>()
			IL_006e: callvirt instance class MGSC.AmmoRecord MGSC.WeaponComponent::get_OverridenAmmo()
			IL_0073: callvirt instance class [mscorlib]System.Collections.Generic.List`1<string> MGSC.AmmoRecord::get_Traits()
			IL_0078: ldstr "SExplosive"
			IL_007d: ldloca.s 4
			IL_007f: call bool MGSC.ItemTraitSystem::TryGetValue<string>(class [mscorlib]System.Collections.Generic.List`1<string>, string, !!0&)
			IL_0084: brfalse.s IL_00d4

			// 			int entity3 = _cacheEntities.CreateEntity();
			IL_0086: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_008b: callvirt instance int32 MGSC.Entities::CreateEntity()
			IL_0090: stloc.s 5
			// 			int explosionTypeId = SharedStringIds.Register(value);
			IL_0092: ldloc.s 4
			IL_0094: call int32 MGSC.SharedStringIds::Register(string)
			IL_0099: stloc.s 6
			// 			_cacheEntities.Add(entity3, new ExplosionRequest
			// 			{
			// 				Position = hitEvent.HitPosition,
			// 				ExplosionTypeId = explosionTypeId,
			// 				OwnerUid = hitEvent.OwnerUid
			// 			});
			IL_009b: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_00a0: ldloc.s 5
			// (no C# code)
			IL_00a2: ldloca.s 7
			IL_00a4: initobj MGSC.ExplosionRequest
			IL_00aa: ldloca.s 7
			IL_00ac: ldarg.2
			IL_00ad: ldfld valuetype MGSC.CellPosition MGSC.HitEvent::HitPosition
			IL_00b2: stfld valuetype MGSC.CellPosition MGSC.ExplosionRequest::Position
			IL_00b7: ldloca.s 7
			IL_00b9: ldloc.s 6
			IL_00bb: stfld int32 MGSC.ExplosionRequest::ExplosionTypeId
			IL_00c0: ldloca.s 7
			IL_00c2: ldarg.2
			IL_00c3: ldfld int32 MGSC.HitEvent::OwnerUid
			IL_00c8: stfld int32 MGSC.ExplosionRequest::OwnerUid
			IL_00cd: ldloc.s 7
			IL_00cf: callvirt instance void MGSC.Entities::Add<valuetype MGSC.ExplosionRequest>(int32, !!0)

			IL_00d4: ret
		} // end of method '<>c'::'<CreateHitConsequences>b__10_0'

		.method assembly hidebysig 
			instance void '<ProcessExplosion>b__11_0' (
				int32 e,
				valuetype MGSC.ExplosionRequest& explosion
			) cil managed 
		{
			// Method begins at RVA 0x133028
			// Header size: 12
			// Code size: 393 (0x189)
			.maxstack 6
			.locals init (
				[0] string,
				[1] class MGSC.ExplosionRecord,
				[2] class MGSC.ExplosionDescriptor,
				[3] valuetype MGSC.ExplosionEntity/ExplosionVisualParameters,
				[4] valuetype MGSC.ExplosionEntity/ExplosionVisualParameters,
				[5] valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
				[6] valuetype MGSC.ExplosionEntity/ExplosionParameters,
				[7] class [UnityEngine.CoreModule]UnityEngine.GameObject
			)

			// 	string id = SharedStringIds.Get(explosion.ExplosionTypeId);
			IL_0000: ldarg.2
			IL_0001: ldfld int32 MGSC.ExplosionRequest::ExplosionTypeId
			IL_0006: call string MGSC.SharedStringIds::Get(int32)
			IL_000b: stloc.0
			// 	ExplosionRecord record = Data.Explosions.GetRecord(id);
			IL_000c: call class MGSC.ConfigRecordCollection`1<class MGSC.ExplosionRecord> MGSC.Data::get_Explosions()
			IL_0011: ldloc.0
			IL_0012: ldc.i4.1
			IL_0013: callvirt instance !0 class MGSC.ConfigRecordCollection`1<class MGSC.ExplosionRecord>::GetRecord(string, bool)
			IL_0018: stloc.1
			// 	ExplosionDescriptor explosionDescriptor = record.ContentDescriptor as ExplosionDescriptor;
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
			// 	if (_cacheMapGrid.GetCell(explosion.Position).Type != MapCellType.Deep)
			IL_0061: ldloc.s 4
			IL_0063: stloc.3
			IL_0064: ldsfld class MGSC.MapGrid MGSC.HitResolveSystem::_cacheMapGrid
			IL_0069: ldarg.2
			IL_006a: ldfld valuetype MGSC.CellPosition MGSC.ExplosionRequest::Position
			IL_006f: ldc.i4.1
			IL_0070: callvirt instance class MGSC.MapCell MGSC.MapGrid::GetCell(valuetype MGSC.CellPosition, bool)
			IL_0075: ldfld valuetype MGSC.MapCellType MGSC.MapCell::Type
			IL_007a: ldc.i4.5
			IL_007b: beq IL_017d

			// 		Vector3 vector = _cacheMapRenderer.CoordsToPositionCenterPivot(explosion.Position);
			IL_0080: ldsfld class MGSC.MapRenderer MGSC.HitResolveSystem::_cacheMapRenderer
			IL_0085: ldarg.2
			IL_0086: ldfld valuetype MGSC.CellPosition MGSC.ExplosionRequest::Position
			IL_008b: callvirt instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector2 MGSC.MapRenderer::CoordsToPositionCenterPivot(valuetype MGSC.CellPosition)
			IL_0090: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector2::op_Implicit(valuetype [UnityEngine.CoreModule]UnityEngine.Vector2)
			IL_0095: stloc.s 5
			// 		if (record.Parameters.VisualExplosion)
			IL_0097: ldloc.1
			IL_0098: callvirt instance valuetype MGSC.ExplosionEntity/ExplosionParameters MGSC.ExplosionRecord::get_Parameters()
			IL_009d: ldfld bool MGSC.ExplosionEntity/ExplosionParameters::VisualExplosion
			IL_00a2: brfalse.s IL_0102

			// 			GameObject gameObject = Object.Instantiate(explosionDescriptor.explosion, SingletonMonoBehaviour<DungeonGameMode>.Instance.transform);
			IL_00a4: ldloc.2
			IL_00a5: ldfld class [UnityEngine.CoreModule]UnityEngine.GameObject MGSC.ExplosionDescriptor::explosion
			IL_00aa: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.DungeonGameMode>::get_Instance()
			IL_00af: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
			IL_00b4: call !!0 [UnityEngine.CoreModule]UnityEngine.Object::Instantiate<class [UnityEngine.CoreModule]UnityEngine.GameObject>(!!0, class [UnityEngine.CoreModule]UnityEngine.Transform)
			IL_00b9: stloc.s 7
			// 			gameObject.transform.position = vector + explosionDescriptor.visualExplosionOffset;
			IL_00bb: ldloc.s 7
			IL_00bd: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.GameObject::get_transform()
			IL_00c2: ldloc.s 5
			IL_00c4: ldloc.2
			IL_00c5: ldfld valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 MGSC.ExplosionDescriptor::visualExplosionOffset
			IL_00ca: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::op_Addition(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3, valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
			IL_00cf: callvirt instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
			// 			visualParameters.ExpLightUpdater = gameObject.GetComponentInChildren<ExplosionLightUpdater>(includeInactive: true);
			IL_00d4: ldloca.s 3
			IL_00d6: ldloc.s 7
			IL_00d8: ldc.i4.1
			IL_00d9: callvirt instance !!0 [UnityEngine.CoreModule]UnityEngine.GameObject::GetComponentInChildren<class MGSC.ExplosionLightUpdater>(bool)
			IL_00de: stfld class MGSC.ExplosionLightUpdater MGSC.ExplosionEntity/ExplosionVisualParameters::ExpLightUpdater
			// 			visualParameters.ExpAnimator = gameObject.GetComponent<FrameAnimator>();
			IL_00e3: ldloca.s 3
			IL_00e5: ldloc.s 7
			IL_00e7: callvirt instance !!0 [UnityEngine.CoreModule]UnityEngine.GameObject::GetComponent<class MGSC.FrameAnimator>()
			IL_00ec: stfld class MGSC.FrameAnimator MGSC.ExplosionEntity/ExplosionVisualParameters::ExpAnimator
			// 			visualParameters.ExpAnimator.Renderer.enabled = false;
			IL_00f1: ldloc.3
			IL_00f2: ldfld class MGSC.FrameAnimator MGSC.ExplosionEntity/ExplosionVisualParameters::ExpAnimator
			IL_00f7: callvirt instance class [UnityEngine.CoreModule]UnityEngine.SpriteRenderer MGSC.FrameAnimator::get_Renderer()
			IL_00fc: ldc.i4.0
			IL_00fd: callvirt instance void [UnityEngine.CoreModule]UnityEngine.Renderer::set_enabled(bool)

			// 		ExplosionEntity.ExplosionParameters parameters = record.Parameters;
			IL_0102: ldloc.1
			IL_0103: callvirt instance valuetype MGSC.ExplosionEntity/ExplosionParameters MGSC.ExplosionRecord::get_Parameters()
			IL_0108: stloc.s 6
			// 		parameters.Damage = Mathf.RoundToInt(parameters.Damage);
			IL_010a: ldloca.s 6
			IL_010c: ldloc.s 6
			IL_010e: ldfld int32 MGSC.ExplosionEntity/ExplosionParameters::Damage
			IL_0113: conv.r4
			IL_0114: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::RoundToInt(float32)
			IL_0119: stfld int32 MGSC.ExplosionEntity/ExplosionParameters::Damage
			// 		parameters.IsPlayerFire = _cacheCreatures.GetCreature(explosion.OwnerUid) is Player;
			IL_011e: ldloca.s 6
			IL_0120: ldsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
			IL_0125: ldarg.2
			IL_0126: ldfld int32 MGSC.ExplosionRequest::OwnerUid
			IL_012b: callvirt instance class MGSC.Creature MGSC.Creatures::GetCreature(int32)
			IL_0130: isinst MGSC.Player
			IL_0135: ldnull
			IL_0136: cgt.un
			IL_0138: stfld bool MGSC.ExplosionEntity/ExplosionParameters::IsPlayerFire
			// 		SingletonMonoBehaviour<ExplosionFactory>.Instance.CreateExplosion(explosion.Position, parameters, visualParameters).ExplodeNow();
			IL_013d: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.ExplosionFactory>::get_Instance()
			IL_0142: ldarg.2
			IL_0143: ldfld valuetype MGSC.CellPosition MGSC.ExplosionRequest::Position
			IL_0148: ldloc.s 6
			IL_014a: ldloc.3
			IL_014b: ldnull
			IL_014c: callvirt instance class MGSC.ExplosionEntity MGSC.ExplosionFactory::CreateExplosion(valuetype MGSC.CellPosition, valuetype MGSC.ExplosionEntity/ExplosionParameters, valuetype MGSC.ExplosionEntity/ExplosionVisualParameters, class MGSC.Creature)
			IL_0151: callvirt instance void MGSC.ExplosionEntity::ExplodeNow()
			// 		if (visualParameters.ExpSoundBank != null)
			IL_0156: ldloc.3
			IL_0157: ldfld class MGSC.SoundBank MGSC.ExplosionEntity/ExplosionVisualParameters::ExpSoundBank
			IL_015c: ldnull
			IL_015d: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0162: brfalse.s IL_017d

			// 			SingletonMonoBehaviour<SoundController>.Instance.PlaySound(vector, visualParameters.ExpSoundBank);
			IL_0164: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
			IL_0169: ldloc.s 5
			IL_016b: ldloc.3
			IL_016c: ldfld class MGSC.SoundBank MGSC.ExplosionEntity/ExplosionVisualParameters::ExpSoundBank
			IL_0171: ldc.i4.0
			IL_0172: ldc.i4.0
			IL_0173: ldc.r4 0.0
			IL_0178: callvirt instance void MGSC.SoundController::PlaySound(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3, class MGSC.SoundBank, bool, bool, float32)

			// 	_cacheEntities.ScheduleDestroy(e);
			IL_017d: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0182: ldarg.1
			IL_0183: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// }
			IL_0188: ret
		} // end of method '<>c'::'<ProcessExplosion>b__11_0'

		.method assembly hidebysig 
			instance void '<ProcessObstaclePierce>b__12_0' (
				int32 entity,
				valuetype MGSC.HitEvent& hitEvent
			) cil managed 
		{
			// Method begins at RVA 0x1331c0
			// Header size: 12
			// Code size: 135 (0x87)
			.maxstack 3
			.locals init (
				[0] valuetype MGSC.CollisionWithObstacle&,
				[1] float32
			)

			// 	if (_cacheEntities.IsAlive(hitEvent.ProjEntityId) && !hitEvent.WasMiss)
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

			// 		ref CollisionWithObstacle reference = ref _cacheEntities.GetRef<CollisionWithObstacle>(entity);
			IL_001b: ret

			IL_001c: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0021: ldarg.1
			IL_0022: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.CollisionWithObstacle>(int32)
			IL_0027: stloc.0
			// 		float num = _cacheEntities.GetRef<ProjectileRuntimeData>(hitEvent.ProjEntityId).PierceChance - reference.PierceBlock;
			IL_0028: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_002d: ldarg.2
			IL_002e: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_0033: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.ProjectileRuntimeData>(int32)
			IL_0038: ldfld float32 MGSC.ProjectileRuntimeData::PierceChance
			IL_003d: ldloc.0
			IL_003e: ldfld float32 MGSC.CollisionWithObstacle::PierceBlock
			IL_0043: sub
			IL_0044: stloc.1
			// 		hitEvent.WasPierced = reference.PierceBlock == 0f || Random.Range(0f, 1f) < num;
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
			// 		if (!hitEvent.WasPierced)
			IL_006d: ldarg.2
			IL_006e: ldfld bool MGSC.HitEvent::WasPierced
			IL_0073: brfalse.s IL_0076

			// 			_cacheEntities.ScheduleDestroy(hitEvent.ProjEntityId);
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
			// Method begins at RVA 0x133254
			// Header size: 12
			// Code size: 111 (0x6f)
			.maxstack 3
			.locals init (
				[0] valuetype MGSC.ProjectileRuntimeData&
			)

			// 	if (!_cacheEntities.IsAlive(hitEvent.ProjEntityId))
			IL_0000: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0005: ldarg.2
			IL_0006: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_000b: callvirt instance bool MGSC.Entities::IsAlive(int32)
			IL_0010: brtrue.s IL_001e

			// 		_cacheEntities.ScheduleDestroy(entity);
			IL_0012: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0017: ldarg.1
			IL_0018: callvirt instance void MGSC.Entities::ScheduleDestroy(int32)
			// }
			IL_001d: ret

			// 	else if (!hitEvent.WasMiss)
			IL_001e: ldarg.2
			IL_001f: ldfld bool MGSC.HitEvent::WasMiss
			IL_0024: brfalse.s IL_0027

			// 		ref ProjectileRuntimeData reference = ref _cacheEntities.GetRef<ProjectileRuntimeData>(hitEvent.ProjEntityId);
			IL_0026: ret

			IL_0027: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_002c: ldarg.2
			IL_002d: ldfld int32 MGSC.HitEvent::ProjEntityId
			IL_0032: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.ProjectileRuntimeData>(int32)
			IL_0037: stloc.0
			// 		hitEvent.WasPierced = Random.Range(0f, 1f) < reference.PierceChance;
			IL_0038: ldarg.2
			IL_0039: ldc.r4 0.0
			IL_003e: ldc.r4 1
			IL_0043: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
			IL_0048: ldloc.0
			IL_0049: ldfld float32 MGSC.ProjectileRuntimeData::PierceChance
			IL_004e: clt
			IL_0050: stfld bool MGSC.HitEvent::WasPierced
			// 		if (!hitEvent.WasPierced)
			IL_0055: ldarg.2
			IL_0056: ldfld bool MGSC.HitEvent::WasPierced
			IL_005b: brfalse.s IL_005e

			// 			_cacheEntities.ScheduleDestroy(hitEvent.ProjEntityId);
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
			// Method begins at RVA 0x1332d0
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

			// 	if (!hitEvent.WasMiss)
			IL_0000: ldarg.2
			IL_0001: ldfld bool MGSC.HitEvent::WasMiss
			IL_0006: brfalse.s IL_0009

			// }
			IL_0008: ret

			// 		int entity2 = _cacheEntities.CreateEntity();
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
			// 		if (_cacheEntities.Has<CollisionWithCreature>(entity))
			IL_0043: ldloc.2
			IL_0044: stloc.1
			IL_0045: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_004a: ldarg.1
			IL_004b: callvirt instance bool MGSC.Entities::Has<valuetype MGSC.CollisionWithCreature>(int32)
			IL_0050: brfalse.s IL_00b4

			// 			comp.TargetUid = _cacheEntities.GetRef<CollisionWithCreature>(entity).CreatureUid;
			IL_0052: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0057: ldarg.1
			IL_0058: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.CollisionWithCreature>(int32)
			IL_005d: stloc.3
			IL_005e: ldloca.s 1
			IL_0060: ldloc.3
			IL_0061: ldfld int32 MGSC.CollisionWithCreature::CreatureUid
			IL_0066: stfld int32 MGSC.DamageRequest::TargetUid
			// 			comp.Dodge = hitEvent.TargetDodge;
			IL_006b: ldloca.s 1
			IL_006d: ldarg.2
			IL_006e: ldfld float32 MGSC.HitEvent::TargetDodge
			IL_0073: stfld float32 MGSC.DamageRequest::Dodge
			// 			_cacheEntities.Add(entity2, comp);
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
			// 		else if (_cacheEntities.Has<CollisionWithObstacle>(entity))
			IL_00b3: ret

			IL_00b4: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_00b9: ldarg.1
			IL_00ba: callvirt instance bool MGSC.Entities::Has<valuetype MGSC.CollisionWithObstacle>(int32)
			IL_00bf: brfalse.s IL_00fe

			// 			comp.TargetObstacleUid = _cacheEntities.GetRef<CollisionWithObstacle>(entity).ObstacleUid;
			IL_00c1: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_00c6: ldarg.1
			IL_00c7: callvirt instance !!0& MGSC.Entities::GetRef<valuetype MGSC.CollisionWithObstacle>(int32)
			IL_00cc: stloc.s 5
			IL_00ce: ldloca.s 1
			IL_00d0: ldloc.s 5
			IL_00d2: ldfld int32 MGSC.CollisionWithObstacle::ObstacleUid
			IL_00d7: stfld int32 MGSC.DamageRequest::TargetObstacleUid
			// 			_cacheEntities.Add(entity2, comp);
			IL_00dc: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_00e1: ldloc.0
			IL_00e2: ldloc.1
			IL_00e3: callvirt instance void MGSC.Entities::Add<valuetype MGSC.DamageRequest>(int32, !!0)
			// 			_cacheEntities.Add(entity2, default(DamageRequestObstacle));
			IL_00e8: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_00ed: ldloc.0
			IL_00ee: ldloca.s 6
			IL_00f0: initobj MGSC.DamageRequestObstacle
			IL_00f6: ldloc.s 6
			// (no C# code)
			IL_00f8: callvirt instance void MGSC.Entities::Add<valuetype MGSC.DamageRequestObstacle>(int32, !!0)
			// 			_cacheEntities.Add(entity2, comp);
			IL_00fd: ret

			IL_00fe: ldsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
			IL_0103: ldloc.0
			IL_0104: ldloc.1
			IL_0105: callvirt instance void MGSC.Entities::Add<valuetype MGSC.DamageRequest>(int32, !!0)
			// 			_cacheEntities.Add(entity2, default(DamageRequestWall));
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
			// Method begins at RVA 0x1333fc
			// Header size: 1
			// Code size: 12 (0xc)
			.maxstack 8

			// 	_cacheEntities.ScheduleDestroy(entity);
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
		// Method begins at RVA 0x7fda8
		// Header size: 12
		// Code size: 128 (0x80)
		.maxstack 1

		// 	_cacheEntities = entities;
		IL_0000: ldarg.0
		IL_0001: stsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
		// 	_cacheCreatures = creatures;
		IL_0006: ldarg.1
		IL_0007: stsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
		// 	_cacheStatistics = statistics;
		IL_000c: ldarg.2
		IL_000d: stsfld class MGSC.Statistics MGSC.HitResolveSystem::_cacheStatistics
		// 	_cacheDifficulty = difficulty;
		IL_0012: ldarg.3
		IL_0013: stsfld class MGSC.Difficulty MGSC.HitResolveSystem::_cacheDifficulty
		// 	_cacheMapGrid = mapGrid;
		IL_0018: ldarg.s mapGrid
		IL_001a: stsfld class MGSC.MapGrid MGSC.HitResolveSystem::_cacheMapGrid
		// 	_cacheMapRenderer = mapRenderer;
		IL_001f: ldarg.s mapRenderer
		IL_0021: stsfld class MGSC.MapRenderer MGSC.HitResolveSystem::_cacheMapRenderer
		// 	_cacheMapObstacles = mapObstacles;
		IL_0026: ldarg.s mapObstacles
		IL_0028: stsfld class MGSC.MapObstacles MGSC.HitResolveSystem::_cacheMapObstacles
		// 	ProcessObstacleAccuracy();
		IL_002d: call void MGSC.HitResolveSystem::ProcessObstacleAccuracy()
		// 	ProcessCreatureAccuracy();
		IL_0032: call void MGSC.HitResolveSystem::ProcessCreatureAccuracy()
		// 	CreateHitConsequences();
		IL_0037: call void MGSC.HitResolveSystem::CreateHitConsequences()
		// 	ProcessExplosion();
		IL_003c: call void MGSC.HitResolveSystem::ProcessExplosion()
		// 	ProcessObstaclePierce();
		IL_0041: call void MGSC.HitResolveSystem::ProcessObstaclePierce()
		// 	ProcessCreaturePierce();
		IL_0046: call void MGSC.HitResolveSystem::ProcessCreaturePierce()
		// 	CreateDamageRequest();
		IL_004b: call void MGSC.HitResolveSystem::CreateDamageRequest()
		// 	TempHitEventCleaner();
		IL_0050: call void MGSC.HitResolveSystem::TempHitEventCleaner()
		// 	_cacheEntities = null;
		IL_0055: ldnull
		IL_0056: stsfld class MGSC.Entities MGSC.HitResolveSystem::_cacheEntities
		// 	_cacheCreatures = null;
		IL_005b: ldnull
		IL_005c: stsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
		// 	_cacheStatistics = null;
		IL_0061: ldnull
		IL_0062: stsfld class MGSC.Statistics MGSC.HitResolveSystem::_cacheStatistics
		// 	_cacheDifficulty = null;
		IL_0067: ldnull
		IL_0068: stsfld class MGSC.Difficulty MGSC.HitResolveSystem::_cacheDifficulty
		// 	_cacheMapGrid = null;
		IL_006d: ldnull
		IL_006e: stsfld class MGSC.MapGrid MGSC.HitResolveSystem::_cacheMapGrid
		// 	_cacheMapRenderer = null;
		IL_0073: ldnull
		IL_0074: stsfld class MGSC.MapRenderer MGSC.HitResolveSystem::_cacheMapRenderer
		// 	_cacheMapObstacles = null;
		IL_0079: ldnull
		IL_007a: stsfld class MGSC.MapObstacles MGSC.HitResolveSystem::_cacheMapObstacles
		// }
		IL_007f: ret
	} // end of method HitResolveSystem::Update

	.method private hidebysig static 
		void ProcessObstacleAccuracy () cil managed 
	{
		// Method begins at RVA 0x7fe34
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
		// 					hitEvent.WasMiss = Random.Range(1, 101) >= obstacleHealth.HitChanceOnShoot;
		// 					reference.PierceBlock = (float)obstacleHealth.BlockChance * 0.01f;
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
		// Method begins at RVA 0x7fe69
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
		// 				float num = Mathf.Clamp(reference.Accuracy - hitEvent.TargetDodge, Data.Global.MinHitChance, Data.Global.CapAccuracy);
		// 				float num2 = Random.Range(0f, 1f);
		// 				hitEvent.WasMiss = num2 > num;
		// 				Creature creature2 = _cacheCreatures.GetCreature(hitEvent.OwnerUid);
		// 				if (!(creature2 == null))
		// 				{
		// 					if (!hitEvent.WasMiss)
		// 					{
		// 						creature2.OnHit();
		// 						creature.ActivateAttackedTrigger(wasHit: true);
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
		// Method begins at RVA 0x7fe9e
		// Header size: 1
		// Code size: 47 (0x2f)
		.maxstack 8

		// 	_cacheEntities.Filter().ForEach(delegate(int entity, ref HitEvent hitEvent)
		// 	{
		// 		if (!hitEvent.WasMiss)
		// 		{
		// 			int entity2 = _cacheEntities.CreateEntity();
		// 			PropagatesNoise comp = new PropagatesNoise
		// 			{
		// 				NoiseType = 1,
		// 				Position = hitEvent.PreviousPosition
		// 			};
		// 			_cacheEntities.Add(entity2, comp);
		// 			Creature creature = _cacheCreatures.GetCreature(hitEvent.OwnerUid);
		// 			if (creature != null && ItemTraitSystem.TryGetValue<string>(creature.CreatureData.Inventory.CurrentWeapon.Comp<WeaponComponent>().OverridenAmmo.Traits, "SExplosive", out var value))
		// 			{
		// 				int entity3 = _cacheEntities.CreateEntity();
		// 				int explosionTypeId = SharedStringIds.Register(value);
		// 				_cacheEntities.Add(entity3, new ExplosionRequest
		// 				{
		// 					Position = hitEvent.HitPosition,
		// 					ExplosionTypeId = explosionTypeId,
		// 					OwnerUid = hitEvent.OwnerUid
		// 				});
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
		// Method begins at RVA 0x7fece
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
		// 			ExplosionEntity.ExplosionParameters parameters = record.Parameters;
		// 			parameters.Damage = Mathf.RoundToInt(parameters.Damage);
		// 			parameters.IsPlayerFire = _cacheCreatures.GetCreature(explosion.OwnerUid) is Player;
		// 			SingletonMonoBehaviour<ExplosionFactory>.Instance.CreateExplosion(explosion.Position, parameters, visualParameters).ExplodeNow();
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
		// Method begins at RVA 0x7fefe
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
		// Method begins at RVA 0x7ff38
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
		// Method begins at RVA 0x7ff72
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
		// Method begins at RVA 0x7ffa2
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
