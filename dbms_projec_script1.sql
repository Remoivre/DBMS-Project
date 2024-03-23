USE DBMSproj;

-- Table: properties
CREATE TABLE properties (
    property_id INT AUTO_INCREMENT PRIMARY KEY,
    property_name VARCHAR(255),
    address VARCHAR(255),
    size INT,
    price DECIMAL(10, 2),
    status VARCHAR(255),
    description TEXT
);

-- Table: clients
CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(255),
    budget DECIMAL(10, 2),
    preferences TEXT
);

-- Table: agents
CREATE TABLE agents X (
    agent_id INT AUTO_INCREMENT PRIMARY KEY,
    agent_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    commission_rate DECIMAL(5, 2)
);

-- Table: transactions
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    client_id INT,
    agent_id INT,
    transaction_date DATE,
    transaction_type VARCHAR(255),
    transaction_amount DECIMAL(10, 2),
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

-- Table: listings
CREATE TABLE listings (
    listing_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    agent_id INT,
    listing_date DATE,
    listing_type VARCHAR(255),
    listing_status VARCHAR(255),
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

-- Table: contracts
CREATE TABLE contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT,
    agent_id INT,
    client_id INT,
    contract_date DATE,
    contract_type VARCHAR(50),
    contract_name VARCHAR(255),
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id),
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

-- Table: feedback
CREATE TABLE feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT,
    client_id INT,
    agent_id INT,
    feedback_date DATE,
    feedback_comment TEXT,
    rating INT,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

-- Table: payment
CREATE TABLE payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT,
    client_id INT,
    agent_id INT,
    payment_date DATE,
    payment_amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

-- Table: commission_payments
CREATE TABLE commission_payments (
    commission_payment_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT,
    agent_id INT,
    commission_amount DECIMAL(10, 2),
    payment_method VARCHAR(255),
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id),
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

-- Table: visits
CREATE TABLE Visits (
    visit_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    client_id INT,
    agent_id INT,
    visit_date DATE,
    visit_feedback TEXT,
    FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (agent_id) REFERENCES Agents(agent_id)
);

-- Inserting sample data into the Properties table
INSERT INTO properties (property_id, property_name, address, size, price, status, description) VALUES
(1,'Luxury Villa', '1st Main Road, Bangalore', 3000, 7500000, 'available', 'Spacious villa with garden and swimming pool'),
(2,'Modern Apartment', 'Park Street, Mumbai', 1500, 6000000, 'available', 'Luxurious apartment with city view'),
(3,'Cozy Flat', 'Green Avenue, Delhi', 1000, 3500000, 'sold', 'Well-furnished flat near metro station'),
(4,'Commercial Office Space', 'Business Hub, Chennai', 2000, 10000000, 'available', 'Prime location for commercial space'),
(5,'Vacant Land', 'Highway Road, Hyderabad', 5000, 20000000, 'available', 'Large plot suitable for development'),
(6,'Duplex House', 'Hillside Drive, Pune', 1800, 8000000, 'rented', 'Beautiful house with garden and mountain view'),
(7,'Studio Apartment', 'River Side, Kolkata', 600, 4000000, 'available', 'Compact apartment for singles or couples'),
(8,'Farmhouse Retreat', 'Country Road, Goa', 3500, 15000000, 'available', 'Serene farmhouse with lush greenery');

-- Inserting sample data into the Clients table
INSERT INTO clients  (client_id, client_name, email, phone, budget, preferences) VALUES
(1,'Amit Patel', 'amit@example.com', '+91 9876543210', 10000000, 'Looking for a villa in Bangalore'),
(2,'Priya Sharma', 'priya@example.com', '+91 9876543211', 6000000, 'Interested in luxury apartments in Mumbai'),
(3,'Rajesh Singh', 'rajesh@example.com', '+91 9876543212', 8000000, 'Searching for a flat in Delhi'),
(4,'Neha Gupta', 'neha@example.com', '+91 9876543213', 15000000, 'Interested in commercial properties for investment'),
(5,'Rakesh Kumar', 'rakesh@example.com', '+91 9876543214', 25000000, 'Looking for land for development'),
(6,'Anita Verma', 'anita@example.com', '+91 9876543215', 9000000, 'Looking for a house with garden in Pune'),
(7,'Sanjay Jain', 'sanjay@example.com', '+91 9876543216', 5000000, 'Interested in farmhouse properties in Goa'),
(8,'Pooja Desai', 'pooja@example.com', '+91 9876543217', 3000000, 'Searching for a studio apartment in Kolkata');

-- Inserting sample data into the Agents table
INSERT INTO Agents (agent_name, email, phone, commission_rate) VALUES
('Rahul Khanna', 'rahul@example.com', '+91 9876543201', 3.5),
('Neha Sharma', 'neha@example.com', '+91 9876543202', 4.0),
('Vikram Singh', 'vikram@example.com', '+91 9876543203', 3.8),
('Ananya Gupta', 'ananya@example.com', '+91 9876543204', 3.6),
('Rohit Verma', 'rohit@example.com', '+91 9876543205', 4.2),
('Sneha Patel', 'sneha@example.com', '+91 9876543206', 3.7),
('Manoj Kumar', 'manoj@example.com', '+91 9876543207', 4.1),
('Priya Jain', 'priya@example.com', '+91 9876543208', 3.9);

-- Inserting sample data into the Transactions table
INSERT INTO Transactions (transaction_id, property_id, client_id, agent_id, transaction_date, transaction_type, transaction_amount) VALUES
(1, 1, 1, 1, '2024-03-01', 'sale', 7000000),
(2, 2, 2, 2, '2024-03-02', 'sale', 5500000),
(3, 3, 3, 3, '2024-03-03', 'sale', 3200000),
(4, 4, 4, 4, '2024-03-04', 'rental', 30000),
(5, 5, 5, 5, '2024-03-05', 'sale', 18000000),
(6, 6, 6, 6, '2024-03-06', 'rental', 45000),
(7, 7 ,7, 7, '2024-03-07', 'sale', 4000000),
(8, 8, 8, 8, '2024-03-08', 'sale', 7000000);

