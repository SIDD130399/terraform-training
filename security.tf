resource "akamai_appsec_configuration" "sikhande_security_configuration" {
 name        = "sikhande_security_configuration"
 description = "This is sikhande's configuration."
 contract_id = "1-1NC95D"
 group_id    = "19298"
 host_names  = ["sikhande.prlab.lol"]
}

// Create new security policy with default settings
resource "akamai_appsec_security_policy" "sikhande_security_policy" {
  config_id              = akamai_appsec_configuration.sikhande_security_configuration.id
  default_settings       = true
  security_policy_name   = "my-policy"
  security_policy_prefix = "sid1"
}

// Create another security policy with default settings
resource "akamai_appsec_security_policy" "sikhande_security_policy_2" {
  config_id              = akamai_appsec_configuration.sikhande_security_configuration.id
  default_settings       = true
  security_policy_name   = "my-second-policy"
  security_policy_prefix = "sid2"
}