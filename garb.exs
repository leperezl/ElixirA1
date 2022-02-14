#add one to a key if the key exists
map = Map.put(map, "key", Map.get(res, "key")+1)
#if the key doesnt exist
map = Map.put(map, "key", 1)

#split every letter
String.splitter("",trim:true)