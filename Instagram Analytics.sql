/*Q.1 Find the 5 Oldest Users on Instagram*/
select * from users;
select username,created_at from users order by created_at limit 5;

/*Q.2  Find the users who have not posted a single photo on Instagram*/
select * from photos,users;
select * from users u left join photos P on p.user_id = u.id where p.image_url is null order by u.username;

/*Q.3 Find the Winner od the contest and provide theri details of team (on basis of likes)*/
select * from users,likes,photos;
select likes.photo_id,users.username, count(likes.user_id) as nooflikes
from likes inner join photos on likes.photo_id = photos.id
 Inner join users on photos.user_id = users.id group by
likes.photo_id,users.username order by nooflikes desc;

/*Q.4 Identify the Top 5 common Hastags on Instagram */

select * from tags,photo_tags;
select t.tag_name,count(p.photo_id) as ht from photo_tags p inner join tags t on t.id = p.tag_id group by t.tag_name order by ht desc limit 5;

/*Q.5 On which day the users registerd on instagram the most (Insights)*/

select DATE_FORMAT((created_at), '%W') as daay,count(username) from users group by 1 order by 2 desc;




