{{/* Windows resource names stay within the Kubernetes 63-character limit. */}}
{{- define "site24x7WindowsAgent.name" -}}
{{- printf "%s-windows-agent" (include "site24x7.fullname" . | trunc 49 | trimSuffix "-") -}}
{{- end }}

{{/* Keep Windows Pods outside the existing Linux DaemonSet's selector. */}}
{{- define "site24x7WindowsAgent.selectorLabels" -}}
app.kubernetes.io/name: {{ include "site24x7WindowsAgent.name" . }}
{{- end }}

{{- define "site24x7WindowsAgent.labels" -}}
helm.sh/chart: {{ include "site24x7.chart" . }}
{{ include "site24x7WindowsAgent.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ include "site24x7WindowsAgent.name" . }}
app.kubernetes.io/component: agent
app.kubernetes.io/version: {{ .Values.site24x7WindowsAgent.image.tag | quote }}
{{- end }}
