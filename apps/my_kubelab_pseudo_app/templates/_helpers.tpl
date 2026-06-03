{{- define "kubelab-app.name" -}}
{{- .Chart.Name }}
{{- end }}

{{- define "kubelab-app.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: {{ include "kubelab-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{/* Stable subset only — selector labels cannot change after first deploy. */}}

{{- define "kubelab_app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "kubelab-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
