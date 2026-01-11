
SELECT 
    user_id,
    COUNT(post_id) AS total_user_post
FROM posts
GROUP BY user_id;

SELECT * FROM view_user_post;

SELECT 
    u.full_name,
    v.total_user_post
FROM users u
JOIN view_user_post v
    ON u.user_id = v.user_id;
