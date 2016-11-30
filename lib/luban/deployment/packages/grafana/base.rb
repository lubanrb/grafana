module Luban
  module Deployment
    module Packages
      class Grafana < Luban::Deployment::Service::Base
        module Paths
          def control_file_dir; @control_file_dir ||= "conf"; end

          def control_file_name
            @control_file_name ||= "#{service_name}.ini"
          end

          def data_path
            @data_path ||= shared_path.join('data')
          end

          def plugins_path
            @plugins_path ||= data_path.join('plugins')
          end
        end

        DefaultPort = 3000
        DefaultNetworkHost = `hostname -f`.chomp

        parameter :port, default: DefaultPort
        parameter :network_host, default: DefaultNetworkHost

        protected

        def setup_provision_tasks
          super
          provision_tasks[:install].option :iter, "Iteration"
          provision_tasks[:install].option :dist, "Binary distribution"
        end

        def include_default_templates_path
          default_templates_paths.unshift(base_templates_path(__FILE__))
        end
      end
    end
  end
end
