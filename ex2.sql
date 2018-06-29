--Q1
select genreid, count(genreid) as num
From track
GROUP BY genreid
ORDER BY num desc
limit 1;
--Q2
select count(trackid),track.AlbumId as album_id_tracks,
  album.AlbumId as album_id_albums, artistid
from track
inner join album on album.albumid = track.albumid
group by album.artistid;
--Q3
SELECT LastName, FirstName, Title, ReportsTo,
	CASE ReportsTo
		WHEN 1 THEN "Adams_Andrew"
		WHEN 2 THEN "Edwards_Nancy"
		WHEN 6 THEN "Mitchell_Michael"
		ELSE "Adams_Andrew"
	END boss_name
FROM Employee
--Q4
select lastname, firstname, bonus
from employee
where title like 'sales%' 
order by bonus desc
limit 1;
--Q5
select trackid, count(trackid) as num
From PlaylistTrack
GROUP BY trackid
ORDER BY num desc
limit 10;
--Q6
select track.trackid, genre.genreid, track.genreid
from track
join genre on track.genreid = genre.genreid
where track.genreid IN 
(
SELECT genreid FROM track
GROUP BY track.genreid 
ORDER BY COUNT(genreid) DESC
limit 10)
order by track.genreid;
--Q7
select billingcountry, AVG(Total)
from Invoice
group by billingcountry;
--Q8
select total ,strftime('%m',Invoicedate) As month, strftime('%Y',invoicedate) As year
from invoice 
where year = "2010"
group by month
order by total desc
--Q9
select trackid, count(trackid)
from invoiceline
group by trackid;
--Q10
Select invoiceline.invoicelineid, invoiceline.invoiceid, invoice.invoiceid, 
invoiceline.quantity, invoice.BillingCountry, AVG(invoiceline.quantity) , strftime('%Y',invoicedate) As year
From Invoice
Join Invoiceline On invoice.invoiceid = Invoiceline.invoiceid
Where year = "2011"
Group by invoice.BillingCountry;
--Q11
Select Quantity , mediatype, strftime('%Y',date) As year , mediatypeID, count(mediatypeID)
From mydata
join mediatype ON mydata.mediatype = mediatype.name
Where year = "2010" 
GROUP BY mediatypeID
ORDER BY count(mediatypeID) desc
limit 1;
--Q12
select artist, count( distinct genre), genre
from mydata
join genre on mydata.genre = genre.name
group by artist
order by count( distinct genre) desc;
--Q13
select genre, sum(quantity), salesperson
from mydata
group by salesperson, genre
order by sum(quantity) desc
limit 3;
