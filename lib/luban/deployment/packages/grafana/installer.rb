module Luban
  module Deployment
    module Packages
      class Grafana < Luban::Deployment::Package::Base
        class Installer < Luban::Deployment::Package::Installer
          define_executable 'grafana-cli'

          def package_iter; task.opts.iter; end
          def package_dist; task.opts.dist; end
          def package_full_name; "grafana-#{package_version}-#{package_iter}.#{package_dist}"; end

          def source_repo
            @source_repo ||= 'https://grafanarel.s3.amazonaws.com'
          end

          def source_url_root
            @source_url_root ||= "builds"
          end

          def installed?
            return false unless file?(grafana_cli_executable)
            pattern = Regexp.new(Regexp.escape("Grafana cli version #{package_version}"))
            match?("#{grafana_cli_executable} --version 2>&1", pattern)
          end

          def build_path
            @build_path ||= package_tmp_path.join("grafana-#{package_version}-#{package_iter}")
          end

          protected

          def build_package
            info "Building #{package_full_name}"
            within install_path do
              execute(:mv, build_path.join('*'), '.', ">> #{install_log_file_path} 2>&1")
            end
          end
        end
      end
    end
  end
end
