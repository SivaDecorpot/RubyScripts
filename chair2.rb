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

start_a = 0.0
end_a = -180.degrees
edges = entities.add_arc([0, 0, 1], X_AXIS, Y_AXIS, 5, start_a, end_a)
arc_curve = edges.first.curve
end_angle = arc_curve.end_angle