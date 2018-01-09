films_with_kev = ['Footloose'..]

def find_kevin_bacon(start_node)
  kev_connections = []
  for film in films_with_kev
    if kev_connections.length < 6
      film_actors = Kevin_Bacon.film_actor_hash[film]
      for actor in film_actors
        if actor === start_node.name
          kev_connections.push film
        end
      end
    else
      break
    end
  end
  kev_connections
end
