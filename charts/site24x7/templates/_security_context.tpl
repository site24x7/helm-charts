{{- define "site24x7.nonRootScc" }}
capabilities:
  drop:
    - ALL
seccompProfile:
  type: RuntimeDefault
allowPrivilegeEscalation: false
readOnlyRootFilesystem: true
runAsNonRoot: true
runAsUser: 1001010001
{{- end }}

{{- define "site24x7.rootScc" }}
runAsUser: 0
readOnlyRootFilesystem: false
{{- end }}
