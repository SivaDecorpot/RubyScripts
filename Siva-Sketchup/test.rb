def test
	@model = Sketchup.active_model
	#folder = File.dirname(__FILE__)+"/Oakmodels"
	folder = "C:/Users/Admin/Desktop/skpfile"
	#p folder
	Dir.foreach( folder ) do |fn|
		#p fn
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
		    top_view(patch,filename[0])
		    front_view(patch,filename[0])
		    normal_view(patch,filename[0])
		  }
		end
	end
end

def top_view(instance,fname)
	distance = 1.5
	pers = getViewFromSide("xy",distance,instance)
	view = @model.active_view
	centre = instance.bounds.center.to_a
	zAxis = instance.transformation.zaxis.to_a
	keys = {
		:position=>[100,100,500],
		#:position=>pers,
		:filename=> "C:/Users/Admin/Desktop/Oaktree_Thumbnail/TopView.png",
		:width=>640,
		:height=>480,
		:antialias=>false,
		:pers=>true,
		:target=>[0, 0, 0],
		:up=>[0, 0, 1],
		:compression=>0.9,
		:transparent => true
	}
	camera = Sketchup::Camera.new keys[:position], keys[:target], keys[:up]
	camera.perspective = keys[:pers]
	view.camera = camera
	view.write_image(keys)
end

def front_view(instance,fname)
	distance = 1.5
	pers = getViewFromSide("xy",distance,instance)
	view = @model.active_view
	centre = instance.bounds.center.to_a
	zAxis = instance.transformation.zaxis.to_a
	keys = {
		:position=>[500,-4247.258634,90],
		#:position=>pers,
		:filename=> "C:/Users/Admin/Desktop/Oaktree_Thumbnail/FrontView.png",
		:width=>640,
		:height=>480,
		:antialias=>false,
		:pers=>true,
		:target=>[500, -500, 90],
		:up=>[0.0, 0.0, 1.0],
		:compression=>0.9,
		:transparent => true
	}
	camera = Sketchup::Camera.new keys[:position], keys[:target], keys[:up]
	camera.perspective = keys[:pers]
	view.camera = camera
	view.write_image(keys)
end

def normal_view(instance,fname)
	distance = 1.5
	pers = getViewFromSide("xy",distance,instance)
	view = @model.active_view
	centre = instance.bounds.center.to_a
	zAxis = instance.transformation.zaxis.to_a
	keys = {
		:position=>[-1998.172423, 1998.172423, 1339.086211],
		#:position=>pers,
		:filename=> "C:/Users/Admin/Desktop/Oaktree_Thumbnail/ISOView.png",
		:width=>640,
		:height=>480,
		:antialias=>false,
		:pers=>true,
		:target=>[500,-500, 90],
		:up=>[0.23570226039551587, -0.23570226039551587, 0.9428090415820635],
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