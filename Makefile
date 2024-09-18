.EXPORT_ALL_VARIABLES:


OTEL_PYTHON_LOGGING_AUTO_INSTRUMENTATION_ENABLED?=true


run_app:
		@flask run -p 8080

run_app_instrumented:
		@opentelemetry-instrument --traces_exporter console --metrics_exporter console --logs_exporter console --service_name dice-server flask run -p 8080
