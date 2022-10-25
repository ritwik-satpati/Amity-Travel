package project;

public class FareCalculation {
    public static int flightFareCalculation(String sourceCity, String destinationCity, int pax) {
        
        int fare = 0;

        if (sourceCity.equals("Kolkata") && destinationCity.equals("Cairo")) {
            fare = 30000;
        }
        else if (sourceCity.equals("Delhi") && destinationCity.equals("Cairo")) {
            fare = 28000;
        }
        else if (sourceCity.equals("Mumbai") && destinationCity.equals("Cairo")) {
            fare = 27500;
        }
        else if (sourceCity.equals("Kolkata") && destinationCity.equals("Maldives")) {
            fare = 15000;
        }
        else if (sourceCity.equals("Delhi") && destinationCity.equals("Maldives")) {
            fare = 20000;
        }
        else if (sourceCity.equals("Mumbai") && destinationCity.equals("Maldives")) {
            fare = 12000;
        }
        else if (sourceCity.equals("Kolkata") && destinationCity.equals("Paris")) {
            fare = 60000;
        }
        else if (sourceCity.equals("Delhi") && destinationCity.equals("Paris")) {
            fare = 54000;
        }
        else if (sourceCity.equals("Mumbai") && destinationCity.equals("Paris")) {
            fare = 55000;
        }
        else if (sourceCity.equals("Kolkata") && destinationCity.equals("Bern")) {
            fare = 50000;
        }
        else if (sourceCity.equals("Delhi") && destinationCity.equals("Bern")) {
            fare = 46000;
        }
        else if (sourceCity.equals("Mumbai") && destinationCity.equals("Bern")) {
            fare = 49000;
        }

        return fare*pax;
    
    }

    public static int hotelFareCalculation(String city, int rooms, int nights) {

        int fare = 0;

        if (city.equals("Cairo, Egypt")) {
            fare = 8000;
        }
        else if (city.equals("Paris, France")) {
            fare = 7500;
        }
        else if (city.equals("Maldives")) {
            fare = 10000;
        }
        else if (city.equals("Bern, Switzerland")) {
            fare = 5000;
        }

        return ((fare*rooms)*nights);
    
    }

}
