use cake_app_db;

CREATE TABLE usres (
  id INT AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  created DATETIME,
  modified DATETIME,
  PRIMARY KEY(`id`),
  UNIQUE(email)
);

CREATE TABLE articles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(191) NOT NULL,
  body TEXT,
  published BOOLEAN DEFAULT FALSE,
  created DATETIME,
  modified DATETIME,
  UNIQUE KEY (slug),
  FOREIGN KEY user_key(user_id) REFERENCES users(id)
)CHARSET=utf8mb4;

CREATE TABLE tags (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  created DATETIME,
  modified DATETIME,
  UNIQUE(title)
)CHARSET=utf8mb4;

CREATE TABLE articles_tags (
  articles_id INT NOT NULL,
  tag_id INT NOT NULL,
  PRIMARY KEY (articles_id, tag_id),
  FOREIGN KEY tag_key(tag_id) REFERENCES tags(id),
  FOREIGN KEY article_key(article_id) REFERENCES articles(id)
);

INSERT INTO users (`email`, `password`, `created`, `modified`) 
VALUES (
  'cakephp@example.com',
  'secret',
  NOW(),
  NOW()
);

INSERT INTO articles
( -- columns to insert data into
 `user_id`, `title`, `slug`, `body`, `published`, `created`, `modified`
)
VALUES
( -- first row: values for the columns in the list above
 1, 'First Post', 'first-post', 'This is the first post.', 1, now(), now()
)