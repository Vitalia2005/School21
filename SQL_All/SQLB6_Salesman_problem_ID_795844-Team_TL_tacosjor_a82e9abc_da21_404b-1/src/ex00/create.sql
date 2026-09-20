CREATE TABLE nodes (
    point1 VARCHAR(10),
    point2 VARCHAR(10),
    cost INT
);

INSERT INTO nodes (point1, point2, cost) VALUES
('a', 'b', 10), ('b', 'a', 10),
('a', 'c', 15), ('c', 'a', 15),
('a', 'd', 20), ('d', 'a', 20),
('b', 'd', 25), ('d', 'b', 25),
('b', 'c', 35), ('c', 'b', 35),
('c', 'd', 30), ('d', 'c', 30);