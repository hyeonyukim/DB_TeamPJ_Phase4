# DB_TeamPJ_Phase4
<THK Website README file>
"Team9-Phase4" Project contains 25 .jsp files and will provide all services about used car trading site. In eclipse, you have to run "title.jsp" to start the site. There are total 7 menus below:
================================================================
1.Search 2.Modify Account 3.Sales history 
4.Register new car 6.See every Sales history 7.Modify vehicle
================================================================
But first, you have to Register and Login to the site

1.Registration
To register in the site, you have to enter those information.You must input the information which one with "*".
------------------------------------------------------------------
*Fname	*Lname		*Password	Address		Birth Date
Phone	Gender		Occupation
------------------------------------------------------------------
You will get your user ID after filling up the form. 

2.Login
You can login to the site with your id and password. 
Administrator's id and password is '1' and '1234'

3.Search
You can search for cars with various conditions. There are following conditions.
--------------------------------------------------------------------
EngineDisplacement	Model	PopularModel(Y/N)	Transmission
Fuel	Color	Category	Make	ProducingCountry	Price
DrivingKilometer
--------------------------------------------------------------------
You can either fill up all the information or blank all the information.
When you submit, you can see brief information(id, make, price) about every vehicle that meets the conditions in table form. Below table, you can enter the vehicle's id that you want to see in detail. In detail result, you can see following information.
------------------------------------------------------------------------
Vehicle_id	Engine_displacement	Model	PopularModel
Transmission	Fuel	Color	Category	Make	ProducingCountry
DrivingKilometer	Price	DetailedModel
------------------------------------------------------------------------
Finally, You can decide whether to buy the car or not.

4.Modify Account
You can change following information about your account.
------------------------------------------------------------------
Fname	Lname		Password	Address		Birth Date
Phone	Gender		Occupation
------------------------------------------------------------------

5.Sales history
You can check every sales history on your account.

<<--The menus below are accessible only to the manager.-->>

6.Register new Car
You can register new car with following information. All the information is not nullable.
--------------------------------------------------------------------
EngineDisplacement	Model	PopularModel(Y/N)	Transmission
Fuel	Color	Category	Make	ProducingCountry	Price
DrivingKilometer
--------------------------------------------------------------------

7.See every Sales history
You can check all transaction records for all users from this menu.

8.Sales Summary
You can check the sales figures for a specific period of time or for a manufacturer or both from this menu.

9.Modify vehicle
You can modify one information about one vehicle at a time. You have to enter vehicle id, attribute that you want to modify and new value for that field.
