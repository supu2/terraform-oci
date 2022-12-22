FROM ghcr.io/oracle/oci-cli:latest
ARG terraform_version=1.3.6 azureCli_version=2.43.0
USER root
RUN yum install -y yum-utils \
    && yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo \
    && yum -y install terraform-${terraform_version} git \
    && yum -y clean all && rm -fr /var/cache 
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc \
    && yum install -y https://packages.microsoft.com/config/rhel/8/packages-microsoft-prod.rpm \
    && yum install -y azure-cli-${azureCli_version} \
    && yum -y clean all && rm -fr /var/cache 

USER oracle