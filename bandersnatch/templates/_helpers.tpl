{{/*
Expand the name of the chart.
*/}}
{{- define "bandersnatch.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "bandersnatch.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "bandersnatch.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "bandersnatch.labels" -}}
helm.sh/chart: {{ include "bandersnatch.chart" . }}
{{ include "bandersnatch.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "bandersnatch.selectorLabels" -}}
app.kubernetes.io/name: {{ include "bandersnatch.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Match labels
*/}}
{{- define "bandersnatch.pvc" -}}
  {{- printf "%s-pvc" (include "bandersnatch.fullname" .) -}}
{{- end -}}

{{- define "bandersnatch.config" -}}
  {{- printf "%s-bandersnatch-config" (include "bandersnatch.fullname" .) -}}
{{- end -}}

{{- define "banderctl.config" -}}
  {{- printf "%s-banderctl-config" (include "bandersnatch.fullname" .) -}}
{{- end -}}

{{- define "banderctl.fullname" -}}
  {{- printf "%s-banderctl" (include "bandersnatch.fullname" .) -}}
{{- end -}}

{{- define "bandersnatch.job" -}}
  {{- printf "%s-job" (include "bandersnatch.fullname" .) -}}
{{- end -}}

{{- define "nginx.fullname" -}}
  {{- printf "%s-nginx" (include "bandersnatch.fullname" .) -}}
{{- end -}}

{{- define "nginx.config" -}}
  {{- printf "%s-nginx-config" (include "bandersnatch.fullname" .) -}}
{{- end -}}
