#    resource "akamai_cp_code" "my_cp_code" {
#    name        = "sikhande-tf-cpcode"
#    contract_id = "1-1NC95D"
#    group_id    = "19298"
#    product_id  = "prd_SPM"
#    timeouts {
#        update = "1h"
#    }
#    }

#    resource "akamai_edge_hostname" "my_edge_hostname" {
#    product_id    = "prd_SPM"
#    contract_id   = "1-1NC95D"
#    group_id      = "19298"
#   edge_hostname = "sikhandetftraining.prlab.lol.edgekey.net"
#    ip_behavior   = "IPV4"
#    ttl           = 300
#   certificate   = 254150
#    timeouts {
#        default = "1h"
#    }
#    }

// Your default rule information
data "akamai_property_rules_builder" "my_default_rule" {
  rules_v2023_01_05 {
    name      = "default"
    is_secure = false
    comments  = <<-EOT
      The behaviors in the default rule apply to all requests for the property hostnames unless another rule overrides these settings.
    EOT
    behavior {
      origin {
        origin_type                   = "CUSTOMER"
        hostname                      = "httpbin.org"
        forward_host_header           = "ORIGIN_HOSTNAME"
        cache_key_hostname            = "REQUEST_HOST_HEADER"
        compress                      = true
        enable_true_client_ip         = false
        http_port                     = 80
      }
    }
    behavior {
      cp_code {
        value {
          id   =  1895998
          name = "sikhande_tf_cpcode"
        }
      }
    }
    children = [
      data.akamai_property_rules_builder.compress_text_content.json
    ]
  }
}

// Your child rule information
data "akamai_property_rules_builder" "compress_text_content" {
  rules_v2023_01_05 {
    name = "Compress Text Content"
    behavior {
      gzip_response {
          behavior = "ALWAYS"
      }
    }
    criterion {
      content_type {
        match_operator      = "IS_ONE_OF"
        match_wildcard      = true
        match_case_sensitive = false
        values             = ["text/html*", "text/css*", "application/x-javascript*"]
      }
    }
  }
}


resource "akamai_property" "my_property" {
  name          = "sikhande_tf_property"
  product_id    = "prd_SPM"
  contract_id   = "1-1NC95D"
  group_id      = "19298"
  rule_format   = "v2024-10-21"
  version_notes = "Initial version created using TF"
  rules         = data.akamai_property_rules_builder.my_default_rule.json
  hostnames {
    cname_from             = "sikhandetftrain.prlab.lol"
    cname_to               = "sikhandetftraining.prlab.lol.edgekey.net"
    cert_provisioning_type = "DEFAULT"
  }
}