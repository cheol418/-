<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
detail<br>
<script>
	function initMap(){
	var seoul = { lat: ${concert.Y} ,lng: ${concert.X} };
	var map = new google.maps.Map(
        document.getElementById('map'), {
          zoom: 15,
          center: seoul
	});
	
	new google.maps.Marker({
		position: seoul,
		map: map
	});
	}
</script>
<style>
  #map {
    height: 500px;
    width: 500px;
  }
  html, body {
    height: 100%;
    margin: 0;
    padding: 0;
  }
</style>
${concert.DTLCONT}<br>
<div id="map">
	<script async
	    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCVVvjWSIjTYymU9Xkhcmq7oJ09y_HixZc&callback=initMap">
	</script>
</div>