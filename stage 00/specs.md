# SPECIFICATION

For this session we will use an hypothetical use case, namely __Turning one or multiple pictures into a rendering material for Labyrinth__, to see how one could potentially craft the implementation sticking to `C4 model`. Codename of the project is `MILA` standing for `Multiple Images Lightweight Acquisition`.

Main intent is to shape a `software system` that could provide lightweight material acquisition facilities & craft self-contained material assets.

We assume working for the `DAEDALUS` company.

> In Greek mythology, **Daedalus** was a skillful architect and craftsman, seen as a symbol of wisdom, knowledge and power. (Wikipedia)

## Personas

2 `persona` has been identified by `Product Owner`:

| Persona | Role | Description | Comment |
|-|-|-|-|
| Matt | Material scientist | Leverages smartphone facilities to capture materials properties | Main user of `MILA` |
| Simon | Simulation engineer | Crafts physics-based simulation | Consumer of `MILA` artifacts.<br>Don't interact directly with `MILA` |

## Use cases

Workflow is described as:

- `Matt` is leveraging his smartphone to take several pictures of a material, with different points of view, exposure, ... Those pictures are then uploaded through mobile application (strong UX) or website (limited facility) to a backend that will post-process them. Calibrated data are shaped into self-contained material blob that is in turn persisted in a database.  
- `Simon` uses an external software named `Icarus` that can connect to such database to access material library. Materials are used to craft 3D world powered by highly-accurate physics properties. `Simon` performs simulation within this world.

## Technical consideration

- Mobile application will target `Android` devices
- Database will be a no-SQL one
- Cloud provider is foreseen to be `Azure`
