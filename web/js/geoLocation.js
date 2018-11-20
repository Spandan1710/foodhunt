function geoFindMe() {
    //var output = document.getElementById("out");

    if (!navigator.geolocation){
        console.log("Geolocation is not supported by your browser");
        return;
    }

    function success(position) {
        var latitude  = position.coords.latitude;
        var longitude = position.coords.longitude;

        //output.innerHTML = '<p>Latitude is ' + latitude + '° <br>Longitude is ' + longitude + '°</p>';
        document.getElementById('latitude').value = latitude;
        document.getElementById('longitude').value = longitude;
        console.log(latitude);
        // $.ajax({
        //     url:'SearchController',
        //     method:
        //     data:{
        //         latitude: latitude,
        //         longitude: longitude,
        //         keyword: document.getElementById('myInput').value
        //     }
        // })
        // $.post('/SearchController',{
        //     latitude: latitude,
        //     longitude: longitude,
        //     keyword: document.getElementById('myInput').value
        // }, function (data,status) {
        //     console.log("Here Here")
        // })
        var img = new Image();
        img.src = "https://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=13&size=300x300&sensor=false";

        //output.appendChild(img);
    }

    function error() {
        //output.innerHTML = "Unable to retrieve your location";
        console.log("error");
    }

   // output.innerHTML = "<p>Locating…</p>";

    navigator.geolocation.getCurrentPosition(success, error);
}


function geoFindAlternate() {
    //var output = document.getElementById("out");

    if (!navigator.geolocation){
        console.log("Geolocation is not supported by your browser");
        return;
    }

    function success(position) {
        var latitude  = position.coords.latitude;
        var longitude = position.coords.longitude;

        //output.innerHTML = '<p>Latitude is ' + latitude + '° <br>Longitude is ' + longitude + '°</p>';
        document.getElementById('latitude1').value = latitude;
        document.getElementById('longitude1').value = longitude;
        console.log(latitude);


        var img = new Image();
        img.src = "https://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=13&size=300x300&sensor=false";

        //output.appendChild(img);
    }

    function error() {
        //output.innerHTML = "Unable to retrieve your location";
        console.log("error");
    }

    // output.innerHTML = "<p>Locating…</p>";

    navigator.geolocation.getCurrentPosition(success, error);
}

