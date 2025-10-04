using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using MGSC;
using Newtonsoft.Json;
using UnityEngine;

namespace MoreCombatInfo_Bootstrap
{
    public static class Main
    {

        public static Logger Log = new Logger();
        public static HookEvents HookEvents { get; set; }
        public static BootstrapMod BootstrapMod { get; set; }

        [Hook(ModHookType.BeforeBootstrap)]
        public static void Init(IModContext context)
        {

            try
            {

                string modPath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);

                BetaConfig config = JsonConvert.DeserializeObject<BetaConfig>(File.ReadAllText(Path.Combine(modPath, "version-info.json")));
                bool isBeta = GetNumericVersion(Application.version) >= GetNumericVersion(config.BetaVersion);

                if (isBeta)
                {
                    Log.LogWarning("Beta version detected.");
                    if (config.DisableBeta)
                    {
                        Log.LogError("Beta version is disabled.  Mod is disabled.");
                        return;
                    }
                }
                else
                {
                    if (config.DisableStable)
                    {
                        Log.LogError("Stable version is disabled.  Mod is disabled.");
                        return;
                    }
                }


                string modDir = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
                Assembly modAssembly = Assembly.LoadFile(Path.Combine(modDir, isBeta ? "beta" : "stable", "MoreCombatInfo.dll"));

                //Using reflection to prevent cyclic dependency
                Type bootstrapModType = modAssembly.GetTypes().Where(x => x.IsSubclassOf(typeof(BootstrapMod))).FirstOrDefault();

                if (bootstrapModType == null)
                {
                    Log.LogError("Could not find the BootstrapMod entry in the assembly.");
                    return;
                }

                HookEvents = new HookEvents();

                BootstrapMod = (BootstrapMod)Activator.CreateInstance(bootstrapModType, new object[] { HookEvents, isBeta });

            }
            catch (Exception ex)
            {
                Log.LogError(ex, "Error loading Map Markers mod."); 
            }
        }


        [Hook(ModHookType.AfterConfigsLoaded)]
        public static void AfterConfigsLoadedCallback(IModContext context) => HookEvents.AfterConfigsLoaded?.Invoke(context);


        private static Version GetNumericVersion(string versionString)
        {
            // Use regex to extract only numeric parts separated by dots
            var numericParts = Regex.Matches(versionString, @"\d+")
                .Cast<Match>()
                .Select(m => m.Value)
                .ToList();

            // Pad with zeros if less than 4 parts (Version requires at least major, minor)
            while (numericParts.Count < 2)
                numericParts.Add("0");

            // Build version string
            string numericVersion = string.Join(".", numericParts);

            // If more than 4 parts, only take first 4
            var split = numericVersion.Split('.');
            if (split.Length > 4)
                numericVersion = string.Join(".", split.Take(4));

            return new Version(numericVersion);
        }
    }

}
