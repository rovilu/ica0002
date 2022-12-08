#!/bin/bash

ss -ntl | grep -q ':{{ haproxy_agama_host_port }} '
