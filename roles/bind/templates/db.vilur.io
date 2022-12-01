;
$TTL 2d                 ; default TTL for zone
$ORIGIN {{ bind_domain }}.   ; base domain name
;
@       IN      SOA     rovilu-2.{{ bind_domain }}. hostmaster.{{ bind_domain }}. (
			            2		; serial number
			            604800	; refresh
			            86400	; update retry
			            2419200	; expiry
			            604800 	; minimum
			            )
;
{% for host in groups['dns_servers'] %}
                IN	NS  {{ host }}.{{ bind_domain }}.
{% endfor %}
{% for host in groups['dns_servers'] %}
{{ host	}}    IN	A   {{ hostvars[host]['ansible_default_ipv4']['address'] }}
{% endfor %}
;
