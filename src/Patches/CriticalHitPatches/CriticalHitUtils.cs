using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace MoreCombatInfo.Patches.CriticalHitPatches
{
    internal static class CriticalHitUtils
    {
        /// <summary>
        /// If the attack is critical, return the damage as a negative value to indicate a critical hit.
        /// Used as a signal to the GetFormattedOuptput methods to add critical hit information.
        /// </summary>
        /// <param name="wasCrit"></param>
        /// <param name="damage"></param>
        /// <returns></returns>
        public static int GetCritDamageFlag(bool wasCrit, int damage)
        {
            return wasCrit ? damage * -1 : damage;
        }

        /// <summary>
        /// If the damage is negative, it indicates a critical hit.
        /// Find the damage from the already formatted string and swap it out for the "!" critical hit version.
        /// </summary>
        /// <param name="finalDmg"></param>
        /// <param name="formattedText">The text that may contain the negative damage signal.</param>

        /// <returns></returns>
        internal static void UpdateCriticalHit(int finalDmg, ref string formattedText)
        {
            if(finalDmg < 0)
            {

                string damageString = finalDmg.ToString();  //Match the local formatting.

                //Note - I don't think reformatting the * -1 is necessary, but just in case there
                //  is some formatting I don't know about.  Doesn't matter for performance.
                formattedText = formattedText.Replace(damageString, (finalDmg * -1).ToString() + "!");
            }
        }
    }
}
