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
select sum(total) ,strftime('%m',Invoicedate) As month, strftime('%Y',invoicedate) As year
from invoice 
where year = "2010"
group by month
order by total desc
--Q9
select InvoiceLine.trackid, track.Name , sum(quantity)
from invoiceline join track on InvoiceLine.trackid = track.trackid
group by InvoiceLinetrackid
order by sum(quantity) desc
--Q10
Select invoiceline.invoicelineid, invoiceline.invoiceid,  
invoiceline.quantity, invoice.BillingCountry, AVG(invoiceline.quantity) , strftime('%Y',invoicedate) As year
From Invoice
Join Invoiceline On invoice.invoiceid = Invoiceline.invoiceid
Where year = "2011"
Group by invoice.BillingCountry;
--Q11 
Select track.mediatypeID, MediaType.name, strftime('%Y',invoicedate) As year, sum(Quantity)
From Invoice 
join InvoiceLine ON InvoiceLine.invoiceid = Invoice.invoiceid
join track ON InvoiceLine.trackid = track.trackid 
join MediaType On MediaType.MediaTypeId = track.MediaTypeId
Where year = "2010" 
GROUP BY track.mediatypeID
ORDER BY sum(Quantity) desc
limit 1;
--Q12
select artist, count(*)
from(select album.artistid, artist.name as artist, count(distinct album.artistid) as num
from Track 
join album On track.albumid = album.albumid
join artist On album.ArtistId = artist.ArtistId
group by album.artistid, genreid)
group by artist
order by count(*) asc