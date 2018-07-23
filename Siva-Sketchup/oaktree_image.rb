def oaktree_test
	@model = Sketchup.active_model
	#folder = File.dirname(__FILE__)+"/Oakmodels"
	folder = "C:/Users/Admin/AppData/Roaming/SketchUp/SketchUp 2017/SketchUp/Components/Oak_thumb"
	Dir.foreach( folder ) do |fn|
		p fn
		if fn != "." && fn != ".."
			path = folder+ "/#{fn}"
			filename = fn.split(".")
			
			entities = @model.active_entities
			entities.each { | entity| entities.erase_entities entity }
			
			definitions = @model.definitions
			componentdefinition = definitions.load path
			transform = Geom::Transformation.new [6,0,0]

			add_instance = @model.entities.add_instance componentdefinition, transform
			composants = @model.entities.grep(Sketchup::ComponentInstance)

			woodStackHouses = composants
			woodStackHouses.each{|patch|
		    creerLesScenesWoodStack(patch,filename[0])
		  }
		end
	end
end

def creerLesScenesWoodStack(instance,fname)
	distance = 1.5
	pers = getViewFromSide("xy",distance,instance)
	view = @model.active_view
	centre = instance.bounds.center.to_a
	zAxis = instance.transformation.zaxis.to_a
	keys = {
		:position=>[-59, -53, 30],
		#:position=>pers,
		:filename=> "C:/Users/Admin/Desktop/Oaktree_Thumbnail/#{fname}.png",
		:width=>640,
		:height=>480,
		:antialias=>false,
		:pers=>true,
		:target=>[0.0, 8.149606299212692, 14.724409448818898],
		:up=>zAxis,
		:compression=>0.9,
		:transparent => true
	}
	camera = Sketchup::Camera.new keys[:position], keys[:target], keys[:up]
	camera.perspective = keys[:pers]
	view.camera = camera
	view.write_image(keys)
end

def getViewFromSide(axe,distance,instance)
	bounds = instance.bounds
	centre = instance.bounds.center
	case axe
	when "xy"
		axeDeTransformation1 = instance.transformation.xaxis
    axeDeTransformation2 = instance.transformation.yaxis
    axeDeTransformation = axeDeTransformation1+axeDeTransformation2
    distance = bounds.width * distance
  end
  vector = axeDeTransformation.clone
  vector.length = distance
  if axe[0..0] == "-" || axe == "xy"
  	vector[0] = vector[0] * 3
    vector[1] = vector[1] * 3
    vector[2] = vector[2] * 3
  	vector.reverse!
  end
  position = centre.offset vector
  return position.to_a
end