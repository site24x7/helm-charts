{{/*
site24x7Agent Name
*/}}
{{- define "site24x7Agent.name" -}}
{{- include "site24x7.fullname" . }}-agent
{{- end }}

{{/*
site24x7Agent securityContext
*/}}
{{- define "site24x7Agent.securityContext" }}
{{- if .Values.site24x7Agent.applyNonRootSecurityContext }}
{{- include "site24x7.nonRootScc" . }}
{{- else if .Values.site24x7Agent.securityContext }}
{{ toYaml .Values.site24x7Agent.securityContext }}
{{- else }}
{{- include "site24x7.rootScc" . }}
{{- end }}
{{- end }}

{{/*
site24x7Agent labels
*/}}
{{- define "site24x7Agent.labels" -}}
{{ include "site24x7.labels" . }}
app.kubernetes.io/instance: {{ include "site24x7Agent.name" . }}
app.kubernetes.io/component: agent
app.kubernetes.io/version: 22.0.00
{{- end }}
