-- Conectar a la DB sales_db y ejecutar:
CREATE SCHEMA IF NOT EXISTS ventas;

-- Tabla CLIENTE
CREATE TABLE IF NOT EXISTS ventas.cliente (
  cliente_id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE,
  telefono VARCHAR(30)
);

-- Tabla SUCURSAL
CREATE TABLE IF NOT EXISTS ventas.sucursal (
  sucursal_id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  direccion TEXT
);

-- Tabla PRODUCTO
CREATE TABLE IF NOT EXISTS ventas.producto (
  producto_id SERIAL PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  precio NUMERIC(10,2) NOT NULL CHECK (precio >= 0),
  stock INT NOT NULL DEFAULT 0
);

-- Tabla VENTA
CREATE TABLE IF NOT EXISTS ventas.venta (
  venta_id SERIAL PRIMARY KEY,
  fecha TIMESTAMP NOT NULL DEFAULT now(),
  cliente_id INT NOT NULL,
  sucursal_id INT NOT NULL,
  total NUMERIC(12,2) NOT NULL DEFAULT 0,
  CONSTRAINT fk_venta_cliente FOREIGN KEY (cliente_id) REFERENCES ventas.cliente(cliente_id) ON DELETE RESTRICT,
  CONSTRAINT fk_venta_sucursal FOREIGN KEY (sucursal_id) REFERENCES ventas.sucursal(sucursal_id) ON DELETE RESTRICT
);

-- Tabla DETALLE_VENTA
CREATE TABLE IF NOT EXISTS ventas.detalle_venta (
  detalle_id SERIAL PRIMARY KEY,
  venta_id INT NOT NULL,
  producto_id INT NOT NULL,
  cantidad INT NOT NULL CHECK (cantidad > 0),
  precio_unitario NUMERIC(10,2) NOT NULL CHECK (precio_unitario >= 0),
  CONSTRAINT fk_detalle_venta_venta FOREIGN KEY (venta_id) REFERENCES ventas.venta(venta_id) ON DELETE CASCADE,
  CONSTRAINT fk_detalle_venta_producto FOREIGN KEY (producto_id) REFERENCES ventas.producto(producto_id) ON DELETE RESTRICT
);

-- Índices
CREATE INDEX IF NOT EXISTS idx_venta_cliente ON ventas.venta(cliente_id);
CREATE INDEX IF NOT EXISTS idx_detalle_producto ON ventas.detalle_venta(producto_id);


