using MGSC;
using System;

namespace MoreCombatInfo
{
    internal static class HitLogUtils
    {

        /// <summary>
        /// A special prefix used to bypass localization attempts.  This prevents this mod's log entries from 
        /// having warnings added to the Player.log.
        /// </summary>
        public const string MessagePrefix = "_+_ ";

        public static AttackData AttackData { get; set; } = new AttackData();


        /// <summary>
        /// If true, will invert the roll.  Ex: To Hit of 10 requires a roll of 10 or higher.
        /// </summary>
        public static bool InvertToHit = true;

        /// <summary>
        /// The current and previous attacker name.
        /// </summary>
        public static HistoricalInfo<string> Attacker = new HistoricalInfo<string>();

        /// <summary>
        /// The current and previous round number.  Used to put down a new attacker header.
        /// </summary>
        public static HistoricalInfo<int> RoundNumber = new HistoricalInfo<int>();

        public static void SetHitRoll(float hitRoll, float accuracy, bool autoHit)
        {
            AttackData.HitRoll = hitRoll;
            AttackData.Accuracy = accuracy;
            AttackData.IsAutoHit = autoHit;
        }

        /// <summary>
        /// Sets the name of the current attacker for the hit log system.
        /// This sets the attacker to null both the attacker and target are not seen by the player.
        /// This is how the game handles it.
        /// </summary>
        /// <param name="attacker"></param>
        /// <returns>Returns true if the player can see the combatants.</returns>
        private static bool SetCombatants(Creature attacker, Creature target)
        {
            //Game checks for seen.  Also want to see attacks on player from unseen.
            //  Otherwise only the first hit will be logged and not all the shots.
            //Mono doesn't seem to like target?.IsSeenByPlayer.
            if (target is Player ||  attacker.IsSeenByPlayer || ( target != null  && target.IsSeenByPlayer))
            {

                //Set the name of the attacker from the shoot action.
                Attacker.Current = GetAttackerName(attacker);
            }
            else
            {
                Attacker.Current = null;
            }

            return Attacker.Current != null;
        }

        private static string GetAttackerName(Creature creature)
        {
            string uniqueId = creature is Player ? "" : " " + creature.CreatureData.UniqueId;
            CombatLogCreatureInfo result = CombatLogSystem.GetCreatureInfo(creature);
            return
                "----------- ".WrapInColor(Colors.LightRed) +
                $"{result.Localize()} {uniqueId}".WrapInColor(Colors.Green);
                
        }

        /// <summary>
        /// Creates the hit log
        /// </summary>
        /// <param name="attackData"></param>
        /// <param name="entry">Optional.  A previously added "holder" message to be overwritten with the log info.  
        /// Otherwise a new entry will be created</param>
        public static void CreateHitLog(AttackData attackData, MessageLogEntry entry = null)
        {
            if (!SetCombatants(attackData.Attacker, attackData.Target)) return;
            HitLogUtils.CreateAttackerHeader(attackData.Attacker, AttackData.Target);

            CreateHitLog(attackData.Accuracy, attackData.HitRoll, attackData.Dodge, attackData.IsAutoHit, attackData.WasMiss, entry);
        }


        /// <summary>
        /// Creates the header in the combat log for the attacker name.
        /// This returns false if the player cannot see the attacker or target.
        /// </summary>
        /// <param name="attacker"></param>
        /// <param name="target"></param>
        /// <returns>Returns false if the player cannot see the attacker or the target</returns>
        public static bool CreateAttackerHeader(Creature attacker, Creature target)
        {
            bool canSee = SetCombatants(attacker, target);

            if (!canSee) return false;

            RaidMetadata raidMetadata = Plugin.State.Get<RaidMetadata>();
            CombatLog combatLog = Plugin.State.Get<CombatLog>();

            bool roundHasChanged = raidMetadata.TurnNumber != RoundNumber.Current;

            RoundNumber.Current = raidMetadata.TurnNumber;

            if (roundHasChanged || Attacker.Current != Attacker.Previous)
            {
                Attacker.Previous = Attacker.Current;

                //TEMP: The future version of the game will allow restoring user types from saves.
                MessageLogEntry attackerMessage = new MessageLogEntry()
                {
                    Color = Colors.LightRed,
                    MessageTag = $"{MessagePrefix}{Attacker.Current}"
                };
                CombatLogSystem.AddEntry(raidMetadata, combatLog, attackerMessage);
            }

            return true;
        }

        /// <summary>
        /// Creates an empty message log entry and adds it to the combat log.
        /// This allows the entry to be filled in with data at a later point.
        /// </summary>
        /// <returns></returns>
        public static MessageLogEntry PreCreateMessageLogEntry()
        {

            RaidMetadata raidMetadata = Plugin.State.Get<RaidMetadata>();
            CombatLog combatLog = Plugin.State.Get<CombatLog>();

            MessageLogEntry entry = new MessageLogEntry()
            {
                Color = Colors.Yellow,
                MessageTag = $"{MessagePrefix}temporary"
            };

            CombatLogSystem.AddEntry(raidMetadata, combatLog, entry);

            return entry;
        }

        /// <summary>
        /// Creates a formatted hit log.  If the entry parameter is set, that object's data will be filled in with
        /// the message info.
        /// </summary>
        /// <param name="accuracy"></param>
        /// <param name="hitRoll"></param>
        /// <param name="baseDodge"></param>
        /// <param name="isAutoHit"></param>
        /// <param name="wasMiss"></param>
        /// <param name="entry"></param>
        private static void CreateHitLog(float accuracy, float hitRoll, float baseDodge, bool isAutoHit, bool wasMiss, 
            MessageLogEntry entry = null)
        {

            RaidMetadata raidMetadata = Plugin.State.Get<RaidMetadata>();
            CombatLog combatLog = Plugin.State.Get<CombatLog>();

            bool roundHasChanged = raidMetadata.TurnNumber != RoundNumber.Current;
            RoundNumber.Current = raidMetadata.TurnNumber;

            string hitString = wasMiss ? "Miss".WrapInColor(Colors.LightRed) : "Hit";
            hitString = "[".WrapInColor(Colors.Yellow) + hitString + "]".WrapInColor(Colors.Yellow);

            //Invert the "accuracy" number so users get a familiar To Hit representation.
            int toHit = (int)((InvertToHitValue(accuracy)) * 100f);
            int invertedRoll = (int)((InvertToHitValue(hitRoll)) * 100);

            string message = $"{hitString} " +
                $"To Hit: {toHit} Roll: {invertedRoll} " +
                $"Dodge: {baseDodge * 100:N0}";

            bool addNewEntry = false;

            if(entry == null)
            {
                entry = new MessageLogEntry();
                addNewEntry = true;
            }

            entry.Color = Colors.Yellow;
            entry.MessageTag = $"{MessagePrefix}{message}";

            if (addNewEntry)
            {
                CombatLogSystem.AddEntry(raidMetadata, combatLog, entry);
            }
        }

        private static float InvertToHitValue(float value)
        {
            return InvertToHit ? (1f - value) : value;  
        }
    }
}
