data "akamai_group" "my_group_id" {
    group_name  = "SA Test PD 1"
    contract_id = "ctr_1-1NC95D"
}

output "my_group_id" {
    value = data.akamai_group.my_group_id
}

data "akamai_property" "my_property" {
    name    = "sikhande.prlab.lol"
    version = "7"
}

output "my_property" {
    value = data.akamai_property.my_property
}

data "akamai_appsec_configuration" "my_sec_configuration" {
    name = "WAF Security File"
}

output "my_appsec_config" {
    value = data.akamai_appsec_configuration.my_sec_configuration
}
