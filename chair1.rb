model = Sketchup.active_model
ents = model.entities

l = 1

leg1 = ents.add_face [0, 0, 0], [0.050, 0, 0], [0.050, 0.050, 0], [0, 0.050 ,0]
leg1.pushpull(-l)
leg2 = ents.add_face [l, 0, 0], [l+0.050, 0, 0], [l+0.050, 0.050, 0], [l, 0.050, 0]
leg2.pushpull(-l)
leg3 = ents.add_face [l, l, 0], [l+0.050, l, 0], [l+0.050, l+0.050, 0], [l, l+0.050, 0]
leg3.pushpull(-l)
leg4 = ents.add_face [0, l, 0], [0.050, l, 0], [0.050, l+0.050, 0], [0, l+0.050, 0]
leg4.pushpull(-l)

place = ents.add_face [0, 0, l], [l+0.050, 0, l], [l+0.050, l+0.050, l], [0, l+0.050, l]
place.pushpull(-0.020)

back = ents.add_face [0, l, l], [l+0.050, l, l], [l+0.050, l+0.050, l], [0, l+0.050, l]
back.pushpull(l)

#lefthand = ents.add_face [0, 0, l+0.25], [0.050, 0, l+0.25], [0.050, l, l+0.25], [0, 0.050, l+0.25]
#lefthand.pushpull(-0.25)

#righthand = ents.add_face [l, 0, l+0.50], [l+0.050, 0, l+0.50], [l+0.050, l, l+0.50], [l, 0.050, l+0.50]
#righthand.pushpull(-0.25)