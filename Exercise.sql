select * from cd.members;
--- How can you retrieve all the information from the cd.facilities table?
select * from cd.facilities ;

--- You want to print out a list of all of the facilities and their cost to members. 
--- How would you retrieve a list of only facility names and costs?
SELECT name, membercost FROM cd.facilities;

--- How can you produce a list of facilities that charge a fee to members?
select * from cd.facilities where membercost > 0;

 --- How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? 
 --- Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
SELECT facid, name, membercost, monthlymaintenance
 FROM cd.facilities
 WHERE membercost > 0 AND
 (membercost < monthlymaintenance/50.0);

--- How can you produce a list of all facilities with the word 'Tennis' in their name?
select * 
from cd.facilities
where name like ('%Tennis%');

--- How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
select * from cd.facilities 
where facid in (1,5);

--- How can you produce a list of members who joined after the start of September 2012? 
--- Return the memid, surname, firstname, and joindate of the members in question.
SELECT memid, surname, firstname, joindate 
FROM cd.members WHERE joindate >= '2012-09-01';

--- How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.
select surname from cd.members order by surname;

--- You'd like to get the signup date of your last member. How can you retrieve this information?
select joindate from cd.members order by joindate desc limit 1;

--- Produce a count of the number of facilities that have a cost to guests of 10 or more.
select count(*) from cd.facilities where guestcost >= 10;

--- Produce a list of the total number of slots booked per facility in the month of September 2012.
--- Produce an output table consisting of facility id and slots, sorted by the number of slots.
SELECT facid, sum(slots) AS "Total Slots" FROM cd.bookings 
WHERE starttime >= '2012-09-01' AND starttime < '2012-10-01' GROUP BY facid ORDER BY SUM(slots);

--- Produce a list of facilities with more than 1000 slots booked. 
--- Produce an output table consisting of facility id and total slots, sorted by facility id.
select facid , sum(slots) as total_slots  from cd.bookings group by facid having sum(slots) > 1000;

--- How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? 
--- Return a list of start time and facility name pairings, ordered by the time.
SELECT cd.bookings.starttime AS start, cd.facilities.name 
AS name 
FROM cd.facilities 
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid 
WHERE cd.facilities.facid IN (0,1) 
AND cd.bookings.starttime >= '2012-09-21' 
AND cd.bookings.starttime < '2012-09-22' 
ORDER BY cd.bookings.starttime;


--- How can you produce a list of the start times for bookings by members named 'David Farrell'?
select b.starttime from cd.bookings b inner join cd.members m on b.memid = m.memid 
where firstname = 'David' and surname = 'Farrell';





