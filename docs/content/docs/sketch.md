---
title: Architecture as sketch
description: >
    Deep dive sketch first approach, assets and drawbacks.
weight: 5
date: '2021-11-05'
author: Romain Vasseur
---

We are used to **xxx as code** (deployment as code, architecture as code) stuff or **xxx-first** (view-first, view-model-first) approaches to specify from which end we start a journey or we tackle an issue. It is a very important step as it contrasts how we address a situation, especially the inherent biases we should be aware of and keep under control.

This post will give some insights of the **sketch-first** or **architecture as sketch** approach, stressing out pros and cons of such a method.
It should be read in parallel with [next one](/docs/code), which will cover the **architecture as code** or **code-first** approach.

Of course, those are the 2 ends of the spectrum. You may end up with mixing the 2 approaches, or shaping an in-between one.
Choice is yours to pick but remember to make **contextual** decision.
There is no per say bad choices, provided that you can explain why you made it.
Thus, the importance of tracking those choices to be able to rewind & replay without be tempting to rewrite the history.
Luckily, we will cover this topic a bit later in the `Architecture Decision Record` stage. 

## Whiteboard

First thing you may have heard about properly touching upon development is to start with a design phase. To stress that point, some advertise to stay away from any form of IDE or computer. Here came the golden age of whiteboarding. A couple of markers and basic drawing skills empower anyone to tailor unmatched diagrams. But nothing is that simple.

Before talking about what are inherent limitations of this approach, let's start with its valuable benefits.

|||
|-|-|
| Low prerequisites...| Nothing but a room & a couple of markers to engage... |
| Quick start-up | Meet & sketch. Straightforward. At least, seems to be... |
| Team friendly | Gathering in a single place, as a team, focusing all together on a dedicated problem, fosters creativity. |   

But reality is rapidly catching up...

What we imagine ending up with...

![](/assets/plan.jpg)

... and what we are likely to inherit...

![](/assets/reality.jpg)

Very few of us that previously experienced this whiteboard-based design approach can shamelessly say that:
- They never take a snapshot of a whiteboard for later (and drop it within a pompous MoM email...)
- They never annotate a cryptic whiteboard with an equally cryptic do not erase (please) for posterity
- They never entirely rewrite the same sketch multiple times (and often in the same brainstorming session)
- ...

This first step is very valuable to gauge what we should end up with, and maybe more important what we should avoid ending up with. Despite its  apparent simplicity, it appears that crafting valuable materials is not that straightforward, and a bunch of unexpected issues arise... 

|||
|-|-|
| Lack of sustainability | First move could be a cheap one. But you are doomed to pay penalty for any consecutive ones. Assuming you managed to draft a meaningful diagram, you are stuck with persistence, upcoming checkout and modifications, version tracking, ... |
| No resilience to changes | Design are inherently incremental and poorly accommodates with whiteboarding. Eg there is no simple way to make room for new piece in an existing sketch. CrUD and layout operations are very costly, as they mostly imply a complete redraw. | 
| Not at all eye-candy | It is difficult but not impossible to sketch nice stuff (but it implies some drawing skills that are not those common). But it is quite impossible to achieve at the first trial, especially when we start from blank page. Whatever the time you spent, you will end up somewhere between a mess & a draft. Do not expect more. |

What is wrong? We started whiteboarding - aka collaborative pen & paper - following the initial advice prescribing to stay away from any form of IDE or computer. At least, that's what we thought. This guideline is not the original one but a poor translation aimed at beginners. And, as often when smart guys try to popularize, misleading.
**Prevent yourself to code before designing** is the mantra we should stick to.
Of course, if you do not access neither an IDE nor a computer, you won't be able to code, but is is merely a side-effect...

We all are engineers. Engineers cope with issues with methods and tools.
We define method 2 chapters ago, spending time to introduce [C4 model](/docs/c4-model) & [convention](/docs/convention).
It is now time to tailor tools. And software engineers tools are - guess what - software...

