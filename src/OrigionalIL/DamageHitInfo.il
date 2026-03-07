.class public auto ansi beforefieldinit MGSC.DamageHitInfo
	extends [mscorlib]System.Object
{
	// Fields
	.field public valuetype MGSC.DmgInfo info
	.field public bool wasMiss
	.field public bool wasCrit
	.field public bool wasOutOfRange
	.field public int32 dirtyDmg
	.field public int32 finalDmg
	.field public float32 woundChanceBonus
	.field public float32 woundChanceMult
	.field public float32 painMult
	.field public int32 extraSkipAP
	.field public bool silenceDmg
	.field public bool doAmpOnWound
	.field public valuetype MGSC.WoundBonus woundBonus
	.field public valuetype MGSC.CellPosition dangerPosition
	.field public float32 resistModifier
	.field public string statusEffectId
	.field public float32 statusEffectDmgMult
	.field public float32 statusEffectChanceToApplyBonus
	.field public float32 statusEffectDmgModBonus
	.field public float32 statusEffectResistModBonus
	.field public float32 weaponArmorPen
	.field public class MGSC.Creature damageDealer
	.field public float32 ampChanceBonus
	.field public bool usedWeapon
	.field public bool wasMeleeHit
	.field public bool wasStun
	.field public float32 corrosiveModifier
	.field public bool isPhysical
	.field public bool wasThrown
	.field public bool wasWound
	.field public string woundDmgType
	.field public bool allowAmputation

	// Methods
	.method public hidebysig specialname rtspecialname 
		instance void .ctor () cil managed 
	{
		// Method begins at RVA 0x2bb80
		// Header size: 1
		// Code size: 58 (0x3a)
		.maxstack 8

		// 	woundChanceMult = 1f;
		IL_0000: ldarg.0
		IL_0001: ldc.r4 1
		IL_0006: stfld float32 MGSC.DamageHitInfo::woundChanceMult
		// 	painMult = 1f;
		IL_000b: ldarg.0
		IL_000c: ldc.r4 1
		IL_0011: stfld float32 MGSC.DamageHitInfo::painMult
		// 	resistModifier = 1f;
		IL_0016: ldarg.0
		IL_0017: ldc.r4 1
		IL_001c: stfld float32 MGSC.DamageHitInfo::resistModifier
		// 	statusEffectDmgMult = 1f;
		IL_0021: ldarg.0
		IL_0022: ldc.r4 1
		IL_0027: stfld float32 MGSC.DamageHitInfo::statusEffectDmgMult
		// 	allowAmputation = true;
		IL_002c: ldarg.0
		IL_002d: ldc.i4.1
		IL_002e: stfld bool MGSC.DamageHitInfo::allowAmputation
		// 	base..ctor();
		IL_0033: ldarg.0
		IL_0034: call instance void [mscorlib]System.Object::.ctor()
		// }
		IL_0039: ret
	} // end of method DamageHitInfo::.ctor

	.method public hidebysig specialname rtspecialname 
		instance void .ctor (
			int32 distance,
			float32 overallDmgMult,
			valuetype MGSC.DmgInfo dmgInfo,
			float32 accuracy,
			[opt] float32 critChance,
			[opt] int32 rangeBegins,
			[opt] int32 range,
			[opt] float32 falloff,
			[opt] bool autoCrit,
			[opt] bool autoHit,
			[opt] float32 critDamageBonus,
			[opt] bool noCrit
		) cil managed 
	{
		.param [5] = float32(0.0)
		.param [6] = int32(0)
		.param [7] = int32(1)
		.param [8] = float32(0.0)
		.param [9] = bool(false)
		.param [10] = bool(false)
		.param [11] = float32(0.0)
		.param [12] = bool(false)
		// Method begins at RVA 0x2bbbc
		// Header size: 12
		// Code size: 291 (0x123)
		.maxstack 6
		.locals init (
			[0] int32,
			[1] float32,
			[2] float32,
			[3] int32
		)

		// 	woundChanceMult = 1f;
		IL_0000: ldarg.0
		IL_0001: ldc.r4 1
		IL_0006: stfld float32 MGSC.DamageHitInfo::woundChanceMult
		// 	painMult = 1f;
		IL_000b: ldarg.0
		IL_000c: ldc.r4 1
		IL_0011: stfld float32 MGSC.DamageHitInfo::painMult
		// 	resistModifier = 1f;
		IL_0016: ldarg.0
		IL_0017: ldc.r4 1
		IL_001c: stfld float32 MGSC.DamageHitInfo::resistModifier
		// 	statusEffectDmgMult = 1f;
		IL_0021: ldarg.0
		IL_0022: ldc.r4 1
		IL_0027: stfld float32 MGSC.DamageHitInfo::statusEffectDmgMult
		// 	allowAmputation = true;
		IL_002c: ldarg.0
		IL_002d: ldc.i4.1
		IL_002e: stfld bool MGSC.DamageHitInfo::allowAmputation
		// 	base..ctor();
		IL_0033: ldarg.0
		IL_0034: call instance void [mscorlib]System.Object::.ctor()
		// 	info = dmgInfo;
		IL_0039: ldarg.0
		IL_003a: ldarg.3
		IL_003b: stfld valuetype MGSC.DmgInfo MGSC.DamageHitInfo::info
		// 	if (!string.IsNullOrEmpty(info.damage))
		IL_0040: ldarg.0
		IL_0041: ldflda valuetype MGSC.DmgInfo MGSC.DamageHitInfo::info
		IL_0046: ldfld string MGSC.DmgInfo::damage
		IL_004b: call bool [mscorlib]System.String::IsNullOrEmpty(string)
		IL_0050: brtrue.s IL_0073

		// 		isPhysical = Data.DamageTypes.GetRecord(info.damage).IsPhysical;
		IL_0052: ldarg.0
		IL_0053: call class MGSC.ConfigRecordCollection`1<class MGSC.DamageTypeRecord> MGSC.Data::get_DamageTypes()
		IL_0058: ldarg.0
		IL_0059: ldflda valuetype MGSC.DmgInfo MGSC.DamageHitInfo::info
		IL_005e: ldfld string MGSC.DmgInfo::damage
		IL_0063: ldc.i4.1
		IL_0064: callvirt instance !0 class MGSC.ConfigRecordCollection`1<class MGSC.DamageTypeRecord>::GetRecord(string, bool)
		IL_0069: callvirt instance bool MGSC.DamageTypeRecord::get_IsPhysical()
		IL_006e: stfld bool MGSC.DamageHitInfo::isPhysical

		// 	int num = Random.Range(dmgInfo.minDmg, dmgInfo.maxDmg + 1);
		IL_0073: ldarg.3
		IL_0074: ldfld int32 MGSC.DmgInfo::minDmg
		IL_0079: ldarg.3
		IL_007a: ldfld int32 MGSC.DmgInfo::maxDmg
		IL_007f: ldc.i4.1
		IL_0080: add
		IL_0081: call int32 [UnityEngine.CoreModule]UnityEngine.Random::Range(int32, int32)
		IL_0086: stloc.0
		// 	float num2 = Random.Range(0f, 1f);
		IL_0087: ldc.r4 0.0
		IL_008c: ldc.r4 1
		IL_0091: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
		IL_0096: stloc.1
		// 	float num3 = Random.Range(0f, 1f);
		IL_0097: ldc.r4 0.0
		IL_009c: ldc.r4 1
		IL_00a1: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
		IL_00a6: stloc.2
		// 	wasCrit = (autoCrit || num2 <= critChance) && !noCrit;
		IL_00a7: ldarg.0
		IL_00a8: ldarg.s autoCrit
		IL_00aa: brtrue.s IL_00b1

		IL_00ac: ldloc.1
		IL_00ad: ldarg.s critChance
		IL_00af: bgt.un.s IL_00b8

		IL_00b1: ldarg.s noCrit
		IL_00b3: ldc.i4.0
		IL_00b4: ceq
		IL_00b6: br.s IL_00b9

		IL_00b8: ldc.i4.0

		IL_00b9: stfld bool MGSC.DamageHitInfo::wasCrit
		// 	wasMiss = num3 > accuracy && !autoHit;
		IL_00be: ldarg.0
		IL_00bf: ldloc.2
		IL_00c0: ldarg.s accuracy
		IL_00c2: ble.un.s IL_00cb

		IL_00c4: ldarg.s autoHit
		IL_00c6: ldc.i4.0
		IL_00c7: ceq
		IL_00c9: br.s IL_00cc

		IL_00cb: ldc.i4.0

		IL_00cc: stfld bool MGSC.DamageHitInfo::wasMiss
		// 	if (wasCrit)
		IL_00d1: ldarg.0
		IL_00d2: ldfld bool MGSC.DamageHitInfo::wasCrit
		IL_00d7: brfalse.s IL_00eb

		// 		num = Mathf.RoundToInt((float)num * (dmgInfo.critDmg + critDamageBonus));
		IL_00d9: ldloc.0
		IL_00da: conv.r4
		IL_00db: ldarg.3
		IL_00dc: ldfld float32 MGSC.DmgInfo::critDmg
		IL_00e1: ldarg.s critDamageBonus
		IL_00e3: add
		IL_00e4: mul
		IL_00e5: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::RoundToInt(float32)
		IL_00ea: stloc.0

		// 	num = DamageSystem.FalloffDamage(num, distance, rangeBegins, range, falloff, out wasOutOfRange);
		IL_00eb: ldloc.0
		IL_00ec: ldarg.1
		IL_00ed: ldarg.s rangeBegins
		IL_00ef: ldarg.s range
		IL_00f1: ldarg.s falloff
		IL_00f3: ldarg.0
		IL_00f4: ldflda bool MGSC.DamageHitInfo::wasOutOfRange
		IL_00f9: call int32 MGSC.DamageSystem::FalloffDamage(int32, int32, int32, int32, float32, bool&)
		IL_00fe: stloc.0
		// 	int b = Mathf.RoundToInt((float)num * overallDmgMult);
		IL_00ff: ldloc.0
		IL_0100: conv.r4
		IL_0101: ldarg.2
		IL_0102: mul
		IL_0103: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::RoundToInt(float32)
		IL_0108: stloc.3
		// 	finalDmg = Mathf.Max(1, b);
		IL_0109: ldarg.0
		IL_010a: ldc.i4.1
		IL_010b: ldloc.3
		IL_010c: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::Max(int32, int32)
		IL_0111: stfld int32 MGSC.DamageHitInfo::finalDmg
		// 	dirtyDmg = finalDmg;
		IL_0116: ldarg.0
		IL_0117: ldarg.0
		IL_0118: ldfld int32 MGSC.DamageHitInfo::finalDmg
		IL_011d: stfld int32 MGSC.DamageHitInfo::dirtyDmg
		// }
		IL_0122: ret
	} // end of method DamageHitInfo::.ctor

	.method public hidebysig 
		instance void Clone (
			class MGSC.DamageHitInfo source
		) cil managed 
	{
		// Method begins at RVA 0x2bcec
		// Header size: 12
		// Code size: 349 (0x15d)
		.maxstack 2

		// 	info = source.info;
		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: ldfld valuetype MGSC.DmgInfo MGSC.DamageHitInfo::info
		IL_0007: stfld valuetype MGSC.DmgInfo MGSC.DamageHitInfo::info
		// 	wasMiss = source.wasMiss;
		IL_000c: ldarg.0
		IL_000d: ldarg.1
		IL_000e: ldfld bool MGSC.DamageHitInfo::wasMiss
		IL_0013: stfld bool MGSC.DamageHitInfo::wasMiss
		// 	wasCrit = source.wasCrit;
		IL_0018: ldarg.0
		IL_0019: ldarg.1
		IL_001a: ldfld bool MGSC.DamageHitInfo::wasCrit
		IL_001f: stfld bool MGSC.DamageHitInfo::wasCrit
		// 	wasOutOfRange = source.wasOutOfRange;
		IL_0024: ldarg.0
		IL_0025: ldarg.1
		IL_0026: ldfld bool MGSC.DamageHitInfo::wasOutOfRange
		IL_002b: stfld bool MGSC.DamageHitInfo::wasOutOfRange
		// 	dirtyDmg = source.dirtyDmg;
		IL_0030: ldarg.0
		IL_0031: ldarg.1
		IL_0032: ldfld int32 MGSC.DamageHitInfo::dirtyDmg
		IL_0037: stfld int32 MGSC.DamageHitInfo::dirtyDmg
		// 	finalDmg = source.finalDmg;
		IL_003c: ldarg.0
		IL_003d: ldarg.1
		IL_003e: ldfld int32 MGSC.DamageHitInfo::finalDmg
		IL_0043: stfld int32 MGSC.DamageHitInfo::finalDmg
		// 	woundChanceBonus = source.woundChanceBonus;
		IL_0048: ldarg.0
		IL_0049: ldarg.1
		IL_004a: ldfld float32 MGSC.DamageHitInfo::woundChanceBonus
		IL_004f: stfld float32 MGSC.DamageHitInfo::woundChanceBonus
		// 	woundChanceMult = source.woundChanceMult;
		IL_0054: ldarg.0
		IL_0055: ldarg.1
		IL_0056: ldfld float32 MGSC.DamageHitInfo::woundChanceMult
		IL_005b: stfld float32 MGSC.DamageHitInfo::woundChanceMult
		// 	painMult = source.painMult;
		IL_0060: ldarg.0
		IL_0061: ldarg.1
		IL_0062: ldfld float32 MGSC.DamageHitInfo::painMult
		IL_0067: stfld float32 MGSC.DamageHitInfo::painMult
		// 	extraSkipAP = source.extraSkipAP;
		IL_006c: ldarg.0
		IL_006d: ldarg.1
		IL_006e: ldfld int32 MGSC.DamageHitInfo::extraSkipAP
		IL_0073: stfld int32 MGSC.DamageHitInfo::extraSkipAP
		// 	silenceDmg = source.silenceDmg;
		IL_0078: ldarg.0
		IL_0079: ldarg.1
		IL_007a: ldfld bool MGSC.DamageHitInfo::silenceDmg
		IL_007f: stfld bool MGSC.DamageHitInfo::silenceDmg
		// 	doAmpOnWound = source.doAmpOnWound;
		IL_0084: ldarg.0
		IL_0085: ldarg.1
		IL_0086: ldfld bool MGSC.DamageHitInfo::doAmpOnWound
		IL_008b: stfld bool MGSC.DamageHitInfo::doAmpOnWound
		// 	woundBonus = source.woundBonus;
		IL_0090: ldarg.0
		IL_0091: ldarg.1
		IL_0092: ldfld valuetype MGSC.WoundBonus MGSC.DamageHitInfo::woundBonus
		IL_0097: stfld valuetype MGSC.WoundBonus MGSC.DamageHitInfo::woundBonus
		// 	dangerPosition = source.dangerPosition;
		IL_009c: ldarg.0
		IL_009d: ldarg.1
		IL_009e: ldfld valuetype MGSC.CellPosition MGSC.DamageHitInfo::dangerPosition
		IL_00a3: stfld valuetype MGSC.CellPosition MGSC.DamageHitInfo::dangerPosition
		// 	resistModifier = source.resistModifier;
		IL_00a8: ldarg.0
		IL_00a9: ldarg.1
		IL_00aa: ldfld float32 MGSC.DamageHitInfo::resistModifier
		IL_00af: stfld float32 MGSC.DamageHitInfo::resistModifier
		// 	statusEffectId = source.statusEffectId;
		IL_00b4: ldarg.0
		IL_00b5: ldarg.1
		IL_00b6: ldfld string MGSC.DamageHitInfo::statusEffectId
		IL_00bb: stfld string MGSC.DamageHitInfo::statusEffectId
		// 	statusEffectDmgMult = source.statusEffectDmgMult;
		IL_00c0: ldarg.0
		IL_00c1: ldarg.1
		IL_00c2: ldfld float32 MGSC.DamageHitInfo::statusEffectDmgMult
		IL_00c7: stfld float32 MGSC.DamageHitInfo::statusEffectDmgMult
		// 	statusEffectChanceToApplyBonus = source.statusEffectChanceToApplyBonus;
		IL_00cc: ldarg.0
		IL_00cd: ldarg.1
		IL_00ce: ldfld float32 MGSC.DamageHitInfo::statusEffectChanceToApplyBonus
		IL_00d3: stfld float32 MGSC.DamageHitInfo::statusEffectChanceToApplyBonus
		// 	statusEffectDmgModBonus = source.statusEffectDmgModBonus;
		IL_00d8: ldarg.0
		IL_00d9: ldarg.1
		IL_00da: ldfld float32 MGSC.DamageHitInfo::statusEffectDmgModBonus
		IL_00df: stfld float32 MGSC.DamageHitInfo::statusEffectDmgModBonus
		// 	statusEffectResistModBonus = source.statusEffectResistModBonus;
		IL_00e4: ldarg.0
		IL_00e5: ldarg.1
		IL_00e6: ldfld float32 MGSC.DamageHitInfo::statusEffectResistModBonus
		IL_00eb: stfld float32 MGSC.DamageHitInfo::statusEffectResistModBonus
		// 	weaponArmorPen = source.weaponArmorPen;
		IL_00f0: ldarg.0
		IL_00f1: ldarg.1
		IL_00f2: ldfld float32 MGSC.DamageHitInfo::weaponArmorPen
		IL_00f7: stfld float32 MGSC.DamageHitInfo::weaponArmorPen
		// 	damageDealer = source.damageDealer;
		IL_00fc: ldarg.0
		IL_00fd: ldarg.1
		IL_00fe: ldfld class MGSC.Creature MGSC.DamageHitInfo::damageDealer
		IL_0103: stfld class MGSC.Creature MGSC.DamageHitInfo::damageDealer
		// 	ampChanceBonus = source.ampChanceBonus;
		IL_0108: ldarg.0
		IL_0109: ldarg.1
		IL_010a: ldfld float32 MGSC.DamageHitInfo::ampChanceBonus
		IL_010f: stfld float32 MGSC.DamageHitInfo::ampChanceBonus
		// 	usedWeapon = source.usedWeapon;
		IL_0114: ldarg.0
		IL_0115: ldarg.1
		IL_0116: ldfld bool MGSC.DamageHitInfo::usedWeapon
		IL_011b: stfld bool MGSC.DamageHitInfo::usedWeapon
		// 	wasMeleeHit = source.wasMeleeHit;
		IL_0120: ldarg.0
		IL_0121: ldarg.1
		IL_0122: ldfld bool MGSC.DamageHitInfo::wasMeleeHit
		IL_0127: stfld bool MGSC.DamageHitInfo::wasMeleeHit
		// 	wasStun = source.wasStun;
		IL_012c: ldarg.0
		IL_012d: ldarg.1
		IL_012e: ldfld bool MGSC.DamageHitInfo::wasStun
		IL_0133: stfld bool MGSC.DamageHitInfo::wasStun
		// 	corrosiveModifier = source.corrosiveModifier;
		IL_0138: ldarg.0
		IL_0139: ldarg.1
		IL_013a: ldfld float32 MGSC.DamageHitInfo::corrosiveModifier
		IL_013f: stfld float32 MGSC.DamageHitInfo::corrosiveModifier
		// 	isPhysical = source.isPhysical;
		IL_0144: ldarg.0
		IL_0145: ldarg.1
		IL_0146: ldfld bool MGSC.DamageHitInfo::isPhysical
		IL_014b: stfld bool MGSC.DamageHitInfo::isPhysical
		// 	wasThrown = source.wasThrown;
		IL_0150: ldarg.0
		IL_0151: ldarg.1
		IL_0152: ldfld bool MGSC.DamageHitInfo::wasThrown
		IL_0157: stfld bool MGSC.DamageHitInfo::wasThrown
		// }
		IL_015c: ret
	} // end of method DamageHitInfo::Clone

	.method public hidebysig 
		instance void ProcessResist (
			class MGSC.IDestroyable target
		) cil managed 
	{
		// Method begins at RVA 0x2be58
		// Header size: 12
		// Code size: 72 (0x48)
		.maxstack 4
		.locals init (
			[0] float32
		)

		// 	float resist = target.GetResist(info.damage);
		IL_0000: ldarg.1
		IL_0001: ldarg.0
		IL_0002: ldflda valuetype MGSC.DmgInfo MGSC.DamageHitInfo::info
		IL_0007: ldfld string MGSC.DmgInfo::damage
		IL_000c: callvirt instance float32 MGSC.IDestroyable::GetResist(string)
		IL_0011: stloc.0
		// 	if (Mathf.Abs(resist - 1f) < Mathf.Epsilon)
		IL_0012: ldloc.0
		IL_0013: ldc.r4 1
		IL_0018: sub
		IL_0019: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Abs(float32)
		IL_001e: ldsfld float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Epsilon
		IL_0023: bge.un.s IL_002d

		// 		finalDmg = 0;
		IL_0025: ldarg.0
		IL_0026: ldc.i4.0
		IL_0027: stfld int32 MGSC.DamageHitInfo::finalDmg
		// }
		IL_002c: ret

		// 		finalDmg = Mathf.FloorToInt((float)finalDmg * (1f - resist));
		IL_002d: ldarg.0
		IL_002e: ldarg.0
		IL_002f: ldfld int32 MGSC.DamageHitInfo::finalDmg
		IL_0034: conv.r4
		IL_0035: ldc.r4 1
		IL_003a: ldloc.0
		IL_003b: sub
		IL_003c: mul
		IL_003d: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::FloorToInt(float32)
		IL_0042: stfld int32 MGSC.DamageHitInfo::finalDmg
		// (no C# code)
		IL_0047: ret
	} // end of method DamageHitInfo::ProcessResist

} // end of class MGSC.DamageHitInfo
