---
title: Toolchain
description: >
    Start your code-first approach journey.
weight: 8
date: '2021-11-08'
author: Romain Vasseur
---

Some times ago we introduced the concept of [architecture as code or code-first approach](/docs/code). We took the opportunity to leverage [Structurizr tool suite](/docs/code/#structurizr) to support the end-user journey. However, most of the journey focused on what one could expect to gain from a single model defined as code, without dwelling on how authoring this model for too long.

Authoring file benefits from dedicated tooling. Main objective of such tooling is to support user with edition & validation. We all are used to leverage dedicated IDE when crafting software. Sadly, C4 DSL does not come with first class citizen tooling. To fill this gap, and enforce consistency along the whole workflow, a dedicated [VS Code](https://code.visualstudio.com/) extension has been shaped, aka [Cornifer](https://github.com/rvr06/cornifer). While you could certainly achieve great results by other means, **VS Code + Cornifer** is the recommended stack to draw on.  

![]({{ .Site.BaseURL }}assets/cornifer-C4L.svg)

Whether you are a seasoned C4 DSL author or plan to start your architecture as code journey, **Cornifer** extension will support you along the way. Coupled with Structurizr engine, it provides a top-notch architecture stack. Give it a try and start contributing to the code-first architecture community.