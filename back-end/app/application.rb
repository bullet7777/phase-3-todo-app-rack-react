require 'pry'
require 'json'


class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    if req.path.match(/tasks/)

      if req.post?
        input = JSON.parse(req.body.read)
        category = Category.find_by(name:input["category"])
        task = Task.create(text:input["text"],category_id:category.id)
        return [200, { 'Content-Type' => 'application/json' }, [ task.to_json ]]
      end

       if req.delete?
      task_id = req.path.split("/tasks/").last
      task = Task.find_by(id:task_id.to_i)
      task.destroy
      return [200, { 'Content-Type' => 'application/json' }, [ {message:"Delete Successful"}.to_json ]]
       end



      tasks=Task.all
      return [200, { 'Content-Type' => 'application/json' }, [ tasks.to_json ]]
    
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
