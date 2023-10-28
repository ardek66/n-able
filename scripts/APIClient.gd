extends HTTPRequest

var headers = ["Content-Type: application/json"]
var url = "http://127.0.0.1:8080/distribution/"

func request_drum(matrice):
	var json = JSON.print({"Matrix":matrice})
	request(url, headers, false, HTTPClient.METHOD_POST, json)
