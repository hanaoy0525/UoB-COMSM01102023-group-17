# 2023-group-17

| Group Members: |
| ------------- |
| Yutao Mo |
| Eamon Morrissey |
| Yujie Shi(Mason) |
| Haoyan Wang |
| Yinyue Zhang |

![alt text](https://github.com/UoB-COMSM0110/2023-group-17/blob/main/GroupPicture.jpeg?raw=true)

# Project Report 

## Introduction 

Our game is a platformer where you must control a character and bounce from platform to platform while endlessly climbing higher and avoiding falling. There are no levels in this game, instead the platforms are randomly generated each session. As the player climbs higher their score increases. This is important for player feedback as they know they are doing a good job when the score is increasing while also allowing for replayability as players want to try and get a higher score. 

Our game is based around Doodle Jump, released in 2009 originally for iOS devices.  The gimmick for our game is having the player constantly be chased by lava. This prevents the possibility of players idling for a long period of time and provides an incentive for them to move quickly. 

The appeal of the game comes from its simplicity. There are only two inputs, left arrow and right arrow. This means it is easily accessible for players of any skill level. Each play session is also very quick, only lasting a few minutes but with the possibility of lasting for an infinite amount of time. This makes it a suitable game to pick up and play quickly which was why the original Doodle Jump was such a huge success on mobile devices.

## Requirements 

As a team we decided we should make a casual game that would appeal to a mass audience. The big area of inspiration we looked to were mobile games. We devised a list of games we had all played at one point with an emphasis on listing games of different genres. 

| Game  | Genre |
| ------------- | ------------- |
| Bloons Tower Defense  | strategy  |
| Temple Run  | endless runner  |
| Jetpack Joyride | platformer |
| Fireboy and Watergirl | co-op |
| Candy Crush | puzzle | 

When narrowing down what game we should make we thought about our target demographic. We decide to come up with some user stories for a mass gamer audience:

“As a casual gamer I want a simple and fun experience”.

“As a regular gamer I want a challenge to overcome”.

“As an avid gamer I want to prove I am the best”.

Looking at the casual gamer audience we decided it would be a bad idea to make a strategy game with complicated mechanics. Though it may appeal to more dedicated gamers, a casual might be put off by having to dedicate a large amount of time to learning the game. A casual would be drawn to something with more instant gratification. We also ruled out the idea of a co-op game. This was because it would be less accessible to people if a second person was required to be able to play the game. 

This left us with the decision between puzzle and platformer style games. As a team we thought it would be more efficient to make a randomly generated game instead of building many individual levels. This ruled out puzzle games which would require complex levels to be developed. We decided on a platformer game that would include elements from endless runners. This would appease casual fans with its simple controls and pickup-and-play style. Regular games would have fun with a game that gets more difficult as it progresses. The game would also include a score, a staple of endless runners, which would allow avid gamers to compete to achieve the highest score. 

We decided to take inspiration from Doodle Jump specifically. This was because we were encouraged to not make a 3d game, like temple run. We also thought a game where you progress by climbing up would be nice visual feedback for the player to see their character physically go up alongside their score. This as opposed to 2d platformers where they move horizontally. 

We developed a case diagram for this proposed game:

![alt text] (https://github.com/UoB-COMSM0110/2023-group-17/blob/main/Documents/Diagrams/Software%20Engineering%20Game%20Use%20Case%20Diagram.png)

The diagram emphasized the simple user interaction that we were aiming for. One button to start playing, then another to play again when there is a game over. It also includes a very simple settings menu. This additional difficulty option was also included for avid gamers looking for even more of a challenge. 

When deciding on a special gimmick for our version of Doodle Jump we looked at any issues we found in the original game. One problem was the option for player to be idle by bouncing on the same platform continuously. Though this meant the score would not increase we thought there was no real incentive for the player to keep moving at a faster pace. We decided to implement an object that would follow the player from below them, always forcing the player to move at a brisk pace and not staying at one spot for too long. This would also be good for a difficulty option as this object can be sped up or slowed down according to the player’s needs.

As a team we made a [paper prototype] (https://raw.githubusercontent.com/UoB-COMSM0110/2023-group-17/main/PaperPrototype.mp4) to test out our game. This further solidified our game choice as we had a lot of fun playing our game. We showed our prototype to members of other groups and got positive feedback from our simple premise and fun game design.

## Design

When discussing the architecture of our game we decided it would be best to organize and plan our ideas through class and sequence diagrams. 

In our class diagram the game class is at the top of the hierarchy. It stores and sets the current game state. It also contains an array list of all the figures currently in the game. This means we can freely add and remove figures during gameplay. The screen class dictates what the player sees, including having a current score always present. As there is only one display for the player there is only one screen class present per game. The screen class also dictates the state of the game, setting the start screen upon launching the game and presenting a game over screen when the player loses. When a platform goes out of bounds the screen class will remove it from the array list where it will then be replaced by a new platform at the top of the screen. 

Creating the class diagram allowed everyone on the team to get an idea of the different aspects of the game that we would be making. We were able to organize and illustrate our ideas while getting a better understanding of how they relate together in a system structure. It was also important to make early on as it allowed us to brainstorm different methods and concepts for each class and decide which ones were not needed. For example, the scrollSpeed integer idea was dropped as we developed different ideas for moving the player upwards. 

For the figure class in our game, we created four sub classes. As these sub classes all interact with each other they have an association. For example, if the player class were to touch the platform class it would call the bounce function. They all inherit the x and y location attribute from the figure class as it allows each figure to have its own location on the screen. The platform subclass has multiple variations. For example, a platform that was destroyed and would fall if the player makes contact. Further inheritance classes were made to represent this. These classes would have their own individual methods to show their specialization.  Our idea was to have a set destroyed function in the destroyed platform class which, when active, would remove any collision detection between the player and platform. These subclasses would also inherit methods from the platform class, allowing them all to detect contact with the player in a similar way. 

![alt text](https://github.com/UoB-COMSM0110/2023-group-17/blob/main/Documents/Diagrams/Software%20Engineering%20Game%20Class%20Diagram.png)

Our sequence diagram was made to understand how each participant in the system interacts over a period of time when an event occurs in the game. In this sequence diagram we used the example of the player inputting a basic command to move the character. 

![alt text](https://github.com/UoB-COMSM0110/2023-group-17/blob/main/Documents/Diagrams/Software%20Engineering%20Game%20Sequence%20Diagram.png)

The user’s input sends the message to the screen that the character has moved. This method changes the x and y variables of the player class and is displayed on the screen. The player class must then come into contact with another figure, these being either the enemy or platform class. The use of the alternative interaction frames in a sequence diagram allows us to show these two outcomes. When the player comes into contact with a figure it must send a message to request the figure type. If it is an enemy then a game over is returned to the screen. The screen then returns a game over to the user. If the figure is a platform, no matter what type, it will return a bounce function to the screen. The figure then returns an updateLocation message to the player class so its x and y locations can be correctly updated to respresent that the chracter has moved upwards. 

Over time the player class exists until they reach a game over. At this point the user is only able to interect with the screen to start a new game or access the settings. The screen is always active as it is needed to constantly provide visual feedback to the user, letting them know where their character is on the screen as well as displaying the game over page. The figures are active only when they are being interacted with by the player. The figure types are identified when an individual figure is being displayed and when a figure type is being requested. When the updateLocation function is called the location of the figures move down to simulate the player is moving up. If a figure is out of bounds it will cease to exist.

## Implementation 

As we had decided to write all the code from scratch there were many areas of challenge for us. We decided the three major challenges were through generating random platforms, simulating moving the character and balancing the game difficulty. 

Originally the game was made in a 2d array. At the beginning of the game the array would be filled with platform pixels or clear pixels. The platform pixels would act as a platform allowing the player to bounce from them while the clear pixels would act as the background. The player would then move from the bottom of the array to the top. When the player bounced off a platform the screen display would scroll upwards to continue to follow the player character while they travelled through the array. This was the basis of our first demo. We quickly realised this system would not work. It would not allow for a large game as every platform had to be stored and the player character did not move smoothly as they moved from pixel to pixel. It also did not follow the class system we had established.

To fix the generating platforms issue we decided to make an arraylist of platforms in the game class. An arraylist allows for contents to be freely added and removed when needed, unlike a 2d array which is set at the beginning. When the game starts seven platforms are generated at random positions but never next to each other. As the player moves upwards and a platform goes out of bounds below the screen it is then removed from the arraylist and replaced by a new platform at the top of the screen. This means only seven platforms exist at one time however it is simulated that there is an infinite number. We don’t have to worry about the removed platform either as when the player touches the bottom of the screen it is a game over. 

The issue we now had to tackle was how to simulate the movement of the player chacrater. It wouldn’t be possible to move them up the screen as there are no platforms stored beyond the game border.  To fix this we made the game act like a running machine. While the player class acts like it is moving (like a runner on the machine) it is in fact everything around them that is moving instead. For example, when the player bounce function is called it is actually the platforms that instead move down the screen. However, when the player is falling the platforms remain stationary. This is to allow the player to land on a platform or fall out of bounds which is essential for the game to be played. 

The final challenge was balancing the game. We had two important decisions to make to keep the game challenging but fair. The first choice was the size for the player and platforms. We used the original Doodle Jump for reference. The platforms would take up 1/8th of the screen and the character would be slightly smaller than the platform. We also decided to make the platforms thick. Though this would not change the gameplay much it would visually help the user as the platforms would stand out more. We also decided to have each platform type be visually different, again to visually help the user. 

The second choice was the velocity of the player character. How fast must they bounce and fall? Should we take into account gravity? This decision was tougher as it was something we couldn’t just see and decide was okay. We did extensive testing to find out the best speed. Eventually we came to a decision we believe is challenging, fair and most importantly fun.
