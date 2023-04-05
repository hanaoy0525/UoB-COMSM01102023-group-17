# 2023-group-17
Group Members:
Eamon,
Yutao Mo,
Haoyan Wang,
Yinyue Zhang,
Yujie Shi(Mason).

![alt text](https://github.com/UoB-COMSM0110/2023-group-17/blob/main/GroupPicture.jpeg?raw=true)

# Project Report 

## Introduction 
Our game is a platformer where you must control a character and bounce from platform to platform while endlessly climbing higher and avoiding falling. There are no levels in this game, instead the platforms are randomly generated each session. As the player climbs higher their score increases. This is important for player feedback as they know they are doing a good job when the score is increasing while also allowing for replayability as players want to try and get a higher score. 

Our game is based around Doodle Jump, released in 2009 originally for iOS devices.  The gimmick for our game is having the player constantly be chased by lava. This prevents the possibility of players idling for a long period of time and provides an incentive for them to move quickly. 

The appeal of the game comes from its simplicity. There are only two inputs, left arrow and right arrow. This means it is easily accessible for players of any skill level. Each play session is also very quick, only lasting a few minutes but with the possibility of lasting for an infinite amount of time. This makes it a suitable game to pick up and play quickly which was why the original Doodle Jump was such a huge success on mobile devices.

## Requirements 
As a team we decided we should make a casual game that would appeal to a mass audience. The bigarea of inspiration we looked to were mobile games. We devised a list of games we had all played at one point with an emphasis on listing games of different genres. This list included strategy games such as Bloons Tower Defence, endless runners such as Temple Run, platformers such as Jetpack Joyride, co-op games such as Fireboy and Watergirl and puzzle games such as Angry Birds. When narrowing down what game we should make we thought about our target demographic. We decide to come up with some user stories for a mass gamer audience:

“As a casual gamer I want a simple and fun experience”.
“As a regular gamer I want a challenge to overcome”.
“As an avid gamer I want to prove I am the best”.

Looking at the casual gamer audience we decided it would be a bad idea to make a strategy game with complicated mechanics. Though it may appeal to more dedicated gamers, a casual might be put off by having to dedicate a large amount of time to learning the game. A casual would be drawn to something with more instant gratification. We also ruled out the idea of a co-op game. This was because it would be less accessible to people if a second person was required to be able to play the game. 

This left us with the decision between puzzle and platformer style games. We had also concluded that puzzle games may not fit the wide audience that we are trying to reach. For example, hardcore gamers may see it as too slow and casual for them. As a team we thought it would be more efficient to make a randomly generated game instead of building many individual levels. This officially ruled out puzzle games which would require complex levels to be developed. We decided on a platformer game that would include elements from endless runners. This would appease casual fans with its simple controls and pickup-and-play style. Regular games would have fun with a game that gets more difficult as it progresses. The game would also include a score, a staple of endless runners, which would allow avid gamers to compete to find the highest score. 

We decided to take inspiration from Doodle Jump specifically. This was because we were encouraged to not make a 3d game like temple run. We also thought a game where you progress by climbing up would be nice visual feedback for the player to see their character physically go up alongside their score. This as opposed to 2d platformers where they move horizontally. 

We developed a case diagram for this proposed game:

![alt text](https://github.com/UoB-COMSM0110/2023-group-17/blob/main/Documents/Diagrams/Software%20Engineering%20Game%20Use%20Case%20Diagram.png)

The diagram emphasized the simple user interaction that we were aiming for. One button to start playing, then another to play again when there is a game over. It also includes a very simple settings menu. This additional difficulty option was also included for avid gamers looking for even more of a challenge. 

When deciding on a special gimmick for our version of Doodle Jump we looked at any issues we found in the original game. One problem was the option for player to be idle by bouncing on the same platform continuously. Though this meant the score would not increase we thought there was no real incentive for the player to keep moving at a faster pace. We decided to implement an object that would follow the player from below them, always forcing the player to move at a brisk pace and not staying at one spot for too long. This would also be good for a difficulty option as they object can be sped up or slowed down according to the player’s needs.