using HarmonyLib;
using MGSC;
using MoreCombatInfo.Mcm;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace MoreCombatInfo
{
    public static class Plugin
    {

        public static ConfigDirectories ConfigDirectories = new ConfigDirectories();
        public static ModConfig Config { get; private set; }

        public static Logger Logger = new Logger();

        public static State State;


        private static McmConfiguration McmConfiguration;


        [Hook(ModHookType.AfterConfigsLoaded)]
        public static void AfterConfig(IModContext context)
        {
            State = context.State;
            Directory.CreateDirectory(ConfigDirectories.ModPersistenceFolder);
            Config = ModConfig.LoadConfig(ConfigDirectories.ConfigPath);

            McmConfiguration = new McmConfiguration(Config, Plugin.Logger);
            McmConfiguration.TryConfigure();

            UpdatePatchSettings();

            Harmony harmony = new Harmony("NBKRedSpy_" + ConfigDirectories.ModAssemblyName);
            harmony.PatchAll();
        }

        public static void UpdatePatchSettings()
        {
            HitLogUtils.InvertToHit = Config.InvertToHit;

        }


    }
}
