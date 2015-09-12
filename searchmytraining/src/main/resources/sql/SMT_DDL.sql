CREATE TABLE users
(
   user_id       NUMERIC NOT NULL,
   username      VARCHAR(100) NOT NULL,
   password      VARCHAR(100) NOT NULL,
   enabled       TINYINT NOT NULL DEFAULT 1,
   created_on    TIMESTAMP,
   created_by    VARCHAR(100),
   Modified_on   TIMESTAMP,
   Modified_by   VARCHAR(100),
   PRIMARY KEY(user_id)
);

CREATE TABLE user_roles (
  user_role_id INT(11) NOT NULL AUTO_INCREMENT,
  user_id NUMERIC NOT NULL,
  role VARCHAR(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_ur_user_id_role (role,user_id),
  CONSTRAINT fk_ur_user_id FOREIGN KEY (user_id) REFERENCES users (user_id)
  );