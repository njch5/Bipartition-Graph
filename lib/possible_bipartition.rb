# Time complexity: O(N + E) n is the number of nodes and e is the number of edges
# Space complexity: O(n) n is the number of the nodes in the graph
# Referred to a Leetcode problem to try to understand how to approach this
def possible_bipartition(dislikes)
  return true if dislikes.empty?
  @vertices_group = {}
  @visited = {}
  
  dislikes.each_with_index do |adj, v|
    @visited[v] = adj
  end
  @visited.each { |v, adj|
    return false if @vertices_group[v].nil? && !valid_group?(v, 1)
  }
  return true
end

def valid_group?(v, group)
  return group == @vertices_group[v] unless @vertices_group[v].nil? # Check if the group matches
  @vertices_group[v] = group
  @visited[v].each do |adj|    
    return false unless valid_group?(adj, -group) # Check if the edges are in opposite groups
  end
  return true
end

