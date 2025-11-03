
//scripts de ejemplo para la creación de tablas, claves primarias y foráneas, restricciones, índices y vistas

-- Conectar a sales_db y schema ventas
INSERT INTO ventas.cliente (nombre, email, telefono) VALUES
('Ana Perez','ana.perez@example.com','+57-3001112222'),
('Carlos Gomez','carlos.g@example.com','+57-3003334444');

INSERT INTO ventas.sucursal (nombre, direccion) VALUES
('Sucursal Centro','Calle 1 # 2-3'),
('Sucursal Norte','Av 45 # 10-20');

INSERT INTO ventas.producto (nombre, precio, stock) VALUES
('Camiseta', 29.90, 100),
('Pantalon', 79.90, 50),
('Gorra', 19.50, 200);

-- Crear una venta
INSERT INTO ventas.venta (fecha, cliente_id, sucursal_id, total) VALUES
(now(), 1, 1, 149.70);

INSERT INTO ventas.detalle_venta (venta_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 2, 29.90),
(1, 3, 1, 19.50); 

UPDATE ventas.producto SET stock = stock - 2 WHERE producto_id = 1;
UPDATE ventas.producto SET stock = stock - 1 WHERE producto_id = 3;
