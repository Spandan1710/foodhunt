function validateMakeReservationForm() {
    var bookingDate = document.getElementById("bookingDate").value;
    if (bookingDate == "") {
        alert("Booking date must be filled out");
        return false;
    }
    var bookingTime = document.getElementById("bookingTime").value;
    if (bookingTime == "") {
        alert("Booking time must be filled out");
        return false;
    }
    var bookingSeats = document.getElementById("bookingSeats").value;
    if (bookingSeats == "") {
        alert("Booking seats must be filled out");
        return false;
    }
    return true;
}