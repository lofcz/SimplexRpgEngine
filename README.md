 # Simplex RPG Engine 3
 ## Currently under early development, please use v2
 
 <a href="https://github.com/lofcz/SimplexRpgEngine/tree/SimplexRpgEngine2">Simplex RPG Engine 2</a>


### Why I've started working on v3
There are plenty of reasons behind this. But these are the main ones:

- We relied on proprietary software
- GML sucks
- Underlaying layer was a blackbox

### Aim of v3

- Engine build on top of MonoGame FW
- Room editor works as 60 fps GameWindow, thus allowing for editor events
- Implement as much of GMS pipeline into C# as possible
- Upgrade outdated concepts of GMS

### Status

**Done**
- Sprite
- Font

**WIP**
- Object (GameObject)
- Events
- Room

**TBD**
- Shader
- Timeline
- Path

### Room editor
- 60 fps monoForm
- allows to manage multiple rooms
- supports grid

### Big deals along the way
- Creation code (roslyn)
- Collision detection (quadtrees) 
- Physics

### Object events
Events are aiming to imitate GMS native events while introducing some newcomers and discarding obsolete overheat. 

- OnSetup - Use to toggle predefined GameObject behavior / custom plugins
- OnCreate - Equal to create
- OnStep - Equal to step
- OnDraw - Equal to draw

### Editor events
These are defined in the same way like classic events but occur on room editor events

- EvtCreate - Once object is placed in game
- EvtLoad - When project is loaded and instance gets deserialized
- EvtSave - Before instance gets serialized
- EvtDelete - When object is removed from a room 
- EvtDraw - Occurs when object is drawn in room editor
- EvtContextMenuSelected - Once an item is selected from a right-click context menu

### Ported namespaces/functions
- string_ - DONE
- math_ - DONE
- draw_ - WIP
- GameSave() - WIP
- GameLoad() - WIP
- PlaceEmpty()

### SGML extra functions
- RandomColor()

