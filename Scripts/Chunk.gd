extends Spatial
tool

const vertices = [
	Vector3(0,0,0),
	Vector3(1, 0, 0),
	Vector3(0,1,0),
	Vector3(1,1,0),
	Vector3(0,0,1),
	Vector3(1,0,1),
	Vector3(0,1,1),
	Vector3(1,1,1)
]

const TOP = [2,3,7,6]
const BOTTOM = [0,2,5,1]
const LEFT=[6,4,0,2]
const RIGHT=[3,1,5,7]
const FRONT=[7,5,4,6]
const BACK = [2,0,1,3]

var blocks = []

var st = SurfaceTool.new()
var mesh = null
var mesh_instance = null


func update():
	if mesh_instance !=null:
		mesh_instance.call_deferred("queue_free")
		mesh_instance=null

	mesh = Mesh.new()
	mesh_instance = MeshInstance.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	
	for x in Global.DIMENSION.x:
		for y in Global.DIMENSION.y:
			for z in Global.DIMENSION.z:
				create_block(x,y,z)
