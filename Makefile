NAMESPACE ?= pihole
RELEASE ?= $(NAMESPACE)-workload
HELM_NAMESPACE ?= $(NAMESPACE)
HELM_RELEASE ?= $(RELEASE)

.PHONY: up
up:
	helm upgrade $(HELM_RELEASE) . \
		--create-namespace \
		--install \
		--namespace $(HELM_NAMESPACE) \
		--values custom.yaml

.PHONY: down
down:
	helm uninstall $(HELM_RELEASE) \
		--namespace $(HELM_NAMESPACE)
