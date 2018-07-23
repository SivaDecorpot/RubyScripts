model = Sketchup.active_model
ents = model.entities

h = 3
l = 2
w = 1

bottom = ents.add_face [0.020, 0, 0], [l, 0, 0], [l, w, 0], [0.020, w, 0]
bottom.pushpull(-0.020)

top = ents.add_face [0.020, 0, h], [l, 0, h], [l, w, h], [0.020, w, h]
top.pushpull(-0.020)

left = ents.add_face [0, 0, h], [0.020, 0, h], [0.020, w, h], [0, w, h]
left.pushpull(-3)

right = ents.add_face [l, 0, h], [l+0.020, 0, h], [l+0.020, w+0.020, h], [l, w+0.020, h]
right.pushpull(-3) 

back = ents.add_face [0, w, h], [l, w, h], [l, w+0.020, h], [0, w+0.020, h]
back.pushpull(-3)

front1 = ents.add_face [0, 0, h], [w, 0, h], [w, 0.020, h], [0, 0.020, h]
front1.material = "red"
front1.pushpull(-3)

front2 = ents.add_face [w, 0, h], [l, 0, h], [l, 0.020, h], [w, 0.020, h]
front2.material = "Yellow"
front2.pushpull(-3)