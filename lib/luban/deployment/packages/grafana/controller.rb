module Luban
  module Deployment
    module Packages
      class Grafana
        class Controller < Luban::Deployment::Service::Controller
          module Commands
            def self.included(base)
              base.define_executable 'grafana-server'
            end

            def process_pattern
              @process_pattern ||= "#{control_file_path}$"
            end

            def shell_setup
              @shell_setup ||= super << "cd #{install_path}"
            end

            def start_command
              @start_command ||= shell_command("#{grafana_server_executable} -pidfile #{pid_file_path} -config #{control_file_path}", output: nil) + ' &'
            end

            def stop_command
              @stop_command ||= shell_command("kill $(cat #{pid_file_path} 2>/dev/null)")
            end
          end

          include Paths
          include Commands
        end
      end
    end
  end
end
