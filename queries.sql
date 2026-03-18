
CREATE TABLE IF NOT EXISTS  users(
  user_id  SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  phone  TEXT NOT NULL,
  role  VARCHAR(20) NOT NULL CHECK(role IN('admin','customer'))
 
  );
CREATE TABLE IF NOT EXISTS  vehicles(
  vehicle_id  SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  type VARCHAR(20) NOT NULL CHECK (type IN ('car','bike','truck','van','SUV')),
  model VARCHAR(20) NOT NULL,
  registration_number VARCHAR(50) UNIQUE NOT NULL,
  rental_price NUMERIC CHECK (rental_price>0) NOT NULL,
  status VARCHAR(20) NOT NULL CHECK(status IN('available','rented','maintenance')) DEFAULT 'available'

  );

CREATE TABLE IF NOT EXISTS bookings (
 booking_id  SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(user_id) ON DELETE CASCADE,
      vehicle_id INTEGER REFERENCES vehicles(vehicle_id) ON DELETE CASCADE,
      start_date DATE NOT NULL,
      end_date DATE NOT NULL CHECK (end_date > start_date),
  total_price NUMERIC NOT NULL CHECK (total_price > 0),
      status VARCHAR(20) NOT NULL CHECK (status IN ('pending','confirmed','completed','cancelled')) DEFAULT 'pending'
    
      
  );


INSERT INTO users (name, email, phone, role) VALUES
('Alice', 'alice@example.com', '1234567890', 'customer'),
('Bob', 'bob@example.com', '0987654321', 'admin'),
('Charlie', 'charlie@example.com', '1122334455', 'customer');


INSERT INTO vehicles (name, type, model, registration_number, rental_price, status) VALUES
('Toyota Corolla', 'car', '2022', 'ABC-123', 50, 'available'),
('Honda Civic', 'car', '2021', 'DEF-456', 60, 'rented'),
('Yamaha R15', 'bike', '2023', 'GHI-789', 30, 'available'),
('Ford F-150', 'truck', '2020', 'JKL-012', 100, 'maintenance');


INSERT INTO bookings (user_id, vehicle_id, start_date, end_date, total_price, status) VALUES
(1, 2, '2023-10-01', '2023-10-05', 240, 'completed'),
(1, 2, '2023-11-01', '2023-11-03', 120, 'completed'),
(3, 2, '2023-12-01', '2023-12-02', 60, 'confirmed'),
(1, 1, '2023-12-10', '2023-12-12', 100, 'pending');


select 
    b.booking_id,
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.status
from bookings b 
join users u
    on b.user_id = u.user_id
join vehicles v
    on b.vehicle_id = v.vehicle_id;


select *
from vehicles as v
where not exists(
     select *
     from bookings as b
     where b.vehicle_id = v.vehicle_id
)

select * from vehicles
where vehicles.status = 'available' and vehicles.type = 'car'

select v.name AS vehicle_name, COUNT(b.booking_id) AS total_bookings
from bookings b
join vehicles v
ON b.vehicle_id = v.vehicle_id
GROUP BY v.name
having COUNT(b.booking_id) >2;
