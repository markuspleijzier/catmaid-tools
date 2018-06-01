#gives random ordering of post-synaptic profiles
library(elmr)
library(catmaid)

#function to return the downstream profiles for the selected skid distal to the provided cut point
#NB. Check root point in CATMAID, as distal_to function looks distal to the root node.

# skid = skid of neuron you want to sample downstream partners from
# node = node at which your fragment of interest is distal to
downstream_profiles <- function(skid, node) {
  library(elmr)
  library(catmaid)
  neuron <- read.neuron.catmaid(skid)
  dist <- distal_to(neuron, node.pointno = node)
  neuron.distal.points <- neuron$d[dist,]
  
  #debug- graph to check selected distal points are in correct region
  nopen3d()
  plot3d(neuron, col = "gray23")
  points3d(neuron.distal.points[,c('X','Y','Z')], col = "deepskyblue")
  
  all_connectors <- catmaid_get_connectors_between(pre_skids = skid)
  connectors = all_connectors[all_connectors$pre_node_id %in% neuron.distal.points$PointNo,]
  #debug - graph to check all selected connectors in correct region
  nopen3d()
  plot3d(neuron, col = "black")
  points3d(connectors[,c('connector_x','connector_y','connector_z')])
  
  return(connectors)
}

#get outgoing synapses 
n_outgoing <- downstream_profiles(skid = skid, node = node)
#randomise outgoing connectors for tracing downstream partners
perm = n_outgoing[sample(nrow(n_outgoing)),]
#debug - 
nopen3d()
neuron <- read.neuron.catmaid(skid)
plot3d(neuron, col = "black")
points3d(n_outgoing[,c('post_node_x','post_node_y','post_node_z')], col='blue')
points3d(perm[,c('post_node_x','post_node_y','post_node_z')], col = 'green', size = 8)
#—URL generator—
connector_URL <- function(dfrow){
  base = "https://neuropil.janelia.org/tracing/fafb/v14/"
  catmaid_url = paste0(base, "?pid=1")
  catmaid_url = paste0(catmaid_url, "&zp=", dfrow[,"post_node_z"])
  catmaid_url = paste0(catmaid_url, "&yp=", dfrow[,"post_node_y"])
  catmaid_url = paste0(catmaid_url, "&xp=", dfrow[,"post_node_x"])
  catmaid_url = paste0(catmaid_url, "&tool=tracingtool")
  catmaid_url = paste0(catmaid_url, "&active_skeleton_id=", dfrow[,'pre_skid'])
  catmaid_url = paste0(catmaid_url, "&active_node_id=", dfrow[,"post_node_id"])
  catmaid_url = paste0(catmaid_url, "&sid0=5&s0=0")
  
  invisible(catmaid_url)
}
#———
#generate URLs for each row
perm$URL = character(nrow(perm))
perm[,"URL"] = sapply(1:nrow(perm), function(x) perm[x, "URL"] = connector_URL(perm[x,]))

#write out as CSV
write.csv(perm, file = 'filename.csv')

#or upload directly into googlesheets
library(googlesheets)
gs_ls()
sheet <- gs_title("title") #Insert the title of your googlesheet here
#NB take care when using gs_edit_cells as it will overwrite anything already on the googlesheet.
gs_edit_cells(sheet, ws = 1, input = perm$pre_skid, anchor = "A1", byrow = FALSE, col_names = FALSE)
gs_edit_cells(sheet, ws = 1, input = perm$post_skid, anchor = "B1", byrow = FALSE, col_names = FALSE)
gs_edit_cells(sheet, ws = 1, input = perm$connector_id, anchor = "C1", byrow = FALSE, col_names = FALSE)
gs_edit_cells(sheet, ws = 1, input = perm$post_node_id, anchor = "D1", byrow = FALSE, col_names = FALSE)
gs_edit_cells(sheet, ws = 1, input = perm$URL, anchor = "E1", byrow = FALSE, col_names = FALSE)