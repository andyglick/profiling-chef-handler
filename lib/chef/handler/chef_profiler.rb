# Chef (simple) Profiler for reporting cookbook execution times
#
# Author:: Joe Miller <https://github.com/joemiller>
# Copyright:: Copyright 2012 Joe Miller
# License:: MIT License
#


class Chef
  class Handler
    class Profiler < Chef::Handler
      VERSION = '0.0.2'

      def report
        cookbooks = Hash.new(0)
        recipes = Hash.new(0)
        resources = Hash.new(0)

        # collect all profiled timings and group by type
        all_resources.each do |r|
          cookbooks[r.cookbook_name] += r.elapsed_time
          recipes["#{r.cookbook_name}::#{r.recipe_name}"] += r.elapsed_time
          resources["#{r.resource_name}[#{r.name}]"] = r.elapsed_time
        end

        # print each timing by group, sorting with highest elapsed time first
        Chef::Log.info "Elapsed_time  Cookbook"
        Chef::Log.info "------------  -------------"
        cookbooks.sort_by{ |k,v| -v }.each do |cookbook, run_time|
          Chef::Log.info "%12f  %s" % [run_time, cookbook]
        end
        Chef::Log.info ""

        Chef::Log.info "Elapsed_time  Recipe"
        Chef::Log.info "------------  -------------"
        recipes.sort_by{ |k,v| -v }.each do |recipe, run_time|
          Chef::Log.info "%12f  %s" % [run_time, recipe]
        end
        Chef::Log.info ""

        Chef::Log.info "Elapsed_time  Resource"
        Chef::Log.info "------------  -------------"
        resources.sort_by{ |k,v| -v }.each do |resource, run_time|
          Chef::Log.info "%12f  %s" % [run_time, resource]
        end
        Chef::Log.info ""
      end

    end
  end
end
