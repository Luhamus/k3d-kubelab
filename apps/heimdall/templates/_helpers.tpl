{{- define "heimdall.name" -}}
{{- .Chart.Name }}
{{- end }}

{{- define "heimdall.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: {{ include "heimdall.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{/* Stable subset only — selector labels cannot change after first deploy. */}}

{{- define "heimdall.selectorLabels" -}}
app.kubernetes.io/name: {{ include "heimdall.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
