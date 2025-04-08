using HarmonyLib;
using MGSC;
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

        public static Logger Logger = new Logger();


        public static State State;



        [Hook(ModHookType.AfterConfigsLoaded)]
        public static void AfterConfig(IModContext context)
        {
            State = context.State;


            Harmony harmony = new Harmony("NBKRedSpy_" + ConfigDirectories.ModAssemblyName);
            harmony.PatchAll();
        }


    }
}
