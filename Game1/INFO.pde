/*
--- Notes page only ---

Player Info:
  Health
  Stamina (for sprinting (, maybe jump?), sword)
  Money

Weapons:
  Types:
    Meelee
    Ranged
  
  Meelee:
    Takes stamina
    Durability?
    
Collision detection between circle and squre:
  Draw line between circle and squre. If there is at least one line that can go between and not touch, no collision, else, colliding
    ~ Draw line perpendicular to the line between the centers of both objects, at some point on the line (idk exactly where (probably average of (x, y) pairs of where the line between shapes hits perimiter of shape))
    - Uses the separating axis theorem

Game Objects (and subtypes):
  Enemy (different leveling)
  Platform (solid, ghost, kill, ...)
  Obstacles (spikes, lava, ...)

Enemies:
  Types (models/modelling?)
  Location range
  Speed
  Damage
  Drops (including money)


Levels:
  Non-game levels:
    -10 = home/default
    ...

  In-game levels:
  0 = tutorial
  1 ... 9 = in game (introduce new concepts along the way

Spawnpoint??
Checkpoint??



















*/
