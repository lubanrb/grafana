module Luban
  module Deployment
    module Packages
      class Grafana
        class Configurator < Luban::Deployment::Service::Configurator
          include Paths
          include Controller::Commands
        end
      end
    end
  end
end
