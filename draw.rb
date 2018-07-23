model = Sketchup.active_model
ents = model.entities

h = 3
l = 2
w = 1
d1 = 1
d2 = 2

mats = Sketchup.active_model.materials
ct_mat = mats.add "Color_Texture"
ct_mat.color = "blue"

bottom = ents.add_face [0, 0, 0], [l, 0, 0], [l, w, 0], [0, w, 0]
bottom.pushpull(-0.020)

cube = ents.add_group
door1 = cube.entities.add_face [0, 0, d1], [l, 0, d1], [l, 0.020, d1], [0.020, 0.020, d1]
cube.material = ct_mat
door1.pushpull(-d1)
board1 = ents.add_face [0.020, 0, d1], [l, 0, d1], [l, w, d1], [0.020, w, d1]
board1.pushpull(-0.020)

mats1 = Sketchup.active_model.materials
ct_mat1 = mats1.add "Color_Texture1"
ct_mat1.color = "red"

cube1 = ents.add_group
door2 = cube1.entities.add_face [0, 0, d2], [l, 0, d2], [l, 0.020, d2], [0.020, 0.020, d2]
cube1.material = ct_mat1
door2.pushpull(-d2)
board2 = ents.add_face [0.020, 0, d2], [l, 0, d2], [l, w, d2], [0.020, w, d2]
board2.pushpull(-0.020)

mats2 = Sketchup.active_model.materials
ct_mat2 = mats2.add "Color_Texture2"
ct_mat2.color = "orange"

cube2 = ents.add_group
door3 = cube2.entities.add_face [0, 0, h], [l, 0, h], [l, 0.020, h], [0.020, 0.020, h]
cube2.material = ct_mat2
door3.pushpull(-h)

top = ents.add_face [0.020, 0, h], [l, 0, h], [l, w, h], [0.020, w, h]
top.pushpull(-0.020)

back = ents.add_face [0, w, h], [l, w, h], [l, w+0.020, h], [0, w+0.020, h]
back.pushpull(-3)

left = ents.add_face [0, 0, h], [0.020, 0, h], [0.020, w, h], [0, w, h]
left.pushpull(-3)
right = ents.add_face [l, 0, h], [l+0.020, 0, h], [l+0.020, w+0.020, h], [l, w+0.020, h]
right.pushpull(-3)