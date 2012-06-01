<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<style type='text/css'>

	body {
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		margin: 0;
	}
	
	h1 {
		margin: 0;
		padding: 0.5em;
	}
	
	p.description {
		font-size: 0.8em;
		padding: 1em;
		position: absolute;
		top: 3.2em;
		margin-right: 400px;
	} 
	
	#message {
		font-size: 0.7em;
		position: absolute;
		top: 1em; 
		right: 1em;
		width: 350px;
		display: none;
		padding: 1em;
		background: #ffc;
		border: 1px solid #dda;
	}
	
</style>
<link rel='stylesheet' type='text/css' href='jquery-ui.css' />
<link rel='stylesheet' type='text/css' href='jquery.weekcalendar.css' />

<script type='text/javascript' src='jquery.min.js'></script>
<script type='text/javascript' src='jquery-ui.min.js'></script>
<script type='text/javascript' src='jquery.weekcalendar.js'></script>
<script type='text/javascript'>
	   
	$(document).ready(function() {
            $('#calendar').weekCalendar({
                data:"/CalendarioX/AgendaServlet",
                timeslotsPerHour: 4,
                use24Hour: true,
                timeFormat: 'G:i',
                timeSeparator: " às ",
                buttonText: {today : "hoje", lastWeek : "<", nextWeek : ">"},
                height: function($calendar){
                        return $(window).height() - $("h1").outerHeight();
                },
                eventRender : function(calEvent, $event) {
                    if(calEvent.end.getTime() < new Date().getTime()) {
                        $event.css("backgroundColor", "#aaa");
                        $event.find(".time").css({"backgroundColor": "#999", "border":"1px solid #888"});
                    }
                },
                resizable : function(calEvent, $event) {
                    return false;
                },
                draggable : function(calEvent, $event) {
                    return false;
                },               
                eventNew : function(calEvent, $event) {
                    var d = calEvent.start.getDate();
                    var M = calEvent.start.getMonth()+1;
                    var y = calEvent.start.getFullYear();
                    var data = ((d<=9?'0'+d:d) +'/'+ (M<=9?'0'+M:M) +'/'+ y);
                    
                    var h = calEvent.start.getHours();
                    var m = calEvent.start.getMinutes();                    
                    var inicio = ((h<=9?'0'+h:h) +':'+ (m<=9?'0'+m:m));

                    var h = calEvent.end.getHours();
                    var m = calEvent.end.getMinutes();                    
                    var fim = ((h<=9?'0'+h:h) +':'+ (m<=9?'0'+m:m));
                    
                    //window.location = "cadastrar.jsp?id="+calEvent.id+"&data="+data+"&inicio="+inicio+"&fim="+fim;
                    window.location = "cadastrar.jsp?data="+data+"&inicio="+inicio+"&fim="+fim;
                },
                eventDrop : function(calEvent, $event) {
                    displayMessage("<strong>Moved Event</strong><br/>Start: " + calEvent.start + "<br/>End: " + calEvent.end);
                },
                eventClick : function(calEvent, $event) {
                    window.location = "cadastrar.jsp?id=" + calEvent.id;
                }
            });


            function displayMessage(message) {
                $("#message").html(message).fadeIn();
            }

            $("<div id=\"message\" class=\"ui-corner-all\"></div>").prependTo($("body"));
	});

</script>
</head>
<body>
    <p class="description"></p>
    <div id='calendar'></div>
</body>
</html>
