# Change log

## Version 0.2.0 (Nov 30, 2016)

Minor enhancements:
  * Setup appropriate paths for deployment of Grafana
  * Added parameters, #port and #network_host, for basic setup of Grafana
  * Added Controller and Configurator to manage Grafana deployment
  * Added related profile templates for Grafana
  * Bump up gem dependency of luban to version 0.10.10

Bug fixes:
  * Corrected parent class for Grafana
  * Corrected parent class for Grafana::Installer
  * Included Paths in Grafana::Installer
  * Handled linked directories properly
  * Cleaned up install path before installation

## Version 0.1.0 (Nov 25, 2016)

New features:
  * Initialized Luban deployemnt package of Grafana
