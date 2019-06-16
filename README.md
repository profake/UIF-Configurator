# UIF-Configurator
![UIF Configurator](https://i.imgur.com/9uKvVfe.gif)
# UIF Configurator
<p>LUA SAMP UIF Configurator.</p>
<p>This is a lua script that can hide certain elements from showing in UIF SAMP Server.</p>
<p>They include labels, 3D labels, VIP Actors, UIF IP and command text on bottom and score text on top of the screen.</p>

### [Pre-requisites]
1. ASI Loader
2. Moonloader
3. SAMPFuncs
4. Dear ImGUI for Moonloader

### [Installation]
Put the *UIF Configurator.lua* file from this repository to your Moonloader folder.

### [Usage]
![In-game Menu](https://i.imgur.com/G3qpCgD.png)
<p>Use /config in-game to show the configurator.</p>
<p>If you want to set any of the options to OFF by default, open the *UIF Configurator.lua* file and change the corresponding variable on top of the script.</p>
<p>Example: disableActors = imgui.ImBool(false) will set VIP Actors to ON by default.</p>

### [Known issues]
1.Some 3D labels still spawn. I do plan on trying to fix them, just haven't gotten around to it yet.
2.Except for the top and bottom overlay text, everything else will not take effect unless you reload the scene. I.E: If you have labels disabled, and decide to see what labels there are in your vicinity, you will have to enable labels, and then teleport somewhere else and come back to where you were to reload them. Same goes for the others.
3. Houses don't have labels. This can probably be fixed as well.

### [Extra]
<p>There is a part in the script that disables all group zones from showing in the radar.</p>
<p>It is commented out in the script that looks like --[[ code --]]. Delete the --[[ and --]] to have this feature. As of now, it's not possible to turn it ON/OFF in-game unless you restart the game, which is why I've turned it off by default.</p>

### [Credits]
<p>FYP for Moonloader, SAMP addon and ImGui port for Moonloader.</p>
