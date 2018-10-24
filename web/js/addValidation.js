/**
 * 
 */

function validateAddForm() {
    var name = document.getElementById("name").value;
    if (name == "") {
        alert("Name must be filled out");
        return false;
    }
    var type = document.getElementById("type").value;
    if (type == "") {
        alert("type must be filled out");
        return false;
    }
    var street = document.getElementById("street").value;
    if (street == "") {
        alert("street must be filled out");
        return false;
    }
    var city = document.getElementById("city").value;
    if (city == "") {
        alert("city must be filled out");
        return false;
    }
    var state = document.getElementById("state").value;
    if (name == "") {
        alert("state must be filled out");
        return false;
    }
    var zip = document.getElementById("zip").value;
    if (zip == "") {
        alert("zip must be filled out");
        return false;
    }
    var state = document.getElementById("state").value;
    if (name == "") {
        alert("state must be filled out");
        return false;
    }
    return true;
}

