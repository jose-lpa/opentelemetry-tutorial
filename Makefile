.EXPORT_ALL_VARIABLES:


OTEL_PYTHON_LOGGING_AUTO_INSTRUMENTATION_ENABLED?=true
DOCKER_BUILDKIT=1


install_dependencies:
		echo "Installing Python packages..."
		@pip install -r requirements.txt
		echo "Installing OpenTelemetry..."
		@opentelemetry-bootstrap -a install

run_app:
	@flask run -p 8080

run_app_instrumented:
		@opentelemetry-instrument --traces_exporter console --metrics_exporter console --logs_exporter console --service_name dice-server flask run -p 8080

run_collector:
	@docker run -p 4317:4317 --volume $$(pwd)/configs:/etc/otel otel/opentelemetry-collector:latest --config=/etc/otel/otel-collector.yaml

