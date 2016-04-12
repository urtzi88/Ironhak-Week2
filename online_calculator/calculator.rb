require 'sinatra'
require 'haml'
require 'sinatra/reloader' if development?
require 'pry'

get '/' do
  haml(:start)
end

post '/operation' do
  @@name = params.keys[0]
  @@operation = params[@@name]
  haml(:add)
end

post "/operation_result" do
  @num1 = params[:num1].to_i
  @num2 = params[:num2].to_i
  case @@operation
  when "addition"
    @symbol = "+"
    @result = @num1 + @num2
  when "subtract"
    @symbol = "-"
    @result = @num1 - @num2
  when "multiply"
    @symbol = "*"
    @result = @num1 * @num2
  when "divide"
    @symbol = "/"
    @result = @num1.to_f / @num2
    if @result % 1 == 0
      @result = @result.to_i
    end
  end
  haml(:add_result)
end
