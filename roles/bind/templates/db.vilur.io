$TTL	604800
{{ startup_name }}.	IN	SOA	rovilu-2.{{ startup_name }}. roman.{{ startup_name }}. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
{{ startup_name }}.   IN	NS	rovilu-1.
rovilu-1	    IN	A   {{ hostvars['rovilu-1']['ansible_default_ipv4']['address'] }}
rovilu-2	    IN	A   {{ hostvars['rovilu-2']['ansible_default_ipv4']['address'] }}
