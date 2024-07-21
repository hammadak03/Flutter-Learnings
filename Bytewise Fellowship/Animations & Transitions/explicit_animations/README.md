# Flutter Hero and Explicit Animations Project

## Overview

This project demonstrates the use of Hero animations and explicit animations in Flutter. The project includes two screens that transition smoothly between each other using Hero animations and showcases explicit animations with scaling effects on the second screen.

## Hero Animations

**Hero Animations** in Flutter allow you to create a seamless transition between two widgets on different screens. The transition is smooth and visually appealing, as it animates the movement of a widget between the source and destination screens. Hero animations are particularly useful for creating engaging and interactive user experiences.

### Key Points:
- **Hero Widget**: A special widget that is used to wrap the widget you want to animate.
- **Tag**: A unique identifier (`tag`) is used to match the Hero widget on the source and destination screens.
- **Smooth Transition**: The Hero animation provides a fluid visual transition between two screens.

## Explicit Animations

**Explicit Animations** in Flutter allow for fine-grained control over animations. They involve using the `AnimationController` and `Tween` classes to define custom animations. Explicit animations give you the flexibility to animate specific properties of widgets, such as position, size, opacity, and more.

### Key Points:
- **AnimationController**: Manages the animation's lifecycle and timing.
- **Tween**: Defines the range of values that the animation will interpolate between.
- **CurvedAnimation**: Applies a curve to the animation to control its pacing.

## Project Description

### Screens

1. **HomeScreen**
   - Contains a `ListTile` with an `Icon` and a `Text` widget.
   - Uses a Hero animation to transition to the `SecondScreen` when the tile is tapped.
   - The `Hero` widget has a unique `tag` (`'tag-1'`) to link the animation between the screens.

2. **SecondScreen**
   - Displays a `Container` with an orange background.
   - Implements an explicit animation that scales the container from half its size to its full size using the `AnimationController` and `Tween`.
   - The scaling effect is applied via `ScaleTransition` to provide a smooth visual transition.
