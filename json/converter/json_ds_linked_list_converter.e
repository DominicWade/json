indexing
	description: "A JSON converter for DS_LINKED_LIST"
	author: "Paul Cohen"
	date: "$Date: $"
	revision: "$Revision: $"
	file: "$HeadURL: $"

class JSON_DS_LINKED_LIST_CONVERTER

inherit
    JSON_CONVERTER
    
create
    make
    
feature {NONE} -- Initialization
    
    make is
        do
            create object.make
        end
        
feature -- Access

    json: JSON_ARRAY
            
    object: DS_LINKED_LIST [ANY]
            
feature -- Conversion

    from_json (j: like json): like object is
        local
            i: INTEGER
        do
            create Result.make
            from
                i := 1
            until
                i > j.count
            loop
                Result.put_last (factory.eiffel_object (j [i], Void))
                i := i + 1
            end
        end
        
    to_json (o: like object): like json is
        local
            c: DS_LIST_CURSOR [ANY]
        do
            create Result.make_array
            from
                c := o.new_cursor
                c.start
            until
                c.after
            loop
                Result.add (factory.json_value (c.item))
                c.forth
            end
        end
        
end -- class JSON_DS_LINKED_LIST_CONVERTER  