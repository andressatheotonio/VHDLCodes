entity mux is
port(a,b,c: in bit;
		s: out bit);
end mux;

architecture comportamental of mux is 
begin

s <= a when c = '0' else b;
end comportamental;
