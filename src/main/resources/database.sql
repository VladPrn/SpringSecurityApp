-- Table: users
CREATE TABLE users (
  id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  picture VARCHAR(100)
)
  ENGINE = InnoDB;

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

-- Insert data

INSERT INTO users VALUES (1, 'proselyte', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'href');

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);

INSERT INTO books VALUES (1, 'Big book', 'About Spring', 'href', '2012-12-12');
INSERT INTO books VALUES (2, 'Small book', 'About JQuery', 'href', '2015-12-12');
INSERT INTO books VALUES (3, 'Русская книга', 'Русская книга с кирилицей', 'href', '2017-12-12');

INSERT INTO history VALUES (1, 1, 1, -1, '2017-06-01');
INSERT INTO history VALUES (2, 1, 2, -1, '2017-06-01');
INSERT INTO history VALUES (3, 1, 1, 1, '2017-06-07');
INSERT INTO history VALUES (4, 1, 2, 1, '2017-06-07');

INSERT INTO comments VALUES (1, 1, 1, 'Nice!', '2017-06-01 15:15');
INSERT INTO comments VALUES (2, 1, 1, 'Very nice!', '2017-06-01 15:15');
INSERT INTO comments VALUES (3, 1, 1, 'Неплохая книга', '2017-06-01 15:15');