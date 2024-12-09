# Computer-Graphics-Final---Sidharth-Suresh

Name: Sidharth Suresh

Student Number: 100938544

>You may find the documentation for all the shaders and code here!

This is a repo I made for my Computer Graphics Final Exam (conducted on 09-December-2024).

# Documentation

## Overview

This project uses 4 shaders:

1. Colorgrading (`<Project>/Assets/Shaders/ColorGrading`)
2. Hologram (`<Project>/Assets/Shaders/`)
3. Outline (`<Project>/Assets/Shaders/`)
4. Wave (`<Project>/Assets/Shaders/`)

Scripts used:

- CamColorGrading.cs (`<Project>/Assets/Shaders/ColorGrading`)

## In-depth Explanation

### Overview

**Super Mario World map** was the scene I was asked to remake in a game engine. My game engine of choice was **Unity** (version: `2022.3.22f1`). I used the **built in render pipeline**. 

### About My Choices

Everything other than having to use the color correction effect and the hologram effect was my choice.

I used the **Terrain** gameobject for adding terrain to the scene. The water in the levels is a plane mesh with wave shader. The pipes are two cylinders that are placed on top of eachother. The small spike like textures, which, I'm assuming, are small mountains where taken from a Blender primitive shape (cone mesh) since Unity doesn't support cones. The paths were made using a scaled cube, two cylinders on both ends and two spheres on top of them. The player was a model I took from canvas called `bunny.fbx`.

#### Materials and Shaders

- I used the **Ouline shader** on the player and the pipes to make them standout and hint at the players that they can be interacted with.
 The outline shader makes use of, lambert shader, fragment shader and vertex shader. The lambert shader managed the albedo color of the mesh. Then, in a pass, the culling is changed to `FRONT`. The vertex shader manages to make the outline by extruding out the mesh's verteces then the fragment shader puts the color of the outline on the extruded faces.

- I used the 

Finally, I made use of the **Standard shader** for the terrain, the small mountains and paths.