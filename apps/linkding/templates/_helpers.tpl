{{- define "linkding.name" -}}
{{- .Chart.Name }}
{{- end }}

{{- define "linkding.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: {{ include "linkding.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "linkding.selectorLabels" -}}
app.kubernetes.io/name: {{ include "linkding.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
