using MGSC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoreCombatInfo
{

    /// <summary>
    /// Holds all of the data that is extracted from multiple patches.  
    /// Required to make a combat entry.
    /// </summary>
    internal class AttackData
    {
        /// <summary>
        /// player or Monster that is the attacker.
        /// </summary>
        public Creature Attacker { get; set;} = null;

        /// <summary>
        /// Player or Monster that is the target of the attack.
        /// </summary>
        public Creature Target { get; set;} = null;

        /// <summary>
        /// True if this is an auto hit.  Generally this is from a property on the weapon.
        /// </summary>
        public bool IsAutoHit { get; set;} = false;

        /// <summary>
        /// The Last random roll for the to hit.
        /// </summary>
        public float HitRoll { get; set;} = 0f;

        /// <summary>
        /// The required roll to hit.  Intenrally this is known as the accuracy.
        /// </summary>
        public float Accuracy { get; set;} = 0f;

        /// <summary>
        /// The dodge of the target.  Just for information purposes.  Already included in the accuracy.
        /// </summary>
        public float Dodge { get; set;} = 0f;

        public bool WasMiss { get; set;} = false;

    }
}
