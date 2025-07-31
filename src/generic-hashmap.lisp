(defgeneric hashmap-create (implementation)
  "Create a hashmap of a given implementation.")

(defgeneric hashmap-add (hashmap key value)
  "Adds a new entry into a given hashmap.")

(defgeneric hashmap-get (hashmap key)
  "Get value for a given key.")

(defgeneric hashmap-delete (hashmap key)
  "Deletes an entry given a key.")

(defgeneric hashmap-clear (hashmap)
  "Clears a given hashmap of all it's content.")

(defgeneric hashmap-iterate (hashmap function)
  "Call function with (key value) for each entry.")
