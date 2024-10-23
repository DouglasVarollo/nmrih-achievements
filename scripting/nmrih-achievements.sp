#include <morecolors>
#include <sourcemod>

public Plugin myinfo =
{
	author      = "Douglas Varollo",
	description = "Announces in chat when a player unlocks an achievement",
	name        = "[NMRiH] Achievements",
	url         = "https://github.com/DouglasVarollo/nmrih-achievements",
	version     = "1.0.0"
};

void OnAchievementEarned(Event event, const char[] name, bool dontBroadcast)
{
	int achievement = event.GetInt("achievement");
	int client      = event.GetInt("player");

	MC_PrintToChatAll("%t", "Achievement Earned", client, achievement);
}

public void OnPluginStart()
{
	HookEvent("achievement_earned", OnAchievementEarned);

	LoadTranslations("nmrih-achievements.phrases");
}