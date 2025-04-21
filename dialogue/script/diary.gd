extends DialogicBackground

@onready var date = %Date
@onready var text = %Text
@onready var topic = %Topic

func _ready():
	## Connect to DialogicSignal
	Dialogic.signal_event.connect(DialogicSignal)

## If the argument matches the specified keyword, it displays the specified date and text.
func DialogicSignal(argument:String):
	## Show only wanted image and hide unwanted images
	if argument == "first":
		date.text = "[center]7th April 2012[/center]"
		topic.text = "[center]The First Note[/center]"
		%first.set_visible(true)
		
	elif argument == "second":
		date.text = "[center]10th April 2012[/center]"
		topic.text = "[center]A Man Is in Our House[/center]"
		%second.set_visible(true)
		%first.set_visible(false)
		
	elif argument == "third":
		date.text = "[center]28th April 2012[/center]"
		topic.text = "[center]An Unkind Man Who Lives in Our House Is Very Cruel[/center]"
		%third.set_visible(true)
		%second.set_visible(false)
		%first.set_visible(false)

	elif argument == "fourth":
		date.text = "[center]20th March 2013[/center]"
		topic.text = "[center]That Cruel Man Has Disappeared![/center]"
		%fourth.set_visible(true)
		%third.set_visible(false)
		%second.set_visible(false)
		%first.set_visible(false)
		
	elif argument == "fifth":
		date.text = "[center]2nd May 2013[/center]"
		topic.text = "[center]Kokoro Has Changed[/center]"
		%fourth.set_visible(false)
		%third.set_visible(false)
		%second.set_visible(false)
		%fifth.set_visible(true)
		
	elif argument == "sixth":
		date.text = "[center]22nd February 2017[/center]"
		topic.text = "[center]A Good Opportunity Brings Happiness[/center]"
		%second.set_visible(false)
		%first.set_visible(false)
		%fourth.set_visible(false)
		%third.set_visible(false)
		%fifth.set_visible(false)
		%sixth.set_visible(true)
		
	elif argument == "seventh":
		date.text = "[center]29th March 2017[/center]"
		topic.text = "[center]Multiple Personalities[/center]"
		%seventh.set_visible(true)
		%second.set_visible(false)
		%first.set_visible(false)
		%fourth.set_visible(false)
		%third.set_visible(false)
		%fifth.set_visible(false)
		%sixth.set_visible(false)
		
	elif argument == "eighth":
		date.text = "[center]10th July 2017[/center]"
		topic.text = "[center]Mother[/center]"
		%eighth.set_visible(true)
		%second.set_visible(false)
		%first.set_visible(false)
		%fifth.set_visible(false)
		%seventh.set_visible(false)
		%fourth.set_visible(false)
		%third.set_visible(false)
		%sixth.set_visible(false)
		
	elif argument == "ninth":
		date.text = "[center]20th January 2020[/center]"
		topic.text = "[center]A Good Day[/center]"
		%ninth.set_visible(true)
		%eighth.set_visible(false)
		%second.set_visible(false)
		%first.set_visible(false)
		%fifth.set_visible(false)
		%seventh.set_visible(false)
		%fourth.set_visible(false)
		%third.set_visible(false)
		%sixth.set_visible(false)
		
	elif argument == "tenth":
		date.text = "[center]31st June 2021[/center]"
		topic.text = "[center]Sadness[/center]"
		%tenth.set_visible(true)
		%ninth.set_visible(false)
		%eighth.set_visible(false)
		%second.set_visible(false)
		%first.set_visible(false)
		%fifth.set_visible(false)
		%seventh.set_visible(false)
		%fourth.set_visible(false)
		%third.set_visible(false)
		%sixth.set_visible(false)
		
	elif argument == "eleventh":
		date.text = "[center]12th August 2021[/center]"
		topic.text = "[center]Akane[/center]"
		%eleventh.set_visible(true)
		%tenth.set_visible(false)
		%ninth.set_visible(false)
		%eighth.set_visible(false)
		%second.set_visible(false)
		%first.set_visible(false)
		%fifth.set_visible(false)
		%seventh.set_visible(false)
		%fourth.set_visible(false)
		%third.set_visible(false)
		%sixth.set_visible(false)
		
	elif argument == "twelfth":
		date.text = "[center]31st September 2021[/center]"
		topic.text = "[center]Akane[/center]"
		%twelfth.set_visible(true)
		%tenth.set_visible(false)
		%ninth.set_visible(false)
		%eighth.set_visible(false)
		%second.set_visible(false)
		%first.set_visible(false)
		%fifth.set_visible(false)
		%seventh.set_visible(false)
		%fourth.set_visible(false)
		%third.set_visible(false)
		%sixth.set_visible(false)
		%eleventh.set_visible(false)
		
	elif argument == "thirteenth":
		date.text = "[center]12th November 2021[/center]"
		topic.text = "[center]Akane[/center]"
		%thirteenth.set_visible(true)
		%twelfth.set_visible(false)
		%tenth.set_visible(false)
		%ninth.set_visible(false)
		%eighth.set_visible(false)
		%second.set_visible(false)
		%first.set_visible(false)
		%fifth.set_visible(false)
		%seventh.set_visible(false)
		%fourth.set_visible(false)
		%third.set_visible(false)
		%sixth.set_visible(false)
		%eleventh.set_visible(false)
		
	elif argument == "fourteenth":
		date.text = "[center]13th January 2022[/center]"
		topic.text = "[center]The Last Note[/center]"
		%eleventh.set_visible(false)
		%thirteenth.set_visible(false)
		%twelfth.set_visible(false)
		%tenth.set_visible(false)
		%ninth.set_visible(false)
		%eighth.set_visible(false)
		%second.set_visible(false)
		%first.set_visible(false)
		%fifth.set_visible(false)
		%seventh.set_visible(false)
		%fourth.set_visible(false)
		%third.set_visible(false)
		%sixth.set_visible(false)
		%fourteenth.set_visible(true)
		
