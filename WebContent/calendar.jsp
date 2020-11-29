<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="project.BbsDAO"%>
<%@ page import="project.Bbs"%>
<!DOCTYPE html>
<html>
<head>
<title>진도관리 프로그램</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="Resource/css/bootstrap.min.css">
<link rel="stylesheet" href="Resource/css/mdb.min.css">

<link href="Resource/css/fullcalendar.css" rel='stylesheet'>
<link href="Resource/css/fullcalendar.print.css" rel='stylesheet'
	media='print'>



<script type="text/javascript" src="Resource/js/jquery-3.4.0.min.js"></script>
<script type="text/javascript" src="Resource/js/bootstrap.js"></script>
<script type="text/javascript" src="Resource/js/mdb.min.js"></script>
<script src="Resource/js/fullcalendar.js" type="text/javascript"></script>
<script>
	$(document).ready(
			function() {
				var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();

				/*  className colors

				className: default(transparent), important(red), chill(pink), success(green), info(blue)

				 */

				/* initialize the external events
				-----------------------------------------------------------------*/

				$('#external-events div.external-event').each(function() {

					// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
					// it doesn't need to have a start or end
					var eventObject = {
						title : $.trim($(this).text())
					// use the element's text as the event title
					};

					// store the Event Object in the DOM element so we can get to it later
					$(this).data('eventObject', eventObject);

					// make the event draggable using jQuery UI
					$(this).draggable({
						zIndex : 999,
						revert : true, // will cause the event to go back to its
						revertDuration : 0
					//  original position after the drag
					});

				});

				/* initialize the calendar
				-----------------------------------------------------------------*/

				var calendar = $('#calendar').fullCalendar(
						{
							header : {
								left : 'title',
								center : 'agendaDay,agendaWeek,month',
								right : 'prev,next today'
							},
							editable : true,
							firstDay : 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
							selectable : true,
							defaultView : 'month',

							axisFormat : 'h:mm',
							columnFormat : {
								month : 'ddd', // Mon
								week : 'ddd d', // Mon 7
								day : 'dddd M/d', // Monday 9/7
								agendaDay : 'dddd d'
							},
							titleFormat : {
								month : 'MMMM yyyy', // September 2009
								week : "MMMM yyyy", // September 2009
								day : 'MMMM yyyy' // Tuesday, Sep 8, 2009
							},
							allDaySlot : false,
							selectHelper : true,
							select : function(start, end, allDay) {
								var title = prompt('Event Title:');
								if (title) {
									calendar.fullCalendar('renderEvent', {
										title : title,
										start : start,
										end : end,
										allDay : allDay
									}, true // make the event "stick"
									);
								}
								calendar.fullCalendar('unselect');
							},
							droppable : true, // this allows things to be dropped onto the calendar !!!
							drop : function(date, allDay) { // this function is called when something is dropped

								// retrieve the dropped element's stored Event Object
								var originalEventObject = $(this).data(
										'eventObject');

								// we need to copy it, so that multiple events don't have a reference to the same object
								var copiedEventObject = $.extend({},
										originalEventObject);

								// assign it the date that was reported
								copiedEventObject.start = date;
								copiedEventObject.allDay = allDay;

								// render the event on the calendar
								// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
								$('#calendar').fullCalendar('renderEvent',
										copiedEventObject, true);

								// is the "remove after drop" checkbox checked?
								if ($('#drop-remove').is(':checked')) {
									// if so, remove the element from the "Draggable Events" list
									$(this).remove();
								}

							},

							events : [ {
								title : 'calendar',
								start : new Date(y, m, 1)
							}, {
								id : 999,
								title : 'Repeating Event',
								start : new Date(y, m, d - 3, 16, 0),
								allDay : false,
								className : 'info'
							}, {
								id : 999,
								title : 'Repeating Event',
								start : new Date(y, m, d + 4, 16, 0),
								allDay : false,
								className : 'info'
							}, {
								title : 'Meeting',
								start : new Date(y, m, d, 10, 30),
								allDay : false,
								className : 'important'
							}, {
								title : 'Lunch',
								start : new Date(y, m, d, 12, 0),
								end : new Date(y, m, d, 14, 0),
								allDay : false,
								className : 'important'
							}, {
								title : 'Birthday Party',
								start : new Date(y, m, d + 1, 19, 0),
								end : new Date(y, m, d + 1, 22, 30),
								allDay : false,
							}, {
								title : 'Click for Google',
								start : new Date(y, m, 28),
								end : new Date(y, m, 29),
								url : 'http://google.com/',
								className : 'success'
							} ],
						});

			});
</script>
<!-- <style>
body {
	/* margin-top: 40px; */
	text-align: center;
	font-size: 14px;
	font-family: "Helvetica Nueue", Arial, Verdana, sans-serif;
}

#wrap {
	width: 1100px;
	margin: 0 auto;
}

#external-events {
	float: left;
	width: 150px;
	padding: 0 10px;
	text-align: left;
}

#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}

.external-event { /* try to mimick the look of a real event */
	margin: 10px 0;
	padding: 2px 4px;
	background: #3366CC;
	color: #fff;
	font-size: .85em;
	cursor: pointer;
}

#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}

#external-events p input {
	margin: 0;
	vertical-align: middle;
}

#calendar {
	/*       float: right; */
	margin: 0 auto;
	width: 900px;
	background-color: #FFFFFF;
	border-radius: 6px;
	box-shadow: 0 1px 2px #C3C3C3;
}
</style> -->
</head>
<body>

	<%
		String inId = null;
		if (session.getAttribute("inId") != null) {
			inId = (String) session.getAttribute("inId");
		}
	%>
	<!-- header -->
	<header>

		<%
			if (inId != null) {
		%>

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="index.jsp"> <img
				src="Resource/image/logo.png" width="120" height="50"
				class="d-inline-block align-top" alt="">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="calendar.jsp">일정
							추가</a></li>
					<li class="nav-item"><a class="nav-link" href="project.jsp">프로젝트
							추가</a></li>
				</ul>

				<ul class="navbar-nav ml-auto nav-flex-icons">
					<a class="nav-link"><%=inId%>님 안녕하세요</a>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<img src="Resource/image/user11.png">
					</a>
						<div class="dropdown-menu dropdown-menu-right dropdown-default"
							aria-labelledby="navbarDropdownMenuLink-333">

							<a class="dropdown-item" href="logout.jsp">logout</a>
						</div></li>
				</ul>







			</div>
			<%
				} else {
			%>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<a class="navbar-brand" href="index.jsp"> <img
					src="Resource/image/logo.png" width="120" height="50"
					class="d-inline-block align-top" alt="">
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="calendar.jsp">일정
								추가</a></li>
						<li class="nav-item"><a class="nav-link" href="project.jsp">프로젝트
								추가</a></li>
					</ul>

					<ul class="navbar-nav ml-auto nav-flex-icons">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<img src="Resource/image/user11.png">
						</a>
							<div class="dropdown-menu dropdown-menu-right dropdown-default"
								aria-labelledby="navbarDropdownMenuLink-333">

								<a class="dropdown-item" href="login.jsp">login</a>
							</div></li>
					</ul>
					<%
						}
					%>
				
			</nav>
	</header>
	<br />
	<br />

	<div class="container">
		<div id='wrap'>

			<div id='calendar'></div>

			<div style='clear: both'></div>
		</div>
	</div>
	<br />
	<br />

	<!-- Footer -->
	<footer class="bg-light py-3">
		<div class="container">
			<div class="small text-center text-muted">Copyright &copy; 2019
				- PlanB</div>
		</div>
	</footer>


</body>
</html>
