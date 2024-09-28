
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /Verse.org/Random }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
Lesson_03 := class(creative_device):

    var PlayerHealth : int = 100
    var EnemyAttackDamage : int = 51

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        set PlayerHealth -= EnemyAttackDamage

        if (PlayerHealth <= 0):
            Print("Player Died")

        Print("Player Flintched. Enemy attacks again.")
        set PlayerHealth -= EnemyAttackDamage

        if (PlayerHealth <= 0):
            Print("Player Died")

        var PlayerDiceResult : int = GetRandomInt(1,20)
        var EnemyDiceResult : int = GetRandomInt(1,20)

        set PlayerHealth = 100
        Print("Player and Enemy rolled dice")
        Print("Player dice: {PlayerDiceResult}")
        Print("Enemy dice: {EnemyDiceResult}")

        if (EnemyDiceResult > PlayerDiceResult):
            set PlayerHealth -= EnemyAttackDamage
            Print("Enemy Attack Successful! Player HP is now: {PlayerHealth}")
        else if (EnemyDiceResult = PlayerDiceResult):
            set PlayerHealth -= 1
            Print("Roll was a tie. Player lost 1 HP")
        else:
            Print("The Enemy missed!")

        # Only let enemy attack player if player has more than 50 health
        if:
            EnemyDiceResult > PlayerDiceResult
            PlayerHealth > 50
        then:
            set PlayerHealth -= EnemyAttackDamage
        else:
            Print("The enemy missed!")

        if (EnemyDiceResult > PlayerDiceResult) { Print("Enemy is attacking") }