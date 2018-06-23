<h1>Dendrogram Code </h1>

This script creates 2D graphical representations of 3D reconstructed CATMAID neurons. Using 
pymaid (see https://github.com/schlegelp/pymaid), it recovers treenode and connector 
information from a CATMAID neuron and renders them as a NetworkX graph/network: 
	
* treenode ids are treated as 'nodes/vertices'
* edges/links are drawn between parent and daughter treenode_ids
	
As every connector (both presynaptic & postsynaptic) is associated with a specific 
treenode_id (both presynaptic & postsynaptic), the plot_nx function also allows one 
visualise which treenodes of a neuron are connected by specific neurons/ specific 
connector_ids. This allows one to visualise the placement of synapses from 
specific neurons/ lineages.

<h2>Getting Started</h2>

These notes detail what is required in order to run the Dendrogram Code. 

Prerequisites:

If this is your first time using this code, please install the following packages using 
pip in the terminal:

**Pymaid (see https://github.com/schlegelp/pymaid)**

    $ pip install git+git://github.com/schlegelp/pymaid@master

**NetworkX (see https://networkx.github.io/documentation/stable/install.html)**

    $ pip install networkx

Installing the graph drawing engines is a little more complicated. To install Graphviz, 
one must first install homebrew: 

**Homebrew ( see https://brew.sh/ )**

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Simply paste the above into the terminal. 

Then to install Graphviz:

**Graphviz (see http://www.graphviz.org/)**

    $ brew install Graphviz

**PyGraphviz ( see http://pygraphviz.github.io/)**

    $ pip install pygraphviz

<h2>Using the Dendrogram Code</h2>

Once these are installed, import them into your environment. Graphviz is a dependency of 
NetworkX, so there is no need to import Graphviz/PyGraphviz. 

    >>>import pymaid
    >>>import networkx
    >>>import matplotlib as plt

Example Usage

    >>> rm = pymaid.CatmaidInstance(server, user, password, token) 

    >>> #Get the neuron of interest (NOI) - e.g. skid

    >>> x = pymaid.get_neuron( NOI )

    >>> #Downsample to just the essential nodes -- this step is not absolutely required,
    >>> #although it speeds up the processing dramatically. The preserve_cn_treenodes argument
    >>> #preserves the treenodes which are connected to a presynapse/postsynapse

    >>> x.downsample( 100000 , preserve_cn_treenodes = True )

    >>> plot_nx( x, plot_connectors = True )

    >>> plt.show()
    
    
_*TIP: when producing multiple dendrograms, one should always remember to clear the matplotlib drawing space using*_

    plt.clf()
    
_*such that multiple NetworkX diagrams are not overlayed ontop of one another.*_
    
<h2>Example Renderings</h2>

Dendrogram of a VM2 neuron using the Dot layout
![](https://github.com/markuspleijzier/AdultEM/blob/master/VM_neuron_dot.png)

Dendrogram of a VM2 neuron (same as above) using the Neato layout
![](https://github.com/markuspleijzier/AdultEM/blob/master/VM_neuron_neato.png)


<h2>Extra Details of plot_nx/ graphviz</h2>

Two possible graphical layout engines used by graphviz in this function: 

1. dot
1. neato

    (1) The **dot** layout draws directed graphs (like phone calls, where person A calling person B 
    is enough to initiate a phone call, but it is not necessary for person B to also call 
    person A at the same time to start talking). For Catmaid neurons, the treenodes most distal 
    (i.e. the tip of the dendrites) are treated as the top of the hierarchy and the soma is at the 
    bottom of the hierarchy. For more information see https://www.graphviz.org/pdf/dotguide.pdf

  
  
    (2) The **neato** layout draws undirected graphs (where if person A dates person B, 
    person B also dates person A). The neato layout takes all the nodes and finds the lowest
    energy configuration of where the nodes should be placed. It does this by placing a 'virtual spring' between each node. 
    The force from this spring is proportional to the distance between the nodes. This gives neato diagrams an advantage 
    by being able to respect the distance between nodes, giving a more realistic representation of the neuron than the 
    dot layout, which does not consider distance. Finding this low energy configuration requires a long time, 
    therefore it is **strongly recommended** that one downsamples the NOI before running the neato algorithm (by a factor of 1000000). 
    For more information see http://www.graphviz.org/pdf/neatoguide.pdf 


<h2>Acknowledgments</h2>

This code was written by Markus Pleijzier, Drosophila Connectomics WT Team, Department of Zoology, University of Cambridge
and by Philipp Schlegel, Drosophila Connectomics WT Team, Department of Zoology, University of Cambridge & Jefferis Lab, Laboratory of Molecular Biology,
University of Cambridge.
