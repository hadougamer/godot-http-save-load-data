extends Node

var base_url = "http://localhost:9500"
var req:HTTPRequest

func set_req( requester ):
	self.req = requester

func list_score( context, callback):
	var url = base_url + "/score/read"
	req.connect("request_completed", context, callback)
	req.request(url)

func save_score(name, score, context, callback ):
	var url = base_url + "/score/create"
	req.connect("request_completed", context, callback)
	var headers = ["Content-Type: application/json"]
	var use_ssh = false
	req.request(
		url, 
		headers, 
		use_ssh, 
		HTTPClient.METHOD_POST,
		JSON.print({ "name": name, "score": score })
	)
