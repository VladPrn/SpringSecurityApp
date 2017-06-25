DROP VIEW IF EXISTS users_books_balance;
DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS history;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS users;
DROP TABLE  IF EXISTS books;

-- Table: users
CREATE TABLE users (
  id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  picture VARCHAR(100),
  description VARCHAR(255)
)
  ENGINE = InnoDB;

CREATE INDEX index_users_name ON users(username);

-- Table: roles
CREATE TABLE roles (
  id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
)
  ENGINE = InnoDB;

-- Table: books
CREATE TABLE books (
  id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description VARCHAR(1000) NOT NULL,
  picture VARCHAR(100),
  date DATE NOT NULL
)
  ENGINE = InnoDB;

CREATE INDEX index_books_name ON books(name);

-- Table for mapping user and roles: user_roles
CREATE TABLE user_roles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (role_id) REFERENCES roles (id),

  UNIQUE (user_id, role_id)
)
  ENGINE = InnoDB;

-- Table: history
CREATE TABLE history (
  id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  book_id INT NOT NULL,
  action_type INT NOT NULL,
  date DATE NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (book_id) REFERENCES books (id)
)
  ENGINE = InnoDB;

CREATE INDEX index_history_user_id ON history(user_id);

-- Table: comments
CREATE TABLE comments (
  id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  book_id INT NOT NULL,
  user_id INT NOT NULL,
  text VARCHAR(1000) NOT NULL,
  time DATETIME NOT NULL,

  FOREIGN KEY (book_id) REFERENCES books (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
)
  ENGINE = InnoDB;

CREATE VIEW users_books_balance AS
  SELECT ubb1.* FROM history ubb1
    JOIN (SELECT user_id, MAX(id) id FROM history GROUP BY user_id, book_id) ubb2
      ON ubb1.user_id = ubb2.user_id AND ubb1.id = ubb2.id;

-- Insert data

INSERT INTO users VALUES (1, 'proselyte', 'my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (2, 'username1', '1my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (3, 'username2', '2my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (4, 'username3', '3my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (5, 'username4', '4my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (6, 'username5', '5my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (7, 'username6', '6my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (8, 'username7', '7my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (9, 'username8', '8my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (10, 'username9', '9my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (11, 'username10', '10my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (12, 'username11', '11my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (13, 'username12', '12my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (14, 'username13', '13my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (15, 'username14', '14my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (16, 'username15', '15my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (17, 'username16', '16my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (18, 'username17', '17my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (19, 'username18', '18my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (20, 'username19', '19my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (21, 'username20', '20my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (22, 'username21', '21my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (23, 'username22', '22my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (24, 'username23', '23my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (25, 'username24', '24my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (26, 'username25', '25my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (27, 'username26', '26my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (28, 'username27', '27my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (29, 'username28', '28my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (30, 'username29', '29my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (31, 'username30', '30my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (32, 'username31', '31my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (33, 'username32', '32my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (34, 'username33', '33my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (35, 'username34', '34my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (36, 'username35', '35my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (37, 'username36', '36my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (38, 'username37', '37my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (39, 'username38', '38my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (40, 'username39', '39my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');
INSERT INTO users VALUES (41, 'username40', '40my.world@mail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href', 'Я люблю кушать пельмешки');

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);
INSERT INTO user_roles VALUES (2, 1);
INSERT INTO user_roles VALUES (3, 1);
INSERT INTO user_roles VALUES (4, 1);
INSERT INTO user_roles VALUES (5, 1);
INSERT INTO user_roles VALUES (6, 1);
INSERT INTO user_roles VALUES (7, 1);
INSERT INTO user_roles VALUES (8, 1);
INSERT INTO user_roles VALUES (9, 1);
INSERT INTO user_roles VALUES (10, 1);
INSERT INTO user_roles VALUES (11, 1);
INSERT INTO user_roles VALUES (12, 1);
INSERT INTO user_roles VALUES (13, 1);
INSERT INTO user_roles VALUES (14, 1);
INSERT INTO user_roles VALUES (15, 1);
INSERT INTO user_roles VALUES (16, 1);
INSERT INTO user_roles VALUES (17, 1);
INSERT INTO user_roles VALUES (18, 1);
INSERT INTO user_roles VALUES (19, 1);
INSERT INTO user_roles VALUES (20, 1);
INSERT INTO user_roles VALUES (21, 1);
INSERT INTO user_roles VALUES (22, 1);
INSERT INTO user_roles VALUES (23, 1);
INSERT INTO user_roles VALUES (24, 1);
INSERT INTO user_roles VALUES (25, 1);
INSERT INTO user_roles VALUES (26, 1);
INSERT INTO user_roles VALUES (27, 1);
INSERT INTO user_roles VALUES (28, 1);
INSERT INTO user_roles VALUES (29, 1);
INSERT INTO user_roles VALUES (30, 1);
INSERT INTO user_roles VALUES (31, 1);
INSERT INTO user_roles VALUES (32, 1);
INSERT INTO user_roles VALUES (33, 1);
INSERT INTO user_roles VALUES (34, 1);
INSERT INTO user_roles VALUES (35, 1);
INSERT INTO user_roles VALUES (36, 1);
INSERT INTO user_roles VALUES (37, 1);
INSERT INTO user_roles VALUES (38, 1);
INSERT INTO user_roles VALUES (39, 1);
INSERT INTO user_roles VALUES (40, 1);
INSERT INTO user_roles VALUES (41, 1);

INSERT INTO books VALUES (1, 'Код.Тайный язык информатики', 'Эта книга — азбука компьютерных технологий. Шаг за шагом автор знакомит читателя с сущностью кодирования информации, рассказывает об истории возникновения компьютеров, на практических примерах помогает освоить основные концепции информационных технологий, подробно излагает принципы работы процессора и других устройств компьютера. Написанная живо, доступно, иногда иронично, книга богато иллюстрирована, состоит из 25 глав и предметного указателя. Издание адресовано в первую очередь студентам вузов (как гуманитарных, так и технических), а также всем, кто интересуется принципами создания и работы компьютеров.', 'href', '2012-12-12');
INSERT INTO books VALUES (2, 'Small book', 'About JQuery', 'href', '2015-12-12');
INSERT INTO books VALUES (3, 'Русская книга', 'Русская книга с кирилицей', 'href', '2017-12-12');
INSERT INTO books VALUES (4, 'Middle book2', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (5, 'Big book3', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (6, 'Small book4', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (7, 'Simple book5', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (8, 'Small book6', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (9, 'Middle book7', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (10, 'Big book8', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (11, 'Русская книга9', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (12, 'Middle book10', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (13, 'Big book11', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (14, 'Big book12', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (15, 'Small book13', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (16, 'Русская книга14', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (17, 'Simple book15', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (18, 'Middle book16', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (19, 'Small book17', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (20, 'Middle book18', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (21, 'Big book19', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (22, 'Middle book20', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (23, 'Middle book21', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (24, 'Simple book22', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (25, 'Big book23', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (26, 'Русская книга24', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (27, 'Big book25', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (28, 'Small book26', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (29, 'Big book27', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (30, 'Simple book28', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (31, 'Big book29', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (32, 'Small book30', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (33, 'Русская книга31', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (34, 'Big book32', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (35, 'Big book33', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (36, 'Simple book34', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (37, 'Русская книга35', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (38, 'Big book36', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (39, 'Simple book37', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (40, 'Middle book38', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (41, 'Middle book39', 'About book', 'href', '2017-12-12');
INSERT INTO books VALUES (42, 'Big book40', 'About book', 'href', '2017-12-12');

INSERT INTO history (user_id, book_id, action_type, date) VALUES (1, 1, -1, '2017-06-01');
INSERT INTO history (user_id, book_id, action_type, date) VALUES (1, 2, -1, '2017-06-01');
INSERT INTO history (user_id, book_id, action_type, date) VALUES (1, 1, 1, '2017-06-07');
INSERT INTO history (user_id, book_id, action_type, date) VALUES (1, 3, -1, '2017-06-07');
INSERT INTO history (user_id, book_id, action_type, date) VALUES (1, 2, 1, '2017-06-07');
INSERT INTO history (user_id, book_id, action_type, date) VALUES (1, 2, -1, '2017-06-07');
INSERT INTO history (user_id, book_id, action_type, date) VALUES (2, 1, -1, '2017-06-07');
INSERT INTO history (user_id, book_id, action_type, date) VALUES (2, 2, -1, '2017-06-07');
INSERT INTO history (user_id, book_id, action_type, date) VALUES (2, 6, -1, '2017-06-07');
INSERT INTO history (user_id, book_id, action_type, date) VALUES (1, 4, -1, '2017-06-07');
INSERT INTO history (user_id, book_id, action_type, date) VALUES (1, 5, -1, '2017-06-07');

INSERT INTO comments  VALUES (1, 1, 1, 'Nice!', '2017-06-01 15:15');
INSERT INTO comments VALUES (2, 1, 1, 'Very nice!', '2017-06-01 15:15');
INSERT INTO comments VALUES (3, 1, 1, 'Неплохая книга', '2017-06-01 15:15');