## Diagramming software

Whatever the approach you choose, you need tooling to support you along the way.
Tooling speeds up process. Tooling enforces semantic. Tooling automates workflow.

There is plenty of offer living around when we talk about diagramming.
As many come as a SaaS offer, ensure they are compliant with corporate rules (keep in mind we plan to use it to manage our software model which is one of the most valuable IP we have).
​​​​​​​Pick one that at least meet the below facilities.

|||
|-|-|
| Library | Most of the diagramming software allow for custom library creation & sharing, which drastically increase newcomer friendliness and thus adoption, while strengthening consistency. A must-have. If you are a Lucidchart user, you may have notice such libraries already exist and can be broadly used (search for C4 in +Shapes menu). |
| Navigation | Navigate back and forth within your architecture should be a first-class citizen facility. Most of the software support hyperlink, allowing you to seamlessly provide inner (eg C4 levels linking) and outer (eg web url) fast travel. It is a simple but powerful way of enriching your model. |
| Fast iteration | As said before, design is an iterative process. You need to ensure your tooling friendly plays with fast incremental stages (sketch, save, share). Some also provide advanced facility such as collaborative edition which is a pleasant bonus. |

So, what is the status right now?
Migrating from plain old whiteboard to a dedicated diagramming software mitigates part of the drawbacks we encounter without sacrificing benefits. We can still keep low cost entry and team centric workflow, while greatly improving edition, management and look & feel. 
This said, some challenges still remain. And they could become painful...

## Remaining challenges

Sketch-first approach is a sustainable one, but it also comes with some limitations that deserve some highlight.
One could overcome some of those with some discipline and time, but some others could become hard to live with.

|||
|-|-|
| Better sustainability but... | Of course, we improve a lot on this field compared to whiteboard snapshotting. Your model is defined through a software that eases daily management. But it is still uncoupled from source code or technical documentation. You need to leverage export that can be difficult to automate and whose staples are images which does not friendly play with source control (versioning, diff., ...). Status is better but far from ideal. |
| Better resilient to changes but...| It is now far easier to handle CRUD operation. But we still need to live with heavy manual operation that cannot be automated, such as renaming (item must be renamed as many times as existing diagrams it belongs to) and it increases a lot the probability to introduce inconsistency at some point in the model, due to human error. Inconsistent, inaccurate and outdated pieces even if small can spoil the entire model trust, and thus ruin all our effort. |
| Eye-candy but... | One of the benefit of switching to software to support the diagramming is undoubtedly the prettiness of the outcome. It looks clean and professional whatever our drawing skills. Most of the software accommodates very well zooming (within software, and during export with vector alike format). But that leads to the next aspect, namely display obsession. |
| Display obsession | Because we are interacting by drag & dropping and connecting shapes, one could be tempted to spend a lot of time to align, sort, resize, tidy up, ... Although this activity participates to increase the overall quality, it is a satellite one and should be handled this way. You are there to tailor software, not to layout to match mood of the day. |
| Soft control | Applying C4 model and sticking to convention cannot be enforced by diagramming software. Nothing but team review will prevent you to introduce failure. There is no compilation warning, no strongly-typed language, no syntax highlighter or analyzer... It is like coding within Notepad instead of a dedicated IDE. You can manage to succeed but are doomed to collapse someday...|
| Maintenance | As we do not manage to unify source code, documentation and diagramming (yet), maintenance phase is still blurry. How do we enforce consistency? What is the review workflow (no Pull Request available)? |

## Closing

This post highlights benefits and drawbacks of leveraging sketches to build and convey software architecture.
We saw that picking this choice does not confine us to plain old whiteboard and how one could overcome most of those limitations leveraging methods and tools. This said, remaining drawbacks are difficult to deal with if we stay on this shore. 
Check out the next [Architecture as Code](/docs/code) stage to balance what we learned here, and discover a brand-new way of crafting a model.