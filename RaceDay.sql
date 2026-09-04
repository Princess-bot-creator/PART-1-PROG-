-- RaceDay Database - Soweto Marathon
CREATE TABLE Users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(100) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  full_name VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Roles (
  role_id INT AUTO_INCREMENT PRIMARY KEY,
  role_name VARCHAR(50) UNIQUE NOT NULL
);

-- Solves Many-to-Many: Users can have many Roles
CREATE TABLE UserRoles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
  FOREIGN KEY (role_id) REFERENCES Roles(role_id) ON DELETE CASCADE
);

CREATE TABLE Events (
  event_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  event_date DATE NOT NULL,
  location VARCHAR(150) NOT NULL,
  organizer_id INT NOT NULL,
  FOREIGN KEY (organizer_id) REFERENCES Users(user_id)
);

CREATE TABLE Categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  event_id INT NOT NULL,
  category_name VARCHAR(100) NOT NULL,
  distance_km DECIMAL(5,2) NOT NULL,
  entry_fee DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (event_id) REFERENCES Events(event_id) ON DELETE CASCADE
);

CREATE TABLE Enrolments (
  enrolment_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  category_id INT NOT NULL,
  enrol_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (user_id, category_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE CASCADE
);

-- One-to-One with Enrolments
CREATE TABLE Results (
  result_id INT AUTO_INCREMENT PRIMARY KEY,
  enrolment_id INT UNIQUE NOT NULL,
  finish_time TIME NOT NULL,
  position INT,
  FOREIGN KEY (enrolment_id) REFERENCES Enrolments(enrolment_id) ON DELETE CASCADE
);
















