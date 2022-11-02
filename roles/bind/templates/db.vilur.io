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
                IN	NS	rovilu-2.{{ bind_domain }}.
rovilu-1	    IN	A   {{ hostvars['rovilu-1']['ansible_default_ipv4']['address'] }}
rovilu-2	    IN	A   {{ hostvars['rovilu-2']['ansible_default_ipv4']['address'] }}
backup          IN  A   {{ backup_host_ip }}
;
