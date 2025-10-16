require 'pathname'
require 'json'
require 'excon'

DEFAULT_PROCESSES = 8
PROJECT_NAME = 'testes-api'.freeze


desc 'RUN API TESTS'
task :run_api_tests, %i[env type api_tag enviroment_tags scenarios_paths optional_param processes] do |task, args|
  args.with_defaults(processes: DEFAULT_PROCESSES)
  run_commands(task, args)
end

desc 'Detele old json, html and log files from reports folder'
task :clean_reports_folders do
  files = Dir.glob('reports/**/*.{json,html,retry,log}')
  files.each { |file| File.delete(file) }
  puts "#{files.size} files deleted"
  puts 'Cleanup finished!'
end

desc 'RUN TESTS (Utilizado pelo executor dinâmico)'
task :run_tests, %i[env type tags profiles] do |task, args| # type = 'api', 'flaky', 'failed'
  args.with_defaults(processes: DEFAULT_PROCESSES) 
  run_tests(task, args)
end

desc 'Gerador automático dos cenários'
task :automation_generator, %i[api_name endpoint url] do |_task, args|
  require_relative 'automation_generator/automation_generator'
  AutomationGenerator.run_automation_generator(args[:url], args[:api_name], args[:endpoint])
end

def run_commands(task, args = nil)
  ENV['JOB'] = task.to_s
  ENV['EXEC_TYPE'] = type = args[:type]
  infos = split_infos(task)
  env = args[:env] || infos[:env]
  profiles = "#{args[:optional_param]} #{args[:default_param]} -p #{env} #{type_profiles(type)}"
  api_tag = args[:api_tag]
  enviroment_tags = args[:enviroment_tags]
  sut_tag = "and #{sut_tag(args[:sut])}" if args[:sut]
  tags = "#{enviroment_tags(env)} #{sut_tag} #{type_tags(type, api_tag: api_tag, enviroment_tags: enviroment_tags)}"

  get_regression_scenarios(tags, profiles) if type.eql?('api')
  save_file_dry_run(run_cucumber(args, tags, "#{profiles} -p parallel"))
  rerun(profiles, args)
  generate_api_performance_report
end

def get_regression_scenarios(tags, profiles)
  save_file_dry_run(compare_scenarios(execute_dry_run("\"#{tags} and not @bvt\" #{profiles}")).size, regression: true)
end

def type_profiles(type)
  case type
  when 'api', 'flaky', 'failed'
    '-p excon_log'
  end
end

def split_infos(task)
  infos = task.to_s.split '_'
  index = task.to_s.include?('clm') ? 1 : 0
  { env: infos[index][0..2] }
end

def run_cucumber(args, tags, profiles)
  tags = tags.strip.gsub('-t ', '-t \'').gsub(' -t', '\' -t').gsub('$', '\$').concat('\'')
  options = "-o \"#{tags} #{profiles}\""
  features_path_merged = features_path(**args, tags: tags)
  command = "bundle exec parallel_cucumber #{features_path_merged} -n #{args[:processes]} --group-by scenarios --first-is-1 #{options}"
  puts 'Obtendo total de scenarios do dry_run'
  dry_run_report = execute_dry_run("#{features_path_merged} #{tags}")
  total_scenarios_dry_run = compare_scenarios(dry_run_report)
  puts 'Executando automação de teste'
  execute_command command
  total_scenarios_dry_run.size
end

def rerun(profiles, args)
  puts "\nRerun..."
  max_rerun = args[:max_rerun] || 10
  processes = args[:processes] || 2
  filename = 'reports/features_report.retry'

  if Pathname.new(filename).file?
    file = File.read(filename, encoding: 'utf-8')
    scenario_counter = file.scan(%r{features/gherkins/}).length
    puts "Found #{scenario_counter} scenarios to rerun"

    if scenario_counter <= max_rerun.to_i && scenario_counter.positive?
      command = "bundle exec parallel_cucumber #{file.tr("\n", ' ').strip} -n #{processes} --group-by scenarios --first-is-1 -o \"#{profiles} -p rerun\""
      execute_command command
    end
  end

  puts 'Rerun finished!'
end





