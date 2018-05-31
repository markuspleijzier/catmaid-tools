# CATMAID tools
Overview of packages and scripts for the analysis of CATMAID data written by
people from flyconnectome and the Jefferis lab.

## R

### [nat](https://github.com/jefferis/nat)
An R package for the (3D) visualisation and analysis of biological image data,
especially tracings of single neurons. **nat** is the core package of a wider
suite of neuroanatomy tools introduced at http://jefferislab.github.io.

### [rcatmaid](https://github.com/jefferis/rcatmaid)
R package providing API access to the CATMAID web image annotation tool.
Provides interface with nat R package, enabling wide variety of analyses.

### [elmr](https://github.com/jefferis/elmr)
Provides tools to move between adult brain EM and light level data,
emphasising the interaction between the CATMAID web application and the R
Neuroanatomy Toolbox package. See also https://github.com/saalfeldlab/elm,
from which this package borrows both a name and uses data.

### [catnat](https://github.com/alexanderbates/catnat)
R Package for use with rcatmaid and nat. catnat provides some higher level
analysis function for, for example, clustering synapses within a neuron's
tree structure, clustering together neurons by synapse position in 3D space
and splitting a neuron into different compartments
(e.g. axon-dendrite-primary neurite) and visualising these splits and clusters.

### Misc

## Python

### [pymaid](https://github.com/schlegelp/pymaid)
Python 3 package to fetch data CATMAID server and analyse neuron anatomy and
connectivity. Features include:
- wrappers for CATMAID’s API to fetch data
- custom neuron objects that perform on-demand data fetching
- 2D (matplotlib) and 3D (vispy or plotly) plotting of neurons
- virtual neuron surgery (cutting, stitching, pruning, rerooting)
- R bindings (e.g. for libraries nat, nat.nblast and elmr)
- interface with Blender 3D
- import/export from/to SWC

### [catbot](https://github.com/flyconnectome/catbot)
Slack chatbot that allows quick queries to a CATMAID server. Most notably it
lets you NBLAST CATMAID neurons against e.g. the
[flycircuit](http://www.flycircuit.tw/) database.

### [Blender plugin](https://github.com/schlegelp/CATMAID-to-Blender)
Plugin for [Blender 3D](https://www.blender.org/) that allows fetching data
from CATMAID server for high-quality renderings.

### Misc
