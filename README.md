# Slide Puzzle 

<p align="center">

<img src="https://img.shields.io/github/issues/KevinVan720/slide_puzzle?style=for-the-badge" >

<img src="https://img.shields.io/github/forks/KevinVan720/slide_puzzle?style=for-the-badge">

<img src="https://img.shields.io/github/stars/KevinVan720/slide_puzzle?style=for-the-badge">

<img src="https://img.shields.io/github/license/KevinVan720/slide_puzzle?style=for-the-badge" >

</p>

This is a slide puzzle game created for the Flutter Puzzle Hack. A hackathon where developers are challenged to push their creativity and create the most visually appealing slide puzzle game using Flutter!

You can play the game at [https://slide-puzzle-912f7.web.app/](https://slide-puzzle-912f7.web.app/#/).

## Inspiration ✨

I want to demonstrate the **power** and **expressiveness** of Flutter in this project. I want to let people play the slide puzzle game with different themed UI that utilizes **modern design trends** like material, skeuomorphism, neumorphism, glassmorphism, etc. Fortunately, I have developed several packages (e.g. the [animated_styled_widget](https://pub.dev/packages/animated_styled_widget)) that let me achieve this goal easily.

## What it does 📜

You play the basic version of the slide puzzle game but you can play it in different themes. The puzzle tiles will smoothly animate when you hover or press them. The whole user interface will also animate between different themes.


![Animate between themes](https://i.imgur.com/aZ8UCrG.gif)
##### Animate between themes

You can choose between different difficulty levels and puzzle sizes (including non-square sizes) when generating new puzzles. If you got stuck, you can press the solve button and the puzzle will solve for itself.

![Auto solve the puzzle](https://i.imgur.com/PuYZriI.gif)
##### Automatically solve the puzzle

## How we built it ⚒️

I use packages like [responsive_property](https://pub.dev/packages/responsive_property) (which lets you do responsive design at different granularities) and [animated_styled_widget](https://pub.dev/packages/animated_styled_widget) (which lets you design complicated and responsive UI with CSS-like syntax). You can read the development of those packages on [medium](https://medium.com/@kevinvan). I started with the official slide puzzle demo built by Very Good Ventures. Other packages that I have utilized include [bloc](https://pub.dev/packages/bloc), [flutter_localizations](https://pub.dev/packages/flutter_localizations), [flutter_localized_locales](https://pub.dev/packages/flutter_localized_locales).

## Challenges we ran into 🤔

Designing an app that works well on different screen sizes and with different themes is not an easy thing to do. I need to pay attention to issues like widget overflowing and low contrast between text and the background, etc. The animation when you hover or press the buttons also took a lot of time to design as I want to give people the feeling that they are interacting with real-world material.

There are also some visual effects flutter doesn't support out of the box. For example, inset shadows and rounded rectangles with different border widths. They are implemented in the [animated_styled_widget](https://pub.dev/packages/animated_styled_widget) package.

The puzzle solver which is using the iterative deepening A*(IDA*) algorithm also took me quite some time to get it right. The performance is not so great since I am using the standard Manhattan heuristic. Moreover, the compute() method doesn't actually work on the web which blocks the UI when solving the puzzle. In order to speed up the calculation, I record all the moves that transform the puzzle from the initial state to the current state, then rewind part of those moves until the run time of the IDA* algorithm is reasonable. This approach may not give you the optimal solution but consistently reduces jank on the web.

## Accomplishments that we're proud of 😎

The themed_puzzle app is an all-around app that is **fully responsive, cross-platform, multi-language, and supports different input devices** (thanks to the development of Flutter). The animations are smooth and very fun to interact with. I recreated most of the design trends that are popular in recent years, which gives us a sense of how complicated and beautiful an interface Flutter can build. The attention to detail on all the different themes is also worth noting. Every aspect of the UI, including popup menus and sound effects, is customized. There are also light and dark versions for most of the themes.

![Multi language support](https://i.imgur.com/fyl3tYz.gif)
##### Multi-language support

I also want to highlight the extra features that I have implemented in order to achieve the visual effects I want. They include:

1. Crossfade/smooth transition between image, gradient, and colored background. The current implementation in Flutter will have artifacts during a background transition.
2. Inset shadows. This is also missing in FLutter for now but is crucial for implementing neumorphic or engraved effects.
3. Rounded rectangle border with sides of different widths and the ability to smoothly morph it into other shape borders. The implementation details of the morphing algorithm can be found at https://medium.com/p/30e0d33c60a7.
4. The ability to open a dialog that is positioned relative to another widget (or the whole screen). You can use this to implement drawers that can open in any direction or dropdown buttons in desktop UI.
5. Animated aurora gradient for the glassmorphism theme.
6. Smoothly animate any color, gradient, and image background.


The packages involved have all been published on [pub.dev](https://pub.dev/publishers/wenkaifan.com/packages) and I really hope I can contribute these features to Flutter. 

## What we learned 🧠

The base app that people at Very Good Ventures built really taught me a lot. The coding is clean and everything like state management is well structured. Building upon something like this saves me a lot of time. I have also learned about how to run Flutter apps on the desktop and use Firebase hosting.


When trying to solve the puzzle, I learned about the IDA* algorithm and different heuristics. I also learned how to create a non-blocking UI when you have time-consuming computations since the IDA* algorithm can take quite some time.

Since I want this app to support different languages, I learned about how to set up localization in Flutter. Now supporting new languages is just a matter of adding a configuration file.

## What's next for themed_puzzle 🛣️

I want to make the game more enjoyable by adding more features like a timer or introducing different levels. We can also change the size of the tiles (e.g. 2 by 1, 2 by 2 sized tile) or adding obstacles to increase the difficulty. We can also create other similar games (like crossword or wordle) while reusing most of the code in this project.

For the design side of things, I was thinking of adding a theme generator (or configurator) that lets people explore the theme they like the most. I also want to add more animations to make the game more realistic. For example, the tiles can tilt when you hover the mouse around them.

For the puzzle solver, I know that using different heuristics or even a preloaded pattern database can greatly improve the performance. If time permits, I want to implement these ideas.

## Supported Platform 📱💻🖥️⌨️🖱️

The app has been tested on: 

-  **Android**
-  **Windows**
-  **Web (Chrome, Edge, Firefox, Safari)**
-  **Linux**


![Multiplatform](https://i.imgur.com/MOs7sqo.png)
##### Running on Android, Windows, and the web

The app should also run on **IOS** and **MacOS** since all dependent packages support those platforms. What I noticed is that the performance on **Safari** and **Firefox** is not very good. 

## Supported Themes 🎨

![Material](https://i.imgur.com/YgvK0PX.png)
##### Material

![Material Dark](https://i.imgur.com/krPvV2E.png)
##### Material Dark

![Fluent](https://i.imgur.com/ZK7qfxw.png)
##### Fluent

![Fluent Dark](https://i.imgur.com/zmL5VVc.png)
##### Fluent Dark

![Cupertino](https://i.imgur.com/I6ij5q5.png)
##### Cupertino

![Cupertino Dark](https://i.imgur.com/KxY0Lxn.png)
##### Cupertino Dark

![Neumorphism](https://i.imgur.com/FjNOoAJ.png)
##### Neumorphism

![Neumorphism Dark](https://i.imgur.com/jGGBQQf.png)
##### Neumorphism Dark

![Glassmorphism](https://i.imgur.com/kPTi1Lk.png)
##### Glassmorphism

![Glassmorphism Dark](https://i.imgur.com/fMDnJHw.png)
##### Glassmorphism Dark

![Claymorphism](https://i.imgur.com/WB9BO3D.png)
##### Claymorphism

![Claymorphism Dark](https://i.imgur.com/P15emU1.png)
##### Claymorphism Dark

![Neon](https://i.imgur.com/6x1hBBO.png)
##### Neon

![Neon Dark](https://i.imgur.com/jFfPKbg.png)
##### Neon Dark

![Keyboard](https://i.imgur.com/QB6l8YT.png)
##### Keyboard

![Keyboard Dark](https://i.imgur.com/SwshleM.png)
##### Keyboard Dark

![Wood ](https://i.imgur.com/RXmwnnc.png)
##### Wood

## Team members 🧙

- [Wenkai Fan](https://github.com/KevinVan720) 
