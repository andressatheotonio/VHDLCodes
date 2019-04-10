entity mux is
port(a,b,c: in bit;
		s: out bit);
end mux;

architecture comportamental of mux is 
begin

s <= ((not c) and a) or (c and b);
end comportamental;
