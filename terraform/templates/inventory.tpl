[spark_master]
{{ master_ip }} ansible_user={{ var.ssh_user }}

[spark_workers]
%{ for w in workers ~}
{{ w.network_interface[0].access_config[0].nat_ip }} ansible_user={{ var.ssh_user }}
%{ endfor ~}

[spark_edge]
{{ edge_nodes.network_interface[0].access_config[0].nat_ip }} ansible_user={{ var.ssh_user }}
