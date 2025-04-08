.class public auto ansi abstract sealed beforefieldinit MGSC.DamageSystem
	extends [mscorlib]System.Object
{
	// Methods
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
		// Method begins at RVA 0x6a014
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
		// Method begins at RVA 0x6a070
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
		// Method begins at RVA 0x6a0ec
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
			[opt] int32 range,
			[opt] bool autoCrit,
			[opt] bool autoHit,
			[opt] float32 critDamageBonus
		) cil managed 
	{
		.param [8] = int32(1)
		.param [9] = bool(false)
		.param [10] = bool(false)
		.param [11] = float32(0.0)
		// Method begins at RVA 0x6a118
		// Header size: 12
		// Code size: 171 (0xab)
		.maxstack 9
		.locals init (
			[0] float32,
			[1] float32,
			[2] float32,
			[3] float32,
			[4] float32,
			[5] float32,
			[6] float32,
			[7] float32,
			[8] float32
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
		// float accuracy = Mathf.Clamp(baseAccuracy - baseDodge, minHitChance, capAccuracy);
		IL_002c: ldarg.1
		IL_002d: ldarg.2
		IL_002e: sub
		IL_002f: ldloc.0
		IL_0030: ldloc.1
		IL_0031: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Clamp(float32, float32, float32)
		IL_0036: stloc.s 4
		// float num = Mathf.Max(0f, baseAccuracy - capAccuracy);
		IL_0038: ldc.r4 0.0
		IL_003d: ldarg.1
		IL_003e: ldloc.1
		IL_003f: sub
		IL_0040: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Max(float32, float32)
		IL_0045: stloc.s 5
		// float num2 = Mathf.Max(0f, baseDodge - capDodge);
		IL_0047: ldc.r4 0.0
		IL_004c: ldarg.2
		IL_004d: ldloc.2
		IL_004e: sub
		IL_004f: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Max(float32, float32)
		IL_0054: stloc.s 6
		// float value = damage.critChance + critChanceBonus + num * overcapCritModifier;
		IL_0056: ldarg.s damage
		IL_0058: ldfld float32 MGSC.DmgInfo::critChance
		IL_005d: ldarg.3
		IL_005e: add
		IL_005f: ldloc.s 5
		IL_0061: ldloc.3
		IL_0062: mul
		IL_0063: add
		IL_0064: stloc.s 7
		// value = Mathf.Clamp(value, 0f, 1f);
		IL_0066: ldloc.s 7
		IL_0068: ldc.r4 0.0
		IL_006d: ldc.r4 1
		IL_0072: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Clamp(float32, float32, float32)
		IL_0077: stloc.s 7
		// float woundChance = Mathf.Max(0f, woundBaseChance - num2 * overcapCritModifier);
		IL_0079: ldc.r4 0.0
		IL_007e: ldarg.s woundBaseChance
		IL_0080: ldloc.s 6
		IL_0082: ldloc.3
		IL_0083: mul
		IL_0084: sub
		IL_0085: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Max(float32, float32)
		IL_008a: stloc.s 8
		// 	return new DamageHitInfo(distance, overallDmgMult, damage, accuracy, value, range, autoCrit, autoHit, critDamageBonus)
		// 	{
		// 		woundChance = woundChance
		// 	};
		IL_008c: ldarg.0
		IL_008d: ldarg.s overallDmgMult
		IL_008f: ldarg.s damage
		IL_0091: ldloc.s 4
		IL_0093: ldloc.s 7
		IL_0095: ldarg.s range
		IL_0097: ldarg.s autoCrit
		IL_0099: ldarg.s autoHit
		IL_009b: ldarg.s critDamageBonus
		IL_009d: newobj instance void MGSC.DamageHitInfo::.ctor(int32, float32, valuetype MGSC.DmgInfo, float32, float32, int32, bool, bool, float32)
		IL_00a2: dup
		IL_00a3: ldloc.s 8
		IL_00a5: stfld float32 MGSC.DamageHitInfo::woundChance
		IL_00aa: ret
	} // end of method DamageSystem::CalculateHitInfo

	.method public hidebysig static 
		string GetDamageType (
			class MGSC.BasePickupItem weapon
		) cil managed 
	{
		// Method begins at RVA 0x6a1cf
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
		// Method begins at RVA 0x6a1ec
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
		// Method begins at RVA 0x6a29c
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

} // end of class MGSC.DamageSystem
