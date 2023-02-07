{{/*
Expand the name of the chart.
*/}}
{{- define "wormhole.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "wormhole.fullname" -}}
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
{{- define "wormhole.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "wormhole.labels" -}}
helm.sh/chart: {{ include "wormhole.chart" . }}
{{ include "wormhole.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "wormhole.selectorLabels" -}}
app.kubernetes.io/name: {{ include "wormhole.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Match labels
*/}}
{{- define "wormhole.pvc" -}}
  {{- printf "%s-pvc" (include "wormhole.fullname" .) -}}
{{- end -}}

{{- define "wormhole.config" -}}
  {{- printf "%s-wormhole-config" (include "wormhole.fullname" .) -}}
{{- end -}}

{{- define "nginx.fullname" -}}
  {{- printf "%s-nginx" (include "wormhole.fullname" .) -}}
{{- end -}}

{{- define "nginx.config" -}}
  {{- printf "%s-nginx-config" (include "wormhole.fullname" .) -}}
{{- end -}}
