
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
Lesson_02 := class(creative_device):

    var PlayerTotalHealth : int = 100
    var EnemyAttackDamage : int = 10
    var PlayerDefense : int = 5
    var SpecialAttackDamage : float = 65.0
    var BaseAttackDamage : int = 20

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        Print("Player Health: {PlayerTotalHealth}")
        Print("Enemy attacked player for {EnemyAttackDamage} damage")
        set PlayerTotalHealth -= (PlayerDefense - EnemyAttackDamage)
        Print("Player Health: {PlayerTotalHealth}")

        # Constant variable
        HealthPotion : int = 20

        set PlayerTotalHealth += HealthPotion
        Print("Health: {PlayerTotalHealth}")

        SpecialAttack01 : float = SpecialAttackDamage / 3.0
        Print("Speacial Attack 01: {SpecialAttack01}")

        PowerUpMultiple : int = 3
        TempAttackDamage : int = BaseAttackDamage * PowerUpMultiple