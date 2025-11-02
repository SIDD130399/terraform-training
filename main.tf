# data "akamai_group" "my_group_id" {
#     group_name  = "SA Test PD 1"
#     contract_id = "ctr_1-1NC95D"
# }

# data "akamai_property" "my_property" {
#     name    = "sikhande.prlab.lol"
#     version = "7"
# }

# data "akamai_appsec_configuration" "my_sec_configuration" {
#     name = "WAF Security File"
# }



# resource "akamai_edge_hostname" "my_edge_hostname" {
#     product_id    = "prd_SPM"
#     contract_id   = "1-1NC95D"
#     group_id      = "19298"
#    edge_hostname  = "sikhandetftesting2.xyz.lol.edgekey.net"
#     ip_behavior   = "IPV4"
#     ttl           = 300
#     certificate   = null
#     timeouts {
#         default = "1h"
#     }
# }
