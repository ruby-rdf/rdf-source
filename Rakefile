
require("rubygems")
require("rspec")
require("rspec/core/rake_task")

desc 'Run specs'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = FileList["spec/*.spec","spec/*.rb"]
  t.rcov = false
  t.rspec_opts = ["-cfn"]
end

RSpec::Core::RakeTask.new(:rcov) do |t|
  t.pattern = FileList["spec/*.spec","spec/*.rb"]
  t.rcov = true
  t.rspec_opts = ["-cfn"]
end

desc 'Run specs with backtrace'
RSpec::Core::RakeTask.new(:tracespec) do |t|
  t.pattern = FileList["spec/*.spec"]
  t.rcov = false
  t.rspec_opts = ["-bcfn"]
end
