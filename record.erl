-module (record).
-compile(exports_all).

-record(robot, {name, 
				type=industrial,
				hobbies,
				details=[]}).


first_robot() ->
	#robot{	name="Mechatron",
			type=handmade,
			details=["Moved by a small man inside"]}.