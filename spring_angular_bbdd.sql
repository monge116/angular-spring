create database angular_spring_bbd;

use angular_spring_bbdd;

CREATE TABLE Compras (
    purchase_id INT AUTO_INCREMENT,
    purchase_at VARCHAR(255) NOT NULL,
    amount INT NOT NULL,
    total_cost DOUBLE NOT NULL,
    comments TEXT,
    purchase_date DATE NOT NULL,
    PRIMARY KEY(purchase_id)
);
CREATE TABLE Productos (
    product_id INT AUTO_INCREMENT ,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    image VARCHAR(255),
    vinted_link VARCHAR(255),
    wallapop_link VARCHAR(255),
    store_by VARCHAR(255),
    single_cost DOUBLE NOT NULL,
    product_price DOUBLE NOT NULL,
    categoria VARCHAR(255),
    state ENUM('nuevo', 'usado', 'defectuoso'),
    PRIMARY KEY(product_id),
    purchase_id INT,
    FOREIGN KEY (purchase_id) REFERENCES Compras(purchase_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Pagos (
    pay_id INT AUTO_INCREMENT,
    account VARCHAR(255) NOT NULL,
    amount DOUBLE NOT NULL,
    state ENUM('pagada', 'no pagada') NOT NULL,
    additional_info TEXT,
    purchase_id INT,
    PRIMARY KEY(pay_id),
    FOREIGN KEY (purchase_id) REFERENCES Compras(purchase_id) ON DELETE SET NULL
);

-- Tabla Ventas
CREATE TABLE Ventas (
    sales_id INT AUTO_INCREMENT PRIMARY KEY,
    sales_date DATE NOT NULL,
    platform VARCHAR(255),
    final_price DOUBLE NOT NULL,
    benefit DOUBLE NOT NULL,
    sale_state VARCHAR(255),
    details TEXT,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES Productos(product_id) ON DELETE SET NULL
);