-- Inserting sample data into the Listings table
INSERT INTO Listings (listing_id ,property_id, agent_id, listing_date, listing_type, listing_status) VALUES
(1, 1, 1, '2024-02-01', 'for sale', 'active'),
(2, 2, 2, '2024-02-02', 'for sale', 'active'),
(3, 3, 3, '2024-02-03', 'for sale', 'inactive'),
(4, 4, 4, '2024-02-04', 'for rent', 'active'),
(5, 5, 5, '2024-02-05', 'for sale', 'active'),
(6, 6, 6, '2024-02-06', 'for rent', 'active'),
(7, 7, 7, '2024-02-07', 'for sale', 'active'),
(8, 8, 8, '2024-02-08', 'for sale', 'active');

-- Inserting sample data into the Contracts table
INSERT INTO Contracts (contract_id, transaction_id, agent_id, client_id, contract_date, contract_type, contract_terms) VALUES
(1, 1, 1, 1, '2024-03-01', 'sale agreement', 'Payment in full within 30 days'),
(2, 2, 2, 2, '2024-03-02', 'sale agreement', 'Payment in installments over 6 months'),
(3, 3, 3, 3, '2024-03-03', 'sale agreement', 'Payment in full within 45 days'),
(4, 4, 4, 4, '2024-03-04', 'rental agreement', 'Monthly rent payment, 1-year lease'),
(5, 5, 5, 5, '2024-03-05', 'sale agreement', 'Immediate payment upon signing'),
(6, 6, 6, 6, '2024-03-06', 'rental agreement', 'Monthly rent payment, 6-month lease'),
(7, 7, 7, 7, '2024-03-07', 'sale agreement', 'Payment in installments over 12 months'),
(8, 8, 8, 8, '2024-03-08', 'sale agreement', 'Payment in full within 30 days');

-- Inserting sample data into the Visits table
INSERT INTO Visits (visit_id ,property_id, client_id, agent_id, visit_date, visit_feedback) VALUES
(1, 1, 1, 1, '2024-02-15', 'Liked the spacious rooms and garden area'),
(2, 2, 2, 2, '2024-02-16', 'Impressed by the modern amenities and location'),
(3, 3, 3, 3, '2024-02-17', 'Satisfied with the flat layout and nearby facilities'),
(4, 4, 4, 4, '2024-02-18', 'Interested in the office space layout and parking availability'),
(5, 5, 5, 5, '2024-02-19', 'Excited about the development potential of the land'),
(6, 6, 6, 6, '2024-02-20', 'Enthralled by the mountain view and spacious rooms'),
(7, 7, 7, 7, '2024-02-21', 'Impressed by the farmhouse amenities and tranquility'),
(8, 8, 8, 8, '2024-02-22', 'Satisfied with the studio apartment layout and affordability');

-- Inserting sample data into the Feedback table
INSERT INTO Feedback (feedback_id , transaction_id, client_id, agent_id, feedback_date, feedback_comments, rating) VALUES
(1, 1, 1, 1, '2024-03-02', 'Smooth transaction process, happy with the purchase', 5),
(2, 2, 2, 2, '2024-03-03', 'Good communication and support throughout the deal', 4),
(3, 3, 3, 3, '2024-03-04', 'Responsive agent, satisfied with the rental agreement', 4),
(4, 4, 4, 4, '2024-03-05', 'Professional handling of the sale, overall good experience', 5),
(5, 5, 5, 5, '2024-03-06', 'Efficient transaction, impressed with the negotiation skills', 5),
(6, 6, 6, 6, '2024-03-07', 'Agent was helpful and informative, satisfied with the purchase', 4),
(7, 7, 7, 7, '2024-03-08', 'Smooth transaction, happy with the farmhouse purchase', 5),
(8, 8, 8, 8, '2024-03-09', 'Agent provided good guidance, happy with the apartment', 4);

-- Inserting sample data into the Payments table
INSERT INTO payment  (payment_id, transaction_id, client_id, agent_id, payment_date, payment_amount, payment_method) VALUES
(1, 1, 1, 1, '2024-03-02', 7000000, 'Bank transfer'),
(2, 2, 2, 2, '2024-03-03', 5500000, 'Cheque'),
(3, 3, 3, 3, '2024-03-04', 3200000, 'Cash'),
(4, 4, 4, 4, '2024-03-05', 30000, 'Bank transfer'),
(5, 5, 5, 5, '2024-03-06', 18000000, 'Bank transfer'),
(6, 6, 6, 6, '2024-03-07', 45000, 'Cheque'),
(7, 7, 7, 7, '2024-03-08', 4000000, 'Bank transfer'),
(8, 8, 8, 8, '2024-03-09', 7000000, 'Cheque');

-- Inserting sample data into the CommissionPayments table
INSERT INTO commission_payments (commission_payment_id ,transaction_id, agent_id, commission_amount, payment_method) VALUES
(1, 1, 1, 245000, 'Bank transfer'),
(2, 2, 2, 220000, 'Bank transfer'),
(3, 3, 3, 115200, 'Cash'),
(4, 4, 4, 900, 'Bank transfer'),
(5, 5, 5, 720000, 'Bank transfer'),
(6, 6, 6, 18900, 'Cheque'),
(7, 7, 7, 160000, 'Bank transfer'),
(8, 8, 8, 245000, 'Cheque');