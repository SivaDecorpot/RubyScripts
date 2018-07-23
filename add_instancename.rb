def show
	get_height
	get_length
end
#----------------------- height part start
def get_height
	selection = Sketchup.active_model.selection
	count = selection.length
	if count != 0
		selection.each { |sel|
			origin = sel.transformation.origin
			x = origin[0]
			y = origin[1]
			z = origin[2]
			if sel.class == Sketchup::Group
				box = sel.local_bounds
			elsif sel.class == Sketchup::ComponentInstance
				box = sel.definition.bounds
			end
			mix = box.min.x.to_f
			miy = 0
			miz = box.min.z.to_f

			mx = box.max.x.to_f
			my = 0
			mz = box.max.z.to_f

			name = sel.definition.name
			#defn = sel.definition
			#bbox = defn.bounds
			#w = bbox.width.to_l.to_s
			#h = bbox.height.to_l.to_s
			#d = bbox.depth.to_f
			#puts mix, miy, miz, mx, my, mz
			if name != "BASE HANDLE#1"
				dim = sel.entities.add_dimension_linear([mix, miy, miz], [mx, my, mz], [25, 0, 0])
				dim.material = "aqua"
			end
		}
	else
		UI.messagebox "No models are selected!", MB_OK
	end
end
#----------------------- height part end

#----------------------- length part start
def get_length
	selection = Sketchup.active_model.selection
	count = selection.length
	if count != 0
		selection.each { |sel|
			origin = sel.transformation.origin
			x = origin[0]
			y = origin[1]
			z = origin[2]
			if sel.class == Sketchup::Group
				box = sel.local_bounds
			elsif sel.class == Sketchup::ComponentInstance
				box = sel.definition.bounds
			end
			mix = box.min.x.to_f
			miy = box.min.y.to_f
			miz = 0

			mx = box.max.x.to_f
			my = box.max.y.to_f
			mz = 0

			name = sel.definition.name
			#defn = sel.definition
			#bbox = defn.bounds
			#w = bbox.width.to_l.to_s
			#h = bbox.height.to_l.to_s
			#d = bbox.depth.to_l.to_s
			if name != "BASE HANDLE#1"
				dim = sel.entities.add_dimension_linear([mix, miy, miz], [mx, my, mz], [25, 0, 0])
				dim.material = "chartreuse"
			end
		}
	else
		UI.messagebox "No models are selected!", MB_OK
	end
end
#----------------------- length part end