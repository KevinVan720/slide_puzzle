# Slide Puzzle

This is a slide puzzle game created for the Flutter Puzzle Hack. A hackathon where developers are challenged to push their creativity and create the most visually appealing slide puzzle game using Flutter!

## Inspiration

I want to demonstrate the **power** and **expressiveness** of Flutter in this project. I want to let people play the slide puzzle game with different themed UI that utilizes **modern design trends** like material, skeuomorphism, neumorphism, glassmorphism, etc. Fortunately, I have developed several packages (e.g. the [animated_styled_widget](https://pub.dev/packages/animated_styled_widget)) that let me achieve this goal easily.

## What it does

You play the basic version of the slide puzzle game but you can play it in different themes. The puzzle tiles will smoothly animate when you hover or press them. The whole user interface will also animate between different themes.

![Smoothly animate between themes](https://i.imgur.com/Y1XOwAE.gif)

#####Smoothly animate between themes

You can choose between different difficulty levels and puzzle sizes when generating new puzzles. If you got stuck, you can press the solve button and the puzzle will solve for itself.

![Auto solve the puzzle](https://i.imgur.com/GNIyZ0B.gif)

#####Automatically solve the puzzle

## How we built it

I use packages like [responsive_property](https://pub.dev/packages/responsive_property) (which lets you do responsive design at different granularities) and [animated_styled_widget](https://pub.dev/packages/animated_styled_widget) (which lets you design complicated and responsive UI with CSS-like syntax). You can read the development of those packages on [medium](https://medium.com/@kevinvan). I started with the official slide puzzle demo built by Very Good Ventures. Other packages that I have utilized include [bloc](https://pub.dev/packages/bloc), [flutter_localizations](https://pub.dev/packages/flutter_localizations), [flutter_localized_locales](https://pub.dev/packages/flutter_localized_locales).

## Challenges we ran into

Designing an app that works well on different screen sizes and with different themes is not an easy thing to do. I need to pay attention to issues like widget overflowing and low contrast between text and the background, etc. The animation when you hover or press the buttons also took a lot of time to design as I want to give people the feeling that they are interacting with real-world material.

There are also some visual effects flutter doesn't support out of the box. For example, inset shadows and rounded rectangles with different border widths. They are implemented in the [animated_styled_widget](https://pub.dev/packages/animated_styled_widget) package. However, things like crossfades between images and colored backgrounds are still missing for now.

The puzzle solver which is using the iterative deepening A*(IDA*) algorithm also took me quite some time to get it right. The performance is not so great since I am using the standard Manhattan heuristic. Moreover, the compute() method doesn't actually work on the web which blocks the UI when solving the puzzle. In order to speed up the calculation, I record all the moves that transform the puzzle from the initial state to the current state, then rewind part of those moves until the run time of the IDA* algorithm is reasonable. This approach may not give you the optimal solution but consistently reduces jank on the web.

## Accomplishments that we're proud of

The themed_puzzle app is an all-around app that is **fully responsive, cross-platform, multi-language, and supports different input devices** (thanks to the development of Flutter). The animations are smooth and very fun to interact with. I recreated most of the design trends that are popular in recent years, which gives us a sense of how complicated and beautiful an interface Flutter can build. The attention to detail on all the different themes is also worth noting. Every aspect of the UI, including popup menus and sound effects, is customized.

![Multi language support](https://i.imgur.com/yLQX5WX.gif)

#####Multi-language support

## What we learned

The base app that people at Very Good Ventures built really taught me a lot. The coding is clean and everything like state management is well structured. Building upon something like this saves me a lot of time. I have also learned about how to run Flutter apps on Windows and use Firebase hosting.

When trying to solve the puzzle, I learned about the IDA* algorithm and different heuristics. I also learned how to create a non-blocking UI when you have time-consuming computations since the IDA* algorithm can take quite some time.

Since I want this app to support different languages, I learned about how to set up localization in Flutter. Now supporting new languages is just a matter of adding a configuration file.

## What's next for themed_puzzle

I want to make the game more enjoyable by adding more features like a timer or introducing different levels. We can also change the size of the puzzle (e.g. 3 by 4) or the size of the tiles (e.g. 2 by 1, 2 by 2 sized tile). We can also create other similar games (like crossword or wordle) while reusing most of the code in this project.

For the design side of things, I was thinking of adding a theme generator (or configurator) that lets people explore the theme they like the most. I also want to add more animations to make the game more realistic. For example, the tiles can tilt when you hover the mouse around them.

For the puzzle solver, I know that using different heuristics or even a preloaded pattern database can greatly improve the performance. If time permits, I want to implement these ideas.