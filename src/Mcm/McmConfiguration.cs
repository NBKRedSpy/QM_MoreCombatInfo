using ModConfigMenu;
using ModConfigMenu.Objects;
using System.Collections.Generic;

namespace MoreCombatInfo.Mcm
{
    internal class McmConfiguration : McmConfigurationBase
    {

        public McmConfiguration(ModConfig config, Logger logger) : base(config, logger) { }

        public override void Configure()
        {
            ModConfigMenuAPI.RegisterModConfig("More Combat Info", new List<ConfigValue>()
            {
                CreateConfigProperty(nameof(ModConfig.InvertToHit),
                    "If true, will change the roll for the To Hit to need to be over the target."),
            }, OnSave);
        }

        protected override bool OnSave(Dictionary<string, object> currentConfig, out string feedbackMessage)
        {
            bool isSuccess = base.OnSave(currentConfig, out feedbackMessage);

            if(isSuccess)  Plugin.UpdatePatchSettings();
            return isSuccess;
        }
    }
}
