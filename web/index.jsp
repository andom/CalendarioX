<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Calendario X - Agenda de Compromissos</title>
<link rel='stylesheet' type='text/css' href='css/style.css' />
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
  <!-- Start: page-top-outer -->
<div id="page-top-outer">    

<!-- Start: page-top -->
<div id="page-top">

	<!-- start logo -->
	<div id="logo">
	<a href=""><img src="images/logo.png" width="142" height="50" alt="" /></a>
	
	</div>
	<!-- end logo -->
 	<div class="clear"></div>

	<div class="navCalendar"></div>
</div>
<!-- End: page-top -->

</div>
<!-- End: page-top-outer -->
    <div id='calendar'></div>
</body>
</html>
