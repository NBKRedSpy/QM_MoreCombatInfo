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
	.field public bool wasStun
	.field public float32 corrosiveModifier

	// Methods
	.method public hidebysig specialname rtspecialname 
		instance void .ctor () cil managed 
	{
		// Method begins at RVA 0x17bcc
		// Header size: 1
		// Code size: 51 (0x33)
		.maxstack 8

		// woundChanceMult = 1f;
		IL_0000: ldarg.0
		IL_0001: ldc.r4 1
		IL_0006: stfld float32 MGSC.DamageHitInfo::woundChanceMult
		// painMult = 1f;
		IL_000b: ldarg.0
		IL_000c: ldc.r4 1
		IL_0011: stfld float32 MGSC.DamageHitInfo::painMult
		// resistModifier = 1f;
		IL_0016: ldarg.0
		IL_0017: ldc.r4 1
		IL_001c: stfld float32 MGSC.DamageHitInfo::resistModifier
		// statusEffectDmgMult = 1f;
		IL_0021: ldarg.0
		IL_0022: ldc.r4 1
		IL_0027: stfld float32 MGSC.DamageHitInfo::statusEffectDmgMult
		// base..ctor();
		IL_002c: ldarg.0
		IL_002d: call instance void [mscorlib]System.Object::.ctor()
		// }
		IL_0032: ret
	} // end of method DamageHitInfo::.ctor

	.method public hidebysig specialname rtspecialname 
		instance void .ctor (
			int32 distance,
			float32 overallDmgMult,
			valuetype MGSC.DmgInfo dmgInfo,
			float32 accuracy,
			[opt] float32 critBonus,
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
		// Method begins at RVA 0x17c00
		// Header size: 12
		// Code size: 449 (0x1c1)
		.maxstack 4
		.locals init (
			[0] int32,
			[1] float32,
			[2] float32,
			[3] int32,
			[4] int32,
			[5] float32,
			[6] float32,
			[7] float32,
			[8] int32,
			[9] float32,
			[10] float32
		)

		// woundChanceMult = 1f;
		IL_0000: ldarg.0
		IL_0001: ldc.r4 1
		IL_0006: stfld float32 MGSC.DamageHitInfo::woundChanceMult
		// painMult = 1f;
		IL_000b: ldarg.0
		IL_000c: ldc.r4 1
		IL_0011: stfld float32 MGSC.DamageHitInfo::painMult
		// resistModifier = 1f;
		IL_0016: ldarg.0
		IL_0017: ldc.r4 1
		IL_001c: stfld float32 MGSC.DamageHitInfo::resistModifier
		// statusEffectDmgMult = 1f;
		IL_0021: ldarg.0
		IL_0022: ldc.r4 1
		IL_0027: stfld float32 MGSC.DamageHitInfo::statusEffectDmgMult
		// base..ctor();
		IL_002c: ldarg.0
		IL_002d: call instance void [mscorlib]System.Object::.ctor()
		// info = dmgInfo;
		IL_0032: ldarg.0
		IL_0033: ldarg.3
		IL_0034: stfld valuetype MGSC.DmgInfo MGSC.DamageHitInfo::info
		// int num = Random.Range(dmgInfo.minDmg, dmgInfo.maxDmg + 1);
		IL_0039: ldarg.3
		IL_003a: ldfld int32 MGSC.DmgInfo::minDmg
		IL_003f: ldarg.3
		IL_0040: ldfld int32 MGSC.DmgInfo::maxDmg
		IL_0045: ldc.i4.1
		IL_0046: add
		IL_0047: call int32 [UnityEngine.CoreModule]UnityEngine.Random::Range(int32, int32)
		IL_004c: stloc.0
		// float num2 = Random.Range(0f, 1f);
		IL_004d: ldc.r4 0.0
		IL_0052: ldc.r4 1
		IL_0057: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
		IL_005c: stloc.1
		// float num3 = Random.Range(0f, 1f);
		IL_005d: ldc.r4 0.0
		IL_0062: ldc.r4 1
		IL_0067: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
		IL_006c: stloc.2
		// wasCrit = (autoCrit || num2 <= dmgInfo.critChance + critBonus) && !noCrit;
		IL_006d: ldarg.0
		IL_006e: ldarg.s autoCrit
		IL_0070: brtrue.s IL_007e

		IL_0072: ldloc.1
		IL_0073: ldarg.3
		IL_0074: ldfld float32 MGSC.DmgInfo::critChance
		IL_0079: ldarg.s critBonus
		IL_007b: add
		IL_007c: bgt.un.s IL_0085

		IL_007e: ldarg.s noCrit
		IL_0080: ldc.i4.0
		IL_0081: ceq
		IL_0083: br.s IL_0086

		IL_0085: ldc.i4.0

		IL_0086: stfld bool MGSC.DamageHitInfo::wasCrit
		// wasMiss = num3 > accuracy && !autoHit;
		IL_008b: ldarg.0
		IL_008c: ldloc.2
		IL_008d: ldarg.s accuracy
		IL_008f: ble.un.s IL_0098

		IL_0091: ldarg.s autoHit
		IL_0093: ldc.i4.0
		IL_0094: ceq
		IL_0096: br.s IL_0099

		IL_0098: ldc.i4.0

		IL_0099: stfld bool MGSC.DamageHitInfo::wasMiss
		// if (wasCrit)
		IL_009e: ldarg.0
		IL_009f: ldfld bool MGSC.DamageHitInfo::wasCrit
		IL_00a4: brfalse.s IL_00b8

		// num = Mathf.RoundToInt((float)num * (dmgInfo.critDmg + critDamageBonus));
		IL_00a6: ldloc.0
		IL_00a7: conv.r4
		IL_00a8: ldarg.3
		IL_00a9: ldfld float32 MGSC.DmgInfo::critDmg
		IL_00ae: ldarg.s critDamageBonus
		IL_00b0: add
		IL_00b1: mul
		IL_00b2: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::RoundToInt(float32)
		IL_00b7: stloc.0

		// if (distance > range)
		IL_00b8: ldarg.1
		IL_00b9: ldarg.s range
		IL_00bb: ble.s IL_012b

		// wasOutOfRange = distance > range;
		IL_00bd: ldarg.0
		IL_00be: ldarg.1
		IL_00bf: ldarg.s range
		IL_00c1: cgt
		IL_00c3: stfld bool MGSC.DamageHitInfo::wasOutOfRange
		// num4 = distance - range;
		IL_00c8: ldarg.1
		IL_00c9: ldarg.s range
		IL_00cb: sub
		IL_00cc: stloc.s 4
		// num5 = (float)num * falloff;
		IL_00ce: ldloc.0
		IL_00cf: conv.r4
		IL_00d0: ldarg.s falloff
		IL_00d2: mul
		IL_00d3: stloc.s 5
		// if (num5 > 0f)
		IL_00d5: ldloc.s 5
		IL_00d7: ldc.r4 0.0
		IL_00dc: ble.un.s IL_00e9

		// if (!(num5 < 1f))
		IL_00de: ldloc.s 5
		IL_00e0: ldc.r4 1
		IL_00e5: blt.s IL_00fd

		// goto IL_010f;
		IL_00e7: br.s IL_010f

		// if (!(num5 < 0f) || !(num5 > -1f))
		IL_00e9: ldloc.s 5
		IL_00eb: ldc.r4 0.0
		IL_00f0: bge.un.s IL_010f

		IL_00f2: ldloc.s 5
		IL_00f4: ldc.r4 -1
		IL_00f9: bgt.s IL_0106

		// goto IL_010f;
		IL_00fb: br.s IL_010f

		// num6 = 1f;
		IL_00fd: ldc.r4 1
		IL_0102: stloc.s 7
		// num6 = -1f;
		IL_0104: br.s IL_0113

		IL_0106: ldc.r4 -1
		IL_010b: stloc.s 7
		// goto IL_0113;
		IL_010d: br.s IL_0113

		// num6 = num5;
		IL_010f: ldloc.s 5
		IL_0111: stloc.s 7

		// num5 = num6;
		IL_0113: ldloc.s 7
		IL_0115: stloc.s 5
		// float f = num5 * (float)num4;
		IL_0117: ldloc.s 5
		IL_0119: ldloc.s 4
		IL_011b: conv.r4
		IL_011c: mul
		IL_011d: stloc.s 6
		// num -= Mathf.RoundToInt(f);
		IL_011f: ldloc.0
		IL_0120: ldloc.s 6
		IL_0122: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::RoundToInt(float32)
		IL_0127: sub
		IL_0128: stloc.0
		// goto IL_019d;
		IL_0129: br.s IL_019d

		// if (rangeBegins > 0 && distance < rangeBegins)
		IL_012b: ldarg.s rangeBegins
		IL_012d: ldc.i4.0
		IL_012e: ble.s IL_019d

		IL_0130: ldarg.1
		IL_0131: ldarg.s rangeBegins
		IL_0133: bge.s IL_019d

		// wasOutOfRange = true;
		IL_0135: ldarg.0
		IL_0136: ldc.i4.1
		IL_0137: stfld bool MGSC.DamageHitInfo::wasOutOfRange
		// num7 = rangeBegins - distance;
		IL_013c: ldarg.s rangeBegins
		IL_013e: ldarg.1
		IL_013f: sub
		IL_0140: stloc.s 8
		// num8 = (float)num * falloff;
		IL_0142: ldloc.0
		IL_0143: conv.r4
		IL_0144: ldarg.s falloff
		IL_0146: mul
		IL_0147: stloc.s 9
		// if (num8 > 0f)
		IL_0149: ldloc.s 9
		IL_014b: ldc.r4 0.0
		IL_0150: ble.un.s IL_015d

		// if (!(num8 < 1f))
		IL_0152: ldloc.s 9
		IL_0154: ldc.r4 1
		IL_0159: blt.s IL_0171

		// goto IL_0183;
		IL_015b: br.s IL_0183

		// if (!(num8 < 0f) || !(num8 > -1f))
		IL_015d: ldloc.s 9
		IL_015f: ldc.r4 0.0
		IL_0164: bge.un.s IL_0183

		IL_0166: ldloc.s 9
		IL_0168: ldc.r4 -1
		IL_016d: bgt.s IL_017a

		// goto IL_0183;
		IL_016f: br.s IL_0183

		// num6 = 1f;
		IL_0171: ldc.r4 1
		IL_0176: stloc.s 7
		// num6 = -1f;
		IL_0178: br.s IL_0187

		IL_017a: ldc.r4 -1
		IL_017f: stloc.s 7
		// goto IL_0187;
		IL_0181: br.s IL_0187

		// num6 = num8;
		IL_0183: ldloc.s 9
		IL_0185: stloc.s 7

		// num8 = num6;
		IL_0187: ldloc.s 7
		IL_0189: stloc.s 9
		// float f2 = num8 * (float)num7;
		IL_018b: ldloc.s 9
		IL_018d: ldloc.s 8
		IL_018f: conv.r4
		IL_0190: mul
		IL_0191: stloc.s 10
		// num -= Mathf.RoundToInt(f2);
		IL_0193: ldloc.0
		IL_0194: ldloc.s 10
		IL_0196: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::RoundToInt(float32)
		IL_019b: sub
		IL_019c: stloc.0

		// int b = Mathf.RoundToInt((float)num * overallDmgMult);
		IL_019d: ldloc.0
		IL_019e: conv.r4
		IL_019f: ldarg.2
		IL_01a0: mul
		IL_01a1: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::RoundToInt(float32)
		IL_01a6: stloc.3
		// finalDmg = Mathf.Max(1, b);
		IL_01a7: ldarg.0
		IL_01a8: ldc.i4.1
		IL_01a9: ldloc.3
		IL_01aa: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::Max(int32, int32)
		IL_01af: stfld int32 MGSC.DamageHitInfo::finalDmg
		// dirtyDmg = finalDmg;
		IL_01b4: ldarg.0
		IL_01b5: ldarg.0
		IL_01b6: ldfld int32 MGSC.DamageHitInfo::finalDmg
		IL_01bb: stfld int32 MGSC.DamageHitInfo::dirtyDmg
		// return;
		IL_01c0: ret
	} // end of method DamageHitInfo::.ctor

	.method public hidebysig 
		instance void Clone (
			class MGSC.DamageHitInfo source
		) cil managed 
	{
		// Method begins at RVA 0x17dd0
		// Header size: 12
		// Code size: 301 (0x12d)
		.maxstack 2

		// info = source.info;
		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: ldfld valuetype MGSC.DmgInfo MGSC.DamageHitInfo::info
		IL_0007: stfld valuetype MGSC.DmgInfo MGSC.DamageHitInfo::info
		// wasMiss = source.wasMiss;
		IL_000c: ldarg.0
		IL_000d: ldarg.1
		IL_000e: ldfld bool MGSC.DamageHitInfo::wasMiss
		IL_0013: stfld bool MGSC.DamageHitInfo::wasMiss
		// wasCrit = source.wasCrit;
		IL_0018: ldarg.0
		IL_0019: ldarg.1
		IL_001a: ldfld bool MGSC.DamageHitInfo::wasCrit
		IL_001f: stfld bool MGSC.DamageHitInfo::wasCrit
		// wasOutOfRange = source.wasOutOfRange;
		IL_0024: ldarg.0
		IL_0025: ldarg.1
		IL_0026: ldfld bool MGSC.DamageHitInfo::wasOutOfRange
		IL_002b: stfld bool MGSC.DamageHitInfo::wasOutOfRange
		// dirtyDmg = source.dirtyDmg;
		IL_0030: ldarg.0
		IL_0031: ldarg.1
		IL_0032: ldfld int32 MGSC.DamageHitInfo::dirtyDmg
		IL_0037: stfld int32 MGSC.DamageHitInfo::dirtyDmg
		// finalDmg = source.finalDmg;
		IL_003c: ldarg.0
		IL_003d: ldarg.1
		IL_003e: ldfld int32 MGSC.DamageHitInfo::finalDmg
		IL_0043: stfld int32 MGSC.DamageHitInfo::finalDmg
		// woundChanceBonus = source.woundChanceBonus;
		IL_0048: ldarg.0
		IL_0049: ldarg.1
		IL_004a: ldfld float32 MGSC.DamageHitInfo::woundChanceBonus
		IL_004f: stfld float32 MGSC.DamageHitInfo::woundChanceBonus
		// woundChanceMult = source.woundChanceMult;
		IL_0054: ldarg.0
		IL_0055: ldarg.1
		IL_0056: ldfld float32 MGSC.DamageHitInfo::woundChanceMult
		IL_005b: stfld float32 MGSC.DamageHitInfo::woundChanceMult
		// painMult = source.painMult;
		IL_0060: ldarg.0
		IL_0061: ldarg.1
		IL_0062: ldfld float32 MGSC.DamageHitInfo::painMult
		IL_0067: stfld float32 MGSC.DamageHitInfo::painMult
		// silenceDmg = source.silenceDmg;
		IL_006c: ldarg.0
		IL_006d: ldarg.1
		IL_006e: ldfld bool MGSC.DamageHitInfo::silenceDmg
		IL_0073: stfld bool MGSC.DamageHitInfo::silenceDmg
		// doAmpOnWound = source.doAmpOnWound;
		IL_0078: ldarg.0
		IL_0079: ldarg.1
		IL_007a: ldfld bool MGSC.DamageHitInfo::doAmpOnWound
		IL_007f: stfld bool MGSC.DamageHitInfo::doAmpOnWound
		// woundBonus = source.woundBonus;
		IL_0084: ldarg.0
		IL_0085: ldarg.1
		IL_0086: ldfld valuetype MGSC.WoundBonus MGSC.DamageHitInfo::woundBonus
		IL_008b: stfld valuetype MGSC.WoundBonus MGSC.DamageHitInfo::woundBonus
		// dangerPosition = source.dangerPosition;
		IL_0090: ldarg.0
		IL_0091: ldarg.1
		IL_0092: ldfld valuetype MGSC.CellPosition MGSC.DamageHitInfo::dangerPosition
		IL_0097: stfld valuetype MGSC.CellPosition MGSC.DamageHitInfo::dangerPosition
		// resistModifier = source.resistModifier;
		IL_009c: ldarg.0
		IL_009d: ldarg.1
		IL_009e: ldfld float32 MGSC.DamageHitInfo::resistModifier
		IL_00a3: stfld float32 MGSC.DamageHitInfo::resistModifier
		// statusEffectId = source.statusEffectId;
		IL_00a8: ldarg.0
		IL_00a9: ldarg.1
		IL_00aa: ldfld string MGSC.DamageHitInfo::statusEffectId
		IL_00af: stfld string MGSC.DamageHitInfo::statusEffectId
		// statusEffectDmgMult = source.statusEffectDmgMult;
		IL_00b4: ldarg.0
		IL_00b5: ldarg.1
		IL_00b6: ldfld float32 MGSC.DamageHitInfo::statusEffectDmgMult
		IL_00bb: stfld float32 MGSC.DamageHitInfo::statusEffectDmgMult
		// statusEffectChanceToApplyBonus = source.statusEffectChanceToApplyBonus;
		IL_00c0: ldarg.0
		IL_00c1: ldarg.1
		IL_00c2: ldfld float32 MGSC.DamageHitInfo::statusEffectChanceToApplyBonus
		IL_00c7: stfld float32 MGSC.DamageHitInfo::statusEffectChanceToApplyBonus
		// statusEffectDmgModBonus = source.statusEffectDmgModBonus;
		IL_00cc: ldarg.0
		IL_00cd: ldarg.1
		IL_00ce: ldfld float32 MGSC.DamageHitInfo::statusEffectDmgModBonus
		IL_00d3: stfld float32 MGSC.DamageHitInfo::statusEffectDmgModBonus
		// statusEffectResistModBonus = source.statusEffectResistModBonus;
		IL_00d8: ldarg.0
		IL_00d9: ldarg.1
		IL_00da: ldfld float32 MGSC.DamageHitInfo::statusEffectResistModBonus
		IL_00df: stfld float32 MGSC.DamageHitInfo::statusEffectResistModBonus
		// weaponArmorPen = source.weaponArmorPen;
		IL_00e4: ldarg.0
		IL_00e5: ldarg.1
		IL_00e6: ldfld float32 MGSC.DamageHitInfo::weaponArmorPen
		IL_00eb: stfld float32 MGSC.DamageHitInfo::weaponArmorPen
		// damageDealer = source.damageDealer;
		IL_00f0: ldarg.0
		IL_00f1: ldarg.1
		IL_00f2: ldfld class MGSC.Creature MGSC.DamageHitInfo::damageDealer
		IL_00f7: stfld class MGSC.Creature MGSC.DamageHitInfo::damageDealer
		// ampChanceBonus = source.ampChanceBonus;
		IL_00fc: ldarg.0
		IL_00fd: ldarg.1
		IL_00fe: ldfld float32 MGSC.DamageHitInfo::ampChanceBonus
		IL_0103: stfld float32 MGSC.DamageHitInfo::ampChanceBonus
		// usedWeapon = source.usedWeapon;
		IL_0108: ldarg.0
		IL_0109: ldarg.1
		IL_010a: ldfld bool MGSC.DamageHitInfo::usedWeapon
		IL_010f: stfld bool MGSC.DamageHitInfo::usedWeapon
		// wasStun = source.wasStun;
		IL_0114: ldarg.0
		IL_0115: ldarg.1
		IL_0116: ldfld bool MGSC.DamageHitInfo::wasStun
		IL_011b: stfld bool MGSC.DamageHitInfo::wasStun
		// corrosiveModifier = source.corrosiveModifier;
		IL_0120: ldarg.0
		IL_0121: ldarg.1
		IL_0122: ldfld float32 MGSC.DamageHitInfo::corrosiveModifier
		IL_0127: stfld float32 MGSC.DamageHitInfo::corrosiveModifier
		// }
		IL_012c: ret
	} // end of method DamageHitInfo::Clone

	.method public hidebysig 
		instance void ProcessResist (
			class MGSC.IDestroyable target
		) cil managed 
	{
		// Method begins at RVA 0x17f0c
		// Header size: 12
		// Code size: 72 (0x48)
		.maxstack 4
		.locals init (
			[0] float32
		)

		// float resist = target.GetResist(info.damage);
		IL_0000: ldarg.1
		IL_0001: ldarg.0
		IL_0002: ldflda valuetype MGSC.DmgInfo MGSC.DamageHitInfo::info
		IL_0007: ldfld string MGSC.DmgInfo::damage
		IL_000c: callvirt instance float32 MGSC.IDestroyable::GetResist(string)
		IL_0011: stloc.0
		// if (Mathf.Abs(resist - 1f) < Mathf.Epsilon)
		IL_0012: ldloc.0
		IL_0013: ldc.r4 1
		IL_0018: sub
		IL_0019: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Abs(float32)
		IL_001e: ldsfld float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Epsilon
		IL_0023: bge.un.s IL_002d

		// finalDmg = 0;
		IL_0025: ldarg.0
		IL_0026: ldc.i4.0
		IL_0027: stfld int32 MGSC.DamageHitInfo::finalDmg
		// }
		IL_002c: ret

		// finalDmg = Mathf.FloorToInt((float)finalDmg * (1f - resist));
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
