---
title: MILA case study
description: >
    End-to-end simple case study.
weight: 4
date: '2021-11-04'
author: Romain Vasseur
---

For this session we will use an hypothetical use case, namely __Turning one or multiple pictures into a rendering material for Labyrinth__, to see how one could potentially craft the implementation sticking to `C4 model`. Codename of the project is `MILA` standing for `Multiple Images Lightweight Acquisition`. Let's unfold the 4 stages and analyze what you should pay attention to, to tailor the best experience for your audience. 

## C4.1 Context

Highest zoom level where you show where your system lives.

![]({{ .Site.BaseURL }}assets/mila_4.1.svg)

One should be able to easily grasp interactions with both user(s) & external system(s), if any.
- `MILA` is the `software system` we are focusing on. We provide a high level description enabling a layman to quickly jump in.
- A single identified `Persona`. As their title - material scientist - highlights, we are talking about a seasoned user. We capture in the description how they will interact with our application.  
- We materialize coupling with external `software system`, here `Icarus`. You may notice that we do not provide neither generic description nor exhaustive listing of facilities. We pick those which are contextually meaningful. 
- We use one-way technology agnostic arrows for `relationships` with straightforward intent. Prefer plain old English sentence starting with a verb. One can then fluently read the diagram, prefixing & suffixing the sentence accordingly e.g. `Material scientist` sends pictures to `MILA` or `Icarus` fetches materials from `MILA`. At this stage, it seems useless to give more insights especially regarding technology stack.

## C4.2 Container

Coming from the `Context` diagram, imagine you zoomed in on the `MILA` blue box.

![]({{ .Site.BaseURL }}assets/mila_4.2.svg)

A system is composed by container(s) - think executable granularity such as desktop app, web app, backend, database...
- A dashed bounding box stresses parent `software system` boundary.
- Involved `person` & external `software system` are still presents and help us to refine which internal parts are coupled. One could notice that `API` application is totally agnostic of `MILA` system I/O.
- Two entry points with asymmetric facilities & different form factors to interact with our application from an end-user perspective...
- … both leveraging - through gRPC - a back-end service for post-processing...
- … which in turn persists enriched data into some storage area.
- Starting from container cardinality & heterogeneity, we are able to sketch how one could deploy the application, organize both source code control & backlog, and tailor team(s) accordingly. 

## C4.3 Component

Coming from the `Container` diagram, imagine you jumped in the `Mobile` application red box.

![]({{ .Site.BaseURL }}assets/mila_4.3.svg)

`Component` stage is the place where we split a given `container` into bounding contexts. This stage is very important as component should be crafted in a sustainable way. Take the opportunity to see beyond the current use case and put genericity & agnosticity as first-class citizen. As for Lego or Tangram, pieces should be reused in a near future for a brand-new application. 
- A dashed bounding box stresses parent `container` boundary.
- Notice how we specify `language` for each of the components.
- We clearly materialize `relationships` as well
- And as always, ensure you provide proper naming & description.

## C4.4 Code

One last time, coming from the `Component` diagram, imagine you stepped into the `Uploading` green box.

![]({{ .Site.BaseURL }}assets/mila_4.4.svg)

At this low-level stage, we need to refine the way we will craft the bounding context we are focusing at. A good way to shape modern application is to stick to `hexagonal` (onion, port & adapter, & Co siblings) architecture. It is then very easy to highlight the different projects involved, including the layer they belong to. It is now time to really detail the technical stack. Pay attention to the way you name your project, and of course provide  meaningful descriptions to sum up responsibility of each projects