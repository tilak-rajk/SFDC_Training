/*
Apex Classes Assignment 3: 

Create a function which take two dates as argument and return number of working days between two dates excluding both days. (Saturday and Sunday is non-working days).

NOTE:- I am assuming that startDate will always be less than endDate so I am not performing any validations on the dates passed.
*/

public class CountWorkingDays {
    public static Integer calculateWorkingDays(String startDate, String endDate){
    	Integer noOfWorkingDays = 0;
        DateTime sD = DateTime.valueOf( startDate );  
        DateTime eD = DateTime.valueOf( endDate );    
        
        while(sd <= ed){
            String weekDay = sd.format('E');
            if(weekDay != 'Sat' && weekDay != 'Sun')
                noOfWorkingDays++;
            sd = sd.adddays(1);
        }
        return noOfWorkingDays;
    }
}

/*
Wrote following code in anonymous window to check the output:

Integer wDays = CountWorkingDays.calculateWorkingDays('2020-04-01  00:00:00','2020-04-30 00:00:00');
System.debug('Working Days : ' + wDays);
*/