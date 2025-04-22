extends  OverlayUI_Tab

const ORGANIZATION = "" ## Your username
const REPOSITORY = "" ## Your repository name
var title = ""
var description = ""


func _ready():
	%TextureRect.show()

## Navigate to create the issue page in GitHub
## https://forum.godotengine.org/t/how-to-send-report-bug-from-in-game-form-to-github-issues/108061
func _on_report_pressed():
	var url = "https://github.com/{organization}/{repository}/issues/new?title={title}&body={description}".format({
		organization = ORGANIZATION,
		repository = REPOSITORY,
		title = title.uri_encode(),
		description = description.uri_encode()
	})
	
	OS.shell_open(url)
	
	

	
	
