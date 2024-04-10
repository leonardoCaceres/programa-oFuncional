alias Decimal, as: D

defmodule Math do
	def module(x, y) do
		if D.gt?(x, y) do
			D.sub(x, y)
		else
			D.sub(y, x)
		end
	end
	def sin(x, error) do
		x2 = D.mult(x, x)
		sinNeg(x, error, 3, x, x, x2)
	end
	def sinPos(x, error, i, last, value, x2) do
		i2_i = D.new(((i*i)-i))
		last_x_x2 = D.mult(x2, last)
		step = D.div(last_x_x2, i2_i)
		if D.gt?(module(last, step), error) do
			sinNeg(x, error, i+2, step, D.add(value, step), x2)
		else
			value
		end
	end
	def sinNeg(x, error, i, last, value, x2) do
		IO.puts(inspect(value))
		i2_i = D.new(((i*i)-i))
		last_x_x2 = D.mult(x2, last)
		step = D.div(last_x_x2, i2_i)
		if D.gt?(module(last, step), error) do
			sinPos(x, error, i+2, step, D.sub(value, step), x2)
		else
			value
		end
	end	
end

#IO.puts("Digite o valor de x:")
#input_x = IO.gets("") |> String.trim()
#x = D.new(input_x)

#IO.puts("Digite o valor de e:")
#input_e = IO.gets("") |> String.trim()
#e = D.new(input_e)

x = D.new("0.52359877559")
#x = D.new("0")
e = D.new("0.00000001")

result = Math.sin(x, e)
IO.puts(inspect("valor de seno(#{x}) é #{result}"))

System.halt(0)
