#Create the WebDialog and set its HTML file
face_dialog = UI::WebDialog.new
path = Sketchup.find_support_file "C:/Users/Admin/Desktop/create_face.html"
face_dialog.set_file path

#set WebDialog's callback
face_dialog.add_action_callback("create_face") {|d, arg|
	if arg.to_s.length == 0
		puts "Invalid input. Coordinates must be valid number."
	else
		v = arg.to_s.split(",")
		pt1 = Geom::Point3d.new(Float(v[0].strip), Float(v[1].strip), Float(v[2].strip))
		pt2 = Geom::Point3d.new(Float(v[3].strip), Float(v[4].strip), Float(v[5].strip))
		pt3 = Geom::Point3d.new(Float(v[6].strip), Float(v[7].strip), Float(v[8].strip))
		pt4 = Geom::Point3d.new(Float(v[9].strip), Float(v[10].strip), Float(v[11].strip))

		vec1 = pt2 - pt1
		vec2 = pt2 - pt3
		plane = [pt1, vec1 * vec2]
		if pt4.on_plane? plane
			Sketchup.active_model.entities.add_face pt1, pt2, pt3, pt4
		else
			puts "Invalid input. Points must lie on the same plane"
		end
	end
}

if RUBY_PLATFORM.index "darwin"
	face_dialog.show_modal
else
	face_dialog.show
end