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

### [tracerutils](https://github.com/fmlove/tracerutils)
R package with useful functions for EM tracers.  Provides shortcuts for common
tasks like plotting neurons from CATMAID, randomly sampling synapses, and 
checking for duplicate connectors.

### Scripts
- [Random sampling of pre- or postsynaptic partners](https://github.com/flyconnectome/catmaid-tools/blob/master/R/Sample_random_downstream_profiles.R)


## Python

### [pymaid](https://github.com/schlegelp/pymaid)
Python 3 package to fetch data from CATMAID server and analyse neuron anatomy
and connectivity. Features include:
- wrappers for CATMAID’s API for fetching data
- 2D and 3D plotting of neurons
- virtual neuron surgery: cutting, stitching, pruning, rerooting, etc
- R bindings (e.g. for libraries nat, nat.nblast and elmr)
- interface with Blender 3D
- import/export from/to SWC
- load and annotate image data

### [catbot](https://github.com/flyconnectome/catbot)
Slack chatbot that allows quick queries to a CATMAID server. Most notably it
lets you NBLAST CATMAID neurons against e.g. the
[flycircuit](http://www.flycircuit.tw/) database.

### [Blender plugin](https://github.com/schlegelp/CATMAID-to-Blender)
Plugin for [Blender 3D](https://www.blender.org/) that allows fetching data
from CATMAID server for high-quality renderings.

### Scripts
- [Neato dendrograms of neurons](https://github.com/flyconnectome/catmaid-tools/blob/master/Python/Dendrogram_Code.py)
