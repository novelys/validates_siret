require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'


desc 'Default: run unit tests.'
task :default => :test

desc 'Test the validates_siret plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the validates_siret plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ValidatesSiret'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require "spec/rake/spectask"
  Spec::Rake::SpecTask.new
rescue LoadError
  desc "Run specs"
  task :spec do
    abort "RSpec is not available. Install it with: sudo gem install spec"
  end
end

desc "Analyze code coverage with specs"
begin
  require "rcov/rcovtask"
  Rcov::RcovTask.new("coverage") do |test|
    test.libs << "spec"
    test.test_files = FileList["spec/siret_spec.rb"]
    test.verbose = true
  end
rescue LoadError
  task :coverage do
    abort "RCov is not available. Install it with: sudo gem install rcov"
  end
end

PKG_FILES = FileList[
  '[a-zA-Z]*',
  'generators/**/*',
  'lib/**/*',
  'rails/**/*',
   'tasks/**/*',
  'test/**/*'
]

spec = Gem::Specification.new do |s|
    s.name = "validates_siret"
    s.version = "0.0.1"
    s.author = "Thierry Stiegler"
    s.email = "thierry.stiegler@gmail.com"
    s.homepage = "http://validates_example.example.com/"
    s.platform = Gem::Platform::RUBY
    s.summary = "Validate French SIRET numbers (enterprises identifier)"
    s.files = PKG_FILES.to_a
    s.require_path = "lib"
    s.has_rdoc = false
    s.extra_rdoc_files = ["README"]
end

desc 'Turn this plugin into a gem.'
Rake::GemPackageTask.new(spec) do |pkg|
    pkg.gem_spec = spec
end
