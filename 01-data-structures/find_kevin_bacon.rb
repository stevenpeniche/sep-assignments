class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  attr_accessor :films # An array of films the actor is in
end

path_to_kev = []
visited = []

def find_kevin_bacon(start_node)
  if path_to_kev.length < 6
    for film in start_node.films
      if visited.include?(film) === false
        for actor in start_node.film_actor_hash[film]
          path_to_kev.push film
          actor === Kevin_Bacon ? return path_to_kev : find_kevin_bacon(actor)
        end
      end
    end
  end
end
