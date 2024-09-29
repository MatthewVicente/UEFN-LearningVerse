
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /Verse.org/Random }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
Lesson_05 := class(creative_device):
    # Properties: Player Health, Enemy Health
    var PlayerHealth : int = 100
    var EnemyHealth : int = 100

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        StartGame()

    StartGame() : void=
        loop:
            Attackenemy()
            EnemyAttackPlayer()
            # := sets the type of the var equals to the return of the function
            Fighting := IsBattleInProgress()
            if (Fighting = false) { break }

        set PlayerHealth += GenerateRandomHealthPotion()

    Attackenemy() : void=
        set EnemyHealth -= GetRandomInt(1,10)
        Print("Enemy HP: {EnemyHealth}")

    EnemyAttackPlayer() : void=
        set PlayerHealth -= GetRandomInt(1,10)
        Print("Player HP: {PlayerHealth}")

    IsBattleInProgress() : logic=
        if (PlayerHealth <= 0):
            Print("Enemy defeated Player")
            return false
        else if (EnemyHealth <= 0):
            Print("Player defeated Enemy")
            return false
        else:
            Print("The battle continues!")
            return true
    
    GenerateRandomHealthPotion() : int=
        return GetRandomInt(10,50)