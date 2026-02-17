# Designing Dependencies: The Problem

## What is a dependency?
Dependencies are frameworks which our code __depends__ on to run. Such as network clients, alamo fire, web socket frameworks, analytics & etc

When left uncheck they can wreck havoc to the code base.

Problems regarding unchecked dependencies:
1. They can increase compilation time of the project.
    - First build time will require us to build all dependencies
    - Branch switching will probably require us to rebuild all dependencies
    - If clean is used, then we will rebuild every thing
    - When code is merged to main, xcode can lose itself and need to rebuild itself
2. Cause stress on Apple Tools: Such as Previews or Playgrounds can stop working or take a long time to solve themselves.
3. Difficulty to test