def run_tests(task, args)
  
  ENV['JOB'] = task.to_s
  ENV['EXEC_TYPE'] = args[:type]

  profiles = "-p #{args[:env]} #{type_profiles(args[:type])} #{normalize_profiles(args[:profiles])}".strip.squeeze(' ')
  tags = "#{enviroment_tags(args[:env])} #{type_tags(args[:type])} #{normalize_tags(args[:tags])}".strip.squeeze(' ')

  save_file_dry_run(run_cucumber(args, tags, "#{profiles} -p parallel"))
  rerun(profiles, args)
  generate_api_performance_report
end

def normalize_tags(tags)
  "and #{tags}" if tags
end

def normalize_profiles(profiles)
  "-p #{profiles.gsub('-p', ' ').split.join(' -p ')}" if profiles
end

def load_purge_scenarios
  purge_scenarios = []
  Dir.glob('features/**/*.feature').each do |file_path|
    File.open(file_path, 'r') do |file|
      File.readlines(file).each do |line|
        next if (/(@%purge_).*/ =~ line).nil?

        purge_scenarios << line.gsub!(/((( {2}@\${1})([\w ]){1,}))|[^0-9A-Za-z\-@%_]/, '')
        break
      end
    end
  end
  purge_scenarios.join(' or ')
end




def enviroment_tags(env)
  options = "-t not @nao_aplicavel_#{env} and not @generates_cost and not @nao_aplicavel_pipeline"
  options += case env
             when 'prd' then ' -t @prd'
             else ''
             end
  options
end

def type_tags(type, api_tag: nil, enviroment_tags: nil)
  options = ''
  if type.eql?('api')
    options += " and #{api_tag}"
  else
    options += " and #{'not' unless type.eql?('bvt')} @bvt" if %w[bvt regression].include?(type)
    options += " and #{enviroment_tags} and not #{api_tag}" unless api_tag.nil?
  end
  options
end

def generate_api_performance_report
  puts "\nGenereting Api performance report..."
  report = json_merge(Dir['reports/performance/api_performance_*.json'].map { |file| JSON.parse File.read(file, encoding: 'utf-8') }.flatten)

  report.each_pair do |key, value|
    ordened = value.sort
    size = ordened.size
    average = (ordened.reduce(:+).to_f / size).round(2)
    faster = ordened.first
    slower = ordened.last

    report[key] = {
      times: ordened.sort,
      size: size,
      average: average,
      faster: faster,
      slower: slower
    }

    File.open(File.join(File.dirname(__FILE__), "reports/performance/plot/#{key}.csv"), 'w') do |file|
      file.write(%(Size,Average,Faster,Slower
#{size},#{average},#{faster},#{slower}))
      file.close
    end
  end

  File.open(File.join(File.dirname(__FILE__), 'reports/performance/performance_report.json'), 'w') do |file|
    file.write(JSON.pretty_generate(report))
    file.close
  end
  puts 'Api performance report finished!'
end

def json_merge(jsons)
  report = {}

  jsons.each do |json|
    report = report.merge(json) do |_key, val1, val2|
      next val1 unless val2
      next val2 unless val1

      val1 + val2
    end
  end

  report.sort.to_h
end

def features_path(**params)
  if params[:scenarios_paths]
    params[:scenarios_paths].split.map { |uri| feature_file_exist?(uri) }.compact.join(' ')
  elsif %w[bvt regression flaky failed].include?(params[:type])
    scenarios_path_by_quarantine(sut: params[:sut], type: params[:type], subsystem: 'api', tags: params[:tags])
  else
    'features/'
  end
end

def save_file_dry_run(total_scenarios, regression: false)
  filename = regression ? 'dry_run_regression' : 'dry_run'
  file_dr = File.new("#{filename}.txt", 'w+')
  file_dr.puts(total_scenarios)
  file_dr.close
end

def execute_dry_run(tags)
  execute_command "cucumber -p dry_run_report #{tags}".strip.squeeze(' ')
  JSON.parse(File.read(File.join(File.dirname(__FILE__), 'reports/features_report.json'), encoding: 'utf-8'))
end

def execute_command(command, exception: true)
  `bundle` unless File.exist?('Gemfile.lock')
  puts command
  system(command, exception: exception)
rescue StandardError => error
  raise 'Erro de execução no Bundler' if error.to_s.include? 'bundler: failed to load command: parallel_cucumber'
end

