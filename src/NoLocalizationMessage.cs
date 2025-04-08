using MGSC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace MoreCombatInfo
{
    /// <summary>
    /// A CombatLogEntry that uses the string directly instead of Localization
    /// </summary>
    /// <remarks>Avoids the "missing localization key" log text. </remarks>
    public class NoLocalizationMessage : CombatLogEntry
    {
        [Save]
        public string Message { get; set; }

        [Save]
        public Color Color { get; set; }

        public override string GetFormattedOutput()
        {
            return Message.WrapInColor(Color);
        }
    }
}
