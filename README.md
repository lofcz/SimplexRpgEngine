<img src="https://www.stagl.cz/imageHosting/simplex/s4.png"/>

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
- Layer
- Tile + Autotile
- Particle

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
- Collision detection (quadtrees, spatial hash) :heavy_check_mark: 
- Physics WIP (elastic + dynamic collisions, circle-circle, rect-rect, circle-rect)

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
- EvtStep - Occurs on each tick (60x per second)
- EvtContextMenuSelected - Once an item is selected from a right-click context menu

### Ported namespaces/functions
- string_ - :heavy_check_mark:
- math_ - :heavy_check_mark:
- mouse_ - :heavy_check_mark:
- keyboard_ - :heavy_check_mark:
- window_ - :heavy_check_mark:
- instance_ - :heavy_check_mark:
- surface_ :heavy_check_mark:
- show_ :heavy_check_mark:
- get_ :heavy_check_mark:
- GameSave() - :heavy_check_mark:
- GameLoad() - :heavy_check_mark:
- draw_ - WIP


### SGML extra namespaces
- synth_ - :heavy_check_mark:

