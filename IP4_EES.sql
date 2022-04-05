use henry;

# 1 - Retrieve the first name and last name of each author in the author relation. Order does not matter.
select firstName, lastName
from author;

# 2 - Retrieve the title and book type in the book relation. Order does not matter.
select title, TYPE
from book;

# 3 - Retrieve the publisherCode in the book relation. List each publisherCode only once in the result. Order does not matter. 
select publisherCode
from book
group by publisherCode;

# 4 - Retrieve the title and price of each book in the book relation. Further add a calculated column named ‘discount’ that shows the price the book with 25% discount.
# Order does not matter. Show the first five rows of the result (LIMIT 5). 
select title, price, (.75*price) as discount
from book
limit 5;

# 5 - Retrieve the title and price for any book whose price is higher than $20.00 in the book relation. Show the full result.
select title, price
from book
where price>20;

# 6 - Retrieve the publisherName of all publishers that are in New York only in the publisher relation. Order does not matter.
select publisherName
from publisher
where city='New York';

# 7 - Retrieve the publisherName of all publishers that are not in New York in the publisher relation. 
# (use != for inequality). Order does not matter. Show the full result.
select publisherName
from publisher
where city!='New York';

# 8 - Retrieve the bookCode and onHand for each book for which a branch has between 2 and 4 copies in the inventory relation.
# Use the BETWEEN keyword in this query.  Order does not matter. Show the full result. 
select bookCode, onHand
from inventory
where onHand between 2 and 4;

# 9 - Retrieve a count of the number of books published by Penguin USA. Name the column ‘Penguin Books’.
# Order does not matter. Show your full result.
select count(book.title) as 'Penguin Books'
from book
where book.publisherCode = 'PE';

# 10 - Retrieve the number of books in the book relation whose prices is $20.00 or lower. Order does not matter.  Show your full result.
select count(book.title)
from book
where price<=20;

# 11 - Retrieve all of the columns from the book and publisher relations in one result.
# Use aliases in your query and use the simple JOIN syntax (WHERE clause). Order does not matter.
select *
from book
join publisher as pub
where book.publisherCode = pub.publisherCode;

# 12 - Rewrite the previous query using the ON keyword
select *
from book
join publisher as pub
on book.publisherCode = pub.publisherCode;

# 13 - Retrieve the title from the book relation and the city from the publisher relation using a JOIN query.
# Use aliases in your query. Order the result by title.
select title, city
from book
join publisher as pub
on book.publisherCode = pub.publisherCode
order by title;

# 14 - Retrieve the title from the book relation and branchNum and onHand from the inventory relation.
# Use aliases in your query.  Order the result by title.
select title, branchNum, onHand
from book
join inventory as inv
on inv.bookCode = book.bookCode
order by title;

# 15 - Retrieve the title from the book relation and compute the number of copies of the title that all branches have on hand.
# Name this computed column ‘Inventory’  Hint: You will need to join book and inventory and do an aggregate query.
# Use aliases in your query.  Order the result by the total number of copies of the book in descending order.
# Show the first two rows of your result.
select title, sum(onHand) as Inventory
from book as b
join inventory as i
where i.bookCode = b.bookCode
group by title
order by inventory desc
limit 2;

# 16 - Retrieve the first name and last name from the author relation and the title from the book relation for all paperback books in the book relation.
# Order the result by the author last name and title.
select firstName, lastName, title
from book
join wrote
on book.bookCode = wrote.bookCode
join author
on author.authorNum = wrote.authorNum
where paperback = 'Y'
order by lastName, title;